@echo off
setlocal

call "%~dp0_Env.bat"

set Python_Store_Url=https://www.python.org/ftp/python

call "%~dp0_Download.bat"
if exist "%Python_File_Zip%" goto skip

:skip
call "%~dp0../File/UnZip.bat" "%Python_File_Zip%" "%Python_Path%"
echo import site>>%Python_Path%\python%Python_Version_Major%%Python_Version_Minor%._pth
::del "%Python_File_Zip%" 2>nul

endlocal