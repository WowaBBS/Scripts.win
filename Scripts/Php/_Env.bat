
call ",,\_Env.bat"
if "%Php_Distrib%"=="" set Php_Distrib=%Scripts_Distrib%
if "%Php_Version%"=="" set Php_Version=8.0.11
if "%Php_Memory_Limit%"=="" set Php_Memory_Limit=512M
::if "%Php_Ver_Nts%"=="" set Php_Ver_Nts=-nts
set Php_Ver_Nts=
set Php_Path=%Php_Distrib%Php/V%Php_Version:.=x%%Php_Ver_Nts%
