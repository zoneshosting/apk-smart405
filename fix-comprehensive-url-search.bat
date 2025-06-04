@echo off
echo ================================================
echo    Comprehensive Panel URL Search Fix
echo ================================================

cd /d "H:\00-Claude\projects\Apk-Smart405"

echo Adding comprehensive multi-directory search for panel URLs...
git add .github/workflows/apk-modifier.yml

echo Committing enhanced search capabilities...
git commit -m "Fix comprehensive panel URL search across all smali directories - like MT Manager search"

echo Pushing to GitHub...
git push origin main

echo.
echo ================================================
echo      🔍 COMPREHENSIVE SEARCH DEPLOYED! 🔍
echo ================================================
echo.
echo Enhanced search capabilities:
echo ✓ Searches ALL smali directories (smali, smali_classes2, smali_classes3, etc.)
echo ✓ Multiple search strategies (rebrandking, SM4trio, dynam, case-insensitive)
echo ✓ Searches both .smali and .xml files
echo ✓ Fixed shell syntax errors in counting logic
echo ✓ Directory-by-directory counting and replacement
echo ✓ Shows comprehensive debugging like MT Manager would
echo ✓ Alternative search approaches when primary search fails
echo.
echo Search strategies implemented:
echo 1. All files for rebrandking.com
echo 2. Specific SM4trio patterns
echo 3. Direct dynam searches
echo 4. XML file searches
echo 5. Case-insensitive searches
echo 6. Partial URL component searches
echo 7. Alternative pattern matching
echo.
echo This should find the URLs just like MT Manager does!
echo.

set /p OPEN_BROWSER="Run the comprehensive search workflow? (y/n): "
if /i "%OPEN_BROWSER%"=="y" (
    start https://github.com/zonehosting/apk-smart405/actions/workflows/apk-modifier.yml
)

echo.
echo Press any key to exit...
pause >nul
