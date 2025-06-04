# APK URL Discovery and Analysis Script
# Add this section to your GitHub Actions workflow for debugging

echo "🔍 COMPREHENSIVE URL DISCOVERY"
echo "======================================="

# 1. Find ANY references to common URL patterns
echo "📡 Searching for HTTP/HTTPS URLs..."
find decoded -name "*.smali" -exec grep -l "https\?://" {} \; | head -20
echo ""

# 2. Look for ANY domain references 
echo "🌐 Searching for domain references..."
find decoded -name "*.smali" -exec grep -n -H "\.com\|\.net\|\.org" {} \; | head -20
echo ""

# 3. Search for rebrandking specifically (any case)
echo "🎯 Searching for 'rebrandking' ^(any case^)..."
find decoded -name "*.smali" -exec grep -i -n -H "rebrandking" {} \;
echo ""

# 4. Search for 'panel' references
echo "📋 Searching for 'panel' references..."
find decoded -name "*.smali" -exec grep -i -n -H "panel" {} \; | head -10
echo ""

# 5. Look for network/API related strings
echo "🔗 Searching for API/network strings..."
find decoded -name "*.smali" -exec grep -i -n -H -E "^(api^|endpoint^|server^|host^|url^)" {} \; | head -15
echo ""

# 6. Search for const-string patterns with URLs
echo "🧵 Searching for const-string URL patterns..."
find decoded -name "*.smali" -exec grep -n -A1 -B1 "const-string.*http" {} \; | head -20
echo ""

# 7. Look in specific configuration-related files
echo "⚙️ Checking configuration files..."
find decoded -name "*onfig*.smali" -exec ls -la {} \;
find decoded -name "*onfig*.smali" -exec grep -n -H "const-string" {} \; | head -10
echo ""

# 8. Check XML files for URLs
echo "📄 Checking XML files for URLs..."
find decoded -name "*.xml" -exec grep -i -n -H "http" {} \; | head -10
echo ""

# 9. Search for Dynamic TV or TV related strings
echo "📺 Searching for TV-related strings..."
find decoded -name "*.smali" -exec grep -i -n -H -E "^(dynamic^|tv^|stream^|live^)" {} \; | head -15
echo ""

# 10. Look for base64 or encoded content that might contain URLs
echo "🔐 Searching for potentially encoded content..."
find decoded -name "*.smali" -exec grep -n -H -E "[A-Za-z0-9+/]{20,}" {} \; | head -10
echo ""

# 11. Check AndroidManifest.xml for network permissions and URLs
echo "📱 Checking AndroidManifest.xml..."
if [ -f "decoded/AndroidManifest.xml" ]; then
    echo "Network permissions:"
    grep -i "internet\|network" decoded/AndroidManifest.xml
    echo "Any URLs in manifest:"
    grep -i "http" decoded/AndroidManifest.xml
fi
echo ""

# 12. List all files that contain string constants
echo "📝 Files with string constants ^(first 30^)..."
find decoded -name "*.smali" -exec grep -l "const-string" {} \; | head -30
echo ""

# 13. Summary of what we found
echo "📊 DISCOVERY SUMMARY"
echo "======================================="
echo "Total smali files: $^(find decoded -name "*.smali" ^| wc -l^)"
echo "Files with const-string: $^(find decoded -name "*.smali" -exec grep -l "const-string" {} \; ^| wc -l^)"
echo "Files with HTTP URLs: $^(find decoded -name "*.smali" -exec grep -l "https\?://" {} \; ^| wc -l^)"
echo "Config-related files: $^(find decoded -name "*onfig*.smali" ^| wc -l^)"
echo ""

# 14. Create a comprehensive URL list
echo "📋 Creating comprehensive URL inventory..."
echo "All URLs found in the APK:" > url_inventory.txt
find decoded -name "*.smali" -exec grep -h -o "https\?://[^\"'[:space:]]*" {} \; ^>^> url_inventory.txt
find decoded -name "*.xml" -exec grep -h -o "https\?://[^\"'[:space:]]*" {} \; ^>^> url_inventory.txt
sort -u url_inventory.txt
echo ""
echo "✅ URL inventory saved to url_inventory.txt"
echo "📁 Check the artifact for complete results"
