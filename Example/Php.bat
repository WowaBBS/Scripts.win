@echo off

set Php_Distrib=%~dp0.Distrib\
set Php_Configurator_Id=Test_1
set Php_Configurator=%~dp0Configurator/Init.php
call "%~dp0..\Scripts\Init.bat"
call "%Scripts_Path%\Php\Find.bat"

%Php_Exec% "%~dp0Test.php" -- Arg1
