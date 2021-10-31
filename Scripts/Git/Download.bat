@echo off
setlocal

call "%~dp0_Env.bat"

set Git_Store_Url=https://github.com/git-for-windows/git/releases/download

call "%~dp0_Download.bat"
if exist "%Git_File_Zip%" goto skip

:skip
call "%~dp0../File/UnZip.bat" "%Git_File_Zip%" "%Git_Path%"
::del "%Git_File_Zip%" 2>nul

endlocal