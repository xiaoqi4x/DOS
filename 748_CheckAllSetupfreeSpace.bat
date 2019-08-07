@echo off
title Clean Pass Log Bat
setlocal enabledelayedexpansion
:start
echo computerfreespace > C:\Tools\Log_running\freespace.txt
for %%i in (030) do (
call C:\Tools\Log_running\PsExec.exe \\BJSR%%i -u CCR\lab_MC2TDDVERStabili -p intel@432 C:\Tools\Log_running\748_CheckfreeSpace.bat >> C:\Tools\Log_running\freespace.txt
)
for %%i in () do (
call C:\Tools\Log_running\PsExec.exe \\kxzeng-desk%%i -u CCR\lab_MC2TDDVERStabili -p intel@432 C:\Tools\Log_running\748_CheckfreeSpace.bat >> C:\Tools\Log_running\freespace.txt
)
dir c: > C:\Tools\Log_running\1.txt
for /f "tokens=3" %%a in ('type "C:\Tools\Log_running\1.txt"^|find /i "Dir(s)"') do (
@echo %computername% free space : %%a >> C:\Tools\Log_running\freespace.txt
del C:\Tools\Log_running\1.txt
)
cls
type C:\Tools\Log_running\freespace.txt
pause
GOTO start