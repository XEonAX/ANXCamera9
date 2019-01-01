package com.android.camera.sticker;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import com.android.camera.log.Log;
import com.sensetime.stmobile.STMobileAuthentificationNative;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class STLicenseUtils {
    private static final String LICENSE_NAME = "SenseME.lic";
    private static final String PREF_ACTIVATE_CODE = "activate_code";
    private static final String PREF_ACTIVATE_CODE_FILE = "activate_code_file";
    private static final String TAG = "STLicenseUtils";

    /* JADX WARNING: Removed duplicated region for block: B:40:0x0078  */
    /* JADX WARNING: Removed duplicated region for block: B:38:0x0070  */
    /* JADX WARNING: Removed duplicated region for block: B:61:0x0109 A:{SYNTHETIC, Splitter: B:61:0x0109} */
    /* JADX WARNING: Removed duplicated region for block: B:66:0x0113 A:{SYNTHETIC, Splitter: B:66:0x0113} */
    /* JADX WARNING: Removed duplicated region for block: B:27:0x0052 A:{SYNTHETIC, Splitter: B:27:0x0052} */
    /* JADX WARNING: Removed duplicated region for block: B:32:0x005c A:{SYNTHETIC, Splitter: B:32:0x005c} */
    /* JADX WARNING: Removed duplicated region for block: B:38:0x0070  */
    /* JADX WARNING: Removed duplicated region for block: B:40:0x0078  */
    /* JADX WARNING: Removed duplicated region for block: B:61:0x0109 A:{SYNTHETIC, Splitter: B:61:0x0109} */
    /* JADX WARNING: Removed duplicated region for block: B:66:0x0113 A:{SYNTHETIC, Splitter: B:66:0x0113} */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public static boolean checkLicense(Context context) {
        IOException e;
        Throwable th;
        StringBuilder stringBuilder = new StringBuilder();
        BufferedReader bufferedReader = null;
        InputStreamReader inputStreamReader;
        BufferedReader bufferedReader2;
        try {
            inputStreamReader = new InputStreamReader(context.getResources().getAssets().open(LICENSE_NAME));
            try {
                bufferedReader2 = new BufferedReader(inputStreamReader);
                while (true) {
                    try {
                        String readLine = bufferedReader2.readLine();
                        if (readLine != null) {
                            stringBuilder.append(readLine);
                            stringBuilder.append("\n");
                        } else {
                            try {
                                break;
                            } catch (IOException e2) {
                                e2.printStackTrace();
                            }
                        }
                    } catch (IOException e3) {
                        e = e3;
                        try {
                            e.printStackTrace();
                            if (inputStreamReader != null) {
                            }
                            if (bufferedReader2 != null) {
                            }
                            if (stringBuilder.toString().length() == 0) {
                            }
                        } catch (Throwable th2) {
                            th = th2;
                            bufferedReader = bufferedReader2;
                            if (inputStreamReader != null) {
                                try {
                                    inputStreamReader.close();
                                } catch (IOException e4) {
                                    e4.printStackTrace();
                                }
                            }
                            if (bufferedReader != null) {
                                try {
                                    bufferedReader.close();
                                } catch (IOException e42) {
                                    e42.printStackTrace();
                                }
                            }
                            throw th;
                        }
                    }
                }
                inputStreamReader.close();
            } catch (IOException e5) {
                e = e5;
                bufferedReader2 = null;
            } catch (Throwable th3) {
                th = th3;
                if (inputStreamReader != null) {
                }
                if (bufferedReader != null) {
                }
                throw th;
            }
            try {
                bufferedReader2.close();
            } catch (IOException e22) {
                e22.printStackTrace();
            }
        } catch (IOException e6) {
            e = e6;
            inputStreamReader = null;
            bufferedReader2 = inputStreamReader;
            e.printStackTrace();
            if (inputStreamReader != null) {
                try {
                    inputStreamReader.close();
                } catch (IOException e222) {
                    e222.printStackTrace();
                }
            }
            if (bufferedReader2 != null) {
                bufferedReader2.close();
            }
            if (stringBuilder.toString().length() == 0) {
            }
        } catch (Throwable th4) {
            th = th4;
            inputStreamReader = null;
            if (inputStreamReader != null) {
            }
            if (bufferedReader != null) {
            }
            throw th;
        }
        if (stringBuilder.toString().length() == 0) {
            Log.e(TAG, "read license data error");
            return false;
        }
        String stringBuilder2 = stringBuilder.toString();
        SharedPreferences sharedPreferences = context.getApplicationContext().getSharedPreferences(PREF_ACTIVATE_CODE_FILE, 0);
        String string = sharedPreferences.getString(PREF_ACTIVATE_CODE, null);
        Integer valueOf = Integer.valueOf(-1);
        String str;
        if (string == null || STMobileAuthentificationNative.checkActiveCodeFromBuffer(stringBuilder2, stringBuilder2.length(), string) != 0) {
            String str2 = TAG;
            StringBuilder stringBuilder3 = new StringBuilder();
            stringBuilder3.append("activeCode: ");
            stringBuilder3.append(string == null);
            Log.e(str2, stringBuilder3.toString());
            stringBuilder2 = STMobileAuthentificationNative.generateActiveCodeFromBuffer(stringBuilder2, stringBuilder2.length());
            if (stringBuilder2 == null || stringBuilder2.length() == 0) {
                str = TAG;
                stringBuilder = new StringBuilder();
                stringBuilder.append("generate license error: ");
                stringBuilder.append(valueOf);
                Log.e(str, stringBuilder.toString());
                return false;
            }
            Editor edit = sharedPreferences.edit();
            edit.putString(PREF_ACTIVATE_CODE, stringBuilder2);
            edit.commit();
            return true;
        }
        str = TAG;
        stringBuilder = new StringBuilder();
        stringBuilder.append("activeCode: ");
        stringBuilder.append(string);
        Log.e(str, stringBuilder.toString());
        return true;
    }
}
