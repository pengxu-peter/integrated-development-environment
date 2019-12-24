# 1 引言
## 1.1 目的和范围


## 1.2 文档约定


# 2 具体步骤

## 2.1 启动jupyter-notebook
```bash
cd ~
jupyter-notebook --generate-config
#会在根目录下生成.jupyter文件夹
vim .jupyter/jupyter_notebook_config.py
#在最末尾添加以下代码
c.NotebookApp.ip='0.0.0.0'
c.NotebookApp.password = u'sha1:b3da55935a15:0e5ddaddb305b62d36b77dca9a01b0a4544804cb'
c.NotebookApp.open_browser = False
c.NotebookApp.port = 10801
#分别对应 允许所有ip登录，登录端口号为10801，不自动打开浏览器和登录密码，其中"password"，也就是要输的密码，由以下方式产生
python
#进入python
from notebook.auth import passwd
passwd()
#然后输入你想要的密码，并确认，之后屏幕上会打印出一串sha开头的字符串，连引号一起copy到上面"password"对应的位置，保存退出
cd ~
nohup jupyter-notebook &
#浏览器打开以下地址即可开启notebook
<ip_address>:<port>
```

## 2.2 配置不同conda环境下的启动
```bash
# 1. 安装ipykernel
conda install ipykernel

# 2. 首先激活对应的conda环境
source activate <conda 环境名称>
# 例如：
source activate xupeng36

# 3. 将环境写入notebook的kernel中
python -m ipykernel install --user --name <环境名称> --display-name <notebook显示名称>
# 例如：
python -m ipykernel install --user --name xupeng36 --display-name "Python36"

# 4. 然后打开notebook
jupyter notebook

# 5. 浏览器打开对应地址，新建python，就会有对应的环境提示了

```
参考：   
1. https://blog.csdn.net/u011606714/article/details/77741324
2. https://stackoverflow.com/questions/37085665/in-which-conda-environment-is-jupyter-executing
