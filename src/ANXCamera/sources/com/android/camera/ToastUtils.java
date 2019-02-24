package com.android.camera;

import android.content.Context;
import android.content.res.Resources;
import android.text.TextUtils;
import android.view.InflateException;
import android.widget.Toast;
import java.lang.ref.WeakReference;

public class ToastUtils {
    private static final long SHORT_DURATION_TIMEOUT = 2000;
    private static int sGravity = 17;
    private static String sOldMsg;
    private static long sOneTime = 0;
    protected static Toast sToast = null;
    private static long sTwoTime = 0;
    private static int sXOffset = 0;
    private static int sYOffset = 0;

    public static void showToast(Context context, String str) {
        showToast(new WeakReference(context), str, 17, 0, 0);
    }

    public static void showToast(Context context, int i) {
        if (context != null) {
            Resources resources = context.getResources();
            if (resources != null) {
                showToast(new WeakReference(context), resources.getString(i), 17, 0, 0);
            }
        }
    }

    public static void showToast(Context context, String str, int i) {
        if (context != null && context.getResources() != null) {
            showToast(new WeakReference(context), str, i, 0, 0);
        }
    }

    public static void showToast(Context context, String str, int i, int i2, int i3) {
        if (context != null && context.getResources() != null) {
            showToast(new WeakReference(context), str, i, i2, i3);
        }
    }

    private static void showToast(WeakReference<Context> weakReference, String str, int i, int i2, int i3) {
        if (!TextUtils.isEmpty(str)) {
            int i4 = 0;
            if (sToast == null) {
                Context context = (Context) weakReference.get();
                if (context != null) {
                    try {
                        sToast = Toast.makeText(context.getApplicationContext(), str, 0);
                        sToast.setGravity(i, i2, i3);
                        sToast.show();
                        sOldMsg = str;
                        sGravity = i;
                        sXOffset = i2;
                        sYOffset = i3;
                        sOneTime = System.currentTimeMillis();
                    } catch (InflateException e) {
                        sToast = null;
                        e.printStackTrace();
                    } catch (Exception e2) {
                        sToast = null;
                        e2.printStackTrace();
                    }
                }
            } else {
                sTwoTime = System.currentTimeMillis();
                int i5 = 1;
                if (!(sOldMsg == null || sOldMsg.equals(str))) {
                    sOldMsg = str;
                    sToast.setText(str);
                    i4 = 1;
                }
                if (i == sGravity && sXOffset == i2 && sYOffset == i3) {
                    i5 = i4;
                } else {
                    sToast.setGravity(i, i2, i3);
                    sGravity = i;
                    sXOffset = i2;
                    sYOffset = i3;
                }
                if (i5 != 0 || sTwoTime - sOneTime > 2000) {
                    sOneTime = sTwoTime;
                    sToast.show();
                }
            }
        }
    }
}
