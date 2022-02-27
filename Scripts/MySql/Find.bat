@echo off

call "%~dp0_Env.bat"

if "%Current_MySql_Version%"=="%MySql_Version%" goto Skip

if not exist "%MySql_Test%" call "%~dp0Download.bat"
if not exist "%MySql_Test%" echo %MySql_Test% not found

set Current_MySql_Version=%MySql_Version%

:Skip
