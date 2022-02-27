@echo off
setlocal

set ZipFile=%~f1
set OutDir=%~f2

if not exist "%ZipFile%" goto :Failed

rmdir /S /Q "%OutDir%" 2>nul
mkdir "%OutDir%" 2>nul

msiexec /a "%ZipFile%" TARGETDIR="%OutDir%" /qn
goto :Finish

:Failed
echo There is no %ZipFile%
goto :Finish

:Help
echo Using: Call UnMsi.bat ^"MsiFile^" ^"OutDir^"
goto :Finish

:Finish
endlocal
