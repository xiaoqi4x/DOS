@echo off
setlocal enabledelayedexpansion
dir c: > C:\UserData\old\freespace.txt
for /f "tokens=3" %%a in ('type "C:\UserData\old\freespace.txt"^|find /i "Dir(s)"') do (
@echo %computername% free space : %%a
del C:\UserData\old\freespace.txt
)
