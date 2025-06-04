# APK Smart405 🚀

**Automated APK Modification System** - Rebrand and customize Android APK files through GitHub Actions with character-exact precision

[![GitHub Actions](https://img.shields.io/badge/GitHub-Actions-blue?logo=github)](https://github.com/zonehosting/apk-smart405/actions)
[![APK Modifier](https://img.shields.io/badge/APK-Modifier-green?logo=android)](https://github.com/zonehosting/apk-smart405/actions/workflows/apk-modifier.yml)
[![Character-Exact](https://img.shields.io/badge/URL_Replacement-Character--Exact-orange)](https://github.com/zonehosting/apk-smart405)

## 🎯 Overview

APK Smart405 is a powerful automated system that modifies and rebrands Android APK files entirely through GitHub's web interface. Features **character-exact URL replacement** that reliably finds and replaces panel URLs in smali bytecode - no local tools required!

## ✨ Key Features

### 🔄 **Complete APK Rebranding**
- **Package Name**: Change `com.dynamic.tv` to your custom package
- **App Name**: Replace "Dynamic TV" with your brand name  
- **Panel URLs**: Character-exact replacement of 8 rebrandking.com URLs in smali files
- **Images**: Replace 15+ logos and branding assets automatically
- **Ready APK**: Get signed, installation-ready APK files

### 🌐 **Web-Based Workflow**
- **No Local Tools**: Everything runs in GitHub Actions
- **4 Simple Inputs**: APK file, package name, app name, panel URL value
- **Automated Process**: Complete modification pipeline with fallbacks
- **Download & Install**: Ready-to-use APK output with verification

## 🎯 Character-Exact URL Replacement

### **Breakthrough Solution**
After extensive debugging, we developed a **character-exact replacement system** that reliably finds URLs in smali bytecode:

```smali
# Found in files like: smali_classes3\com\rtx\smar4\Config\mConfig.smali
const-string v0, "https://rebrandking.com/panels/SM4trio/dynam/"
```

### **Technical Approach**
- ✅ **Direct String Search**: No regex patterns or escaping
- ✅ **Forward Slash Handling**: Uses `/dynam/` as literal characters
- ✅ **Pipe Delimiter**: `sed -i "s|old|new|g"` avoids slash conflicts
- ✅ **Multi-Directory**: Searches all `smali_classes*` directories
- ✅ **Verification**: Shows exact line numbers and content

## 🚀 Quick Start

### 1. **Prepare Your Assets**
```bash
# Upload your source APK
apk/Dynamic-TV.apk

# Add your custom images  
images-to-replace/
├── logo.png              # Primary logo
├── banner.png            # Banner graphics
├── ic_launcher.png       # App launcher icon
├── logo_white.png        # White logo variant
└── [11 more files...]    # Additional branding
```

### 2. **Run the Workflow**
1. Go to **[Actions Tab](https://github.com/zonehosting/apk-smart405/actions)**
2. Select **"APK Modifier"** workflow
3. Click **"Run workflow"**
4. Enter your customization parameters:
   - **APK file**: `Dynamic-TV.apk`  
   - **Package name**: `com.yourcompany.app`
   - **App name**: `Your Brand TV`
   - **Panel URL value**: `yourbrand`

### 3. **Download Your APK**
1. Wait for completion (~5-10 minutes)
2. Download the workflow artifacts
3. Install `modified_signed_aligned.apk`

## 🎨 Panel URL Management

### **8 URLs Modified Automatically**
```bash
# Original URLs (found in smali files):
https://rebrandking.com/panels/SM4trio/dynam/
https://rebrandking.com/panels/SM4trio/dynam/api/

# After replacement (example with "yourbrand"):
https://rebrandking.com/panels/SM4trio/yourbrand/
https://rebrandking.com/panels/SM4trio/yourbrand/api/
```

### **Smart Detection**
- 🔍 **Searches** all smali directories (`smali`, `smali_classes2`, `smali_classes3`, etc.)
- 🎯 **Finds** exact character matches in const-string declarations
- 🔄 **Replaces** using character-exact string replacement
- ✅ **Verifies** exactly 8 URLs modified (expected count)

## 🛠 Advanced Features

### **Multi-Fallback System**
| Component | Primary Method | Fallback 1 | Fallback 2 |
|-----------|---------------|------------|------------|
| 🔧 **Decompilation** | `--no-src` | `--only-main-classes` | `--no-debug-info` |
| ⚙️ **Compilation** | AAPT2 | AAPT1 | `--no-crunch` |
| 🔍 **URL Search** | Character-exact | Case-insensitive | Partial matching |

### **Quality Assurance**
- **📊 Detailed Logging**: Step-by-step execution with line numbers
- **🔍 Before/After Verification**: URL replacement count validation
- **⚠️ Error Recovery**: Comprehensive troubleshooting output
- **✅ Success Confirmation**: "🎯 PERFECT: Exactly 8 URLs replaced!"

### **Duplicate Class Resolution**
- **🧹 Facebook Ads SDK**: Automatic conflict detection and cleanup
- **📁 Cross-Directory**: Removes duplicates across all smali folders
- **🛡️ Safe Processing**: Preserves primary classes, removes conflicts

## 📊 Workflow Status

| Component | Status | Description |
|-----------|--------|-------------|
| 🔧 **Decompilation** | ✅ Robust | Multi-fallback with 3 strategies |
| 🔗 **Panel URLs** | ✅ Character-Exact | 8/8 URLs replaced precisely |  
| 📦 **Package Names** | ✅ Complete | All identifiers updated |
| 🖼️ **Image Replacement** | ✅ Automated | 15 branding assets swapped |
| ⚙️ **Compilation** | ✅ Resilient | AAPT2/AAPT1 compatibility |
| ✍️ **Code Signing** | ✅ Production | Installation-ready APKs |

## 🎮 Example Usage

**Input Parameters:**
- APK: `Dynamic-TV.apk`
- Package: `com.mytv.live`  
- App Name: `MyTV Live`
- Panel URL: `mytv`

**Automated Results:**
- ✅ Package changed to `com.mytv.live`
- ✅ App displays as "MyTV Live"  
- ✅ 8 URLs updated to use "mytv" identifier
- ✅ All logos replaced with custom branding
- ✅ Ready-to-install `modified_signed_aligned.apk`

## 🔍 Troubleshooting

### **Success Indicators**
```bash
✅ Found URL1 in 4 files:
   smali_classes3/com/rtx/smar4/Config/mConfig.smali
✅ Found URL2 in 4 files:
🎯 PERFECT: Exactly 8 URLs replaced as expected!
✅ Perfect! No remaining old URLs found.
```

### **Common Issues**
- **URLs Not Found**: Workflow shows comprehensive search results and fallback strategies
- **Image Missing**: Verify all 15 images are in `images-to-replace/` folder
- **Compilation Failed**: Multi-fallback system handles most APK structures automatically

## 📁 Image Assets Required

```
banner.png              logo_greu.png
brick.jpg               logo_home.png  
full_white_logo.png     logo_placeholder_white.png
ic_launcher.png         logo_watermark.png
launcher_logo.png       logo_white.png
logo.png                logo_white_long.png
logo_blue_long.png      tv_banner.png
                        your_logo.png
```

## 🚀 Recent Improvements

### **v3.0 - Character-Exact URL Replacement**
- ✅ **Breakthrough**: Direct string matching instead of regex patterns
- ✅ **Reliable**: Finds URLs exactly like MT Manager APK editor
- ✅ **Precise**: Character-by-character exact matching with forward slashes
- ✅ **Verified**: Shows line numbers and content for transparency

### **v2.0 - Multi-Fallback Architecture**
- ✅ **Robust Decompilation**: 3-tier fallback system
- ✅ **Compilation Resilience**: AAPT2/AAPT1 compatibility
- ✅ **Duplicate Resolution**: Facebook Ads SDK conflict cleanup

## 🤝 Contributing

This project demonstrates advanced APK modification techniques and GitHub Actions automation. Feel free to:
- 🐛 Submit issues for improvements
- 🔧 Fork and enhance the workflow
- 📖 Contribute to documentation
- ⭐ Star the project if it helps you!

## 📄 License

Open source under the [MIT License](LICENSE) - use freely for your projects!

---

## 🚀 **Ready to Transform Your APK?**

**[▶️ Run APK Modifier Workflow](https://github.com/zonehosting/apk-smart405/actions/workflows/apk-modifier.yml)**

**Character-exact URL replacement • 15 image assets • Production-ready APKs** 🎯

> *"From complex APK modification to simple web clicks - APK Smart405 makes Android rebranding accessible to everyone!"*
