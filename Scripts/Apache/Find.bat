@echo off

call "%~dp0_Env.bat"

if "%Current_Apache_Version%"=="%Apache_Version%" goto Skip

if not exist "%Apache_Exe%" call "%~dp0Download.bat"
if not exist "%Apache_Exe%" echo %Apache_Exe% not found

set Current_Apache_Version=%Apache_Version%

:Skip
