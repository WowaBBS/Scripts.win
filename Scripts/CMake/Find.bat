@echo off

call "%~dp0_Env.bat"

::****************************************************************
goto SkipToDo

set ERRORLEVEL=
call "%~dp0../File/Find.bat" cmake.exe
if "%ERRORLEVEL%"=="0" goto Skip

::TODO: Remove CMake_Dir
if exist "%CMake_Dir%\bin\cmake.exe" set CMAKE_PATH=%CMake_Dir%\bin

:SkipToDo
::****************************************************************

if "%Current_CMake_Version%"=="%CMake_Version%" goto Skip

if not exist "%CMake_Test%" call "%~dp0Download.bat"
if not exist "%CMake_Test%" echo %CMake_Test% not found

set Current_CMake_Version=%CMake_Version%

:Skip
