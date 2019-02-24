package com.bumptech.glide.load.a.a;

import android.net.Uri;
import com.ss.android.ugc.effectmanager.effect.model.ComposerHelper;

/* compiled from: MediaStoreUtil */
public final class b {
    private static final int dD = 512;
    private static final int dE = 384;

    private b() {
    }

    public static boolean c(Uri uri) {
        return uri != null && ComposerHelper.COMPOSER_CONTENT.equals(uri.getScheme()) && "media".equals(uri.getAuthority());
    }

    private static boolean d(Uri uri) {
        return uri.getPathSegments().contains("video");
    }

    public static boolean e(Uri uri) {
        return c(uri) && d(uri);
    }

    public static boolean f(Uri uri) {
        return c(uri) && !d(uri);
    }

    public static boolean g(int i, int i2) {
        return i != Integer.MIN_VALUE && i2 != Integer.MIN_VALUE && i <= 512 && i2 <= dE;
    }
}
