.class public interface abstract Lcom/android/camera/protocol/ModeProtocol$PanoramaProtocol;
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
    name = "PanoramaProtocol"
.end annotation


# static fields
.field public static final TYPE_TAG:I = 0xb0


# virtual methods
.method public abstract getPreivewContainer()Landroid/view/ViewGroup;
.end method

.method public abstract initPreviewLayout(IIII)V
.end method

.method public abstract isShown()Z
.end method

.method public abstract onCaptureOrientationDecided(III)V
.end method

.method public abstract onPreviewMoving()V
.end method

.method public abstract requestRender()V
.end method

.method public abstract resetShootUI()V
.end method

.method public abstract setDirectionPosition(Landroid/graphics/Point;I)V
.end method

.method public abstract setDirectionTooFast(ZI)V
.end method

.method public abstract setDisplayPreviewBitmap(Landroid/graphics/Bitmap;)V
.end method

.method public abstract setShootUI()V
.end method

.method public abstract showSmallPreview(Z)V
.end method
