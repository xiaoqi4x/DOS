@echo off
setlocal enabledelayedexpansion
mode con cols=100 lines=50
title ^move older folder
set yy=%date:~0,4%
set mm=%date:~5,2%
set dd=%date:~8,2%
::check "old" folder
if exist C:\zxq\documents-7260\old (
	echo folder C:\zxq\documents-7260\old already exist.
	)
if exist C:\zxq\QC-report-7260\old (
	echo folder C:\zxq\QC-report-7260\old already exist.
	)
if not exist C:\zxq\documents-7260\old (
	md C:\zxq\documents-7260\old 
	echo Create folder C:\zxq\QC-report-7260\old succussfully.
	)
if not exist C:\zxq\QC-report-7260\old (
	md C:\zxq\QC-report-7260\old 
	echo Create folder C:\zxq\QC-report-7260\old succussfully.
	)
::move folder
for /d %%i in (C:\zxq\documents-7260\*) do (
::echo --%%~ni
	if "%%~ni" neq "old" (
		if "%%~ni" neq "%yy%%mm%%dd%" (
			echo move %%i to C:\zxq\documents-7260\old
			move %%i C:\zxq\documents-7260\old
		)
	)
)
for /f %%j in ('dir /b C:\zxq\QC-report-7260') do (
::echo --C:\zxq\QC-report-7260\%%j
	if "%%j" neq "old" (
		if "%%j" neq "%yy%%mm%%dd%" (
			if "%%j" neq "StressTest_Session_Template_DS.xls" (
			echo move C:\zxq\QC-report-7260\%%j to C:\zxq\QC-report-7260\old
			move C:\zxq\QC-report-7260\%%j C:\zxq\QC-report-7260\old
			)
		)
	)
)
ping -n 3 127.0.0.1>nul
exit
