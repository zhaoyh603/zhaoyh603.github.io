---
title: centos7 upgrade to centos8
typora-copy-images-to: centos7 upgrade to centos8
typora-root-url: centos7 upgrade to centos8
date: 2022-02-03 11:17:33
tags:
  - centos
  - Linux
category:
  - Linux
---



## 安装必要包

```
 yum install yum-utils epel-release -y
```

```
yum install rpmconf -y
```

## 升级

```
rpmconf -a
```

输出空 

```
package-cleanup --leaves
```

```
yum install dnf -y
```

清除

```
yum dnf -y remove yum yum-metadata-parser && rm -rf /etc/yum
```

```
wget http://mirrors.ustc.edu.cn/centos/8/BaseOS/x86_64/os/Packages/centos-gpg-keys-8-3.el8.noarch.rpm wget http://mirrors.ustc.edu.cn/centos/8/BaseOS/x86_64/os/Packages/centos-linux-release-8.5-1.2111.el8.noarch.rpm wget http://mirrors.ustc.edu.cn/centos/8/BaseOS/x86_64/os/Packages/centos-linux-repos-8-3.el8.noarch.rpm dnf install -y centos-gpg-keys-8-3.el8.noarch.rpm centos-linux-release-8.5-1.2111.el8.noarch.rpm centos-linux-repos-8-3.el8.noarch.rpm
```

```
dnf clean all
```

```
rpm -e --nodeps rpm -qa|grep -i kernel
```

```
rpm -e --nodeps sysvinit-tools
```

```
dnf -y --releasever=8 --allowerasing --setopt=deltarpm=false distro-sync 
```

按照需要xxx的包 

```
rpm -ivh --nodeps --force http://mirrors.ustc.edu.cn/centos/8/BaseOS/x86_64/os/Packages/dracut-network-049-191.git20210920.el8.x86_64.rpm 
```

```
rpm -ivh --nodeps --force http://mirrors.ustc.edu.cn/centos/8/AppStream/x86_64/os/Packages/flatpak-1.8.5-5.el8_5.x86_64.rpm
```

卸载事务检查错误的包

```
 rpm -e --nodeps man-pages-zh-CN-1.5.2-4.el7
```

再次运行 

```
dnf -y --releasever=8 --allowerasing --setopt=deltarpm=false distro-sync
```

```
cat /etc/redhat-release 
```

```
dnf clean all
```

## 安装内核

```
 dnf -y install kernel-core --best --allowerasing
```

```
dnf clean packages
```

```
dnf -y groupupdate "Core" "Minimal Install" --allowerasing

reboot
```

## 设置启动顺序

```
grub2-set-default 0
```
