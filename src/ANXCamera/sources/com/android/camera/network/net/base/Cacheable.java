package com.android.camera.network.net.base;

public interface Cacheable {
    public static final String HEADER_FROM_CACHE = "From-Cache";

    byte[] getData();

    boolean isFromCache();

    void setCacheKey(String str);
}
