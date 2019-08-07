@echo off
setlocal enabledelayedexpansion
mode con lines=40
set yy=%date:~0,4%
set mm=%date:~5,2%
set dd=%date:~8,2%
for /f "delims=" %%a in ('type "C:\Tools\CampaignManager\config\campaignmanager.ini"^| find /i "="') do (
set %%a
)
:start
if exist C:\UserData\old\swbuild.txt ( del C:\UserData\old\swbuild.txt ) else ( echo.> C:\UserData\old\swbuild.txt )
for %%i in (1,41,42,44,14,68) do ( 
call %toolkit_psexec_absolute_path%\PsExec.exe \\kxzeng-desk%%i -u %global_desk_userdomain%\%global_desk_username% -p %global_desk_password% C:\Log_running\SofiaOutputBuildInfor.bat >> C:\UserData\old\swbuild.txt
@echo ************************************************* >> C:\UserData\old\swbuild.txt
)
cls
@echo *****************************************
@echo              DualSIM_DSDS  racks
@echo *****************************************
type C:\UserData\old\swbuild.txt
pause>nul
cls
if exist C:\UserData\old\swbuild.txt ( del C:\UserData\old\swbuild.txt ) else ( echo.> C:\UserData\old\swbuild.txt )
for %%i in (3,9,45) do ( 
call %toolkit_psexec_absolute_path%\PsExec.exe \\kxzeng-desk%%i -u %global_desk_userdomain%\%global_desk_username% -p %global_desk_password% C:\Log_running\SofiaOutputBuildInfor.bat >> C:\UserData\old\swbuild.txt
@echo ************************************************* >> C:\UserData\old\swbuild.txt
)
cls
@echo *****************************************
@echo              DualSIM_SS  racks
@echo *****************************************
type C:\UserData\old\swbuild.txt
pause>nul
cls
if exist C:\UserData\old\swbuild.txt ( del C:\UserData\old\swbuild.txt ) else ( echo.> C:\UserData\old\swbuild.txt )
for %%i in (8,13,23,40) do ( 
call %toolkit_psexec_absolute_path%\PsExec.exe \\kxzeng-desk%%i -u %global_desk_userdomain%\%global_desk_username% -p %global_desk_password% C:\Log_running\SofiaOutputBuildInfor.bat >> C:\UserData\old\swbuild.txt
@echo ************************************************* >> C:\UserData\old\swbuild.txt
)
cls
@echo *****************************************
@echo              MWR  racks
@echo *****************************************
type C:\UserData\old\swbuild.txt
pause>nul
cls
if exist C:\UserData\old\swbuild.txt ( del C:\UserData\old\swbuild.txt ) else ( echo.> C:\UserData\old\swbuild.txt )
for %%i in (37,38,39,46,47,48,49) do ( 
call %toolkit_psexec_absolute_path%\PsExec.exe \\kxzeng-desk%%i -u %global_desk_userdomain%\%global_desk_username% -p %global_desk_password% C:\Log_running\SofiaOutputBuildInfor.bat >> C:\UserData\old\swbuild.txt
@echo ************************************************* >> C:\UserData\old\swbuild.txt
)
call C:\Log_running\SofiaOutputBuildInfor.bat >> C:\UserData\old\swbuild.txt
cls
@echo *****************************************
@echo              SingleSIM  racks
@echo *****************************************
type C:\UserData\old\swbuild.txt
pause>nul
goto start