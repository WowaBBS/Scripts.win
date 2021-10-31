@echo off
setlocal

set FileUrl=%~1
set OutFile=%~2

start "%Message%" /WAIT powershell.exe -nologo -noprofile -command "WGet -O %OutFile% %FileUrl%"

endlocal