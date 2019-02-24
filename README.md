# ANXCamera10
MiuiCamera Port for Beryllium

Self sufficient repository to decompile to smali, recompile, sign, decompile to java, push to device app port.

miui_POCOF1Global_9.2.21_a824dad658_9.0 was used as src.

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



Steps to Port MiuiCamera:
1. Unpack System of Miui
2. Setup Framework for APKTool
3. Add decompiled required java libs
4. Set required = false in AndroidManifest of these libs as their code is now included
5. Add missing smali files from decompiled miui rom
6. Add native libs
7. Edit Smali
   1. 