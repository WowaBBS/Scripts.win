@echo off

call "%~dp0..\_Env.bat"

if "%SZip_Version%"==""   set SZip_Version=19.00
if "%SZip_Distrib%"==""   set SZip_Distrib=%Scripts_Distrib%\7Zip
if "%SZip_Path%"==""      set SZip_Path=%SZip_Distrib%\V%SZip_Version:.=x%
if "%SZip_UnPack%"==""    set SZip_UnPack=%Scripts_UnPack%\7Zip\V%SZip_Version:.=x%

set SZip_Bin=%SZip_Path%
set SZip_Exe=%SZip_Bin%\7z.exe
set SZip_Exec=^"%SZip_Exe%^"
