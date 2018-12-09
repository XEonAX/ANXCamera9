package com.bumptech.glide.request.target;

import android.app.Notification;
import android.app.NotificationManager;
import android.content.Context;
import android.graphics.Bitmap;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.widget.RemoteViews;
import com.bumptech.glide.request.a.f;
import com.bumptech.glide.util.i;

/* compiled from: NotificationTarget */
public class j extends l<Bitmap> {
    private final Context context;
    private final int notificationId;
    private final Notification oA;
    private final String oz;
    private final RemoteViews remoteViews;
    private final int viewId;

    public j(Context context, int i, RemoteViews remoteViews, Notification notification, int i2) {
        this(context, i, remoteViews, notification, i2, null);
    }

    public j(Context context, int i, RemoteViews remoteViews, Notification notification, int i2, String str) {
        this(context, Integer.MIN_VALUE, Integer.MIN_VALUE, i, remoteViews, notification, i2, str);
    }

    public j(Context context, int i, int i2, int i3, RemoteViews remoteViews, Notification notification, int i4, String str) {
        super(i, i2);
        this.context = (Context) i.a((Object) context, "Context must not be null!");
        this.oA = (Notification) i.a((Object) notification, "Notification object can not be null!");
        this.remoteViews = (RemoteViews) i.a((Object) remoteViews, "RemoteViews object can not be null!");
        this.viewId = i3;
        this.notificationId = i4;
        this.oz = str;
    }

    private void update() {
        ((NotificationManager) i.checkNotNull((NotificationManager) this.context.getSystemService("notification"))).notify(this.oz, this.notificationId, this.oA);
    }

    public void a(@NonNull Bitmap bitmap, @Nullable f<? super Bitmap> fVar) {
        this.remoteViews.setImageViewBitmap(this.viewId, bitmap);
        update();
    }
}
