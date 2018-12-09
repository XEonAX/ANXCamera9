.class public Lcom/miui/extravideo/common/MediaDecoderAsync;
.super Ljava/lang/Object;
.source "MediaDecoderAsync.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/extravideo/common/MediaDecoderAsync$DecodeUpdateListener;,
        Lcom/miui/extravideo/common/MediaDecoderAsync$CustomCallback;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "MediaDecoderAsync"


# instance fields
.field private mDecodeFrameIndex:I

.field private mDecoder:Landroid/media/MediaCodec;

.field private mHandler:Landroid/os/Handler;

.field private mInitException:Ljava/lang/Exception;

.field private mListener:Lcom/miui/extravideo/common/MediaDecoderAsync$DecodeUpdateListener;

.field private final mMediaExtractor:Landroid/media/MediaExtractor;

.field private final mMediaParamsHolder:Lcom/miui/extravideo/common/MediaParamsHolder;

.field private mSkipFrameTimes:I

.field private final mTargetFile:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1

    .line 27
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/miui/extravideo/common/MediaDecoderAsync;-><init>(Ljava/lang/String;Landroid/os/Handler;)V

    .line 28
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Landroid/os/Handler;)V
    .locals 5

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    const/4 v0, 0x1

    iput v0, p0, Lcom/miui/extravideo/common/MediaDecoderAsync;->mSkipFrameTimes:I

    .line 21
    const/4 v0, 0x0

    iput v0, p0, Lcom/miui/extravideo/common/MediaDecoderAsync;->mDecodeFrameIndex:I

    .line 31
    iput-object p2, p0, Lcom/miui/extravideo/common/MediaDecoderAsync;->mHandler:Landroid/os/Handler;

    .line 32
    iput-object p1, p0, Lcom/miui/extravideo/common/MediaDecoderAsync;->mTargetFile:Ljava/lang/String;

    .line 33
    new-instance p1, Lcom/miui/extravideo/common/MediaParamsHolder;

    invoke-direct {p1}, Lcom/miui/extravideo/common/MediaParamsHolder;-><init>()V

    iput-object p1, p0, Lcom/miui/extravideo/common/MediaDecoderAsync;->mMediaParamsHolder:Lcom/miui/extravideo/common/MediaParamsHolder;

    .line 34
    new-instance p1, Landroid/media/MediaExtractor;

    invoke-direct {p1}, Landroid/media/MediaExtractor;-><init>()V

    iput-object p1, p0, Lcom/miui/extravideo/common/MediaDecoderAsync;->mMediaExtractor:Landroid/media/MediaExtractor;

    .line 36
    :try_start_0
    iget-object p1, p0, Lcom/miui/extravideo/common/MediaDecoderAsync;->mMediaExtractor:Landroid/media/MediaExtractor;

    iget-object v1, p0, Lcom/miui/extravideo/common/MediaDecoderAsync;->mTargetFile:Ljava/lang/String;

    invoke-virtual {p1, v1}, Landroid/media/MediaExtractor;->setDataSource(Ljava/lang/String;)V

    .line 37
    move p1, v0

    :goto_0
    iget-object v1, p0, Lcom/miui/extravideo/common/MediaDecoderAsync;->mMediaExtractor:Landroid/media/MediaExtractor;

    invoke-virtual {v1}, Landroid/media/MediaExtractor;->getTrackCount()I

    move-result v1

    if-ge p1, v1, :cond_1

    .line 38
    iget-object v1, p0, Lcom/miui/extravideo/common/MediaDecoderAsync;->mMediaExtractor:Landroid/media/MediaExtractor;

    invoke-virtual {v1, p1}, Landroid/media/MediaExtractor;->getTrackFormat(I)Landroid/media/MediaFormat;

    move-result-object v1

    .line 39
    const-string v2, "mime"

    invoke-virtual {v1, v2}, Landroid/media/MediaFormat;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 40
    const-string v3, "video/"

    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 41
    iget-object v3, p0, Lcom/miui/extravideo/common/MediaDecoderAsync;->mMediaParamsHolder:Lcom/miui/extravideo/common/MediaParamsHolder;

    const-string v4, "width"

    invoke-virtual {v1, v4}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    move-result v4

    iput v4, v3, Lcom/miui/extravideo/common/MediaParamsHolder;->videoWidth:I

    .line 42
    iget-object v3, p0, Lcom/miui/extravideo/common/MediaDecoderAsync;->mMediaParamsHolder:Lcom/miui/extravideo/common/MediaParamsHolder;

    const-string v4, "height"

    invoke-virtual {v1, v4}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    move-result v4

    iput v4, v3, Lcom/miui/extravideo/common/MediaParamsHolder;->videoHeight:I

    .line 43
    iget-object v3, p0, Lcom/miui/extravideo/common/MediaDecoderAsync;->mMediaParamsHolder:Lcom/miui/extravideo/common/MediaParamsHolder;

    const-string v4, "rotation-degrees"

    invoke-virtual {v1, v4}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    move-result v4

    iput v4, v3, Lcom/miui/extravideo/common/MediaParamsHolder;->videoDegree:I

    .line 44
    iget-object v3, p0, Lcom/miui/extravideo/common/MediaDecoderAsync;->mMediaParamsHolder:Lcom/miui/extravideo/common/MediaParamsHolder;

    iput-object v2, v3, Lcom/miui/extravideo/common/MediaParamsHolder;->mimeType:Ljava/lang/String;

    .line 45
    iget-object v3, p0, Lcom/miui/extravideo/common/MediaDecoderAsync;->mMediaExtractor:Landroid/media/MediaExtractor;

    invoke-virtual {v3, p1}, Landroid/media/MediaExtractor;->selectTrack(I)V

    .line 46
    invoke-static {v2}, Landroid/media/MediaCodec;->createDecoderByType(Ljava/lang/String;)Landroid/media/MediaCodec;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/extravideo/common/MediaDecoderAsync;->mDecoder:Landroid/media/MediaCodec;

    .line 47
    iget-object p1, p0, Lcom/miui/extravideo/common/MediaDecoderAsync;->mDecoder:Landroid/media/MediaCodec;

    new-instance v2, Lcom/miui/extravideo/common/MediaDecoderAsync$CustomCallback;

    const/4 v3, 0x0

    invoke-direct {v2, p0, v3}, Lcom/miui/extravideo/common/MediaDecoderAsync$CustomCallback;-><init>(Lcom/miui/extravideo/common/MediaDecoderAsync;Lcom/miui/extravideo/common/MediaDecoderAsync$1;)V

    invoke-virtual {p1, v2, p2}, Landroid/media/MediaCodec;->setCallback(Landroid/media/MediaCodec$Callback;Landroid/os/Handler;)V

    .line 48
    iget-object p1, p0, Lcom/miui/extravideo/common/MediaDecoderAsync;->mDecoder:Landroid/media/MediaCodec;

    invoke-virtual {p1, v1, v3, v3, v0}, Landroid/media/MediaCodec;->configure(Landroid/media/MediaFormat;Landroid/view/Surface;Landroid/media/MediaCrypto;I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 49
    goto :goto_1

    .line 37
    :cond_0
    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    .line 54
    :cond_1
    :goto_1
    goto :goto_2

    .line 52
    :catch_0
    move-exception p1

    .line 53
    iput-object p1, p0, Lcom/miui/extravideo/common/MediaDecoderAsync;->mInitException:Ljava/lang/Exception;

    .line 55
    :goto_2
    return-void
.end method

.method static synthetic access$100(Lcom/miui/extravideo/common/MediaDecoderAsync;)Landroid/media/MediaExtractor;
    .locals 0

    .line 13
    iget-object p0, p0, Lcom/miui/extravideo/common/MediaDecoderAsync;->mMediaExtractor:Landroid/media/MediaExtractor;

    return-object p0
.end method

.method static synthetic access$200(Lcom/miui/extravideo/common/MediaDecoderAsync;)I
    .locals 0

    .line 13
    iget p0, p0, Lcom/miui/extravideo/common/MediaDecoderAsync;->mDecodeFrameIndex:I

    return p0
.end method

.method static synthetic access$208(Lcom/miui/extravideo/common/MediaDecoderAsync;)I
    .locals 2

    .line 13
    iget v0, p0, Lcom/miui/extravideo/common/MediaDecoderAsync;->mDecodeFrameIndex:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/miui/extravideo/common/MediaDecoderAsync;->mDecodeFrameIndex:I

    return v0
.end method

.method static synthetic access$300(Lcom/miui/extravideo/common/MediaDecoderAsync;)Lcom/miui/extravideo/common/MediaDecoderAsync$DecodeUpdateListener;
    .locals 0

    .line 13
    iget-object p0, p0, Lcom/miui/extravideo/common/MediaDecoderAsync;->mListener:Lcom/miui/extravideo/common/MediaDecoderAsync$DecodeUpdateListener;

    return-object p0
.end method

.method static synthetic access$400(Lcom/miui/extravideo/common/MediaDecoderAsync;)I
    .locals 0

    .line 13
    iget p0, p0, Lcom/miui/extravideo/common/MediaDecoderAsync;->mSkipFrameTimes:I

    return p0
.end method


# virtual methods
.method public getMediaParamsHolder()Lcom/miui/extravideo/common/MediaParamsHolder;
    .locals 1

    .line 164
    iget-object v0, p0, Lcom/miui/extravideo/common/MediaDecoderAsync;->mMediaParamsHolder:Lcom/miui/extravideo/common/MediaParamsHolder;

    return-object v0
.end method

.method public release()V
    .locals 1

    .line 153
    iget-object v0, p0, Lcom/miui/extravideo/common/MediaDecoderAsync;->mDecoder:Landroid/media/MediaCodec;

    if-eqz v0, :cond_0

    .line 154
    iget-object v0, p0, Lcom/miui/extravideo/common/MediaDecoderAsync;->mDecoder:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->stop()V

    .line 155
    iget-object v0, p0, Lcom/miui/extravideo/common/MediaDecoderAsync;->mDecoder:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->release()V

    .line 156
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/extravideo/common/MediaDecoderAsync;->mDecoder:Landroid/media/MediaCodec;

    .line 158
    :cond_0
    iget-object v0, p0, Lcom/miui/extravideo/common/MediaDecoderAsync;->mMediaExtractor:Landroid/media/MediaExtractor;

    if-eqz v0, :cond_1

    .line 159
    iget-object v0, p0, Lcom/miui/extravideo/common/MediaDecoderAsync;->mMediaExtractor:Landroid/media/MediaExtractor;

    invoke-virtual {v0}, Landroid/media/MediaExtractor;->release()V

    .line 161
    :cond_1
    return-void
.end method

.method public setListener(Lcom/miui/extravideo/common/MediaDecoderAsync$DecodeUpdateListener;)V
    .locals 0

    .line 58
    iput-object p1, p0, Lcom/miui/extravideo/common/MediaDecoderAsync;->mListener:Lcom/miui/extravideo/common/MediaDecoderAsync$DecodeUpdateListener;

    .line 59
    return-void
.end method

.method public setSkipFrameTimes(I)V
    .locals 0

    .line 168
    iput p1, p0, Lcom/miui/extravideo/common/MediaDecoderAsync;->mSkipFrameTimes:I

    .line 169
    return-void
.end method

.method public start()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 62
    iget-object v0, p0, Lcom/miui/extravideo/common/MediaDecoderAsync;->mInitException:Ljava/lang/Exception;

    if-nez v0, :cond_0

    .line 65
    iget-object v0, p0, Lcom/miui/extravideo/common/MediaDecoderAsync;->mDecoder:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->start()V

    .line 66
    return-void

    .line 63
    :cond_0
    iget-object v0, p0, Lcom/miui/extravideo/common/MediaDecoderAsync;->mInitException:Ljava/lang/Exception;

    throw v0
.end method

.method public stop()V
    .locals 2

    .line 135
    iget-object v0, p0, Lcom/miui/extravideo/common/MediaDecoderAsync;->mDecoder:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->stop()V

    .line 136
    iget-object v0, p0, Lcom/miui/extravideo/common/MediaDecoderAsync;->mListener:Lcom/miui/extravideo/common/MediaDecoderAsync$DecodeUpdateListener;

    if-eqz v0, :cond_1

    .line 137
    iget-object v0, p0, Lcom/miui/extravideo/common/MediaDecoderAsync;->mHandler:Landroid/os/Handler;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/extravideo/common/MediaDecoderAsync;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v1

    if-eq v0, v1, :cond_0

    .line 138
    iget-object v0, p0, Lcom/miui/extravideo/common/MediaDecoderAsync;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/miui/extravideo/common/MediaDecoderAsync$1;

    invoke-direct {v1, p0}, Lcom/miui/extravideo/common/MediaDecoderAsync$1;-><init>(Lcom/miui/extravideo/common/MediaDecoderAsync;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0

    .line 147
    :cond_0
    iget-object v0, p0, Lcom/miui/extravideo/common/MediaDecoderAsync;->mListener:Lcom/miui/extravideo/common/MediaDecoderAsync$DecodeUpdateListener;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Lcom/miui/extravideo/common/MediaDecoderAsync$DecodeUpdateListener;->onDecodeStop(Z)V

    .line 150
    :cond_1
    :goto_0
    return-void
.end method
