.class public Lcom/xiaomi/camera/liveshot/MediaCodecCapability;
.super Ljava/lang/Object;
.source "MediaCodecCapability.java"


# static fields
.field public static final HW_AUDIO_CODEC_AAC:Ljava/lang/String; = "OMX.qcom.audio.encoder.aac"

.field public static final HW_VIDEO_CODEC_HEVC:Ljava/lang/String; = "OMX.qcom.video.encoder.hevc"

.field private static final TAG:Ljava/lang/String;

.field private static sRegularCodecList:Landroid/media/MediaCodecList;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 10
    const-class v0, Lcom/xiaomi/camera/liveshot/MediaCodecCapability;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/xiaomi/camera/liveshot/MediaCodecCapability;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static getRegularCodecList()Landroid/media/MediaCodecList;
    .locals 2

    .line 17
    sget-object v0, Lcom/xiaomi/camera/liveshot/MediaCodecCapability;->sRegularCodecList:Landroid/media/MediaCodecList;

    if-nez v0, :cond_0

    .line 18
    new-instance v0, Landroid/media/MediaCodecList;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Landroid/media/MediaCodecList;-><init>(I)V

    sput-object v0, Lcom/xiaomi/camera/liveshot/MediaCodecCapability;->sRegularCodecList:Landroid/media/MediaCodecList;

    .line 20
    :cond_0
    sget-object v0, Lcom/xiaomi/camera/liveshot/MediaCodecCapability;->sRegularCodecList:Landroid/media/MediaCodecList;

    return-object v0
.end method

.method public static isFormatSupported(Landroid/media/MediaFormat;Ljava/lang/String;)Z
    .locals 7

    .line 39
    invoke-static {}, Lcom/xiaomi/camera/liveshot/MediaCodecCapability;->getRegularCodecList()Landroid/media/MediaCodecList;

    move-result-object v0

    .line 40
    invoke-virtual {v0}, Landroid/media/MediaCodecList;->getCodecInfos()[Landroid/media/MediaCodecInfo;

    move-result-object v0

    .line 41
    nop

    .line 42
    const/4 v1, 0x0

    move v2, v1

    move v3, v2

    :goto_0
    array-length v4, v0

    if-ge v2, v4, :cond_2

    if-nez v3, :cond_2

    .line 43
    aget-object v4, v0, v2

    invoke-virtual {v4}, Landroid/media/MediaCodecInfo;->getSupportedTypes()[Ljava/lang/String;

    move-result-object v4

    .line 44
    move v5, v3

    move v3, v1

    :goto_1
    array-length v6, v4

    if-ge v3, v6, :cond_1

    if-nez v5, :cond_1

    .line 45
    aget-object v6, v4, v3

    invoke-virtual {v6, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 46
    aget-object v5, v0, v2

    .line 47
    invoke-virtual {v5, p1}, Landroid/media/MediaCodecInfo;->getCapabilitiesForType(Ljava/lang/String;)Landroid/media/MediaCodecInfo$CodecCapabilities;

    move-result-object v5

    .line 48
    invoke-virtual {v5, p0}, Landroid/media/MediaCodecInfo$CodecCapabilities;->isFormatSupported(Landroid/media/MediaFormat;)Z

    move-result v5

    .line 44
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 42
    :cond_1
    add-int/lit8 v2, v2, 0x1

    move v3, v5

    goto :goto_0

    .line 52
    :cond_2
    sget-object v0, Lcom/xiaomi/camera/liveshot/MediaCodecCapability;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "isFormatSupported(): format = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p0, ", mimeType = "

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, ", supported = "

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 54
    return v3
.end method

.method public static isH265EncodingSupported()Z
    .locals 7

    .line 24
    invoke-static {}, Lcom/xiaomi/camera/liveshot/MediaCodecCapability;->getRegularCodecList()Landroid/media/MediaCodecList;

    move-result-object v0

    .line 25
    invoke-virtual {v0}, Landroid/media/MediaCodecList;->getCodecInfos()[Landroid/media/MediaCodecInfo;

    move-result-object v0

    .line 26
    nop

    .line 27
    const/4 v1, 0x0

    move v2, v1

    :goto_0
    array-length v3, v0

    if-ge v1, v3, :cond_1

    if-nez v2, :cond_1

    .line 28
    aget-object v3, v0, v1

    .line 29
    sget-object v4, Lcom/xiaomi/camera/liveshot/MediaCodecCapability;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "codec.name = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Landroid/media/MediaCodecInfo;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 30
    invoke-virtual {v3}, Landroid/media/MediaCodecInfo;->getName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "OMX.qcom.video.encoder.hevc"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 31
    nop

    .line 27
    const/4 v2, 0x1

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 34
    :cond_1
    sget-object v0, Lcom/xiaomi/camera/liveshot/MediaCodecCapability;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "isH265EncodingSupported(): "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 35
    return v2
.end method
