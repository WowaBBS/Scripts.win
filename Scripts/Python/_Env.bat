
if "%Python_Distrib%"=="" set Python_Distrib=%~dp0..\Distrib\
if "%Python_Type%"==""    set Python_Type=embed
if "%Python_CPU%"==""     set Python_CPU=amd64
::if "%Python_Version%"=="" set Python_Version=3.9.0
if "%Python_Version%"=="" set Python_Version=3.9.6
::if "%Python_Version%"=="" set Python_Version=2.7.18
set Python_Path=%Python_Distrib%Python/%Python_Version:.=x%
