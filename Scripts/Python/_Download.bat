
set Python_RC=

::                    python-3.9.6-embed-amd64
set Python_Name_Zip=python-%Python_Version%%Python_RC%-%Python_Type%-%Python_CPU%.zip
::set Python_Name_Zip=python-%Python_Version%%Python_RC%.%Python_CPU%.msi
set Python_File_Zip=%Python_Distrib%Downloads\%Python_Name_Zip%
set Python_Url=%Python_Store_Url%/%Python_Version%/%Python_Name_Zip%

call %~dp0../File/Download.bat "%Python_Url%" "%Python_File_Zip%"
