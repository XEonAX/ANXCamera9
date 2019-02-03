.class public interface abstract Lcom/android/camera2/autozoom/IObjectView;
.super Ljava/lang/Object;
.source "IObjectView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera2/autozoom/IObjectView$IViewInteractive;
    }
.end annotation


# virtual methods
.method public abstract clear(I)V
.end method

.method public abstract feedData(Lcom/android/camera2/autozoom/AutoZoomCaptureResult;)V
.end method

.method public abstract getPreviewSize()Landroid/util/Size;
.end method

.method public abstract isMoving()Z
.end method

.method public abstract isViewActive()Z
.end method

.method public abstract isViewEnabled()Z
.end method

.method public abstract isViewVisibile()Z
.end method

.method public abstract setPreviewSize(Landroid/util/Size;)V
.end method

.method public abstract setViewActive(Z)V
.end method

.method public abstract setViewEnable(Z)V
.end method

.method public abstract setViewVisibility(I)V
.end method
