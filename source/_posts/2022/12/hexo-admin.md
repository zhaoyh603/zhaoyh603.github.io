title: hexo-admin插件
author: zhaoyh603
tags:
  - hexo
categories:
  - blog
date: 2022-12-01 20:42:00
---
hexo-admin是一个可直接在网页中编辑 hexo 文章插件


# deploy功能

调用本地脚本，可接收页面中的message作为参数


![upload successful](/images/pasted-1.png)

`deployCommand`参数中的脚本中可使用`%1`接收参数，多个参数用空格分隔，如果只有一个参数，输入框中不能有空格。


```bash
#!/bin/bash
git add .
git commit -m $1
git push origin main 
echo "发布完成！"

```




# 修改 Post路径

新建 post 后可在 Markdown 编辑页面中修改路径，如下图所示：


![upload successful](/images/pasted-2.png)

修改后保存到指定位置，如下图所示：

![upload successful](/images/pasted-3.png)

*ps:有个 bug，有点时候会导致服务断掉。*