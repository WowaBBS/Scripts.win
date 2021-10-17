@echo off

set Python_Distrib=%~dp0Distrib\
set Python_Configurator_Cmd=%~dp0Configurator/Phyton.bat
call "%~dp0..\Scripts\Init.bat"
call "%Scripts_Path%\Python\Find.bat"

%Python_Exec% "%~dp0Test.py"
