.class public interface abstract Lcom/android/camera/protocol/ModeProtocol$ModeChangeController;
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
    name = "ModeChangeController"
.end annotation


# static fields
.field public static final TYPE_TAG:I = 0xb3


# virtual methods
.method public abstract canSwipeChangeMode()Z
.end method

.method public abstract changeMode(II)V
.end method

.method public abstract selectMode(II)V
.end method
