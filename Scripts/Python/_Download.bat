
set Python_RC=

set Python_Name_Zip=python-%Python_Version%%Python_RC%-%Python_Type%-%Python_CPU%.zip
::set Python_Name_Zip=python-%Python_Version%%Python_RC%.%Python_CPU%.msi
set Python_File_Zip=%Scripts_Downloads%\%Python_Name_Zip%
set Python_Url=%Python_Store_Url%/%Python_Version%/%Python_Name_Zip%

call "%~dp0../File/Download.bat" "%Python_Url%" "%Python_File_Zip%"
