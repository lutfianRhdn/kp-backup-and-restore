@echo off 
setlocal

REM Define variables
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

endlocal
