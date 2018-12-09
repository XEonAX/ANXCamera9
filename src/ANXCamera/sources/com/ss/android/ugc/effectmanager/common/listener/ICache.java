package com.ss.android.ugc.effectmanager.common.listener;

import java.io.InputStream;

public interface ICache {
    void clear();

    boolean has(String str);

    InputStream queryToStream(String str);

    String queryToString(String str);

    boolean remove(String str);

    void save(String str, String str2);
}
