for /f "delims== tokens=1,2" %%G in (VERSION) do set anx%%G=%%H
echo %anxversion%
xcopy /s /y .\out\ANXCamera.apk .\src\ANXCameraMagisk\system\priv-app\ANXCamera
del .\out\ANXCameraMagisk.zip
del .\out\ANXCameraMagisk_*.zip
"C:\Program Files\7-Zip\7z.exe" a -tzip .\out\ANXCameraMagisk.zip .\src\ANXCameraMagisk\*
copy .\out\ANXCameraMagisk.zip /B .\out\ANXCameraMagisk_%anxversion%.zip
adb push .\out\ANXCameraMagisk.zip  /sdcard/zips