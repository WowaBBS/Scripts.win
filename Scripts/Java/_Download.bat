
if "%Java_Version_B%"=="" goto Latest

set Java_Name_Zip=jdk-%Java_Version%_windows-x64_bin.zip
set Java_Url=%Java_Store_Url%/%Java_Version_A%/archive/%Java_Name_Zip%
set Java_SubDir=\jdk-%Java_Version%

goto End
:Latest

set Java_Name_Zip=jdk-%Java_Version_A%_windows-x64_bin.zip
set Java_Url=%Java_Store_Url%/%Java_Version_A%/latest/%Java_Name_Zip%
set Java_SubDir=\jdk-%Java_Version%

:End
set Java_File_Zip=%Scripts_Downloads%\%Java_Name_Zip%

call "%~dp0../File/Download.bat" "%Java_Url%" "%Java_File_Zip%" "Zip" "%Java_UnPack%" "%Java_UnPack%%Java_SubDir%" "%Java_Path%"
