.class public interface abstract Lcom/android/camera/wideselfie/WideSelfieEngineWrapper$WideSelfStateCallback;
.super Ljava/lang/Object;
.source "WideSelfieEngineWrapper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/wideselfie/WideSelfieEngineWrapper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "WideSelfStateCallback"
.end annotation


# virtual methods
.method public abstract onMove(IILandroid/graphics/Point;Landroid/graphics/Point;Z)V
.end method

.method public abstract onNv21Available([BII)V
.end method

.method public abstract onPreviewUpdate([BIILandroid/graphics/Rect;Landroid/graphics/Rect;)V
.end method

.method public abstract onWideSelfCompleted()V
.end method
