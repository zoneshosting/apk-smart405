@echo off
echo.
echo =====================================================
echo   APK Smart405 - COMMIT CONNECTIVITY FIX
echo =====================================================
echo.
echo This script will commit the connectivity fix changes
echo to your GitHub repository.
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
echo   CURRENT STATUS CHECK
echo =====================================================
echo.

echo Checking git status...
git status

echo.
echo =====================================================
echo   FILES TO BE COMMITTED
echo =====================================================
echo.
echo The following changes will be committed:
echo.
echo ✅ .github\workflows\apk-modifier.yml (Updated - No Early Cleanup)
echo ✅ scripts\deploy-connectivity-fix.bat (New deployment script)
echo ✅ scripts\commit-connectivity-fix.bat (New commit script)
echo.

echo =====================================================
echo   COMMIT CONFIRMATION
echo =====================================================
echo.
set /p confirm="Commit and push the connectivity fix? (y/n): "
if /i "%confirm%" neq "y" (
    echo Commit cancelled.
    pause
    exit /b 0
)

echo.
echo =====================================================
echo   COMMITTING CHANGES
echo =====================================================
echo.

echo Adding modified workflow file...
git add .github\workflows\apk-modifier.yml
if %errorlevel% neq 0 (
    echo ERROR: Failed to add workflow file
    pause
    exit /b 1
)

echo Adding deployment script...
git add scripts\deploy-connectivity-fix.bat
if %errorlevel% neq 0 (
    echo ERROR: Failed to add deployment script
    pause
    exit /b 1
)

echo Adding commit script...
git add scripts\commit-connectivity-fix.bat
if %errorlevel% neq 0 (
    echo ERROR: Failed to add commit script
    pause
    exit /b 1
)

echo Committing changes...
git commit -m "Fix: Remove early cleanup to preserve internet connectivity

- Removed problematic early 'Clean duplicate classes' step
- Preserved ALL files during decompilation process
- Added comprehensive URL search across all smali files
- Minimal cleanup only before final rebuild
- Should fix 'Add Playlist' internet connectivity issue
- Added deployment and commit scripts for future updates"

if %errorlevel% neq 0 (
    echo ERROR: Failed to commit changes
    pause
    exit /b 1
)

echo.
echo =====================================================
echo   PUSHING TO GITHUB
echo =====================================================
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
echo   COMMIT SUCCESSFUL!
echo =====================================================
echo.
echo ✅ Changes committed and pushed to GitHub successfully!
echo.
echo Next steps:
echo.
echo 1. Go to your GitHub repository: 
echo    https://github.com/zonehosting/apk-smart405
echo.
echo 2. Navigate to the Actions tab
echo.
echo 3. Look for "APK Modifier - No Early Cleanup" workflow
echo.
echo 4. Click "Run workflow" and test with your parameters:
echo    - APK file: Dynamic-TV.apk
echo    - Package name: com.sitv.live (or your custom package)
echo    - App name: SI TV (or your custom name)
echo    - Panel URL value: sitv (or your custom value)
echo.
echo 5. After the workflow completes, download and test the APK
echo    specifically for internet connectivity and "Add Playlist"
echo.

echo =====================================================
echo   TESTING CHECKLIST
echo =====================================================
echo.
echo When testing the modified APK:
echo.
echo ✅ Install APK on test device
echo ✅ Open the app
echo ✅ Try "Add Playlist" function
echo ✅ Verify internet connectivity works
echo ✅ Test other network features
echo ✅ Confirm URLs were replaced correctly
echo ✅ Verify branding/images updated
echo.

echo If the connectivity issue is resolved, this fix can be
echo used for all future APK modifications!
echo.

pause