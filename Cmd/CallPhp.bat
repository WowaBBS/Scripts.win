@echo off
:: Config will set env 

::for /f "tokens=4" %%a in ('chcp') do set "WLIB_LOG_ENCODE=%%a"
if "%WLIB_LOG_ENCODE%" == "" set WLIB_LOG_ENCODE=cp1251

if "%PHP_Path%" == "" echo PHP_Path is not defined for PHP85 &Exit
set Arg=
set Arg=%Arg% -d "extension_dir=%PHP_Path%/ext"
set Arg=%Arg% -c "%PHP_Path%"
%PHP_Path%\php.exe -q %Arg% -f "%~dp0Php/Call.php" -- %*
