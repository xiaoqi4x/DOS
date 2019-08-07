@echo off
setlocal enabledelayedexpansion
title Build information of all racks
mode con cols=160 lines=30
set max=0
set /a folder_count=0
set str1=no run type infor
set str2=no build infor
set str3=no log infor
for /d %%a in ( C:\UserData\log\* ) do (
		set str=%%~na
		if "!str:~0,7!" == "ST_7480" (
			set folder_date=!str:~12,22!
			if !folder_date! gtr !max!  (
				set max=!folder_date!
				)
		)		
)
if exist C:\UserData\log\ST_7480_2016!max!\campaign_end.txt (
			@echo %computername%  ----------CLA stopped
			GOTO:END1
)
for /d %%l in ( C:\UserData\log\ST_7480_2016!max!\ST_7480* ) do (
		set /a folder_count=!folder_count!+1
)
if !folder_count! equ 1 (
		for /d %%m in ( C:\UserData\log\ST_7480_2016!max!\ST_7480* ) do (
			if exist %%m\ST_7480_1.0.txt (
				GOTO:START
			)
			if not exist %%m\ST_7480_*.0.txt (
				@echo %computername%  ----------no cla.txt log
				GOTO:END1
			)
		)
) else (
		@echo %computername%  ----------please check log folder ST_7480_2016!max!
		GOTO:END1
)
:START
for /d %%b in ( C:\UserData\log\ST_7480_2016!max!\* ) do (
		for /f "delims=_ tokens=2,*" %%c in ('type "%%b\*.txt"^|findstr /C:"\*XG748"') do (
			set str=%%c_%%d
			set str1=!str:~0,-2!
			GOTO:NEXT
		)
)
:NEXT
for /d %%b in ( C:\UserData\log\ST_7480_2016!max!\* ) do (
		for /f "tokens=6" %%e in ('type "%%b\*.txt"^|findstr /C:"run_type"') do (
			set str2=%%e
			GOTO:NEXT1
		)
)
:NEXT1
for /d %%b in ( C:\UserData\log\ST_7480_2016!max!\* ) do (
		for /f "tokens=6" %%f in ('type "%%b\*.txt"^|findstr /C:"push_log is"') do (
			set str3=%%f
			GOTO:END
		)
)
:END
cls
@echo %computername%    !str2!    !str1!   !str3!
:END1
