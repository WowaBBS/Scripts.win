
::t CMake_Name_Zip=PortableCMake-%CMake_Version%-64-bit.7z.exe
if "%CMake_Version_D%"==""  set CMake_Version_D=1
::if "%CMake_Version_D%"=="0" set CMake_Version_D=1

::t CMake_Name_Zip=cmake-%CMake_Version%-win64-x64.zip
set CMake_Name_Zip=cmake-%CMake_Version%-windows-x86_64.zip
set CMake_File_Zip=%Scripts_Downloads%\%CMake_Name_Zip%
set CMake_Url=%CMake_Store_Url%/v%CMake_Version%/%CMake_Name_Zip%


call "%~dp0../File/Download.bat" "%CMake_Url%" "%CMake_File_Zip%"
