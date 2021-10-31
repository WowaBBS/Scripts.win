@echo off

call ",,\_Env.bat"

if "%SZip_Distrib%"==""   set SZip_Distrib=%Scripts_Distrib%
if "%SZip_Version%"==""   set SZip_Version=19.00

set SZip_Path=%SZip_Distrib%7Zip\V%SZip_Version:.=x%
set SZip_Exe=%SZip_Path%\Files\7-Zip\7z.exe
set SZip_Exec=^"%SZip_Exe%^"
