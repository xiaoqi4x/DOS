@echo off
setlocal enabledelayedexpansion
set build=
for /f %%j in ( C:\Tools\Scripts\swbuild.txt ) DO (
set build=%%j
)
echo %computername%------!build!
set /a count=0
set path=
for /d %%i in ( C:\UserData\log\* ) do (
	set path=%%i
	set str=%%~ni
	set folder_prefix=!str:~0,8!
	if "!folder_prefix!" == "SoFIALTE" ( set /a count=count+1 )
)
if !count! gtr 1 ( echo 3.Please clear old log again.)
if !count! equ 0 ( echo 4.No CLA folder, the test not start.)
if !count! equ 1 (
    set /a count1=0
	if exist !path!\campaign_start.txt ( 
	set /a count1=count1+1
	)
	if exist !path!\campaign_end.txt ( 
	set /a count1=count1+1
	)
	if !count1! equ 1 ( echo !count1!.The test is ongoing.) 
	if !count1! equ 2 ( echo !count1!.The test has stopped.)
)


	