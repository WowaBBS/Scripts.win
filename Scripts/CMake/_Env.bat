@echo off

call "%~dp0..\_Env.bat"

if "%CMake_Version%"=="" set CMake_Version=3.21.3
if "%CMake_Distrib%"=="" set CMake_Distrib=%Scripts_Distrib%\CMake
if "%CMake_Path_%"==""    set CMake_Path_=%CMake_Distrib%\V%CMake_Version:.=x%
if "%CMake_UnPack%"==""  set CMake_UnPack=%Scripts_UnPack%\CMake\V%CMake_Version:.=x%

set CMake_Bin=%CMake_Path_%\bin
set CMake_Exe=%CMake_Bin%\cmake.exe
set CMake_Test=%CMake_Exe%
set CMake_Exec=^"%CMake_Exe%^"

set CMAKE_PATH=%CMake_Path_%\
