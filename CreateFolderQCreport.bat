@echo off
setlocal enabledelayedexpansion
title create folder ^for QC and report
set yy=%date:~0,4%
set mm=%date:~5,2%
set dd=%date:~8,2%
echo Today is %yy%%mm%%dd%
::create folder
if exist C:\zxq\QC-report-7260\%yy%%mm%%dd% (
	echo folder C:\zxq\QC-report-7260\%yy%%mm%%dd% already exist.
	)
if exist C:\zxq\documents-7260\%yy%%mm%%dd% (
	echo folder C:\zxq\documents-7260\%yy%%mm%%dd% already exist.
	)
if not exist C:\zxq\QC-report-7260\%yy%%mm%%dd% (
	md C:\zxq\QC-report-7260\%yy%%mm%%dd% 
	copy C:\zxq\QC-report-7260\StressTest_Session_Template_DS.xls C:\zxq\QC-report-7260\%yy%%mm%%dd%\StressTest_Session_Template_DS_copy.xls
	echo Create folder C:\zxq\QC-report-7260\%yy%%mm%%dd% succussfully.
	)
if not exist C:\zxq\documents-7260\%yy%%mm%%dd% (
	md C:\zxq\documents-7260\%yy%%mm%%dd%
	echo Create folder C:\zxq\documents-7260\%yy%%mm%%dd% succussfully.
	)

::move older folder to folder "old"
start call MoveOlderFolder.bat
::open folder
start explorer C:\zxq\QC-report-7260\%yy%%mm%%dd%
start explorer C:\zxq\documents-7260\%yy%%mm%%dd%
start explorer \\peksdn03.bj.intel.com\Beijing\WPRD_MC2_TDD\04_VER\Stability_Test\QC
ping -n 3 127.0.0.1>nul
exit