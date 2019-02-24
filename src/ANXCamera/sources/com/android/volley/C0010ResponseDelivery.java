package com.android.volley;

/* renamed from: com.android.volley.ResponseDelivery */
public interface C0010ResponseDelivery {
    void postError(C0021Request<?> c0021Request, C0000VolleyError c0000VolleyError);

    void postResponse(C0021Request<?> c0021Request, C0027Response<?> c0027Response);

    void postResponse(C0021Request<?> c0021Request, C0027Response<?> c0027Response, Runnable runnable);
}
