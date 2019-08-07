@echo off
setlocal enabledelayedexpansion
mode con cols=150
set yy=%date:~0,4%
set mm=%date:~5,2%
set dd=%date:~8,2%
@echo Today is %yy%%mm%%dd%
@echo **********************************
@echo        tombstone number
@echo **********************************
for /d %%i in ( X:\%dd%-%mm%-%yy%\* ) do (
    set /a desk_number=0
	set  str=%%~ni
	set folder_prefix=!str:~0,5!
		for /d %%j in ( %%i\* ) do (
			set desk_infor=%%~nj
			set /a crashlog_number=0
			if "!desk_infor:~0,4!"== "DESK" (
				set /a desk_number=desk_number+1
				if not exist %%j\PhoneDoctor_Logs ( 
					@echo %%j\PhoneDoctor_Logs is not exist   please check again!!!!!!.
				)
				if exist %%j\PhoneDoctor_Logs (
					set /a tombstone_number=0
					for /f "tokens=4" %%b in ('type "%%j\PhoneDoctor_Logs\history_event"^|find /i "TOMBSTONE"') do (
						set /a tombstone_number=tombstone_number+1
					)
					@echo %%j tombstone number is : !tombstone_number!     read from "history_event"!!!!!!
				)
			)
		)
		@echo %%i desk number is : !desk_number!
		@echo **********************************
		@echo **********************************
)
pause
