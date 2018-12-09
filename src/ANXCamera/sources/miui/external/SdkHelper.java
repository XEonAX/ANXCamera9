package miui.external;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager.NameNotFoundException;
import android.text.TextUtils;
import android.util.Log;
import java.io.File;

public class SdkHelper {
    private static final String LOG_TAG = "miuisdk";
    static final String MIUI_SYSTEM_APK_NAME = "miui";
    private static final String PROP_MIUI_VERSION_CODE = "ro.miui.ui.version.code";

    private SdkHelper() {
    }

    public static boolean isMiuiSystem() {
        return TextUtils.isEmpty(getSystemProperty(PROP_MIUI_VERSION_CODE, "")) ^ 1;
    }

    static String getApkPath(Context context, String str, String str2) {
        if (context == null) {
            return guessApkPath(str, str2);
        }
        PackageInfo packageInfo = getPackageInfo(context, str);
        if (packageInfo != null) {
            return packageInfo.applicationInfo.publicSourceDir;
        }
        return null;
    }

    private static String guessApkPath(String str, String str2) {
        str = guessDataApkPath(str);
        if (str == null) {
            return guessSystemApkPath(str2);
        }
        return str;
    }

    private static String guessDataApkPath(String str) {
        String[] strArr = new String[4];
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("/data/app/");
        stringBuilder.append(str);
        stringBuilder.append("-1.apk");
        strArr[0] = stringBuilder.toString();
        stringBuilder = new StringBuilder();
        stringBuilder.append("/data/app/");
        stringBuilder.append(str);
        stringBuilder.append("-2.apk");
        strArr[1] = stringBuilder.toString();
        stringBuilder = new StringBuilder();
        stringBuilder.append("/data/app/");
        stringBuilder.append(str);
        stringBuilder.append("-1/base.apk");
        strArr[2] = stringBuilder.toString();
        stringBuilder = new StringBuilder();
        stringBuilder.append("/data/app/");
        stringBuilder.append(str);
        stringBuilder.append("-2/base.apk");
        strArr[3] = stringBuilder.toString();
        return searchApkPath(strArr);
    }

    private static String guessSystemApkPath(String str) {
        String[] strArr = new String[4];
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("/system/app/");
        stringBuilder.append(str);
        stringBuilder.append(".apk");
        strArr[0] = stringBuilder.toString();
        stringBuilder = new StringBuilder();
        stringBuilder.append("/system/priv-app/");
        stringBuilder.append(str);
        stringBuilder.append(".apk");
        strArr[1] = stringBuilder.toString();
        stringBuilder = new StringBuilder();
        stringBuilder.append("/system/app/");
        stringBuilder.append(str);
        stringBuilder.append("/");
        stringBuilder.append(str);
        stringBuilder.append(".apk");
        strArr[2] = stringBuilder.toString();
        stringBuilder = new StringBuilder();
        stringBuilder.append("/system/priv-app/");
        stringBuilder.append(str);
        stringBuilder.append("/");
        stringBuilder.append(str);
        stringBuilder.append(".apk");
        strArr[3] = stringBuilder.toString();
        return searchApkPath(strArr);
    }

    private static String searchApkPath(String[] strArr) {
        for (String str : strArr) {
            if (new File(str).exists()) {
                return str;
            }
        }
        return null;
    }

    static String getLibPath(Context context, String str) {
        if (context == null) {
            context = getSystemContext();
        }
        if (context == null) {
            return guessLibPath(str);
        }
        PackageInfo packageInfo = getPackageInfo(context, str);
        if (packageInfo != null) {
            return packageInfo.applicationInfo.nativeLibraryDir;
        }
        return null;
    }

    private static String guessLibPath(String str) {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("/data/data/");
        stringBuilder.append(str);
        stringBuilder.append("/lib/");
        return stringBuilder.toString();
    }

    private static PackageInfo getPackageInfo(Context context, String str) {
        try {
            return context.getPackageManager().getPackageInfo(str, 128);
        } catch (NameNotFoundException e) {
            e.printStackTrace();
            return null;
        }
    }

    private static Context getSystemContext() {
        try {
            Class cls = Class.forName("android.app.ActivityThread");
            return (Context) cls.getDeclaredMethod("getSystemContext", new Class[0]).invoke(cls.getDeclaredMethod("currentActivityThread", new Class[0]).invoke(null, new Object[0]), new Object[0]);
        } catch (Throwable e) {
            Log.e("miuisdk", "getSystemContext error", e);
            return null;
        }
    }

    private static String getSystemProperty(String str, String str2) {
        try {
            return (String) Class.forName("android.os.SystemProperties").getDeclaredMethod("get", new Class[]{String.class, String.class}).invoke(null, new Object[]{str, str2});
        } catch (Throwable e) {
            Log.e("miuisdk", "getSystemProperty error", e);
            return str2;
        }
    }
}
