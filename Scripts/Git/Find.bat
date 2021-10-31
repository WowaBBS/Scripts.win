@echo off

call "%~dp0_Env.bat"

if "%Current_Git_Version%"=="%Git_Version%" goto Skip

if not exist "%Git_Exe%" call "%~dp0Download.bat"
if not exist "%Git_Exe%" echo %Git_Exe% not found

set Current_Git_Version=%Git_Version%

:Skip
