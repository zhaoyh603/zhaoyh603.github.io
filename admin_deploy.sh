#!/bin/bash
git add .
git commit -m $1
git push origin main 
echo "发布完成！"