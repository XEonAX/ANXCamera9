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

    .line 26
    invoke-static {}, Lcom/ss/android/ttve/nativePort/TENativeLibsLoader;->loadLibrary()V

    .line 27
    return-void
.end method

.method private constructor <init>()V
    .locals 2

    .line 39
    invoke-direct {p0}, Lcom/ss/android/ttve/nativePort/TENativeServiceBase;-><init>()V

    .line 33
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    .line 34
    const/4 v0, -0x1

    iput v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mHostTrackIndex:I

    .line 41
    return-void
.end method

.method public static createEngine()Lcom/ss/android/ttve/nativePort/TEInterface;
    .locals 5

    .line 53
    new-instance v0, Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-direct {v0}, Lcom/ss/android/ttve/nativePort/TEInterface;-><init>()V

    .line 54
    invoke-direct {v0}, Lcom/ss/android/ttve/nativePort/TEInterface;->nativeCreateEngine()J

    move-result-wide v1

    .line 55
    const-wide/16 v3, 0x0

    cmp-long v3, v1, v3

    if-nez v3, :cond_0

    .line 56
    const/4 v0, 0x0

    return-object v0

    .line 59
    :cond_0
    iput-wide v1, v0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    .line 60
    return-object v0
.end method

.method private native nativeAddAudioTrack(JLjava/lang/String;IIIIZ)I
.end method

.method private native nativeAddAudioTrack2(JLjava/lang/String;IIIIZII)I
.end method

