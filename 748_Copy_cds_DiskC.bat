@echo off
setlocal enabledelayedexpansion
title Build information of all racks
mode con cols=160 lines=30
set max=0
set /a folder_count=0
set /a i=0
set location=init
set foldername=init
set lserver=init
set lserver_path=init
set lserver_path2=init
for /d %%a in ( C:\UserData\log\* ) do (
		set str=%%~na
		if "!str:~0,7!" == "ST_7480" (
			set folder_date=!str:~12,22!
			if !folder_date! gtr !max!  (
				set max=!folder_date!
				)
		)		
)
for /d %%b in ( C:\UserData\log\ST_7480_2016!max!\*ST_7480*) do (
	set foldername=%%b
)
for /f "delims=/ tokens=4,5,6,7,8" %%c in ('type "!foldername!\ST_7480_*.txt"^|find /i "setsessionconfig"') do (
	set location=C:\%%c\%%d\%%e\%%f
	GOTO:NEXT
)
:NEXT
for /f "delims=\ tokens=2" %%g in ('type "!foldername!\ST_7480_*.txt"^|find /i "push_log"') do (
	set lserver=%%g
	GOTO:NEXT1
)
:NEXT1
for /f "delims=\ tokens=3,4,5,6,7,8" %%h in ('type "!foldername!\ST_7480_*.txt"^|find /i "push_log"') do (
	set lserver_path=%%h\%%i\%%j\%%k\%%l\%%m\
	GOTO:NEXT2
)
:NEXT2
if !lserver! == bjswsr001 (
	set lserver_path2=\\bjswsr001.ccr.corp.intel.com\!lserver_path!
	xcopy !location!\cds_log*.txt !lserver_path2!
) else if !lserver! == bjswsr007 (
	set lserver_path2=\\bjswsr007.ccr.corp.intel.com\!lserver_path!
	xcopy !location!\cds_log*.txt !lserver_path2!
) else if !lserver! == bjswsr008 (
	set lserver_path2=\\bjswsr008.ccr.corp.intel.com\!lserver_path!
	xcopy !location!\cds_log*.txt !lserver_path2!
) else if !lserver! == bjswsr009 (
	set lserver_path2=\\bjswsr009.ccr.corp.intel.com\!lserver_path!
	xcopy !location!\cds_log*.txt !lserver_path2!
)
:END
pause