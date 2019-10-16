# 1 引言
## 1.1 目的和范围

## 1.2 文档约定


# 2 安装Git环境
## 2.1 服务器端

## 2.2 客户端

# 3 使用脚本

```bash

# 下载svn代码
sudo svn checkout https://172.16.5.192/svn/Model_control/wrj/gpu_models
sudo svn -r 80 checkout https://172.16.5.192/svn/Model_control/wrj/gpu_models

# 修改上传流程
svn add <文件夹或文件路径>
svn commit <写tag并完成上传>
svn update

# 查看当前信息
svn info

# 查看所有版本
svn log

```