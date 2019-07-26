# 1 引言
## 1.1 目的和范围
汇总各种python第三方库的安装方法。

## 1.2 文档约定


# 2 具体方案

## 2.1 在线easy_install安装
使用easy_install，例如安装pip库
```bash
easy_install pip
```

## 2.2 在线pip安装 
使用pip安装spyder库的方法：
```bash
pip install spyder                                    #直接安装spyder库
pip install spyder --proxy=172.16.17.164:3128         #使用代理下载spyder库
pip install -i https://pypi.tuna.tsinghua.edu.cn/simple spyder #使用国内镜像下载spyder库
#常用国内代理：
https://pypi.tuna.tsinghua.edu.cn/simple          #清华
http://mirrors.aliyun.com/pypi/simple/            #阿里云    
https://pypi.mirrors.ustc.edu.cn/simple/          #中国科技大学
http://pypi.hustunique.com/                       #华中科技大学
http://pypi.sdutlinux.org/                        #山东理工大学 
http://pypi.douban.com/simple/                    #豆瓣
```
当然，更简单的做法是建立一个 pip.ini 文件，让 pip 每次安装的时候，使用这个文件内的配置。windows 下这个文件一般是不存在的，需要自己建立。 文件存放的位置如下：
```bash
On Unix the default configuration file is: $HOME/.config/pip/pip.conf which respects the XDG_CONFIG_HOME environment variable.
On macOS the configuration file is $HOME/Library/Application Support/pip/pip.conf.
On Windows the configuration file is %APPDATA%\pip\pip.ini.
```
pip.ini 里面的内容如下：
```bash
[global]
index-url = http://pypi.douban.com/simple
[install]
trusted-host=pypi.douban.com
```
pip批量导出与导入：
```bash
pip freeze > requirements.txt
pip install -r requirement.txt
```

## 2.3 在线conda安装
和pip相似，安装anaconda后可以使用
```bash
conda install spyder   
```
TUNA 还提供了 Anaconda 仓库的镜像，运行以下命令
```bash
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free/
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main/
conda config --set show_channel_urls yes
```



## 2.4 离线whl文件安装
安装下载的XXXX.whl文件（需要先安装wheel，执行pip install wheel）,在该文件目录下cmd执行
```bash
pip install XXXX.whl
```
常见文件库：http://www.lfd.uci.edu/~gohlke/pythonlibs/

## 2.5 离线python install
安装下载的XXXX.zip,解压后,如果文件目录下有install.py或setup.py文件，在该文件目录下cmd执行
```bash
python install.py install
python setup.py install
```
一般会生成一个.egg压缩文件，直接用于python程序调用

## 2.6 离线可执行文件安装
安装下载的XXXX.exe文件，直接双击打开
