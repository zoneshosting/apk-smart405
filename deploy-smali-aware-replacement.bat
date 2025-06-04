@echo off
echo ================================================
echo    Smali Format-Aware Panel URL Replacement
echo ================================================

cd /d "H:\00-Claude\projects\Apk-Smart405"

echo Adding smali const-string format-aware URL replacement...
git add .github/workflows/apk-modifier.yml

echo Committing smali-aware search and replace...
git commit -m "Add smali format-aware panel URL replacement based on mConfig.smali analysis"

echo Pushing to GitHub...
git push origin main

echo.
echo ================================================
echo      🎯 SMALI-AWARE SEARCH DEPLOYED! 🎯
echo ================================================
echo.
echo Based on mConfig.smali analysis:
echo ✓ Searches for const-string patterns with rebrandking.com
echo ✓ Looks for quoted URL patterns in smali files
echo ✓ Targets files in smali_classes3 and other smali directories
echo ✓ Three-method replacement approach:
echo   1. const-string format replacement
echo   2. Context-aware dynam replacement in rebrandking URLs
echo   3. Global dynam replacement in rebrandking files
echo ✓ Comprehensive verification of replacements
echo ✓ Checks for remaining dynam instances
echo.
echo Search patterns based on your example:
echo - const-string v0, "https://rebrandking.com/panels/SM4trio/dynam/"
echo - Files like: smali_classes3\com\rtx\smar4\Config\mConfig.smali
echo.
echo This should now find and replace the URLs exactly like
echo you found them in MT Manager!
echo.

set /p OPEN_BROWSER="Run the smali-aware URL replacement workflow? (y/n): "
if /i "%OPEN_BROWSER%"=="y" (
    start https://github.com/zonehosting/apk-smart405/actions/workflows/apk-modifier.yml
)

echo.
echo Press any key to exit...
pause >nul
