@echo off
echo ===============================================
echo APK Smart405 - URL Discovery Deployment Script
echo ===============================================
echo.

cd /d "H:\00-Claude\projects\Apk-Smart405"

echo Current directory: %CD%
echo.

echo 📁 Creating scripts directory if it doesn't exist...
if not exist "scripts" mkdir scripts
echo.

echo 🔍 Creating URL discovery script...
(
echo # APK URL Discovery and Analysis Script
echo # Add this section to your GitHub Actions workflow for debugging
echo.
echo echo "🔍 COMPREHENSIVE URL DISCOVERY"
echo echo "======================================="
echo.
echo # 1. Find ANY references to common URL patterns
echo echo "📡 Searching for HTTP/HTTPS URLs..."
echo find decoded -name "*.smali" -exec grep -l "https\?://" {} \; ^| head -20
echo echo ""
echo.
echo # 2. Look for ANY domain references 
echo echo "🌐 Searching for domain references..."
echo find decoded -name "*.smali" -exec grep -n -H "\.com\|\.net\|\.org" {} \; ^| head -20
echo echo ""
echo.
echo # 3. Search for rebrandking specifically ^(any case^)
echo echo "🎯 Searching for 'rebrandking' ^(any case^)..."
echo find decoded -name "*.smali" -exec grep -i -n -H "rebrandking" {} \;
echo echo ""
echo.
echo # 4. Search for 'panel' references
echo echo "📋 Searching for 'panel' references..."
echo find decoded -name "*.smali" -exec grep -i -n -H "panel" {} \; ^| head -10
echo echo ""
echo.
echo # 5. Look for network/API related strings
echo echo "🔗 Searching for API/network strings..."
echo find decoded -name "*.smali" -exec grep -i -n -H -E "^(api^|endpoint^|server^|host^|url^)" {} \; ^| head -15
echo echo ""
echo.
echo # 6. Search for const-string patterns with URLs
echo echo "🧵 Searching for const-string URL patterns..."
echo find decoded -name "*.smali" -exec grep -n -A1 -B1 "const-string.*http" {} \; ^| head -20
echo echo ""
echo.
echo # 7. Look in specific configuration-related files
echo echo "⚙️ Checking configuration files..."
echo find decoded -name "*onfig*.smali" -exec ls -la {} \;
echo find decoded -name "*onfig*.smali" -exec grep -n -H "const-string" {} \; ^| head -10
echo echo ""
echo.
echo # 8. Check XML files for URLs
echo echo "📄 Checking XML files for URLs..."
echo find decoded -name "*.xml" -exec grep -i -n -H "http" {} \; ^| head -10
echo echo ""
echo.
echo # 9. Search for Dynamic TV or TV related strings
echo echo "📺 Searching for TV-related strings..."
echo find decoded -name "*.smali" -exec grep -i -n -H -E "^(dynamic^|tv^|stream^|live^)" {} \; ^| head -15
echo echo ""
echo.
echo # 10. Look for base64 or encoded content that might contain URLs
echo echo "🔐 Searching for potentially encoded content..."
echo find decoded -name "*.smali" -exec grep -n -H -E "[A-Za-z0-9+/]{20,}" {} \; ^| head -10
echo echo ""
echo.
echo # 11. Check AndroidManifest.xml for network permissions and URLs
echo echo "📱 Checking AndroidManifest.xml..."
echo if [ -f "decoded/AndroidManifest.xml" ]; then
echo     echo "Network permissions:"
echo     grep -i "internet\|network" decoded/AndroidManifest.xml
echo     echo "Any URLs in manifest:"
echo     grep -i "http" decoded/AndroidManifest.xml
echo fi
echo echo ""
echo.
echo # 12. List all files that contain string constants
echo echo "📝 Files with string constants ^(first 30^)..."
echo find decoded -name "*.smali" -exec grep -l "const-string" {} \; ^| head -30
echo echo ""
echo.
echo # 13. Summary of what we found
echo echo "📊 DISCOVERY SUMMARY"
echo echo "======================================="
echo echo "Total smali files: $^(find decoded -name "*.smali" ^| wc -l^)"
echo echo "Files with const-string: $^(find decoded -name "*.smali" -exec grep -l "const-string" {} \; ^| wc -l^)"
echo echo "Files with HTTP URLs: $^(find decoded -name "*.smali" -exec grep -l "https\?://" {} \; ^| wc -l^)"
echo echo "Config-related files: $^(find decoded -name "*onfig*.smali" ^| wc -l^)"
echo echo ""
echo.
echo # 14. Create a comprehensive URL list
echo echo "📋 Creating comprehensive URL inventory..."
echo echo "All URLs found in the APK:" ^> url_inventory.txt
echo find decoded -name "*.smali" -exec grep -h -o "https\?://[^\"'[:space:]]*" {} \; ^>^> url_inventory.txt
echo find decoded -name "*.xml" -exec grep -h -o "https\?://[^\"'[:space:]]*" {} \; ^>^> url_inventory.txt
echo sort -u url_inventory.txt
echo echo ""
echo echo "✅ URL inventory saved to url_inventory.txt"
echo echo "📁 Check the artifact for complete results"
) > "scripts\url-discovery.sh"

