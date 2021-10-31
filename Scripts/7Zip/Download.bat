@echo off
setlocal

call "%~dp0_Env.bat"

set SZip_Store_Url=https://www.7-zip.org/a/

call "%~dp0_Download.bat"
if exist "%SZip_File_Zip%" goto skip

:skip
msiexec /a "%SZip_File_Zip%" TARGETDIR="%SZip_Path%" /qn

::del "%SZip_File_Zip%" 2>nul

endlocal