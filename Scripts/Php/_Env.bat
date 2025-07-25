
call "%~dp0..\_Env.bat"

if "%Php_Version%"=="" set Php_Version=8.4.10
:: "%Php_Ver_Nts%"=="" set Php_Ver_Nts=-nts
if "%Php_Ver_Nts%"=="" set Php_Ver_Nts=
if "%Php_Distrib%"=="" set Php_Distrib=%Scripts_Distrib%\Php
if "%Php_Path%"==""    set Php_Path=%Php_Distrib%\V%Php_Version:.=x%%Php_Ver_Nts%
if "%Php_UnPack%"==""  set Php_UnPack=%Scripts_UnPack%\Php\V%Php_Version:.=x%%Php_Ver_Nts%

if "%Php_Memory_Limit%"=="" set Php_Memory_Limit=512M
