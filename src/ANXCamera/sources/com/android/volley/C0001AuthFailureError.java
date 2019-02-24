package com.android.volley;

import android.content.Intent;

/* renamed from: com.android.volley.AuthFailureError */
public class C0001AuthFailureError extends C0000VolleyError {
    private Intent mResolutionIntent;

    public C0001AuthFailureError(Intent intent) {
        this.mResolutionIntent = intent;
    }

    public C0001AuthFailureError(C0015NetworkResponse response) {
        super(response);
    }

    public C0001AuthFailureError(String message) {
        super(message);
    }

    public C0001AuthFailureError(String message, Exception reason) {
        super(message, reason);
    }

    public Intent getResolutionIntent() {
        return this.mResolutionIntent;
    }

    public String getMessage() {
        if (this.mResolutionIntent != null) {
            return "User needs to (re)enter credentials.";
        }
        return super.getMessage();
    }
}
