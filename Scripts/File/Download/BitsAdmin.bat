@echo off
setlocal

set FileUrl=%~1
set OutFile=%~2
set Message=Loading %FileUrl%

start "%Message%" /WAIT bitsadmin.exe /transfer "%Message%" "%FileUrl%" "%OutFile%"

endlocal