---
title: 设置ZeroTier与物理网卡间路由访问内部网络服务
typora-copy-images-to: ZeroTier-router
typora-root-url: ZeroTier-router
date: 2022-11-22 22:52:51
tags: ZeroTier
category: 其他
---



加入到ZeroTier网络后，能够做到ZeroTier network 中各主机间的互访，如果内网中有相关服务，无需全部加入到ZeroTier网络，可设置ZeroTier network中某台主机作为到内网的**“路由器”**，访问内网中的其他主机的服务。

# 前提及环境信息

- 使用zeroteir服务或已部署私有zeroteir-planet服务；
- ZeroTier中设置了 network；
- 内网中已安装ZeroTier并已加入到对应 network的 Linux 主机（该主机作为“路由器”）；
- 假设网络配置信息情况如下。

| 类别                         | 配置项                 | 配置值           | 简称        |
| ---------------------------- | ---------------------- | ---------------- | ----------- |
| **ZeroTier服务信息**         | ZeroTier的Network ID   | d5e04297a19bbd70 | $NETWORK_ID |
| **ZeroTier服务信息**         | ZeroTier的子网设置     | 10.120.100.0/24  |             |
| **内网网络环境信息**         | 内网的物理网络设置     | 192.168.1.0/24   | $PHY_SUB    |
| **作为“路由器”的Linux 主机** | ZeroTier 接口名称      | zt7nnig26        | $ZT_IFACE   |
| **作为“路由器”的Linux 主机** | 物理接口名称           | ens160           | $PHY_IFACE  |
| **作为“路由器”的Linux 主机** | ZeroTier接口的 IP 地址 | 10.120.100.1     | $ZT_ADDR    |

# 设置方法

## Linux主机中查询ZeroTier网络情况

```
sudo zerotier-cli listnetworks
```

输出 network、接口名称、ip 地址等信息，示例如下：

````
200 listnetworks <nwid> <name> <mac> <status> <type> <dev> <ZT assigned ips>
200 listnetworks d5e04297a19bbd70 company 2e:33:9e:c6:c2:31 OK PUBLIC zt7nnig26 10.120.100.1/24
````

## ZeroTier管理端设置路由及网关



| 目的地                     | 网关                     |
| -------------------------- | ------------------------ |
| $PHY_SUB（192.168.1.0/23） | $ZT_ADDR（10.120.100.1） |

> 将目标路由配置为略**大于**实际物理子网，此处为 /23 而不是 /24。

前台配置如图所示：

![image-20221122下午115709511](image-20221122下午115709511.png)

## Linux主机中设置路由表

### 配置启用 IP 转发

这可能因 Linux 发行版而异，通常：

编辑 **/etc/sysctl.conf** 文件注释掉 **net.ipv4.ip_forward** ，若无此项，需添加。

如果想要立即生效，执行如下命令：

```
sudo sysctl -w net.ipv4.ip_forward=1
```

### 配置 iptables

设置如下环境变量：

```
#物理接口
PHY_IFACE=ens160 
#ZeroTier接口
ZT_IFACE=zt7nnig26
```

iptables中添加路由。

```
sudo iptables -t nat -A POSTROUTING -o $PHY_IFACE -j MASQUERADE
sudo iptables -A FORWARD -i $PHY_IFACE -o $ZT_IFACE -m state --state RELATED,ESTABLISHED -j ACCEPT
sudo iptables -A FORWARD -i $ZT_IFACE -o $PHY_IFACE -j ACCEPT
```

保存iptables规则，以便下次重启继续生效。

```
sudo apt install iptables-persistent
sudo -i 
bash -c iptables-save > /etc/iptables/rules.v4
```

# 测试

1. 关闭手机 WiFi 使用移动流量
2. 加入到d5e04297a19bbd70网络
3. 访问内网中的主机服务



# 参考

> 翻译自：[Route+between+ZeroTier+and+Physical+Networks](https://zerotier.atlassian.net/wiki/spaces/SD/pages/224395274/Route+between+ZeroTier+and+Physical+Networks)
>
> 安装参考：[https://www.mrdoc.fun/doc/443/](https://www.mrdoc.fun/doc/443/)
