@echo off
echo ================================================
echo    Adding Panel URL Modification Feature
echo ================================================

cd /d "H:\00-Claude\projects\Apk-Smart405"

echo Adding workflow with panel URL modification capability...
git add .github/workflows/apk-modifier.yml

echo Committing changes...
git commit -m "Add panel URL modification feature - Replace dynam value in rebrandking.com URLs"

echo Pushing to GitHub...
git push origin main

echo.
echo ================================================
echo      🎉 PANEL URL FEATURE ADDED! 🎉
echo ================================================
echo.
echo New feature added:
echo ✓ Panel URL Value input parameter
echo ✓ Automatic detection and replacement of rebrandking.com URLs
echo ✓ Handles both /api/ and non-/api/ URL patterns
echo ✓ Shows count and verification of replaced URLs
echo ✓ Default value: "sitv" (replaces "dynam")
echo.
echo The workflow now accepts 4 parameters:
echo 1. APK file name
echo 2. New package name  
echo 3. New app name
echo 4. Panel URL value (NEW!)
echo.
echo When you run the workflow, enter your desired panel URL value
echo to replace "dynam" in: https://rebrandking.com/panels/SM4trio/VALUE/api/
echo.

set /p OPEN_BROWSER="Open GitHub Actions to test the new feature? (y/n): "
if /i "%OPEN_BROWSER%"=="y" (
    start https://github.com/zonehosting/apk-smart405/actions/workflows/apk-modifier.yml
)

echo.
echo Press any key to exit...
pause >nul
