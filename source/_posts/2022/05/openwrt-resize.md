---
title: openwrt overlay 增加空间
typora-copy-images-to: openwrt-resize
typora-root-url: openwrt-resize
date: 2022-05-14 22:17:19
tags:
  - openwrt
category:
  - 路由器
---

转载自： https://www.techkoala.top/openwrt_resize/

## 什么是 overlay

`OpenWRT` 一般使用的文件系统是 `SquashFS` ，这个文件系统的特点就是：**只读**。

一个只读的文件系统要怎么做到保存设置和安装软件的呢？这里就是使用 `/overlay` 的分区，`overlay` 顾名思义就是覆盖在上面一层的意思。虽然原来的文件不能修改，但把修改的部分放在 `overlay` 分区上，然后映射到原来的位置，读取的时候就可以读到修改过的文件了。

为什么要用这么复杂的方法呢？ `OpenWRT` 当然也可以使用 `EXT4` 文件系统，但使用 `SquashFS + overlay` 的方式有一定的优点。

- `SquashFS` 是经过压缩的，在路由器这种小型 `ROM` 的设备可以放下更多的东西。
- `OpenWRT` 的恢复出厂设置也要依赖于这个方式。在你重置的时候，它只需要把 `overlay` 分区清空就可以了，一切都回到了刚刷进去的样子。

如果是 `EXT4` 文件系统，就只能够备份每个修改的文件，在恢复出厂设置的时候复制回来，十分复杂。

当然，`SquashFS + overlay` 也有它的缺点：

- 修改文件的时候会占用更多的空间。首先你不能够删除文件，因为删除文件实际上是在 `overlay` 分区中写入一个删除的标识，反而占用更多的空间。
- 另外在修改文件的时候相当于增加了一份文件的副本，占用了双份的空间。

![img](overlay.webp)

## 创建新分区

首先，需要创建一个新的分区，这里使用的是 `fdisk`

```bash
fdisk -l
fdisk /dev/vda
# 建立分区 vda3

#格式化
mkfs.ext4 /dev/sda3

#挂载分区
mkdir /mnt/vda3
mount /dev/vda3 /mnt/vda3
```

## Web 界面配置修改

进入 `OpenWRT` Web 界面的`挂载点`对配置进行修改

![image-20220514下午102441736](image-20220514下午102441736.png)

选择新增的分区点击编辑：

![image-20220514下午102615382](image-20220514下午102615382.png)

设置挂载点为/overlay

重启生效

