@echo off

call "%~dp0_Init.bat"
call "%Scripts_Path%\Svn\Find.bat"

%Svn_Exec% help
