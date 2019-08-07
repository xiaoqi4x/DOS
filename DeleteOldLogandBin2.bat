rem date format: 2017-01-10
@echo off
setlocal enabledelayedexpansion
mode con cols=80 lines=30
title Delete old Log
set current_year=%date:~0,4%
set current_month=%date:~5,2%
set current_date=%date:~8,2%
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


