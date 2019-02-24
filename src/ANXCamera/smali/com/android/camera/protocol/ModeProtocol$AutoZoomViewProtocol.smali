.class public interface abstract Lcom/android/camera/protocol/ModeProtocol$AutoZoomViewProtocol;
.super Ljava/lang/Object;
.source "ModeProtocol.java"

# interfaces
.implements Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/protocol/ModeProtocol;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "AutoZoomViewProtocol"
.end annotation


# static fields
.field public static final TYPE_TAG:I = 0xd6


# virtual methods
.method public abstract feedData(Lcom/android/camera2/autozoom/AutoZoomCaptureResult;)V
.end method

.method public abstract isAutoZoomActive()Z
.end method

.method public abstract isAutoZoomEnabled()Z
.end method

.method public abstract onAutoZoomStarted()V
.end method

.method public abstract onAutoZoomStopped()V
.end method

.method public abstract onTrackingStarted(Landroid/graphics/RectF;)V
.end method

.method public abstract onTrackingStopped(I)V
.end method
