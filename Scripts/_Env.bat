@echo off

if "%Scripts_Distrib%"=="" set Scripts_Distrib=%~dp0..\.Distrib\
if "%Scripts_Downloads%"=="" set Scripts_Downloads=%Scripts_Distrib%.Download
mkdir "%Scripts_Downloads%\" 2>nul
