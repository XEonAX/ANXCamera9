.class public interface abstract Lcom/android/camera/protocol/ModeProtocol$DualController;
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
    name = "DualController"
.end annotation


# static fields
.field public static final TYPE_TAG:I = 0xb6


# virtual methods
.method public abstract hideSlideView()V
.end method

.method public abstract hideZoomButton()V
.end method

.method public abstract isZoomVisible()Z
.end method

.method public abstract showZoomButton()V
.end method

.method public abstract updateZoomValue()V
.end method

.method public abstract visibleHeight()I
.end method
