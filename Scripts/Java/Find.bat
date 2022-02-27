@echo off

call "%~dp0_Env.bat"

if "%Current_Java_Version%"=="%Java_Version%" goto Skip

if not exist "%Java_Test%" call "%~dp0Download.bat"
if not exist "%Java_Test%" echo %Java_Test% not found

set Current_Java_Version=%Java_Version%

:Skip
