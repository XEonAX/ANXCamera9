package com.android.volley;

/* renamed from: com.android.volley.RetryPolicy */
public interface C0006RetryPolicy {
    int getCurrentRetryCount();

    int getCurrentTimeout();

    void retry(C0000VolleyError c0000VolleyError) throws C0000VolleyError;
}
