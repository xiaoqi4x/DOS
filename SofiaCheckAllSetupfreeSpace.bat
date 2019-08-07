@echo off
title Clean Pass Log Bat
setlocal enabledelayedexpansion
for /f "delims=" %%a in ('type "C:\Tools\CampaignManager\config\campaignmanager.ini"^| find /i "="') do (
set %%a
)
echo computerfreespace > C:\UserData\old\freespace.txt
for %%i in (1,3,9,41,42,44,45,8,13,23,40,14,37,38,39,46,47,48,49,68) do (
call %toolkit_psexec_absolute_path%\PsExec.exe \\kxzeng-desk%%i -u %global_desk_userdomain%\%global_desk_username% -p %global_desk_password% C:\Log_running\SofiaCheckfreeSpace.bat >> C:\UserData\old\freespace.txt
)
dir c: > C:\UserData\old\1.txt
for /f "tokens=3" %%a in ('type "C:\UserData\old\1.txt"^|find /i "Dir(s)"') do (
@echo %computername% free space : %%a >> C:\UserData\old\freespace.txt
del C:\UserData\old\1.txt
)
type C:\UserData\old\freespace.txt
pause