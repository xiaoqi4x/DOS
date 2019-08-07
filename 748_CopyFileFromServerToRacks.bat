@echo off
title Copy file or folder from server to racks
@echo ..........................................................
@echo .. copy files from server to racks,please enter 1       ..
@echo .. copy file folder from server to racks,please enter 2 ..
@echo ..........................................................
set /p choose=please input you want to choose:
if %choose% equ 1 (
	@echo copying file..........
	timeout /T 5
	for %%i in (46,47,48,64,65,67) do (
		xcopy  \\bjswsr002.ccr.corp.intel.com\Log\Tools\XMM7480\toolFor748\CheckBuildInfor.bat \\kxzeng-desk%%i.ccr.corp.intel.com\Tools\Log_running /v /y
	)
	for %%j in (020,021,023,024) do (
		xcopy  \\bjswsr002.ccr.corp.intel.com\Log\Tools\XMM7480\toolFor748\CheckBuildInfor.bat \\BJSR%%j.ccr.corp.intel.com\Tools\Log_running /v /y
	)
)
if %choose% equ 2 (
	@echo copying folder..........
	timeout /T 5
	for %%i in (46,47,48,64,65,67) do (
		xcopy  \\bjswsr001.ccr.corp.intel.com\Log\Tools\XMM7480\toolFor748 \\kxzeng-%%i.ccr.corp.intel.com\Tools\748\ /i /s /v /e /y
	)
	for %%j in (020,021,023,024) do (
		xcopy  \\bjswsr001.ccr.corp.intel.com\Log\Tools\XMM7480\toolFor748 \\BJSR%%j.ccr.corp.intel.com\Tools\748\ /i /s /v /e /y
	) 
)

pause
 