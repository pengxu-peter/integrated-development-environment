# 1 引言
## 1.1 目的和范围
汇总cmake使用方法。

## 1.2 文档约定



# 2 cmake语法

## 2.1 配置findpackage

Prefix模式：
```bash
list(APPEND CMAKE_PREFIX_PATH ${CONAN_LIB_DIRS_ITK}/cmake/ITK-4.13)

FIND_PACKAGE(ITK REQUIRED)
if(ITK_FOUND)
    message(STATUS "ITK found!")
else(ITK_FOUND)
    message(WARNING "ITK not found")
endif(ITK_FOUND)
```

Module模式：
```bash
list(APPEND CMAKE_MODULE_PATH ${CONAN_OPENMESH_ROOT}/cmake)
find_package(OpenMesh MODULE REQUIRED)
```

## 2.2 配置Install

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
