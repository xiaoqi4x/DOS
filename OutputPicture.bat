@echo off
mode con cols=100 lines=30
title Remote PC
setlocal enabledelayedexpansion
:start
echo hello,friends,choose the frame you want to see please!
echo a: triangle b.cuboid c.square
::echo input your choice:
set /p a=input your choice:
echo         .
echo         .
if "%a%" == "a" (
	echo This is a triangle!
	echo      .
	echo   .     .
	echo .    .     .
	timeout /T  3
	cls
	goto start
	
)
if "%a%" == "b" (
	echo This is a cuboid!
	echo .   .   .   .  
	echo .   .   .   . 
	echo .   .   .   . 
	timeout /T  3
	cls
	goto start
)
if "%a%" == "c" (
    echo This is a square!
	echo  .  .  .
	echo  .  .  .
	echo  .  .  .  
	timeout /T  3
	cls
	goto start
)







pause