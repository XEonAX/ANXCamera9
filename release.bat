for /f "delims== tokens=1,2" %%G in (VERSION) do set anx%%G=%%H
echo %anxversion%
git tag %anxversioncode%.oosberyllium
git push origin %anxversioncode%.oosberyllium
rem ..\ANXMiuiPortTools\hub.exe release edit -a .\out\ANXCameraMagisk.zip -m oosberyllium.BleedingEdge BleedingEdge.oosberyllium
rem ..\ANXMiuiPortTools\hub.exe release create -a .\out\ANXCameraMagisk.zip -m %anxversion% %anxversioncode%
..\ANXMiuiPortTools\hub.exe release create -a .\out\ANXCameraMagisk_%anxversion%.zip -m oosberyllium.%anxversion% %anxversioncode%.oosberyllium
..\ANXMiuiPortTools\hub.exe release edit -a .\out\ANXCameraUnity_%anxversion%.zip -m oosberyllium.%anxversion% %anxversioncode%.oosberyllium
rem ..\ANXMiuiPortTools\hub.exe release edit -a .\out\ANX4K60Unity_%anxversion%.zip -m oosberyllium.%anxversion% %anxversioncode%.oosberyllium
