@echo off
setlocal enabledelayedexpansion
mode con cols=60 lines=60
title check spare space

::C:\Tools\CampaignManager\toolkit\psexec\PsExec.exe \\kxzeng-desk11 -u CCR\lab_MC2TDDVERStabili -p mtbf120@intel -c C:\Tools\CampaignManager\StatusManager\111.cmd

::for /f %%i in ('type "C:\zxq\myscript\UsefulBatch\space.txt"^|find /i "bytes free"') do (
::echo %%i
::)
::for /f %%i in ('dir c:\ ^|find /i "bytes free"') do (
::echo %%i
::)
for /f "tokens=1 delims=" %%a in ('dir C:\^| find /i "free"') do (
	echo %%a
) 
pause
