package com.bumptech.glide.load.model;

import android.net.Uri;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.text.TextUtils;
import com.bumptech.glide.load.c;
import com.bumptech.glide.util.i;
import java.net.MalformedURLException;
import java.net.URL;
import java.security.MessageDigest;
import java.util.Map;

/* compiled from: GlideUrl */
public class g implements c {
    private static final String iX = "@#&=*+-_.,:!?()/~'%;$";
    private int hashCode;
    private final h iY;
    @Nullable
    private final String iZ;
    @Nullable
    private String ja;
    @Nullable
    private URL jb;
    @Nullable
    private volatile byte[] jc;
    @Nullable
    private final URL url;

    public g(URL url) {
        this(url, h.je);
    }

    public g(String str) {
        this(str, h.je);
    }

    public g(URL url, h hVar) {
        this.url = (URL) i.checkNotNull(url);
        this.iZ = null;
        this.iY = (h) i.checkNotNull(hVar);
    }

    public g(String str, h hVar) {
        this.url = null;
        this.iZ = i.y(str);
        this.iY = (h) i.checkNotNull(hVar);
    }

    public URL toURL() throws MalformedURLException {
        return bS();
    }

    private URL bS() throws MalformedURLException {
        if (this.jb == null) {
            this.jb = new URL(bU());
        }
        return this.jb;
    }

    public String bT() {
        return bU();
    }

    private String bU() {
        if (TextUtils.isEmpty(this.ja)) {
            String str = this.iZ;
            if (TextUtils.isEmpty(str)) {
                str = ((URL) i.checkNotNull(this.url)).toString();
            }
            this.ja = Uri.encode(str, iX);
        }
        return this.ja;
    }

    public Map<String, String> getHeaders() {
        return this.iY.getHeaders();
    }

    public String getCacheKey() {
        return this.iZ != null ? this.iZ : ((URL) i.checkNotNull(this.url)).toString();
    }

    public String toString() {
        return getCacheKey();
    }

    public void updateDiskCacheKey(@NonNull MessageDigest messageDigest) {
        messageDigest.update(bV());
    }

    private byte[] bV() {
        if (this.jc == null) {
            this.jc = getCacheKey().getBytes(cU);
        }
        return this.jc;
    }

    public boolean equals(Object obj) {
        boolean z = false;
        if (!(obj instanceof g)) {
            return false;
        }
        g gVar = (g) obj;
        if (getCacheKey().equals(gVar.getCacheKey()) && this.iY.equals(gVar.iY)) {
            z = true;
        }
        return z;
    }

    public int hashCode() {
        if (this.hashCode == 0) {
            this.hashCode = getCacheKey().hashCode();
            this.hashCode = (31 * this.hashCode) + this.iY.hashCode();
        }
        return this.hashCode;
    }
}
