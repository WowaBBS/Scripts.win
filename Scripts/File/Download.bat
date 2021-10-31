@echo off
setlocal

set FileUrl=%~1
set OutFile=%~2

::TODO: If removing required
del "%OutFile%" 2>nul

echo Loading %FileUrl%...

if exist "%OutFile%" goto :Finish
:: Don't work with 7Zip CMake Git
::call "%~dp0Download/CUrl.bat" "%FileUrl%" "%OutFile%"
::exit /b
if exist "%OutFile%" goto :Finish

call "%~dp0Download/WGet.bat" "%FileUrl%" "%OutFile%"

if exist "%OutFile%" goto :Finish

call "%~dp0Download/BitsAdmin.bat" "%FileUrl%" "%OutFile%"

:Finish

endlocal