rem date format: 01/10/2017
@echo off
setlocal enabledelayedexpansion
mode con cols=80 lines=30
title Delete old Log
set current_year=%date:~-4,4%
set current_month=%date:~-10,2%
set current_date=%date:~-7,2%
set today=!current_year!!current_month!!current_date!
for /d %%i in ( C:\UserData\log\ST_7480_* ) do (
	set str=%%~ni
	set floger_date=!str:~8,8!
	set /a value=!today!-!floger_date!
	if !value! gtr 4 (
			rmdir /s/q %%i
	)
)
for /r C:\UserData\Log %%i in (*.bin) do (
del %%i
)


