@echo off

call "%~dp0..\_Env.bat"

:: "%Java_Version%"=="" set Java_Version=17
if "%Java_Version%"=="" set Java_Version=17.0.1
if "%Java_Distrib%"=="" set Java_Distrib=%Scripts_Distrib%\Java
if "%Java_Path%"==""    set Java_Path=%Java_Distrib%\V%Java_Version:.=x%
if "%Java_UnPack%"==""  set Java_UnPack=%Scripts_UnPack%\Java\V%Java_Version:.=x%

for /F "tokens=1,2* delims=." %%i in ("%Java_Version%") do set Java_Version_A=%%i
for /F "tokens=1,2* delims=." %%i in ("%Java_Version%") do set Java_Version_B=%%j

set Java_Exe=%Java_Path%bin\java.exe
set JAVA_HOME=%Java_Path%
set Java_Test=%Java_Exe%
set Java_Exec=^"%Java_Exe%^"
