@echo off

call "%~dp0_Init.bat"
call "%Scripts_Path%\Apache\Find.bat"

"%Apache_Bin%/httpd.exe" -v
"%Apache_Exe%"  -V
