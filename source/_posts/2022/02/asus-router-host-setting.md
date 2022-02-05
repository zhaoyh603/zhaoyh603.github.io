---
title: 华硕路由器设置自定义host
typora-copy-images-to: asus-router-host-setting
typora-root-url: asus-router-host-setting
date: 2022-02-04 00:28:42
tags:
  - 华硕
  - host
category:
  - 路由器

---

## 背景

华硕路进入ssh后添加host配置后，重启后会失效。

## 第一步：安装必要包

1. 插U盘，格式化
2. 安装 dnsmasq（貌似默认就有）

2. 前台开启下载大师。

## 第二步：设置启动内容

cd /opt/etc/init.d/

实际路径在U盘中。

新建：S60addhost文件，注意前面的顺序S60一定大于dnsmasq的设置。

 编辑S60addhost的内容。

 格式：dnsmasq --address=//  如：

`dnsmasq --address=/xxx.com/192.168.1.3`

 多条可顺序增加。



## 第三步：设置自动重启添加

切换目录。

`cd /opt/lib/ipkg/info`

 新建文件：addhost.control

 编辑文件内容：

`Enabled: yes`



## 第四步：重启路由器生效

  `reboot`
