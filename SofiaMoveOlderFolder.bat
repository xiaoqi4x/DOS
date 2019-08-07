@echo off
setlocal enabledelayedexpansion
mode con cols=100 lines=50
title ^move older folder
set yy=%date:~0,4%
set mm=%date:~5,2%
set dd=%date:~8,2%
::check "old" folder
if not exist C:\zxq\Sofia\old (
	md C:\zxq\Sofia\old 
	)
::move folder
for /d %%i in (C:\zxq\Sofia\*) do (
::echo --%%~ni
	if "%%~ni" neq "old" (
		if "%%~ni" neq "%yy%%mm%%dd%" (
			echo move %%i to C:\zxq\Sofia\old
			move %%i C:\zxq\Sofia\old
		)
	)
)

ping -n 3 127.0.0.1>nul
exit
