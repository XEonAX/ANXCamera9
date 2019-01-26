for /f "delims== tokens=1,2" %%G in (VERSION) do set anx%%G=%%H
echo %anxversion%
xcopy /s /y .\out\ANXCamera.apk .\src\ANXMiuiCameraMagisk\system\priv-app\ANXCamera
del .\out\ANXMiuiCameraMagisk.zip
del .\out\ANXMiuiCameraMagisk_*.zip
"C:\Program Files\7-Zip\7z.exe" a -tzip .\out\ANXMiuiCameraMagisk.zip .\src\ANXMiuiCameraMagisk\*
copy .\out\ANXMiuiCameraMagisk.zip /B .\out\ANXMiuiCameraMagisk_%anxversion%.zip
adb push .\out\ANXMiuiCameraMagisk.zip  /sdcard/zips