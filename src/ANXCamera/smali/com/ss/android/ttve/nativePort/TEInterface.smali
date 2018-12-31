.class public final Lcom/ss/android/ttve/nativePort/TEInterface;
.super Lcom/ss/android/ttve/nativePort/TENativeServiceBase;
.source "TEInterface.java"


# annotations
.annotation build Landroid/support/annotation/Keep;
.end annotation


# static fields
.field private static final OPTION_UPDATE_ANYTIME:I = 0x1

.field private static final OPTION_UPDATE_BEFORE_PREPARE:I = 0x0

.field private static final TAG:Ljava/lang/String; = "TEInterface"


# instance fields
.field private mHostTrackIndex:I

.field private mNative:J


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 20
    invoke-static {}, Lcom/ss/android/ttve/nativePort/TENativeLibsLoader;->loadLibrary()V

    .line 21
    return-void
.end method

.method private constructor <init>()V
    .locals 2

    .line 33
    invoke-direct {p0}, Lcom/ss/android/ttve/nativePort/TENativeServiceBase;-><init>()V

    .line 27
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    .line 28
    const/4 v0, -0x1

    iput v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mHostTrackIndex:I

    .line 35
    return-void
.end method

.method public static createEngine()Lcom/ss/android/ttve/nativePort/TEInterface;
    .locals 5

    .line 47
    new-instance v0, Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-direct {v0}, Lcom/ss/android/ttve/nativePort/TEInterface;-><init>()V

    .line 48
    invoke-direct {v0}, Lcom/ss/android/ttve/nativePort/TEInterface;->nativeCreateEngine()J

    move-result-wide v1

    .line 49
    const-wide/16 v3, 0x0

    cmp-long v3, v1, v3

    if-nez v3, :cond_0

    .line 50
    const/4 v0, 0x0

    return-object v0

    .line 53
    :cond_0
    iput-wide v1, v0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    .line 54
    return-object v0
.end method

.method private native nativeAddAudioTrack(JLjava/lang/String;IIIIZ)I
.end method

