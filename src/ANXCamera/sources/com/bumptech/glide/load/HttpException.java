package com.bumptech.glide.load;

import android.support.annotation.Nullable;
import java.io.IOException;

public final class HttpException extends IOException {
    public static final int UNKNOWN = -1;
    private static final long serialVersionUID = 1;
    private final int statusCode;

    public HttpException(int i) {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("Http request failed with status code: ");
        stringBuilder.append(i);
        this(stringBuilder.toString(), i);
    }

    public HttpException(String str) {
        this(str, -1);
    }

    public HttpException(String str, int i) {
        this(str, i, null);
    }

    public HttpException(String str, int i, @Nullable Throwable th) {
        super(str, th);
        this.statusCode = i;
    }

    public int getStatusCode() {
        return this.statusCode;
    }
}
