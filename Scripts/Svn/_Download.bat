
set Svn_Name_Zip=Setup-Subversion-%Svn_Version%.msi
set Svn_File_Zip=%Scripts_Downloads%\%Svn_Name_Zip%
set Svn_Url=%Svn_Store_Url%/%Svn_Version%/%Svn_Name_Zip%

call "%~dp0../File/Download.bat" "%Svn_Url%" "%Svn_File_Zip%"
