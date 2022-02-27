@echo off

call "%~dp0..\_Env.bat"

if "%Apache_Version%"=="" set Apache_Version=2.4.52
if "%Apache_Distrib%"=="" set Apache_Distrib=%Scripts_Distrib%\Apache
if "%Apache_Path%"==""    set Apache_Path=%Apache_Distrib%\V%Apache_Version:.=x%
if "%Apache_UnPack%"==""  set Apache_UnPack=%Scripts_UnPack%\Apache\V%Apache_Version:.=x%

for /F "tokens=1,2* delims=." %%i in ("%Apache_Version%") do set Apache_Version_A=%%i
for /F "tokens=1,2* delims=." %%i in ("%Apache_Version%") do set Apache_Version_B=%%j

set Apache_Version_AB=%Apache_Version_A%.%Apache_Version_B%

set Apache_Bin=%Apache_Path%\bin
set Apache_Exe=%Apache_Bin%\httpd.exe
set Apache_Exec=^"%Apache_Exe%^"
