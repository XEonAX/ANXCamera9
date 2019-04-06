package com.google.android.libraries.lens.lenslite;

import android.app.Activity;
import android.content.Context;
import android.media.Image;
import android.util.Log;

public class LensliteApi {
    private static final String TAG = "LensliteApi";

    public static LensliteApi create(Context context, Activity activity) {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("create: context = ");
        stringBuilder.append(context);
        stringBuilder.append(", activity = ");
        stringBuilder.append(activity);
        Log.d(str, stringBuilder.toString());
        return null;
    }

    public LensliteUiController getUiController() {
        return null;
    }

    public void onNewImage(Image image, int i) {
    }

    public void onPause() {
    }

    public void onResume() {
    }

    public void onStart(LensliteUiContainer lensliteUiContainer, int i) {
    }

    public void onStop() {
    }
}
