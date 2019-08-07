@echo off
setlocal enabledelayedexpansion
title create folder ^for QC and report
set yy=%date:~0,4%
set mm=%date:~5,2%
set dd=%date:~8,2%
echo Today is %yy%%mm%%dd%
::create folder
if not exist C:\zxq\Sofia\%yy%%mm%%dd% (
	md C:\zxq\Sofia\%yy%%mm%%dd% 
	copy C:\zxq\Sofia\StressTest_Template_Test.xlsm C:\zxq\Sofia\%yy%%mm%%dd%\StressTest_Session_Template_V1.xlsm
	copy C:\zxq\Sofia\XMM7260_SoFIA_LTE_results_template_deepsleep.xlsx C:\zxq\Sofia\%yy%%mm%%dd%\XMM7260_SoFIA_LTE_results_template_deepsleep.xlsx
)
::move older folder to folder "old"
start SofiaMoveOlderFolder.bat
::open folder
explorer C:\zxq\Sofia\%yy%%mm%%dd%
explorer \\vmspfsfsir02\Sofia_LTE\MTBF\QC\QC_BEI

ping -n 3 127.0.0.1>nul
exit