@echo off

call ",,\_Env.bat"
if "%Java_Distrib%"=="" set Java_Distrib=%Scripts_Distrib%
if "%Java_Version%"=="" set Java_Version=17.0.1
:: "%Java_Version%"=="" set Java_Version=17
for /F "tokens=1,2* delims=." %%i in ("%Java_Version%") do set Java_Version_A=%%i
for /F "tokens=1,2* delims=." %%i in ("%Java_Version%") do set Java_Version_B=%%j

set Java_Version_ABC=%Java_Version_A%.%Java_Version_B%.%Java_Version_C%

set Java_Path=%Java_Distrib%Java\V%Java_Version:.=x%
set Java_Exe=%Java_Path%\jdk-%Java_Version%\bin\java.exe
set JAVA_HOME=%Java_Path%\jdk-%Java_Version%
set Java_Exec=^"%Java_Exe%^"
