# HB Micro RC Car Software

Modernized Android controller APK for the HB micro RC car.

This repository keeps the working Bluetooth behavior from the original app, converts the controller UI to English, and applies a Material-style dark cockpit UI. The latest tested APK is included so it can be installed without rebuilding.

## Current APK

- Package: `com.JD.ZDFcar`
- Version: `1.1.0` / `110`
- App label: `Micro RC Car`
- Bluetooth target: `HB TOYS64`
- Latest signed APK: `build/micro-rc-car-modern-signed.apk`

## What Changed

- Rebuilt the old Chinese UI into an English, modern dark controller screen.
- Replaced the boxed `EXIT` graphic with a compact power icon.
- Replaced legacy top-bar images with round Material-style line controls.
- Preserved the working Bluetooth name/connection path for `HB TOYS64`.
- Defaulted the controller to High mode.
- Corrected speed mode mapping:
  - Low sends `10`
  - Medium sends `01`
  - High sends `00`
- Set the remote command loop to `55 ms` for more responsive control.

## Repository Layout

- `apktool_out/` - apktool-decoded APK project with the patched web assets and Android metadata.
- `scripts/material_revamp.js` - applies the final JS/CSS/metadata patches.
- `scripts/create_material_assets.ps1` - regenerates the final Material-style PNG assets.
- `build/micro-rc-car-modern-signed.apk` - latest signed APK to install.
- `build/index.html` - standalone browser UI prototype for the next drift-car controller screen.

Local analysis output, screenshots, tool downloads, original APK copies, unsigned APKs, and signing keys are ignored by Git.

## Rebuild

Apply the final patch set after resetting or re-decoding the APK:

```powershell
node .\scripts\material_revamp.js
powershell -ExecutionPolicy Bypass -File .\scripts\create_material_assets.ps1
```

Then rebuild/sign with apktool, zipalign, and apksigner:

```powershell
apktool b .\apktool_out -o .\build\micro-rc-car-modern-unsigned.apk
zipalign -f -p 4 .\build\micro-rc-car-modern-unsigned.apk .\build\micro-rc-car-modern-aligned.apk
apksigner sign --ks <your-keystore> --out .\build\micro-rc-car-modern-signed.apk .\build\micro-rc-car-modern-aligned.apk
apksigner verify --verbose .\build\micro-rc-car-modern-signed.apk
```

Use your own signing key for release builds. The local debug keystore is intentionally not committed.

## Install

```powershell
adb install -r --no-incremental .\build\micro-rc-car-modern-signed.apk
adb shell monkey -p com.JD.ZDFcar 1
```

## Web Prototype

Open `build/index.html` directly in a browser to review the next controller UI before it is ported into the APK. It is a standalone prototype and does not change the current APK.
