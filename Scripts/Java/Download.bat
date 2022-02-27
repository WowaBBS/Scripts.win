@echo off
setlocal

call "%~dp0_Env.bat"

set Java_Store_Url=https://download.oracle.com/java

call "%~dp0_Download.bat"

endlocal