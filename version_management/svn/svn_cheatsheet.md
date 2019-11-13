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
sudo svn checkout https://172.16.5.192/svn/Model_control/wrj/trt_gpu_models

# 查看当前svn目录状态
svn stat
svn status

# 在svn系统中添加文件或目录
svn add <文件或目录>

# 在svn体系中删除文件或目录
svn delete <文件或目录>

# 在svn体系中修改文件或目录
svn update <文件或目录>

# 上传
svn commit                     # 直接在弹出的窗口写tag并完成上传
svn commit -m "message to add" #直接在命令行完成tag编写

# 切换版本
svn update              # 将当前svn目录同步到最新的版本
svn update -r <version> # 将当前svn目录同步到指定的版本

# 查看当前版本信息
svn info

# 查看所有版本
svn log

```