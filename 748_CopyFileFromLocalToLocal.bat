@echo off
title Copy file or folder from server to racks
@echo ..........................................................
@echo .. copy file from Local PC to racks,please enter 1        ..
@echo .. copy file folder from Local PC to racks,please enter 2 ..
@echo ..........................................................
set /p choose=please input you want to choose:
if %choose% equ 1 (
	@echo copying file..........
	timeout /T 5
	for %%i in (64,65,67) do (
		xcopy  \\kxzeng-desk%%i\Tools\AMPT\AppConfigFile\CheckBuildInfor.bat \\kxzeng-desk%%i.ccr.corp.intel.com\Tools\Log_running /v /y
	)
	for %%j in (020,021,023,024) do (
		xcopy  \\BJSR%%i\Tools\AMPT\AppConfigFile\CheckBuildInfor.bat \\BJSR%%j.ccr.corp.intel.com\Tools\Log_running /v /y
	)
)
if %choose% equ 2 (
	@echo copying folder..........
	timeout /T 5
	for %%i in (64,65,67) do (
		xcopy  \\kxzeng-desk%%i\Tools\AMPT\AppConfigFile\CheckBuildInfor.bat \\kxzeng-desk%%i.ccr.corp.intel.com\Tools\Log_running /i /s /v /e /y
	)
	for %%j in (020,021,023,024) do (
		xcopy  \\BJSR%%i\Tools\AMPT\AppConfigFile \\BJSR%%j.ccr.corp.intel.com\Tools\Log_running /i /s /v /e /y
	) 
)
pause
 