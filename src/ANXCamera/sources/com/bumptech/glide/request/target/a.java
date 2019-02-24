package com.bumptech.glide.request.target;

import android.appwidget.AppWidgetManager;
import android.content.ComponentName;
import android.content.Context;
import android.graphics.Bitmap;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.widget.RemoteViews;
import com.bumptech.glide.request.a.f;
import com.bumptech.glide.util.i;

/* compiled from: AppWidgetTarget */
public class a extends l<Bitmap> {
    private final ComponentName componentName;
    private final Context context;
    private final int[] oq;
    private final RemoteViews remoteViews;
    private final int viewId;

    public a(Context context, int i, int i2, int i3, RemoteViews remoteViews, int... iArr) {
        super(i, i2);
        if (iArr.length != 0) {
            this.context = (Context) i.a((Object) context, "Context can not be null!");
            this.remoteViews = (RemoteViews) i.a((Object) remoteViews, "RemoteViews object can not be null!");
            this.oq = (int[]) i.a((Object) iArr, "WidgetIds can not be null!");
            this.viewId = i3;
            this.componentName = null;
            return;
        }
        throw new IllegalArgumentException("WidgetIds must have length > 0");
    }

    public a(Context context, int i, RemoteViews remoteViews, int... iArr) {
        this(context, Integer.MIN_VALUE, Integer.MIN_VALUE, i, remoteViews, iArr);
    }

    public a(Context context, int i, int i2, int i3, RemoteViews remoteViews, ComponentName componentName) {
        super(i, i2);
        this.context = (Context) i.a((Object) context, "Context can not be null!");
        this.remoteViews = (RemoteViews) i.a((Object) remoteViews, "RemoteViews object can not be null!");
        this.componentName = (ComponentName) i.a((Object) componentName, "ComponentName can not be null!");
        this.viewId = i3;
        this.oq = null;
    }

    public a(Context context, int i, RemoteViews remoteViews, ComponentName componentName) {
        this(context, Integer.MIN_VALUE, Integer.MIN_VALUE, i, remoteViews, componentName);
    }

    private void update() {
        AppWidgetManager instance = AppWidgetManager.getInstance(this.context);
        if (this.componentName != null) {
            instance.updateAppWidget(this.componentName, this.remoteViews);
        } else {
            instance.updateAppWidget(this.oq, this.remoteViews);
        }
    }

    public void a(@NonNull Bitmap bitmap, @Nullable f<? super Bitmap> fVar) {
        this.remoteViews.setImageViewBitmap(this.viewId, bitmap);
        update();
    }
}