.method private native nativeAddExternalTrack(J[Ljava/lang/String;[Ljava/lang/String;[I[IDDDDII)I
.end method

.method private native nativeAddFilters(J[I[Ljava/lang/String;[I[I[I[I)[I
.end method

.method private native nativeAdjustFilterInOut(JIII)I
.end method

.method private native nativeCreateEngine()J
.end method

.method private native nativeCreateScene(J[Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;[[Ljava/lang/String;I)I
.end method

.method private native nativeCreateTimeline(J)I
.end method

.method private native nativeDeleteAudioTrack(JI)I
.end method

.method private native nativeDeleteExternalTrack(JI)I
.end method

.method private native nativeDestroyEngine(J)I
.end method

.method private native nativeGetCurPosition(J)I
.end method

.method private native nativeGetCurState(J)I
.end method

.method private native nativeGetDisplayDumpSize(J)[I
.end method

.method private native nativeGetDisplayImage(J[B)I
.end method

.method private native nativeGetDuration(J)I
.end method

.method private native nativeGetExternalTrackFilter(JI)I
.end method

.method private native nativeGetInitResolution(J)[I
.end method

.method private native nativeGetTrackVolume(JIII)F
.end method

.method private native nativePause(J)I
.end method

.method private native nativePauseSync(J)I
.end method

.method private native nativePrepareEngine(JIIILjava/lang/String;)I
.end method

.method private native nativeReleasePreviewSurface(J)V
.end method

.method private native nativeRemoveFilter(J[I)I
.end method

.method private native nativeSeek(JIIII)I
.end method

.method private native nativeSetBackGroundColor(JFFFF)V
.end method

.method private native nativeSetDisplayState(JFFFFIII)V
.end method

.method private native nativeSetFilterParam(JILjava/lang/String;Lcom/ss/android/vesdk/VEStickerAnimator;)I
.end method

.method private native nativeSetFilterParam(JILjava/lang/String;Ljava/lang/String;)I
.end method

.method private native nativeSetOption(JILjava/lang/String;F)V
.end method

.method private native nativeSetOption(JILjava/lang/String;J)V
.end method

.method private native nativeSetOption(JILjava/lang/String;Ljava/lang/String;)V
.end method

.method private native nativeSetPreviewScaleMode(JI)I
.end method

.method private native nativeSetPreviewSurface(JLandroid/view/Surface;)V
.end method

.method private native nativeSetTrackVolume(JIIF)Z
.end method

.method private native nativeSetViewPort(JIIII)V
.end method

.method private native nativeStart(J)I
.end method

.method private native nativeStop(J)I
.end method

.method private native nativeUpdateAudioTrack(JIIIIIZ)I
.end method

.method private native nativeUpdateTrackClip(JII[Ljava/lang/String;)I
.end method

.method private native nativeUpdateTrackFilter(JIIZ)I
.end method


# virtual methods
.method public addAudioTrack(Ljava/lang/String;IIIIZ)I
    .locals 9

    .line 114
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 115
    const/4 p1, -0x1

    return p1

    .line 116
    :cond_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 117
    const/16 p1, -0x64

    return p1

    .line 120
    :cond_1
    iget-wide v1, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    move-object v0, p0

    move-object v3, p1

    move v4, p2

    move v5, p3

    move v6, p4

    move v7, p5

    move v8, p6

    invoke-direct/range {v0 .. v8}, Lcom/ss/android/ttve/nativePort/TEInterface;->nativeAddAudioTrack(JLjava/lang/String;IIIIZ)I

    move-result p1

    return p1
.end method

.method public addFilters([I[Ljava/lang/String;[I[I[I[I)[I
    .locals 9

    .line 236
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 237
    const/4 p1, 0x1

    new-array p1, p1, [I

    const/4 p2, 0x0

    const/4 p3, -0x1

    aput p3, p1, p2

    return-object p1

    .line 239
    :cond_0
    iget-wide v1, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    move-object v0, p0

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    move-object v6, p4

    move-object v7, p5

    move-object v8, p6

    invoke-direct/range {v0 .. v8}, Lcom/ss/android/ttve/nativePort/TEInterface;->nativeAddFilters(J[I[Ljava/lang/String;[I[I[I[I)[I

    move-result-object p1

    return-object p1
.end method

.method public addSticker([Ljava/lang/String;[Ljava/lang/String;[I[IDDDD)I
    .locals 17

    move-object/from16 v0, p0

    .line 199
    iget-wide v1, v0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-nez v1, :cond_0

    .line 200
    const/16 v0, -0x70

    return v0

    .line 201
    :cond_0
    iget v1, v0, Lcom/ss/android/ttve/nativePort/TEInterface;->mHostTrackIndex:I

    if-gez v1, :cond_1

    .line 202
    const/16 v0, -0x69

    return v0

    .line 205
    :cond_1
    iget-wide v1, v0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    const/4 v15, 0x0

    iget v13, v0, Lcom/ss/android/ttve/nativePort/TEInterface;->mHostTrackIndex:I

    move-object/from16 v3, p1

    move-object/from16 v4, p2

    move-object/from16 v5, p3

    move-object/from16 v6, p4

    move-wide/from16 v7, p5

    move-wide/from16 v9, p7

    move-wide/from16 v11, p9

    move/from16 v16, v13

    move-wide/from16 v13, p11

    invoke-direct/range {v0 .. v16}, Lcom/ss/android/ttve/nativePort/TEInterface;->nativeAddExternalTrack(J[Ljava/lang/String;[Ljava/lang/String;[I[IDDDDII)I

    move-result v0

    return v0
.end method

.method public addWaterMark([Ljava/lang/String;[Ljava/lang/String;[I[IDDDD)I
    .locals 17

    move-object/from16 v0, p0

    .line 173
    iget-wide v1, v0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-nez v1, :cond_0

    .line 174
    const/16 v0, -0x70

    return v0

    .line 175
    :cond_0
    iget v1, v0, Lcom/ss/android/ttve/nativePort/TEInterface;->mHostTrackIndex:I

    if-gez v1, :cond_1

    .line 176
    const/16 v0, -0x69

    return v0

    .line 179
    :cond_1
    iget-wide v1, v0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    const/4 v15, 0x5

    iget v13, v0, Lcom/ss/android/ttve/nativePort/TEInterface;->mHostTrackIndex:I

    move-object/from16 v3, p1

    move-object/from16 v4, p2

    move-object/from16 v5, p3

    move-object/from16 v6, p4

    move-wide/from16 v7, p5

    move-wide/from16 v9, p7

    move-wide/from16 v11, p9

    move/from16 v16, v13

    move-wide/from16 v13, p11

    invoke-direct/range {v0 .. v16}, Lcom/ss/android/ttve/nativePort/TEInterface;->nativeAddExternalTrack(J[Ljava/lang/String;[Ljava/lang/String;[I[IDDDDII)I

    move-result v0

    return v0
.end method

.method public adjustFilterInOut(III)I
    .locals 6

    .line 258
    iget-wide v1, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    move-object v0, p0

    move v3, p1

    move v4, p2

    move v5, p3

    invoke-direct/range {v0 .. v5}, Lcom/ss/android/ttve/nativePort/TEInterface;->nativeAdjustFilterInOut(JIII)I

    move-result p1

    return p1
.end method

.method public createScene([Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;[[Ljava/lang/String;I)I
    .locals 8

    .line 88
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 89
    const/16 p1, -0x70

    return p1

    .line 92
    :cond_0
    iget-wide v1, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    move-object v0, p0

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    move-object v6, p4

    move v7, p5

    invoke-direct/range {v0 .. v7}, Lcom/ss/android/ttve/nativePort/TEInterface;->nativeCreateScene(J[Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;[[Ljava/lang/String;I)I

    move-result p1

    .line 93
    if-gez p1, :cond_1

    .line 94
    return p1

    .line 96
    :cond_1
    iput p1, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mHostTrackIndex:I

    .line 97
    const/4 p1, 0x0

    return p1
.end method

.method public createTimeline()I
    .locals 2

    .line 542
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    invoke-direct {p0, v0, v1}, Lcom/ss/android/ttve/nativePort/TEInterface;->nativeCreateTimeline(J)I

    move-result v0

    return v0
.end method

.method public deleteAudioTrack(I)I
    .locals 4

    .line 152
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 153
    const/4 p1, -0x1

    return p1

    .line 155
    :cond_0
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    invoke-direct {p0, v0, v1, p1}, Lcom/ss/android/ttve/nativePort/TEInterface;->nativeDeleteAudioTrack(JI)I

    move-result p1

    return p1
.end method

.method public deleteSticker(I)I
    .locals 4

    .line 262
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 263
    const/16 p1, -0x70

    return p1

    .line 266
    :cond_0
    if-gez p1, :cond_1

    .line 267
    const/16 p1, -0x64

    return p1

    .line 269
    :cond_1
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    invoke-direct {p0, v0, v1, p1}, Lcom/ss/android/ttve/nativePort/TEInterface;->nativeDeleteExternalTrack(JI)I

    move-result p1

    return p1
.end method

.method public deleteWatermark(I)I
    .locals 4

    .line 273
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 274
    const/16 p1, -0x70

    return p1

    .line 277
    :cond_0
    if-gez p1, :cond_1

    .line 278
    const/16 p1, -0x64

    return p1

    .line 280
    :cond_1
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    invoke-direct {p0, v0, v1, p1}, Lcom/ss/android/ttve/nativePort/TEInterface;->nativeDeleteExternalTrack(JI)I

    move-result p1

    return p1
.end method

.method public destroyEngine()I
    .locals 4

    .line 63
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 64
    const/16 v0, -0x70

    return v0

    .line 66
    :cond_0
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    invoke-direct {p0, v0, v1}, Lcom/ss/android/ttve/nativePort/TEInterface;->nativeDestroyEngine(J)I

    move-result v0

    .line 67
    iput-wide v2, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    .line 68
    return v0
.end method

.method public getCurPosition()I
    .locals 4

    .line 499
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 500
    const/4 v0, -0x1

    return v0

    .line 502
    :cond_0
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    invoke-direct {p0, v0, v1}, Lcom/ss/android/ttve/nativePort/TEInterface;->nativeGetCurPosition(J)I

    move-result v0

    return v0
.end method

.method public getCurState()I
    .locals 4

    .line 507
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 508
    const/4 v0, -0x1

    return v0

    .line 510
    :cond_0
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    invoke-direct {p0, v0, v1}, Lcom/ss/android/ttve/nativePort/TEInterface;->nativeGetCurState(J)I

    move-result v0

    return v0
.end method

.method public getDisplayImage([B)I
    .locals 2

    .line 446
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    invoke-direct {p0, v0, v1, p1}, Lcom/ss/android/ttve/nativePort/TEInterface;->nativeGetDisplayImage(J[B)I

    move-result p1

    return p1
.end method

.method public getDisplayRect()Lcom/ss/android/vesdk/VERect;
    .locals 6

    .line 450
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    invoke-direct {p0, v0, v1}, Lcom/ss/android/ttve/nativePort/TEInterface;->nativeGetDisplayDumpSize(J)[I

    move-result-object v0

    .line 451
    new-instance v1, Lcom/ss/android/vesdk/VERect;

    const/4 v2, 0x0

    aget v2, v0, v2

    const/4 v3, 0x1

    aget v3, v0, v3

    const/4 v4, 0x2

    aget v4, v0, v4

    const/4 v5, 0x3

    aget v0, v0, v5

    invoke-direct {v1, v2, v3, v4, v0}, Lcom/ss/android/vesdk/VERect;-><init>(IIII)V

    return-object v1
.end method

.method public getDuration()I
    .locals 4

    .line 492
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 493
    const/4 v0, -0x1

    return v0

    .line 495
    :cond_0
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    invoke-direct {p0, v0, v1}, Lcom/ss/android/ttve/nativePort/TEInterface;->nativeGetDuration(J)I

    move-result v0

    return v0
.end method

.method public getInitResolution()[I
    .locals 5

    .line 459
    const/4 v0, 0x4

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    .line 460
    nop

    .line 461
    iget-wide v1, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-nez v1, :cond_0

    .line 462
    return-object v0

    .line 464
    :cond_0
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    invoke-direct {p0, v0, v1}, Lcom/ss/android/ttve/nativePort/TEInterface;->nativeGetInitResolution(J)[I

    move-result-object v0

    return-object v0

    nop

    :array_0
    .array-data 4
        -0x1
        -0x1
        -0x1
        -0x1
    .end array-data
.end method

.method public getStickerFilterIndex(I)I
    .locals 4

    .line 211
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 212
    const/16 p1, -0x70

    return p1

    .line 213
    :cond_0
    if-gez p1, :cond_1

    .line 214
    const/16 p1, -0x64

    return p1

    .line 216
    :cond_1
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    invoke-direct {p0, v0, v1, p1}, Lcom/ss/android/ttve/nativePort/TEInterface;->nativeGetExternalTrackFilter(JI)I

    move-result p1

    return p1
.end method

.method public getTrackVolume(III)F
    .locals 6

    .line 530
    iget-wide v1, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    move-object v0, p0

    move v3, p1

    move v4, p2

    move v5, p3

    invoke-direct/range {v0 .. v5}, Lcom/ss/android/ttve/nativePort/TEInterface;->nativeGetTrackVolume(JIII)F

    move-result p1

    return p1
.end method

.method public pause()I
    .locals 4

    .line 472
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    const/16 v0, -0x70

    return v0

    .line 473
    :cond_0
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    invoke-direct {p0, v0, v1}, Lcom/ss/android/ttve/nativePort/TEInterface;->nativePause(J)I

    move-result v0

    return v0
.end method

.method public pauseSync()I
    .locals 4

    .line 477
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    const/16 v0, -0x70

    return v0

    .line 478
    :cond_0
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    invoke-direct {p0, v0, v1}, Lcom/ss/android/ttve/nativePort/TEInterface;->nativePauseSync(J)I

    move-result v0

    return v0
.end method

.method public prepareEngine(IIILjava/lang/String;)I
    .locals 7

    .line 292
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 293
    const/16 p1, -0x70

    return p1

    .line 294
    :cond_0
    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 295
    const-string p4, ""

    .line 298
    :cond_1
    move-object v6, p4

    iget-wide v1, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    move-object v0, p0

    move v3, p1

    move v4, p2

    move v5, p3

    invoke-direct/range {v0 .. v6}, Lcom/ss/android/ttve/nativePort/TEInterface;->nativePrepareEngine(JIIILjava/lang/String;)I

    move-result p1

    return p1
.end method

.method public releasePreviewSurface()V
    .locals 4

    .line 430
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    return-void

    .line 431
    :cond_0
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    invoke-direct {p0, v0, v1}, Lcom/ss/android/ttve/nativePort/TEInterface;->nativeReleasePreviewSurface(J)V

    .line 432
    return-void
.end method

.method public removeFilter([I)I
    .locals 2

    .line 246
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    invoke-direct {p0, v0, v1, p1}, Lcom/ss/android/ttve/nativePort/TEInterface;->nativeRemoveFilter(J[I)I

    move-result p1

    return p1
.end method

.method public seek(IIII)I
    .locals 7

    .line 418
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 419
    const/16 p1, -0x70

    return p1

    .line 421
    :cond_0
    iget-wide v1, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    move-object v0, p0

    move v3, p1

    move v4, p2

    move v5, p3

    move v6, p4

    invoke-direct/range {v0 .. v6}, Lcom/ss/android/ttve/nativePort/TEInterface;->nativeSeek(JIIII)I

    move-result p1

    return p1
.end method

.method public setBackGroundColor(FFFF)V
    .locals 7

    .line 455
    iget-wide v1, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    move-object v0, p0

    move v3, p1

    move v4, p2

    move v5, p3

    move v6, p4

    invoke-direct/range {v0 .. v6}, Lcom/ss/android/ttve/nativePort/TEInterface;->nativeSetBackGroundColor(JFFFF)V

    .line 456
    return-void
.end method

.method public setCompileFps(I)V
    .locals 3

    .line 324
    const-string v0, "CompileFps"

    int-to-long v1, p1

    const/4 p1, 0x0

    invoke-virtual {p0, p1, v0, v1, v2}, Lcom/ss/android/ttve/nativePort/TEInterface;->setOption(ILjava/lang/String;J)V

    .line 325
    return-void
.end method

.method public setCompileType(I)V
    .locals 3

    .line 341
    const-string v0, "CompileType"

    int-to-long v1, p1

    const/4 p1, 0x0

    invoke-virtual {p0, p1, v0, v1, v2}, Lcom/ss/android/ttve/nativePort/TEInterface;->setOption(ILjava/lang/String;J)V

    .line 342
    return-void
.end method

.method public setCrop(IIII)V
    .locals 3

    .line 377
    const-string v0, "engine crop x"

    int-to-long v1, p1

    const/4 p1, 0x0

    invoke-virtual {p0, p1, v0, v1, v2}, Lcom/ss/android/ttve/nativePort/TEInterface;->setOption(ILjava/lang/String;J)V

    .line 378
    const-string v0, "engine crop y"

    int-to-long v1, p2

    invoke-virtual {p0, p1, v0, v1, v2}, Lcom/ss/android/ttve/nativePort/TEInterface;->setOption(ILjava/lang/String;J)V

    .line 379
    const-string p2, "engine crop width"

    int-to-long v0, p3

    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/ss/android/ttve/nativePort/TEInterface;->setOption(ILjava/lang/String;J)V

    .line 380
    const-string p1, "engine crop height"

    int-to-long p2, p4

    const/4 p4, 0x1

    invoke-virtual {p0, p4, p1, p2, p3}, Lcom/ss/android/ttve/nativePort/TEInterface;->setOption(ILjava/lang/String;J)V

    .line 381
    return-void
.end method

.method public setDisplayState(FFFFIIZ)V
    .locals 10

    move-object v0, p0

    .line 441
    iget-wide v1, v0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-nez v1, :cond_0

    return-void

    .line 442
    :cond_0
    iget-wide v1, v0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    move v3, p1

    move v4, p2

    move v5, p3

    move v6, p4

    move v7, p5

    move/from16 v8, p6

    move/from16 v9, p7

    invoke-direct/range {v0 .. v9}, Lcom/ss/android/ttve/nativePort/TEInterface;->nativeSetDisplayState(JFFFFIII)V

    .line 443
    return-void
.end method

.method public setEncGopSize(I)V
    .locals 3

    .line 332
    const-string v0, "video gop size"

    int-to-long v1, p1

    const/4 p1, 0x0

    invoke-virtual {p0, p1, v0, v1, v2}, Lcom/ss/android/ttve/nativePort/TEInterface;->setOption(ILjava/lang/String;J)V

    .line 333
    return-void
.end method

.method public setEngineCompilePath(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 313
    const-string v0, "CompilePath"

    const/4 v1, 0x0

    invoke-virtual {p0, v1, v0, p1}, Lcom/ss/android/ttve/nativePort/TEInterface;->setOption(ILjava/lang/String;Ljava/lang/String;)V

    .line 314
    const-string p1, "CompilePathWav"

    invoke-virtual {p0, v1, p1, p2}, Lcom/ss/android/ttve/nativePort/TEInterface;->setOption(ILjava/lang/String;Ljava/lang/String;)V

    .line 315
    return-void
.end method

.method public setFilterParam(ILjava/lang/String;Lcom/ss/android/vesdk/VEStickerAnimator;)I
    .locals 6

    .line 254
    iget-wide v1, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    move-object v0, p0

    move v3, p1

    move-object v4, p2

    move-object v5, p3

    invoke-direct/range {v0 .. v5}, Lcom/ss/android/ttve/nativePort/TEInterface;->nativeSetFilterParam(JILjava/lang/String;Lcom/ss/android/vesdk/VEStickerAnimator;)I

    move-result p1

    return p1
.end method

.method public setFilterParam(ILjava/lang/String;Ljava/lang/String;)I
    .locals 6

    .line 250
    iget-wide v1, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    move-object v0, p0

    move v3, p1

    move-object v4, p2

    move-object v5, p3

    invoke-direct/range {v0 .. v5}, Lcom/ss/android/ttve/nativePort/TEInterface;->nativeSetFilterParam(JILjava/lang/String;Ljava/lang/String;)I

    move-result p1

    return p1
.end method

.method public setLooping(Z)V
    .locals 3

    .line 372
    if-eqz p1, :cond_0

    const-wide/16 v0, 0x1

    goto :goto_0

    :cond_0
    const-wide/16 v0, 0x0

    .line 373
    :goto_0
    const/4 p1, 0x1

    const-string v2, "engine loop play"

    invoke-virtual {p0, p1, v2, v0, v1}, Lcom/ss/android/ttve/nativePort/TEInterface;->setOption(ILjava/lang/String;J)V

    .line 374
    return-void
.end method

.method public setOption(ILjava/lang/String;F)V
    .locals 6

    .line 522
    iget-wide v1, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    move-object v0, p0

    move v3, p1

    move-object v4, p2

    move v5, p3

    invoke-direct/range {v0 .. v5}, Lcom/ss/android/ttve/nativePort/TEInterface;->nativeSetOption(JILjava/lang/String;F)V

    .line 523
    return-void
.end method

.method public setOption(ILjava/lang/String;J)V
    .locals 7

    .line 518
    iget-wide v1, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    move-object v0, p0

    move v3, p1

    move-object v4, p2

    move-wide v5, p3

    invoke-direct/range {v0 .. v6}, Lcom/ss/android/ttve/nativePort/TEInterface;->nativeSetOption(JILjava/lang/String;J)V

    .line 519
    return-void
.end method

.method public setOption(ILjava/lang/String;Ljava/lang/String;)V
    .locals 6

    .line 514
    iget-wide v1, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    move-object v0, p0

    move v3, p1

    move-object v4, p2

    move-object v5, p3

    invoke-direct/range {v0 .. v5}, Lcom/ss/android/ttve/nativePort/TEInterface;->nativeSetOption(JILjava/lang/String;Ljava/lang/String;)V

    .line 515
    return-void
.end method

.method public setPreviewScaleMode(I)I
    .locals 4

    .line 402
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 403
    const/16 p1, -0x70

    return p1

    .line 406
    :cond_0
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    invoke-direct {p0, v0, v1, p1}, Lcom/ss/android/ttve/nativePort/TEInterface;->nativeSetPreviewScaleMode(JI)I

    move-result p1

    return p1
.end method

.method public setPreviewSurface(Landroid/view/Surface;)V
    .locals 4

    .line 425
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    return-void

    .line 426
    :cond_0
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    invoke-direct {p0, v0, v1, p1}, Lcom/ss/android/ttve/nativePort/TEInterface;->nativeSetPreviewSurface(JLandroid/view/Surface;)V

    .line 427
    return-void
.end method

.method public setResizer(IFF)V
    .locals 3

    .line 318
    const-string v0, "filter mode"

    int-to-long v1, p1

    const/4 p1, 0x0

    invoke-virtual {p0, p1, v0, v1, v2}, Lcom/ss/android/ttve/nativePort/TEInterface;->setOption(ILjava/lang/String;J)V

    .line 319
    const-string v0, "resizer offset x percent"

    invoke-virtual {p0, p1, v0, p2}, Lcom/ss/android/ttve/nativePort/TEInterface;->setOption(ILjava/lang/String;F)V

    .line 320
    const-string p2, "resizer offset y percent"

    invoke-virtual {p0, p1, p2, p3}, Lcom/ss/android/ttve/nativePort/TEInterface;->setOption(ILjava/lang/String;F)V

    .line 321
    return-void
.end method

.method public setScaleMode(I)V
    .locals 3

    .line 384
    const-string v0, "filter mode"

    int-to-long v1, p1

    const/4 p1, 0x0

    invoke-virtual {p0, p1, v0, v1, v2}, Lcom/ss/android/ttve/nativePort/TEInterface;->setOption(ILjava/lang/String;J)V

    .line 385
    return-void
.end method

.method public setTrackVolume(IIF)Z
    .locals 6

    .line 526
    iget-wide v1, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    move-object v0, p0

    move v3, p1

    move v4, p2

    move v5, p3

    invoke-direct/range {v0 .. v5}, Lcom/ss/android/ttve/nativePort/TEInterface;->nativeSetTrackVolume(JIIF)Z

    move-result p1

    return p1
.end method

.method public setUseHwEnc(Z)V
    .locals 3

    .line 328
    const-string v0, "HardwareVideo"

    if-eqz p1, :cond_0

    const-wide/16 v1, 0x1

    goto :goto_0

    :cond_0
    const-wide/16 v1, 0x0

    :goto_0
    const/4 p1, 0x0

    invoke-virtual {p0, p1, v0, v1, v2}, Lcom/ss/android/ttve/nativePort/TEInterface;->setOption(ILjava/lang/String;J)V

    .line 329
    return-void
.end method

.method public setUsrRotate(I)V
    .locals 4

    .line 352
    const-wide/16 v0, 0x0

    const/4 v2, 0x0

    if-eqz p1, :cond_3

    const/16 v3, 0x5a

    if-eq p1, v3, :cond_2

    const/16 v3, 0xb4

    if-eq p1, v3, :cond_1

    const/16 v3, 0x10e

    if-eq p1, v3, :cond_0

    .line 366
    const-string p1, "usr rotate"

    invoke-virtual {p0, v2, p1, v0, v1}, Lcom/ss/android/ttve/nativePort/TEInterface;->setOption(ILjava/lang/String;J)V

    goto :goto_0

    .line 363
    :cond_0
    const-string p1, "usr rotate"

    const-wide/16 v0, 0x3

    invoke-virtual {p0, v2, p1, v0, v1}, Lcom/ss/android/ttve/nativePort/TEInterface;->setOption(ILjava/lang/String;J)V

    .line 364
    goto :goto_0

    .line 360
    :cond_1
    const-string p1, "usr rotate"

    const-wide/16 v0, 0x2

    invoke-virtual {p0, v2, p1, v0, v1}, Lcom/ss/android/ttve/nativePort/TEInterface;->setOption(ILjava/lang/String;J)V

    .line 361
    goto :goto_0

    .line 357
    :cond_2
    const-string p1, "usr rotate"

    const-wide/16 v0, 0x1

    invoke-virtual {p0, v2, p1, v0, v1}, Lcom/ss/android/ttve/nativePort/TEInterface;->setOption(ILjava/lang/String;J)V

    .line 358
    goto :goto_0

    .line 354
    :cond_3
    const-string p1, "usr rotate"

    invoke-virtual {p0, v2, p1, v0, v1}, Lcom/ss/android/ttve/nativePort/TEInterface;->setOption(ILjava/lang/String;J)V

    .line 355
    nop

    .line 369
    :goto_0
    return-void
.end method

.method public setVideoCompileBitrate(II)V
    .locals 3

    .line 308
    const-string v0, "CompileBitrateMode"

    int-to-long v1, p1

    const/4 p1, 0x0

    invoke-virtual {p0, p1, v0, v1, v2}, Lcom/ss/android/ttve/nativePort/TEInterface;->setOption(ILjava/lang/String;J)V

    .line 309
    const-string v0, "CompileBitrateValue"

    int-to-long v1, p2

    invoke-virtual {p0, p1, v0, v1, v2}, Lcom/ss/android/ttve/nativePort/TEInterface;->setOption(ILjava/lang/String;J)V

    .line 310
    return-void
.end method

.method public setViewPort(IIII)V
    .locals 8

    .line 435
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    return-void

    .line 436
    :cond_0
    iget-wide v2, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    move-object v1, p0

    move v4, p1

    move v5, p2

    move v6, p3

    move v7, p4

    invoke-direct/range {v1 .. v7}, Lcom/ss/android/ttve/nativePort/TEInterface;->nativeSetViewPort(JIIII)V

    .line 437
    return-void
.end method

.method public setWidthHeight(II)V
    .locals 3

    .line 389
    const-string v0, "engine compile width"

    int-to-long v1, p1

    const/4 p1, 0x0

    invoke-virtual {p0, p1, v0, v1, v2}, Lcom/ss/android/ttve/nativePort/TEInterface;->setOption(ILjava/lang/String;J)V

    .line 390
    const-string v0, "engine compile height"

    int-to-long v1, p2

    invoke-virtual {p0, p1, v0, v1, v2}, Lcom/ss/android/ttve/nativePort/TEInterface;->setOption(ILjava/lang/String;J)V

    .line 391
    return-void
.end method

.method public start()I
    .locals 4

    .line 467
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    const/16 v0, -0x70

    return v0

    .line 468
    :cond_0
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    invoke-direct {p0, v0, v1}, Lcom/ss/android/ttve/nativePort/TEInterface;->nativeStart(J)I

    move-result v0

    return v0
.end method

.method public stop()I
    .locals 4

    .line 482
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    const/16 v0, -0x70

    return v0

    .line 483
    :cond_0
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    invoke-direct {p0, v0, v1}, Lcom/ss/android/ttve/nativePort/TEInterface;->nativeStop(J)I

    move-result v0

    return v0
.end method

.method public native stringFromJNI()Ljava/lang/String;
.end method

.method public updateAudioTrack(IIIIIZ)I
    .locals 9

    .line 137
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 138
    const/4 p1, -0x1

    return p1

    .line 139
    :cond_0
    if-gez p1, :cond_1

    .line 140
    const/16 p1, -0x64

    return p1

    .line 142
    :cond_1
    iget-wide v1, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    move-object v0, p0

    move v3, p1

    move v4, p2

    move v5, p3

    move v6, p4

    move v7, p5

    move v8, p6

    invoke-direct/range {v0 .. v8}, Lcom/ss/android/ttve/nativePort/TEInterface;->nativeUpdateAudioTrack(JIIIIIZ)I

    move-result p1

    return p1
.end method

.method public updateTrackClips(II[Ljava/lang/String;)I
    .locals 6

    .line 534
    iget-wide v1, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    move-object v0, p0

    move v3, p1

    move v4, p2

    move-object v5, p3

    invoke-direct/range {v0 .. v5}, Lcom/ss/android/ttve/nativePort/TEInterface;->nativeUpdateTrackClip(JII[Ljava/lang/String;)I

    move-result p1

    return p1
.end method

.method public updateTrackFilter(IIZ)I
    .locals 6

    .line 538
    iget-wide v1, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    move-object v0, p0

    move v3, p1

    move v4, p2

    move v5, p3

    invoke-direct/range {v0 .. v5}, Lcom/ss/android/ttve/nativePort/TEInterface;->nativeUpdateTrackFilter(JIIZ)I

    move-result p1

    return p1
.end method
