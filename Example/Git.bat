@echo off

call "%~dp0_Init.bat"
call "%Scripts_Path%\Git\Find.bat"

%Git_Exec% --version
