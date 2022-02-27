@echo off

if "%Scripts_Distrib%"=="" set Scripts_Distrib=%~dp0..\.Distrib
if "%Scripts_Downloads%"=="" set Scripts_Downloads=%Scripts_Distrib%\.Download
if "%Scripts_UnPack%"=="" set Scripts_UnPack=%Scripts_Downloads%\..\.UnPack
mkdir "%Scripts_Downloads%\" 2>nul
mkdir "%Scripts_UnPack%\" 2>nul
