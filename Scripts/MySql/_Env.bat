@echo off

call "%~dp0..\_Env.bat"

if "%MySql_Version%"=="" set MySql_Version=8.0.28
if "%MySql_Distrib%"=="" set MySql_Distrib=%Scripts_Distrib%\MySql
if "%MySql_Path%"==""    set MySql_Path=%MySql_Distrib%\V%MySql_Version:.=x%
if "%MySql_UnPack%"==""  set MySql_UnPack=%Scripts_UnPack%\MySql\V%MySql_Version:.=x%
if "%MySql_OS_Type%"=="" set MySql_OS_Type=winx64

for /F "tokens=1,2* delims=." %%i in ("%MySql_Version%") do set MySql_Version_A=%%i
for /F "tokens=1,2* delims=." %%i in ("%MySql_Version%") do set MySql_Version_B=%%j

set MySql_Version_AB=%MySql_Version_A%.%MySql_Version_B%

set MySql_Bin=%MySql_Path%\bin
set MySql_Exe=%MySql_Bin%\MySql.exe
set MySql_Test=%MySql_Exe%
set MySql_Exec=^"%MySql_Exe%^"
