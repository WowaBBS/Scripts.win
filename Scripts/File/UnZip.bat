@echo off
setlocal

set ZipFile=%~f1
set OutDir=%~f2

if "%ZipFile%"=="" goto :Help
if "%OutDir%"=="" goto :Help

if not exist "%ZipFile%" goto :Failed

rmdir /S /Q "%OutDir%" 2>nul
mkdir "%OutDir%" 2>nul

powershell.exe -nologo -noprofile -command "& { $shell = New-Object -COM Shell.Application; $target = $shell.NameSpace('%OutDir%'); $zip = $shell.NameSpace('%ZipFile%'); $target.CopyHere($zip.Items(), 16); }"
goto :Finish

:Failed
echo There is no %ZipFile%
goto :Finish

:Help
echo Using: Call UnZip.bat ^"ZipFile^" ^"OutDir^"
goto :Finish

:Finish
endlocal
