@echo off
setlocal

set ERRORLEVEL=
call %~dp0../File/Find.bat cmake.exe
if "%ERRORLEVEL%"=="0" goto Found

set CMake_Dir=%~dp0../../../.Build/Tools/CMake

if exist "%CMake_Dir%\bin\cmake.exe" set CMAKE_PATH=%CMake_Dir%\bin

if "%CMAKE_PATH%"=="" call :DownloadCMake
if "%CMAKE_PATH%"=="" goto NotFound
set PATH=%CMAKE_PATH%;%PATH%
goto Found

:DownloadCMake
set CMake_Zip=%~dp0CMake.zip
set CMake_Tmp=%~dp0CMake
set CMake_Version=3.15.2
set CMake_Url=https://github.com/Kitware/CMake/releases/download/v%CMake_Version%/cmake-%CMake_Version%-win64-x64.zip

call "%~dp0../File/Download.bat" "%CMake_Url%" "%CMake_Zip%"
call "%~dp0../File/UnZip.bat" "%CMake_Zip%" "%CMake_Tmp%"
RmDir "%CMake_Dir%" 2>nul
move "%CMake_Tmp%/cmake-3.15.2-win64-x64" "%CMake_Dir%" 2>nul
RmDir "%CMake_Tmp%" 2>nul
del "%CMake_Zip%" 2>nul

if exist "%CMake_Dir%\bin\cmake.exe" set CMAKE_PATH=%CMake_Dir%\bin

exit /b

:Found
call :WhereFound cmake.exe
goto End

:NotFound
echo CMake not found
goto End

:WhereFound
echo CMake found at %~$PATH:1
exit /b

:End
endlocal