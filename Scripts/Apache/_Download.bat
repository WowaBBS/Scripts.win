
if "%Apache_Compiler%"=="" set Apache_Compiler=VS16
if "%Apache_OS_Type%"==""  set Apache_OS_Type=win64

::t Apache_Store_Url=https://www.apachelounge.com/download
set Apache_Store_Url=http://www.apachelounge.com/download
set Apache_Name_Zip=httpd-%Apache_Version%-%Apache_OS_Type%-%Apache_Compiler%.zip
set Apache_File_Zip=%Scripts_Downloads%\%Apache_Name_Zip%
set Apache_Url=%Apache_Store_Url%/%Apache_Compiler%/binaries/%Apache_Name_Zip%
set Apache_SubDir=\Apache%Apache_Version_AB:.=%

call "%~dp0../File/Download.bat" "%Apache_Url%" "%Apache_File_Zip%" "Zip" "%Apache_UnPack%" "%Apache_UnPack%%Apache_SubDir%" "%Apache_Path%"
