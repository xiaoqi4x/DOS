@echo off
setlocal enabledelayedexpansion
title Build information of all racks
mode con cols=160 lines=30
:start
if exist D:\CC\XMM7480\Log_running\logpath.txt ( del D:\CC\XMM7480\Log_running\logpath.txt )
for %%i in (001) do ( 
call D:\CC\XMM7480\Log_running\PsExec.exe \\bjswsr%%i -u CCR\lab_MC2TDDVERStabili -p mtbf120@intel C:\Tools\Log_running\7480_FindLogPath_1.bat >> D:\CC\XMM7480\Log_running\logpath.txt
@echo -------------------------------------------------------------------------------------------------------------------------- >> D:\CC\XMM7480\Log_running\logpath.txt
)
cls
type D:\CC\XMM7480\Log_running\logpath.txt
pause>nul
goto :start
pause