for /f "delims== tokens=1,2" %%G in (VERSION) do set anx%%G=%%H
echo %anxversion%
xcopy /s /y .\out\ANXCamera.apk .\src\ANXCameraMagisk\system\priv-app\ANXCamera
xcopy /s /y .\out\ANXCamera.apk .\src\ANXCameraUnity\system\priv-app\ANXCamera

del .\out\ANXCameraMagisk.zip
del .\out\ANXCameraMagisk_*.zip

del .\out\ANXCameraUnity.zip
del .\out\ANXCameraUnity_*.zip


del .\out\ANX4K60Unity.zip
del .\out\ANX4K60Unity_*.zip

"C:\Program Files\7-Zip\7z.exe" a -tzip .\out\ANXCameraMagisk.zip .\src\ANXCameraMagisk\*
copy .\out\ANXCameraMagisk.zip /B .\out\ANXCameraMagisk_%anxversion%.zip

"C:\Program Files\7-Zip\7z.exe" a -tzip .\out\ANXCameraUnity.zip .\src\ANXCameraUnity\*
copy .\out\ANXCameraUnity.zip /B .\out\ANXCameraUnity_%anxversion%.zip
adb push .\out\ANXCameraMagisk.zip  /sdcard/zips

"C:\Program Files\7-Zip\7z.exe" a -tzip .\out\ANX4K60Unity.zip .\src\ANX4K60Unity\*
copy .\out\ANX4K60Unity.zip /B .\out\ANX4K60Unity_%anxversion%.zip