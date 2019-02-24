package com.android.volley;

import com.android.volley.Cache.C0002Entry;

/* renamed from: com.android.volley.Cache */
public interface C0003Cache {
    void clear();

    C0002Entry get(String str);

    void initialize();

    void invalidate(String str, boolean z);

    void put(String str, C0002Entry c0002Entry);

    void remove(String str);
}
