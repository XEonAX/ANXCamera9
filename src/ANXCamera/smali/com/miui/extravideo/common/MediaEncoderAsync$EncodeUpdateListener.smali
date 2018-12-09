.class public interface abstract Lcom/miui/extravideo/common/MediaEncoderAsync$EncodeUpdateListener;
.super Ljava/lang/Object;
.source "MediaEncoderAsync.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/extravideo/common/MediaEncoderAsync;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "EncodeUpdateListener"
.end annotation


# virtual methods
.method public abstract onEncodeEnd(Z)V
.end method

.method public abstract onError()V
.end method

.method public abstract onInputBufferAvailable(Lcom/miui/extravideo/interpolation/EncodeBufferHolder;)V
.end method
