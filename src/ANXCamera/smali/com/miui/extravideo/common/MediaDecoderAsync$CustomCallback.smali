.class Lcom/miui/extravideo/common/MediaDecoderAsync$CustomCallback;
.super Landroid/media/MediaCodec$Callback;
.source "MediaDecoderAsync.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/extravideo/common/MediaDecoderAsync;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "CustomCallback"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/extravideo/common/MediaDecoderAsync;


# direct methods
.method private constructor <init>(Lcom/miui/extravideo/common/MediaDecoderAsync;)V
    .locals 0

    .line 68
    iput-object p1, p0, Lcom/miui/extravideo/common/MediaDecoderAsync$CustomCallback;->this$0:Lcom/miui/extravideo/common/MediaDecoderAsync;

    invoke-direct {p0}, Landroid/media/MediaCodec$Callback;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/extravideo/common/MediaDecoderAsync;Lcom/miui/extravideo/common/MediaDecoderAsync$1;)V
    .locals 0

    .line 68
    invoke-direct {p0, p1}, Lcom/miui/extravideo/common/MediaDecoderAsync$CustomCallback;-><init>(Lcom/miui/extravideo/common/MediaDecoderAsync;)V

    return-void
.end method


# virtual methods
.method public onError(Landroid/media/MediaCodec;Landroid/media/MediaCodec$CodecException;)V
    .locals 1
    .param p1    # Landroid/media/MediaCodec;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/media/MediaCodec$CodecException;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 119
    const-string p1, "MediaDecoderAsync"

    const-string v0, "onError"

    invoke-static {p1, v0, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 120
    iget-object p1, p0, Lcom/miui/extravideo/common/MediaDecoderAsync$CustomCallback;->this$0:Lcom/miui/extravideo/common/MediaDecoderAsync;

    invoke-static {p1}, Lcom/miui/extravideo/common/MediaDecoderAsync;->access$300(Lcom/miui/extravideo/common/MediaDecoderAsync;)Lcom/miui/extravideo/common/MediaDecoderAsync$DecodeUpdateListener;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 121
    iget-object p1, p0, Lcom/miui/extravideo/common/MediaDecoderAsync$CustomCallback;->this$0:Lcom/miui/extravideo/common/MediaDecoderAsync;

    invoke-static {p1}, Lcom/miui/extravideo/common/MediaDecoderAsync;->access$300(Lcom/miui/extravideo/common/MediaDecoderAsync;)Lcom/miui/extravideo/common/MediaDecoderAsync$DecodeUpdateListener;

    move-result-object p1

    invoke-interface {p1}, Lcom/miui/extravideo/common/MediaDecoderAsync$DecodeUpdateListener;->onError()V

    .line 123
    :cond_0
    return-void
.end method

.method public onInputBufferAvailable(Landroid/media/MediaCodec;I)V
    .locals 10
    .param p1    # Landroid/media/MediaCodec;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 73
    :try_start_0
    invoke-virtual {p1, p2}, Landroid/media/MediaCodec;->getInputBuffer(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 74
    iget-object v1, p0, Lcom/miui/extravideo/common/MediaDecoderAsync$CustomCallback;->this$0:Lcom/miui/extravideo/common/MediaDecoderAsync;

    invoke-static {v1}, Lcom/miui/extravideo/common/MediaDecoderAsync;->access$100(Lcom/miui/extravideo/common/MediaDecoderAsync;)Landroid/media/MediaExtractor;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2}, Landroid/media/MediaExtractor;->readSampleData(Ljava/nio/ByteBuffer;I)I

    move-result v6

    .line 75
    iget-object v0, p0, Lcom/miui/extravideo/common/MediaDecoderAsync$CustomCallback;->this$0:Lcom/miui/extravideo/common/MediaDecoderAsync;

    invoke-static {v0}, Lcom/miui/extravideo/common/MediaDecoderAsync;->access$100(Lcom/miui/extravideo/common/MediaDecoderAsync;)Landroid/media/MediaExtractor;

    move-result-object v0

    invoke-virtual {v0}, Landroid/media/MediaExtractor;->getSampleTime()J

    move-result-wide v7

    .line 76
    iget-object v0, p0, Lcom/miui/extravideo/common/MediaDecoderAsync$CustomCallback;->this$0:Lcom/miui/extravideo/common/MediaDecoderAsync;

    invoke-static {v0}, Lcom/miui/extravideo/common/MediaDecoderAsync;->access$208(Lcom/miui/extravideo/common/MediaDecoderAsync;)I

    .line 77
    const-string v0, "MediaDecoderAsync"

    const-string v1, "input  decode index : %d time : %d simple size : %d"

    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/Object;

    iget-object v4, p0, Lcom/miui/extravideo/common/MediaDecoderAsync$CustomCallback;->this$0:Lcom/miui/extravideo/common/MediaDecoderAsync;

    invoke-static {v4}, Lcom/miui/extravideo/common/MediaDecoderAsync;->access$200(Lcom/miui/extravideo/common/MediaDecoderAsync;)I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v2

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    const/4 v5, 0x1

    aput-object v4, v3, v5

    const/4 v4, 0x2

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v1, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 78
    iget-object v0, p0, Lcom/miui/extravideo/common/MediaDecoderAsync$CustomCallback;->this$0:Lcom/miui/extravideo/common/MediaDecoderAsync;

    invoke-static {v0}, Lcom/miui/extravideo/common/MediaDecoderAsync;->access$300(Lcom/miui/extravideo/common/MediaDecoderAsync;)Lcom/miui/extravideo/common/MediaDecoderAsync$DecodeUpdateListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 79
    iget-object v0, p0, Lcom/miui/extravideo/common/MediaDecoderAsync$CustomCallback;->this$0:Lcom/miui/extravideo/common/MediaDecoderAsync;

    invoke-static {v0}, Lcom/miui/extravideo/common/MediaDecoderAsync;->access$300(Lcom/miui/extravideo/common/MediaDecoderAsync;)Lcom/miui/extravideo/common/MediaDecoderAsync$DecodeUpdateListener;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/extravideo/common/MediaDecoderAsync$CustomCallback;->this$0:Lcom/miui/extravideo/common/MediaDecoderAsync;

    invoke-static {v1}, Lcom/miui/extravideo/common/MediaDecoderAsync;->access$200(Lcom/miui/extravideo/common/MediaDecoderAsync;)I

    move-result v1

    invoke-interface {v0, v1, v7, v8}, Lcom/miui/extravideo/common/MediaDecoderAsync$DecodeUpdateListener;->onFrameDecodeBegin(IJ)V

    .line 81
    :cond_0
    if-gez v6, :cond_1

    .line 82
    const/4 v2, 0x0

    const/4 v3, 0x0

    const-wide/16 v4, 0x0

    const/4 v6, 0x4

    move-object v0, p1

    move v1, p2

    invoke-virtual/range {v0 .. v6}, Landroid/media/MediaCodec;->queueInputBuffer(IIIJI)V

    goto :goto_1

    .line 84
    :cond_1
    const/4 v5, 0x0

    const/4 v9, 0x0

    move-object v3, p1

    move v4, p2

    invoke-virtual/range {v3 .. v9}, Landroid/media/MediaCodec;->queueInputBuffer(IIIJI)V

    .line 85
    :goto_0
    iget-object p1, p0, Lcom/miui/extravideo/common/MediaDecoderAsync$CustomCallback;->this$0:Lcom/miui/extravideo/common/MediaDecoderAsync;

    invoke-static {p1}, Lcom/miui/extravideo/common/MediaDecoderAsync;->access$400(Lcom/miui/extravideo/common/MediaDecoderAsync;)I

    move-result p1

    if-ge v2, p1, :cond_2

    .line 86
    iget-object p1, p0, Lcom/miui/extravideo/common/MediaDecoderAsync$CustomCallback;->this$0:Lcom/miui/extravideo/common/MediaDecoderAsync;

    invoke-static {p1}, Lcom/miui/extravideo/common/MediaDecoderAsync;->access$100(Lcom/miui/extravideo/common/MediaDecoderAsync;)Landroid/media/MediaExtractor;

    move-result-object p1

    invoke-virtual {p1}, Landroid/media/MediaExtractor;->advance()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 85
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 91
    :cond_2
    :goto_1
    goto :goto_2

    .line 89
    :catch_0
    move-exception p1

    .line 90
    const-string p2, "MediaDecoderAsync"

    const-string v0, "onInputBufferAvailable exception"

    invoke-static {p2, v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 92
    :goto_2
    return-void
.end method

.method public onOutputBufferAvailable(Landroid/media/MediaCodec;ILandroid/media/MediaCodec$BufferInfo;)V
    .locals 7
    .param p1    # Landroid/media/MediaCodec;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Landroid/media/MediaCodec$BufferInfo;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 97
    :try_start_0
    iget v0, p3, Landroid/media/MediaCodec$BufferInfo;->flags:I

    and-int/lit8 v0, v0, 0x4

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_0

    .line 98
    move v0, v2

    goto :goto_0

    .line 97
    :cond_0
    nop

    .line 98
    move v0, v1

    :goto_0
    invoke-virtual {p1, p2}, Landroid/media/MediaCodec;->getOutputBuffer(I)Ljava/nio/ByteBuffer;

    move-result-object v3

    .line 99
    if-nez v0, :cond_1

    .line 100
    iget-object v0, p0, Lcom/miui/extravideo/common/MediaDecoderAsync$CustomCallback;->this$0:Lcom/miui/extravideo/common/MediaDecoderAsync;

    invoke-static {v0}, Lcom/miui/extravideo/common/MediaDecoderAsync;->access$300(Lcom/miui/extravideo/common/MediaDecoderAsync;)Lcom/miui/extravideo/common/MediaDecoderAsync$DecodeUpdateListener;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 101
    iget-object v0, p0, Lcom/miui/extravideo/common/MediaDecoderAsync$CustomCallback;->this$0:Lcom/miui/extravideo/common/MediaDecoderAsync;

    invoke-static {v0}, Lcom/miui/extravideo/common/MediaDecoderAsync;->access$300(Lcom/miui/extravideo/common/MediaDecoderAsync;)Lcom/miui/extravideo/common/MediaDecoderAsync$DecodeUpdateListener;

    move-result-object v0

    invoke-interface {v0, v3, p3}, Lcom/miui/extravideo/common/MediaDecoderAsync$DecodeUpdateListener;->onDecodeBuffer(Ljava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)V

    .line 102
    const-string v0, "MediaDecoderAsync"

    const-string v4, "output decode presentation time : %d"

    new-array v2, v2, [Ljava/lang/Object;

    iget-wide v5, p3, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p3

    aput-object p3, v2, v1

    invoke-static {v4, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p3

    invoke-static {v0, p3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 103
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 104
    invoke-virtual {p1, p2, v1}, Landroid/media/MediaCodec;->releaseOutputBuffer(IZ)V

    goto :goto_1

    .line 107
    :cond_1
    iget-object p1, p0, Lcom/miui/extravideo/common/MediaDecoderAsync$CustomCallback;->this$0:Lcom/miui/extravideo/common/MediaDecoderAsync;

    invoke-static {p1}, Lcom/miui/extravideo/common/MediaDecoderAsync;->access$300(Lcom/miui/extravideo/common/MediaDecoderAsync;)Lcom/miui/extravideo/common/MediaDecoderAsync$DecodeUpdateListener;

    move-result-object p1

    if-eqz p1, :cond_2

    .line 108
    iget-object p1, p0, Lcom/miui/extravideo/common/MediaDecoderAsync$CustomCallback;->this$0:Lcom/miui/extravideo/common/MediaDecoderAsync;

    invoke-static {p1}, Lcom/miui/extravideo/common/MediaDecoderAsync;->access$300(Lcom/miui/extravideo/common/MediaDecoderAsync;)Lcom/miui/extravideo/common/MediaDecoderAsync$DecodeUpdateListener;

    move-result-object p1

    invoke-interface {p1, v2}, Lcom/miui/extravideo/common/MediaDecoderAsync$DecodeUpdateListener;->onDecodeStop(Z)V

    .line 109
    const-string p1, "MediaDecoderAsync"

    const-string p2, "OutputBuffer BUFFER_FLAG_END_OF_STREAM"

    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 114
    :cond_2
    :goto_1
    goto :goto_2

    .line 112
    :catch_0
    move-exception p1

    .line 113
    const-string p2, "MediaDecoderAsync"

    const-string p3, "onOutputBufferAvailable exception"

    invoke-static {p2, p3, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 115
    :goto_2
    return-void
.end method

.method public onOutputFormatChanged(Landroid/media/MediaCodec;Landroid/media/MediaFormat;)V
    .locals 3
    .param p1    # Landroid/media/MediaCodec;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/media/MediaFormat;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 127
    const-string p1, "MediaDecoderAsync"

    const-string v0, "onOutputFormatChanged : %s"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p2, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 128
    iget-object p1, p0, Lcom/miui/extravideo/common/MediaDecoderAsync$CustomCallback;->this$0:Lcom/miui/extravideo/common/MediaDecoderAsync;

    invoke-static {p1}, Lcom/miui/extravideo/common/MediaDecoderAsync;->access$300(Lcom/miui/extravideo/common/MediaDecoderAsync;)Lcom/miui/extravideo/common/MediaDecoderAsync$DecodeUpdateListener;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 129
    iget-object p1, p0, Lcom/miui/extravideo/common/MediaDecoderAsync$CustomCallback;->this$0:Lcom/miui/extravideo/common/MediaDecoderAsync;

    invoke-static {p1}, Lcom/miui/extravideo/common/MediaDecoderAsync;->access$300(Lcom/miui/extravideo/common/MediaDecoderAsync;)Lcom/miui/extravideo/common/MediaDecoderAsync$DecodeUpdateListener;

    move-result-object p1

    invoke-interface {p1, p2}, Lcom/miui/extravideo/common/MediaDecoderAsync$DecodeUpdateListener;->onOutputFormatChange(Landroid/media/MediaFormat;)V

    .line 131
    :cond_0
    return-void
.end method
