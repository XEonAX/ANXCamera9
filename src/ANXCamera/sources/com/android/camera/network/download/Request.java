package com.android.camera.network.download;

import android.net.Uri;
import android.text.TextUtils;
import com.android.camera.log.Log;
import java.io.File;

public final class Request {
    private static final String TAG = "Request";
    private boolean mAllowedOverMetered;
    private File mDestination;
    private int mMaxRetryTimes = 3;
    private String mTag;
    private Uri mUri;
    private Verifier mVerifier;

    public interface Constants extends OpenConstants {
    }

    public Request(String str, Uri uri, File file) {
        this.mTag = str;
        this.mUri = uri;
        Object scheme = uri.getScheme();
        if (TextUtils.equals(scheme, "http") || TextUtils.equals(scheme, "https")) {
            if (file.exists()) {
                if (file.isDirectory()) {
                    Log.d(TAG, "output file is a directory");
                    throw new IllegalStateException("dst file exists, is a directory");
                }
                Log.w(TAG, "output file will be overwritten");
            }
            this.mDestination = file;
            return;
        }
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("not support scheme: ");
        stringBuilder.append(scheme);
        throw new IllegalArgumentException(stringBuilder.toString());
    }

    public String getTag() {
        return this.mTag;
    }

    public Uri getUri() {
        return this.mUri;
    }

    public File getDestination() {
        return this.mDestination;
    }

    public boolean isAllowedOverMetered() {
        return this.mAllowedOverMetered;
    }

    public void setAllowedOverMetered(boolean z) {
        this.mAllowedOverMetered = z;
    }

    public Verifier getVerifier() {
        return this.mVerifier;
    }

    public void setVerifier(Verifier verifier) {
        this.mVerifier = verifier;
    }

    public int getMaxRetryTimes() {
        return this.mMaxRetryTimes;
    }

    public void setMaxRetryTimes(int i) {
        this.mMaxRetryTimes = i;
    }

    int getNetworkType() {
        return this.mAllowedOverMetered ^ 1;
    }
}
