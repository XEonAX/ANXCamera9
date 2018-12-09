.class public Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;
.super Ljava/lang/Object;
.source "TEBufferedAudioRecorder.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "TEBufferedAudioRecorder"

.field protected static channelConfigOffset:I

.field protected static channelConfigSuggested:[I

.field protected static sampleRateOffset:I

.field protected static sampleRateSuggested:[I


# instance fields
.field audio:Landroid/media/AudioRecord;

.field audioCaller:Lcom/ss/android/ttve/audio/TEAudioWriterInterface;

.field audioFormat:I

.field bufferSizeInBytes:I

.field channelConfig:I

.field isRecording:Z

.field sampleRateInHz:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 14
    const/4 v0, -0x1

    sput v0, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;->sampleRateOffset:I

    .line 15
    const/4 v1, 0x5

    new-array v1, v1, [I

    fill-array-data v1, :array_0

    sput-object v1, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;->sampleRateSuggested:[I

    .line 16
    sput v0, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;->channelConfigOffset:I

    .line 17
    const/4 v0, 0x3

    new-array v0, v0, [I

    fill-array-data v0, :array_1

    sput-object v0, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;->channelConfigSuggested:[I

    return-void

    :array_0
    .array-data 4
        0xac44
        0x1f40
        0x2b11
        0x3e80
        0x5622
    .end array-data

    :array_1
    .array-data 4
        0xc
        0x10
        0x1
    .end array-data
.end method

.method public constructor <init>(Lcom/ss/android/ttve/audio/TEAudioWriterInterface;)V
    .locals 2

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    const/4 v0, -0x1

    iput v0, p0, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;->sampleRateInHz:I

    .line 24
    const/4 v1, 0x0

    iput v1, p0, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;->bufferSizeInBytes:I

    .line 25
    iput v0, p0, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;->channelConfig:I

    .line 26
    const/4 v0, 0x2

    iput v0, p0, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;->audioFormat:I

    .line 28
    iput-boolean v1, p0, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;->isRecording:Z

    .line 33
    iput-object p1, p0, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;->audioCaller:Lcom/ss/android/ttve/audio/TEAudioWriterInterface;

    .line 34
    return-void
.end method


# virtual methods
.method protected finalize()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 38
    iget-object v0, p0, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;->audio:Landroid/media/AudioRecord;

    if-eqz v0, :cond_1

    .line 40
    :try_start_0
    iget-object v0, p0, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;->audio:Landroid/media/AudioRecord;

    invoke-virtual {v0}, Landroid/media/AudioRecord;->getState()I

    move-result v0

    if-eqz v0, :cond_0

    .line 41
    iget-object v0, p0, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;->audio:Landroid/media/AudioRecord;

    invoke-virtual {v0}, Landroid/media/AudioRecord;->stop()V

    .line 43
    :cond_0
    iget-object v0, p0, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;->audio:Landroid/media/AudioRecord;

    invoke-virtual {v0}, Landroid/media/AudioRecord;->release()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 46
    goto :goto_0

    .line 44
    :catch_0
    move-exception v0

    .line 47
    :goto_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;->audio:Landroid/media/AudioRecord;

    .line 49
    :cond_1
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    .line 50
    return-void
.end method

.method public getSampleRateInHz()I
    .locals 1

    .line 52
    iget v0, p0, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;->sampleRateInHz:I

    return v0
.end method

.method public init(I)V
    .locals 20

    move-object/from16 v1, p0

    .line 55
    iget-object v0, v1, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;->audio:Landroid/media/AudioRecord;

    if-eqz v0, :cond_0

    .line 56
    const-string v0, "TEBufferedAudioRecorder"

    const-string v1, "second time audio init(), skip"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 57
    return-void

    .line 61
    :cond_0
    const/4 v2, -0x1

    :try_start_0
    sget v0, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;->channelConfigOffset:I

    if-eq v0, v2, :cond_1

    sget v0, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;->sampleRateOffset:I

    if-eq v0, v2, :cond_1

    .line 62
    sget-object v0, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;->channelConfigSuggested:[I

    sget v3, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;->channelConfigOffset:I

    aget v0, v0, v3

    iput v0, v1, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;->channelConfig:I

    .line 63
    sget-object v0, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;->sampleRateSuggested:[I

    sget v3, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;->sampleRateOffset:I

    aget v0, v0, v3

    iput v0, v1, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;->sampleRateInHz:I

    .line 65
    iget v0, v1, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;->sampleRateInHz:I

    iget v3, v1, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;->channelConfig:I

    iget v4, v1, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;->audioFormat:I

    invoke-static {v0, v3, v4}, Landroid/media/AudioRecord;->getMinBufferSize(III)I

    move-result v0

    iput v0, v1, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;->bufferSizeInBytes:I

    .line 69
    new-instance v0, Landroid/media/AudioRecord;

    iget v5, v1, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;->sampleRateInHz:I

    iget v6, v1, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;->channelConfig:I

    iget v7, v1, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;->audioFormat:I

    iget v8, v1, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;->bufferSizeInBytes:I

    move-object v3, v0

    move/from16 v4, p1

    invoke-direct/range {v3 .. v8}, Landroid/media/AudioRecord;-><init>(IIIII)V

    iput-object v0, v1, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;->audio:Landroid/media/AudioRecord;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 80
    :cond_1
    goto :goto_0

    .line 77
    :catch_0
    move-exception v0

    .line 78
    const-string v3, "TEBufferedAudioRecorder"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "\u4f7f\u7528\u9884\u8bbe\u914d\u7f6e"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget v5, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;->channelConfigOffset:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, ","

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget v5, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;->sampleRateOffset:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, "\u5b9e\u4f8b\u5316audio recorder\u5931\u8d25\uff0c\u91cd\u65b0\u6d4b\u8bd5\u914d\u7f6e\u3002"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 82
    :goto_0
    iget-object v0, v1, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;->audio:Landroid/media/AudioRecord;

    if-nez v0, :cond_5

    .line 83
    nop

    .line 84
    sput v2, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;->channelConfigOffset:I

    .line 85
    sget-object v3, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;->channelConfigSuggested:[I

    array-length v4, v3

    const/4 v5, 0x0

    move v6, v5

    move v7, v6

    :goto_1
    if-ge v6, v4, :cond_5

    aget v0, v3, v6

    .line 87
    iput v0, v1, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;->channelConfig:I

    .line 88
    sget v0, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;->channelConfigOffset:I

    const/4 v8, 0x1

    add-int/2addr v0, v8

    sput v0, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;->channelConfigOffset:I

    .line 90
    sput v2, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;->sampleRateOffset:I

    .line 92
    sget-object v9, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;->sampleRateSuggested:[I

    array-length v10, v9

    move v11, v5

    :goto_2
    if-ge v11, v10, :cond_3

    aget v12, v9, v11

    .line 93
    sget v0, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;->sampleRateOffset:I

    add-int/2addr v0, v8

    sput v0, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;->sampleRateOffset:I

    .line 95
    :try_start_1
    iget v0, v1, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;->channelConfig:I

    iget v13, v1, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;->audioFormat:I

    invoke-static {v12, v0, v13}, Landroid/media/AudioRecord;->getMinBufferSize(III)I

    move-result v0

    iput v0, v1, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;->bufferSizeInBytes:I

    .line 98
    const-string v0, "TEBufferedAudioRecorder"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "\u8bd5\u7528hz "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v14, " "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v14, v1, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;->channelConfig:I

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v14, " "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v14, v1, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;->audioFormat:I

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v0, v13}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 100
    iget v0, v1, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;->bufferSizeInBytes:I

    if-lez v0, :cond_2

    .line 101
    iput v12, v1, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;->sampleRateInHz:I

    .line 104
    new-instance v0, Landroid/media/AudioRecord;

    iget v15, v1, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;->sampleRateInHz:I

    iget v14, v1, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;->channelConfig:I

    iget v13, v1, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;->audioFormat:I

    iget v2, v1, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;->bufferSizeInBytes:I

    move/from16 v17, v13

    move-object v13, v0

    move/from16 v16, v14

    move/from16 v14, p1

    move/from16 v18, v2

    invoke-direct/range {v13 .. v18}, Landroid/media/AudioRecord;-><init>(IIIII)V

    iput-object v0, v1, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;->audio:Landroid/media/AudioRecord;

    .line 112
    nop

    .line 113
    nop

    .line 126
    move v7, v8

    goto :goto_4

    .line 115
    :cond_2
    sget v0, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;->sampleRateOffset:I

    add-int/2addr v0, v8

    sput v0, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;->sampleRateOffset:I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 123
    goto :goto_3

    .line 117
    :catch_1
    move-exception v0

    .line 118
    iput v5, v1, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;->sampleRateInHz:I

    .line 119
    const/4 v2, 0x0

    iput-object v2, v1, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;->audio:Landroid/media/AudioRecord;

    .line 120
    const-string v2, "TEBufferedAudioRecorder"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "apply audio record sample rate "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v12, " failed: "

    invoke-virtual {v13, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 121
    sget v0, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;->sampleRateOffset:I

    add-int/2addr v0, v8

    sput v0, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;->sampleRateOffset:I

    .line 122
    nop

    .line 92
    :goto_3
    add-int/lit8 v11, v11, 0x1

    const/4 v2, -0x1

    goto/16 :goto_2

    .line 126
    :cond_3
    :goto_4
    if-eqz v7, :cond_4

    .line 127
    goto :goto_5

    .line 85
    :cond_4
    add-int/lit8 v6, v6, 0x1

    const/4 v2, -0x1

    goto/16 :goto_1

    .line 131
    :cond_5
    :goto_5
    iget v0, v1, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;->sampleRateInHz:I

    if-gtz v0, :cond_6

    .line 132
    const-string v0, "TEBufferedAudioRecorder"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "!Init audio recorder failed, hz "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, v1, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;->sampleRateInHz:I

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 133
    return-void

    .line 135
    :cond_6
    const-string v0, "TEBufferedAudioRecorder"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Init audio recorder succeed, apply audio record sample rate "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, v1, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;->sampleRateInHz:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " buffer "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, v1, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;->bufferSizeInBytes:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " state "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, v1, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;->audio:Landroid/media/AudioRecord;

    .line 137
    invoke-virtual {v1}, Landroid/media/AudioRecord;->getState()I

    move-result v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 135
    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 139
    return-void
.end method

.method public startRecording(Ljava/lang/String;DII)V
    .locals 9

    .line 160
    const-string v0, "TEBufferedAudioRecorder"

    const-string v1, "audio startRecording"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 161
    monitor-enter p0

    .line 162
    :try_start_0
    iget-boolean v0, p0, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;->isRecording:Z

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;->audio:Landroid/media/AudioRecord;

    if-nez v0, :cond_0

    goto :goto_0

    .line 164
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;->isRecording:Z

    .line 165
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 167
    iget-object v1, p0, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;->audioCaller:Lcom/ss/android/ttve/audio/TEAudioWriterInterface;

    iget v3, p0, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;->sampleRateInHz:I

    const/4 v4, 0x2

    move-object v2, p1

    move-wide v5, p2

    move v7, p4

    move v8, p5

    invoke-interface/range {v1 .. v8}, Lcom/ss/android/ttve/audio/TEAudioWriterInterface;->initWavFile(Ljava/lang/String;IIDII)I

    move-result p1

    .line 168
    if-eqz p1, :cond_1

    .line 169
    const-string p2, "TEBufferedAudioRecorder"

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string p4, "init wav file failed, ret = "

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 170
    return-void

    .line 173
    :cond_1
    new-instance p1, Ljava/lang/Thread;

    new-instance p2, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder$1;

    invoke-direct {p2, p0}, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder$1;-><init>(Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;)V

    invoke-direct {p1, p2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 221
    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    .line 222
    return-void

    .line 163
    :cond_2
    :goto_0
    :try_start_1
    monitor-exit p0

    return-void

    .line 165
    :catchall_0
    move-exception p1

    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public stopRecording()Z
    .locals 3

    .line 225
    monitor-enter p0

    .line 226
    :try_start_0
    iget-boolean v0, p0, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;->isRecording:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;->audio:Landroid/media/AudioRecord;

    if-nez v0, :cond_0

    goto :goto_0

    .line 232
    :cond_0
    iput-boolean v1, p0, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;->isRecording:Z

    .line 233
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 235
    iget-object v0, p0, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;->audio:Landroid/media/AudioRecord;

    invoke-virtual {v0}, Landroid/media/AudioRecord;->getState()I

    move-result v0

    if-eqz v0, :cond_1

    .line 236
    iget-object v0, p0, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;->audio:Landroid/media/AudioRecord;

    invoke-virtual {v0}, Landroid/media/AudioRecord;->stop()V

    .line 241
    :cond_1
    iget-object v0, p0, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;->audioCaller:Lcom/ss/android/ttve/audio/TEAudioWriterInterface;

    invoke-interface {v0}, Lcom/ss/android/ttve/audio/TEAudioWriterInterface;->closeWavFile()I

    .line 243
    const/4 v0, 0x1

    return v0

    .line 227
    :cond_2
    :goto_0
    :try_start_1
    const-string v0, "TEBufferedAudioRecorder"

    const-string v2, "\u672a\u542f\u52a8\u97f3\u9891\u6a21\u5757\u4f46\u8c03\u7528stopRecording"

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 228
    iget-object v0, p0, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;->audio:Landroid/media/AudioRecord;

    if-eqz v0, :cond_3

    .line 229
    iget-object v0, p0, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;->audio:Landroid/media/AudioRecord;

    invoke-virtual {v0}, Landroid/media/AudioRecord;->release()V

    .line 230
    :cond_3
    monitor-exit p0

    return v1

    .line 233
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public unInit()V
    .locals 1

    .line 142
    iget-object v0, p0, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;->audio:Landroid/media/AudioRecord;

    if-eqz v0, :cond_1

    .line 144
    :try_start_0
    iget-object v0, p0, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;->audio:Landroid/media/AudioRecord;

    invoke-virtual {v0}, Landroid/media/AudioRecord;->getState()I

    move-result v0

    if-eqz v0, :cond_0

    .line 145
    iget-object v0, p0, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;->audio:Landroid/media/AudioRecord;

    invoke-virtual {v0}, Landroid/media/AudioRecord;->stop()V

    .line 147
    :cond_0
    iget-object v0, p0, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;->audio:Landroid/media/AudioRecord;

    invoke-virtual {v0}, Landroid/media/AudioRecord;->release()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 150
    goto :goto_0

    .line 148
    :catch_0
    move-exception v0

    .line 151
    :goto_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;->audio:Landroid/media/AudioRecord;

    .line 154
    :cond_1
    iget-object v0, p0, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;->audioCaller:Lcom/ss/android/ttve/audio/TEAudioWriterInterface;

    if-eqz v0, :cond_2

    .line 155
    iget-object v0, p0, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;->audioCaller:Lcom/ss/android/ttve/audio/TEAudioWriterInterface;

    invoke-interface {v0}, Lcom/ss/android/ttve/audio/TEAudioWriterInterface;->destroy()V

    .line 157
    :cond_2
    return-void
.end method
