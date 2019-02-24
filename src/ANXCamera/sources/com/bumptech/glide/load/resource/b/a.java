package com.bumptech.glide.load.resource.b;

import android.content.Context;
import android.content.res.Resources.NotFoundException;
import android.content.res.Resources.Theme;
import android.graphics.drawable.Drawable;
import android.support.annotation.DrawableRes;
import android.support.annotation.Nullable;
import android.support.v4.content.ContextCompat;
import android.support.v4.content.res.ResourcesCompat;
import android.support.v7.content.res.AppCompatResources;
import android.support.v7.view.ContextThemeWrapper;

/* compiled from: DrawableDecoderCompat */
public final class a {
    private static volatile boolean lp = true;

    private a() {
    }

    public static Drawable a(Context context, Context context2, @DrawableRes int i) {
        return a(context, context2, i, null);
    }

    public static Drawable a(Context context, @DrawableRes int i, @Nullable Theme theme) {
        return a(context, context, i, theme);
    }

    private static Drawable a(Context context, Context context2, @DrawableRes int i, @Nullable Theme theme) {
        try {
            if (lp) {
                return b(context2, i, theme);
            }
        } catch (NoClassDefFoundError e) {
            lp = false;
        } catch (IllegalStateException e2) {
            if (!context.getPackageName().equals(context2.getPackageName())) {
                return ContextCompat.getDrawable(context2, i);
            }
            throw e2;
        } catch (NotFoundException e3) {
        }
        if (theme == null) {
            theme = context2.getTheme();
        }
        return c(context2, i, theme);
    }

    private static Drawable b(Context context, @DrawableRes int i, @Nullable Theme theme) {
        if (theme != null) {
            context = new ContextThemeWrapper(context, theme);
        }
        return AppCompatResources.getDrawable(context, i);
    }

    private static Drawable c(Context context, @DrawableRes int i, @Nullable Theme theme) {
        return ResourcesCompat.getDrawable(context.getResources(), i, theme);
    }
}
