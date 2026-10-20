@echo off
echo ==========================================
echo   Pushing your updates to GitHub...
echo ==========================================
git add .
set /p msg="Enter a note for this update (or press Enter for 'Quick update'): "
if "%msg%"=="" set msg=Quick update
git commit -m "%msg%"
git push
echo.
echo ==========================================
echo   Done! Your changes are pushed.
echo ==========================================
pause
