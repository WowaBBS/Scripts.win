@echo off

call ",,\_Env.bat"
if "%Git_Distrib%"=="" set Git_Distrib=%Scripts_Distrib%
if "%Git_Version%"=="" set Git_Version=2.33.1
for /F "tokens=1,2,3* delims=." %%i in ("%Git_Version%") do set Git_Version_A=%%i
for /F "tokens=1,2,3* delims=." %%i in ("%Git_Version%") do set Git_Version_B=%%j
for /F "tokens=1,2,3* delims=." %%i in ("%Git_Version%") do set Git_Version_C=%%k
for /F "tokens=1,2,3* delims=." %%i in ("%Git_Version%") do set Git_Version_D=%%l

set Git_Version_ABC=%Git_Version_A%.%Git_Version_B%.%Git_Version_C%

set Git_Path=%Git_Distrib%Git\V%Git_Version:.=x%
set Git_Exe=%Git_Path%\cmd\git.exe
set Git_Exec=^"%Git_Exe%^"
