@echo off

call "%~dp0_Init.bat"

set Python_Version=3.9.0
set Python_Configurator_Id=Test_1
set Python_Configurator_Id=.
set Python_Configurator_Cmd=%~dp0Configurator/Phyton.bat
call "%Scripts_Path%\Python\Find.bat"

%Python_Exec% "%~dp0Test.py"
