for /f "delims== tokens=1,2" %%G in (VERSION) do set anx%%G=%%H
echo %anxversion%
..\ANXMiuiPortTools\hub.exe release edit -a .\out\ANXCameraMagisk.zip -m BleedingEdge BleedingEdge
REM..\ANXMiuiPortTools\hub.exe release create -a .\out\ANXCameraMagisk_%anxversion%.zip -m %anxversion% %anxversioncode%
..\ANXMiuiPortTools\hub.exe release create -a .\out\ANXCameraMagisk.zip -m %anxversion% %anxversioncode%
