.class public interface abstract Lcom/xiaomi/camera/core/PostProcessor$PostProcessStatusCallback;
.super Ljava/lang/Object;
.source "PostProcessor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/xiaomi/camera/core/PostProcessor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "PostProcessStatusCallback"
.end annotation


# virtual methods
.method public abstract onImagePostProcessStart(Lcom/xiaomi/camera/core/ParallelTaskData;)V
.end method

.method public abstract onPostProcessorClosed(Lcom/xiaomi/camera/core/PostProcessor;)V
.end method
