@echo off
setlocal enabledelayedexpansion

echo ================================================
echo      APK Smart405 - Fix and Update Repository
echo ================================================
echo.

REM Change to the project directory
cd /d "H:\00-Claude\projects\Apk-Smart405"

echo Current directory: %CD%
echo.

REM Check if git repository exists
if not exist ".git" (
    echo ERROR: This is not a git repository
    echo Please run setup-github.bat first
    pause
    exit /b 1
)

echo Checking git status...
git status --porcelain

echo.
echo ================================================
echo Step 1: Adding Updated Files
echo ================================================

REM Add the updated files
git add .github/workflows/apk-modifier.yml
git add .github/workflows/test-setup.yml

echo ✓ Updated workflow files added

echo.
echo ================================================
echo Step 2: Committing Changes
echo ================================================

REM Commit the changes
git commit -m "Fix: Updated APK modifier workflow with better error handling and test workflow

- Enhanced error handling and logging
- Added workflow verification steps
- Improved package structure handling  
- Added test workflow to verify repository setup
- Fixed potential issues with APK processing"

if !errorlevel! neq 0 (
    echo ERROR: Failed to commit changes
    pause
    exit /b 1
)

echo ✓ Changes committed successfully

echo.
echo ================================================
echo Step 3: Pushing to GitHub
echo ================================================

REM Push the changes
git push origin main

if !errorlevel! neq 0 (
    echo ERROR: Failed to push changes
    echo Please check your internet connection and GitHub authentication
    pause
    exit /b 1
)

echo ✓ Changes pushed to GitHub successfully

echo.
echo ================================================
echo              🎉 UPDATE COMPLETE! 🎉
echo ================================================
echo.
echo Changes made:
echo ✓ Fixed APK modifier workflow with better error handling
echo ✓ Added test workflow to verify repository setup
echo ✓ Enhanced logging and debugging output
echo ✓ Improved package structure handling
echo.
echo Next steps:
echo 1. Visit your GitHub repository
echo 2. The test workflow should run automatically
echo 3. Check the Actions tab to see if everything passes
echo 4. If tests pass, run the APK Modifier workflow manually
echo.

REM Get repository URL for convenience
for /f "tokens=2 delims= " %%i in ('git remote get-url origin') do set REPO_URL=%%i
set REPO_URL=!REPO_URL:.git=!

echo Repository: !REPO_URL!
echo Actions: !REPO_URL!/actions

set /p OPEN_BROWSER="Open GitHub repository in browser? (y/n): "
if /i "%OPEN_BROWSER%"=="y" (
    start !REPO_URL!
)

echo.
echo Update complete! Press any key to exit...
pause >nul
