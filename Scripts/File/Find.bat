@echo off

if "%~$PATH:1"=="" goto NotFound
if not "%2"=="" Set %2=%~$PATH:1

::echo %~1 found

exit /b
:NotFound

::echo %~1 not found

exit /b 1
