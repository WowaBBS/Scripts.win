
set Svn_Store_Url=https://deac-ams.dl.sourceforge.net/project/win32svn/
set Svn_Name_Zip=Setup-Subversion-%Svn_Version%.msi
set Svn_File_Zip=%Scripts_Downloads%\%Svn_Name_Zip%
set Svn_Url=%Svn_Store_Url%/%Svn_Version%/%Svn_Name_Zip%
set Svn_SubDir=\PFiles\Subversion

call "%~dp0../File/Download.bat" "%Svn_Url%" "%Svn_File_Zip%" "Msi" "%Svn_UnPack%" "%Svn_UnPack%%Svn_SubDir%" "%Svn_Path%"

::del "%Svn_File_Zip%" 2>nul
