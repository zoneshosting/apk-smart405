# APK Modifier - Smart405 Project

This repository contains a GitHub Action workflow that automatically modifies APK files by:
- Changing package names
- Updating app names
- Replacing image assets
- Recompiling and signing the APK

## 📁 Directory Structure

```
Apk-Smart405/
├── .github/
│   └── workflows/
│       └── apk-modifier.yml     # Main GitHub Action workflow
├── apk/
│   └── Dynamic-TV.apk           # Source APK file to modify
├── images-to-replace/
│   ├── banner.png
│   ├── brick.jpg
│   ├── full_white_logo.png
│   ├── ic_launcher.png
│   ├── launcher_logo.png
│   ├── logo.png
│   ├── logo_blue_long.png
│   ├── logo_greu.png
│   ├── logo_home.png
│   ├── logo_placeholder_white.png
│   ├── logo_watermark.png
│   ├── logo_white.png
│   ├── logo_white_long.png
│   ├── tv_banner.png
│   └── your_logo.png
└── README.md                    # This file
```

## 🚀 How to Use

### 1. Setup Repository
1. Push this repository to GitHub
2. Ensure all files are in the correct directories as shown above

### 2. Run the Workflow
1. Go to **Actions** tab in your GitHub repository
2. Click **APK Modifier** workflow
3. Click **Run workflow**
4. Fill in the parameters:
   - **APK file name**: `Dynamic-TV.apk` (default)
   - **New package name**: `com.sitv.live` (default) 
   - **New app name**: `SI TV` (default)
5. Click **Run workflow**

### 3. Download Results
1. After the workflow completes, go to the workflow run
2. Download the **modified-apk-[package-name]** artifact
3. Extract the zip file to get:
   - `modified_signed_aligned.apk` - Ready to install
   - `modified_unsigned.apk` - Unsigned version
   - `modification_summary.txt` - Summary of changes

## 🔄 What Gets Modified

### Package Name Changes
- **Original**: `com.dynamic.tv`
- **Base64**: `Y29tLmR5bmFtaWMudHY=`
- **Replaced with**: Your specified package name
- **Files affected**: All `.smali` files, `AndroidManifest.xml`, `apktool.yml`

### App Name Changes  
- **Original**: `Dynamic TV`
- **Base64**: `RHluYW1pYyBUVg==`
- **Replaced with**: Your specified app name
- **Files affected**: All `.smali` files, `strings.xml`, `AndroidManifest.xml`

### Image Replacements
All images in the `images-to-replace/` folder will replace corresponding files in the APK:
- `banner.png`
- `brick.jpg`
- `full_white_logo.png`
- `ic_launcher.png`
- `launcher_logo.png`
- `logo.png`
- `logo_blue_long.png`
- `logo_greu.png` *(Note: Check if this should be `logo_grey.png`)*
- `logo_home.png`
- `logo_placeholder_white.png`
- `logo_watermark.png`
- `logo_white.png`
- `logo_white_long.png`
- `tv_banner.png`
- `your_logo.png`

## 🛠️ Technical Details

### Tools Used
- **apktool**: APK decompilation and recompilation
- **jarsigner**: APK signing
- **zipalign**: APK optimization
- **sed**: Text replacement in files

### Process Flow
1. **Decompile**: Extract APK contents using apktool
2. **Replace Text**: Update package names and app names in all relevant files
3. **Replace Images**: Swap out image assets with new ones
4. **Update Structure**: Move smali files to match new package structure
5. **Recompile**: Build new APK with apktool
6. **Sign**: Sign APK with generated keystore
7. **Align**: Optimize APK with zipalign

## ⚠️ Notes

- The generated keystore is temporary and created during the workflow
- For production use, consider using your own signing certificate
- Large APK files may take longer to process
- Ensure replacement images are the same format and appropriate dimensions

## 🐛 Troubleshooting

If the workflow fails:
1. Check the workflow logs for specific error messages
2. Verify all image files exist in `images-to-replace/`
3. Ensure the APK file exists in `apk/` folder
4. Check that package names follow proper Java package naming conventions

## 📝 License

This project is for educational and legitimate app modification purposes only.
