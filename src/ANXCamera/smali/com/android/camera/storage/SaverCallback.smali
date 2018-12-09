.class public interface abstract Lcom/android/camera/storage/SaverCallback;
.super Ljava/lang/Object;
.source "SaverCallback.java"


# virtual methods
.method public abstract needThumbnail(Z)Z
.end method

.method public abstract notifyNewImage(Landroid/net/Uri;Z)V
.end method

.method public abstract notifyNewVideo(Landroid/net/Uri;)V
.end method

.method public abstract onSaveFinish(I)V
.end method

.method public abstract postHideThumbnailProgressing()V
.end method

.method public abstract postUpdateThumbnail(Lcom/android/camera/Thumbnail;Z)V
.end method

.method public abstract updatePreviewThumbnailUri(Landroid/net/Uri;)V
.end method
