for /f "delims== tokens=1,2" %%G in (VERSION) do set anx%%G=%%H
echo %anxversion%
git tag %anxversioncode%.cepheus
git push origin %anxversioncode%.cepheus
rem ..\ANXMiuiPortTools\hub.exe release edit -a .\out\ANXCameraMagisk.zip -m cepheus.BleedingEdge BleedingEdge.cepheus
rem ..\ANXMiuiPortTools\hub.exe release create -a .\out\ANXCameraMagisk.zip -m %anxversion% %anxversioncode%
..\ANXMiuiPortTools\hub.exe release create -a .\out\ANXCameraMagisk_%anxversion%.zip -m cepheus.%anxversion% %anxversioncode%.cepheus
..\ANXMiuiPortTools\hub.exe release edit -a .\out\ANXCameraUnity_%anxversion%.zip -m cepheus.%anxversion% %anxversioncode%.cepheus
rem ..\ANXMiuiPortTools\hub.exe release edit -a .\out\ANX4K60Unity_%anxversion%.zip -m cepheus.%anxversion% %anxversioncode%.cepheus
