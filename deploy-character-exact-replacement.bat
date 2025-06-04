@echo off
echo ================================================
echo    Character-Exact URL Replacement
echo ================================================

cd /d "H:\00-Claude\projects\Apk-Smart405"

echo Adding character-exact URL replacement with proper slash handling...
git add .github/workflows/apk-modifier.yml

echo Committing character-exact replacement...
git commit -m "Add character-exact URL replacement - handles forward slashes /dynam/ correctly"

echo Pushing to GitHub...
git push origin main

echo.
echo ================================================
echo      ✨ CHARACTER-EXACT REPLACEMENT READY! ✨
echo ================================================
echo.
echo Handles exact character matching:
echo ✓ Uses forward slashes: /dynam/ (as stored in smali files)
echo ✓ NOT backslashes: \dynam\ (regex escaping)
echo ✓ Uses pipe | delimiter in sed to avoid slash conflicts
echo ✓ Character-by-character exact matching
echo ✓ Shows line numbers and exact content found
echo ✓ Comprehensive troubleshooting if URLs not found
echo.
echo Search format:
echo - Looks for: "https://rebrandking.com/panels/SM4trio/dynam/"
echo - Replaces with: "https://rebrandking.com/panels/SM4trio/sitv/"
echo - Forward slashes treated as literal characters
echo - Uses sed with | delimiter: sed -i "s|old|new|g"
echo.
echo This should match exactly what MT Manager finds!
echo.

set /p OPEN_BROWSER="Run the character-exact URL replacement? (y/n): "
if /i "%OPEN_BROWSER%"=="y" (
    start https://github.com/zonehosting/apk-smart405/actions/workflows/apk-modifier.yml
)

echo.
echo Press any key to exit...
pause >nul
