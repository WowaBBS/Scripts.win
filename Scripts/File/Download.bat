@echo off
setlocal

set FileUrl=%~1
set OutFile=%~2

call %~dp0Download/WGet.bat "%FileUrl%" "%OutFile%"

if exist "%OutFile%" goto :Finish

call %~dp0Download/BitsAdmin.bat "%FileUrl%" "%OutFile%"

:Finish

endlocal