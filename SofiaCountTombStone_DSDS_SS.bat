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
	if "!folder_prefix!" == "SOFIA" (
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
)
pause

KXZENG-DESK3------SOFIA_LTE_M_1602_3_0055_MSV34Ud
C:\UserData\log\SoFIALTE_20160114151156
C:\UserData\log\SoFIALTE_20160114151156\SFLTE_Stability_XT_v7C_140116151226\SFLT
E_Stability_XT_v7C.txt
'find' is not recognized as an internal or external command,
operable program or batch file.
1.The test is ongoing.
Press any key to continue . . .