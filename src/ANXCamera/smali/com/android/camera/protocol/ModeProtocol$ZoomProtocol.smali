.class public interface abstract Lcom/android/camera/protocol/ModeProtocol$ZoomProtocol;
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
    name = "ZoomProtocol"
.end annotation


# virtual methods
.method public abstract notifyDualZoom(Z)V
.end method

.method public abstract notifyZooming(Z)V
.end method

.method public abstract onZoomRatioChanged(FZ)V
.end method

.method public abstract onZoomSwitchCamera()V
.end method
