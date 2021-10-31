@echo off
setlocal

call "%~dp0_Env.bat"

set CMake_Store_Url=https://github.com/Kitware/CMake/releases/download

call "%~dp0_Download.bat"
if exist "%CMake_File_Zip%" goto skip

:skip
call "%~dp0../File/UnZip.bat" "%CMake_File_Zip%" "%CMake_Path%"
::del "%CMake_File_Zip%" 2>nul

endlocal