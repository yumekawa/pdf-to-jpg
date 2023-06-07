@echo off
cd /D "%~dp0"
SET AAA=%*

SETLOCAL ENABLEDELAYEDEXPANSION

set num=0
:looptime
set /a num+=1
    FOR %%F IN (.) DO (
    IF EXIST %AAA% (
            XCOPY %AAA% 1 /y  
            REN "1\1.pdf" "!num!.pdf"
        )
    )

if "%num%"=="200" pause&&goto end
goto looptime
ENDLOCAL