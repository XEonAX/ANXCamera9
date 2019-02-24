package com.android.volley;

import com.android.volley.Cache.C0002Entry;

/* renamed from: com.android.volley.Response */
public class C0027Response<T> {
    public final C0002Entry cacheEntry;
    public final C0000VolleyError error;
    public boolean intermediate;
    public final T result;

    public static <T> C0027Response<T> success(T result, C0002Entry cacheEntry) {
        return new C0027Response(result, cacheEntry);
    }

    public static <T> C0027Response<T> error(C0000VolleyError error) {
        return new C0027Response(error);
    }

    public boolean isSuccess() {
        return this.error == null;
    }

    private C0027Response(T result, C0002Entry cacheEntry) {
        this.intermediate = false;
        this.result = result;
        this.cacheEntry = cacheEntry;
        this.error = null;
    }

    private C0027Response(C0000VolleyError error) {
        this.intermediate = false;
        this.result = null;
        this.cacheEntry = null;
        this.error = error;
    }
}
