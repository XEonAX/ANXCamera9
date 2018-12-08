adb uninstall com.android.camera 
adb install -g .\out\ANXCamera.apk
adb shell pm grant com.android.camera android.permission.PACKAGE_USAGE_STATS