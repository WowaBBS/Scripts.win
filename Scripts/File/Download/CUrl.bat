@echo off

set FileUrl=%~1
set OutFile=%~2

call "%~dp0../../File/Find.bat" curl.exe CUrl_Path
echo CUrl_Path=%CUrl_Path%

if "%CUrl_Path%"=="" goto End

:: TODO Bag with Kaspersky, use:
::   --insecure
::   --ssl-no-revoke
"%CUrl_Path%" "%FileUrl%" -o "%OutFile%" --ssl-no-revoke
