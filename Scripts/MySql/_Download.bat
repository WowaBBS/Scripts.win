
if "%MySql_OS_Type%"=="" set MySql_OS_Type=winx64

set MySql_Store_Url=https://dev.mysql.com/get/Downloads
set MySql_Name_Zip=mysql-%MySql_Version%-%MySql_OS_Type%.zip
set MySql_File_Zip=%Scripts_Downloads%\%MySql_Name_Zip%
set MySql_Url=%MySql_Store_Url%/MySQL-%MySql_Version_AB%/%MySql_Name_Zip%
set MySql_SubDir=\mysql-%MySql_Version%-%MySql_OS_Type%

call "%~dp0../File/Download.bat" "%MySql_Url%" "%MySql_File_Zip%" "Zip" "%MySql_UnPack%" "%MySql_UnPack%%MySql_SubDir%" "%MySql_Path%"
