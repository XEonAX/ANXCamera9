package com.android.volley.toolbox;

import com.android.volley.C0001AuthFailureError;

/* renamed from: com.android.volley.toolbox.Authenticator */
public interface C0033Authenticator {
    String getAuthToken() throws C0001AuthFailureError;

    void invalidateAuthToken(String str);
}
