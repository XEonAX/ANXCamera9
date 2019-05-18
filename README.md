# ANXCamera10
MiuiCamera Port for Beryllium

Self sufficient repository to decompile to smali, recompile, sign, decompile to java, push to device app port.

miui_POCOF1Global_9.4.26_146a17240f_9.0 was used as src.

Recommended to open this Repository in VSCode

This repository requires `git-lfs`

Get it from https://git-lfs.github.com/ 
Follow Step 1 of Getting Started. i.e. run once `git lfs install`
Then clone this repository. If you have already cloned, run clone once again.

Also requires Java 1.7 or 1.8, and 7-zip.

Instructions for Development:

 1. Clone this repository
 2. Run redo.bat 
 3. Start porting

  
Instructions for Testing:

 1. Download the `zip` from https://github.com/XEonAX/ANXCamera10/releases/
 2. Install the Magisk `zip` with Magisk, or Unity `zip` with recovery
 3. Reboot Once, if it doesn't work properly, reboot twice.
 4. Start Testing


Special Thanks to
Abhishek Aggarwal (https://github.com/TheScarastic) for bringing this up to Beta version
Mustang_ssc (https://github.com/Mustang-ssc) for his help in adding support for other devices
Amogha Maiya (https://github.com/amog787) for sponsoring, and all-round help
Sandeep (https://github.com/CodeElixir) for help with the libs
Psygarden (https://forum.xda-developers.com/member.php?u=7645131) for his general help. 



Steps to Port MiuiCamera from scratch:
1. Unpack System of Miui
2. Setup Original files for Decompiling
   1. Copy following to ANXCamera10\orig\MiuiFrameworks
      1. framework\framework-ext-res\framework-ext-res.apk 
      2. framework\framework-res.apk
      3. app\miui\miui.apk
      4. app\miuisystem\miuisystem.apk
   2. Copy following to ANXCamera10\orig
      1. priv-app\MiuiCamera\MiuiCamera.apk
3. Prepare APKTool for decompiling
   1. Install above framework files by running following commands
      1. `java  -jar ..\ANXMiuiPortTools\apktool.jar if -p ..\ANXMiuiPortTools\MiuiFrameworks .\orig\MiuiFrameworks\framework-res.apk`
      2. `java  -jar ..\ANXMiuiPortTools\apktool.jar if -p ..\ANXMiuiPortTools\MiuiFrameworks .\orig\MiuiFrameworks\miui.apk`
      3. `java  -jar ..\ANXMiuiPortTools\apktool.jar if -p ..\ANXMiuiPortTools\MiuiFrameworks .\orig\MiuiFrameworks\framework-ext-res.apk`
      4. `java  -jar ..\ANXMiuiPortTools\apktool.jar if -p ..\ANXMiuiPortTools\MiuiFrameworks .\orig\MiuiFrameworks\miuisystem.apk`
4. Decompile MiuiCamera by running
   1. ...
5. Add decompiled required java libs
6. Set required = false in AndroidManifest of these libs as their code is now included
7. Add missing smali files from decompiled miui rom
8. Add native libs
9.  Edit Smali
   1. ...