@echo off

call "%~dp0,,\_Env.bat"
if "%CMake_Distrib%"=="" set CMake_Distrib=%Scripts_Distrib%
if "%CMake_Version%"=="" set CMake_Version=3.21.3

set CMake_Path=%CMake_Distrib%CMake\V%CMake_Version:.=x%
set CMake_Exe=%CMake_Path%\cmake-%CMake_Version%-win64-x64\bin\cmake.exe
set CMake_Exec=^"%CMake_Exe%^"

set CMAKE_PATH=%CMake_Path%\cmake-%CMake_Version%-win64-x64\
