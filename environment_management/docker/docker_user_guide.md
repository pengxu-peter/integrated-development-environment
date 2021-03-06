# 1 引言
## 1.1 目的和范围
汇总docker的安装及使用方法。

## 1.2 文档约定



# 2 docker相关程序离线下载安装
## 2.1 docker安装

推荐直接[官方下载](https://download.docker.com/)安装程序：

```bash
# 1. 下载程序：如果是ubuntu系统，可以直接执行
wget https://download.docker.com/linux/ubuntu/dists/bionic/pool/stable/amd64/docker-ce_18.06.1~ce~3-0~ubuntu_amd64.deb
# 2. 安装
sudo dpkg -i docker-ce_18.06.1~ce~3-0~ubuntu_amd64.deb
# 3. 验证是否安装成功
docker -v	                 # 查看版本
sudo docker run hello-world  # hello-world测试
```

## 2.2 docker-compose安装

推荐直接[官方下载](https://github.com/docker/compose/releases/)安装

```bash
# 1. 下载并安装程序
curl -L https://github.com/docker/compose/releases/download/1.25.0-rc2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
# 2. 验证是否安装成功
docker-compose -v  # 查看版本信息
```

## 2.3 nvidia-docker安装

NVIDIA提供[官方安装](https://github.com/NVIDIA/nvidia-docker/releases)流程，并没有找到直接下载安装的方案，所以这里直接将相关安装包放在这里，下面为安装流程：

```bash
sudo dpkg -i libnvidia-container1_1.0.0~rc.2-1_amd64.deb
sudo dpkg -i libnvidia-container-tools_1.0.0~rc.2-1_amd64.deb
sudo dpkg -i nvidia-container-runtime-hook_1.4.0-1_amd64.deb
sudo dpkg -i nvidia-container-runtime_2.0.0+docker18.06.1-1_amd64.deb
sudo dpkg -i nvidia-docker2_2.0.3+docker18.06.1-1_all.deb
```

成功安装后，理论上，打开文件'/etc/docker/daemon.json'，会出现以下配置信息：
```bash
"runtimes": {
    "nvidia": {
      "path": "/usr/bin/nvidia-container-runtime",
      "runtimeArgs": []
    }
  }
```

## 2.4 在线安装

```bash
# 参考“Ubuntu 18.04安装Docker CE及NVIDIA Container Toolkit步骤”：
https://www.linuxidc.com/Linux/2019-07/159613.htm
```

# 3 docker环境设置

## 3.1 配置执行docker权限
```bash
# 将xupeng用户添加到docker组，执行docker命令将无需添加sudo
sudo usermod  -a -G docker xuepng
```

## 3.2 修改docker的系统配置

### 3.2.1 查看系统配置
```bash
docker info
```
<p align="center">
    <img src="imgs/docker1.png" height = "400" >
</p>

### 3.2.2 修改docker加载路径Docker root dir
```bash
# 1 停掉Docker服务
service docker stop #或者 systemctl restart docker

################## 方法1：修改配置文件 ###################
# 2.1 打开配置文件
sudo vim /etc/docker/daemon.json
# 2.2 增加一行信息，将默认位置修改为/opt/docker-data
"data-root": "/opt/docker-data",

################## 方法2：配置软链信息 ###################
# [2.1] 保险起见，可以提前备份：
tar -zcC /var/lib/docker >/mnt/var_lib_docker-backup-$(date + %s).tar.gz
# 2.2 迁移整个/var/lib/docker目录到目的路径
sudo mv /var/lib/docker /home/data/docker
# 2.3 建立symlink软链接
sudo ln -s /home/data/docker /var/lib/docker

# 3 重新启动docker
sudo systemctl restart docker #或者sudo systemctl daemon-reload
```

### 3.2.3 添加国内镜像

对于使用systemd的系统(Ubuntu 16.04+、Debian 8+、CentOS 7+)，可以创建`/etc/docker/daemon.json`文件，并写入如下内容：

```bash
{
  "registry-mirrors": [
    "https://dockerhub.azk8s.cn",
    "https://docker.mirrors.ustc.edu.cn",
    "https://registry.docker-cn.com"
  ]
}
```

然后重新启动Docker服务

```bash
$ sudo systemctl daemon-reload
$ sudo systemctl restart docker
```

# 4 docker常用命令

```bash
# 查看当前加载的镜像和容器
docker images
docker ps -a

# 导入导出镜像
docker save -o image.tar proxima/tf_serving_cpu:v2.01
docker load -i image.tar
# gzip压缩导入导出
docker save <myimage>:<tag> | gzip > <myimage>_<tag>.tar.gz
gunzip -c <myimage>_<tag>.tar.gz | docker load

# 删除镜像
docker rmi proxima/tf_serving_cpu:v2.01

# 启动容器
docker run --name python_alg_wangyaqi -d -e "LANG=C.UTF-8" -p 80:80 -v /data/wangyaqi:/data/service -v /data/wangyaqi2:/data/code python_alg:0.5 
docker-compose -f serving_starter.yml up -d
docker-compose -f serving_starter.yml down

# 进入容器
docker exec -it bedeac6bf61e bash

# 将容器保存为一个新的镜像
docker commit -m '注释' 容器CONTAINER ID 镜像名称:镜像版本
docker commit 23c18d958279 bigdata:v0.2

# 查看容器日志
docker logs -f bedeac6bf61e

# 停止容器
docker stop python_alg_wangyaqi && docker rm python_alg_wangyaqi

# 统计所有docker image 和 container
docker system df

# 清楚所有无效 image 和 container
docker system prune
```

- 容器交互

<p align="center">
    <img src="imgs/docker2.png" height = "120" >
</p>


# 5 DockerFile

示例：
```bash
#目录“demo/dockerfile_cpp”, “demo/dockerfile_python”.
bash build.sh
docker-compose up -d
```

# 6 相关参考资料
- [利用容器技术打造AI公司技术中台](https://edu.csdn.net/course/detail/27072?utm_source=new1)
- [胃肠癌AI病理辅助诊断系统的方法与落地](https://edu.csdn.net/huiyiCourse/detail/1111?utm_source=new1)