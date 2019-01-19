for /f "delims== tokens=1,2" %%G in (VERSION) do set anx%%G=%%H
echo %anxversion%
rem ..\ANXMiuiPortTools\hub.exe release edit -a .\out\ANXCameraMagisk.zip -m dipper.BleedingEdge BleedingEdge.dipper
..\ANXMiuiPortTools\hub.exe release create -a .\out\ANXCameraMagisk_%anxversion%.zip -m dipper.%anxversion% %anxversioncode%.dipper
rem ..\ANXMiuiPortTools\hub.exe release create -a .\out\ANXCameraMagisk.zip -m %anxversion% %anxversioncode%
