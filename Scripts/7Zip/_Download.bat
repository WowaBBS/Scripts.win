
for /F "tokens=1,2* delims=." %%i in ("%SZip_Version%") do set SZip_Version_Name=%%i%%j
::TODO
set SZip_Type=-x64

set SZip_Name_Zip=7z%SZip_Version_Name%%SZip_Type%.msi
set SZip_File_Zip=%Scripts_Downloads%\%SZip_Name_Zip%
set SZip_Url=%SZip_Store_Url%/%SZip_Name_Zip%

call "%~dp0../File/Download.bat" "%SZip_Url%" "%SZip_File_Zip%"
