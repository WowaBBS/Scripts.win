@echo off

call "%~dp0_Init.bat"
call "%Scripts_Path%\Svn\Find.bat"

echo Svn version:
%Svn_Exec% --version --quiet
