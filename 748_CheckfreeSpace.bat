@echo off
setlocal enabledelayedexpansion
dir c: > C:\Tools\Log_running\freespace.txt
for /f "tokens=3" %%a in ('type "C:\Tools\Log_running\freespace.txt"^|find /i "Dir(s)"') do (
@echo %computername% free space : %%a
del C:\Tools\Log_running\freespace.txt
)
