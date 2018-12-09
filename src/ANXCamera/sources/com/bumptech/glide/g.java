package com.bumptech.glide;

import android.graphics.Bitmap;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.support.annotation.CheckResult;
import android.support.annotation.DrawableRes;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.annotation.RawRes;
import java.io.File;
import java.net.URL;

/* compiled from: ModelTypes */
interface g<T> {
    @CheckResult
    @NonNull
    T a(@Nullable Bitmap bitmap);

    @CheckResult
    @NonNull
    T a(@Nullable Drawable drawable);

    @CheckResult
    @NonNull
    T a(@Nullable Uri uri);

    @CheckResult
    @NonNull
    T a(@Nullable File file);

    @CheckResult
    @NonNull
    T a(@Nullable @RawRes @DrawableRes Integer num);

    @CheckResult
    @NonNull
    T a(@Nullable String str);

    @Deprecated
    @CheckResult
    T a(@Nullable URL url);

    @CheckResult
    @NonNull
    T a(@Nullable byte[] bArr);

    @CheckResult
    @NonNull
    T load(@Nullable Object obj);
}
