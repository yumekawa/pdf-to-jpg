@echo off
cd /D "%~dp0"
SET AAA=%*
SET BBB=%~dp0
echo %AAA%

    SETLOCAL ENABLEDELAYEDEXPANSION
    SET /a x=0
    FOR %%F IN (.) DO (
    IF EXIST %AAA% (
            SET /a x+=1
            XCOPY %AAA% 1 /y  
            REN "1\1.pdf" "1_!x!.pdf"
        )
    )
    ENDLOCAL
    PAUSE