@echo off

call "%~dp0_Init.bat"
set Php_Configurator_Id=Test_1
set Php_Configurator=%~dp0Configurator/Init.php
call "%Scripts_Path%\Php\Find.bat"

%Php_Exec% "%~dp0Test.php" -- Arg1
