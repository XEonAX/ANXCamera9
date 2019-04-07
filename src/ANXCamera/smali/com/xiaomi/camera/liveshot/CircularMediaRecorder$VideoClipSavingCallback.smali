.class public interface abstract Lcom/xiaomi/camera/liveshot/CircularMediaRecorder$VideoClipSavingCallback;
.super Ljava/lang/Object;
.source "CircularMediaRecorder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "VideoClipSavingCallback"
.end annotation


# virtual methods
.method public abstract onVideoClipSavingCancelled()V
    .annotation build Landroid/support/annotation/WorkerThread;
    .end annotation
.end method

.method public abstract onVideoClipSavingCompleted([BJ)V
    .param p1    # [B
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/WorkerThread;
    .end annotation
.end method

.method public abstract onVideoClipSavingException(Ljava/lang/Throwable;)V
    .param p1    # Ljava/lang/Throwable;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/WorkerThread;
    .end annotation
.end method
