@echo off

call "%~dp0Find.bat"

setlocal

set Php_File=%~1
shift

set Args=%1
:Parse
shift
set First=%1
if not defined First goto :EndParse
  set Args=%Args% %First%
  goto :Parse
:EndParse

%Php_Exec% "%Php_File%" -- %Args%

endlocal
