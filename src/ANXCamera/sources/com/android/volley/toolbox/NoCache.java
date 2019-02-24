package com.android.volley.toolbox;

import com.android.volley.Cache;
import com.android.volley.Cache.Entry;

public class NoCache implements Cache {
    public void clear() {
    }

    public Entry get(String str) {
        return null;
    }

    public void put(String str, Entry entry) {
    }

    public void invalidate(String str, boolean z) {
    }

    public void remove(String str) {
    }

    public void initialize() {
    }
}
