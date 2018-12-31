.class public interface abstract Lcom/android/camera/CameraScreenNail$NailListener;
.super Ljava/lang/Object;
.source "CameraScreenNail.java"

# interfaces
.implements Lcom/android/camera/SurfaceTextureScreenNail$SurfaceTextureScreenNailCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/CameraScreenNail;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "NailListener"
.end annotation


# virtual methods
.method public abstract getOrientation()I
.end method

.method public abstract isKeptBitmapTexture()Z
.end method

.method public abstract onFrameAvailable(I)V
.end method

.method public abstract onPreviewPixelsRead([BII)V
.end method

.method public abstract onPreviewTextureCopied()V
.end method
