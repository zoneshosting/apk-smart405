@echo off
echo ========================================
echo Manual APK URL Discovery Tool
echo ========================================
echo.

cd /d "H:\00-Claude\projects\Apk-Smart405"

echo 🔍 Quick APK Analysis...
echo.

REM Check if APK exists
if not exist "apk\Dynamic-TV.apk" (
    echo ❌ APK file not found: apk\Dynamic-TV.apk
    echo Available APK files:
    dir apk\*.apk /b
    pause
    exit /b 1
)

echo ✅ Found APK: apk\Dynamic-TV.apk
echo.

REM Create temp directory for extraction
if exist "temp_analysis" rmdir /s /q "temp_analysis"
mkdir "temp_analysis"
cd "temp_analysis"

echo 🔓 Extracting APK as ZIP to check contents...
copy "..\apk\Dynamic-TV.apk" "Dynamic-TV.zip" >nul
powershell -command "Expand-Archive -Path 'Dynamic-TV.zip' -DestinationPath 'extracted' -Force"

echo.
echo 📁 APK Contents Structure:
dir extracted /b

echo.
echo 🔍 Quick URL Search in AndroidManifest.xml...
if exist "extracted\AndroidManifest.xml" (
    echo ✅ Found AndroidManifest.xml
    findstr /i "http" "extracted\AndroidManifest.xml" >nul
    if %errorlevel% equ 0 (
        echo "📡 Found HTTP references in manifest:"
        findstr /i "http" "extracted\AndroidManifest.xml"
    ) else (
        echo "❌ No HTTP references in AndroidManifest.xml"
    )
) else (
    echo "❌ AndroidManifest.xml not found or is binary"
)

echo.
echo 🔍 Looking for any text files with URLs...
for /r "extracted" %%f in (*.txt *.xml *.json *.properties) do (
    if exist "%%f" (
        findstr /i "http" "%%f" >nul 2>&1
        if !errorlevel! equ 0 (
            echo "📡 Found URLs in: %%f"
            findstr /i "http" "%%f"
        )
    )
)

echo.
echo 🔍 Checking for configuration files...
dir extracted /s /b | findstr /i "config"
dir extracted /s /b | findstr /i "setting"
dir extracted /s /b | findstr /i "api"

echo.
echo 🔍 Looking for .dex files (compiled code)...
dir extracted\*.dex /b 2>nul
if %errorlevel% equ 0 (
    echo "✅ Found DEX files - need APKTool to decompile these"
) else (
    echo "❌ No DEX files found"
)

echo.
echo 📊 ANALYSIS SUMMARY:
echo ========================================
echo "APK Size: %~z1 bytes" 
for /f %%i in ('dir extracted /s /-c ^| find "File(s)"') do echo "Total files in APK: %%i"
echo.

echo 🎯 NEXT STEPS:
echo ========================================
echo "1. If no URLs found above, this APK might:"
echo "   - Use dynamically constructed URLs"
echo "   - Have URLs in compiled .dex files (need APKTool)"
echo "   - Be a different version than expected"
echo "   - Not be the target app for rebrandking URLs"
echo.
echo "2. To get full analysis, run the GitHub workflow:"
echo "   'APK Modifier with URL Discovery'"
echo.
echo "3. Consider this might be the wrong APK entirely"
echo "   - Check if this is really a 'rebrandking' related app"
echo "   - Verify the APK source and version"

cd ..
echo.
echo "Press any key to clean up temporary files..."
pause >nul
rmdir /s /q "temp_analysis"

echo.
echo "🔍 Manual discovery complete!"
echo "Run this again anytime to quickly check APK contents."
pause