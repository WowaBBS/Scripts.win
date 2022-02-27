
if "%CMake_Version_D%"==""  set CMake_Version_D=1
:: "%CMake_Version_D%"=="0" set CMake_Version_D=1

set CMake_Store_Url=https://github.com/Kitware/CMake/releases/download
::t CMake_Name_Zip=PortableCMake-%CMake_Version%-64-bit.7z.exe
::t CMake_Name_Zip=cmake-%CMake_Version%-win64-x64.zip
set CMake_Name_Zip=cmake-%CMake_Version%-windows-x86_64.zip
set CMake_File_Zip=%Scripts_Downloads%\%CMake_Name_Zip%
set CMake_Url=%CMake_Store_Url%/v%CMake_Version%/%CMake_Name_Zip%
set CMake_SubDir=\cmake-%CMake_Version%-windows-x86_64

call "%~dp0../File/Download.bat" "%CMake_Url%" "%CMake_File_Zip%" "Zip" "%CMake_UnPack%" "%CMake_UnPack%%CMake_SubDir%" "%CMake_Path_%"
