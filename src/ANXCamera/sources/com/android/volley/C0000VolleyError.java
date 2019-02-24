package com.android.volley;

/* renamed from: com.android.volley.VolleyError */
public class C0000VolleyError extends Exception {
    public final C0015NetworkResponse networkResponse;

    public C0000VolleyError() {
        this.networkResponse = null;
    }

    public C0000VolleyError(C0015NetworkResponse response) {
        this.networkResponse = response;
    }

    public C0000VolleyError(String exceptionMessage) {
        super(exceptionMessage);
        this.networkResponse = null;
    }

    public C0000VolleyError(String exceptionMessage, Throwable reason) {
        super(exceptionMessage, reason);
        this.networkResponse = null;
    }

    public C0000VolleyError(Throwable cause) {
        super(cause);
        this.networkResponse = null;
    }
}
