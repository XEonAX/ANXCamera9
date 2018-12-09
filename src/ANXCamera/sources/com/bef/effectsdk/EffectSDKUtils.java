package com.bef.effectsdk;

import android.content.Context;
import android.text.TextUtils;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class EffectSDKUtils {
    private static List<String> assetFiles = ModelsList.list;
    private static Set<String> localFiles = new HashSet();
    private static Set<String> needRemoveFiles = new HashSet();

    public static void flushAlgorithmModelFiles(Context context, String str) throws Throwable {
        if (!localFiles.isEmpty()) {
            localFiles.clear();
        }
        scanRecursive(str, localFiles);
        copyAssets(context, str, null, false);
        deleteNoUseModel();
        localFiles.clear();
    }

    public static void flushAlgorithmModelFiles(Context context, String str, String[] strArr, boolean z) throws Throwable {
        if (!localFiles.isEmpty()) {
            localFiles.clear();
        }
        scanRecursive(str, localFiles);
        copyAssets(context, str, strArr, z);
        deleteNoUseModel();
        localFiles.clear();
    }

    private static void scanNameRecursive(String str, Set<String> set) {
        File file = new File(str);
        if (file.exists()) {
            File[] listFiles = file.listFiles();
            if (listFiles != null) {
                for (File file2 : listFiles) {
                    if (file2.isDirectory()) {
                        scanNameRecursive(file2.getAbsolutePath(), set);
                    } else {
                        set.add(file2.getName());
                    }
                }
            }
        }
    }

    private static void scanRecursive(String str, Set<String> set) {
        File file = new File(str);
        if (file.exists()) {
            File[] listFiles = file.listFiles();
            if (listFiles != null) {
                for (File file2 : listFiles) {
                    if (file2.isDirectory()) {
                        scanRecursive(file2.getAbsolutePath(), set);
                    } else {
                        set.add(file2.getAbsolutePath());
                    }
                }
            }
        }
    }

    public static boolean needUpdate(Context context, String str) {
        if (!localFiles.isEmpty()) {
            localFiles.clear();
        }
        scanNameRecursive(str, localFiles);
        try {
            if (assetFiles.size() > localFiles.size()) {
                return true;
            }
            for (String fileName : assetFiles) {
                if (!localFiles.contains(getFileName(fileName))) {
                    return true;
                }
            }
            return false;
        } catch (Throwable th) {
            th.printStackTrace();
            return true;
        }
    }

    private static void copyAssets(Context context, String str, String[] strArr, boolean z) throws Throwable {
        if (!needRemoveFiles.isEmpty()) {
            needRemoveFiles.clear();
        }
        for (String fileName : localFiles) {
            needRemoveFiles.add(getFileName(fileName));
        }
        if (!str.endsWith("/")) {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append(str);
            stringBuilder.append("/");
            str = stringBuilder.toString();
        }
        for (String fileName2 : assetFiles) {
            Object obj;
            Object fileName3 = getFileName(fileName2);
            Object obj2 = null;
            if (needRemoveFiles.contains(fileName3) && new File(str, getAssetRelativePath(fileName2)).exists()) {
                needRemoveFiles.remove(fileName3);
                obj = null;
            } else {
                obj = 1;
            }
            if (obj != null) {
                if (strArr != null && !TextUtils.isEmpty(fileName3)) {
                    for (Object equals : strArr) {
                        if (fileName3.equals(equals)) {
                            obj2 = 1;
                            break;
                        }
                    }
                }
                if (obj2 != null && z) {
                    copyFile(context, fileName2, str);
                }
                if (obj2 == null && !z) {
                    copyFile(context, fileName2, str);
                }
            }
        }
    }

    private static void copyFile(Context context, String str, String str2) throws Throwable {
        InputStream open = context.getAssets().open(str);
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(str2);
        stringBuilder.append(str.substring(str.indexOf("model") + 6, str.lastIndexOf("/")));
        str2 = stringBuilder.toString();
        File file = new File(str2);
        if (!file.exists()) {
            file.mkdirs();
        }
        StringBuilder stringBuilder2 = new StringBuilder();
        stringBuilder2.append(str2);
        stringBuilder2.append("/");
        stringBuilder2.append(getFileName(str));
        FileOutputStream fileOutputStream = new FileOutputStream(new File(stringBuilder2.toString()));
        byte[] bArr = new byte[1024];
        while (true) {
            int read = open.read(bArr);
            if (read > 0) {
                fileOutputStream.write(bArr, 0, read);
            } else {
                open.close();
                fileOutputStream.close();
                return;
            }
        }
    }

    private static String getFileName(String str) {
        int lastIndexOf = str.lastIndexOf("/");
        if (lastIndexOf != -1) {
            return str.substring(lastIndexOf + 1, str.length());
        }
        return "";
    }

    private static String getAssetRelativePath(String str) {
        int indexOf = str.indexOf("model/");
        if (indexOf >= 0) {
            return str.substring(indexOf + "model/".length(), str.length());
        }
        return str;
    }

    private static void deleteNoUseModel() {
        for (String str : localFiles) {
            if (needRemoveFiles.contains(getFileName(str))) {
                File file = new File(str);
                if (file.exists()) {
                    file.delete();
                }
            }
        }
    }
}
