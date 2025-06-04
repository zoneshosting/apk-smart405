@echo off
echo ================================================
echo    Fixing Panel URL Replacement Logic
echo ================================================

cd /d "H:\00-Claude\projects\Apk-Smart405"

echo Adding improved panel URL detection and replacement...
git add .github/workflows/apk-modifier.yml

echo Committing fix...
git commit -m "Fix panel URL replacement with improved detection and debugging"

echo Pushing to GitHub...
git push origin main

echo.
echo ================================================
echo      🔧 PANEL URL FIX DEPLOYED! 🔧
echo ================================================
echo.
echo Improvements made:
echo ✓ Enhanced URL pattern detection
echo ✓ Added comprehensive debugging output
echo ✓ Multiple search strategies (rebrandking, SM4trio, dynam)
echo ✓ Shows actual file content for investigation
echo ✓ More flexible replacement patterns
echo ✓ Better verification of replacements
echo.
echo The workflow will now:
echo 1. Search broadly for rebrandking.com URLs
echo 2. Look for SM4trio patterns specifically  
echo 3. Find dynam references
echo 4. Show actual content found
echo 5. Attempt flexible replacement
echo 6. Verify and report results
echo.

set /p OPEN_BROWSER="Run the fixed workflow now? (y/n): "
if /i "%OPEN_BROWSER%"=="y" (
    start https://github.com/zonehosting/apk-smart405/actions/workflows/apk-modifier.yml
)

echo.
echo Press any key to exit...
pause >nul
