@echo off

REM source= the location of your minecraft data
set "source=F:\mcdata"

REM destination= the location you want to backup minecraft to
set "destination=F:\_backups"

for /f "tokens=2 delims==." %%a in ('wmic os get LocalDateTime /value') do set "timestamp=%%a"
set "timestamp=%timestamp:~0,4%-%timestamp:~4,2%-%timestamp:~6,2%_%timestamp:~8,2%-%timestamp:~10,2%-%timestamp:~12,6%"

REM Append the timestamp to the folder name
set "folderName=mc_data_%timestamp%"

REM Copy the source directory including all files
xcopy "%source%" "%destination%\%folderName%\" /E /C /I

REM Compress the copied directory into a ZIP file, retry if the debug.log file is locked
:Compress
powershell -nologo -noprofile -command "try { Add-Type -A 'System.IO.Compression.FileSystem'; [System.IO.Compression.ZipFile]::CreateFromDirectory('%destination%\%folderName%', '%destination%\%folderName%.zip'); exit 0 } catch { exit 1 }"
if errorlevel 1 goto :Compress


REM Delete the new folder
rmdir /s /q "%destination%\%folderName%"

REM Delete old backups (retain the last 7)
powershell -nologo -noprofile -Command " $backupFiles = Get-ChildItem -Path \"%destination%\mc_data_*\" -File | Sort-Object CreationTime; $filesToRetain = $backupFiles.Count - 7; if ($filesToRetain -gt 0) { $backupFiles | Select-Object -First $filesToRetain | ForEach-Object { Remove-Item -Path $_.FullName -Force -Recurse; $zipFile = \"$($_.FullName).zip\"; if (Test-Path $zipFile) { Remove-Item -Path $zipFile -Force } } }"