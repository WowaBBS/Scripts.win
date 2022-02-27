@echo off

call "%~dp0_Env.bat"

if "%Current_PhpMyAdmin_Version%"=="%PhpMyAdmin_Version%" goto Skip

if not exist "%PhpMyAdmin_Test%" call "%~dp0Download.bat"
if not exist "%PhpMyAdmin_Test%" echo %PhpMyAdmin_Test% not found

set Current_PhpMyAdmin_Version=%PhpMyAdmin_Version%

:Skip
