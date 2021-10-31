@echo off

call "%~dp0Find.bat"

setlocal

set Lib_Url=https://bootstrap.pypa.io/get-pip.py
set Lib_File=%Scripts_Downloads%\get-pip.py

if exist "%Lib_File%" goto :Skip

call "%~dp0../File/Download.bat" "%Lib_Url%" "%Lib_File%"
%Python_Exec% "%Lib_File%"

:Skip

endlocal
