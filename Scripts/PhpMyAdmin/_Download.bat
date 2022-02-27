
set PhpMyAdmin_Store_Url=https://files.phpmyadmin.net/phpMyAdmin
set PhpMyAdmin_Name_Zip=phpMyAdmin-%PhpMyAdmin_Version%-%PhpMyAdmin_Lang%.zip
set PhpMyAdmin_File_Zip=%Scripts_Downloads%\%PhpMyAdmin_Name_Zip%
set PhpMyAdmin_Url=%PhpMyAdmin_Store_Url%/%PhpMyAdmin_Version%/%PhpMyAdmin_Name_Zip%
set PhpMyAdmin_SubDir=\phpMyAdmin-%PhpMyAdmin_Version%-%PhpMyAdmin_Lang%

call "%~dp0../File/Download.bat" "%PhpMyAdmin_Url%" "%PhpMyAdmin_File_Zip%" "Zip" "%PhpMyAdmin_UnPack%" "%PhpMyAdmin_UnPack%%PhpMyAdmin_SubDir%" "%PhpMyAdmin_Path%"

::del "%PhpMyAdmin_File_Zip%" 2>nul
