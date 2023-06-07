@echo off
cd /D "%~dp0"
SET AAA=%*
echo %AAA%

set num=0
:looptime
set /a num+=1
echo test
echo %num%
if "%num%"=="5" pause&&echo.循环5次啦&&goto end
goto looptime

