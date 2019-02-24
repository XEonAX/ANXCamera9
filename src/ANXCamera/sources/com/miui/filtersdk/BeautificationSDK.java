package com.miui.filtersdk;

import android.content.Context;

public class BeautificationSDK {
    public static Context sContext;

    public static void init(Context context) {
        sContext = context;
    }

    private BeautificationSDK() {
    }
}
