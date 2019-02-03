.class public interface abstract Lcom/android/camera/storage/SaverCallback;
.super Ljava/lang/Object;
.source "SaverCallback.java"


# virtual methods
.method public abstract needThumbnail(Z)Z
.end method

.method public abstract notifyNewMediaData(Landroid/net/Uri;Ljava/lang/String;I)V
.end method

.method public abstract onSaveFinish(I)V
.end method

.method public abstract postHideThumbnailProgressing()V
.end method

.method public abstract postUpdateThumbnail(Lcom/android/camera/Thumbnail;Z)V
.end method

.method public abstract updatePreviewThumbnailUri(Landroid/net/Uri;)V
.end method