.method private native nativeAddExternalTrack(J[Ljava/lang/String;[Ljava/lang/String;[I[I[I[IDDDDII)I
.end method

.method private native nativeAddFilters(J[I[Ljava/lang/String;[I[I[I[I)[I
.end method

.method private native nativeAddInfoSticker(JLjava/lang/String;[Ljava/lang/String;)I
.end method

.method private native nativeAddMetaData(JLjava/lang/String;Ljava/lang/String;)V
.end method

.method private native nativeAdjustFilterInOut(JIII)I
.end method

.method private native nativeClearDisplay(JI)V
.end method

.method private native nativeCreateEngine()J
.end method

.method private native nativeCreateScene(JLjava/lang/String;[Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;[[Ljava/lang/String;I)I
.end method

.method private native nativeCreateScene2(J[Ljava/lang/String;[I[I[Ljava/lang/String;[I[I[Ljava/lang/String;[[Ljava/lang/String;I)I
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

.method private native nativeGetInfoStickerBoundingBox(JI)[F
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

.method private native nativeRemoveInfoSticker(JI)I
.end method

.method private native nativeRestore(JLjava/lang/String;)I
.end method

.method private native nativeSave(J)Ljava/lang/String;
.end method

.method private native nativeSeek(JIIII)I
.end method

.method private native nativeSetBackGroundColor(JFFFF)V
.end method

.method private native nativeSetDisplayState(JFFFFIII)V
.end method

.method private native nativeSetExpandLastFrame(JZ)V
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

.method private native nativeSetOptionArray(JI[Ljava/lang/String;[J)V
.end method

.method private native nativeSetPreviewScaleMode(JI)I
.end method

.method private native nativeSetPreviewSurface(JLandroid/view/Surface;)V
.end method

.method private native nativeSetSpeedRatio(JF)V
.end method

.method private native nativeSetSurfaceSize(JII)V
.end method

.method private native nativeSetTrackVolume(JIIF)Z
.end method

.method private native nativeSetViewPort(JIIII)V
.end method

.method private native nativeSetWaterMark(J[Ljava/lang/String;IIIII)V
.end method

.method private native nativeStart(J)I
.end method

.method private native nativeStop(J)I
.end method

.method private native nativeTestSerialization(J)Z
.end method

.method private native nativeUpdateAudioTrack(JIIIIIZ)I
.end method

.method private native nativeUpdateAudioTrack2(JIIIIIZII)I
.end method

.method private native nativeUpdateTrackClip(JII[Ljava/lang/String;)I
.end method

.method private native nativeUpdateTrackFilter(JIIZ)I
.end method


# virtual methods
.method public addAudioTrack(Ljava/lang/String;IIIIZ)I
    .locals 9

    .line 183
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 184
    const/4 p1, -0x1

    return p1

    .line 185
    :cond_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 186
    const/16 p1, -0x64

    return p1

    .line 189
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

.method public addAudioTrack(Ljava/lang/String;IIIIZII)I
    .locals 11

    move-object v0, p0

    .line 207
    iget-wide v1, v0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-nez v1, :cond_0

    .line 208
    const/4 v0, -0x1

    return v0

    .line 209
    :cond_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 210
    const/16 v0, -0x64

    return v0

    .line 213
    :cond_1
    iget-wide v1, v0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    move-object v3, p1

    move v4, p2

    move v5, p3

    move v6, p4

    move/from16 v7, p5

    move/from16 v8, p6

    move/from16 v9, p7

    move/from16 v10, p8

    invoke-direct/range {v0 .. v10}, Lcom/ss/android/ttve/nativePort/TEInterface;->nativeAddAudioTrack2(JLjava/lang/String;IIIIZII)I

    move-result v0

    return v0
.end method

.method public addFilters([I[Ljava/lang/String;[I[I[I[I)[I
    .locals 9

    .line 404
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 405
    const/4 p1, 0x1

    new-array p1, p1, [I

    const/4 p2, 0x0

    const/4 p3, -0x1

    aput p3, p1, p2

    return-object p1

    .line 407
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

.method public addInfoSticker(Ljava/lang/String;[Ljava/lang/String;)I
    .locals 4

    .line 344
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 345
    const/16 p1, -0x70

    return p1

    .line 346
    :cond_0
    iget v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mHostTrackIndex:I

    if-gez v0, :cond_1

    .line 347
    const/16 p1, -0x69

    return p1

    .line 350
    :cond_1
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    invoke-direct {p0, v0, v1, p1, p2}, Lcom/ss/android/ttve/nativePort/TEInterface;->nativeAddInfoSticker(JLjava/lang/String;[Ljava/lang/String;)I

    move-result p1

    return p1
.end method

.method public addMetaData(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4

    .line 769
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 770
    return-void

    .line 772
    :cond_0
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    invoke-direct {p0, v0, v1, p1, p2}, Lcom/ss/android/ttve/nativePort/TEInterface;->nativeAddMetaData(JLjava/lang/String;Ljava/lang/String;)V

    .line 773
    return-void
.end method

.method public addSticker([Ljava/lang/String;[Ljava/lang/String;[I[I[I[IDDDD)I
    .locals 19

    move-object/from16 v0, p0

    .line 316
    iget-wide v1, v0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-nez v1, :cond_0

    .line 317
    const/16 v0, -0x70

    return v0

    .line 318
    :cond_0
    iget v1, v0, Lcom/ss/android/ttve/nativePort/TEInterface;->mHostTrackIndex:I

    if-gez v1, :cond_1

    .line 319
    const/16 v0, -0x69

    return v0

    .line 322
    :cond_1
    iget-wide v1, v0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    const/16 v17, 0x0

    iget v15, v0, Lcom/ss/android/ttve/nativePort/TEInterface;->mHostTrackIndex:I

    move-object/from16 v3, p1

    move-object/from16 v4, p2

    move-object/from16 v5, p3

    move-object/from16 v6, p4

    move-object/from16 v7, p5

    move-object/from16 v8, p6

    move-wide/from16 v9, p7

    move-wide/from16 v11, p9

    move-wide/from16 v13, p11

    move/from16 v18, v15

    move-wide/from16 v15, p13

    invoke-direct/range {v0 .. v18}, Lcom/ss/android/ttve/nativePort/TEInterface;->nativeAddExternalTrack(J[Ljava/lang/String;[Ljava/lang/String;[I[I[I[IDDDDII)I

    move-result v0

    return v0
.end method

.method public addWaterMark([Ljava/lang/String;[Ljava/lang/String;[I[IDDDD)I
    .locals 19

    move-object/from16 v0, p0

    .line 288
    iget-wide v1, v0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-nez v1, :cond_0

    .line 289
    const/16 v0, -0x70

    return v0

    .line 290
    :cond_0
    iget v1, v0, Lcom/ss/android/ttve/nativePort/TEInterface;->mHostTrackIndex:I

    if-gez v1, :cond_1

    .line 291
    const/16 v0, -0x69

    return v0

    .line 294
    :cond_1
    iget-wide v1, v0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    const/16 v17, 0x5

    iget v15, v0, Lcom/ss/android/ttve/nativePort/TEInterface;->mHostTrackIndex:I

    move-object/from16 v3, p1

    move-object/from16 v4, p2

    move-object/from16 v5, p3

    move-object/from16 v6, p4

    move-object/from16 v7, p3

    move-object/from16 v8, p4

    move-wide/from16 v9, p5

    move-wide/from16 v11, p7

    move-wide/from16 v13, p9

    move/from16 v18, v15

    move-wide/from16 v15, p11

    invoke-direct/range {v0 .. v18}, Lcom/ss/android/ttve/nativePort/TEInterface;->nativeAddExternalTrack(J[Ljava/lang/String;[Ljava/lang/String;[I[I[I[IDDDDII)I

    move-result v0

    return v0
.end method

.method public adjustFilterInOut(III)I
    .locals 6

    .line 429
    iget-wide v1, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    move-object v0, p0

    move v3, p1

    move v4, p2

    move v5, p3

    invoke-direct/range {v0 .. v5}, Lcom/ss/android/ttve/nativePort/TEInterface;->nativeAdjustFilterInOut(JIII)I

    move-result p1

    return p1
.end method

.method public clearDisplay(I)V
    .locals 2

    .line 706
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    invoke-direct {p0, v0, v1, p1}, Lcom/ss/android/ttve/nativePort/TEInterface;->nativeClearDisplay(JI)V

    .line 707
    return-void
.end method

.method public createScene(Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;[[Ljava/lang/String;I)I
    .locals 9

    .line 98
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 99
    const/16 p1, -0x70

    return p1

    .line 102
    :cond_0
    iget-wide v1, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    move-object v0, p0

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    move-object v6, p4

    move-object v7, p5

    move v8, p6

    invoke-direct/range {v0 .. v8}, Lcom/ss/android/ttve/nativePort/TEInterface;->nativeCreateScene(JLjava/lang/String;[Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;[[Ljava/lang/String;I)I

    move-result p1

    .line 103
    if-gez p1, :cond_1

    .line 104
    return p1

    .line 106
    :cond_1
    iput p1, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mHostTrackIndex:I

    .line 107
    const/4 p1, 0x0

    return p1
.end method

.method public createScene2([Ljava/lang/String;[I[I[Ljava/lang/String;[I[I[Ljava/lang/String;[[Ljava/lang/String;I)I
    .locals 13

    move-object v12, p0

    .line 155
    iget-wide v0, v12, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 156
    const/16 v0, -0x70

    return v0

    .line 159
    :cond_0
    iget-wide v1, v12, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    move-object v0, v12

    move-object v3, p1

    move-object v4, p2

    move-object/from16 v5, p3

    move-object/from16 v6, p4

    move-object/from16 v7, p5

    move-object/from16 v8, p6

    move-object/from16 v9, p7

    move-object/from16 v10, p8

    move/from16 v11, p9

    invoke-direct/range {v0 .. v11}, Lcom/ss/android/ttve/nativePort/TEInterface;->nativeCreateScene2(J[Ljava/lang/String;[I[I[Ljava/lang/String;[I[I[Ljava/lang/String;[[Ljava/lang/String;I)I

    move-result v0

    .line 162
    if-gez v0, :cond_1

    .line 163
    return v0

    .line 165
    :cond_1
    iput v0, v12, Lcom/ss/android/ttve/nativePort/TEInterface;->mHostTrackIndex:I

    .line 166
    const/4 v0, 0x0

    return v0
.end method

.method public createTimeline()I
    .locals 4

    .line 832
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 833
    const/16 v0, -0x70

    return v0

    .line 835
    :cond_0
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    invoke-direct {p0, v0, v1}, Lcom/ss/android/ttve/nativePort/TEInterface;->nativeCreateTimeline(J)I

    move-result v0

    return v0
.end method

.method public deleteAudioTrack(I)I
    .locals 4

    .line 267
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 268
    const/4 p1, -0x1

    return p1

    .line 270
    :cond_0
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    invoke-direct {p0, v0, v1, p1}, Lcom/ss/android/ttve/nativePort/TEInterface;->nativeDeleteAudioTrack(JI)I

    move-result p1

    return p1
.end method

.method public deleteSticker(I)I
    .locals 4

    .line 433
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 434
    const/16 p1, -0x70

    return p1

    .line 437
    :cond_0
    if-gez p1, :cond_1

    .line 438
    const/16 p1, -0x64

    return p1

    .line 440
    :cond_1
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    invoke-direct {p0, v0, v1, p1}, Lcom/ss/android/ttve/nativePort/TEInterface;->nativeDeleteExternalTrack(JI)I

    move-result p1

    return p1
.end method

.method public deleteWatermark(I)I
    .locals 4

    .line 444
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 445
    const/16 p1, -0x70

    return p1

    .line 448
    :cond_0
    if-gez p1, :cond_1

    .line 449
    const/16 p1, -0x64

    return p1

    .line 451
    :cond_1
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    invoke-direct {p0, v0, v1, p1}, Lcom/ss/android/ttve/nativePort/TEInterface;->nativeDeleteExternalTrack(JI)I

    move-result p1

    return p1
.end method

.method public destroyEngine()I
    .locals 4

    .line 73
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 74
    const/16 v0, -0x70

    return v0

    .line 76
    :cond_0
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    invoke-direct {p0, v0, v1}, Lcom/ss/android/ttve/nativePort/TEInterface;->nativeDestroyEngine(J)I

    move-result v0

    .line 77
    iput-wide v2, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    .line 78
    return v0
.end method

.method public getCurPosition()I
    .locals 4

    .line 754
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 755
    const/4 v0, -0x1

    return v0

    .line 757
    :cond_0
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    invoke-direct {p0, v0, v1}, Lcom/ss/android/ttve/nativePort/TEInterface;->nativeGetCurPosition(J)I

    move-result v0

    return v0
.end method

.method public getCurState()I
    .locals 4

    .line 762
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 763
    const/4 v0, -0x1

    return v0

    .line 765
    :cond_0
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    invoke-direct {p0, v0, v1}, Lcom/ss/android/ttve/nativePort/TEInterface;->nativeGetCurState(J)I

    move-result v0

    return v0
.end method

.method public getDisplayImage([B)I
    .locals 4

    .line 690
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    const/16 p1, -0x70

    return p1

    .line 691
    :cond_0
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    invoke-direct {p0, v0, v1, p1}, Lcom/ss/android/ttve/nativePort/TEInterface;->nativeGetDisplayImage(J[B)I

    move-result p1

    return p1
.end method

.method public getDisplayRect()Lcom/ss/android/vesdk/VERect;
    .locals 6

    .line 695
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    const/4 v1, 0x0

    if-nez v0, :cond_0

    new-instance v0, Lcom/ss/android/vesdk/VERect;

    invoke-direct {v0, v1, v1, v1, v1}, Lcom/ss/android/vesdk/VERect;-><init>(IIII)V

    return-object v0

    .line 696
    :cond_0
    iget-wide v2, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    invoke-direct {p0, v2, v3}, Lcom/ss/android/ttve/nativePort/TEInterface;->nativeGetDisplayDumpSize(J)[I

    move-result-object v0

    .line 697
    new-instance v2, Lcom/ss/android/vesdk/VERect;

    aget v1, v0, v1

    const/4 v3, 0x1

    aget v3, v0, v3

    const/4 v4, 0x2

    aget v4, v0, v4

    const/4 v5, 0x3

    aget v0, v0, v5

    invoke-direct {v2, v1, v3, v4, v0}, Lcom/ss/android/vesdk/VERect;-><init>(IIII)V

    return-object v2
.end method

.method public getDuration()I
    .locals 4

    .line 747
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 748
    const/4 v0, -0x1

    return v0

    .line 750
    :cond_0
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    invoke-direct {p0, v0, v1}, Lcom/ss/android/ttve/nativePort/TEInterface;->nativeGetDuration(J)I

    move-result v0

    return v0
.end method

.method public getInfoStickerBoundingBox(I)[F
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ss/android/vesdk/VEException;
        }
    .end annotation

    .line 371
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_2

    .line 374
    iget v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mHostTrackIndex:I

    if-ltz v0, :cond_1

    .line 378
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    invoke-direct {p0, v0, v1, p1}, Lcom/ss/android/ttve/nativePort/TEInterface;->nativeGetInfoStickerBoundingBox(JI)[F

    move-result-object p1

    .line 379
    const/4 v0, 0x0

    aget v1, p1, v0

    const/4 v2, 0x0

    cmpl-float v1, v1, v2

    if-nez v1, :cond_0

    .line 382
    const/4 v1, 0x4

    new-array v2, v1, [F

    .line 383
    const/4 v3, 0x1

    invoke-static {p1, v3, v2, v0, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 384
    return-object v2

    .line 380
    :cond_0
    new-instance v1, Lcom/ss/android/vesdk/VEException;

    const/4 v2, -0x1

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "native getInfoStickerBoundingBox failed: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget p1, p1, v0

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v1, v2, p1}, Lcom/ss/android/vesdk/VEException;-><init>(ILjava/lang/String;)V

    throw v1

    .line 375
    :cond_1
    new-instance p1, Lcom/ss/android/vesdk/VEException;

    const/16 v0, -0x64

    const-string v1, ""

    invoke-direct {p1, v0, v1}, Lcom/ss/android/vesdk/VEException;-><init>(ILjava/lang/String;)V

    throw p1

    .line 372
    :cond_2
    new-instance p1, Lcom/ss/android/vesdk/VEException;

    const/16 v0, -0x70

    const-string v1, ""

    invoke-direct {p1, v0, v1}, Lcom/ss/android/vesdk/VEException;-><init>(ILjava/lang/String;)V

    throw p1
.end method

.method public getInitResolution()[I
    .locals 5

    .line 710
    const/4 v0, 0x4

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    .line 711
    nop

    .line 712
    nop

    .line 713
    nop

    .line 714
    nop

    .line 715
    iget-wide v1, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-nez v1, :cond_0

    .line 716
    return-object v0

    .line 718
    :cond_0
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    invoke-direct {p0, v0, v1}, Lcom/ss/android/ttve/nativePort/TEInterface;->nativeGetInitResolution(J)[I

    move-result-object v0

    return-object v0

    :array_0
    .array-data 4
        -0x1
        -0x1
        -0x1
        -0x1
    .end array-data
.end method

.method public getNativeHandler()J
    .locals 2

    .line 64
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    return-wide v0
.end method

.method public getStickerFilterIndex(I)I
    .locals 4

    .line 328
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 329
    const/16 p1, -0x70

    return p1

    .line 330
    :cond_0
    if-gez p1, :cond_1

    .line 331
    const/16 p1, -0x64

    return p1

    .line 333
    :cond_1
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    invoke-direct {p0, v0, v1, p1}, Lcom/ss/android/ttve/nativePort/TEInterface;->nativeGetExternalTrackFilter(JI)I

    move-result p1

    return p1
.end method

.method public getTrackVolume(III)F
    .locals 6

    .line 811
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 812
    const/4 p1, 0x0

    return p1

    .line 814
    :cond_0
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

    .line 727
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    const/16 v0, -0x70

    return v0

    .line 728
    :cond_0
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    invoke-direct {p0, v0, v1}, Lcom/ss/android/ttve/nativePort/TEInterface;->nativePause(J)I

    move-result v0

    return v0
.end method

.method public pauseSync()I
    .locals 4

    .line 732
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    const/16 v0, -0x70

    return v0

    .line 733
    :cond_0
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    invoke-direct {p0, v0, v1}, Lcom/ss/android/ttve/nativePort/TEInterface;->nativePauseSync(J)I

    move-result v0

    return v0
.end method

.method public prepareEngine(IIILjava/lang/String;)I
    .locals 7

    .line 463
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 464
    const/16 p1, -0x70

    return p1

    .line 465
    :cond_0
    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 466
    const-string p4, ""

    .line 469
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

    .line 660
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    return-void

    .line 661
    :cond_0
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    invoke-direct {p0, v0, v1}, Lcom/ss/android/ttve/nativePort/TEInterface;->nativeReleasePreviewSurface(J)V

    .line 662
    return-void
.end method

.method public removeFilter([I)I
    .locals 4

    .line 414
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    const/16 p1, -0x70

    return p1

    .line 415
    :cond_0
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    invoke-direct {p0, v0, v1, p1}, Lcom/ss/android/ttve/nativePort/TEInterface;->nativeRemoveFilter(J[I)I

    move-result p1

    return p1
.end method

.method public removeInfoSticker(I)I
    .locals 4

    .line 361
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 362
    const/16 p1, -0x70

    return p1

    .line 363
    :cond_0
    iget v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mHostTrackIndex:I

    if-gez v0, :cond_1

    .line 364
    const/16 p1, -0x69

    return p1

    .line 367
    :cond_1
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    invoke-direct {p0, v0, v1, p1}, Lcom/ss/android/ttve/nativePort/TEInterface;->nativeRemoveInfoSticker(JI)I

    move-result p1

    return p1
.end method

.method public restore(Ljava/lang/String;)I
    .locals 4

    .line 125
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 126
    const/16 p1, -0x70

    return p1

    .line 129
    :cond_0
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    invoke-direct {p0, v0, v1, p1}, Lcom/ss/android/ttve/nativePort/TEInterface;->nativeRestore(JLjava/lang/String;)I

    move-result p1

    return p1
.end method

.method public save()Ljava/lang/String;
    .locals 4
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .line 116
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 117
    return-object v1

    .line 120
    :cond_0
    iget-wide v2, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    invoke-direct {p0, v2, v3}, Lcom/ss/android/ttve/nativePort/TEInterface;->nativeSave(J)Ljava/lang/String;

    move-result-object v0

    .line 121
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_1

    move-object v0, v1

    :cond_1
    return-object v0
.end method

.method public seek(IIII)I
    .locals 7

    .line 643
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 644
    const/16 p1, -0x70

    return p1

    .line 646
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
    .locals 8

    .line 701
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    return-void

    .line 702
    :cond_0
    iget-wide v2, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    move-object v1, p0

    move v4, p1

    move v5, p2

    move v6, p3

    move v7, p4

    invoke-direct/range {v1 .. v7}, Lcom/ss/android/ttve/nativePort/TEInterface;->nativeSetBackGroundColor(JFFFF)V

    .line 703
    return-void
.end method

.method public setCompileCommonEncodeOptions(II)V
    .locals 3

    .line 508
    const-string v0, "CompileBitrateMode"

    int-to-long v1, p1

    const/4 p1, 0x0

    invoke-virtual {p0, p1, v0, v1, v2}, Lcom/ss/android/ttve/nativePort/TEInterface;->setOption(ILjava/lang/String;J)V

    .line 509
    const-string v0, "CompileEncodeProfile"

    int-to-long v1, p2

    invoke-virtual {p0, p1, v0, v1, v2}, Lcom/ss/android/ttve/nativePort/TEInterface;->setOption(ILjava/lang/String;J)V

    .line 510
    return-void
.end method

.method public setCompileFps(I)V
    .locals 3

    .line 539
    const-string v0, "CompileFps"

    int-to-long v1, p1

    const/4 p1, 0x0

    invoke-virtual {p0, p1, v0, v1, v2}, Lcom/ss/android/ttve/nativePort/TEInterface;->setOption(ILjava/lang/String;J)V

    .line 540
    return-void
.end method

.method public setCompileHardwareEncodeOptions(I)V
    .locals 3

    .line 498
    const-string v0, "CompileHardwareBitrate"

    int-to-long v1, p1

    const/4 p1, 0x0

    invoke-virtual {p0, p1, v0, v1, v2}, Lcom/ss/android/ttve/nativePort/TEInterface;->setOption(ILjava/lang/String;J)V

    .line 499
    return-void
.end method

.method public setCompileSoftwareEncodeOptions(IIII)V
    .locals 3

    .line 521
    const-string v0, "CompileSoftwareCrf"

    int-to-long v1, p1

    const/4 p1, 0x0

    invoke-virtual {p0, p1, v0, v1, v2}, Lcom/ss/android/ttve/nativePort/TEInterface;->setOption(ILjava/lang/String;J)V

    .line 522
    const-string v0, "CompileSoftwareMaxrate"

    int-to-long v1, p2

    invoke-virtual {p0, p1, v0, v1, v2}, Lcom/ss/android/ttve/nativePort/TEInterface;->setOption(ILjava/lang/String;J)V

    .line 523
    const-string p2, "CompileSoftwarePreset"

    int-to-long v0, p3

    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/ss/android/ttve/nativePort/TEInterface;->setOption(ILjava/lang/String;J)V

    .line 524
    const-string p2, "CompileSoftwareQp"

    int-to-long p3, p4

    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/ss/android/ttve/nativePort/TEInterface;->setOption(ILjava/lang/String;J)V

    .line 525
    return-void
.end method

.method public setCompileType(I)V
    .locals 3

    .line 561
    const-string v0, "CompileType"

    int-to-long v1, p1

    const/4 p1, 0x0

    invoke-virtual {p0, p1, v0, v1, v2}, Lcom/ss/android/ttve/nativePort/TEInterface;->setOption(ILjava/lang/String;J)V

    .line 562
    return-void
.end method

.method public setCompileWatermark(Lcom/ss/android/vesdk/VEWatermarkParam;)V
    .locals 2

    .line 551
    const-string v0, "CompilePathWatermark"

    iget-object p1, p1, Lcom/ss/android/vesdk/VEWatermarkParam;->extFile:Ljava/lang/String;

    const/4 v1, 0x0

    invoke-virtual {p0, v1, v0, p1}, Lcom/ss/android/ttve/nativePort/TEInterface;->setOption(ILjava/lang/String;Ljava/lang/String;)V

    .line 552
    const-string p1, "CompilePathWavWatermark"

    const-string v0, ""

    invoke-virtual {p0, v1, p1, v0}, Lcom/ss/android/ttve/nativePort/TEInterface;->setOption(ILjava/lang/String;Ljava/lang/String;)V

    .line 553
    return-void
.end method

.method public setCrop(IIII)V
    .locals 4

    .line 597
    const-string v0, "engine crop x"

    const-string v1, "engine crop y"

    const-string v2, "engine crop width"

    const-string v3, "engine crop height"

    filled-new-array {v0, v1, v2, v3}, [Ljava/lang/String;

    move-result-object v0

    .line 598
    const/4 v1, 0x4

    new-array v1, v1, [J

    int-to-long v2, p1

    const/4 p1, 0x0

    aput-wide v2, v1, p1

    int-to-long p1, p2

    const/4 v2, 0x1

    aput-wide p1, v1, v2

    int-to-long p1, p3

    const/4 p3, 0x2

    aput-wide p1, v1, p3

    int-to-long p1, p4

    const/4 p3, 0x3

    aput-wide p1, v1, p3

    .line 599
    invoke-virtual {p0, v2, v0, v1}, Lcom/ss/android/ttve/nativePort/TEInterface;->setOption(I[Ljava/lang/String;[J)V

    .line 600
    return-void
.end method

.method public setDisplayState(FFFFIIZ)V
    .locals 10

    move-object v0, p0

    .line 685
    iget-wide v1, v0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-nez v1, :cond_0

    return-void

    .line 686
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

    .line 687
    return-void
.end method

.method public setEncGopSize(I)V
    .locals 3

    .line 547
    const-string v0, "video gop size"

    int-to-long v1, p1

    const/4 p1, 0x0

    invoke-virtual {p0, p1, v0, v1, v2}, Lcom/ss/android/ttve/nativePort/TEInterface;->setOption(ILjava/lang/String;J)V

    .line 548
    return-void
.end method

.method public setEngineCompilePath(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 528
    const-string v0, "CompilePath"

    const/4 v1, 0x0

    invoke-virtual {p0, v1, v0, p1}, Lcom/ss/android/ttve/nativePort/TEInterface;->setOption(ILjava/lang/String;Ljava/lang/String;)V

    .line 529
    const-string p1, "CompilePathWav"

    invoke-virtual {p0, v1, p1, p2}, Lcom/ss/android/ttve/nativePort/TEInterface;->setOption(ILjava/lang/String;Ljava/lang/String;)V

    .line 530
    return-void
.end method

.method public setExpandLastFrame(Z)V
    .locals 4

    .line 655
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    return-void

    .line 656
    :cond_0
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    invoke-direct {p0, v0, v1, p1}, Lcom/ss/android/ttve/nativePort/TEInterface;->nativeSetExpandLastFrame(JZ)V

    .line 657
    return-void
.end method

.method public setFilterParam(ILjava/lang/String;Lcom/ss/android/vesdk/VEStickerAnimator;)I
    .locals 6

    .line 424
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    const/16 p1, -0x70

    return p1

    .line 425
    :cond_0
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

    .line 419
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    const/16 p1, -0x70

    return p1

    .line 420
    :cond_0
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

    .line 592
    if-eqz p1, :cond_0

    const-wide/16 v0, 0x1

    goto :goto_0

    :cond_0
    const-wide/16 v0, 0x0

    .line 593
    :goto_0
    const/4 p1, 0x1

    const-string v2, "engine loop play"

    invoke-virtual {p0, p1, v2, v0, v1}, Lcom/ss/android/ttve/nativePort/TEInterface;->setOption(ILjava/lang/String;J)V

    .line 594
    return-void
.end method

.method public setOption(ILjava/lang/String;F)V
    .locals 7

    .line 790
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 791
    return-void

    .line 793
    :cond_0
    iget-wide v2, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    move-object v1, p0

    move v4, p1

    move-object v5, p2

    move v6, p3

    invoke-direct/range {v1 .. v6}, Lcom/ss/android/ttve/nativePort/TEInterface;->nativeSetOption(JILjava/lang/String;F)V

    .line 794
    return-void
.end method

.method public setOption(ILjava/lang/String;J)V
    .locals 8

    .line 783
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 784
    return-void

    .line 786
    :cond_0
    iget-wide v2, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    move-object v1, p0

    move v4, p1

    move-object v5, p2

    move-wide v6, p3

    invoke-direct/range {v1 .. v7}, Lcom/ss/android/ttve/nativePort/TEInterface;->nativeSetOption(JILjava/lang/String;J)V

    .line 787
    return-void
.end method

.method public setOption(ILjava/lang/String;Ljava/lang/String;)V
    .locals 7

    .line 776
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 777
    return-void

    .line 779
    :cond_0
    iget-wide v2, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    move-object v1, p0

    move v4, p1

    move-object v5, p2

    move-object v6, p3

    invoke-direct/range {v1 .. v6}, Lcom/ss/android/ttve/nativePort/TEInterface;->nativeSetOption(JILjava/lang/String;Ljava/lang/String;)V

    .line 780
    return-void
.end method

.method public setOption(I[Ljava/lang/String;[J)V
    .locals 7

    .line 797
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 798
    return-void

    .line 800
    :cond_0
    iget-wide v2, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    move-object v1, p0

    move v4, p1

    move-object v5, p2

    move-object v6, p3

    invoke-direct/range {v1 .. v6}, Lcom/ss/android/ttve/nativePort/TEInterface;->nativeSetOptionArray(JI[Ljava/lang/String;[J)V

    .line 801
    return-void
.end method

.method public setPreviewScaleMode(I)I
    .locals 4

    .line 627
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 628
    const/16 p1, -0x70

    return p1

    .line 631
    :cond_0
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    invoke-direct {p0, v0, v1, p1}, Lcom/ss/android/ttve/nativePort/TEInterface;->nativeSetPreviewScaleMode(JI)I

    move-result p1

    return p1
.end method

.method public setPreviewSurface(Landroid/view/Surface;)V
    .locals 4

    .line 650
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    return-void

    .line 651
    :cond_0
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    invoke-direct {p0, v0, v1, p1}, Lcom/ss/android/ttve/nativePort/TEInterface;->nativeSetPreviewSurface(JLandroid/view/Surface;)V

    .line 652
    return-void
.end method

.method public setResizer(IFF)V
    .locals 3

    .line 533
    const-string v0, "filter mode"

    int-to-long v1, p1

    const/4 p1, 0x0

    invoke-virtual {p0, p1, v0, v1, v2}, Lcom/ss/android/ttve/nativePort/TEInterface;->setOption(ILjava/lang/String;J)V

    .line 534
    const-string v0, "resizer offset x percent"

    invoke-virtual {p0, p1, v0, p2}, Lcom/ss/android/ttve/nativePort/TEInterface;->setOption(ILjava/lang/String;F)V

    .line 535
    const-string p2, "resizer offset y percent"

    invoke-virtual {p0, p1, p2, p3}, Lcom/ss/android/ttve/nativePort/TEInterface;->setOption(ILjava/lang/String;F)V

    .line 536
    return-void
.end method

.method public setScaleMode(I)V
    .locals 3

    .line 609
    const-string v0, "filter mode"

    int-to-long v1, p1

    const/4 p1, 0x0

    invoke-virtual {p0, p1, v0, v1, v2}, Lcom/ss/android/ttve/nativePort/TEInterface;->setOption(ILjava/lang/String;J)V

    .line 610
    return-void
.end method

.method public setSpeedRatio(F)V
    .locals 4

    .line 680
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    return-void

    .line 681
    :cond_0
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    invoke-direct {p0, v0, v1, p1}, Lcom/ss/android/ttve/nativePort/TEInterface;->nativeSetSpeedRatio(JF)V

    .line 682
    return-void
.end method

.method public setSurfaceSize(II)V
    .locals 4

    .line 675
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    return-void

    .line 676
    :cond_0
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    invoke-direct {p0, v0, v1, p1, p2}, Lcom/ss/android/ttve/nativePort/TEInterface;->nativeSetSurfaceSize(JII)V

    .line 677
    return-void
.end method

.method public setTrackVolume(IIF)Z
    .locals 6

    .line 804
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 805
    const/4 p1, 0x0

    return p1

    .line 807
    :cond_0
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

    .line 543
    const-string v0, "HardwareVideo"

    if-eqz p1, :cond_0

    const-wide/16 v1, 0x1

    goto :goto_0

    :cond_0
    const-wide/16 v1, 0x0

    :goto_0
    const/4 p1, 0x0

    invoke-virtual {p0, p1, v0, v1, v2}, Lcom/ss/android/ttve/nativePort/TEInterface;->setOption(ILjava/lang/String;J)V

    .line 544
    return-void
.end method

.method public setUseLargeMattingModel(Z)V
    .locals 3

    .line 477
    const-string v0, "UseLargeMattingModel"

    if-eqz p1, :cond_0

    const-wide/16 v1, 0x1

    goto :goto_0

    :cond_0
    const-wide/16 v1, 0x0

    :goto_0
    const/4 p1, 0x0

    invoke-virtual {p0, p1, v0, v1, v2}, Lcom/ss/android/ttve/nativePort/TEInterface;->setOption(ILjava/lang/String;J)V

    .line 478
    return-void
.end method

.method public setUsrRotate(I)V
    .locals 4

    .line 572
    const-wide/16 v0, 0x0

    const/4 v2, 0x0

    if-eqz p1, :cond_3

    const/16 v3, 0x5a

    if-eq p1, v3, :cond_2

    const/16 v3, 0xb4

    if-eq p1, v3, :cond_1

    const/16 v3, 0x10e

    if-eq p1, v3, :cond_0

    .line 586
    const-string p1, "usr rotate"

    invoke-virtual {p0, v2, p1, v0, v1}, Lcom/ss/android/ttve/nativePort/TEInterface;->setOption(ILjava/lang/String;J)V

    goto :goto_0

    .line 583
    :cond_0
    const-string p1, "usr rotate"

    const-wide/16 v0, 0x3

    invoke-virtual {p0, v2, p1, v0, v1}, Lcom/ss/android/ttve/nativePort/TEInterface;->setOption(ILjava/lang/String;J)V

    .line 584
    goto :goto_0

    .line 580
    :cond_1
    const-string p1, "usr rotate"

    const-wide/16 v0, 0x2

    invoke-virtual {p0, v2, p1, v0, v1}, Lcom/ss/android/ttve/nativePort/TEInterface;->setOption(ILjava/lang/String;J)V

    .line 581
    goto :goto_0

    .line 577
    :cond_2
    const-string p1, "usr rotate"

    const-wide/16 v0, 0x1

    invoke-virtual {p0, v2, p1, v0, v1}, Lcom/ss/android/ttve/nativePort/TEInterface;->setOption(ILjava/lang/String;J)V

    .line 578
    goto :goto_0

    .line 574
    :cond_3
    const-string p1, "usr rotate"

    invoke-virtual {p0, v2, p1, v0, v1}, Lcom/ss/android/ttve/nativePort/TEInterface;->setOption(ILjava/lang/String;J)V

    .line 575
    nop

    .line 589
    :goto_0
    return-void
.end method

.method public setVideoCompileBitrate(II)V
    .locals 3

    .line 488
    const-string v0, "CompileBitrateMode"

    int-to-long v1, p1

    const/4 p1, 0x0

    invoke-virtual {p0, p1, v0, v1, v2}, Lcom/ss/android/ttve/nativePort/TEInterface;->setOption(ILjava/lang/String;J)V

    .line 489
    const-string v0, "CompileBitrateValue"

    int-to-long v1, p2

    invoke-virtual {p0, p1, v0, v1, v2}, Lcom/ss/android/ttve/nativePort/TEInterface;->setOption(ILjava/lang/String;J)V

    .line 490
    return-void
.end method

.method public setViewPort(IIII)V
    .locals 8

    .line 670
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    return-void

    .line 671
    :cond_0
    iget-wide v2, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    move-object v1, p0

    move v4, p1

    move v5, p2

    move v6, p3

    move v7, p4

    invoke-direct/range {v1 .. v7}, Lcom/ss/android/ttve/nativePort/TEInterface;->nativeSetViewPort(JIIII)V

    .line 672
    return-void
.end method

.method public setWaterMark([Ljava/lang/String;IIIII)V
    .locals 9

    .line 665
    iget-wide v1, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-nez v1, :cond_0

    return-void

    .line 666
    :cond_0
    iget-wide v1, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    move-object v0, p0

    move-object v3, p1

    move v4, p2

    move v5, p3

    move v6, p4

    move v7, p5

    move v8, p6

    invoke-direct/range {v0 .. v8}, Lcom/ss/android/ttve/nativePort/TEInterface;->nativeSetWaterMark(J[Ljava/lang/String;IIIII)V

    .line 667
    return-void
.end method

.method public setWidthHeight(II)V
    .locals 3

    .line 614
    const-string v0, "engine compile width"

    int-to-long v1, p1

    const/4 p1, 0x0

    invoke-virtual {p0, p1, v0, v1, v2}, Lcom/ss/android/ttve/nativePort/TEInterface;->setOption(ILjava/lang/String;J)V

    .line 615
    const-string v0, "engine compile height"

    int-to-long v1, p2

    invoke-virtual {p0, p1, v0, v1, v2}, Lcom/ss/android/ttve/nativePort/TEInterface;->setOption(ILjava/lang/String;J)V

    .line 616
    return-void
.end method

.method public start()I
    .locals 4

    .line 722
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    const/16 v0, -0x70

    return v0

    .line 723
    :cond_0
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    invoke-direct {p0, v0, v1}, Lcom/ss/android/ttve/nativePort/TEInterface;->nativeStart(J)I

    move-result v0

    return v0
.end method

.method public stop()I
    .locals 4

    .line 737
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    const/16 v0, -0x70

    return v0

    .line 738
    :cond_0
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    invoke-direct {p0, v0, v1}, Lcom/ss/android/ttve/nativePort/TEInterface;->nativeStop(J)I

    move-result v0

    return v0
.end method

.method public native stringFromJNI()Ljava/lang/String;
.end method

.method public testSerialization()Z
    .locals 2

    .line 839
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    invoke-direct {p0, v0, v1}, Lcom/ss/android/ttve/nativePort/TEInterface;->nativeTestSerialization(J)Z

    move-result v0

    return v0
.end method

.method public updateAudioTrack(IIIIIZ)I
    .locals 9

    .line 229
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 230
    const/4 p1, -0x1

    return p1

    .line 231
    :cond_0
    if-gez p1, :cond_1

    .line 232
    const/16 p1, -0x64

    return p1

    .line 234
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

.method public updateAudioTrack(IIIIIZII)I
    .locals 11

    move-object v0, p0

    .line 252
    iget-wide v1, v0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-nez v1, :cond_0

    .line 253
    const/4 v0, -0x1

    return v0

    .line 254
    :cond_0
    if-gez p1, :cond_1

    .line 255
    const/16 v0, -0x64

    return v0

    .line 257
    :cond_1
    iget-wide v1, v0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    move v3, p1

    move v4, p2

    move v5, p3

    move v6, p4

    move/from16 v7, p5

    move/from16 v8, p6

    move/from16 v9, p7

    move/from16 v10, p8

    invoke-direct/range {v0 .. v10}, Lcom/ss/android/ttve/nativePort/TEInterface;->nativeUpdateAudioTrack2(JIIIIIZII)I

    move-result v0

    return v0
.end method

.method public updateResolution(IIII)V
    .locals 4

    .line 603
    const-string v0, "engine preivew width"

    const-string v1, "engine preivew height"

    const-string v2, "engine preivew width percent"

    const-string v3, "engine preivew height percent"

    filled-new-array {v0, v1, v2, v3}, [Ljava/lang/String;

    move-result-object v0

    .line 604
    const/4 v1, 0x4

    new-array v1, v1, [J

    int-to-long v2, p1

    const/4 p1, 0x0

    aput-wide v2, v1, p1

    int-to-long p1, p2

    const/4 v2, 0x1

    aput-wide p1, v1, v2

    int-to-long p1, p3

    const/4 p3, 0x2

    aput-wide p1, v1, p3

    int-to-long p1, p4

    const/4 p3, 0x3

    aput-wide p1, v1, p3

    .line 605
    invoke-virtual {p0, v2, v0, v1}, Lcom/ss/android/ttve/nativePort/TEInterface;->setOption(I[Ljava/lang/String;[J)V

    .line 606
    return-void
.end method

.method public updateTrackClips(II[Ljava/lang/String;)I
    .locals 6

    .line 818
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 819
    const/16 p1, -0x70

    return p1

    .line 821
    :cond_0
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

    .line 825
    iget-wide v0, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 826
    const/16 p1, -0x70

    return p1

    .line 828
    :cond_0
    iget-wide v1, p0, Lcom/ss/android/ttve/nativePort/TEInterface;->mNative:J

    move-object v0, p0

    move v3, p1

    move v4, p2

    move v5, p3

    invoke-direct/range {v0 .. v5}, Lcom/ss/android/ttve/nativePort/TEInterface;->nativeUpdateTrackFilter(JIIZ)I

    move-result p1

    return p1
.end method
