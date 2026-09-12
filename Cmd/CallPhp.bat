@echo off
:: Config will set env 
if "%PHP_Path%" == "" set PHP_Path=C:\SRV\Script\PHP\V8x4
set Arg=
set Arg=%Arg% -d "extension_dir=%PHP_Path%/ext"
set Arg=%Arg% -c "%PHP_Path%"
%PHP_Path%\php.exe -q %Arg% -f "%~dp0CallPhp.php" -- %*
