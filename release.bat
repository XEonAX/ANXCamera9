for /f "delims== tokens=1,2" %%G in (VERSION) do set anx%%G=%%H
echo %anxversion%
rem ..\ANXMiuiPortTools\hub.exe release edit -a .\out\ANXCameraMagisk.zip -m beryllium.BleedingEdge BleedingEdge.beryllium
..\ANXMiuiPortTools\hub.exe release create -a .\out\ANXMiuiCameraMagisk_%anxversion%.zip -m beryllium.MIUI.%anxversion% %anxversioncode%.MIUI.beryllium
rem ..\ANXMiuiPortTools\hub.exe release create -a .\out\ANXCameraMagisk.zip -m %anxversion% %anxversioncode%