echo ✅ URL discovery script created at: scripts\url-discovery.sh
echo.

echo 🔧 Creating enhanced workflow file...
(
echo name: APK Modifier with URL Discovery
echo.
echo on:
echo   workflow_dispatch:
echo     inputs:
echo       apk_file:
echo         description: 'APK file name in apk/ folder'
echo         required: true
echo         default: 'Dynamic-TV.apk'
echo       package_name:
echo         description: 'New package name'
echo         required: true
echo         default: 'com.sitv.live'
echo       app_name:
echo         description: 'New app name'
echo         required: true
echo         default: 'SI TV'
echo       panel_url_value:
echo         description: 'Panel URL value to replace dynam'
echo         required: true
echo         default: 'sitv'
echo.
echo jobs:
echo   modify_apk:
echo     runs-on: ubuntu-latest
echo     
echo     steps:
echo     - name: 📥 Checkout Repository
echo       uses: actions/checkout@v4
echo.
echo     - name: ☕ Set up JDK 11
echo       uses: actions/setup-java@v3
echo       with:
echo         java-version: '11'
echo         distribution: 'temurin'
echo.
echo     - name: 🔧 Install APKTool
echo       run: ^|
echo         wget https://raw.githubusercontent.com/iBotPeaches/Apktool/master/scripts/linux/apktool
echo         wget https://bitbucket.org/iBotPeaches/apktool/downloads/apktool_2.9.3.jar
echo         chmod +x apktool
echo         sudo mv apktool /usr/local/bin/
echo         sudo mv apktool_2.9.3.jar /usr/local/bin/apktool.jar
echo.
echo     - name: 📋 Validate Input APK
echo       run: ^|
echo         if [ ! -f "apk/${{ github.event.inputs.apk_file }}" ]; then
echo           echo "❌ ERROR: APK file not found: apk/${{ github.event.inputs.apk_file }}"
echo           exit 1
echo         fi
echo         echo "✅ Found APK: apk/${{ github.event.inputs.apk_file }}"
echo         ls -la "apk/${{ github.event.inputs.apk_file }}"
echo.
echo     - name: 🔓 Decompile APK with Discovery
echo       run: ^|
echo         echo "🔓 Starting APK decompilation..."
echo         
echo         # Multi-fallback decompilation strategy
echo         if apktool d "apk/${{ github.event.inputs.apk_file }}" -o decoded --no-src; then
echo           echo "✅ Decompilation successful with --no-src"
echo         elif apktool d "apk/${{ github.event.inputs.apk_file }}" -o decoded --only-main-classes; then
echo           echo "✅ Decompilation successful with --only-main-classes"
echo         elif apktool d "apk/${{ github.event.inputs.apk_file }}" -o decoded --no-debug-info; then
echo           echo "✅ Decompilation successful with --no-debug-info"
echo         else
echo           echo "❌ All decompilation methods failed"
echo           exit 1
echo         fi
echo         
echo         echo "📁 Decompiled structure:"
echo         ls -la decoded/
echo.
echo     - name: 🔍 COMPREHENSIVE URL DISCOVERY
echo       run: ^|
echo         echo "🔍 COMPREHENSIVE URL DISCOVERY"
echo         echo "======================================="
echo         
echo         # 1. Find ANY references to common URL patterns
echo         echo "📡 Searching for HTTP/HTTPS URLs..."
echo         find decoded -name "*.smali" -exec grep -l "https\?://" {} \; ^| head -20
echo         echo ""
echo         
echo         # 2. Look for ANY domain references 
echo         echo "🌐 Searching for domain references..."
echo         find decoded -name "*.smali" -exec grep -n -H "\.com\^|\.net\^|\.org" {} \; ^| head -20
echo         echo ""
echo         
echo         # 3. Search for rebrandking specifically ^(any case^)
echo         echo "🎯 Searching for 'rebrandking' ^(any case^)..."
echo         find decoded -name "*.smali" -exec grep -i -n -H "rebrandking" {} \;
echo         echo ""
echo         
echo         # 4. Search for 'panel' references
echo         echo "📋 Searching for 'panel' references..."
echo         find decoded -name "*.smali" -exec grep -i -n -H "panel" {} \; ^| head -10
echo         echo ""
echo         
echo         # 5. Look for network/API related strings
echo         echo "🔗 Searching for API/network strings..."
echo         find decoded -name "*.smali" -exec grep -i -n -H -E "^(api^|endpoint^|server^|host^|url^)" {} \; ^| head -15
echo         echo ""
echo         
echo         # 6. Search for const-string patterns with URLs
echo         echo "🧵 Searching for const-string URL patterns..."
echo         find decoded -name "*.smali" -exec grep -n -A1 -B1 "const-string.*http" {} \; ^| head -20
echo         echo ""
echo         
echo         # 7. Look in specific configuration-related files
echo         echo "⚙️ Checking configuration files..."
echo         find decoded -name "*onfig*.smali" -exec ls -la {} \;
echo         find decoded -name "*onfig*.smali" -exec grep -n -H "const-string" {} \; ^| head -10
echo         echo ""
echo         
echo         # 8. Check XML files for URLs
echo         echo "📄 Checking XML files for URLs..."
echo         find decoded -name "*.xml" -exec grep -i -n -H "http" {} \; ^| head -10
echo         echo ""
echo         
echo         # 9. Search for Dynamic TV or TV related strings
echo         echo "📺 Searching for TV-related strings..."
echo         find decoded -name "*.smali" -exec grep -i -n -H -E "^(dynamic^|tv^|stream^|live^)" {} \; ^| head -15
echo         echo ""
echo         
echo         # 10. Check AndroidManifest.xml
echo         echo "📱 Checking AndroidManifest.xml..."
echo         if [ -f "decoded/AndroidManifest.xml" ]; then
echo           echo "Network permissions:"
echo           grep -i "internet\^|network" decoded/AndroidManifest.xml ^|^| echo "No network permissions found"
echo           echo "Any URLs in manifest:"
echo           grep -i "http" decoded/AndroidManifest.xml ^|^| echo "No URLs in manifest"
echo         fi
echo         echo ""
echo         
echo         # 11. Summary
echo         echo "📊 DISCOVERY SUMMARY"
echo         echo "======================================="
echo         echo "Total smali files: $^(find decoded -name "*.smali" ^| wc -l^)"
echo         echo "Files with const-string: $^(find decoded -name "*.smali" -exec grep -l "const-string" {} \; ^| wc -l^)"
echo         echo "Files with HTTP URLs: $^(find decoded -name "*.smali" -exec grep -l "https\?://" {} \; ^| wc -l^)"
echo         echo "Config-related files: $^(find decoded -name "*onfig*.smali" ^| wc -l^)"
echo         
echo         # 12. Create URL inventory
echo         echo "📋 Creating comprehensive URL inventory..."
echo         echo "All URLs found in the APK:" ^> url_inventory.txt
echo         find decoded -name "*.smali" -exec grep -h -o "https\?://[^\"'[:space:]]*" {} \; ^>^> url_inventory.txt 2^>/dev/null ^|^| true
echo         find decoded -name "*.xml" -exec grep -h -o "https\?://[^\"'[:space:]]*" {} \; ^>^> url_inventory.txt 2^>/dev/null ^|^| true
echo         if [ -s url_inventory.txt ]; then
echo           sort -u url_inventory.txt
echo           echo ""
echo           echo "✅ URL inventory created with $^(sort -u url_inventory.txt ^| wc -l^) unique URLs"
echo         else
echo           echo "❌ No URLs found in the APK"
echo         fi
echo.
echo     - name: 📤 Upload Discovery Results
echo       uses: actions/upload-artifact@v3
echo       with:
echo         name: url-discovery-results
echo         path: ^|
echo           url_inventory.txt
echo           decoded/AndroidManifest.xml
echo         if-no-files-found: warn
echo.
echo     - name: 🎯 Continue with Original URL Replacement ^(if URLs found^)
echo       run: ^|
echo         echo "🎯 Attempting original URL replacement strategy..."
echo         
echo         # Check if we found any URLs at all
echo         if [ -s url_inventory.txt ]; then
echo           echo "✅ URLs found in APK, proceeding with replacement attempt..."
echo           
echo           # Your original URL replacement logic here
echo           echo "Target: dynam ^-^> ${{ github.event.inputs.panel_url_value }}"
echo           echo "Using exact character matching ^(forward slashes /dynam/, not \/dynam\/^)"
echo           
echo           URL1="https://rebrandking.com/panels/SM4trio/dynam/"
echo           URL2="https://rebrandking.com/panels/SM4trio/dynam/api/"
echo           
echo           NEW_URL1="https://rebrandking.com/panels/SM4trio/${{ github.event.inputs.panel_url_value }}/"
echo           NEW_URL2="https://rebrandking.com/panels/SM4trio/${{ github.event.inputs.panel_url_value }}/api/"
echo           
echo           echo "Searching for URL1: $URL1"
echo           find decoded -name "*.smali" -exec grep -l "$URL1" {} \; ^|^| echo "❌ URL1 not found"
echo           
echo           echo "Searching for URL2: $URL2"
echo           find decoded -name "*.smali" -exec grep -l "$URL2" {} \; ^|^| echo "❌ URL2 not found"
echo           
echo         else
echo           echo "❌ No URLs found in APK - cannot proceed with URL replacement"
echo           echo "📋 Manual investigation required to find actual URL patterns"
echo         fi
) > ".github\workflows\apk-modifier-with-discovery.yml"

