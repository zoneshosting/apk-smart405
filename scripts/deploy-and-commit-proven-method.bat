@echo off
echo.
echo =====================================================
echo   APK Smart405 - DEPLOY PROVEN METHOD (ALL-IN-ONE)
echo =====================================================
echo.
echo This script will deploy the proven method and commit to GitHub
echo.
echo Key Changes:
echo - Uses exact URL replacement method from working runs
echo - NO early duplicate class cleanup 
echo - ALL files preserved during decompilation
echo - Simple shell operations without arithmetic errors
echo - Maximum compatibility for internet connectivity
echo.

cd /d "%~dp0\.."

echo Checking current directory...
if not exist ".github\workflows" (
    echo ERROR: Not in the correct directory! 
    echo Please run this from the Apk-Smart405 root directory
    pause
    exit /b 1
)

echo.
echo =====================================================
echo   CURRENT STATUS
echo =====================================================
echo.

echo Checking git status...
git status

echo.
echo Current workflow backup...
if exist ".github\workflows\apk-modifier.yml" (
    copy ".github\workflows\apk-modifier.yml" ".github\workflows\apk-modifier-backup-%date:~-4,4%%date:~-10,2%%date:~-7,2%.yml"
    echo ✅ Backup created
) else (
    echo ⚠️ No existing workflow found
)

echo.
echo =====================================================
echo   PROVEN METHOD CHANGES
echo =====================================================
echo.
echo ❌ REMOVED: Complex arithmetic operations that caused errors
echo ❌ REMOVED: Early "Clean duplicate classes" step
echo ✅ ADDED: Proven URL replacement method from successful runs
echo ✅ ADDED: Full file preservation during decompilation
echo ✅ ADDED: Simple shell operations without counting errors
echo ✅ ADDED: All connectivity files preserved
echo.

echo Expected results:
echo ✅ No more "integer expression expected" errors
echo ✅ No more "syntax error in expression" errors
echo ✅ Working "Add Playlist" internet connectivity
echo ✅ Proper panel URL replacement (dynam → your_value)
echo ✅ All branding and images updated correctly
echo.

echo =====================================================
echo   FILES TO BE COMMITTED
echo =====================================================
echo.
echo The following changes will be committed:
echo.
echo ✅ .github\workflows\apk-modifier.yml (Updated - Proven Method)
echo ✅ scripts\deploy-and-commit-proven-method.bat (This script)
echo.

echo =====================================================
echo   FINAL CONFIRMATION
echo =====================================================
echo.
set /p confirm="Deploy proven method and commit to GitHub? (y/n): "
if /i "%confirm%" neq "y" (
    echo Operation cancelled.
    pause
    exit /b 0
)

echo.
echo =====================================================
echo   DEPLOYING AND COMMITTING
echo =====================================================
echo.

echo Adding modified workflow file...
git add .github\workflows\apk-modifier.yml
if %errorlevel% neq 0 (
    echo ERROR: Failed to add workflow file
    pause
    exit /b 1
)

echo Adding this deployment script...
git add scripts\deploy-and-commit-proven-method.bat
if %errorlevel% neq 0 (
    echo ERROR: Failed to add deployment script
    pause
    exit /b 1
)

echo Committing changes...
git commit -m "Fix: Use proven URL replacement method + preserve connectivity - Should fix Add Playlist internet function and eliminate shell arithmetic errors"

if %errorlevel% neq 0 (
    echo ERROR: Failed to commit changes
    pause
    exit /b 1
)

echo.
echo Pushing to origin main...
git push origin main

if %errorlevel% neq 0 (
    echo ERROR: Failed to push to GitHub
    echo.
    echo This might be because:
    echo 1. No internet connection
    echo 2. Authentication required
    echo 3. Remote repository issues
    echo.
    echo You can try pushing manually later with:
    echo git push origin main
    pause
    exit /b 1
)

echo.
echo =====================================================
echo   SUCCESS! DEPLOYMENT COMPLETE
echo =====================================================
echo.
echo ✅ Proven method deployed and committed to GitHub!
echo.
echo Next steps:
echo.
echo 1. Go to your GitHub repository: 
echo    https://github.com/zonehosting/apk-smart405
echo.
echo 2. Navigate to the Actions tab
echo.
echo 3. Look for "APK Modifier - Proven Method" workflow
echo.
echo 4. Click "Run workflow" and test with your parameters:
echo    - APK file: Dynamic-TV.apk
echo    - Package name: com.sitv.live (or your custom package)
echo    - App name: SI TV (or your custom name)
echo    - Panel URL value: sitv (or your custom value)
echo.
echo 5. After the workflow completes (~5-10 minutes):
echo    - Download the "modified-apk-proven-method-XXX" artifact
echo    - Install modified_signed_aligned.apk on test device
echo    - Test "Add Playlist" function for internet connectivity
echo.

echo =====================================================
echo   TESTING CHECKLIST
echo =====================================================
echo.
echo When testing the modified APK:
echo.
echo ✅ Install APK on test device
echo ✅ Open the app and verify it launches
echo ✅ Try "Add Playlist" function specifically
echo ✅ Verify internet connectivity works
echo ✅ Test other network-dependent features
echo ✅ Confirm URLs were replaced correctly
echo ✅ Verify branding/images updated
echo.

echo =====================================================
echo   TECHNICAL SUMMARY
echo =====================================================
echo.
echo This fix combines:
echo.
echo ✅ Proven URL replacement method from successful runs
echo ✅ Full file preservation to maintain connectivity
echo ✅ Simple shell operations without arithmetic errors
echo ✅ No early cleanup that was deleting network classes
echo.
echo Expected result: APK with working internet connectivity,
echo proper URL replacement, and no workflow errors.
echo.

echo If the internet connectivity issue is resolved,
echo this proven method will be your go-to solution for
echo all future APK modifications!
echo.

echo Press any key to open GitHub Actions in browser...
pause >nul

start https://github.com/zonehosting/apk-smart405/actions

echo.
echo Browser should have opened to GitHub Actions.
echo Look for "APK Modifier - Proven Method" and click "Run workflow"
echo.

pause