for /f "delims== tokens=1,2" %%G in (VERSION) do set anx%%G=%%H
echo %anxversion%
rem ..\ANXMiuiPortTools\hub.exe release edit -a .\out\ANXCameraMagisk.zip -m polaris.BleedingEdge BleedingEdge.polaris -t polaris
..\ANXMiuiPortTools\hub.exe release create -a .\out\ANXCameraMagisk_%anxversion%.zip -m polaris.%anxversion% %anxversioncode%.polaris -t polaris
rem ..\ANXMiuiPortTools\hub.exe release create -a .\out\ANXCameraMagisk.zip -m %anxversion% %anxversioncode% -t polaris
