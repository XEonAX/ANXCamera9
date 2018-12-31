# ANXMiuiCamera10
MiuiCamera Port for Dipper

Self sufficient repository to decompile to smali, recompile, sign, decompile to java, push to device app port.

miui_MI8Global_8.12.20_c7a9af8587_9.0 was used as src.

Recommended to open this Repository in VSCode

Instructions for Development:

 1. Clone this repository
 2. Run redo.bat 
 3. Start porting

  
Instructions for Testing:

 1. Download the `apk` and `etc` folder from https://github.com/XEonAX/ANXMiuiCamera10/tree/dipper/out
 2. Copy the `etc` folder to internal storage, so that `/sdcard/etc/device_features/beryllium.xml` becomes a valid path.
 3. Install the `apk`
 4. Grant All Permissions
 5. Grant Usage Access Permission. 
	 - Generally From Settings>Apps>Advanced>Special App Access>Usage Access>Camera>Allowed
 6. Start Testing

