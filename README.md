# APK Smart405 🚀

**Automated APK Modification System** - Rebrand and customize Android APK files through GitHub Actions

[![GitHub Actions](https://img.shields.io/badge/GitHub-Actions-blue?logo=github)](https://github.com/zonehosting/apk-smart405/actions)
[![APK Modifier](https://img.shields.io/badge/APK-Modifier-green?logo=android)](https://github.com/zonehosting/apk-smart405/actions/workflows/apk-modifier.yml)

## 🎯 Overview

APK Smart405 is a powerful automated system that allows you to modify and rebrand Android APK files entirely through GitHub's web interface. No local tools required - just upload your assets and run the workflow!

## ✨ Features

### 🔄 **Complete APK Rebranding**
- **Package Name**: Change `com.dynamic.tv` to your custom package
- **App Name**: Replace "Dynamic TV" with your brand name  
- **Panel URLs**: Update 8 rebrandking.com panel URLs automatically
- **Images**: Replace 15+ logos and branding assets
- **Ready APK**: Get signed, installation-ready APK files

### 🌐 **Web-Based Workflow**
- **No Local Tools**: Everything runs in GitHub Actions
- **4 Simple Inputs**: APK file, package name, app name, panel URL
- **Automated Process**: Complete modification pipeline
- **Download & Install**: Ready-to-use APK output

## 🚀 Quick Start

### 1. **Prepare Your Assets**
```bash
# Upload your source APK
apk/Dynamic-TV.apk

# Add your custom images  
images-to-replace/
├── logo.png
├── banner.png
├── ic_launcher.png
└── [12 more files...]
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

## 🎨 Customization Options

### **Panel URL Management**
Automatically updates 8 panel URLs:
- `https://rebrandking.com/panels/SM4trio/dynam/api/` → `https://rebrandking.com/panels/SM4trio/yourbrand/api/`
- `https://rebrandking.com/panels/SM4trio/dynam/` → `https://rebrandking.com/panels/SM4trio/yourbrand/`

### **Image Assets Replaced**
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

## 🛠 Technical Details

### **Workflow Steps**
1. **🔧 APK Decompilation** - Extract and decode APK contents
2. **🧹 Cleanup** - Resolve Facebook Ads SDK conflicts  
3. **🔗 URL Updates** - Modify 8 panel URLs precisely
4. **📦 Package Changes** - Update app identifier throughout
5. **🏷️ App Rebranding** - Change display names and labels
6. **🖼️ Image Replacement** - Swap all branding assets
7. **📁 Structure Updates** - Reorganize package directories
8. **⚙️ Recompilation** - Rebuild APK with multiple fallbacks
9. **✍️ Code Signing** - Generate keystore and sign APK
10. **📤 Upload** - Package modified APK for download

### **Advanced Features**
- **🔄 Multiple Fallbacks**: AAPT2 → AAPT1 → no-crunch compilation
- **🛡️ Error Recovery**: Handles complex APK structures automatically  
- **📊 Detailed Logging**: Complete step-by-step execution reports
- **✅ Verification**: Confirms exactly 8 URL modifications completed

## 📁 Repository Structure

```
apk-smart405/
├── .github/workflows/
│   ├── apk-modifier.yml      # 🎯 Main APK modification workflow
│   └── test-setup.yml        # ✅ Repository validation
├── apk/
│   └── Dynamic-TV.apk        # 📱 Source APK file
├── images-to-replace/        # 🎨 Custom branding assets
│   ├── logo.png              # 🖼️ Replacement images
│   └── [14 more files...]    # 🎨 Additional graphics
├── scripts/                  # 🔧 Utility scripts  
└── README.md                 # 📖 This documentation
```

## 🔍 Troubleshooting

### **Common Issues**
- **APK Not Found**: Ensure APK is uploaded to `apk/` folder
- **Image Missing**: Check all 15 images are in `images-to-replace/`
- **Compilation Failed**: Workflow includes automatic fallback options
- **URLs Not Found**: Troubleshooting output shows search details

### **Success Indicators**
```
✅ SUCCESS: Exactly 8 URLs replaced as expected!
✅ APK compiled successfully  
✅ APK signed and aligned successfully
✅ Ready for installation!
```

## 📊 Workflow Status

| Component | Status | Description |
|-----------|--------|-------------|
| 🔧 Decompilation | ✅ Working | Multiple fallback strategies |
| 🔗 Panel URLs | ✅ Working | 8/8 URLs replaced precisely |  
| 📦 Package Names | ✅ Working | Complete identifier updates |
| 🖼️ Image Replacement | ✅ Working | 15 branding assets swapped |
| ⚙️ Compilation | ✅ Working | AAPT2/AAPT1 compatibility |
| ✍️ Code Signing | ✅ Working | Production-ready APKs |

## 🎮 Example Usage

**Input:**
- APK: `Dynamic-TV.apk`
- Package: `com.mytv.live`  
- App Name: `MyTV Live`
- Panel URL: `mytv`

**Output:**
- ✅ Package changed to `com.mytv.live`
- ✅ App displays as "MyTV Live"  
- ✅ 8 URLs updated to use "mytv" identifier
- ✅ All logos replaced with custom branding
- ✅ Ready-to-install `modified_signed_aligned.apk`

## 🤝 Contributing

Feel free to submit issues, fork the repository, and create pull requests for improvements.

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

---

## 🚀 Get Started Now!

**[▶️ Run APK Modifier Workflow](https://github.com/zonehosting/apk-smart405/actions/workflows/apk-modifier.yml)**

Transform your APK in minutes with just a few clicks! 🎯
