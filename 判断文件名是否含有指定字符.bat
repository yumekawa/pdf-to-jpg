@echo off
REM https://stackoverflow.com/questions/36988501/batch-script-fails-on-filenames-with-parenthesis#
cd /D "%~dp0"
set "AAA=%*"
set "AAA=%AAA:^=^^%"
set "AAA=%AAA:&=^&%"
set "AAA=%AAA:(=^(%"
set "AAA=%AAA:)=^)%"

echo %AAA%
echo (%AAA% | findstr )) >nul && (
    echo has
) || (
    echo not
)
Pause&Exit

