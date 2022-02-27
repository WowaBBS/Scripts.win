@echo off

call "%~dp0_Env.bat"

if "%Current_Php_Version%"=="%Php_Version%" goto Skip

if "%Php_Distrib%"=="" set Php_Distrib=%~dp0php
if "%Php_Configurator_Id%"=="" set Php_Configurator_Id=Def_0
if "%Php_Configurator%"=="" set Php_Configurator=%~dp0Configurator.php

if not exist "%Php_Path%/php.exe" if exist "%~dp0../_InitPhp.bat" call "%~dp0../_InitPhp.bat"
if not exist "%Php_Path%/php.exe" call "%~dp0Download.bat"
if not exist "%Php_Path%/php.exe" echo %Php_Path%/php.exe not found

if exist "%Php_Path%/Init_%Php_Configurator_Id%" goto SkipConfigure
setlocal

mkdir "%Php_Path%/Init_%Php_Configurator_Id%" 2>nul

set Arg=
set Arg=%Arg% -d "extension_dir=%Php_Path%/ext"
set Arg=%Arg% -c "%Php_Path%"
set Arg=%Arg% -f "%Php_Configurator%"

"%Php_Path%\php.exe" %Arg% -- %Args%

endlocal
:SkipConfigure

set Current_Php_Version=%Php_Version%
set Call_Php=call "%~dp0call_php.bat"

set Php_Arg=
set Php_Arg=%Php_Arg% -d memory_limit=%Php_Memory_Limit%
set Php_Arg=%Php_Arg% -d "extension_dir=%Php_Path%/ext"
set Php_Arg=%Php_Arg% -c "%Php_Path%"
set Php_Arg=%Php_Arg% -f 

set Php_Exec="%Php_Path%\php.exe" %Php_Arg%

:Skip
