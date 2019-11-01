# 1 引言
## 1.1 目的和范围
汇总cmake使用方法。
1. CMakeList文件不区分大小写；

## 1.2 文档约定



# 2 cmake语法

## 2.1 查找文件

### 2.1.1 配置findpackage

1. Prefix模式：
```bash
list(APPEND CMAKE_PREFIX_PATH ${CONAN_LIB_DIRS_ITK}/cmake/ITK-4.13)

FIND_PACKAGE(ITK REQUIRED)
if(ITK_FOUND)
    message(STATUS "ITK found!")
else(ITK_FOUND)
    message(WARNING "ITK not found")
endif(ITK_FOUND)
```

2. Module模式：
```bash
list(APPEND CMAKE_MODULE_PATH ${CONAN_OPENMESH_ROOT}/cmake)
find_package(OpenMesh MODULE REQUIRED)
```

### 2.1.2 查找lib
1. 查找文件并重命名模式：   
在CMakeList.txt文件中添加如下信息，即可查找文件"libgrpc.so"，并将其重命名为“GRPC_LIB”。   
```bash
FIND_LIBRARY(GRPC_LIB grpc ${CONAN_LIB_DIRS_GRPC})
message(STATUS "grpc lib path:" ${GRPC_LIB})
if(NOT GRPC_LIB)
	message(FATAL_ERROR "not find the grpc lib" )
endif(NOT GRPC_LIB)    
```

2. 直接link模式：   
```bash
link_directories(${CONAN_LIB_DIRS})

FILE(GLOB SOURCE_FILES "*.cpp")
add_executable(alpha-acl-thread-aneurysm ${SOURCE_FILES})
target_link_libraries(alpha-acl-thread-aneurysm boost_system-gcc-mt-x64-1_66)
#上述最后一句话，会在${CONAN_LIB_DIRS}文件夹下找“libboost_system-gcc-mt-x64-1_66.so”文件
```

## 2.2 生成文件
### 2.2.1 生成版本信息文件
configure_file: 将一份文件拷贝到另一个位置并修改它的内容
```bash
configure_file(<input> <output>
               [COPYONLY] [ESCAPE_QUOTES] [@ONLY]
               [NEWLINE_STYLE [UNIX|DOS|WIN32|LF|CRLF] ])
#复制一个<input>文件到一个<output>文件和替代变量值作为引用@VAR@或${VAR}在输入文件内容。每个变量引用将替换为变量的当前值，如果未定义变量，则替换为空字符串。
```

举例：   
在目录 demo/configure_file_version，执行update.sh，会生成相应的version.h文件，可以被其他文件直接include。   

备注：[官方文件](https://cmake.org/cmake/help/v3.2/command/configure_file.html)

### 2.2.2 生成export_header
对于windows系统，生成动态库.dll文件的时候，需要导出对应的.lib用于link。cmake提供了自动化生成导出的宏定义文件。   

```bash
generate_export_header(PipelinePulmonary3D EXPORT_FILE_NAME ${CMAKE_CURRENT_SOURCE_DIR}/inc/PipelinePulmonary3D_export.h)
#在CMakeList.txt文件中添加上面这一行，即可生成PipelinePulmonary2D_export.h文件，提供“PIPELINEPULMONARY3D_EXPORT”宏，用于导出
```

备注：[官方文件](https://cmake.org/cmake/help/v3.0/module/GenerateExportHeader.html)

## 2.3 配置Install

1. 添加cpake功能
```bash
include (CPack) #全局添加一次
```

2. install 库文件或可执行文件
```bash
#将可执行文件install到bin目录
#将动态库文件install到lib目录
#将静态库文件install到libstatic目录
INSTALL(TARGETS PipelinePulmonaryHalf
                PipelinePulmonaryHalfApt
				PipelinePulmonaryHalfTest
				PipelinePulmonaryHalfSaveTest
				PipelinePulmonary3D
				PipelinePulmonary3DFactory
				PipelinePulmonaryTest
				PipelinePulmonaryTestAll
       RUNTIME DESTINATION bin
       LIBRARY DESTINATION lib
       ARCHIVE DESTINATION libstatic)
```

3. install 头文件
```bash
#将制定的.h文件install到include目录
install (FILES ${CMAKE_CURRENT_SOURCE_DIR}/inc/PipelinePulmonary3DFactory.h
               ${CMAKE_CURRENT_SOURCE_DIR}/inc/PipelinePulmonary3DFactory_export.h
			   ${CMAKE_CURRENT_SOURCE_DIR}/inc/PipelinePulmonary3DFactory.h
			   ${CMAKE_CURRENT_SOURCE_DIR}/inc/IFPipelinePulmonaryOut.h
			   ${CMAKE_CURRENT_SOURCE_DIR}/inc/IFPipelinePulmonaryIn.h
			   DESTINATION include)
```

4. install 任意文件
```bash
#将当前文件夹下任意cfg结尾的文件install到config目录下
file(GLOB CONFIGURATIONFILE ${CMAKE_CURRENT_SOURCE_DIR}/*.cfg)
install (FILES ${CONFIGURATIONFILE} DESTINATION config)
```

# 3 cmake执行

```bash
# 创建build文件
if [ ! -d "./build" ]; then
mkdir build
fi
# cmake指定release版本，和install路径
cd ./build
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/opt/alpha ..
# 8进程编译
make -j 8
# 安装编译后的所有文件
make install
```