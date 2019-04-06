package com.arcsoft.avatar.d;

import android.util.Log;

/* compiled from: LogUtil */
public class l {
    private boolean a = false;
    private String b;

    public l(String str) {
        this.b = str;
    }

    public void a(String str) {
        if (this.a) {
            Log.d(this.b, str);
        }
    }

    public void b(String str) {
        if (this.a) {
            Log.i(this.b, str);
        }
    }

    public void c(String str) {
        Log.e(this.b, str);
    }
}
