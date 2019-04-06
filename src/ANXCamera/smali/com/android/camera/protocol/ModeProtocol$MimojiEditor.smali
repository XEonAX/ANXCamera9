.class public interface abstract Lcom/android/camera/protocol/ModeProtocol$MimojiEditor;
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
    name = "MimojiEditor"
.end annotation


# static fields
.field public static final TYPE_TAG:I = 0xe0


# virtual methods
.method public abstract onDeviceRotationChange(I)V
.end method

.method public abstract onTypeConfigSelect(I)V
.end method

.method public abstract requestRender()V
.end method

.method public abstract showTips()V
.end method

.method public abstract startMimojiEdit()V
.end method

.method public abstract updateThumbnail()V
.end method