echo ✅ Enhanced workflow created at: .github\workflows\apk-modifier-with-discovery.yml
echo.

echo 📋 Creating README update...
(
echo # URL Discovery Enhancement
echo.
echo This enhancement adds comprehensive URL discovery to the APK Smart405 workflow.
echo.
echo ## New Files Added:
echo - `scripts/url-discovery.sh` - Standalone discovery script
echo - `.github/workflows/apk-modifier-with-discovery.yml` - Enhanced workflow with discovery
echo.
echo ## What the Discovery Does:
echo 1. **Finds ALL HTTP/HTTPS URLs** in the decompiled APK
echo 2. **Searches for domain references** ^(.com, .net, .org^)
echo 3. **Looks for specific keywords** ^(rebrandking, panel, api, etc.^)
echo 4. **Checks configuration files** for URL patterns
echo 5. **Analyzes AndroidManifest.xml** for network permissions
echo 6. **Creates URL inventory** of all found URLs
echo.
echo ## Usage:
echo 1. Run the "APK Modifier with URL Discovery" workflow
echo 2. Check the logs for comprehensive URL analysis
echo 3. Download the "url-discovery-results" artifact
echo 4. Use the findings to understand actual URL patterns in your APK
echo.
echo ## Expected Output:
echo - Complete list of all URLs found in the APK
echo - File locations where URLs are stored
echo - Network configuration analysis
echo - Recommendations for actual URL replacement strategy
) > "URL_DISCOVERY_README.md"

