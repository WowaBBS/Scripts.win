@echo off
setlocal

call %~dp0_Env.bat

mkdir "%Python_Distrib%Downloads\" 2>nul

set Python_Store_Url=https://www.python.org/ftp/python

call %~dp0_Download.bat releases/archives
if exist "%Python_File_Zip%" goto skip

::call %~dp0_Download.bat releases
::if exist "%Python_File_Zip%" goto skip
::
::call %~dp0_Download.bat qa RC5
::if exist "%Python_File_Zip%" goto skip
::
::call %~dp0_Download.bat qa RC4
::if exist "%Python_File_Zip%" goto skip
::
::call %~dp0_Download.bat qa RC3
::if exist "%Python_File_Zip%" goto skip
::
::call %~dp0_Download.bat qa RC2
::if exist "%Python_File_Zip%" goto skip
::
::call %~dp0_Download.bat qa RC1
::if exist "%Python_File_Zip%" goto skip

:skip
call %~dp0../File/UnZip.bat "%Python_File_Zip%" "%Python_Path%"
::del "%Python_File_Zip%" 2>nul

endlocal