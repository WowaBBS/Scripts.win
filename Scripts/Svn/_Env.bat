@echo off

call ",,\_Env.bat"
if "%Svn_Distrib%"=="" set Svn_Distrib=%Scripts_Distrib%
if "%Svn_Version%"=="" set Svn_Version=1.8.17

set Svn_Path=%Svn_Distrib%Svn\V%Svn_Version:.=x%
set Svn_Exe=%Svn_Path%\PFiles\Subversion\bin\svn.exe
set Svn_Exec=^"%Svn_Exe%^"
