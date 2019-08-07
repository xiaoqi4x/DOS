rem get at port from com port 
@echo off
mode
setlocal EnableDelayedExpansion
set port=
set /a count=0
set /a count1=0
if exist C:\tools\Scripts\ports.txt (
	del C:\Tools\Scripts\ports.txt
	C:\tools\Scripts\devcon.exe find =ports >C:\tools\Scripts\ports.txt
	for /f "tokens=7" %%i in ('type "C:\tools\Scripts\ports.txt"^|find /i "AT"') do (
		set /a count=count+1
	)
		if !count! equ 0 (
			cls
			@echo *************************************************
			@echo                device  offline
			@echo *************************************************
		) else (
			for /f "tokens=7" %%j in ('type "C:\tools\Scripts\ports.txt"^|find /i "AT"') do (
				if exist C:\Tools\nvm_restore\NVM_restore.txt ( del C:\Tools\nvm_restore\NVM_restore.txt )
				@set getInformation=%%j
				if "!getInformation:~5,1!" == ")" (set port=!getInformation:~1,4!) else (set port=!getInformation:~1,5!)
				C:\Tools\PhoneTool\NvmFlashBackupRestoreCmdLine.exe IBCR "c:\Tools\NVMdata" !port! BAUD=115200;RTS=0;DTR=0
				C:\Tools\PhoneTool\NvmFlashBackupRestoreCmdLine.exe IBCR "c:\Tools\NVMdata" !port! BAUD=115200;RTS=0;DTR=0 > C:\Tools\nvm_restore\NVM_restore.txt
				@echo.
				@echo.
				if exist C:\Tools\nvm_restore\NVM_restore.txt (
					for /f %%k in ('type "C:\Tools\nvm_restore\NVM_restore.txt"^|find /i "successful"') do (
						set /a count1=count1+1
					)
					if !count1! gtr 0 (
						@echo *************************************************
						@echo     flash successfully,begain to install AMPT
						@echo *************************************************
						timeout /t 5
						call C:\Tools\Scripts\4_install_app_AMPT_1.23c.bat
					) 
					if !count! gtr 0 ( 
						if !count1! equ 0 (
								@echo *************************************************
								@echo            You need wait a moment!
								@echo *************************************************
						)
					)
				) else (
					@echo *************************************************
					@echo            NVM_restore.txt not exist!
					@echo *************************************************
				)
			)
		)
) else (
	@echo *************************************************
	@echo            ports.txt not exist!
	@echo *************************************************
)
pause
 

