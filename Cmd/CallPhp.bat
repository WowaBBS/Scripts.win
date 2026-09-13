@echo off
:: Config will set env 
if "%PHP_Path%" == "" echo PHP_Path is not defined for PHP85 &Exit
set Arg=
set Arg=%Arg% -d "extension_dir=%PHP_Path%/ext"
set Arg=%Arg% -c "%PHP_Path%"
%PHP_Path%\php.exe -q %Arg% -f "%~dp0Php/Call.php" -- %*
