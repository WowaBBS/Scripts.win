@echo off

call "%~dp0..\_Env.bat"

::if "%Python_Version%"=="" set Python_Version=2.7.18
::if "%Python_Version%"=="" set Python_Version=3.9.0
if "%Python_Version%"=="" set Python_Version=3.9.6
if "%Python_Distrib%"=="" set Python_Distrib=%Scripts_Distrib%\Python
if "%Python_Path%"==""    set Python_Path=%Python_Distrib%\V%Python_Version:.=x%
:: "%Python_UnPack%"==""  set Python_UnPack=%Scripts_UnPack%\Python\V%Python_Version:.=x%
if "%Python_Type%"==""    set Python_Type=embed
if "%Python_CPU%"==""     set Python_CPU=amd64

set Python_Bin=%Python_Path%
set Python_Exe=%Python_Bin%\Python.exe
set Python_Exec=^"%Python_Exe%^"

set PYTHONPATH=%Python_Path%;%Python_Path%\Lib\site-packages
set PATH=%PATH%;%Python_Path%
set PYTHONHOME=%Python_Path%\Lib\site-packages

for /F "tokens=1,2* delims=." %%i in ("%Python_Version%") do set Python_Version_Major=%%i
for /F "tokens=1,2* delims=." %%i in ("%Python_Version%") do set Python_Version_Minor=%%j
::echo Python_Version       =%Python_Version%;
::echo Python_Version_Major =%Python_Version_Major%;
::echo Python_Version_Minor =%Python_Version_Minor%;

:: root directory for bytecode cache (pyc) files.
:: set PYTHONPYCACHEPREFIX=
