@echo off
setlocal enabledelayedexpansion
mode con cols=150
set yy=%date:~0,4%
set mm=%date:~5,2%
set dd=%date:~8,2%
@echo Today is %yy%%mm%%dd%
@echo **********************************
@echo        CoreDump number
@echo **********************************
if exist C:\UserData\old\coredump.txt (
	del C:\UserData\old\coredump.txt
)
for /d %%i in ( X:\%dd%-%mm%-%yy%\* ) do (
    set /a desk_number=0
	set  str=%%~ni
	set folder_prefix=!str:~0,5!
		for /d %%j in ( %%i\* ) do (
			set desk_infor=%%~nj
			if "!desk_infor:~0,4!"== "DESK" (
				set /a desk_number=desk_number+1
				set /a count1=0
				for /d %%k in ( %%j\* ) do (
					set file_name=%%~nk
					set file_name_prefix=!file_name:~0,8!
					if "!file_name_prefix!" == "SoFIALTE" (
						set /a count1=count1+1
					)
				)
				if !count1! equ 1 (
					for /d %%k in ( %%j\* ) do (
						set file_name=%%~nk
						set file_name_prefix=!file_name:~0,8!
						if "!file_name_prefix!" == "SoFIALTE" (
							set /a count=0
							for /d %%l in ( %%k\* ) do (
								set /a count=count+1
							)
							if !count! gtr 0 (
								for /d %%l in ( %%k\* ) do (
									if exist C:\UserData\old\coredump.txt (
										@echo %%l >> C:\UserData\old\coredump.txt
									)
									if not exist C:\UserData\old\coredump.txt (
										@echo %%l > C:\UserData\old\coredump.txt
									)
								)
								set /a coredump_number=0
								for /f %%m in ('type "C:\UserData\old\coredump.txt"^|find /i "CoreDump"') do (
									set /a coredump_number=coredump_number+1
								)
								@echo %%j coredump number is : !coredump_number!
								if exist C:\UserData\old\coredump.txt (
									del C:\UserData\old\coredump.txt
								)
							)
							if !count! equ 0 (
								@echo %%j coredump number is : !count!     no folders in the CLA folder.
							)
						)
					)
				)
				if !count1! gtr 1 (
					@echo  %%j can not count coredump number , maybe old logs couldn't be cleared.
				)
				if !count1! equ 0 (
					@echo %%j no CLA folder, please check.
				)
			)
		)
		@echo %%i desk number is : !desk_number!
		@echo **********************************
		@echo **********************************
)
pause