@echo off

call "%~dp0_Env.bat"

if "%Current_SZip_Version%"=="%SZip_Version%" goto Skip

if not exist "%SZip_Exe%" call "%~dp0Download.bat"
if not exist "%SZip_Exe%" echo %SZip_Exe% not found

set Current_SZip_Version=%SZip_Version%

:Skip
