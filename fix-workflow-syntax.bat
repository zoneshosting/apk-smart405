@echo off
echo ===============================================
echo APK Smart405 - Fix Workflow YAML Syntax Error
echo ===============================================
echo.

cd /d "H:\00-Claude\projects\Apk-Smart405"

echo Current directory: %CD%
echo.

echo 🔍 Checking workflow file status...
if exist ".github\workflows\apk-modifier-with-discovery.yml" (
    echo ✅ Found fixed workflow file: .github\workflows\apk-modifier-with-discovery.yml
) else (
    echo ❌ ERROR: Workflow file not found!
    echo Make sure the file exists at: .github\workflows\apk-modifier-with-discovery.yml
    pause
    exit /b 1
)

echo.
echo 📋 Current git status:
git status

echo.
echo 🔄 Adding fixed workflow file to git...
git add .github\workflows\apk-modifier-with-discovery.yml
git add .

echo.
echo 📝 Committing the fix...
git commit -m "Fix YAML syntax error in discovery workflow - Remove invalid ECho statements"

echo.
echo 📤 Pushing changes to GitHub...
git push origin main

if %errorlevel% equ 0 (
    echo.
    echo "✅ SUCCESS! Fixed workflow pushed to GitHub"
    echo.
    echo "🎯 Next Steps:"
    echo "  1. ✅ YAML syntax error fixed and committed"
    echo "  2. 🌐 Go to GitHub Actions: https://github.com/zonehosting/apk-smart405/actions"
    echo "  3. ▶️  Run 'APK Modifier with URL Discovery' workflow"
    echo "  4. 🔍 Check the comprehensive discovery output"
    echo "  5. 📥 Finally see what URLs actually exist in your APK!"
    echo.
    echo "🚀 The workflow should now run without YAML errors!"
) else (
    echo.
    echo "❌ ERROR: Git push failed!"
    echo "Please check your git configuration and try again manually:"
    echo "  git add ."
    echo "  git commit -m 'Fix YAML syntax error in discovery workflow'"
    echo "  git push origin main"
)

echo.
echo "✅ Workflow fix deployment complete!"
echo "Press any key to open GitHub Actions in your browser..."
pause > nul
start https://github.com/zonehosting/apk-smart405/actions

echo.
echo "🎯 Ready to discover what URLs are really in your APK!"
pause