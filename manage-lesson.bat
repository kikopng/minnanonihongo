@echo off
chcp 65001 >nul
title Minna Study Path - Lesson Manager
cd /d "%~dp0"

:MENU
cls
echo ========================================================
echo       MINNA STUDY PATH - LESSON MANAGER
echo ========================================================
echo.

if not exist "lessons\course.json" (
    echo [ERROR] Cannot find "lessons\course.json"!
    echo Please make sure this .bat file is placed in your
    echo project root directory.
    echo.
    pause
    exit /b
)

echo Checking current status...
powershell -NoProfile -Command ^
  "$json = Get-Content 'lessons\course.json' -Raw -Encoding UTF8 | ConvertFrom-Json; " ^
  "$ready = $json.lessons | Where-Object { $_.status -eq 'ready' } | ForEach-Object { $_.id }; " ^
  "Write-Host '  Active / Clickable: ' -NoNewline -ForegroundColor Green; " ^
  "Write-Host ($ready -join ', ') -ForegroundColor Cyan"

echo.
echo --------------------------------------------------------
set "LESSON_ID="
set /p LESSON_ID="Enter Lesson Number (1-25) [or Q to Quit]: "

if /i "%LESSON_ID%"=="Q" goto EXIT
if "%LESSON_ID%"=="" goto MENU

:: Check if input is a valid number
set "IS_NUM="
for /f "delims=0123456789" %%i in ("%LESSON_ID%") do set "IS_NUM=%%i"
if defined IS_NUM (
    echo.
    echo [!] Please enter a valid integer between 1 and 25.
    timeout /t 2 >nul
    goto MENU
)

if %LESSON_ID% LSS 1 goto INVALID_RANGE
if %LESSON_ID% GTR 25 goto INVALID_RANGE

echo.
echo Choose action for Lesson %LESSON_ID%:
echo   [1] Activate   (sets "status": "ready")
echo   [2] Deactivate (sets "status": "planned")
echo   [3] Cancel
echo.

set "ACTION_CHOICE="
set /p ACTION_CHOICE="Select (1, 2, or 3): "

set "NEW_STATUS="
if "%ACTION_CHOICE%"=="1" set "NEW_STATUS=ready"
if "%ACTION_CHOICE%"=="2" set "NEW_STATUS=planned"
if "%ACTION_CHOICE%"=="3" goto MENU

if not defined NEW_STATUS (
    echo [!] Invalid choice.
    timeout /t 2 >nul
    goto MENU
)

set "TARGET_ID=%LESSON_ID%"
set "TARGET_STATUS=%NEW_STATUS%"

powershell -NoProfile -Command ^
  "$path = 'lessons\course.json'; " ^
  "$json = Get-Content $path -Raw -Encoding UTF8 | ConvertFrom-Json; " ^
  "$targetId = [int]$env:TARGET_ID; " ^
  "$target = $json.lessons | Where-Object { $_.id -eq $targetId }; " ^
  "if ($target) { " ^
  "    $target.status = $env:TARGET_STATUS; " ^
  "    $utf8NoBom = New-Object System.Text.UTF8Encoding($false); " ^
  "    [System.IO.File]::WriteAllText((Resolve-Path $path), ($json | ConvertTo-Json -Depth 10), $utf8NoBom); " ^
  "    Write-Host \">> SUCCESS! Lesson $targetId status updated to '$($env:TARGET_STATUS)'.\" -ForegroundColor Green; " ^
  "} else { " ^
  "    Write-Host \">> ERROR: Lesson $targetId was not found in course.json.\" -ForegroundColor Red; " ^
  "}"

echo.
echo Changes saved successfully!
echo.
pause
goto MENU

:INVALID_RANGE
echo.
echo [!] Lesson number must be between 1 and 25.
timeout /t 2 >nul
goto MENU

:EXIT
exit /b