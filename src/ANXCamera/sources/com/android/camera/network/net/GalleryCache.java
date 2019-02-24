package com.android.camera.network.net;

import com.android.camera.log.Log;
import com.android.camera.network.net.base.Cacheable;
import com.android.volley.Cache.C0002Entry;
import com.android.volley.toolbox.C0041DiskBasedCache;
import java.io.File;
import java.util.HashMap;
import java.util.Map;

public class GalleryCache extends C0041DiskBasedCache {
    private static final String TAG = "GalleryCache";

    public GalleryCache(File file, int i) {
        super(file, i);
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("Network cache path: ");
        stringBuilder.append(file.getAbsolutePath());
        Log.d(str, stringBuilder.toString());
        initialize();
    }

    @Deprecated
    public synchronized void put(String str, C0002Entry c0002Entry) {
    }

    public synchronized void put(String str, byte[] bArr, long j, long j2) {
        C0002Entry c0002Entry = new C0002Entry();
        c0002Entry.data = bArr;
        c0002Entry.ttl = j;
        c0002Entry.softTtl = j2;
        super.put(str, c0002Entry);
        String str2 = TAG;
        String str3 = "put cache. key %s size %s expires %s";
        Object[] objArr = new Object[3];
        int i = 0;
        objArr[0] = Integer.valueOf(str.hashCode());
        if (bArr != null) {
            i = bArr.length;
        }
        objArr[1] = Integer.valueOf(i);
        objArr[2] = Long.valueOf(j);
        Log.d(str2, String.format(str3, objArr));
    }

    public synchronized C0002Entry get(String str) {
        C0002Entry c0002Entry;
        c0002Entry = super.get(str);
        if (c0002Entry != null) {
            Map hashMap = new HashMap();
            hashMap.put(Cacheable.HEADER_FROM_CACHE, String.valueOf(true));
            c0002Entry.responseHeaders = hashMap;
            Log.d(TAG, String.format("get cache: key %s, isExpired: %s", new Object[]{Integer.valueOf(str.hashCode()), Boolean.valueOf(c0002Entry.isExpired())}));
            if (!c0002Entry.isExpired()) {
                Log.d(TAG, "cache hit.");
            }
        }
        return c0002Entry;
    }

    public synchronized boolean isCacheValid(String str) {
        C0002Entry c0002Entry = super.get(str);
        if (c0002Entry == null || c0002Entry.isExpired()) {
            return false;
        }
        return true;
    }
}
