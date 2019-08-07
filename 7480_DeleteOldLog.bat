@echo off
setlocal enabledelayedexpansion
mode con cols=130 lines=30
title Delete old Log
if not exist C:\UserData\log\DeleteLogRecord_%date%.txt (
	@echo file create time is %date% %time% > C:\UserData\log\DeleteLogRecord_%date%.txt
	@echo .>>C:\UserData\log\DeleteLogRecord_%date%.txt
	@echo ..>>C:\UserData\log\DeleteLogRecord_%date%.txt
	@echo ...>>C:\UserData\log\DeleteLogRecord_%date%.txt
)
if exist C:\UserData\log\DeleteLogRecord_%date%.txt (
	@echo delete time is %date% %time% >> C:\UserData\log\DeleteLogRecord_%date%.txt
)
set current_year=%date:~6,4%
if %date:~3,1% equ 0 (
	set current_month=%date:~4,1%
)
if %date:~3,1% neq 0 (
	set current_month=%date:~3,2%
)
if %date:~0,1% equ 0 (
	set current_date=%date:~1,1%
)
if %date:~0,1% neq 0 (
	set current_date=%date:~0,2%
)
@echo *******************************************************************  
@echo **  This bat is used to delete log logs from C:\UserData\log     **  
@echo **  you can also find the delelte record in this path            **
@echo *******************************************************************
if not exist C:\UserData\log (
	md C:\UserData\log
)
for /d %%i in ( C:\UserData\log\* ) do (
	set str=%%~ni
	set /a str1=!str:~4,1!-1
	set /a str2=!str:~6,1!-1
	set floger_year=!str:~0,4!
	if !str1! lss 0 (	
		set floger_month=!str:~5,1!
	)
	if !str1! geq 0 (
		set floger_month=!str:~4,2!
	)
	if !str2! lss 0 (
		set floger_date=!str:~7,1!
	)
	if !str2! geq 0 (
		set floger_date=!str:~6,2!
	)
	if !current_month! equ !floger_month! (
		set /a current_date_sub_floger_date=!current_date!-!floger_date!
		if !current_date_sub_floger_date! gtr 3 (
			rmdir /s/q %%i
			if not exist %%i echo rmdir %%i successfully. >> C:\UserData\log\DeleteLogRecord_%date%.txt
			if exist %%i echo rmdir %%i unsuccessfully. >> C:\UserData\log\DeleteLogRecord_%date%.txt
		)
	)
	if !current_month! gtr !floger_month! (
		set /a current_date_sub_floger_date=31-!floger_date!+!current_date!
		if !current_date_sub_floger_date! gtr 3 (
			rmdir /s/q %%i
			if not exist %%i echo rmdir %%i successfully. >> C:\UserData\log\DeleteLogRecord_%date%.txt
			if exist %%i echo rmdir %%i unsuccessfully. >> C:\UserData\log\DeleteLogRecord_%date%.txt
		)
	)
	if !current_year! gtr !floger_year! (
		set /a current_date_sub_floger_date=31-!floger_date!+!current_date!
		if !current_date_sub_floger_date! gtr 3 (
			rmdir /s/q %%i
			if not exist %%i echo rmdir %%i successfully. >> C:\UserData\log\DeleteLogRecord_%date%.txt
			if exist %%i echo rmdir %%i unsuccessfully. >> C:\UserData\log\DeleteLogRecord_%date%.txt
		)
	)
)
@echo *******************************************************************
@echo **              Below is delete log record                       **
@echo **  you can also find the delelte record in C:\UserData\log      **
@echo *******************************************************************
explorer C:\UserData\log
tasklist > C:\UserData\log\tasklist.txt
for /f "tokens=1" %%e in ('type "C:\UserData\log\tasklist.txt"^|find /i "cmd.exe"') do (
@echo kill task : %%e
taskkill -f /im %%e
)
