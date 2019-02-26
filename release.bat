for /f "delims== tokens=1,2" %%G in (VERSION) do set anx%%G=%%H
echo %anxversion%
rem ..\ANXMiuiPortTools\hub.exe release edit -a .\out\ANXCameraMagisk.zip -m singularity.BleedingEdge BleedingEdge.singularity
..\ANXMiuiPortTools\hub.exe release create -a .\out\ANXCameraMagisk_%anxversion%.zip -m singularity.%anxversion% %anxversioncode%.singularity
rem ..\ANXMiuiPortTools\hub.exe release create -a .\out\ANXCameraMagisk.zip -m %anxversion% %anxversioncode%
..\ANXMiuiPortTools\hub.exe release edit -a .\out\ANXCameraUnity_%anxversion%.zip -m singularity.%anxversion% %anxversioncode%.singularity
