@echo off

call "%~dp0Find.bat"

setlocal

set Lib_Url=https://bootstrap.pypa.io/get-pip.py
set Lib_File=%Python_Distrib%Downloads\get-pip.py

call "%~dp0../File/Download.bat" "%Lib_Url%" "%Lib_File%"
%Python_Exec% "%Lib_File%"

endlocal
