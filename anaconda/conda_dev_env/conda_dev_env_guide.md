# 1 引言
## 1.1 目的和范围
汇总anaconda中环境配置及各种IDE使用方法。

## 1.2 文档约定


# 2 conda配置环境
```bash
conda create --name xupeng36 python=3.6 #安装新环境，
#conda create --name 环境名称 python=版本号
source activate xupeng36                #activate this environment
source deactivate                       #deactivate an active environment
```




# 3 jupyter-notebook配置
在jupyter-notebook中调用新建的python环境：
```bash
conda install ipykernel   #安装ipykernel
source activate xupeng36  #激活对应的conda环境
python -m ipykernel install --user --name xupeng36 --display-name "Python36"
#将环境写入notebook的kernel中（python -m ipykernel install --user --name 环境名称 --display-name "Python (环境名称)"）
jupyter notebook          #然后打开notebook
```
浏览器打开对应地址，新建python，就会有对应的环境提示了
