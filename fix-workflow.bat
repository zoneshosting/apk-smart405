@echo off
echo ================================================
echo      Fixing APK Modifier Workflow
echo ================================================

cd /d "H:\00-Claude\projects\Apk-Smart405"

echo Adding fixed workflow file...
git add .github/workflows/apk-modifier.yml

echo Committing fix...
git commit -m "Fix: Clean APK modifier workflow file to resolve GitHub Actions recognition issue"

echo Pushing to GitHub...
git push origin main

echo.
echo ================================================
echo              🎉 WORKFLOW FIXED! 🎉
echo ================================================
echo.
echo The APK Modifier workflow should now appear in your GitHub Actions.
echo Please refresh your GitHub repository page and check the Actions tab.
echo.

set /p OPEN_BROWSER="Open GitHub repository in browser? (y/n): "
if /i "%OPEN_BROWSER%"=="y" (
    start https://github.com/zonehosting/apk-smart405/actions
)

echo.
echo Press any key to exit...
pause >nul
