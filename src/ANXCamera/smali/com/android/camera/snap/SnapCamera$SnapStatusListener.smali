.class public interface abstract Lcom/android/camera/snap/SnapCamera$SnapStatusListener;
.super Ljava/lang/Object;
.source "SnapCamera.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/snap/SnapCamera;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "SnapStatusListener"
.end annotation


# virtual methods
.method public abstract onCameraOpened()V
.end method

.method public abstract onDone(Landroid/net/Uri;)V
.end method

.method public abstract onSkipCapture()V
.end method
