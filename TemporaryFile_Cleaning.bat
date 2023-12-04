@echo off
echo Cleaning temporary files...

:: Check if the %TEMP% environment variable exists
if not defined TEMP (
    echo Error: The TEMP environment variable is not defined.
    pause
    exit /b 1
)

:: Check if the %TEMP% path exists
if not exist "%TEMP%\" (
    echo Error: The TEMP directory does not exist.
    pause
    exit /b 1
)

:: Delete temporary files
del /q /f /s "%TEMP%\*.*"

:: Check if any files remain in the TEMP directory
dir /b "%TEMP%\*.*" >nul 2>&1
if errorlevel 1 (
    echo Temporary files cleaned.
) else (
    echo Error: Some temporary files could not be deleted.
)

pause
