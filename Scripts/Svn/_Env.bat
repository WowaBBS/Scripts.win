@echo off

call "%~dp0..\_Env.bat"

if "%Svn_Version%"=="" set Svn_Version=1.8.17
if "%Svn_Distrib%"=="" set Svn_Distrib=%Scripts_Distrib%\Svn
if "%Svn_Path%"==""    set Svn_Path=%Svn_Distrib%\V%Svn_Version:.=x%
if "%Svn_UnPack%"==""  set Svn_UnPack=%Scripts_UnPack%\Svn\V%Svn_Version:.=x%

set Svn_Bin=%Svn_Path%\bin
set Svn_Exe=%Svn_Bin%\svn.exe
set Svn_Exec=^"%Svn_Exe%^"
set Svn_Test=%Svn_Exe%
