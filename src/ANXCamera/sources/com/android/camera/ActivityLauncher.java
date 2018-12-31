package com.android.camera;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import java.util.Locale;
import miui.os.Build;

public class ActivityLauncher {
    private static String URL_MIUI_PRIVACY_POLICY = "http://www.miui.com/res/doc/privacy.html";

    private ActivityLauncher() {
    }

    public static void launchPrivacyPolicyWebpage(Context context) {
        Intent intent = new Intent("android.intent.action.VIEW");
        String locale = Locale.getDefault().toString();
        String region = Build.getRegion();
        intent.setData(Uri.parse(String.format(Locale.US, "%s?region=%s&lang=%s", new Object[]{URL_MIUI_PRIVACY_POLICY, region, locale})));
        context.startActivity(intent);
    }
}
