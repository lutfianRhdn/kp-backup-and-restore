@echo off
setlocal

REM Define variables for remote server
set SERVER=ubuntu@192.168.11.200
set PASSWORD=password
set REMOTE_PATH=backup
set LOCAL_PATH=C:\Users\lutfian\Documents\Backup_JPI_Server

REM Get the newest file from the remote server
for /f "delims=" %%i in ('plink.exe -batch -pw %PASSWORD% %SERVER% "ls -t %REMOTE_PATH%/*.tar.gz | head -n 1"') do set NEWEST_FILE=%%i

REM Remove leading slashes from the file path
set NEWEST_FILE=%NEWEST_FILE%

REM Copy the newest file to local directory
pscp.exe -pw %PASSWORD% %SERVER%:%NEWEST_FILE%  %LOCAL_PATH%

REM Date variables using PowerShell (today's date and 7 days ago)
for /f %%a in ('powershell -Command "(Get-Date).ToString('yyyy-MM-dd')"') do set TODAY=%%a
for /f %%a in ('powershell -Command "(Get-Date).AddDays(-7).ToString('yyyy-MM-dd')"') do set SEVEN_DAYS_AGO=%%a

REM Ensure the local backup directory exists
if not exist "%LOCAL_PATH%" (
    echo [ERROR] Directory %LOCAL_PATH% does not exist.
    exit /b 1
)

REM Loop through files in the local backup directory and remove files older than 7 days
for %%f in (%LOCAL_PATH%\backup_*.tar.gz) do (
    REM Extract date from filename
    for /f %%d in ('powershell -Command "(%%~nf -replace '^backup_', '')"') do set FILE_DATE=%%d

    REM Compare extracted file date with 7 days ago
    for /f %%c in ('powershell -Command "[DateTime]::Parse('%FILE_DATE%') -lt [DateTime]::Parse('%SEVEN_DAYS_AGO%')"') do set IS_OLDER=%%c

    REM If file is older than 7 days, delete it
    if "%IS_OLDER%"=="True" (
        echo Removing %%f
        del "%%f"
    )
)

REM Optionally remove files matching a specific pattern (adjust the regex as needed)
set "pattern=^Test-.*\.zip$"
for /f "tokens=*" %%f in ('dir /b /a-d ^| findstr /i /r %pattern%') do del "%LOCAL_PATH%\%%f"

echo [CLEANUP] Removed files older than 7 days and matching the pattern.

endlocal
