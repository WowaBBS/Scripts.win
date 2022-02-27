@echo off
setlocal

set From=%~f1
set To=%~f2

if not exist "%From%" goto :Failed

mkdir "%To%"2>nul
rmdir /S /Q "%To%"2>nul

move /Y "%From%" "%To%" >nul
goto :Finish

:Failed
echo There is no %From%
goto :Finish

:Help
echo Using: Call MoveDir.bat ^"From^" ^"To^"
goto :Finish

:Finish
endlocal
