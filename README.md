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
   1. Copy following to ANXCamera10\orig\MiuiFrameworks. Files to be taken from Latest ROM 
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
   1. `java  -jar ..\ANXMiuiPortTools\apktool.jar d -p ..\ANXMiuiPortTools\MiuiFrameworks -f -b -o .\src\ANXCamera .\orig\MiuiCamera.apk`
   2. Parameters
      1. d, decode
      2. -p, --frame-path <DIR>
      3. -f, --force
      4. -b, --no-debug-info
      5. -o, --output <DIR>
5. Open `src\ANXCamera\AndroidManifest.xml` and format the document
6. First Compile Attempt
   1. Run `recompile.bat` just to check whether we are able to recompile without any modification
   2. Run `sign.bat` to sign and zipalign
   3. Run `jadx.bat` to create java code from compiled apk. This fails, don't worry, it does whatever it can
7. Next we will Deodex rom and decompile the required libs
   1. Run in WSL or Linux `$ /<path to vdexExtractor>/tools/deodex/run.sh -i /<path to system>/framework -o /<path to deodex destination>/framework`
   2. Above will deodex the system framework
   3. Now we decompile the required libs
      1. Copy latest baksmali.*.jar to `<path to deodex destination>`
      2. To identify what libs you need to decompile. Open `src\ANXCamera\AndroidManifest.xml`
         1. Find the `uses-library` XML Nodes. We need to decompile these
         2. We will skip `miui-stat.jar` as we will disable miui-stats from sending data to miui.
      3. Open a cmd inside `<path to deodex destination>` folder. And run the following:
         1. `java -jar baksmali-2.2.7.jar d -o android-support-v7-recyclerview .\framework\vdexExtractor_deodexed\android-support-v7-recyclerview\android-support-v7-recyclerview_classes.dex.dex`
         2. `java -jar baksmali-2.2.7.jar d -o android-support-v13 .\framework\vdexExtractor_deodexed\android-support-v13\android-support-v13_classes.dex.dex`
         3. `java -jar baksmali-2.2.7.jar d -o boot-framework .\framework\vdexExtractor_deodexed\boot-framework\boot-framework_classes.dex`
         4. `java -jar baksmali-2.2.7.jar d -o boot-framework2 .\framework\vdexExtractor_deodexed\boot-framework\boot-framework_classes2.dex`
         5. `java -jar baksmali-2.2.7.jar d -o boot-framework3 .\framework\vdexExtractor_deodexed\boot-framework\boot-framework_classes3.dex`
         6. `java -jar baksmali-2.2.7.jar d -o boot-miui .\framework\vdexExtractor_deodexed\boot-miui\boot-miui_classes.dex`
         7. `java -jar baksmali-2.2.7.jar d -o boot-miuisystem .\framework\vdexExtractor_deodexed\boot-miuisystem\boot-miuisystem_classes.dex`
         8. `java -jar baksmali-2.2.7.jar d -o gson .\framework\vdexExtractor_deodexed\gson\gson_classes.dex.dex`
         9. `java -jar baksmali-2.2.7.jar d -o volley .\framework\vdexExtractor_deodexed\volley\volley_classes.dex.dex`
         10. `java -jar baksmali-2.2.7.jar d -o zxing .\framework\vdexExtractor_deodexed\zxing\zxing_classes.dex.dex`
8. Now we will add **few** of the above decompiles libs to our code
   1. Create a folder `src\ANXCamera\smali_classes2`
   2. Copy the **contents** of 
      1. `<path to deodex destination>\android-support-v7-recyclerview`
      2. `<path to deodex destination>\android-support-v13`
      3. `<path to deodex destination>\gson`
      4. `<path to deodex destination>\volley`
      5. `<path to deodex destination>\zxing`
   3. to `src\ANXCamera\smali_classes2`. It should finally contain two folders
      1. `android` and `com`
9.  Set required = false in AndroidManifest of these libs as their code is now included
10. Add missing smali files from decompiled miui rom
11. Add native libs
12. Edit Smali
   4. ...

