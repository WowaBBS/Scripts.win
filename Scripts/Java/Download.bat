@echo off
setlocal

call "%~dp0_Env.bat"

set Java_Store_Url=https://download.oracle.com/java

call "%~dp0_Download.bat"
if exist "%Java_File_Zip%" goto skip

:skip
call "%~dp0../File/UnZip.bat" "%Java_File_Zip%" "%Java_Path%"
::del "%Java_File_Zip%" 2>nul

endlocal