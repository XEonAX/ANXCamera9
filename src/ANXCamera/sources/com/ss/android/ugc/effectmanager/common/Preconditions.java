package com.ss.android.ugc.effectmanager.common;

import android.os.Looper;

public final class Preconditions {
    private Preconditions() {
    }

    public static void checkUiThread() {
        Thread currentThread = Thread.currentThread();
        if (Looper.getMainLooper().getThread() != currentThread) {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("Method cannot be called off the main application thread (on: ");
            stringBuilder.append(currentThread.getName());
            stringBuilder.append(")");
            throw new IllegalStateException(stringBuilder.toString());
        }
    }
}
