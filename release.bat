for /f "delims== tokens=1,2" %%G in (VERSION) do set anx%%G=%%H
echo %anxversion%
git tag %anxversioncode%.nokia6610
git push origin %anxversioncode%.nokia6610
rem ..\ANXMiuiPortTools\hub.exe release edit -a .\out\ANXCameraMagisk.zip -m nokia6610.BleedingEdge BleedingEdge.nokia6610
rem ..\ANXMiuiPortTools\hub.exe release create -a .\out\ANXCameraMagisk.zip -m %anxversion% %anxversioncode%
..\ANXMiuiPortTools\hub.exe release create -a .\out\ANXCameraMagisk_%anxversion%.zip -m nokia6610.%anxversion% %anxversioncode%.nokia6610
..\ANXMiuiPortTools\hub.exe release edit -a .\out\ANXCameraUnity_%anxversion%.zip -m nokia6610.%anxversion% %anxversioncode%.nokia6610
rem ..\ANXMiuiPortTools\hub.exe release edit -a .\out\ANX4K60Unity_%anxversion%.zip -m nokia6610.%anxversion% %anxversioncode%.nokia6610
