@echo off
setlocal

call "%~dp0_Env.bat"

set Svn_Store_Url=https://deac-ams.dl.sourceforge.net/project/win32svn/

call "%~dp0_Download.bat"
if exist "%Svn_File_Zip%" goto skip

:skip
msiexec /a "%Svn_File_Zip%" TARGETDIR="%Svn_Path%" /qn
::del "%Svn_File_Zip%" 2>nul

endlocal