@echo off

call "%~dp0_Env.bat"

if "%Current_Svn_Version%"=="%Svn_Version%" goto Skip

if not exist "%Svn_Exe%" call "%~dp0Download.bat"
if not exist "%Svn_Exe%" echo %Svn_Exe% not found

set Current_Svn_Version=%Svn_Version%

:Skip
