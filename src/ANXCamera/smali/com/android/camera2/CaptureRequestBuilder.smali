.class public Lcom/android/camera2/CaptureRequestBuilder;
.super Ljava/lang/Object;
.source "CaptureRequestBuilder.java"


# static fields
.field private static final MAX_REALTIME_EXPOSURE_TIME:J = 0x7735940L

.field private static final TAG:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 31
    const-class v0, Lcom/android/camera2/CaptureRequestBuilder;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera2/CaptureRequestBuilder;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static applyAELock(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V
    .locals 3

    .line 35
    if-nez p0, :cond_0

    .line 36
    return-void

    .line 38
    :cond_0
    sget-object v0, Lcom/android/camera2/CaptureRequestBuilder;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "applyAELock: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 39
    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_LOCK:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 40
    return-void
.end method

.method static applyAERegions(Landroid/hardware/camera2/CaptureRequest$Builder;Lcom/android/camera2/CameraConfigs;)V
    .locals 1

    .line 61
    if-nez p0, :cond_0

    .line 62
    return-void

    .line 64
    :cond_0
    invoke-virtual {p1}, Lcom/android/camera2/CameraConfigs;->getAERegions()[Landroid/hardware/camera2/params/MeteringRectangle;

    move-result-object p1

    .line 65
    if-eqz p1, :cond_1

    .line 66
    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_REGIONS:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-virtual {p0, v0, p1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    goto :goto_0

    .line 68
    :cond_1
    sget-object p1, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_REGIONS:Landroid/hardware/camera2/CaptureRequest$Key;

    sget-object v0, Lcom/android/camera2/MiCamera2;->ZERO_WEIGHT_3A_REGION:[Landroid/hardware/camera2/params/MeteringRectangle;

    invoke-virtual {p0, p1, v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 70
    :goto_0
    return-void
.end method

.method static applyAFRegions(Landroid/hardware/camera2/CaptureRequest$Builder;Lcom/android/camera2/CameraConfigs;)V
    .locals 1

    .line 74
    if-nez p0, :cond_0

    .line 75
    return-void

    .line 77
    :cond_0
    invoke-virtual {p1}, Lcom/android/camera2/CameraConfigs;->getAFRegions()[Landroid/hardware/camera2/params/MeteringRectangle;

    move-result-object p1

    .line 78
    if-eqz p1, :cond_1

    .line 79
    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_REGIONS:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-virtual {p0, v0, p1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    goto :goto_0

    .line 81
    :cond_1
    sget-object p1, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_REGIONS:Landroid/hardware/camera2/CaptureRequest$Key;

    sget-object v0, Lcom/android/camera2/MiCamera2;->ZERO_WEIGHT_3A_REGION:[Landroid/hardware/camera2/params/MeteringRectangle;

    invoke-virtual {p0, p1, v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 83
    :goto_0
    return-void
.end method

.method public static applyASDScene(Landroid/hardware/camera2/CaptureRequest$Builder;Lcom/android/camera2/CameraConfigs;)V
    .locals 0

    .line 785
    if-eqz p0, :cond_1

    if-nez p1, :cond_0

    goto :goto_0

    .line 789
    :cond_0
    invoke-virtual {p1}, Lcom/android/camera2/CameraConfigs;->getASDScene()I

    move-result p1

    .line 790
    invoke-static {p0, p1}, Lcom/android/camera2/compat/MiCameraCompat;->applyASDScene(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 791
    return-void

    .line 786
    :cond_1
    :goto_0
    return-void
.end method

.method static applyAWBLock(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V
    .locals 1

    .line 43
    if-nez p0, :cond_0

    .line 44
    return-void

    .line 46
    :cond_0
    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AWB_LOCK:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 47
    return-void
.end method

.method static applyAWBMode(Landroid/hardware/camera2/CaptureRequest$Builder;I)V
    .locals 1

    .line 50
    if-nez p0, :cond_0

    .line 51
    return-void

    .line 53
    :cond_0
    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AWB_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 54
    return-void
.end method

.method static applyAiSceneDetectEnable(Landroid/hardware/camera2/CaptureRequest$Builder;Lcom/android/camera2/CameraConfigs;)V
    .locals 0

    .line 258
    if-nez p0, :cond_0

    .line 259
    return-void

    .line 261
    :cond_0
    invoke-virtual {p1}, Lcom/android/camera2/CameraConfigs;->isAiSceneDetectEnabled()Z

    move-result p1

    .line 262
    invoke-static {p0, p1}, Lcom/android/camera2/compat/MiCameraCompat;->applyASDEnable(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 263
    return-void
.end method

.method static applyAiSceneDetectPeriod(Landroid/hardware/camera2/CaptureRequest$Builder;Lcom/android/camera2/CameraConfigs;)V
    .locals 0

    .line 266
    if-nez p0, :cond_0

    .line 267
    return-void

    .line 270
    :cond_0
    invoke-virtual {p1}, Lcom/android/camera2/CameraConfigs;->getAiSceneDetectPeriod()I

    move-result p1

    .line 271
    invoke-static {p0, p1}, Lcom/android/camera2/compat/MiCameraCompat;->applyAiScenePeriod(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 272
    return-void
.end method

.method static applyAntiBanding(Landroid/hardware/camera2/CaptureRequest$Builder;Lcom/android/camera2/CameraConfigs;)V
    .locals 1

    .line 89
    if-nez p0, :cond_0

    .line 90
    return-void

    .line 93
    :cond_0
    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_ANTIBANDING_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-virtual {p1}, Lcom/android/camera2/CameraConfigs;->getAntiBanding()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 94
    return-void
.end method

.method static applyAntiShake(Landroid/hardware/camera2/CaptureRequest$Builder;Lcom/android/camera2/CameraCapabilities;Lcom/android/camera2/CameraConfigs;)V
    .locals 5

    .line 317
    if-nez p0, :cond_0

    .line 318
    return-void

    .line 321
    :cond_0
    invoke-virtual {p2}, Lcom/android/camera2/CameraConfigs;->isEISEnabled()Z

    move-result v0

    .line 322
    invoke-virtual {p2}, Lcom/android/camera2/CameraConfigs;->isOISEnabled()Z

    move-result p2

    .line 323
    if-eqz v0, :cond_2

    if-eqz p2, :cond_2

    invoke-static {}, Lcom/android/camera/Util;->isDebugOsBuild()Z

    move-result v1

    if-nez v1, :cond_1

    goto :goto_0

    .line 324
    :cond_1
    new-instance p0, Ljava/lang/RuntimeException;

    const-string p1, "EIS&OIS are both on"

    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 326
    :cond_2
    :goto_0
    sget-object v1, Lcom/android/camera2/CaptureRequestBuilder;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "EIS: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz v0, :cond_3

    const-string v3, "on"

    goto :goto_1

    :cond_3
    const-string v3, "off"

    :goto_1
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 327
    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->CONTROL_VIDEO_STABILIZATION_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 328
    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eqz v0, :cond_4

    .line 329
    nop

    .line 328
    move v4, v3

    goto :goto_2

    .line 330
    :cond_4
    nop

    .line 328
    move v4, v2

    :goto_2
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    .line 327
    invoke-virtual {p0, v1, v4}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 331
    invoke-virtual {p1}, Lcom/android/camera2/CameraCapabilities;->isSupportOIS()Z

    move-result p1

    if-eqz p1, :cond_7

    .line 332
    sget-object p1, Lcom/android/camera2/CaptureRequestBuilder;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "OIS: "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-nez v0, :cond_5

    if-eqz p2, :cond_5

    const-string v4, "on"

    goto :goto_3

    :cond_5
    const-string v4, "off"

    :goto_3
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 333
    sget-object p1, Landroid/hardware/camera2/CaptureRequest;->LENS_OPTICAL_STABILIZATION_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 334
    if-nez v0, :cond_6

    if-eqz p2, :cond_6

    .line 335
    nop

    .line 334
    move v2, v3

    goto :goto_4

    .line 336
    :cond_6
    nop

    .line 334
    :goto_4
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    .line 333
    invoke-virtual {p0, p1, p2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 338
    :cond_7
    return-void
.end method

.method static applyAutoZoomMode(Landroid/hardware/camera2/CaptureRequest$Builder;Lcom/android/camera2/CameraCapabilities;Lcom/android/camera2/CameraConfigs;)V
    .locals 0

    .line 643
    if-nez p0, :cond_0

    .line 644
    return-void

    .line 647
    :cond_0
    invoke-virtual {p2}, Lcom/android/camera2/CameraConfigs;->getAutoZoomMode()I

    move-result p1

    invoke-static {p0, p1}, Lcom/android/camera2/compat/MiCameraCompat;->applyAutoZoomMode(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 648
    return-void
.end method

.method static applyAutoZoomScaleOffset(Landroid/hardware/camera2/CaptureRequest$Builder;Lcom/android/camera2/CameraCapabilities;Lcom/android/camera2/CameraConfigs;)V
    .locals 0

    .line 652
    if-nez p0, :cond_0

    .line 653
    return-void

    .line 656
    :cond_0
    invoke-virtual {p2}, Lcom/android/camera2/CameraConfigs;->getAutoZoomScaleOffset()F

    move-result p1

    invoke-static {p0, p1}, Lcom/android/camera2/compat/MiCameraCompat;->applyAutoZoomScaleOffset(Landroid/hardware/camera2/CaptureRequest$Builder;F)V

    .line 657
    return-void
.end method

.method public static applyBackwardCaptureHint(Lcom/android/camera2/CameraCapabilities;Landroid/hardware/camera2/CaptureRequest$Builder;Z)V
    .locals 2

    .line 795
    if-nez p1, :cond_0

    .line 796
    return-void

    .line 799
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera2/CameraCapabilities;->isBackwardCaptureSupported()Z

    move-result p0

    if-nez p0, :cond_1

    .line 800
    sget-object p0, Lcom/android/camera2/CaptureRequestBuilder;->TAG:Ljava/lang/String;

    const-string p1, "applyBackwardCaptureHint(): unsupported"

    invoke-static {p0, p1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 801
    return-void

    .line 804
    :cond_1
    sget-object p0, Lcom/android/camera2/CaptureRequestBuilder;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "applyBackwardCaptureHint(): "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 805
    invoke-static {p1, p2}, Lcom/android/camera2/compat/MiCameraCompat;->applyBackwardCaptureHint(Landroid/hardware/camera2/CaptureRequest$Builder;B)V

    .line 806
    return-void
.end method

.method static applyBeautyValues(Landroid/hardware/camera2/CaptureRequest$Builder;Lcom/android/camera2/CameraCapabilities;Lcom/android/camera2/CameraConfigs;)V
    .locals 1

    .line 623
    if-nez p0, :cond_0

    .line 624
    return-void

    .line 626
    :cond_0
    invoke-virtual {p1}, Lcom/android/camera2/CameraCapabilities;->isSupportBeauty()Z

    move-result v0

    if-nez v0, :cond_1

    .line 627
    return-void

    .line 629
    :cond_1
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isVideoModule()Z

    move-result v0

    if-nez v0, :cond_2

    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isFunModule()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 630
    :cond_2
    invoke-virtual {p1}, Lcom/android/camera2/CameraCapabilities;->isSupportVideoBeauty()Z

    move-result p1

    if-nez p1, :cond_3

    .line 631
    return-void

    .line 634
    :cond_3
    invoke-virtual {p2}, Lcom/android/camera2/CameraConfigs;->getBeautyValues()Lcom/android/camera/fragment/beauty/BeautyValues;

    move-result-object p1

    if-nez p1, :cond_4

    .line 635
    return-void

    .line 637
    :cond_4
    invoke-virtual {p2}, Lcom/android/camera2/CameraConfigs;->getBeautyValues()Lcom/android/camera/fragment/beauty/BeautyValues;

    move-result-object p1

    invoke-static {p0, p1}, Lcom/android/camera2/compat/MiCameraCompat;->applyBeautyParameter(Landroid/hardware/camera2/CaptureRequest$Builder;Lcom/android/camera/fragment/beauty/BeautyValues;)V

    .line 638
    return-void
.end method

.method static applyBokeh(Landroid/hardware/camera2/CaptureRequest$Builder;Lcom/android/camera2/CameraCapabilities;Lcom/android/camera2/CameraConfigs;)V
    .locals 0

    .line 440
    if-nez p0, :cond_0

    .line 441
    return-void

    .line 444
    :cond_0
    invoke-virtual {p1}, Lcom/android/camera2/CameraCapabilities;->isSupportBokeh()Z

    move-result p1

    if-nez p1, :cond_1

    .line 445
    return-void

    .line 448
    :cond_1
    invoke-virtual {p2}, Lcom/android/camera2/CameraConfigs;->isBokehEnabled()Z

    move-result p1

    invoke-static {p0, p1}, Lcom/android/camera2/compat/MiCameraCompat;->applyBokehEnable(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 449
    return-void
.end method

.method static applyCameraAi30Enable(Landroid/hardware/camera2/CaptureRequest$Builder;Lcom/android/camera2/CameraCapabilities;Lcom/android/camera2/CameraConfigs;)V
    .locals 0

    .line 234
    if-nez p0, :cond_0

    .line 235
    return-void

    .line 237
    :cond_0
    invoke-virtual {p1}, Lcom/android/camera2/CameraCapabilities;->isSupportCameraAi30()Z

    move-result p1

    if-nez p1, :cond_1

    .line 238
    return-void

    .line 240
    :cond_1
    invoke-virtual {p2}, Lcom/android/camera2/CameraConfigs;->isCameraAi30Enabled()Z

    move-result p1

    .line 241
    invoke-static {p0, p1}, Lcom/android/camera2/compat/MiCameraCompat;->applyCameraAi30Enable(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 242
    return-void
.end method

.method static applyColorEffect(Landroid/hardware/camera2/CaptureRequest$Builder;Lcom/android/camera2/CameraConfigs;)V
    .locals 1

    .line 100
    if-nez p0, :cond_0

    .line 101
    return-void

    .line 103
    :cond_0
    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->CONTROL_EFFECT_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-virtual {p1}, Lcom/android/camera2/CameraConfigs;->getColorEffect()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 104
    return-void
.end method

.method static applyContrast(Landroid/hardware/camera2/CaptureRequest$Builder;Lcom/android/camera2/CameraCapabilities;Lcom/android/camera2/CameraConfigs;)V
    .locals 0

    .line 190
    if-nez p0, :cond_0

    .line 191
    return-void

    .line 194
    :cond_0
    invoke-virtual {p1}, Lcom/android/camera2/CameraCapabilities;->isSupportContrast()Z

    move-result p1

    if-nez p1, :cond_1

    .line 195
    return-void

    .line 198
    :cond_1
    invoke-virtual {p2}, Lcom/android/camera2/CameraConfigs;->getContrastLevel()I

    move-result p1

    .line 199
    invoke-static {p0, p1}, Lcom/android/camera2/compat/MiCameraCompat;->applyContrast(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 200
    return-void
.end method

.method static applyCustomAWB(Landroid/hardware/camera2/CaptureRequest$Builder;I)V
    .locals 0

    .line 57
    invoke-static {p0, p1}, Lcom/android/camera2/compat/MiCameraCompat;->applyCustomAWB(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 58
    return-void
.end method

.method static applyDepurpleEnable(Landroid/hardware/camera2/CaptureRequest$Builder;Lcom/android/camera2/CameraCapabilities;Z)V
    .locals 3

    .line 246
    if-nez p0, :cond_0

    .line 247
    return-void

    .line 249
    :cond_0
    sget-object v0, Lcom/android/camera2/CaptureRequestBuilder;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "applyDepurpleEnable: isSupport = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/android/camera2/CameraCapabilities;->isSupportDepurple()Z

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v2, ", enadled = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 251
    invoke-virtual {p1}, Lcom/android/camera2/CameraCapabilities;->isSupportDepurple()Z

    move-result p1

    if-nez p1, :cond_1

    .line 252
    return-void

    .line 254
    :cond_1
    invoke-static {p0, p2}, Lcom/android/camera2/compat/MiCameraCompat;->applyDepurpleEnable(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 255
    return-void
.end method

.method static applyDeviceOrientation(Landroid/hardware/camera2/CaptureRequest$Builder;Lcom/android/camera2/CameraCapabilities;Lcom/android/camera2/CameraConfigs;)V
    .locals 2

    .line 560
    if-eqz p0, :cond_1

    invoke-virtual {p1}, Lcom/android/camera2/CameraCapabilities;->isSupportDeviceOrientation()Z

    move-result p1

    if-nez p1, :cond_0

    goto :goto_0

    .line 563
    :cond_0
    sget-object p1, Lcom/android/camera2/CaptureRequestBuilder;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "applyDeviceOrientation: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Lcom/android/camera2/CameraConfigs;->getDeviceOrientation()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 564
    invoke-virtual {p2}, Lcom/android/camera2/CameraConfigs;->getDeviceOrientation()I

    move-result p1

    invoke-static {p0, p1}, Lcom/android/camera2/compat/MiCameraCompat;->applyDeviceOrientation(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 565
    return-void

    .line 561
    :cond_1
    :goto_0
    return-void
.end method

.method static applyExposureCompensation(Landroid/hardware/camera2/CaptureRequest$Builder;ILcom/android/camera2/CameraCapabilities;Lcom/android/camera2/CameraConfigs;)V
    .locals 5

    .line 742
    if-nez p0, :cond_0

    .line 743
    return-void

    .line 745
    :cond_0
    invoke-virtual {p3}, Lcom/android/camera2/CameraConfigs;->getExposureCompensationIndex()I

    move-result v0

    .line 746
    invoke-static {}, Lcom/mi/config/b;->hU()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 747
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isManualModule()Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v1, 0x1

    if-ne p1, v1, :cond_1

    .line 749
    invoke-virtual {p3}, Lcom/android/camera2/CameraConfigs;->getISO()I

    move-result p1

    if-nez p1, :cond_1

    .line 750
    invoke-virtual {p3}, Lcom/android/camera2/CameraConfigs;->getExposureTime()J

    move-result-wide v1

    const-wide/32 v3, 0x7735940

    cmp-long p1, v1, v3

    if-lez p1, :cond_1

    .line 751
    invoke-virtual {p3}, Lcom/android/camera2/CameraConfigs;->getExposureTime()J

    move-result-wide v0

    long-to-double v0, v0

    const-wide v2, 0x419dcd6500000000L    # 1.25E8

    div-double/2addr v0, v2

    double-to-float p1, v0

    .line 752
    float-to-double v0, p1

    invoke-static {v0, v1}, Ljava/lang/Math;->log(D)D

    move-result-wide v0

    const-wide/high16 v2, 0x4000000000000000L    # 2.0

    invoke-static {v2, v3}, Ljava/lang/Math;->log(D)D

    move-result-wide v2

    div-double/2addr v0, v2

    .line 753
    sget-object p1, Lcom/android/camera2/CaptureRequestBuilder;->TAG:Ljava/lang/String;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "applyExposureCompensation: EV = "

    invoke-virtual {p3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, v0, v1}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-static {p1, p3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 754
    invoke-virtual {p2}, Lcom/android/camera2/CameraCapabilities;->getExposureCompensationRational()Landroid/util/Rational;

    move-result-object p1

    .line 755
    invoke-virtual {p1}, Landroid/util/Rational;->getDenominator()I

    move-result p3

    int-to-double v2, p3

    mul-double/2addr v0, v2

    invoke-virtual {p1}, Landroid/util/Rational;->getNumerator()I

    move-result p1

    int-to-double v2, p1

    div-double/2addr v0, v2

    double-to-int p1, v0

    .line 756
    invoke-virtual {p2}, Lcom/android/camera2/CameraCapabilities;->getMaxExposureCompensation()I

    move-result p2

    invoke-static {p1, p2}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 759
    :cond_1
    sget-object p1, Lcom/android/camera2/CaptureRequestBuilder;->TAG:Ljava/lang/String;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "applyExposureCompensation: "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 760
    sget-object p1, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_EXPOSURE_COMPENSATION:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 761
    return-void
.end method

.method static applyExposureMeteringMode(Landroid/hardware/camera2/CaptureRequest$Builder;Lcom/android/camera2/CameraConfigs;)V
    .locals 0

    .line 225
    if-nez p0, :cond_0

    .line 226
    return-void

    .line 228
    :cond_0
    invoke-virtual {p1}, Lcom/android/camera2/CameraConfigs;->getExposureMeteringMode()I

    move-result p1

    .line 229
    invoke-static {p0, p1}, Lcom/android/camera2/compat/MiCameraCompat;->applyExposureMeteringMode(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 230
    return-void
.end method

.method static applyExposureTime(Landroid/hardware/camera2/CaptureRequest$Builder;ILcom/android/camera2/CameraConfigs;)V
    .locals 4

    .line 172
    if-nez p0, :cond_0

    .line 173
    return-void

    .line 176
    :cond_0
    invoke-virtual {p2}, Lcom/android/camera2/CameraConfigs;->getExposureTime()J

    move-result-wide v0

    .line 178
    invoke-static {}, Lcom/mi/config/b;->hU()Z

    move-result p2

    if-eqz p2, :cond_1

    const/4 p2, 0x1

    if-ne p1, p2, :cond_1

    .line 179
    const-wide/32 v2, 0x7735940

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v0

    .line 181
    :cond_1
    invoke-static {}, Lcom/mi/config/b;->hU()Z

    move-result p2

    if-nez p2, :cond_2

    const/4 p2, 0x3

    if-ne p1, p2, :cond_3

    .line 182
    :cond_2
    sget-object p1, Lcom/android/camera2/CaptureRequestBuilder;->TAG:Ljava/lang/String;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "applyExposureTime: "

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 183
    invoke-static {p0, v0, v1}, Lcom/android/camera2/compat/MiCameraCompat;->applyExposureTime(Landroid/hardware/camera2/CaptureRequest$Builder;J)V

    .line 185
    :cond_3
    return-void
.end method

.method static applyEyeLight(Landroid/hardware/camera2/CaptureRequest$Builder;Lcom/android/camera2/CameraCapabilities;Lcom/android/camera2/CameraConfigs;)V
    .locals 0

    .line 683
    if-nez p0, :cond_0

    .line 684
    return-void

    .line 686
    :cond_0
    invoke-virtual {p1}, Lcom/android/camera2/CameraCapabilities;->isSupportEyeLight()Z

    move-result p1

    if-nez p1, :cond_1

    .line 687
    return-void

    .line 689
    :cond_1
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object p1

    invoke-virtual {p1}, Lcom/mi/config/a;->ft()Z

    move-result p1

    if-nez p1, :cond_2

    .line 690
    return-void

    .line 692
    :cond_2
    invoke-virtual {p2}, Lcom/android/camera2/CameraConfigs;->getEyeLightType()I

    move-result p1

    .line 693
    if-gez p1, :cond_3

    .line 694
    const/4 p1, 0x0

    invoke-static {p0, p1, p1}, Lcom/android/camera2/compat/MiCameraCompat;->applyEyeLight(Landroid/hardware/camera2/CaptureRequest$Builder;II)V

    goto :goto_0

    .line 696
    :cond_3
    const/16 p2, 0x64

    invoke-static {p0, p1, p2}, Lcom/android/camera2/compat/MiCameraCompat;->applyEyeLight(Landroid/hardware/camera2/CaptureRequest$Builder;II)V

    .line 698
    :goto_0
    return-void
.end method

.method static applyFNumber(Landroid/hardware/camera2/CaptureRequest$Builder;Lcom/android/camera2/CameraCapabilities;Lcom/android/camera2/CameraConfigs;)V
    .locals 0

    .line 664
    if-nez p0, :cond_0

    .line 665
    return-void

    .line 667
    :cond_0
    invoke-virtual {p1}, Lcom/android/camera2/CameraCapabilities;->isSupportBokehAdjust()Z

    move-result p1

    if-nez p1, :cond_1

    .line 668
    sget-object p0, Lcom/android/camera2/CaptureRequestBuilder;->TAG:Ljava/lang/String;

    const-string p1, "set f number on unsupported devices"

    invoke-static {p0, p1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 669
    return-void

    .line 671
    :cond_1
    invoke-virtual {p2}, Lcom/android/camera2/CameraConfigs;->getFNumber()Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_2

    .line 672
    return-void

    .line 675
    :cond_2
    invoke-virtual {p2}, Lcom/android/camera2/CameraConfigs;->getFNumber()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Lcom/android/camera2/compat/MiCameraCompat;->applyFNumber(Landroid/hardware/camera2/CaptureRequest$Builder;Ljava/lang/String;)V

    .line 676
    return-void
.end method

.method static applyFaceAgeAnalyze(Landroid/hardware/camera2/CaptureRequest$Builder;Lcom/android/camera2/CameraCapabilities;Lcom/android/camera2/CameraConfigs;)V
    .locals 0

    .line 487
    if-nez p0, :cond_0

    .line 488
    return-void

    .line 491
    :cond_0
    invoke-virtual {p1}, Lcom/android/camera2/CameraCapabilities;->isSupportFaceAgeAnalyze()Z

    move-result p1

    if-nez p1, :cond_1

    .line 492
    return-void

    .line 495
    :cond_1
    invoke-virtual {p2}, Lcom/android/camera2/CameraConfigs;->isFaceAgeAnalyzeEnabled()Z

    move-result p1

    invoke-static {p0, p1}, Lcom/android/camera2/compat/MiCameraCompat;->applyFaceAgeAnalyzeEnable(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 496
    return-void
.end method

.method static applyFaceDetection(Landroid/hardware/camera2/CaptureRequest$Builder;Lcom/android/camera2/CameraConfigs;)V
    .locals 1

    .line 109
    if-nez p0, :cond_0

    .line 110
    return-void

    .line 112
    :cond_0
    invoke-virtual {p1}, Lcom/android/camera2/CameraConfigs;->isFaceDetectionEnabled()Z

    move-result p1

    if-eqz p1, :cond_1

    .line 113
    const/4 p1, 0x2

    goto :goto_0

    .line 114
    :cond_1
    const/4 p1, 0x0

    .line 115
    :goto_0
    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->STATISTICS_FACE_DETECT_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 116
    return-void
.end method

.method static applyFaceScore(Landroid/hardware/camera2/CaptureRequest$Builder;Lcom/android/camera2/CameraCapabilities;Lcom/android/camera2/CameraConfigs;)V
    .locals 0

    .line 502
    if-nez p0, :cond_0

    .line 503
    return-void

    .line 506
    :cond_0
    invoke-virtual {p1}, Lcom/android/camera2/CameraCapabilities;->isSupportFaceScore()Z

    move-result p1

    if-nez p1, :cond_1

    .line 507
    return-void

    .line 510
    :cond_1
    invoke-virtual {p2}, Lcom/android/camera2/CameraConfigs;->isFaceScoreEnabled()Z

    move-result p1

    invoke-static {p0, p1}, Lcom/android/camera2/compat/MiCameraCompat;->applyFaceScoreEnable(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 511
    return-void
.end method

.method static applyFocusDistance(Landroid/hardware/camera2/CaptureRequest$Builder;Lcom/android/camera2/CameraConfigs;)V
    .locals 1

    .line 132
    if-nez p0, :cond_0

    .line 133
    return-void

    .line 135
    :cond_0
    invoke-virtual {p1}, Lcom/android/camera2/CameraConfigs;->getFocusMode()I

    move-result v0

    if-eqz v0, :cond_1

    .line 136
    return-void

    .line 138
    :cond_1
    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->LENS_FOCUS_DISTANCE:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-virtual {p1}, Lcom/android/camera2/CameraConfigs;->getFocusDistance()F

    move-result p1

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 139
    return-void
.end method

.method static applyFocusMode(Landroid/hardware/camera2/CaptureRequest$Builder;Lcom/android/camera2/CameraConfigs;)V
    .locals 2

    .line 123
    if-nez p0, :cond_0

    .line 124
    return-void

    .line 126
    :cond_0
    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-virtual {p1}, Lcom/android/camera2/CameraConfigs;->getFocusMode()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 127
    invoke-static {p0, p1}, Lcom/android/camera2/CaptureRequestBuilder;->applyAFRegions(Landroid/hardware/camera2/CaptureRequest$Builder;Lcom/android/camera2/CameraConfigs;)V

    .line 128
    invoke-static {p0, p1}, Lcom/android/camera2/CaptureRequestBuilder;->applyAERegions(Landroid/hardware/camera2/CaptureRequest$Builder;Lcom/android/camera2/CameraConfigs;)V

    .line 129
    return-void
.end method

.method static applyFpsRange(Landroid/hardware/camera2/CaptureRequest$Builder;Lcom/android/camera2/CameraConfigs;)V
    .locals 3

    .line 142
    if-nez p0, :cond_0

    .line 143
    return-void

    .line 145
    :cond_0
    invoke-virtual {p1}, Lcom/android/camera2/CameraConfigs;->getPreviewFpsRange()Landroid/util/Range;

    move-result-object p1

    .line 146
    sget-object v0, Lcom/android/camera2/CaptureRequestBuilder;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "applyFpsRange: fpsRange = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 147
    if-nez p1, :cond_1

    .line 148
    return-void

    .line 151
    :cond_1
    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_TARGET_FPS_RANGE:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-virtual {p0, v0, p1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 152
    return-void
.end method

.method static applyFrontMirror(Landroid/hardware/camera2/CaptureRequest$Builder;ILcom/android/camera2/CameraCapabilities;Lcom/android/camera2/CameraConfigs;)V
    .locals 0

    .line 571
    if-nez p0, :cond_0

    .line 572
    return-void

    .line 574
    :cond_0
    invoke-virtual {p2}, Lcom/android/camera2/CameraCapabilities;->isSupportFrontMirror()Z

    move-result p2

    if-nez p2, :cond_1

    .line 575
    return-void

    .line 577
    :cond_1
    const/4 p2, 0x3

    if-eq p1, p2, :cond_2

    .line 578
    return-void

    .line 581
    :cond_2
    invoke-virtual {p3}, Lcom/android/camera2/CameraConfigs;->isFrontMirror()Z

    move-result p1

    invoke-static {p0, p1}, Lcom/android/camera2/compat/MiCameraCompat;->applyFrontMirror(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 582
    return-void
.end method

.method static applyHDR(Landroid/hardware/camera2/CaptureRequest$Builder;ILcom/android/camera2/CameraCapabilities;Lcom/android/camera2/CameraConfigs;)V
    .locals 0

    .line 359
    if-nez p0, :cond_0

    .line 360
    return-void

    .line 363
    :cond_0
    invoke-virtual {p2}, Lcom/android/camera2/CameraCapabilities;->isSupportHdr()Z

    move-result p2

    if-nez p2, :cond_1

    .line 364
    return-void

    .line 367
    :cond_1
    const/4 p2, 0x3

    if-eq p1, p2, :cond_2

    .line 369
    const/4 p1, 0x0

    invoke-static {p0, p1}, Lcom/android/camera2/compat/MiCameraCompat;->applyHDR(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 370
    return-void

    .line 373
    :cond_2
    invoke-virtual {p3}, Lcom/android/camera2/CameraConfigs;->isHDREnabled()Z

    move-result p1

    invoke-static {p0, p1}, Lcom/android/camera2/compat/MiCameraCompat;->applyHDR(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 374
    return-void
.end method

.method static applyHDRCheckerEnable(Landroid/hardware/camera2/CaptureRequest$Builder;ILcom/android/camera2/CameraCapabilities;Lcom/android/camera2/CameraConfigs;)V
    .locals 1

    .line 380
    if-eqz p0, :cond_1

    const/4 v0, 0x1

    if-ne p1, v0, :cond_1

    .line 382
    invoke-virtual {p2}, Lcom/android/camera2/CameraCapabilities;->isSupportAutoHdr()Z

    move-result p1

    if-nez p1, :cond_0

    goto :goto_0

    .line 385
    :cond_0
    invoke-virtual {p3}, Lcom/android/camera2/CameraConfigs;->isHDRCheckerEnabled()Z

    move-result p1

    invoke-static {p0, p1}, Lcom/android/camera2/compat/MiCameraCompat;->applyHDRCheckerEnable(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 386
    return-void

    .line 383
    :cond_1
    :goto_0
    return-void
.end method

.method static applyHHT(Landroid/hardware/camera2/CaptureRequest$Builder;ILcom/android/camera2/CameraCapabilities;Lcom/android/camera2/CameraConfigs;)V
    .locals 1

    .line 342
    if-nez p0, :cond_0

    .line 343
    return-void

    .line 346
    :cond_0
    const/4 v0, 0x3

    if-eq p1, v0, :cond_1

    .line 347
    return-void

    .line 350
    :cond_1
    invoke-virtual {p2}, Lcom/android/camera2/CameraCapabilities;->isSupportHHT()Z

    move-result p1

    if-nez p1, :cond_2

    .line 351
    return-void

    .line 354
    :cond_2
    invoke-virtual {p3}, Lcom/android/camera2/CameraConfigs;->isHHTEnabled()Z

    move-result p1

    invoke-static {p0, p1}, Lcom/android/camera2/compat/MiCameraCompat;->applyHHT(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 355
    return-void
.end method

.method static applyHwMfnr(Landroid/hardware/camera2/CaptureRequest$Builder;ILcom/android/camera2/CameraCapabilities;Lcom/android/camera2/CameraConfigs;)V
    .locals 1

    .line 393
    if-nez p0, :cond_0

    .line 394
    return-void

    .line 397
    :cond_0
    invoke-virtual {p2}, Lcom/android/camera2/CameraCapabilities;->isSupportMfnr()Z

    move-result p2

    if-nez p2, :cond_1

    .line 398
    return-void

    .line 401
    :cond_1
    const/4 p2, 0x3

    if-eq p1, p2, :cond_2

    .line 404
    const/4 p1, 0x0

    invoke-static {p0, p1}, Lcom/android/camera2/compat/MiCameraCompat;->applyMfnrEnable(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 405
    return-void

    .line 408
    :cond_2
    sget-object p1, Lcom/android/camera2/CaptureRequestBuilder;->TAG:Ljava/lang/String;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "applyMfnrEnable: "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Lcom/android/camera2/CameraConfigs;->isMfnrEnabled()Z

    move-result v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 409
    invoke-virtual {p3}, Lcom/android/camera2/CameraConfigs;->isMfnrEnabled()Z

    move-result p1

    invoke-static {p0, p1}, Lcom/android/camera2/compat/MiCameraCompat;->applyMfnrEnable(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 410
    return-void
.end method

.method static applyIso(Landroid/hardware/camera2/CaptureRequest$Builder;ILcom/android/camera2/CameraCapabilities;Lcom/android/camera2/CameraConfigs;)V
    .locals 5

    .line 603
    if-nez p0, :cond_0

    .line 604
    return-void

    .line 606
    :cond_0
    invoke-virtual {p3}, Lcom/android/camera2/CameraConfigs;->getISO()I

    move-result v0

    .line 607
    invoke-static {}, Lcom/mi/config/b;->hU()Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v1, 0x1

    if-ne p1, v1, :cond_1

    .line 608
    if-lez v0, :cond_1

    invoke-virtual {p3}, Lcom/android/camera2/CameraConfigs;->getExposureTime()J

    move-result-wide v1

    const-wide/32 v3, 0x7735940

    cmp-long p1, v1, v3

    if-lez p1, :cond_1

    .line 609
    invoke-virtual {p3}, Lcom/android/camera2/CameraConfigs;->getExposureTime()J

    move-result-wide v1

    long-to-double v1, v1

    const-wide v3, 0x419dcd6500000000L    # 1.25E8

    div-double/2addr v1, v3

    double-to-float p1, v1

    .line 610
    int-to-float p3, v0

    mul-float/2addr p3, p1

    float-to-int p1, p3

    .line 611
    invoke-virtual {p2}, Lcom/android/camera2/CameraCapabilities;->getMaxIso()I

    move-result p2

    invoke-static {p1, p2}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 614
    :cond_1
    sget-object p1, Lcom/android/camera2/CaptureRequestBuilder;->TAG:Ljava/lang/String;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "applyIso: "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 615
    invoke-static {p0, v0}, Lcom/android/camera2/compat/MiCameraCompat;->applyISO(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 616
    return-void
.end method

.method static applyLensDirtyDetect(Landroid/hardware/camera2/CaptureRequest$Builder;Lcom/android/camera2/CameraCapabilities;Lcom/android/camera2/CameraConfigs;)V
    .locals 0

    .line 454
    if-nez p0, :cond_0

    .line 455
    return-void

    .line 458
    :cond_0
    invoke-virtual {p1}, Lcom/android/camera2/CameraCapabilities;->isSupportLensDirtyDetect()Z

    move-result p1

    if-nez p1, :cond_1

    .line 459
    return-void

    .line 462
    :cond_1
    invoke-virtual {p2}, Lcom/android/camera2/CameraConfigs;->isLensDirtyDetectEnabled()Z

    move-result p1

    invoke-static {p0, p1}, Lcom/android/camera2/compat/MiCameraCompat;->applyLensDirtyDetect(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 463
    return-void
.end method

.method private applyNoiseReduction(Landroid/hardware/camera2/CaptureRequest$Builder;)V
    .locals 2

    .line 777
    if-nez p1, :cond_0

    .line 778
    return-void

    .line 780
    :cond_0
    const/4 v0, 0x2

    .line 781
    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->NOISE_REDUCTION_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p1, v1, v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 782
    return-void
.end method

.method static applyNormalWideLDC(Landroid/hardware/camera2/CaptureRequest$Builder;ILcom/android/camera2/CameraCapabilities;Lcom/android/camera2/CameraConfigs;)V
    .locals 0

    .line 707
    if-nez p0, :cond_0

    .line 708
    return-void

    .line 710
    :cond_0
    invoke-virtual {p2}, Lcom/android/camera2/CameraCapabilities;->isSupportNormalWideLDC()Z

    move-result p2

    if-nez p2, :cond_1

    .line 711
    return-void

    .line 713
    :cond_1
    invoke-virtual {p3}, Lcom/android/camera2/CameraConfigs;->getNormalWideLDCEnabled()Z

    move-result p2

    .line 715
    const/4 p3, 0x4

    if-ne p1, p3, :cond_2

    .line 716
    const/4 p2, 0x0

    .line 718
    :cond_2
    invoke-static {p0, p2}, Lcom/android/camera2/compat/MiCameraCompat;->applyNormalWideLDC(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 719
    return-void
.end method

.method static applyPortraitLighting(Landroid/hardware/camera2/CaptureRequest$Builder;ILcom/android/camera2/CameraCapabilities;Lcom/android/camera2/CameraConfigs;)V
    .locals 1

    .line 469
    if-nez p0, :cond_0

    .line 470
    return-void

    .line 473
    :cond_0
    const/4 v0, 0x3

    if-eq p1, v0, :cond_1

    .line 474
    return-void

    .line 477
    :cond_1
    invoke-virtual {p2}, Lcom/android/camera2/CameraCapabilities;->isSupportPortraitLighting()Z

    move-result p1

    if-nez p1, :cond_2

    .line 478
    return-void

    .line 480
    :cond_2
    invoke-virtual {p3}, Lcom/android/camera2/CameraConfigs;->getPortraitLightingPattern()I

    move-result p1

    invoke-static {p0, p1}, Lcom/android/camera2/compat/MiCameraCompat;->applyPortraitLighting(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 481
    return-void
.end method

.method static applySaturation(Landroid/hardware/camera2/CaptureRequest$Builder;Lcom/android/camera2/CameraConfigs;)V
    .locals 0

    .line 206
    if-nez p0, :cond_0

    .line 207
    return-void

    .line 209
    :cond_0
    invoke-virtual {p1}, Lcom/android/camera2/CameraConfigs;->getSaturationLevel()I

    move-result p1

    .line 210
    invoke-static {p0, p1}, Lcom/android/camera2/compat/MiCameraCompat;->applySaturation(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 211
    return-void
.end method

.method static applySceneMode(Landroid/hardware/camera2/CaptureRequest$Builder;Lcom/android/camera2/CameraConfigs;)V
    .locals 1

    .line 275
    if-nez p0, :cond_0

    .line 276
    return-void

    .line 278
    :cond_0
    invoke-virtual {p1}, Lcom/android/camera2/CameraConfigs;->getSceneMode()I

    move-result p1

    .line 279
    if-eqz p1, :cond_1

    .line 280
    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->CONTROL_SCENE_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 281
    sget-object p1, Landroid/hardware/camera2/CaptureRequest;->CONTROL_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    const/4 v0, 0x2

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    goto :goto_0

    .line 283
    :cond_1
    sget-object p1, Landroid/hardware/camera2/CaptureRequest;->CONTROL_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 285
    :goto_0
    return-void
.end method

.method static applySharpness(Landroid/hardware/camera2/CaptureRequest$Builder;Lcom/android/camera2/CameraConfigs;)V
    .locals 0

    .line 217
    if-nez p0, :cond_0

    .line 218
    return-void

    .line 220
    :cond_0
    invoke-virtual {p1}, Lcom/android/camera2/CameraConfigs;->getSharpnessLevel()I

    move-result p1

    .line 221
    invoke-static {p0, p1}, Lcom/android/camera2/compat/MiCameraCompat;->applySharpness(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 222
    return-void
.end method

.method static applySuperNightScene(Landroid/hardware/camera2/CaptureRequest$Builder;I)V
    .locals 1

    .line 765
    if-nez p0, :cond_0

    .line 766
    return-void

    .line 769
    :cond_0
    const/4 v0, 0x3

    if-eq p1, v0, :cond_1

    .line 770
    return-void

    .line 772
    :cond_1
    sget-object p1, Lcom/android/camera2/CaptureRequestBuilder;->TAG:Ljava/lang/String;

    const-string v0, "applySuperNightScene: true"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 773
    const/4 p1, 0x1

    invoke-static {p0, p1}, Lcom/android/camera2/compat/MiCameraCompat;->applySuperNightScene(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 774
    return-void
.end method

.method static applySuperResolution(Landroid/hardware/camera2/CaptureRequest$Builder;ILcom/android/camera2/CameraCapabilities;Lcom/android/camera2/CameraConfigs;)V
    .locals 1

    .line 517
    if-eqz p0, :cond_2

    invoke-virtual {p2}, Lcom/android/camera2/CameraCapabilities;->isSupportSuperResolution()Z

    move-result p2

    if-nez p2, :cond_0

    goto :goto_0

    .line 521
    :cond_0
    const/4 p2, 0x3

    if-eq p1, p2, :cond_1

    .line 523
    const/4 p1, 0x0

    invoke-static {p0, p1}, Lcom/android/camera2/compat/MiCameraCompat;->applySuperResolution(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 524
    return-void

    .line 527
    :cond_1
    sget-object p1, Lcom/android/camera2/CaptureRequestBuilder;->TAG:Ljava/lang/String;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "applySuperResolution: "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Lcom/android/camera2/CameraConfigs;->isSuperResolutionEnabled()Z

    move-result v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 528
    invoke-virtual {p3}, Lcom/android/camera2/CameraConfigs;->isSuperResolutionEnabled()Z

    move-result p1

    invoke-static {p0, p1}, Lcom/android/camera2/compat/MiCameraCompat;->applySuperResolution(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 529
    return-void

    .line 518
    :cond_2
    :goto_0
    return-void
.end method

.method static applySwMfnr(Landroid/hardware/camera2/CaptureRequest$Builder;ILcom/android/camera2/CameraCapabilities;Lcom/android/camera2/CameraConfigs;)V
    .locals 1

    .line 417
    if-nez p0, :cond_0

    .line 418
    return-void

    .line 421
    :cond_0
    invoke-virtual {p2}, Lcom/android/camera2/CameraCapabilities;->isSupportSwMfnr()Z

    move-result p2

    if-nez p2, :cond_1

    .line 422
    return-void

    .line 425
    :cond_1
    const/4 p2, 0x3

    if-eq p1, p2, :cond_2

    .line 428
    const/4 p1, 0x0

    invoke-static {p0, p1}, Lcom/android/camera2/compat/MiCameraCompat;->applySwMfnrEnable(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 429
    return-void

    .line 432
    :cond_2
    sget-object p1, Lcom/android/camera2/CaptureRequestBuilder;->TAG:Ljava/lang/String;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "applySwMfnrEnable: "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Lcom/android/camera2/CameraConfigs;->isSwMfnrEnabled()Z

    move-result v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 433
    invoke-virtual {p3}, Lcom/android/camera2/CameraConfigs;->isSwMfnrEnabled()Z

    move-result p1

    invoke-static {p0, p1}, Lcom/android/camera2/compat/MiCameraCompat;->applySwMfnrEnable(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 434
    return-void
.end method

.method static applyUltraWideLDC(Landroid/hardware/camera2/CaptureRequest$Builder;Lcom/android/camera2/CameraCapabilities;Lcom/android/camera2/CameraConfigs;)V
    .locals 0

    .line 724
    if-nez p0, :cond_0

    .line 725
    return-void

    .line 727
    :cond_0
    invoke-virtual {p1}, Lcom/android/camera2/CameraCapabilities;->isSupportUltraWideLDC()Z

    move-result p1

    if-nez p1, :cond_1

    .line 728
    return-void

    .line 731
    :cond_1
    invoke-virtual {p2}, Lcom/android/camera2/CameraConfigs;->getUltraWideLDCEnabled()Z

    move-result p1

    .line 732
    invoke-static {p0, p1}, Lcom/android/camera2/compat/MiCameraCompat;->applyUltraWideLDC(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 733
    return-void
.end method

.method static applyVideoFlash(Landroid/hardware/camera2/CaptureRequest$Builder;Lcom/android/camera2/CameraConfigs;)V
    .locals 2

    .line 585
    if-nez p0, :cond_0

    .line 586
    return-void

    .line 588
    :cond_0
    invoke-virtual {p1}, Lcom/android/camera2/CameraConfigs;->getFlashMode()I

    move-result p1

    const/4 v0, 0x0

    const/4 v1, 0x2

    if-ne v1, p1, :cond_1

    const/4 p1, 0x1

    goto :goto_0

    .line 589
    :cond_1
    move p1, v0

    :goto_0
    if-eqz p1, :cond_2

    .line 590
    sget-object p1, Landroid/hardware/camera2/CaptureRequest;->FLASH_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    goto :goto_1

    .line 592
    :cond_2
    sget-object p1, Landroid/hardware/camera2/CaptureRequest;->FLASH_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 594
    :goto_1
    return-void
.end method

.method static applyVideoFpsRange(Landroid/hardware/camera2/CaptureRequest$Builder;Lcom/android/camera2/CameraConfigs;)V
    .locals 3

    .line 155
    if-nez p0, :cond_0

    .line 156
    return-void

    .line 158
    :cond_0
    invoke-virtual {p1}, Lcom/android/camera2/CameraConfigs;->getVideoFpsRange()Landroid/util/Range;

    move-result-object p1

    .line 159
    sget-object v0, Lcom/android/camera2/CaptureRequestBuilder;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "applyVideoFpsRange: fpsRange = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 160
    if-nez p1, :cond_1

    .line 161
    return-void

    .line 163
    :cond_1
    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_TARGET_FPS_RANGE:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-virtual {p0, v0, p1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 164
    return-void
.end method

.method static applyWaterMark(Landroid/hardware/camera2/CaptureRequest$Builder;ILcom/android/camera2/CameraCapabilities;Lcom/android/camera2/CameraConfigs;)V
    .locals 2

    .line 535
    if-nez p0, :cond_0

    .line 536
    return-void

    .line 539
    :cond_0
    const/4 v0, 0x3

    if-eq p1, v0, :cond_1

    .line 540
    return-void

    .line 543
    :cond_1
    invoke-virtual {p2}, Lcom/android/camera2/CameraCapabilities;->isSupportWatermark()Z

    move-result p1

    if-nez p1, :cond_2

    .line 544
    return-void

    .line 547
    :cond_2
    const-string p1, ","

    invoke-virtual {p3}, Lcom/android/camera2/CameraConfigs;->getWaterMarkAppliedList()Ljava/util/List;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/android/camera/Util;->join(Ljava/lang/String;Ljava/util/List;)Ljava/lang/String;

    move-result-object p1

    .line 548
    sget-object p2, Lcom/android/camera2/CaptureRequestBuilder;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "applyWaterMark appliedList:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p2, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 549
    invoke-static {p0, p1}, Lcom/android/camera2/compat/MiCameraCompat;->applyWaterMarkAppliedList(Landroid/hardware/camera2/CaptureRequest$Builder;Ljava/lang/String;)V

    .line 550
    const-string p2, "watermark"

    invoke-virtual {p1, p2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p2

    if-eqz p2, :cond_3

    .line 551
    invoke-virtual {p3}, Lcom/android/camera2/CameraConfigs;->getTimeWaterMarkValue()Ljava/lang/String;

    move-result-object p2

    invoke-static {p0, p2}, Lcom/android/camera2/compat/MiCameraCompat;->applyTimeWaterMark(Landroid/hardware/camera2/CaptureRequest$Builder;Ljava/lang/String;)V

    .line 553
    :cond_3
    const-string p2, "beautify"

    invoke-virtual {p1, p2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_4

    .line 554
    invoke-virtual {p3}, Lcom/android/camera2/CameraConfigs;->getFaceWaterMarkFormat()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Lcom/android/camera2/compat/MiCameraCompat;->applyFaceWaterMark(Landroid/hardware/camera2/CaptureRequest$Builder;Ljava/lang/String;)V

    .line 556
    :cond_4
    return-void
.end method

.method static applyZoomRatio(Landroid/hardware/camera2/CaptureRequest$Builder;Lcom/android/camera2/CameraCapabilities;Lcom/android/camera2/CameraConfigs;)V
    .locals 5

    .line 289
    if-nez p0, :cond_0

    .line 290
    return-void

    .line 292
    :cond_0
    invoke-virtual {p2}, Lcom/android/camera2/CameraConfigs;->getZoomRatio()F

    move-result p2

    .line 293
    invoke-virtual {p1}, Lcom/android/camera2/CameraCapabilities;->getActiveArraySize()Landroid/graphics/Rect;

    move-result-object p1

    .line 294
    sget-object v0, Lcom/android/camera2/CaptureRequestBuilder;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "applyZoomRatio: ActiveArraySize="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 296
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 297
    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    .line 298
    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    move-result v2

    div-int/lit8 v2, v2, 0x2

    .line 299
    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    move-result v3

    int-to-float v3, v3

    const/high16 v4, 0x40000000    # 2.0f

    mul-float/2addr v4, p2

    div-float/2addr v3, v4

    float-to-int p2, v3

    .line 300
    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    move-result p1

    int-to-float p1, p1

    div-float/2addr p1, v4

    float-to-int p1, p1

    .line 302
    sub-int v3, v1, p2

    sub-int v4, v2, p1

    add-int/2addr v1, p2

    add-int/2addr v2, p1

    invoke-virtual {v0, v3, v4, v1, v2}, Landroid/graphics/Rect;->set(IIII)V

    .line 304
    sget-object p1, Lcom/android/camera2/CaptureRequestBuilder;->TAG:Ljava/lang/String;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "applyZoomRatio: cropRegion="

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 306
    sget-object p1, Landroid/hardware/camera2/CaptureRequest;->SCALER_CROP_REGION:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-virtual {p0, p1, v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 307
    return-void
.end method

.method static applyZsl(Landroid/hardware/camera2/CaptureRequest$Builder;Lcom/android/camera2/CameraConfigs;)V
    .locals 0

    .line 310
    if-nez p0, :cond_0

    .line 311
    return-void

    .line 313
    :cond_0
    invoke-virtual {p1}, Lcom/android/camera2/CameraConfigs;->isZslEnabled()Z

    move-result p1

    invoke-static {p0, p1}, Lcom/android/camera/lib/compatibility/util/CompatibilityUtils;->setZsl(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 314
    return-void
.end method
