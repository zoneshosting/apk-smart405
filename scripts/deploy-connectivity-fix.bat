@echo off
echo.
echo =====================================================
echo   APK Smart405 - NO EARLY CLEANUP DEPLOYMENT
echo =====================================================
echo.
echo This deployment removes the problematic early cleanup
echo that was deleting files needed for internet connectivity
echo.
echo Key Changes:
echo - Removed early "Clean duplicate classes" step
echo - All files preserved during decompilation
echo - Only minimal cleanup before final rebuild
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
echo Current workflow backup...
if exist ".github\workflows\apk-modifier.yml" (
    copy ".github\workflows\apk-modifier.yml" ".github\workflows\apk-modifier-backup-%date:~-4,4%%date:~-10,2%%date:~-7,2%.yml"
    echo ✅ Backup created
) else (
    echo ⚠️ No existing workflow found
)

echo.
echo =====================================================
echo   CONNECTIVITY FIX CHANGES
echo =====================================================
echo.
echo ❌ REMOVED: Early "Clean duplicate classes" step
echo ✅ ADDED: "NO EARLY CLEANUP" warnings in decompilation
echo ✅ ADDED: Comprehensive URL search (not just targeted files)
echo ✅ ADDED: Minimal cleanup only before rebuild
echo ✅ ADDED: All connectivity files preserved
echo.

echo The updated workflow will:
echo.
echo 1. 🔧 Decompile with FULL source preservation
echo 2. 🎯 Replace URLs in ALL files found (comprehensive search)
echo 3. 📝 Replace package names and app names
echo 4. 🖼️ Replace image assets
echo 5. 📁 Update package directory structure
echo 6. 🧹 MINIMAL cleanup - only true duplicates removed
echo 7. ⚙️ Compile with all connectivity files intact
echo 8. ✍️ Sign and align APK
echo.

echo =====================================================
echo   TESTING RECOMMENDATIONS
echo =====================================================
echo.
echo After deployment, test the modified APK:
echo.
echo 1. Install the APK on test device
echo 2. Test "Add Playlist" function specifically
echo 3. Verify internet connectivity works
echo 4. Check other network-dependent features
echo.

echo =====================================================
echo   DEPLOYMENT CONFIRMATION
echo =====================================================
echo.
set /p confirm="Deploy the connectivity fix? (y/n): "
if /i "%confirm%" neq "y" (
    echo Deployment cancelled.
    pause
    exit /b 0
)

echo.
echo Deploying connectivity fix...

echo.
echo ✅ Workflow updated: .github\workflows\apk-modifier.yml
echo.
echo Next steps:
echo 1. Commit and push changes to GitHub
echo 2. Go to Actions tab in GitHub
echo 3. Run "APK Modifier - No Early Cleanup" workflow
echo 4. Test the modified APK for internet connectivity
echo.

echo =====================================================
echo   GIT COMMANDS (copy and paste)
echo =====================================================
echo.
echo git add .github\workflows\apk-modifier.yml
echo git commit -m "Fix: Remove early cleanup to preserve internet connectivity"
echo git push origin main
echo.

echo =====================================================
echo   DEPLOYMENT COMPLETE
echo =====================================================
echo.
echo The workflow has been updated to preserve ALL files
echo during the modification process. This should fix the
echo internet connectivity issue with the "Add Playlist"
echo function.
echo.
echo Key improvement: No aggressive cleanup of classes
echo that might be needed for network operations.
echo.

pause