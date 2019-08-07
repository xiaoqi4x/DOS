@echo off
setlocal enabledelayedexpansion
tasklist > C:\UserData\old\tasklist.txt
for /f "tokens=2" %%a in ('type "C:\UserData\old\tasklist.txt"^|find /i "CLA.exe"') do (
@echo kill task :CLA.exe %%a
taskkill -f /pid %%a
)
for /f "tokens=2" %%b in ('type "C:\UserData\old\tasklist.txt"^|find /i "STT.exe"') do (
@echo kill task :STT.exe %%b
taskkill -f /pid %%b
)
for /f "tokens=2" %%c in ('type "C:\UserData\old\tasklist.txt"^|find /i "Harts_IO_Server.exe"') do (
@echo kill task :Harts_IO_Server.exe %%c
taskkill -f /pid %%c
)
for /f "tokens=2" %%e in ('type "C:\UserData\old\tasklist.txt"^|find /i "ttermpro.exe"') do (
@echo kill task :ttermpro.exe %%e
taskkill -f /pid %%e
)
cls
call C:\Log_running\4_Clear_Logs.bat
pause