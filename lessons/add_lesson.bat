@echo off
setlocal

REM Run PowerShell to find the latest file, calculate +1, copy it, and return the new name
for /f "delims=" %%i in ('powershell -NoProfile -Command "$files = Get-ChildItem 'lesson-*.json'; $max = 0; foreach ($f in $files) { if ($f.BaseName -match 'lesson-(\d+)') { $num = [int]$matches[1]; if ($num -gt $max) { $max = $num; $latest = $f.FullName } } } $next = $max + 1; $newName = 'lesson-' + $next.ToString('00') + '.json'; if ($latest) { Copy-Item $latest $newName } else { '{}' | Set-Content $newName }; Write-Output $newName"') do (
    set "newName=%%i"
)

echo Created: %newName%

REM Open the new file using Windows default handler
start "" "%newName%"

endlocal