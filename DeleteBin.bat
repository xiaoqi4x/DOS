@echo off
setlocal enabledelayedexpansion
:start
set /a x=0
for /r C:\UserData\log %%i in (*.bin) do (
echo %%i
del %%i
set /a x=x+1
)
echo total is !x!

timeout /T 3600
cls
goto start

pause


