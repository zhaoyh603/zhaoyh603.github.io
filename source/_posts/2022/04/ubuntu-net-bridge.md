---
title: ubuntu22.04为kvm虚拟机设置网桥
typora-copy-images-to: ubuntu-net-bridge
typora-root-url: ubuntu-net-bridge
date: 2022-04-24 21:57:08
tags:
  - Ubuntu
category:
  - Linux
---



`cd /etc/netplan/`

找到`00-installer-config.yaml`或`01-netcfg.yaml`

原配置文件：

~~~yaml
# This is the network config written by 'subiquity'
network:
  ethernets:
    ens33:
      dhcp4: true
  version: 2


~~~

添加内容后：

~~~yaml
# This is the network config written by 'subiquity'
network:
  ethernets:
    ens33:
      dhcp4: true
  version: 2


  bridges:
    br0:
      interfaces: [ens33]
      dhcp4: yes
               
~~~

应用配置：

~~~bash
 netplan apply
~~~

这时会重置网络，如果是DHCP，IP会变，连不上，找到新的IP连接。

网络中会看到**br0** ：

![image-20220424224233396](image-20220424224233396.png)

虚拟机中网络设置：源为br0。

![image-20220424221055601](image-20220424221055601.png)
