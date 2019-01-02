
xcopy /s /y .\out\ANXCamera.apk .\src\ANXCameraMagisk\system\priv-app\ANXCamera
del .\out\ANXCameraMagisk.zip
"C:\Program Files\7-Zip\7z.exe" a -tzip .\out\ANXCameraMagisk.zip .\src\ANXCameraMagisk\*
adb push .\out\ANXCameraMagisk.zip  /sdcard/zips