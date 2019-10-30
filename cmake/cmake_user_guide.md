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