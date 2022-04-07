---
title: nextcloud客户端设置
typora-copy-images-to: nextcloud-Client-setting
typora-root-url: nextcloud-Client-setting
date: 2022-04-07 11:28:46
tags:
    - nextcloud
category:
---

Macbook，原来将nextcloud同步文件夹的位置设置在了home目录中，wps选择时不方便，将目录移动到`文稿`中。

修改配置文件nextcloud.cfg

位置：`/Users/zhaoyh/Library/Preferences/Nextcloud/nextcloud.cfg`

```
[General]
clientVersion=3.4.4git (build 9585)
confirmExternalStorage=false
crashReporter=true
monoIcons=true
newBigFolderSizeLimit=500
optionalServerNotifications=true
showExperimentalOptions=true
updateChannel=stable
updateSegment=90
useNewBigFolderSizeLimit=false

[Accounts]
0\Folders\1\ignoreHiddenFiles=false
0\Folders\1\journalPath=.sync_0e03fe2b262e.db
0\Folders\1\localPath=/Users/用户/Documents/Nextcloud
0\Folders\1\paused=false
0\Folders\1\targetPath=/
0\Folders\1\version=2
0\Folders\1\virtualFilesMode=off
0\Folders\2\ignoreHiddenFiles=false
0\Folders\2\journalPath=.sync_613999d9af8f.db
0\Folders\2\localPath=/Users/用户/Desktop/
0\Folders\2\paused=false
0\Folders\2\targetPath=/macbook_desktop
0\Folders\2\version=2
0\Folders\2\virtualFilesMode=off

````