@echo off
setlocal

set FileUrl=%~1
set OutFile=%~f2

set UnPack=%~3
set UnPackTo=%~4

set MoveFrom=%~5
set MoveTo=%~6

::TODO: If removing required
del "%OutFile%" 2>nul

echo Loading %FileUrl%...

if exist "%OutFile%" goto :Loaded
:: Don't work with 7Zip CMake Git
::call "%~dp0Download/CUrl.bat" "%FileUrl%" "%OutFile%"
::exit /b
if exist "%OutFile%" goto :Loaded

call "%~dp0Download/WGet.bat" "%FileUrl%" "%OutFile%"
if exist "%OutFile%" goto :Loaded

call "%~dp0Download/BitsAdmin.bat" "%FileUrl%" "%OutFile%"

if exist "%OutFile%" goto :Loaded
echo [Error] There is no "%OutFile%"
goto Finish

:Loaded

if "%UnPack%"=="" goto :Finish
call "%~dp0Un%UnPack%.bat" "%OutFile%" "%UnPackTo%"

if not exist "%UnPackTo%" echo [Error] Can`t unpack to "%UnPackTo%"
if not exist "%UnPackTo%" goto :Finish

if "%MoveFrom%"=="" goto :Finish

if not exist "%MoveFrom%" echo [Error] Can`t move from "%MoveFrom%"
if not exist "%MoveFrom%" goto :Finish

call "%~dp0MoveDir.bat" "%MoveFrom%" "%MoveTo%"

if not exist "%MoveTo%" echo [Error] Hasn`t moved from "%MoveFrom%" to "%MoveTo%"
if not exist "%MoveTo%" goto :Finish

:Finish

endlocal