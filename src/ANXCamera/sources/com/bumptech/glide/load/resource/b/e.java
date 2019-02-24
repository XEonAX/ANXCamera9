package com.bumptech.glide.load.resource.b;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.support.annotation.DrawableRes;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.bumptech.glide.load.engine.p;
import com.bumptech.glide.load.f;
import com.bumptech.glide.load.g;
import java.util.List;

/* compiled from: ResourceDrawableDecoder */
public class e implements g<Uri, Drawable> {
    private static final int lq = 2;
    private static final int lr = 0;
    private static final int ls = 1;
    private static final int lt = 1;
    private static final int lu = 0;
    private final Context context;

    public e(Context context) {
        this.context = context.getApplicationContext();
    }

    public boolean a(@NonNull Uri uri, @NonNull f fVar) {
        return uri.getScheme().equals("android.resource");
    }

    @Nullable
    /* renamed from: b */
    public p<Drawable> a(@NonNull Uri uri, int i, int i2, @NonNull f fVar) {
        i = m(uri);
        String authority = uri.getAuthority();
        return d.c(a.a(this.context, authority.equals(this.context.getPackageName()) ? this.context : a(uri, authority), i));
    }

    @NonNull
    private Context a(Uri uri, String str) {
        try {
            return this.context.createPackageContext(str, 0);
        } catch (Throwable e) {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("Failed to obtain context or unrecognized Uri format for: ");
            stringBuilder.append(uri);
            throw new IllegalArgumentException(stringBuilder.toString(), e);
        }
    }

    @DrawableRes
    private int m(Uri uri) {
        Integer valueOf;
        List pathSegments = uri.getPathSegments();
        if (pathSegments.size() == 2) {
            String str = (String) pathSegments.get(0);
            String str2 = (String) pathSegments.get(1);
            valueOf = Integer.valueOf(this.context.getResources().getIdentifier(str2, str, uri.getAuthority()));
        } else {
            if (pathSegments.size() == 1) {
                try {
                    valueOf = Integer.valueOf((String) pathSegments.get(0));
                } catch (NumberFormatException e) {
                }
            }
            valueOf = null;
        }
        StringBuilder stringBuilder;
        if (valueOf == null) {
            stringBuilder = new StringBuilder();
            stringBuilder.append("Unrecognized Uri format: ");
            stringBuilder.append(uri);
            throw new IllegalArgumentException(stringBuilder.toString());
        } else if (valueOf.intValue() != 0) {
            return valueOf.intValue();
        } else {
            stringBuilder = new StringBuilder();
            stringBuilder.append("Failed to obtain resource id for: ");
            stringBuilder.append(uri);
            throw new IllegalArgumentException(stringBuilder.toString());
        }
    }
}
