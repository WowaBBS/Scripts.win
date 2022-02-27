@echo off

call "%~dp0_Init.bat"
call "%Scripts_Path%\CMake\Find.bat"

%CMake_Exec% --version
