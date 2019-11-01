cmake_minimum_required(VERSION 3.8)
project(ALPHA)
################################################################################
# Version information
################################################################################
set(VERSION_INFO_MAJOR  0)
set(VERSION_INFO_MINOR  1)
set(VERSION_INFO_PATCH  0)

configure_file(
    ${CMAKE_CURRENT_SOURCE_DIR}/version.h.in
    ${CMAKE_CURRENT_BINARY_DIR}/version.h
    @ONLY
)
