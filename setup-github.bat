@echo off
setlocal enabledelayedexpansion

echo ================================================
echo          APK Smart405 - GitHub Setup
echo ================================================
echo.

REM Change to the project directory
cd /d "H:\00-Claude\projects\Apk-Smart405"

REM Check if we're in the right directory
if not exist "apk\Dynamic-TV.apk" (
    echo ERROR: Cannot find Dynamic-TV.apk in apk folder
    echo Make sure you're running this from the correct directory
    pause
    exit /b 1
)

echo Current directory: %CD%
echo.

REM Prompt for GitHub repository details
set /p GITHUB_USERNAME="Enter your GitHub username: "
set /p REPO_NAME="Enter repository name (default: apk-smart405): "
if "%REPO_NAME%"=="" set REPO_NAME=apk-smart405

echo.
echo Repository will be created as: https://github.com/!GITHUB_USERNAME!/!REPO_NAME!
echo.
set /p CONFIRM="Continue? (y/n): "
if /i not "%CONFIRM%"=="y" (
    echo Cancelled by user
    pause
    exit /b 0
)

echo.
echo ================================================
echo Step 1: Initializing Git Repository
echo ================================================

REM Initialize git repository
git init
if !errorlevel! neq 0 (
    echo ERROR: Failed to initialize git repository
    echo Make sure Git is installed and in your PATH
    pause
    exit /b 1
)

echo ✓ Git repository initialized

REM Add all files
echo.
echo Adding files to git...
git add .
if !errorlevel! neq 0 (
    echo ERROR: Failed to add files to git
    pause
    exit /b 1
)

echo ✓ Files added to git

REM Create initial commit
echo.
echo Creating initial commit...
git commit -m "Initial commit: APK Smart405 modifier with Dynamic-TV.apk and replacement images"
if !errorlevel! neq 0 (
    echo ERROR: Failed to create initial commit
    pause
    exit /b 1
)

echo ✓ Initial commit created

REM Set main branch
git branch -M main
echo ✓ Main branch set

echo.
echo ================================================
echo Step 2: Creating GitHub Repository
echo ================================================

REM Check if GitHub CLI is available
where gh >nul 2>nul
if !errorlevel! equ 0 (
    echo GitHub CLI detected. Creating repository...
    gh repo create !REPO_NAME! --public --description "APK modifier for Dynamic TV - automated package name, app name, and image replacement"
    if !errorlevel! equ 0 (
        echo ✓ GitHub repository created successfully
        set REPO_CREATED=true
    ) else (
        echo ⚠ GitHub CLI failed to create repository
        set REPO_CREATED=false
    )
) else (
    echo GitHub CLI not found. You'll need to create the repository manually.
    set REPO_CREATED=false
)

echo.
echo ================================================
echo Step 3: Adding Remote and Pushing to GitHub
echo ================================================

REM Add remote origin
git remote add origin https://github.com/!GITHUB_USERNAME!/!REPO_NAME!.git
if !errorlevel! neq 0 (
    echo ERROR: Failed to add remote origin
    pause
    exit /b 1
)

echo ✓ Remote origin added

REM Push to GitHub
echo.
echo Pushing to GitHub...
git push -u origin main
if !errorlevel! neq 0 (
    echo.
    echo ⚠ Push failed. This might be because:
    echo   1. The repository doesn't exist on GitHub
    echo   2. You need to authenticate with GitHub
    echo   3. The repository name already exists
    echo.
    if "%REPO_CREATED%"=="false" (
        echo Please:
        echo 1. Go to https://github.com/new
        echo 2. Create a repository named: !REPO_NAME!
        echo 3. Don't initialize with README, .gitignore, or license
        echo 4. Then run: git push -u origin main
        echo.
    )
    echo Manual push command: git push -u origin main
    pause
    exit /b 1
)

echo ✓ Successfully pushed to GitHub!

echo.
echo ================================================
echo              🎉 SUCCESS! 🎉
echo ================================================
echo.
echo Repository created and pushed to:
echo https://github.com/!GITHUB_USERNAME!/!REPO_NAME!
echo.
echo Next steps:
echo 1. Visit your repository on GitHub
echo 2. Go to Actions tab
echo 3. Run the "APK Modifier" workflow
echo 4. Download the modified APK from the artifacts
echo.
echo Repository contains:
echo ✓ Dynamic-TV.apk in apk/ folder
echo ✓ 15 replacement images in images-to-replace/ folder
echo ✓ GitHub Action workflow for APK modification
echo ✓ Complete documentation in README.md
echo.

REM Open GitHub repository in browser
set /p OPEN_BROWSER="Open repository in browser? (y/n): "
if /i "%OPEN_BROWSER%"=="y" (
    start https://github.com/!GITHUB_USERNAME!/!REPO_NAME!
)

echo.
echo Setup complete! Press any key to exit...
pause >nul
