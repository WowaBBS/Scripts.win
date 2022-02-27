
::t Git_Name_Zip=PortableGit-%Git_Version%-64-bit.7z.exe
if "%Git_Version_D%"==""  set Git_Version_D=1
::if "%Git_Version_D%"=="0" set Git_Version_D=1

set Git_Store_Url=https://github.com/git-for-windows/git/releases/download
set Git_Name_Zip=MinGit-%Git_Version%-64-bit.zip
set Git_File_Zip=%Scripts_Downloads%\%Git_Name_Zip%
set Git_Url=%Git_Store_Url%/v%Git_Version_ABC%.windows.%Git_Version_D%/%Git_Name_Zip%

call "%~dp0../File/Download.bat" "%Git_Url%" "%Git_File_Zip%" "Zip" "%Git_Path%"
