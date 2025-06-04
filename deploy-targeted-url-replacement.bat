@echo off
echo ================================================
echo    Targeted Panel URL Replacement
echo ================================================

cd /d "H:\00-Claude\projects\Apk-Smart405"

echo Adding precise URL pattern matching and replacement...
git add .github/workflows/apk-modifier.yml

echo Committing changes...
git commit -m "Add targeted panel URL replacement for exact complete URLs - expects 8 total replacements"

echo Pushing to GitHub...
git push origin main

echo.
echo ================================================
echo      🎯 TARGETED URL REPLACEMENT READY! 🎯
echo ================================================
echo.
echo New targeted approach:
echo ✓ Searches for exact complete URLs:
echo   - https://rebrandking.com/panels/SM4trio/dynam/api/
echo   - https://rebrandking.com/panels/SM4trio/dynam/
echo ✓ Replaces only the "dynam" part with new value
echo ✓ Expects exactly 8 total URL modifications
echo ✓ Shows detailed before/after counts
echo ✓ Provides troubleshooting if URLs not found
echo ✓ Verifies success with "✅ SUCCESS: Exactly 8 URLs replaced!"
echo.
echo This approach will:
echo 1. Find the exact complete URLs in smali files
echo 2. Replace only the "dynam" portion
echo 3. Count and verify exactly 8 replacements
echo 4. Show sample of replaced URLs for confirmation
echo.

set /p OPEN_BROWSER="Run the targeted URL replacement workflow? (y/n): "
if /i "%OPEN_BROWSER%"=="y" (
    start https://github.com/zonehosting/apk-smart405/actions/workflows/apk-modifier.yml
)

echo.
echo Press any key to exit...
pause >nul
