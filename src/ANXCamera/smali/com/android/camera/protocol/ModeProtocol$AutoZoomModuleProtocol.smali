.class public interface abstract Lcom/android/camera/protocol/ModeProtocol$AutoZoomModuleProtocol;
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
    name = "AutoZoomModuleProtocol"
.end annotation


# static fields
.field public static final TYPE_TAG:I = 0xd7


# virtual methods
.method public abstract setAutoZoomMode(I)V
.end method

.method public abstract setAutoZoomStartCapture(Landroid/graphics/RectF;)V
.end method

.method public abstract setAutoZoomStopCapture(I)V
.end method

.method public abstract startAutoZoom()V
.end method

.method public abstract startTracking(Landroid/graphics/RectF;)V
.end method

.method public abstract stopAutoZoom()V
.end method

.method public abstract stopTracking(I)V
.end method
