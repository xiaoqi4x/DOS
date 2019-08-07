rem 2017-01-10
@echo off
setlocal enabledelayedexpansion
mode con cols=80 lines=30
title Delete old Log
dir C:\UserData\log\ST_7480_*
:start
set /p today=u want to delete logs from :
if !today! lss 20170101 (
	echo date from 20170101-20171231
	goto start
)
if !today! gtr 20171231 (
	echo date from 20170101-20171231
	goto start
)
for /d %%i in ( C:\UserData\log\ST_7480_* ) do (
	set str=%%~ni
	set floger_date=!str:~8,8!
	set /a value=!today!-!floger_date!
	if !value! gtr 0 (
			rmdir /s/q %%i
	)
)
for /r C:\UserData\Log %%i in (*.bin) do (
del %%i
)
dir C:\UserData\log\ST_7480_*
pause


