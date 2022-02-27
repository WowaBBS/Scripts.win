@echo off

call "%~dp0_Init.bat"
call "%Scripts_Path%\MySql\Find.bat"

"%MySql_Bin%/mysql.exe" --version
"%MySql_Exe%"  --version
