# URL Discovery Enhancement

This enhancement adds comprehensive URL discovery to the APK Smart405 workflow.

## New Files Added:
- `scripts/url-discovery.sh` - Standalone discovery script
- `.github/workflows/apk-modifier-with-discovery.yml` - Enhanced workflow with discovery

## What the Discovery Does:
1. **Finds ALL HTTP/HTTPS URLs** in the decompiled APK
2. **Searches for domain references** (.com, .net, .org)
3. **Looks for specific keywords** (rebrandking, panel, api, etc.)
4. **Checks configuration files** for URL patterns
5. **Analyzes AndroidManifest.xml** for network permissions
6. **Creates URL inventory** of all found URLs

## Usage:
1. Run the "APK Modifier with URL Discovery" workflow
2. Check the logs for comprehensive URL analysis
3. Download the "url-discovery-results" artifact
4. Use the findings to understand actual URL patterns in your APK

## Expected Output:
- Complete list of all URLs found in the APK
- File locations where URLs are stored
- Network configuration analysis
- Recommendations for actual URL replacement strategy
