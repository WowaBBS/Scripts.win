@echo off

call "%~dp0..\_Env.bat"

if "%PhpMyAdmin_Version%"=="" set PhpMyAdmin_Version=5.1.3
:: "%PhpMyAdmin_Lang%"==""    set PhpMyAdmin_Lang=all-languages
if "%PhpMyAdmin_Lang%"==""    set PhpMyAdmin_Lang=english
if "%PhpMyAdmin_Distrib%"=="" set PhpMyAdmin_Distrib=%Scripts_Distrib%\PhpMyAdmin
if "%PhpMyAdmin_Path%"==""    set PhpMyAdmin_Path=%PhpMyAdmin_Distrib%\V%PhpMyAdmin_Version:.=x%
if "%PhpMyAdmin_UnPack%"==""  set PhpMyAdmin_UnPack=%Scripts_UnPack%\PhpMyAdmin\V%PhpMyAdmin_Version:.=x%

set PhpMyAdmin_Test=%PhpMyAdmin_Path%\index.php