echo ✅ Documentation created at: URL_DISCOVERY_README.md
echo.

echo 🚀 Adding and committing files to git...
git add .
git status

echo.
echo "🔄 Committing changes to git..."
git add .
git commit -m "Add comprehensive URL discovery system - Debug APK URL replacement issues"
echo.

echo "📤 Pushing changes to GitHub..."
git push origin main
echo.

if %errorlevel% equ 0 (
    echo "✅ SUCCESS! All changes pushed to GitHub"
    echo.
    echo "🎯 Next Steps:"
    echo "  1. ✅ Files created and committed automatically"
    echo "  2. 🌐 Go to GitHub Actions: https://github.com/zonehosting/apk-smart405/actions"
    echo "  3. ▶️  Run 'APK Modifier with URL Discovery' workflow"
    echo "  4. 🔍 Check the logs for detailed URL analysis"
    echo "  5. 📥 Download the discovery artifacts"
    echo "  6. 🔧 Use the findings to build a working URL replacement strategy"
    echo.
    echo "🚀 Ready to discover what URLs actually exist in your APK!"
) else (
    echo "❌ ERROR: Git push failed!"
    echo "Please check your git configuration and try again manually:"
    echo "  git add ."
    echo "  git commit -m 'Add comprehensive URL discovery system'"
    echo "  git push origin main"
)
echo.
echo "✅ URL Discovery deployment complete!"
echo "Press any key to open GitHub Actions in your browser..."
pause > nul
start https://github.com/zonehosting/apk-smart405/actions