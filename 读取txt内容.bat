@echo off
cd /D "%~dp0"
for /f "delims=" %%i in (%*) do (
	echo %%~i
)
pause