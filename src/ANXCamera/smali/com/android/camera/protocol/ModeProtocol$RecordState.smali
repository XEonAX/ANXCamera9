.class public interface abstract Lcom/android/camera/protocol/ModeProtocol$RecordState;
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
    name = "RecordState"
.end annotation


# static fields
.field public static final TYPE_TAG:I = 0xd4


# virtual methods
.method public abstract onFailed()V
.end method

.method public abstract onFinish()V
.end method

.method public abstract onPause()V
.end method

.method public abstract onPostPreview()V
.end method

.method public abstract onPostPreviewBack()V
.end method

.method public abstract onPostSavingFinish()V
.end method

.method public abstract onPostSavingStart()V
.end method

.method public abstract onPrepare()V
.end method

.method public abstract onResume()V
.end method

.method public abstract onStart()V
.end method
