# 1 引言
## 1.1 目的和范围
GitLab - 基于Git的项目管理软件，是一个用于仓库管理系统的开源项目。使用Git作为代码管理工具，并在此基础上搭建起来的web服务。

Git特点：   
1、Git每台电脑都有一个版本库，可以在本地做版本管理   
2、速度快，远超大部分的版本管理系统，包括SVN   
3、强大的分支管理功能   
4、活跃的开源社区，如最著名的github   
5、Git没有严格的权限管理控制，一般通过系统设置文件读写权限的方式来控制   
6、工作目录只能是整个项目，比如checkout、建分支都是基于整个项目   

和SVN区别：   
1、Git是分布式版本控制工具，可以不联网在本地提交代码，而SVN是集中式   
2、Git按元数据方式存储，而SVN是按文件存储   
3、Git分支可以用户单独使用，而SVN分支是共用的   
4、Git的内容完整性要优于SVN，使用的是SHA-1哈希算法，在遇到磁盘故障和网络故障时降低对版本库的破坏   
5、Git克隆一份全新的目录时比SVN要快的多   
6、Git提交文件时是先提交到本地仓库，然后推送到远程仓库，而SVN是直接提交到远程仓库，如果发现提交的代码有严重问题时，会比较麻烦   

## 1.2 文档约定


# 2 安装Git环境
## 2.1 服务器端
[参考文件](file/安装gitlab.docx)   
Ref: https://about.gitlab.com/install/

## 2.2 客户端

# 3 使用脚本
## 3.1 代码下载
```bash
git clone <ssh url> #克隆所有代码
git clone <ssh url> -b <branch or tag> #克隆指定分支或tag代码
git clone <ssh url> -b <branch or tag> --depth=1 #只克隆指定分支的最新代码
```

## 3.2 代码修改上传
```bash
git add .
git commit -m <message>
git push
```

## 3.3 代码合并
### 3.3.1 代码直接merge
```bash
git clone <仓库>
git checkout <分支a>
git merge <分支b>        
```
### 3.3.2 代码本地合并
```bash
# 这种方式可以有效减少commit次数
git stash save "save message"  # 执行存储时，添加备注，方便查找，只有git stash 也要可以的，但查找时不方便识别。
git stash list  #查看stash了哪些存储
git stash pop #命令恢复之前缓存的工作目录，将缓存堆栈中的对应stash删除，并将对应修改应用到当前的工作目录下,默认为第一个stash,即stash@{0}，如果要应用并删除其他stash，命令：git stash pop stash@{$num} ，比如应用并删除第二个：git stash pop stash@{1}
```

## 3.4 代码仓库备份迁移
```bash
# 1. 创建仓库的裸克隆。
git clone --bare https://github.com/exampleuser/old-repository.git 
# 2. 镜像推送至新仓库。
cd old-repository.git
git push --mirror https://github.com/exampleuser/new-repository.git
# 3. 删除步骤 1 中创建的临时本地仓库。
cd ..
rm -rf old-repository.git
```

## 3.x 配置设置
```bash
git config -l   #显示所有配置
git config --global http.postBuffer 52428000  #设置大缓存，解决大文件提交失败
```

# 4 参考
1. https://github.github.com/training-kit/downloads/zh_CN/github-git-cheat-sheet/