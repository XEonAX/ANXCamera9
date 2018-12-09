.class public Lcom/android/camera2/compat/MiCameraCompat;
.super Ljava/lang/Object;
.source "MiCameraCompat.java"


# static fields
.field static final IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 23
    invoke-static {}, Lcom/mi/config/b;->fW()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 24
    new-instance v0, Lcom/android/camera2/compat/MiCameraCompatQcomImpl;

    invoke-direct {v0}, Lcom/android/camera2/compat/MiCameraCompatQcomImpl;-><init>()V

    sput-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    goto :goto_0

    .line 25
    :cond_0
    invoke-static {}, Lcom/mi/config/b;->fZ()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 26
    new-instance v0, Lcom/android/camera2/compat/MiCameraCompatMtkImpl;

    invoke-direct {v0}, Lcom/android/camera2/compat/MiCameraCompatMtkImpl;-><init>()V

    sput-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    goto :goto_0

    .line 28
    :cond_1
    new-instance v0, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-direct {v0}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;-><init>()V

    sput-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    .line 30
    :goto_0
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static applyASDEnable(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V
    .locals 1

    .line 143
    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyASDEnable(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 144
    return-void
.end method

.method public static applyASDScene(Landroid/hardware/camera2/CaptureRequest$Builder;Ljava/lang/String;)V
    .locals 1

    .line 182
    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyASDScene(Landroid/hardware/camera2/CaptureRequest$Builder;Ljava/lang/String;)V

    .line 183
    return-void
.end method

.method public static applyAiScenePeriod(Landroid/hardware/camera2/CaptureRequest$Builder;I)V
    .locals 1

    .line 186
    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyAiScenePeriod(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 187
    return-void
.end method

.method public static applyBeautyParameter(Landroid/hardware/camera2/CaptureRequest$Builder;Lcom/android/camera/fragment/beauty/BeautyValues;)V
    .locals 1

    .line 126
    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyBeautyParameter(Landroid/hardware/camera2/CaptureRequest$Builder;Lcom/android/camera/fragment/beauty/BeautyValues;)V

    .line 127
    return-void
.end method

.method public static applyBokehEnable(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V
    .locals 1

    .line 106
    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyBokeh(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 107
    return-void
.end method

.method public static applyBurstFps(Landroid/hardware/camera2/CaptureRequest$Builder;I)V
    .locals 1

    .line 202
    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyBurstFps(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 203
    return-void
.end method

.method public static applyBurstHint(Landroid/hardware/camera2/CaptureRequest$Builder;I)V
    .locals 1

    .line 198
    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyBurstHint(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 199
    return-void
.end method

.method public static applyCameraAi30Enable(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V
    .locals 1

    .line 156
    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyCameraAi30Enable(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 157
    return-void
.end method

.method public static applyContrast(Landroid/hardware/camera2/CaptureRequest$Builder;I)V
    .locals 1

    .line 45
    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyContrast(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 46
    return-void
.end method

.method public static applyCustomAWB(Landroid/hardware/camera2/CaptureRequest$Builder;I)V
    .locals 1

    .line 41
    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyCustomWB(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 42
    return-void
.end method

.method public static applyDepurpleEnable(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V
    .locals 1

    .line 168
    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyDepurpleEnable(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 169
    return-void
.end method

.method public static applyDeviceOrientation(Landroid/hardware/camera2/CaptureRequest$Builder;I)V
    .locals 1

    .line 122
    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyDeviceOrientation(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 123
    return-void
.end method

.method public static applyExposureMeteringMode(Landroid/hardware/camera2/CaptureRequest$Builder;I)V
    .locals 1

    .line 58
    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyExposureMeteringMode(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 59
    return-void
.end method

.method public static applyExposureTime(Landroid/hardware/camera2/CaptureRequest$Builder;J)V
    .locals 1

    .line 37
    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1, p2}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyExposureTime(Landroid/hardware/camera2/CaptureRequest$Builder;J)V

    .line 38
    return-void
.end method

.method public static applyEyeLight(Landroid/hardware/camera2/CaptureRequest$Builder;II)V
    .locals 1

    .line 218
    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1, p2}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyEyeLight(Landroid/hardware/camera2/CaptureRequest$Builder;II)V

    .line 219
    return-void
.end method

.method public static applyFNumber(Landroid/hardware/camera2/CaptureRequest$Builder;Ljava/lang/String;)V
    .locals 1

    .line 234
    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyFNumber(Landroid/hardware/camera2/CaptureRequest$Builder;Ljava/lang/String;)V

    .line 235
    return-void
.end method

.method public static applyFaceAgeAnalyzeEnable(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V
    .locals 1

    .line 114
    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyFaceAnalyzeAge(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 115
    return-void
.end method

.method public static applyFaceScoreEnable(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V
    .locals 1

    .line 118
    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyFaceScore(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 119
    return-void
.end method

.method public static applyFaceWaterMark(Landroid/hardware/camera2/CaptureRequest$Builder;Ljava/lang/String;)V
    .locals 1

    .line 94
    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyFaceWaterMark(Landroid/hardware/camera2/CaptureRequest$Builder;Ljava/lang/String;)V

    .line 95
    return-void
.end method

.method public static applyFrontMirror(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V
    .locals 1

    .line 194
    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyFrontMirror(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 195
    return-void
.end method

.method public static applyHDR(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V
    .locals 1

    .line 66
    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyHDR(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 67
    return-void
.end method

.method public static applyHDRCheckerEnable(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V
    .locals 1

    .line 70
    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyHDRCheckerEnable(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 71
    return-void
.end method

.method public static applyHHT(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V
    .locals 1

    .line 62
    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyHHT(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 63
    return-void
.end method

.method public static applyHdrBracketMode(Landroid/hardware/camera2/CaptureRequest$Builder;B)V
    .locals 1

    .line 226
    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyHdrBracketMode(Landroid/hardware/camera2/CaptureRequest$Builder;B)V

    .line 227
    return-void
.end method

.method public static applyISO(Landroid/hardware/camera2/CaptureRequest$Builder;I)V
    .locals 1

    .line 33
    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyISO(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 34
    return-void
.end method

.method public static applyIsHfrPreview(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V
    .locals 1

    .line 206
    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyIsHfrPreview(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 207
    return-void
.end method

.method public static applyLensDirtyDetect(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V
    .locals 1

    .line 210
    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyLensDirtyDetect(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 211
    return-void
.end method

.method public static applyMfnrEnable(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V
    .locals 1

    .line 98
    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyMfnr(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 99
    return-void
.end method

.method public static applyMultiFrameInputNum(Landroid/hardware/camera2/CaptureRequest$Builder;I)V
    .locals 1

    .line 230
    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyMultiFrameInputNum(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 231
    return-void
.end method

.method public static applyNormalWideLDC(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V
    .locals 1

    .line 160
    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyNormalWideLDC(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 161
    return-void
.end method

.method public static applyParallelProcessEnable(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V
    .locals 1

    .line 78
    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyParallelProcessEnable(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 79
    return-void
.end method

.method public static applyParallelProcessPath(Landroid/hardware/camera2/CaptureRequest$Builder;Ljava/lang/String;)V
    .locals 1

    .line 74
    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyParallelProcessPath(Landroid/hardware/camera2/CaptureRequest$Builder;Ljava/lang/String;)V

    .line 75
    return-void
.end method

.method public static applyPortraitLighting(Landroid/hardware/camera2/CaptureRequest$Builder;I)V
    .locals 1

    .line 214
    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyPortraitLighting(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 215
    return-void
.end method

.method public static applySaturation(Landroid/hardware/camera2/CaptureRequest$Builder;I)V
    .locals 1

    .line 49
    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applySaturation(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 50
    return-void
.end method

.method public static applySharpness(Landroid/hardware/camera2/CaptureRequest$Builder;I)V
    .locals 1

    .line 53
    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applySharpness(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 54
    return-void
.end method

.method public static applySnapshotTorch(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V
    .locals 1

    .line 190
    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applySnapshotTorch(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 191
    return-void
.end method

.method public static applyStFastZoomIn(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V
    .locals 1

    .line 110
    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyStFastZoomIn(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 111
    return-void
.end method

.method public static applySuperNightScene(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V
    .locals 1

    .line 222
    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applySuperNightScene(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 223
    return-void
.end method

.method public static applySuperResolution(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V
    .locals 1

    .line 82
    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applySuperResolution(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 83
    return-void
.end method

.method public static applySwMfnrEnable(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V
    .locals 1

    .line 102
    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applySwMfnr(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 103
    return-void
.end method

.method public static applyTimeWaterMark(Landroid/hardware/camera2/CaptureRequest$Builder;Ljava/lang/String;)V
    .locals 1

    .line 90
    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyTimeWaterMark(Landroid/hardware/camera2/CaptureRequest$Builder;Ljava/lang/String;)V

    .line 91
    return-void
.end method

.method public static applyUltraWideLDC(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V
    .locals 1

    .line 164
    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyUltraWideLDC(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 165
    return-void
.end method

.method public static applyVideoStreamState(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V
    .locals 1

    .line 130
    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyVideoStreamState(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 131
    return-void
.end method

.method public static applyWaterMarkAppliedList(Landroid/hardware/camera2/CaptureRequest$Builder;Ljava/lang/String;)V
    .locals 1

    .line 86
    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyWaterMarkAppliedList(Landroid/hardware/camera2/CaptureRequest$Builder;Ljava/lang/String;)V

    .line 87
    return-void
.end method

.method public static supportBeautyType(Ljava/util/HashSet;Lcom/android/camera/fragment/beauty/BeautyParameters$Type;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/android/camera/fragment/beauty/BeautyParameters$Type;",
            ")Z"
        }
    .end annotation

    .line 248
    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->supportBeautyType(Ljava/util/HashSet;Lcom/android/camera/fragment/beauty/BeautyParameters$Type;)Z

    move-result p0

    return p0
.end method

.method public static supportContrast(Ljava/util/HashSet;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;)Z"
        }
    .end annotation

    .line 239
    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->supportContrast(Ljava/util/HashSet;)Z

    move-result p0

    return p0
.end method

.method public static supportExtraHighSpeedVideoConfiguration(Ljava/util/HashSet;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;)Z"
        }
    .end annotation

    .line 252
    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->supportExtraHighSpeedVideoConfiguration(Ljava/util/HashSet;)Z

    move-result p0

    return p0
.end method

.method public static supportEyeLight(Ljava/util/HashSet;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;)Z"
        }
    .end annotation

    .line 256
    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->supportEyeLight(Ljava/util/HashSet;)Z

    move-result p0

    return p0
.end method

.method public static supportLensDirtyDetect(Ljava/util/HashSet;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;)Z"
        }
    .end annotation

    .line 243
    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->supportLensDirtyDetect(Ljava/util/HashSet;)Z

    move-result p0

    return p0
.end method
