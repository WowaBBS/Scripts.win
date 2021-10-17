@echo off

call %~dp0_Env.bat

if "%Current_Python_Version%"=="%Python_Version%" goto Skip

if "%Python_Configurator_Id%"=="" set Python_Configurator_Id=Def_0
if "%Python_Configurator_Py%"=="" set Python_Configurator_Py=%~dp0Configurator.Py
if "%Python_Configurator_Cmd%"=="" set Python_Configurator_Cmd=%~dp0Configurator.bat

set Python_Exe=%Python_Path%/Python.exe
set Python_Exec=^"%Python_Exe%^"

if not exist "%Python_Exe%" if exist "%~dp0../../_InitPython.bat" call "%~dp0../../_InitPython.bat"
if not exist "%Python_Exe%" call "%~dp0Download.bat"
if not exist "%Python_Exe%" echo %Python_Exe% not found

set Current_Python_Version=%Python_Version%

if exist "%Python_Path%/Init_%Python_Configurator_Id%" goto SkipConfigure
setlocal

mkdir "%Python_Path%/Init_%Python_Configurator_Id%" 2>nul
path %PATH%;%Python_Path%
path %PATH%;%Python_Path%\Scripts
path %PATH%;%Python_Path%\Lib
::path %PATH%;%Python_Path%\Lib\site-packages
path %PATH%;%~dp0
path
if not exist "%Python_Configurator_Py%" goto SkipConfigurePy

%Python_Exec% "%Python_Configurator_Py%"

:SkipConfigurePy

if not exist "%Python_Configurator_Cmd%" goto SkipConfigureCmd

call "%Python_Configurator_Cmd%"

:SkipConfigureCmd

endlocal
:SkipConfigure

::set Call_Python=call "%~dp0call_Python.bat"

:Skip
