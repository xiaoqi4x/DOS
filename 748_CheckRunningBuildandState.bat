@echo off
setlocal enabledelayedexpansion
title Build information of all racks
mode con cols=160 lines=30
set yy=%date:~0,4%
set mm=%date:~5,2%
set dd=%date:~8,2%

:start
if exist C:\Tools\Log_running\information.txt ( del C:\Tools\Log_running\information.txt )
for %%i in (018,019,020,021,022,023,024) do ( 
call C:\Tools\Log_running\PsExec.exe \\BJSR%%i -u CCR\lab_MC2TDDVERStabili -p mtbf120@intel C:\Tools\Log_running\CheckBuildInfor.bat >> C:\Tools\Log_running\information.txt
@echo -------------------------------------------------------------------------------------------------------------------------- >> C:\Tools\Log_running\information.txt
)
for %%j in (48,64,65,67) do ( 
call C:\Tools\Log_running\PsExec.exe \\kxzeng-desk%%j -u CCR\lab_MC2TDDVERStabili -p mtbf120@intel C:\Tools\Log_running\CheckBuildInfor.bat >> C:\Tools\Log_running\information.txt
@echo -------------------------------------------------------------------------------------------------------------------------- >> C:\Tools\Log_running\information.txt
)
cls
type C:\Tools\Log_running\information.txt
pause>nul
goto :start