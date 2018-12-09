package com.bumptech.glide.load.a;

import android.content.res.AssetManager;
import android.support.annotation.NonNull;
import java.io.IOException;
import java.io.InputStream;

/* compiled from: StreamAssetPathFetcher */
public class m extends b<InputStream> {
    public m(AssetManager assetManager, String str) {
        super(assetManager, str);
    }

    /* renamed from: c */
    protected InputStream a(AssetManager assetManager, String str) throws IOException {
        return assetManager.open(str);
    }

    /* renamed from: d */
    protected void h(InputStream inputStream) throws IOException {
        inputStream.close();
    }

    @NonNull
    public Class<InputStream> ad() {
        return InputStream.class;
    }
}
