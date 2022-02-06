---
title: 使用Vercel发布mkdocs文档
typora-copy-images-to: deploy-mkdocs-with-Vercel
typora-root-url: deploy-mkdocs-with-Vercel
date: 2022-02-06 22:40:07
tags:
  - mkdocs
  - Vercel
category:
  - blog
---

## 前言

注册了Vercel账号并与GitHub关联

## 项目要求

1.使用pip freeze >requirements.txt 生成依赖文件提交到仓库

`pip freeze >requirements.txt`

## Vercel项目设置

1. 新建项目关联仓库

![新建项目设置](image-20220206224907928.png)

2. 设置项目信息

![发布mkdocs的必要设置](image-20220206225057716.png)

## 发布

GitHub提交代码测试或手动重新发布。

在项目的Deployments页签中。

![image-20220206225400649](image-20220206225400649.png)

可以看到发布的日志

![image-20220206225451090](image-20220206225451090.png)

source中可以看到发布的静态文件

![image-20220206225532959](image-20220206225532959.png)
