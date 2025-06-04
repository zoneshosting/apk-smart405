@echo off
echo ================================================
echo    Direct Complete URL Replacement
echo ================================================

cd /d "H:\00-Claude\projects\Apk-Smart405"

echo Adding direct complete URL string replacement...
git add .github/workflows/apk-modifier.yml

echo Committing direct URL replacement approach...
git commit -m "Fix panel URL replacement with direct complete URL string search - no more patterns!"

echo Pushing to GitHub...
git push origin main

echo.
echo ================================================
echo      🎯 DIRECT URL REPLACEMENT DEPLOYED! 🎯
echo ================================================
echo.
echo Simple and direct approach:
echo ✓ Searches for EXACT complete URL strings:
echo   - "https://rebrandking.com/panels/SM4trio/dynam/"
echo   - "https://rebrandking.com/panels/SM4trio/dynam/api/"
echo ✓ No regex patterns or complex matching
echo ✓ Direct string replacement using sed
echo ✓ Shows exactly which files contain the URLs
echo ✓ Displays sample content before and after
echo ✓ Comprehensive verification and troubleshooting
echo.
echo What this will do:
echo 1. Search for exact URL1: "https://rebrandking.com/panels/SM4trio/dynam/"
echo 2. Search for exact URL2: "https://rebrandking.com/panels/SM4trio/dynam/api/"
echo 3. Replace with: "https://rebrandking.com/panels/SM4trio/sitv/"
echo 4. Replace with: "https://rebrandking.com/panels/SM4trio/sitv/api/"
echo 5. Verify exactly what was replaced
echo.
echo This should finally work - no more pattern complications!
echo.

set /p OPEN_BROWSER="Run the direct URL replacement workflow? (y/n): "
if /i "%OPEN_BROWSER%"=="y" (
    start https://github.com/zonehosting/apk-smart405/actions/workflows/apk-modifier.yml
)

echo.
echo Press any key to exit...
pause >nul
