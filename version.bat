call ..\ANXMiuiPortTools\versionizer.exe v=".\VERSION" incrementversionname=true incrementversion=true

..\ANXMiuiPortTools\versionizer.exe v=".\VERSION" am=".\src\ANXCamera\AndroidManifest.xml" mm=".\src\ANXCameraMagisk\module.prop"

..\ANXMiuiPortTools\versionizer.exe v=".\VERSION" am=".\src\ANXCamera\AndroidManifest.xml" mm=".\src\ANXCameraUnity\module.prop"

..\ANXMiuiPortTools\versionizer.exe v=".\VERSION" am=".\src\ANXCamera\AndroidManifest.xml" mm=".\src\ANXMiuiCameraMagisk\module.prop"

..\ANXMiuiPortTools\versionizer.exe v=".\VERSION" am=".\src\ANXCamera\AndroidManifest.xml" mm=".\src\ANX4K60Unity\module.prop"
