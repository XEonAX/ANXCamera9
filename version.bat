call ..\ANXMiuiPortTools\versionizer.exe v=".\VERSION" incrementversionname=true incrementversion=true

..\ANXMiuiPortTools\versionizer.exe v=".\VERSION" am=".\src\ANXCamera\AndroidManifest.xml" mm=".\src\ANXCameraMagisk\module.prop"
