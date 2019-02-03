.class public Lcom/android/camera/module/impl/component/ConfigChangeImpl;
.super Ljava/lang/Object;
.source "ConfigChangeImpl.java"

# interfaces
.implements Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private mActivity:Lcom/android/camera/ActivityBase;

.field private mLastAiSceneStateOn:Z

.field private mRecordingMutexElements:[I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 69
    const-class v0, Lcom/android/camera/module/impl/component/ConfigChangeImpl;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/android/camera/ActivityBase;)V
    .locals 1

    .line 87
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 76
    invoke-static {}, Lcom/android/camera/CameraSettings;->getAiSceneOpen()Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->mLastAiSceneStateOn:Z

    .line 88
    iput-object p1, p0, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->mActivity:Lcom/android/camera/ActivityBase;

    .line 89
    return-void
.end method

.method static synthetic access$000(Lcom/android/camera/module/impl/component/ConfigChangeImpl;)Lcom/android/camera/module/BaseModule;
    .locals 0

    .line 68
    invoke-direct {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->getBaseModule()Lcom/android/camera/module/BaseModule;

    move-result-object p0

    return-object p0
.end method

.method private applyConfig(II)V
    .locals 1

    .line 328
    const/16 v0, 0xc7

    if-eq p1, v0, :cond_2

    const/16 v0, 0xd1

    if-eq p1, v0, :cond_1

    const/16 v0, 0xf3

    if-eq p1, v0, :cond_0

    packed-switch p1, :pswitch_data_0

    const/4 v0, 0x1

    packed-switch p1, :pswitch_data_1

    packed-switch p1, :pswitch_data_2

    packed-switch p1, :pswitch_data_3

    packed-switch p1, :pswitch_data_4

    goto/16 :goto_0

    .line 459
    :pswitch_0
    invoke-direct {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->configAutoZoom()V

    goto/16 :goto_0

    .line 456
    :pswitch_1
    invoke-direct {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->configSwitchHandGesture()V

    .line 457
    goto/16 :goto_0

    .line 453
    :pswitch_2
    invoke-direct {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->configSwitchMenuUltraPixelPhotographyFront()V

    .line 454
    goto/16 :goto_0

    .line 450
    :pswitch_3
    invoke-direct {p0, p2}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->configSwitchMenuUltraPixelPhotography(I)V

    .line 451
    goto/16 :goto_0

    .line 447
    :pswitch_4
    invoke-direct {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->configMoonBacklight()V

    .line 448
    goto/16 :goto_0

    .line 444
    :pswitch_5
    invoke-direct {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->configSilhouette()V

    .line 445
    goto/16 :goto_0

    .line 441
    :pswitch_6
    invoke-direct {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->configMoonNight()V

    .line 442
    goto/16 :goto_0

    .line 438
    :pswitch_7
    invoke-direct {p0, v0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->configMoon(Z)V

    .line 439
    goto/16 :goto_0

    .line 407
    :pswitch_8
    invoke-virtual {p0, p2}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->configSuperResolutionSwitch(I)V

    .line 408
    goto/16 :goto_0

    .line 403
    :pswitch_9
    invoke-virtual {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->configDualWaterMarkSwitch()V

    .line 404
    goto/16 :goto_0

    .line 411
    :pswitch_a
    invoke-virtual {p0, p2}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->configBeautySwitch(I)V

    .line 412
    goto/16 :goto_0

    .line 395
    :pswitch_b
    invoke-virtual {p0, p2}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->configGenderAgeSwitch(I)V

    .line 396
    goto/16 :goto_0

    .line 387
    :pswitch_c
    invoke-virtual {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->configRawSwitch()V

    .line 388
    goto/16 :goto_0

    .line 383
    :pswitch_d
    invoke-virtual {p0, p2}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->configMagicMirrorSwitch(I)V

    .line 384
    goto/16 :goto_0

    .line 363
    :pswitch_e
    invoke-virtual {p0, p2}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->configGroupSwitch(I)V

    .line 364
    goto/16 :goto_0

    .line 367
    :pswitch_f
    invoke-virtual {p0, p2}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->configScene(I)V

    .line 368
    goto :goto_0

    .line 379
    :pswitch_10
    invoke-virtual {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->configVideoFast()V

    .line 380
    goto :goto_0

    .line 375
    :pswitch_11
    invoke-virtual {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->configVideoSlow()V

    .line 376
    goto :goto_0

    .line 359
    :pswitch_12
    invoke-virtual {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->configMagicFocusSwitch()V

    .line 360
    goto :goto_0

    .line 355
    :pswitch_13
    invoke-virtual {p0, p2}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->configHHTSwitch(I)V

    .line 356
    goto :goto_0

    .line 351
    :pswitch_14
    invoke-virtual {p0, p2}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->configGradienterSwitch(I)V

    .line 352
    goto :goto_0

    .line 347
    :pswitch_15
    invoke-virtual {p0, p2}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->configTiltSwitch(I)V

    .line 348
    goto :goto_0

    .line 343
    :pswitch_16
    invoke-virtual {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->configTimerSwitch()V

    .line 344
    goto :goto_0

    .line 330
    :pswitch_17
    invoke-virtual {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->showSetting()V

    .line 331
    goto :goto_0

    .line 432
    :pswitch_18
    invoke-direct {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->configSwitchUltraWideBokeh()V

    .line 433
    goto :goto_0

    .line 435
    :pswitch_19
    invoke-virtual {p0, p2}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->configLiveShotSwitch(I)V

    .line 436
    goto :goto_0

    .line 429
    :pswitch_1a
    invoke-direct {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->configSwitchUltraWide()V

    .line 430
    goto :goto_0

    .line 423
    :pswitch_1b
    invoke-virtual {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->configFPS960()V

    .line 424
    goto :goto_0

    .line 339
    :pswitch_1c
    invoke-virtual {p0, v0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->showOrHideLighting(Z)V

    .line 340
    goto :goto_0

    .line 371
    :pswitch_1d
    invoke-virtual {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->configVideoHFR()V

    .line 372
    goto :goto_0

    .line 415
    :pswitch_1e
    invoke-direct {p0, p2}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->configAiSceneSwitch(I)V

    .line 416
    goto :goto_0

    .line 334
    :pswitch_1f
    invoke-direct {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->beautyMutexHandle()V

    .line 335
    invoke-virtual {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->showOrHideFilter()V

    .line 336
    goto :goto_0

    .line 391
    :pswitch_20
    invoke-virtual {p0, p2}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->configPortraitSwitch(I)V

    .line 392
    goto :goto_0

    .line 419
    :cond_0
    invoke-direct {p0, p2}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->configVideoBokehSwitch(I)V

    .line 420
    goto :goto_0

    .line 426
    :cond_1
    invoke-direct {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->configSwitchUltraPixelPhotography()V

    .line 427
    goto :goto_0

    .line 399
    :cond_2
    invoke-virtual {p0, p2}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->configFocusPeakSwitch(I)V

    .line 400
    nop

    .line 462
    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0xc3
        :pswitch_20
        :pswitch_1f
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0xc9
        :pswitch_1e
        :pswitch_1d
        :pswitch_1c
        :pswitch_1b
        :pswitch_1a
        :pswitch_19
        :pswitch_18
    .end packed-switch

    :pswitch_data_2
    .packed-switch 0xe1
        :pswitch_17
        :pswitch_16
    .end packed-switch

    :pswitch_data_3
    .packed-switch 0xe4
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
    .end packed-switch

    :pswitch_data_4
    .packed-switch 0xf6
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private beautyMutexHandle()V
    .locals 3

    .line 810
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa0

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;

    .line 811
    if-eqz v0, :cond_1

    .line 812
    const v1, 0x7f0d001a

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;->getActiveFragment(I)I

    move-result v1

    const/16 v2, 0xfb

    if-ne v1, v2, :cond_1

    .line 813
    const/4 v1, 0x2

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;->delegateEvent(I)V

    .line 814
    const v1, 0x7f0d00fe

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;->getActiveFragment(I)I

    move-result v1

    const/16 v2, 0xfc

    if-ne v1, v2, :cond_0

    .line 815
    const/4 v1, 0x3

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;->delegateEvent(I)V

    .line 817
    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xaf

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;

    .line 818
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->reInitTipImage()V

    .line 820
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xc5

    .line 821
    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BottomMenuProtocol;

    .line 822
    const/4 v1, 0x0

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$BottomMenuProtocol;->onSwitchCameraActionMenu(I)V

    .line 826
    :cond_1
    return-void
.end method

.method private closeComponentUltraPixelFront()Z
    .locals 2

    .line 2062
    nop

    .line 2063
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->fQ()I

    move-result v0

    const/4 v1, 0x0

    if-lez v0, :cond_0

    .line 2064
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontMenuUltraPixelPhotographyOn()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2065
    invoke-static {v1}, Lcom/android/camera/CameraSettings;->setFrontMenuUltraPixelPhotographyConfig(Z)V

    .line 2066
    const/4 v1, 0x1

    .line 2068
    :cond_0
    return v1
.end method

.method private closeVideoFast()V
    .locals 3

    .line 1325
    invoke-static {}, Lcom/android/camera/data/DataRepository;->provider()Lcom/android/camera/data/provider/DataProvider;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider;->dataGlobal()Lcom/android/camera/data/provider/DataProvider$ProviderEvent;

    move-result-object v0

    check-cast v0, Lcom/android/camera/data/data/global/DataItemGlobal;

    .line 1326
    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentMode()I

    move-result v1

    .line 1327
    const/16 v2, 0xa9

    if-ne v1, v2, :cond_0

    .line 1328
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v1

    .line 1329
    const/16 v2, 0xa2

    invoke-virtual {v0, v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->setCurrentMode(I)V

    .line 1330
    const-string v0, "pref_video_speed_fast_key"

    invoke-virtual {v1, v0}, Lcom/android/camera/data/data/runing/DataItemRunning;->switchOff(Ljava/lang/String;)V

    .line 1332
    :cond_0
    return-void
.end method

.method private configAiSceneSwitch(I)V
    .locals 6

    .line 1709
    invoke-static {}, Lcom/android/camera/CameraSettings;->getAiSceneOpen()Z

    move-result v0

    .line 1710
    sget-object v1, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "configAiSceneSwitch: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    xor-int/lit8 v3, v0, 0x1

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1711
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    const/16 v2, 0xac

    .line 1712
    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v1

    check-cast v1, Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    .line 1713
    const/16 v2, 0xc9

    const/4 v3, 0x0

    const/4 v4, 0x1

    packed-switch p1, :pswitch_data_0

    goto :goto_1

    .line 1741
    :pswitch_0
    invoke-static {v3}, Lcom/android/camera/CameraSettings;->setAiSceneOpen(Z)V

    .line 1742
    new-array v0, v4, [I

    aput v2, v0, v3

    invoke-interface {v1, v0}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->updateConfigItem([I)V

    .line 1743
    goto :goto_1

    .line 1715
    :pswitch_1
    goto :goto_1

    .line 1718
    :pswitch_2
    if-nez v0, :cond_0

    .line 1719
    iput-boolean v4, p0, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->mLastAiSceneStateOn:Z

    .line 1720
    const v0, 0x7f0901fa

    invoke-interface {v1, v4, v0}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->alertSwitchHint(II)V

    .line 1721
    invoke-static {v4}, Lcom/android/camera/CameraSettings;->setAiSceneOpen(Z)V

    .line 1722
    const-string v0, "pref_camera_ai_scene_mode_key"

    const-string v5, "on"

    invoke-static {v0, v5}, Lcom/android/camera/statistic/CameraStatUtil;->trackPreferenceChange(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0

    .line 1724
    :cond_0
    iput-boolean v3, p0, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->mLastAiSceneStateOn:Z

    .line 1725
    const v0, 0x7f0901fb

    invoke-interface {v1, v4, v0}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->alertSwitchHint(II)V

    .line 1726
    invoke-static {v3}, Lcom/android/camera/CameraSettings;->setAiSceneOpen(Z)V

    .line 1727
    const-string v0, "pref_camera_ai_scene_mode_key"

    const-string v5, "off"

    invoke-static {v0, v5}, Lcom/android/camera/statistic/CameraStatUtil;->trackPreferenceChange(Ljava/lang/String;Ljava/lang/Object;)V

    .line 1728
    invoke-direct {p0, v3}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->configMoon(Z)V

    .line 1730
    :goto_0
    new-array v0, v4, [I

    aput v2, v0, v3

    invoke-interface {v1, v0}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->updateConfigItem([I)V

    .line 1732
    invoke-static {}, Lcom/android/camera/CameraSettings;->isGroupShotOn()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1734
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v2, 0xa4

    invoke-virtual {v0, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;

    .line 1736
    const/4 v2, 0x4

    invoke-interface {v0, v2}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->configGroupSwitch(I)V

    .line 1737
    invoke-interface {v1}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->refreshExtraMenu()V

    .line 1738
    nop

    .line 1749
    :cond_1
    :goto_1
    invoke-direct {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->getBaseModule()Lcom/android/camera/module/BaseModule;

    move-result-object v0

    new-array v1, v4, [I

    const/16 v2, 0x24

    aput v2, v1, v3

    invoke-virtual {v0, v1}, Lcom/android/camera/module/BaseModule;->updatePreferenceTrampoline([I)V

    .line 1750
    invoke-direct {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->getBaseModule()Lcom/android/camera/module/BaseModule;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/module/BaseModule;->getCameraDevice()Lcom/android/camera2/Camera2Proxy;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera2/Camera2Proxy;->resumePreview()V

    .line 1752
    if-ne p1, v4, :cond_2

    invoke-static {}, Lcom/android/camera/CameraSettings;->isRearMenuUltraPixelPhotographyOn()Z

    move-result p1

    if-eqz p1, :cond_2

    .line 1754
    const/4 p1, 0x3

    invoke-direct {p0, p1}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->configSwitchMenuUltraPixelPhotography(I)V

    .line 1756
    :cond_2
    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private configAutoZoom()V
    .locals 7

    .line 493
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    const-string v1, "pref_camera_auto_zoom"

    invoke-virtual {v0, v1}, Lcom/android/camera/data/data/runing/DataItemRunning;->isSwitchOn(Ljava/lang/String;)Z

    move-result v0

    .line 496
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    const/16 v2, 0xac

    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v1

    check-cast v1, Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    .line 499
    if-eqz v0, :cond_0

    .line 500
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    const-string v2, "pref_camera_auto_zoom"

    invoke-virtual {v0, v2}, Lcom/android/camera/data/data/runing/DataItemRunning;->switchOff(Ljava/lang/String;)V

    goto :goto_0

    .line 502
    :cond_0
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    const-string v2, "pref_camera_auto_zoom"

    invoke-virtual {v0, v2}, Lcom/android/camera/data/data/runing/DataItemRunning;->switchOn(Ljava/lang/String;)V

    .line 504
    :goto_0
    const/4 v0, 0x1

    new-array v2, v0, [I

    const/16 v3, 0xfd

    const/4 v4, 0x0

    aput v3, v2, v4

    invoke-interface {v1, v2}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->updateConfigItem([I)V

    .line 507
    invoke-direct {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->closeVideoFast()V

    .line 509
    const-string v2, "h"

    new-array v3, v0, [I

    const/16 v5, 0xef

    aput v5, v3, v4

    invoke-virtual {p0, v2, v3}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->closeMutexElement(Ljava/lang/String;[I)V

    .line 511
    iget-object v2, p0, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->mActivity:Lcom/android/camera/ActivityBase;

    const/16 v3, 0xa2

    invoke-static {v3}, Lcom/android/camera/module/loader/StartControl;->create(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object v3

    const/4 v5, 0x2

    .line 512
    invoke-virtual {v3, v5}, Lcom/android/camera/module/loader/StartControl;->setViewConfigType(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object v3

    .line 513
    invoke-virtual {v3, v0}, Lcom/android/camera/module/loader/StartControl;->setNeedBlurAnimation(Z)Lcom/android/camera/module/loader/StartControl;

    move-result-object v3

    .line 514
    invoke-virtual {v3, v4}, Lcom/android/camera/module/loader/StartControl;->setNeedReConfigureData(Z)Lcom/android/camera/module/loader/StartControl;

    move-result-object v3

    .line 515
    invoke-virtual {v3, v0}, Lcom/android/camera/module/loader/StartControl;->setNeedReConfigureCamera(Z)Lcom/android/camera/module/loader/StartControl;

    move-result-object v3

    .line 511
    invoke-virtual {v2, v3}, Lcom/android/camera/ActivityBase;->onModeSelected(Lcom/android/camera/module/loader/StartControl;)V

    .line 517
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v2

    const/16 v3, 0xaf

    invoke-virtual {v2, v3}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v2

    check-cast v2, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;

    .line 518
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v3

    const-string v5, "pref_camera_auto_zoom"

    invoke-virtual {v3, v5}, Lcom/android/camera/data/data/runing/DataItemRunning;->isSwitchOn(Ljava/lang/String;)Z

    move-result v3

    .line 519
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v5

    const-string v6, "pref_auto_zoom_ultra_count"

    invoke-virtual {v5, v6, v4}, Lcom/android/camera/data/data/global/DataItemGlobal;->getInt(Ljava/lang/String;I)I

    move-result v4

    .line 520
    if-eqz v3, :cond_1

    .line 521
    const v3, 0x7f09027f

    invoke-interface {v1, v0, v3}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->alertSwitchHint(II)V

    .line 522
    const/4 v1, 0x3

    if-ge v4, v1, :cond_2

    .line 523
    const/16 v1, 0xe

    const v3, 0x7f090240

    const/4 v5, 0x6

    invoke-interface {v2, v1, v3, v5}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->showTips(III)V

    .line 525
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v1

    const-string v3, "pref_auto_zoom_ultra_count"

    add-int/2addr v4, v0

    invoke-virtual {v1, v3, v4}, Lcom/android/camera/data/data/global/DataItemGlobal;->putInt(Ljava/lang/String;I)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    goto :goto_1

    .line 528
    :cond_1
    const v3, 0x7f090280

    invoke-interface {v1, v0, v3}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->alertSwitchHint(II)V

    .line 530
    :cond_2
    :goto_1
    invoke-interface {v2}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->updateTipImage()V

    .line 531
    return-void
.end method

.method private configMoon(Z)V
    .locals 2

    .line 693
    invoke-direct {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->getBaseModule()Lcom/android/camera/module/BaseModule;

    move-result-object v0

    .line 695
    instance-of v1, v0, Lcom/android/camera/module/Camera2Module;

    if-eqz v1, :cond_0

    .line 696
    check-cast v0, Lcom/android/camera/module/Camera2Module;

    .line 700
    invoke-virtual {v0, p1}, Lcom/android/camera/module/Camera2Module;->updateMoon(Z)V

    .line 701
    return-void

    .line 698
    :cond_0
    return-void
.end method

.method private configMoonBacklight()V
    .locals 2

    .line 671
    invoke-direct {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->getBaseModule()Lcom/android/camera/module/BaseModule;

    move-result-object v0

    .line 673
    instance-of v1, v0, Lcom/android/camera/module/Camera2Module;

    if-eqz v1, :cond_0

    .line 674
    check-cast v0, Lcom/android/camera/module/Camera2Module;

    .line 678
    invoke-virtual {v0}, Lcom/android/camera/module/Camera2Module;->updateBacklight()V

    .line 679
    return-void

    .line 676
    :cond_0
    return-void
.end method

.method private configMoonNight()V
    .locals 2

    .line 704
    invoke-direct {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->getBaseModule()Lcom/android/camera/module/BaseModule;

    move-result-object v0

    .line 706
    instance-of v1, v0, Lcom/android/camera/module/Camera2Module;

    if-eqz v1, :cond_0

    .line 707
    check-cast v0, Lcom/android/camera/module/Camera2Module;

    .line 711
    const/4 v1, 0x0

    invoke-direct {p0, v1}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->configMoon(Z)V

    .line 712
    invoke-virtual {v0}, Lcom/android/camera/module/Camera2Module;->updateMoonNight()V

    .line 713
    return-void

    .line 709
    :cond_0
    return-void
.end method

.method private configSilhouette()V
    .locals 2

    .line 682
    invoke-direct {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->getBaseModule()Lcom/android/camera/module/BaseModule;

    move-result-object v0

    .line 684
    instance-of v1, v0, Lcom/android/camera/module/Camera2Module;

    if-eqz v1, :cond_0

    .line 685
    check-cast v0, Lcom/android/camera/module/Camera2Module;

    .line 689
    invoke-virtual {v0}, Lcom/android/camera/module/Camera2Module;->updateSilhouette()V

    .line 690
    return-void

    .line 687
    :cond_0
    return-void
.end method

.method private configSwitchHandGesture()V
    .locals 5

    .line 465
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->fR()Z

    move-result v0

    if-nez v0, :cond_0

    .line 466
    return-void

    .line 469
    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xac

    .line 470
    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    .line 471
    if-nez v0, :cond_1

    .line 472
    return-void

    .line 475
    :cond_1
    invoke-direct {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->getBaseModule()Lcom/android/camera/module/BaseModule;

    move-result-object v0

    .line 476
    if-eqz v0, :cond_4

    .line 477
    invoke-virtual {v0}, Lcom/android/camera/module/BaseModule;->getModuleIndex()I

    move-result v1

    const/16 v2, 0xa3

    if-eq v1, v2, :cond_2

    .line 478
    invoke-virtual {v0}, Lcom/android/camera/module/BaseModule;->getModuleIndex()I

    move-result v0

    const/16 v1, 0xab

    if-ne v0, v1, :cond_4

    .line 479
    :cond_2
    invoke-static {}, Lcom/android/camera/CameraSettings;->isHangGestureOpen()Z

    move-result v0

    .line 480
    xor-int/lit8 v0, v0, 0x1

    invoke-static {v0}, Lcom/android/camera/CameraSettings;->setHandGestureStatus(Z)V

    .line 481
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    const/16 v2, 0xaf

    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v1

    check-cast v1, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;

    .line 482
    if-eqz v0, :cond_3

    .line 483
    const/16 v2, 0x10

    const v3, 0x7f090282

    const/4 v4, 0x2

    invoke-interface {v1, v2, v3, v4}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->showTips(III)V

    .line 485
    :cond_3
    invoke-direct {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->getBaseModule()Lcom/android/camera/module/BaseModule;

    move-result-object v1

    check-cast v1, Lcom/android/camera/module/Camera2Module;

    invoke-virtual {v1, v0}, Lcom/android/camera/module/Camera2Module;->onHanGestureSwitched(Z)V

    .line 487
    :cond_4
    return-void
.end method

.method private configSwitchMenuUltraPixelPhotography(I)V
    .locals 12

    .line 534
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    .line 535
    const/16 v1, 0xac

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    .line 536
    if-eqz v0, :cond_11

    iget-object v1, p0, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->mActivity:Lcom/android/camera/ActivityBase;

    if-nez v1, :cond_0

    goto/16 :goto_3

    .line 540
    :cond_0
    invoke-direct {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->getBaseModule()Lcom/android/camera/module/BaseModule;

    move-result-object v1

    .line 541
    if-nez v1, :cond_1

    .line 542
    return-void

    .line 546
    :cond_1
    invoke-virtual {v1}, Lcom/android/camera/module/BaseModule;->getModuleIndex()I

    move-result v2

    .line 547
    const/16 v3, 0xa3

    if-eq v2, v3, :cond_2

    .line 548
    return-void

    .line 552
    :cond_2
    invoke-virtual {v1}, Lcom/android/camera/module/BaseModule;->getCameraCapabilities()Lcom/android/camera2/CameraCapabilities;

    move-result-object v3

    .line 553
    invoke-static {v3}, Lcom/android/camera/CameraSettings;->isSupportedUltraPixelPhotography(Lcom/android/camera2/CameraCapabilities;)Z

    move-result v3

    if-nez v3, :cond_3

    .line 554
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mi/config/a;->fP()I

    move-result v3

    if-gtz v3, :cond_3

    .line 555
    return-void

    .line 558
    :cond_3
    invoke-static {}, Lcom/android/camera/CameraSettings;->isRearMenuUltraPixelPhotographyOn()Z

    move-result v3

    .line 559
    nop

    .line 560
    xor-int/lit8 v4, v3, 0x1

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v5

    invoke-virtual {v5}, Lcom/android/camera/data/data/config/DataItemConfig;->getRearComponentConfigUltraPixel()Lcom/android/camera/data/data/config/ComponentConfigUltraPixel;

    move-result-object v5

    .line 561
    const/16 v6, 0xaf

    const/16 v7, 0x8

    const/4 v8, 0x3

    const/4 v9, 0x1

    const/4 v10, 0x0

    if-eq p1, v9, :cond_5

    if-eq p1, v8, :cond_4

    goto/16 :goto_1

    .line 596
    :cond_4
    if-eqz v3, :cond_b

    .line 598
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentConfigBeautyBody()Lcom/android/camera/data/data/config/ComponentConfigBeautyBody;

    move-result-object p1

    invoke-virtual {p1, v10}, Lcom/android/camera/data/data/config/ComponentConfigBeautyBody;->setClosed(Z)V

    .line 599
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentConfigBeautyBody()Lcom/android/camera/data/data/config/ComponentConfigBeautyBody;

    move-result-object p1

    invoke-virtual {p1, v10}, Lcom/android/camera/data/data/config/ComponentConfigBeautyBody;->setClosed(Z)V

    .line 600
    invoke-static {v10}, Lcom/android/camera/CameraSettings;->setRearMenuUltraPixelPhotographyConfig(Z)V

    .line 601
    invoke-virtual {v1}, Lcom/android/camera/module/BaseModule;->restartModule()V

    .line 602
    invoke-virtual {v5}, Lcom/android/camera/data/data/config/ComponentConfigUltraPixel;->getUltraPixelCloseTip()Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, v7, p1}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->alertTopHint(ILjava/lang/String;)V

    goto/16 :goto_1

    .line 564
    :cond_5
    invoke-static {v2}, Lcom/android/camera/CameraSettings;->isUltraWideConfigOpen(I)Z

    move-result p1

    if-eqz p1, :cond_6

    .line 565
    invoke-static {v2, v10}, Lcom/android/camera/CameraSettings;->setUltraWideConfig(IZ)V

    .line 566
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    invoke-virtual {p1, v6}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;

    .line 567
    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->updateLeftTipImage()V

    .line 570
    :cond_6
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentHdr()Lcom/android/camera/data/data/config/ComponentConfigHdr;

    move-result-object p1

    invoke-direct {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->getBaseModule()Lcom/android/camera/module/BaseModule;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/camera/module/BaseModule;->getModuleIndex()I

    move-result v3

    invoke-virtual {p1, v3}, Lcom/android/camera/data/data/config/ComponentConfigHdr;->getComponentValue(I)Ljava/lang/String;

    move-result-object p1

    .line 571
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_7

    const-string v3, "off"

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_7

    .line 572
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentHdr()Lcom/android/camera/data/data/config/ComponentConfigHdr;

    move-result-object p1

    invoke-direct {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->getBaseModule()Lcom/android/camera/module/BaseModule;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/camera/module/BaseModule;->getModuleIndex()I

    move-result v3

    const-string v11, "off"

    invoke-virtual {p1, v3, v11}, Lcom/android/camera/data/data/config/ComponentConfigHdr;->setComponentValue(ILjava/lang/String;)V

    .line 575
    :cond_7
    invoke-static {}, Lcom/android/camera/CameraSettings;->getAiSceneOpen()Z

    move-result p1

    if-eqz p1, :cond_8

    .line 576
    invoke-direct {p0, v8}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->configAiSceneSwitch(I)V

    .line 579
    :cond_8
    if-eqz v4, :cond_9

    .line 580
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentConfigBeautyBody()Lcom/android/camera/data/data/config/ComponentConfigBeautyBody;

    move-result-object p1

    invoke-virtual {p1, v9}, Lcom/android/camera/data/data/config/ComponentConfigBeautyBody;->setClosed(Z)V

    .line 581
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentConfigBeauty()Lcom/android/camera/data/data/config/ComponentConfigBeauty;

    move-result-object p1

    invoke-virtual {p1, v9, v2}, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->setClosed(ZI)V

    goto :goto_0

    .line 583
    :cond_9
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentConfigBeautyBody()Lcom/android/camera/data/data/config/ComponentConfigBeautyBody;

    move-result-object p1

    invoke-virtual {p1, v10}, Lcom/android/camera/data/data/config/ComponentConfigBeautyBody;->setClosed(Z)V

    .line 584
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentConfigBeauty()Lcom/android/camera/data/data/config/ComponentConfigBeauty;

    move-result-object p1

    invoke-virtual {p1, v10, v2}, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->setClosed(ZI)V

    .line 586
    :goto_0
    invoke-static {v4}, Lcom/android/camera/CameraSettings;->setRearMenuUltraPixelPhotographyConfig(Z)V

    .line 587
    invoke-virtual {v1}, Lcom/android/camera/module/BaseModule;->restartModule()V

    .line 588
    if-eqz v4, :cond_a

    .line 589
    invoke-virtual {v5}, Lcom/android/camera/data/data/config/ComponentConfigUltraPixel;->getUltraPixelOpenTip()Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, v10, p1}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->alertTopHint(ILjava/lang/String;)V

    goto :goto_1

    .line 591
    :cond_a
    invoke-virtual {v5}, Lcom/android/camera/data/data/config/ComponentConfigUltraPixel;->getUltraPixelCloseTip()Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, v7, p1}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->alertTopHint(ILjava/lang/String;)V

    .line 592
    invoke-virtual {v5}, Lcom/android/camera/data/data/config/ComponentConfigUltraPixel;->getUltraPixelCloseTip()Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, v9, p1}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->alertSwitchHint(ILjava/lang/String;)V

    .line 594
    nop

    .line 609
    :cond_b
    :goto_1
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    invoke-virtual {p1, v6}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;

    .line 610
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    const/16 v2, 0xb6

    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v1

    check-cast v1, Lcom/android/camera/protocol/ModeProtocol$DualController;

    .line 611
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v2

    const/16 v3, 0xc2

    invoke-virtual {v2, v3}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v2

    check-cast v2, Lcom/android/camera/protocol/ModeProtocol$MiBeautyProtocol;

    .line 612
    if-eqz v4, :cond_d

    .line 613
    if-eqz p1, :cond_c

    .line 614
    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->directHideTipImage()V

    .line 615
    invoke-interface {p1, v10}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->directShowOrHideLeftTipImage(Z)V

    .line 617
    :cond_c
    if-eqz v1, :cond_10

    .line 618
    invoke-interface {v1}, Lcom/android/camera/protocol/ModeProtocol$DualController;->hideZoomButton()V

    .line 619
    if-eqz v0, :cond_10

    .line 620
    const/4 p1, 0x2

    invoke-interface {v0, p1}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->alertUpdateValue(I)V

    goto :goto_2

    .line 624
    :cond_d
    nop

    .line 625
    if-eqz v2, :cond_e

    .line 626
    invoke-interface {v2}, Lcom/android/camera/protocol/ModeProtocol$MiBeautyProtocol;->isBeautyPanelShow()Z

    move-result v10

    .line 628
    :cond_e
    if-eqz p1, :cond_f

    if-nez v10, :cond_f

    .line 629
    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->reInitTipImage()V

    .line 631
    :cond_f
    if-eqz v1, :cond_10

    if-nez v10, :cond_10

    .line 632
    invoke-interface {v1}, Lcom/android/camera/protocol/ModeProtocol$DualController;->showZoomButton()V

    .line 633
    if-eqz v0, :cond_10

    .line 634
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->clearAlertStatus()V

    .line 638
    :cond_10
    :goto_2
    return-void

    .line 537
    :cond_11
    :goto_3
    return-void
.end method

.method private configSwitchMenuUltraPixelPhotographyFront()V
    .locals 6

    .line 641
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    .line 642
    const/16 v1, 0xac

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    .line 643
    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->mActivity:Lcom/android/camera/ActivityBase;

    if-nez v0, :cond_0

    goto :goto_1

    .line 647
    :cond_0
    invoke-direct {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->getBaseModule()Lcom/android/camera/module/BaseModule;

    move-result-object v0

    .line 648
    if-nez v0, :cond_1

    .line 649
    return-void

    .line 652
    :cond_1
    invoke-virtual {v0}, Lcom/android/camera/module/BaseModule;->getCameraCapabilities()Lcom/android/camera2/CameraCapabilities;

    move-result-object v1

    .line 653
    invoke-static {v1}, Lcom/android/camera/CameraSettings;->isFrontSupportedUltraPixelPhotography(Lcom/android/camera2/CameraCapabilities;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 654
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mi/config/a;->fQ()I

    move-result v1

    if-lez v1, :cond_3

    .line 655
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontMenuUltraPixelPhotographyOn()Z

    move-result v1

    .line 656
    const/4 v2, 0x1

    xor-int/2addr v1, v2

    if-eqz v1, :cond_2

    .line 657
    const-string v3, "j"

    new-array v2, v2, [I

    const/4 v4, 0x0

    const/16 v5, 0xc4

    aput v5, v2, v4

    invoke-virtual {p0, v3, v2}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->closeMutexElement(Ljava/lang/String;[I)V

    .line 659
    iget-object v2, p0, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->mRecordingMutexElements:[I

    sput-object v2, Lcom/android/camera/data/data/config/SupportedConfigFactory;->gRecordingMutexElements:[I

    goto :goto_0

    .line 662
    :cond_2
    sget-object v2, Lcom/android/camera/data/data/config/SupportedConfigFactory;->gRecordingMutexElements:[I

    iput-object v2, p0, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->mRecordingMutexElements:[I

    .line 663
    const-string v2, "j"

    invoke-virtual {p0, v2}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->restoreAllMutexElement(Ljava/lang/String;)V

    .line 665
    :goto_0
    invoke-static {v1}, Lcom/android/camera/CameraSettings;->setFrontMenuUltraPixelPhotographyConfig(Z)V

    .line 666
    invoke-virtual {v0}, Lcom/android/camera/module/BaseModule;->restartModule()V

    .line 668
    :cond_3
    return-void

    .line 644
    :cond_4
    :goto_1
    return-void
.end method

.method private configSwitchUltraPixelPhotography()V
    .locals 5

    .line 746
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    .line 747
    const/16 v1, 0xac

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    .line 748
    if-eqz v0, :cond_5

    iget-object v1, p0, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->mActivity:Lcom/android/camera/ActivityBase;

    if-nez v1, :cond_0

    goto :goto_1

    .line 752
    :cond_0
    invoke-direct {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->getBaseModule()Lcom/android/camera/module/BaseModule;

    move-result-object v1

    .line 753
    if-nez v1, :cond_1

    .line 754
    return-void

    .line 758
    :cond_1
    invoke-virtual {v1}, Lcom/android/camera/module/BaseModule;->getModuleIndex()I

    move-result v2

    .line 759
    const/16 v3, 0xa7

    if-eq v2, v3, :cond_2

    .line 760
    return-void

    .line 764
    :cond_2
    invoke-virtual {v1}, Lcom/android/camera/module/BaseModule;->getCameraCapabilities()Lcom/android/camera2/CameraCapabilities;

    move-result-object v2

    .line 765
    invoke-static {v2}, Lcom/android/camera/CameraSettings;->isSupportedUltraPixelPhotography(Lcom/android/camera2/CameraCapabilities;)Z

    move-result v2

    if-nez v2, :cond_3

    .line 766
    return-void

    .line 769
    :cond_3
    invoke-static {}, Lcom/android/camera/CameraSettings;->isUltraPixelPhotographyOn()Z

    move-result v2

    .line 770
    xor-int/lit8 v3, v2, 0x1

    invoke-static {v3}, Lcom/android/camera/CameraSettings;->setUltraPixelPhotographyConfig(Z)V

    .line 771
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/camera/data/data/config/DataItemConfig;->getRearComponentConfigUltraPixel()Lcom/android/camera/data/data/config/ComponentConfigUltraPixel;

    move-result-object v3

    .line 772
    if-nez v2, :cond_4

    .line 773
    const/4 v2, 0x0

    invoke-virtual {v3}, Lcom/android/camera/data/data/config/ComponentConfigUltraPixel;->getUltraPixelOpenTip()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v2, v3}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->alertTopHint(ILjava/lang/String;)V

    goto :goto_0

    .line 775
    :cond_4
    const/16 v2, 0x8

    invoke-virtual {v3}, Lcom/android/camera/data/data/config/ComponentConfigUltraPixel;->getUltraPixelCloseTip()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v0, v2, v4}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->alertTopHint(ILjava/lang/String;)V

    .line 776
    const/4 v2, 0x2

    invoke-virtual {v3}, Lcom/android/camera/data/data/config/ComponentConfigUltraPixel;->getUltraPixelCloseTip()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v2, v3}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->alertSwitchHint(ILjava/lang/String;)V

    .line 778
    :goto_0
    invoke-virtual {v1}, Lcom/android/camera/module/BaseModule;->restartModule()V

    .line 779
    return-void

    .line 749
    :cond_5
    :goto_1
    return-void
.end method

.method private configSwitchUltraWide()V
    .locals 5

    .line 716
    invoke-direct {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->getBaseModule()Lcom/android/camera/module/BaseModule;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/module/BaseModule;->getModuleIndex()I

    move-result v0

    .line 717
    const/4 v1, 0x0

    const/4 v2, 0x1

    const/16 v3, 0xa9

    if-ne v3, v0, :cond_0

    .line 718
    move v3, v2

    goto :goto_0

    .line 717
    :cond_0
    nop

    .line 718
    move v3, v1

    :goto_0
    invoke-static {v0}, Lcom/android/camera/CameraSettings;->isUltraWideConfigOpen(I)Z

    move-result v4

    .line 719
    nop

    .line 721
    xor-int/2addr v2, v4

    if-eqz v2, :cond_1

    if-eqz v3, :cond_1

    .line 722
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v3

    const/16 v4, 0xa2

    invoke-virtual {v3, v4}, Lcom/android/camera/data/data/global/DataItemGlobal;->setCurrentMode(I)V

    .line 723
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v3

    const/16 v4, 0xac

    invoke-virtual {v3, v4}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v3

    check-cast v3, Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    .line 724
    if-eqz v3, :cond_1

    .line 725
    invoke-interface {v3}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->refreshExtraMenu()V

    .line 729
    :cond_1
    invoke-static {}, Lcom/android/camera/CameraSettings;->isRearMenuUltraPixelPhotographyOn()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 730
    invoke-static {v1}, Lcom/android/camera/CameraSettings;->setRearMenuUltraPixelPhotographyConfig(Z)V

    .line 732
    :cond_2
    invoke-static {v0, v2}, Lcom/android/camera/CameraSettings;->setUltraWideConfig(IZ)V

    .line 733
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xc8

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$UltraWideProtocol;

    .line 734
    if-eqz v0, :cond_3

    .line 735
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$UltraWideProtocol;->onSwitchUltraWide()V

    .line 737
    :cond_3
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xaf

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;

    .line 738
    const/4 v1, 0x6

    const/16 v3, 0xd

    if-eqz v2, :cond_4

    .line 739
    const v2, 0x7f09023d

    const/16 v4, 0x1f4

    invoke-interface {v0, v3, v2, v1, v4}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->showTips(IIII)V

    goto :goto_1

    .line 741
    :cond_4
    const v2, 0x7f09023e

    invoke-interface {v0, v3, v2, v1}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->showTips(III)V

    .line 743
    :goto_1
    return-void
.end method

.method private configSwitchUltraWideBokeh()V
    .locals 5

    .line 782
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    .line 783
    const/16 v1, 0xac

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    .line 784
    if-eqz v0, :cond_3

    iget-object v1, p0, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->mActivity:Lcom/android/camera/ActivityBase;

    if-nez v1, :cond_0

    goto :goto_1

    .line 788
    :cond_0
    invoke-direct {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->getBaseModule()Lcom/android/camera/module/BaseModule;

    move-result-object v1

    .line 789
    if-nez v1, :cond_1

    .line 790
    return-void

    .line 793
    :cond_1
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v2

    const-string v3, "pref_ultra_wide_bokeh_enabled"

    invoke-virtual {v2, v3}, Lcom/android/camera/data/data/runing/DataItemRunning;->isSwitchOn(Ljava/lang/String;)Z

    move-result v2

    .line 794
    const/4 v3, 0x2

    if-eqz v2, :cond_2

    .line 795
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v2

    const-string v4, "pref_ultra_wide_bokeh_enabled"

    invoke-virtual {v2, v4}, Lcom/android/camera/data/data/runing/DataItemRunning;->switchOff(Ljava/lang/String;)V

    .line 796
    const v2, 0x7f09024f

    invoke-interface {v0, v3, v2}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->alertSwitchHint(II)V

    goto :goto_0

    .line 798
    :cond_2
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v2

    const-string v4, "pref_ultra_wide_bokeh_enabled"

    invoke-virtual {v2, v4}, Lcom/android/camera/data/data/runing/DataItemRunning;->switchOn(Ljava/lang/String;)V

    .line 799
    const v2, 0x7f09024e

    invoke-interface {v0, v3, v2}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->alertSwitchHint(II)V

    .line 802
    :goto_0
    invoke-virtual {v1}, Lcom/android/camera/module/BaseModule;->restartModule()V

    .line 803
    return-void

    .line 785
    :cond_3
    :goto_1
    return-void
.end method

.method private configVideoBokehSwitch(I)V
    .locals 6

    .line 1759
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    .line 1760
    const/16 v0, 0xac

    invoke-virtual {p1, v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    .line 1761
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    .line 1762
    const-string v1, "pref_video_bokeh_key"

    invoke-virtual {v0, v1}, Lcom/android/camera/data/data/config/DataItemConfig;->isSwitchOn(Ljava/lang/String;)Z

    move-result v1

    .line 1763
    sget-object v2, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "configVideoBokehSwitch: switchOn = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    xor-int/lit8 v4, v1, 0x1

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1764
    if-nez v1, :cond_0

    .line 1765
    const-string v2, "pref_video_bokeh_key"

    invoke-virtual {v0, v2}, Lcom/android/camera/data/data/config/DataItemConfig;->switchOn(Ljava/lang/String;)V

    .line 1766
    const-string v0, "pref_video_bokeh_key"

    const-string v2, "on"

    invoke-static {v0, v2}, Lcom/android/camera/statistic/CameraStatUtil;->trackPreferenceChange(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0

    .line 1768
    :cond_0
    const-string v2, "pref_video_bokeh_key"

    invoke-virtual {v0, v2}, Lcom/android/camera/data/data/config/DataItemConfig;->switchOff(Ljava/lang/String;)V

    .line 1769
    const-string v0, "pref_video_bokeh_key"

    const-string v2, "off"

    invoke-static {v0, v2}, Lcom/android/camera/statistic/CameraStatUtil;->trackPreferenceChange(Ljava/lang/String;Ljava/lang/Object;)V

    .line 1771
    :goto_0
    const/4 v0, 0x1

    new-array v2, v0, [I

    const/16 v3, 0xf3

    const/4 v4, 0x0

    aput v3, v2, v4

    invoke-interface {p1, v2}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->updateConfigItem([I)V

    .line 1772
    iget-object v2, p0, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->mActivity:Lcom/android/camera/ActivityBase;

    invoke-direct {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->getBaseModule()Lcom/android/camera/module/BaseModule;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/camera/module/BaseModule;->getModuleIndex()I

    move-result v3

    invoke-static {v3}, Lcom/android/camera/module/loader/StartControl;->create(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object v3

    .line 1773
    const/4 v5, 0x2

    invoke-virtual {v3, v5}, Lcom/android/camera/module/loader/StartControl;->setViewConfigType(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object v3

    .line 1774
    invoke-virtual {v3, v0}, Lcom/android/camera/module/loader/StartControl;->setNeedBlurAnimation(Z)Lcom/android/camera/module/loader/StartControl;

    move-result-object v3

    .line 1775
    invoke-virtual {v3, v0}, Lcom/android/camera/module/loader/StartControl;->setNeedReConfigureCamera(Z)Lcom/android/camera/module/loader/StartControl;

    move-result-object v0

    .line 1776
    invoke-virtual {v0, v4}, Lcom/android/camera/module/loader/StartControl;->setNeedReConfigureData(Z)Lcom/android/camera/module/loader/StartControl;

    move-result-object v0

    .line 1772
    invoke-virtual {v2, v0}, Lcom/android/camera/ActivityBase;->onModeSelected(Lcom/android/camera/module/loader/StartControl;)V

    .line 1777
    if-nez v1, :cond_1

    const v0, 0x7f09020f

    goto :goto_1

    .line 1778
    :cond_1
    const v0, 0x7f090210

    .line 1777
    :goto_1
    invoke-interface {p1, v5, v0}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->alertSwitchHint(II)V

    .line 1779
    return-void
.end method

.method private conflictWithFlashAndHdr()V
    .locals 2

    .line 2073
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    .line 2074
    const-string v1, "pref_camera_hand_night_key"

    invoke-virtual {v0, v1}, Lcom/android/camera/data/data/runing/DataItemRunning;->switchOff(Ljava/lang/String;)V

    .line 2075
    const-string v1, "pref_camera_groupshot_mode_key"

    invoke-virtual {v0, v1}, Lcom/android/camera/data/data/runing/DataItemRunning;->switchOff(Ljava/lang/String;)V

    .line 2076
    const-string v1, "pref_camera_super_resolution_key"

    invoke-virtual {v0, v1}, Lcom/android/camera/data/data/runing/DataItemRunning;->switchOff(Ljava/lang/String;)V

    .line 2079
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xaf

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;

    .line 2081
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->directlyHideTips()V

    .line 2082
    return-void
.end method

.method public static create(Lcom/android/camera/ActivityBase;)Lcom/android/camera/module/impl/component/ConfigChangeImpl;
    .locals 1

    .line 84
    new-instance v0, Lcom/android/camera/module/impl/component/ConfigChangeImpl;

    invoke-direct {v0, p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;-><init>(Lcom/android/camera/ActivityBase;)V

    return-object v0
.end method

.method private getBaseModule()Lcom/android/camera/module/BaseModule;
    .locals 1

    .line 92
    iget-object v0, p0, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->mActivity:Lcom/android/camera/ActivityBase;

    invoke-virtual {v0}, Lcom/android/camera/ActivityBase;->getCurrentModule()Lcom/android/camera/module/Module;

    move-result-object v0

    check-cast v0, Lcom/android/camera/module/BaseModule;

    return-object v0
.end method

.method private getState(ILjava/lang/String;)Z
    .locals 1

    .line 1782
    const/4 v0, 0x2

    if-eq p1, v0, :cond_1

    const/4 v0, 0x4

    if-eq p1, v0, :cond_0

    .line 1784
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object p1

    invoke-virtual {p1, p2}, Lcom/android/camera/data/data/runing/DataItemRunning;->triggerSwitchAndGet(Ljava/lang/String;)Z

    move-result p1

    return p1

    .line 1790
    :cond_0
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object p1

    invoke-virtual {p1, p2}, Lcom/android/camera/data/data/runing/DataItemRunning;->switchOff(Ljava/lang/String;)V

    .line 1791
    const/4 p1, 0x0

    return p1

    .line 1787
    :cond_1
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object p1

    invoke-virtual {p1, p2}, Lcom/android/camera/data/data/runing/DataItemRunning;->isSwitchOn(Ljava/lang/String;)Z

    move-result p1

    return p1
.end method

.method private hideTipMessage(I)V
    .locals 2
    .param p1    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param

    .line 2094
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xaf

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;

    .line 2095
    if-lez p1, :cond_0

    invoke-interface {v0, p1}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->containTips(I)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 2096
    :cond_0
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->directlyHideTips()V

    .line 2098
    :cond_1
    return-void
.end method

.method private isAlive()Z
    .locals 1

    .line 2102
    iget-object v0, p0, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->mActivity:Lcom/android/camera/ActivityBase;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private isBeautyPanelShow()Z
    .locals 2

    .line 1284
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xc2

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$MiBeautyProtocol;

    .line 1285
    if-eqz v0, :cond_0

    .line 1286
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$MiBeautyProtocol;->isBeautyPanelShow()Z

    move-result v0

    return v0

    .line 1288
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public static preload()V
    .locals 2

    .line 79
    sget-object v0, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->TAG:Ljava/lang/String;

    const-string v1, "preload"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 80
    return-void
.end method

.method private trackFocusPeakChanged(Z)V
    .locals 3

    .line 2131
    const-string v0, "manual_focus_peak_changed"

    const-string v1, "\u5cf0\u503c\u5bf9\u7126"

    const/4 v2, 0x0

    invoke-static {v0, v1, p1, v2, v2}, Lcom/android/camera/statistic/CameraStatUtil;->trackConfigChange(Ljava/lang/String;Ljava/lang/String;ZZZ)V

    .line 2133
    return-void
.end method

.method private trackGenderAgeChanged(Z)V
    .locals 4

    .line 2121
    const-string v0, "gender_age_changed"

    const-string v1, "\u5e74\u9f84\u68c0\u6d4b"

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-static {v0, v1, p1, v2, v3}, Lcom/android/camera/statistic/CameraStatUtil;->trackConfigChange(Ljava/lang/String;Ljava/lang/String;ZZZ)V

    .line 2123
    return-void
.end method

.method private trackGotoSettings()V
    .locals 1

    .line 858
    iget-object v0, p0, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->mActivity:Lcom/android/camera/ActivityBase;

    invoke-virtual {v0}, Lcom/android/camera/ActivityBase;->getCurrentModule()Lcom/android/camera/module/Module;

    move-result-object v0

    check-cast v0, Lcom/android/camera/module/BaseModule;

    .line 859
    if-eqz v0, :cond_0

    .line 860
    invoke-virtual {v0}, Lcom/android/camera/module/BaseModule;->getModuleIndex()I

    move-result v0

    invoke-static {v0}, Lcom/android/camera/statistic/CameraStatUtil;->trackGotoSettings(I)V

    .line 862
    :cond_0
    return-void
.end method

.method private trackGradienterChanged(Z)V
    .locals 4

    .line 2107
    const-string v0, "gradienter_changed"

    const-string v1, "\u6c34\u5e73\u4eea"

    const/4 v2, 0x1

    const/4 v3, 0x0

    invoke-static {v0, v1, p1, v2, v3}, Lcom/android/camera/statistic/CameraStatUtil;->trackConfigChange(Ljava/lang/String;Ljava/lang/String;ZZZ)V

    .line 2109
    return-void
.end method

.method private trackGroupChanged(Z)V
    .locals 4

    .line 2112
    const-string v0, "group_shot_changed"

    const-string v1, "\u5408\u5f71\u4f18\u9009"

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-static {v0, v1, p1, v2, v3}, Lcom/android/camera/statistic/CameraStatUtil;->trackConfigChange(Ljava/lang/String;Ljava/lang/String;ZZZ)V

    .line 2114
    return-void
.end method

.method private trackHHTChanged(Z)V
    .locals 4

    .line 2117
    const-string v0, "hht_changed"

    const-string v1, "HHT"

    const/4 v2, 0x1

    const/4 v3, 0x0

    invoke-static {v0, v1, p1, v2, v3}, Lcom/android/camera/statistic/CameraStatUtil;->trackConfigChange(Ljava/lang/String;Ljava/lang/String;ZZZ)V

    .line 2118
    return-void
.end method

.method private trackMagicMirrorChanged(Z)V
    .locals 4

    .line 2126
    const-string v0, "magic_mirror_changed"

    const-string v1, "\u9b54\u955c"

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-static {v0, v1, p1, v2, v3}, Lcom/android/camera/statistic/CameraStatUtil;->trackConfigChange(Ljava/lang/String;Ljava/lang/String;ZZZ)V

    .line 2128
    return-void
.end method

.method private trackSuperResolutionChanged(Z)V
    .locals 3

    .line 2136
    const-string v0, "super_resolution_changed"

    const-string v1, "\u8d85\u5206\u8fa8\u7387"

    const/4 v2, 0x0

    invoke-static {v0, v1, p1, v2, v2}, Lcom/android/camera/statistic/CameraStatUtil;->trackConfigChange(Ljava/lang/String;Ljava/lang/String;ZZZ)V

    .line 2138
    return-void
.end method

.method private updateAiScene(Z)V
    .locals 3

    .line 2019
    iget-boolean v0, p0, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->mLastAiSceneStateOn:Z

    if-nez v0, :cond_0

    .line 2020
    return-void

    .line 2022
    :cond_0
    invoke-static {}, Lcom/android/camera/CameraSettings;->getAiSceneOpen()Z

    move-result v0

    .line 2023
    xor-int/lit8 v1, p1, 0x1

    if-ne v0, v1, :cond_1

    .line 2024
    return-void

    .line 2026
    :cond_1
    const/4 v0, 0x1

    xor-int/2addr p1, v0

    invoke-static {p1}, Lcom/android/camera/CameraSettings;->setAiSceneOpen(Z)V

    .line 2028
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 v1, 0xac

    invoke-virtual {p1, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    .line 2029
    new-array v0, v0, [I

    const/4 v1, 0x0

    const/16 v2, 0xc9

    aput v2, v0, v1

    invoke-interface {p1, v0}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->updateConfigItem([I)V

    .line 2030
    return-void
.end method

.method private updateComponentBeauty(Z)V
    .locals 3

    .line 2000
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentMode()I

    move-result v0

    .line 2001
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentConfigBeauty()Lcom/android/camera/data/data/config/ComponentConfigBeauty;

    move-result-object v1

    .line 2002
    invoke-virtual {v1}, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_3

    invoke-virtual {v1, v0}, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->isClosed(I)Z

    move-result v2

    if-ne v2, p1, :cond_0

    goto :goto_0

    .line 2005
    :cond_0
    invoke-virtual {v1, p1, v0}, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->setClosed(ZI)V

    .line 2006
    invoke-static {}, Lcom/android/camera/CameraSettings;->isSupportBeautyBody()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 2007
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentConfigBeautyBody()Lcom/android/camera/data/data/config/ComponentConfigBeautyBody;

    move-result-object v0

    .line 2008
    invoke-virtual {v0}, Lcom/android/camera/data/data/config/ComponentConfigBeautyBody;->isClosed()Z

    move-result v1

    if-ne v1, p1, :cond_1

    .line 2009
    return-void

    .line 2011
    :cond_1
    invoke-virtual {v0, p1}, Lcom/android/camera/data/data/config/ComponentConfigBeautyBody;->setClosed(Z)V

    .line 2013
    :cond_2
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 v0, 0xaf

    invoke-virtual {p1, v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;

    .line 2014
    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->updateTipImage()V

    .line 2015
    return-void

    .line 2003
    :cond_3
    :goto_0
    return-void
.end method

.method private updateComponentFilter(Z)V
    .locals 5

    .line 1977
    sget-object v0, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "updateComponentFilter: close = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1978
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/runing/DataItemRunning;->getComponentConfigFilter()Lcom/android/camera/data/data/config/ComponentConfigFilter;

    move-result-object v0

    .line 1979
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentMode()I

    move-result v1

    .line 1980
    invoke-virtual {v0, p1, v1}, Lcom/android/camera/data/data/config/ComponentConfigFilter;->setClosed(ZI)V

    .line 1983
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xac

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    .line 1984
    const/4 v1, 0x1

    new-array v2, v1, [I

    const/4 v3, 0x0

    const/16 v4, 0xc4

    aput v4, v2, v3

    invoke-interface {v0, v2}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->updateConfigItem([I)V

    .line 1987
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v2, 0xa2

    invoke-virtual {v0, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;

    .line 1988
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;->isShowFilterView()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1989
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;->filterUiChange()V

    .line 1990
    if-eqz p1, :cond_0

    .line 1991
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;->showOrHideFilterView()Z

    .line 1992
    invoke-static {}, Lcom/android/camera/Util;->UI_DEBUG()Z

    move-result p1

    if-nez p1, :cond_0

    .line 1993
    invoke-virtual {p0, v1, v3}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->showCloseTip(IZ)V

    .line 1997
    :cond_0
    return-void
.end method

.method private updateComponentFlash(Ljava/lang/String;Z)V
    .locals 3

    .line 1941
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentFlash()Lcom/android/camera/data/data/config/ComponentConfigFlash;

    move-result-object v0

    .line 1942
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentMode()I

    move-result v1

    .line 1943
    invoke-virtual {v0}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_2

    .line 1944
    invoke-virtual {v0}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->isClosed()Z

    move-result v2

    if-ne v2, p2, :cond_0

    goto :goto_0

    .line 1949
    :cond_0
    if-eqz p2, :cond_1

    .line 1950
    invoke-virtual {v0, v1}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->getComponentValue(I)Ljava/lang/String;

    move-result-object v1

    const-string v2, "2"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    const-string v1, "d"

    .line 1951
    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 1953
    return-void

    .line 1956
    :cond_1
    invoke-virtual {v0, p2}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->setClosed(Z)V

    .line 1958
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 p2, 0xac

    invoke-virtual {p1, p2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    .line 1959
    const/4 p2, 0x1

    new-array p2, p2, [I

    const/4 v0, 0x0

    const/16 v1, 0xc1

    aput v1, p2, v0

    invoke-interface {p1, p2}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->updateConfigItem([I)V

    .line 1960
    return-void

    .line 1945
    :cond_2
    :goto_0
    return-void
.end method

.method private updateComponentHdr(Z)V
    .locals 3

    .line 1963
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentHdr()Lcom/android/camera/data/data/config/ComponentConfigHdr;

    move-result-object v0

    .line 1964
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentMode()I

    .line 1965
    invoke-virtual {v0}, Lcom/android/camera/data/data/config/ComponentConfigHdr;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1

    .line 1966
    invoke-virtual {v0}, Lcom/android/camera/data/data/config/ComponentConfigHdr;->isClosed()Z

    move-result v1

    if-ne v1, p1, :cond_0

    goto :goto_0

    .line 1970
    :cond_0
    invoke-virtual {v0, p1}, Lcom/android/camera/data/data/config/ComponentConfigHdr;->setClosed(Z)V

    .line 1972
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 v0, 0xac

    invoke-virtual {p1, v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    .line 1973
    const/4 v0, 0x1

    new-array v0, v0, [I

    const/4 v1, 0x0

    const/16 v2, 0xc2

    aput v2, v0, v1

    invoke-interface {p1, v0}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->updateConfigItem([I)V

    .line 1974
    return-void

    .line 1967
    :cond_1
    :goto_0
    return-void
.end method

.method private updateFlashModeAndRefreshUI(Lcom/android/camera/module/BaseModule;Ljava/lang/String;)V
    .locals 4

    .line 204
    invoke-virtual {p1}, Lcom/android/camera/module/BaseModule;->getModuleIndex()I

    move-result v0

    .line 205
    sget-object v1, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "updateFlashModeAndRefreshUI flashMode = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 206
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 207
    invoke-static {v0, p2}, Lcom/android/camera/CameraSettings;->setFlashMode(ILjava/lang/String;)V

    .line 210
    :cond_0
    const-string v0, "0"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_2

    .line 211
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontCamera()Z

    move-result p2

    if-eqz p2, :cond_1

    .line 212
    iget-object p2, p0, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->mActivity:Lcom/android/camera/ActivityBase;

    const v0, 0x7f090226

    invoke-static {p2, v0}, Lcom/android/camera/ToastUtils;->showToast(Landroid/content/Context;I)V

    goto :goto_0

    .line 214
    :cond_1
    iget-object p2, p0, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->mActivity:Lcom/android/camera/ActivityBase;

    const v0, 0x7f090227

    invoke-static {p2, v0}, Lcom/android/camera/ToastUtils;->showToast(Landroid/content/Context;I)V

    .line 219
    :cond_2
    :goto_0
    const/4 p2, 0x1

    new-array v0, p2, [I

    const/16 v1, 0xa

    const/4 v2, 0x0

    aput v1, v0, v2

    invoke-virtual {p1, v0}, Lcom/android/camera/module/BaseModule;->updatePreferenceInWorkThread([I)V

    .line 221
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 v0, 0xac

    .line 222
    invoke-virtual {p1, v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    .line 223
    if-eqz p1, :cond_3

    .line 224
    new-array p2, p2, [I

    const/16 v0, 0xc1

    aput v0, p2, v2

    invoke-interface {p1, p2}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->updateConfigItem([I)V

    .line 226
    :cond_3
    return-void
.end method

.method private updateLiveShot(Z)V
    .locals 3

    .line 2040
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->fC()Z

    move-result v0

    if-nez v0, :cond_0

    .line 2041
    return-void

    .line 2044
    :cond_0
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentMode()I

    move-result v0

    .line 2045
    const/16 v1, 0xa3

    if-eq v0, v1, :cond_1

    .line 2046
    return-void

    .line 2049
    :cond_1
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/data/data/runing/DataItemRunning;->getComponentRunningLiveShot()Lcom/android/camera/data/data/runing/ComponentRunningLiveShot;

    move-result-object v1

    .line 2050
    invoke-virtual {v1, v0}, Lcom/android/camera/data/data/runing/ComponentRunningLiveShot;->isClosed(I)Z

    move-result v2

    if-ne v2, p1, :cond_2

    .line 2051
    return-void

    .line 2054
    :cond_2
    invoke-virtual {v1, v0, p1}, Lcom/android/camera/data/data/runing/ComponentRunningLiveShot;->setClosed(IZ)V

    .line 2056
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 v0, 0xac

    invoke-virtual {p1, v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    .line 2058
    const/4 v0, 0x1

    new-array v0, v0, [I

    const/4 v1, 0x0

    const/16 v2, 0xce

    aput v2, v0, v1

    invoke-interface {p1, v0}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->updateConfigItem([I)V

    .line 2059
    return-void
.end method

.method private updateTipMessage(III)V
    .locals 2
    .param p2    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param

    .line 2088
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xaf

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;

    .line 2089
    invoke-interface {v0, p1, p2, p3}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->showTips(III)V

    .line 2090
    return-void
.end method


# virtual methods
.method public varargs closeMutexElement(Ljava/lang/String;[I)V
    .locals 6

    .line 1834
    array-length v0, p2

    new-array v0, v0, [I

    .line 1835
    iput-object p2, p0, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->mRecordingMutexElements:[I

    .line 1836
    nop

    .line 1837
    const/4 v1, 0x0

    move v2, v1

    :goto_0
    array-length v3, p2

    if-ge v1, v3, :cond_5

    .line 1838
    aget v3, p2, v1

    const/16 v4, 0xc4

    const/4 v5, 0x1

    if-eq v3, v4, :cond_4

    const/16 v4, 0xc9

    if-eq v3, v4, :cond_3

    const/16 v4, 0xce

    if-eq v3, v4, :cond_2

    const/16 v4, 0xef

    if-eq v3, v4, :cond_1

    const/16 v4, 0xfb

    if-eq v3, v4, :cond_0

    packed-switch v3, :pswitch_data_0

    .line 1871
    new-instance p1, Ljava/lang/RuntimeException;

    const-string p2, "unknown mutex element"

    invoke-direct {p1, p2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 1844
    :pswitch_0
    invoke-direct {p0, v5}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->updateComponentHdr(Z)V

    .line 1845
    const/16 v3, 0xb

    aput v3, v0, v1

    .line 1846
    goto :goto_1

    .line 1840
    :pswitch_1
    invoke-direct {p0, p1, v5}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->updateComponentFlash(Ljava/lang/String;Z)V

    .line 1841
    const/16 v3, 0xa

    aput v3, v0, v1

    .line 1842
    goto :goto_1

    .line 1867
    :cond_0
    invoke-direct {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->closeComponentUltraPixelFront()Z

    move-result v2

    .line 1868
    const/16 v3, 0x32

    aput v3, v0, v1

    .line 1869
    goto :goto_1

    .line 1853
    :cond_1
    invoke-direct {p0, v5}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->updateComponentBeauty(Z)V

    .line 1854
    const/16 v3, 0xd

    aput v3, v0, v1

    .line 1855
    goto :goto_1

    .line 1862
    :cond_2
    invoke-direct {p0, v5}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->updateLiveShot(Z)V

    .line 1863
    const/16 v3, 0x31

    aput v3, v0, v1

    .line 1864
    goto :goto_1

    .line 1857
    :cond_3
    invoke-direct {p0, v5}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->updateAiScene(Z)V

    .line 1858
    const/16 v3, 0x24

    aput v3, v0, v1

    .line 1859
    goto :goto_1

    .line 1848
    :cond_4
    invoke-direct {p0, v5}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->updateComponentFilter(Z)V

    .line 1849
    const/4 v3, 0x2

    aput v3, v0, v1

    .line 1850
    nop

    .line 1837
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1875
    :cond_5
    invoke-direct {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->getBaseModule()Lcom/android/camera/module/BaseModule;

    move-result-object p1

    .line 1877
    if-eqz p1, :cond_6

    .line 1878
    invoke-virtual {p1, v0}, Lcom/android/camera/module/BaseModule;->updatePreferenceTrampoline([I)V

    .line 1879
    invoke-virtual {p1}, Lcom/android/camera/module/BaseModule;->getCameraDevice()Lcom/android/camera2/Camera2Proxy;

    move-result-object p2

    invoke-virtual {p2}, Lcom/android/camera2/Camera2Proxy;->resumePreview()V

    .line 1880
    if-eqz v2, :cond_6

    .line 1881
    invoke-virtual {p1}, Lcom/android/camera/module/BaseModule;->restartModule()V

    .line 1884
    :cond_6
    return-void

    :pswitch_data_0
    .packed-switch 0xc1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public configBeautySwitch(I)V
    .locals 9

    .line 1586
    invoke-direct {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->getBaseModule()Lcom/android/camera/module/BaseModule;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/module/BaseModule;->getModuleIndex()I

    move-result p1

    .line 1587
    nop

    .line 1588
    nop

    .line 1589
    const/16 v0, 0xa2

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eq p1, v0, :cond_0

    packed-switch p1, :pswitch_data_0

    .line 1599
    move v3, v1

    goto :goto_0

    .line 1594
    :cond_0
    :pswitch_0
    nop

    .line 1595
    nop

    .line 1599
    move v3, v2

    :goto_0
    const/16 v4, 0xa3

    const/16 v5, 0xa1

    if-eq p1, v4, :cond_1

    const/16 v4, 0xa5

    if-eq p1, v4, :cond_1

    const/16 v4, 0xab

    if-eq p1, v4, :cond_1

    if-eq p1, v5, :cond_1

    if-nez v3, :cond_1

    .line 1604
    return-void

    .line 1607
    :cond_1
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentConfigBeauty()Lcom/android/camera/data/data/config/ComponentConfigBeauty;

    move-result-object v4

    .line 1608
    invoke-virtual {v4, p1}, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->getNextValue(I)Ljava/lang/String;

    move-result-object v6

    .line 1609
    sget-object v7, Lcom/android/camera/constant/BeautyConstant;->LEVEL_CLOSE:Ljava/lang/String;

    invoke-virtual {v4, p1}, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->getComponentValue(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    .line 1610
    xor-int/2addr v7, v2

    sget-object v8, Lcom/android/camera/constant/BeautyConstant;->LEVEL_CLOSE:Ljava/lang/String;

    invoke-virtual {v8, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    .line 1611
    xor-int/2addr v8, v2

    xor-int/2addr v7, v8

    .line 1612
    invoke-virtual {v4, p1, v6}, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->setComponentValue(ILjava/lang/String;)V

    .line 1613
    invoke-static {p1, v6}, Lcom/android/camera/statistic/CameraStatUtil;->trackBeautySwitchChanged(ILjava/lang/String;)V

    .line 1615
    const/4 v4, 0x2

    if-eqz v7, :cond_3

    if-eqz v3, :cond_3

    .line 1616
    if-eq p1, v0, :cond_2

    .line 1617
    invoke-static {}, Lcom/android/camera/data/DataRepository;->provider()Lcom/android/camera/data/provider/DataProvider;

    move-result-object p1

    invoke-interface {p1}, Lcom/android/camera/data/provider/DataProvider;->dataGlobal()Lcom/android/camera/data/provider/DataProvider$ProviderEvent;

    move-result-object p1

    check-cast p1, Lcom/android/camera/data/data/global/DataItemGlobal;

    .line 1618
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v3

    .line 1620
    const-string v5, "pref_video_speed_fast_key"

    invoke-virtual {v3, v5}, Lcom/android/camera/data/data/runing/DataItemRunning;->switchOff(Ljava/lang/String;)V

    .line 1621
    const-string v5, "pref_video_speed_slow_key"

    invoke-virtual {v3, v5}, Lcom/android/camera/data/data/runing/DataItemRunning;->switchOff(Ljava/lang/String;)V

    .line 1622
    const-string v5, "pref_video_speed_hfr_key"

    invoke-virtual {v3, v5}, Lcom/android/camera/data/data/runing/DataItemRunning;->switchOff(Ljava/lang/String;)V

    .line 1623
    const-string v5, "pref_camera_auto_zoom"

    invoke-virtual {v3, v5}, Lcom/android/camera/data/data/runing/DataItemRunning;->switchOff(Ljava/lang/String;)V

    .line 1625
    invoke-virtual {p1, v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->setCurrentMode(I)V

    .line 1626
    invoke-static {}, Lcom/android/camera/data/DataRepository;->getInstance()Lcom/android/camera/data/DataRepository;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/data/DataRepository;->backUp()Lcom/android/camera/data/backup/DataBackUp;

    move-result-object p1

    invoke-interface {p1}, Lcom/android/camera/data/backup/DataBackUp;->removeOtherVideoMode()V

    .line 1627
    const-string p1, "normal"

    invoke-static {p1}, Lcom/android/camera/statistic/CameraStatUtil;->trackVideoModeChanged(Ljava/lang/String;)V

    .line 1629
    :cond_2
    iget-object p1, p0, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->mActivity:Lcom/android/camera/ActivityBase;

    invoke-static {v0}, Lcom/android/camera/module/loader/StartControl;->create(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object v0

    .line 1630
    invoke-virtual {v0, v4}, Lcom/android/camera/module/loader/StartControl;->setViewConfigType(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object v0

    .line 1631
    invoke-virtual {v0, v2}, Lcom/android/camera/module/loader/StartControl;->setNeedBlurAnimation(Z)Lcom/android/camera/module/loader/StartControl;

    move-result-object v0

    .line 1632
    invoke-virtual {v0, v1}, Lcom/android/camera/module/loader/StartControl;->setNeedReConfigureData(Z)Lcom/android/camera/module/loader/StartControl;

    move-result-object v0

    .line 1633
    invoke-virtual {v0, v2}, Lcom/android/camera/module/loader/StartControl;->setNeedReConfigureCamera(Z)Lcom/android/camera/module/loader/StartControl;

    move-result-object v0

    .line 1629
    invoke-virtual {p1, v0}, Lcom/android/camera/ActivityBase;->onModeSelected(Lcom/android/camera/module/loader/StartControl;)V

    goto :goto_1

    .line 1634
    :cond_3
    if-eqz v7, :cond_4

    if-ne p1, v5, :cond_4

    .line 1635
    iget-object p1, p0, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->mActivity:Lcom/android/camera/ActivityBase;

    invoke-static {v5}, Lcom/android/camera/module/loader/StartControl;->create(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object v0

    .line 1636
    invoke-virtual {v0, v4}, Lcom/android/camera/module/loader/StartControl;->setViewConfigType(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object v0

    .line 1637
    invoke-virtual {v0, v2}, Lcom/android/camera/module/loader/StartControl;->setNeedBlurAnimation(Z)Lcom/android/camera/module/loader/StartControl;

    move-result-object v0

    .line 1638
    invoke-virtual {v0, v1}, Lcom/android/camera/module/loader/StartControl;->setNeedReConfigureData(Z)Lcom/android/camera/module/loader/StartControl;

    move-result-object v0

    .line 1639
    invoke-virtual {v0, v2}, Lcom/android/camera/module/loader/StartControl;->setNeedReConfigureCamera(Z)Lcom/android/camera/module/loader/StartControl;

    move-result-object v0

    .line 1635
    invoke-virtual {p1, v0}, Lcom/android/camera/ActivityBase;->onModeSelected(Lcom/android/camera/module/loader/StartControl;)V

    goto :goto_1

    .line 1641
    :cond_4
    invoke-direct {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->getBaseModule()Lcom/android/camera/module/BaseModule;

    move-result-object p1

    new-array v0, v2, [I

    const/16 v2, 0xd

    aput v2, v0, v1

    invoke-virtual {p1, v0}, Lcom/android/camera/module/BaseModule;->updatePreferenceInWorkThread([I)V

    .line 1643
    :goto_1
    return-void

    :pswitch_data_0
    .packed-switch 0xa8
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public configDualWaterMarkSwitch()V
    .locals 3

    .line 1566
    invoke-static {}, Lcom/android/camera/CameraSettings;->isDualCameraWaterMarkOpen()Z

    move-result v0

    .line 1567
    xor-int/lit8 v1, v0, 0x1

    invoke-static {v1}, Lcom/android/camera/statistic/CameraStatUtil;->trackDualWaterMarkChanged(Z)V

    .line 1569
    const v1, 0x7f0901bd

    if-eqz v0, :cond_0

    .line 1570
    invoke-direct {p0, v1}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->hideTipMessage(I)V

    .line 1572
    const/4 v0, 0x0

    invoke-static {v0}, Lcom/android/camera/CameraSettings;->setDualCameraWaterMarkOpen(Z)V

    goto :goto_0

    .line 1574
    :cond_0
    const/4 v0, 0x4

    const/4 v2, 0x2

    invoke-direct {p0, v0, v1, v2}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->updateTipMessage(III)V

    .line 1577
    const/4 v0, 0x1

    invoke-static {v0}, Lcom/android/camera/CameraSettings;->setDualCameraWaterMarkOpen(Z)V

    .line 1581
    :goto_0
    invoke-direct {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->getBaseModule()Lcom/android/camera/module/BaseModule;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/module/BaseModule;->onSharedPreferenceChanged()V

    .line 1582
    return-void
.end method

.method public configFPS960()V
    .locals 5

    .line 1796
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    .line 1797
    invoke-virtual {v0}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentConfigSlowMotion()Lcom/android/camera/data/data/config/ComponentConfigSlowMotion;

    move-result-object v0

    .line 1799
    const/16 v1, 0xac

    invoke-virtual {v0, v1}, Lcom/android/camera/data/data/config/ComponentConfigSlowMotion;->getNextValue(I)Ljava/lang/String;

    move-result-object v2

    .line 1800
    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/config/ComponentConfigSlowMotion;->setComponentValue(ILjava/lang/String;)V

    .line 1801
    iget-object v0, p0, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->mActivity:Lcom/android/camera/ActivityBase;

    invoke-static {v1}, Lcom/android/camera/module/loader/StartControl;->create(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object v1

    .line 1802
    const/4 v3, 0x2

    invoke-virtual {v1, v3}, Lcom/android/camera/module/loader/StartControl;->setViewConfigType(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object v1

    .line 1803
    const/4 v3, 0x1

    invoke-virtual {v1, v3}, Lcom/android/camera/module/loader/StartControl;->setNeedBlurAnimation(Z)Lcom/android/camera/module/loader/StartControl;

    move-result-object v1

    .line 1804
    const/4 v4, 0x0

    invoke-virtual {v1, v4}, Lcom/android/camera/module/loader/StartControl;->setNeedReConfigureData(Z)Lcom/android/camera/module/loader/StartControl;

    move-result-object v1

    .line 1805
    invoke-virtual {v1, v3}, Lcom/android/camera/module/loader/StartControl;->setNeedReConfigureCamera(Z)Lcom/android/camera/module/loader/StartControl;

    move-result-object v1

    .line 1801
    invoke-virtual {v0, v1}, Lcom/android/camera/ActivityBase;->onModeSelected(Lcom/android/camera/module/loader/StartControl;)V

    .line 1807
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 1808
    const-string v1, "\u5e27\u7387\u5207\u6362"

    invoke-static {v2}, Lcom/android/camera/statistic/CameraStatUtil;->slowMotionConfigToName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1809
    const-string v1, "counter"

    const-string v3, "slow_motion_mode"

    invoke-static {v1, v3, v0}, Lcom/android/camera/statistic/CameraStat;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 1812
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xaf

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;

    .line 1813
    if-eqz v0, :cond_1

    .line 1814
    const-string v1, "slow_motion_960"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1815
    const/16 v1, 0x9

    const v2, 0x7f090224

    const/4 v3, 0x4

    invoke-interface {v0, v1, v2, v3}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->showTips(III)V

    goto :goto_0

    .line 1818
    :cond_0
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->hideTipImage()V

    .line 1822
    :cond_1
    :goto_0
    return-void
.end method

.method public configFlash(Ljava/lang/String;)V
    .locals 1

    .line 1111
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isVideoNewSlowMotion()Z

    move-result p1

    if-nez p1, :cond_0

    .line 1113
    invoke-direct {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->conflictWithFlashAndHdr()V

    .line 1115
    :cond_0
    invoke-direct {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->getBaseModule()Lcom/android/camera/module/BaseModule;

    move-result-object p1

    .line 1121
    const/4 v0, 0x2

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    invoke-virtual {p1, v0}, Lcom/android/camera/module/BaseModule;->updatePreferenceInWorkThread([I)V

    .line 1122
    return-void

    nop

    :array_0
    .array-data 4
        0xb
        0xa
    .end array-data
.end method

.method public configFocusPeakSwitch(I)V
    .locals 2

    .line 1552
    const-string v0, "pref_camera_peak_key"

    invoke-direct {p0, p1, v0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->getState(ILjava/lang/String;)Z

    move-result v0

    .line 1553
    const/4 v1, 0x1

    if-ne v1, p1, :cond_0

    .line 1554
    invoke-direct {p0, v0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->trackFocusPeakChanged(Z)V

    .line 1557
    :cond_0
    if-nez v0, :cond_1

    .line 1558
    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object p1

    invoke-virtual {p1, v0}, Lcom/android/camera/effect/EffectController;->setDrawPeaking(Z)V

    goto :goto_0

    .line 1559
    :cond_1
    const-string p1, "manual"

    invoke-static {}, Lcom/android/camera/CameraSettings;->getFocusMode()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2

    .line 1560
    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object p1

    invoke-virtual {p1, v0}, Lcom/android/camera/effect/EffectController;->setDrawPeaking(Z)V

    .line 1562
    :cond_2
    :goto_0
    return-void
.end method

.method public configGenderAgeSwitch(I)V
    .locals 5

    .line 1521
    const-string v0, "pref_camera_show_gender_age_key"

    invoke-direct {p0, p1, v0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->getState(ILjava/lang/String;)Z

    move-result v0

    .line 1522
    const/4 v1, 0x1

    if-ne v1, p1, :cond_0

    .line 1523
    invoke-direct {p0, v0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->trackGenderAgeChanged(Z)V

    .line 1527
    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 v2, 0xa6

    .line 1528
    invoke-virtual {p1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    .line 1529
    invoke-interface {p1, v0}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->setShowGenderAndAge(Z)V

    .line 1531
    invoke-direct {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->getBaseModule()Lcom/android/camera/module/BaseModule;

    move-result-object p1

    new-array v2, v1, [I

    const/16 v3, 0x26

    const/4 v4, 0x0

    aput v3, v2, v4

    invoke-virtual {p1, v2}, Lcom/android/camera/module/BaseModule;->updatePreferenceInWorkThread([I)V

    .line 1534
    if-eqz v0, :cond_2

    .line 1535
    invoke-direct {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->getBaseModule()Lcom/android/camera/module/BaseModule;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/module/BaseModule;->getCameraDevice()Lcom/android/camera2/Camera2Proxy;

    move-result-object p1

    .line 1536
    if-eqz p1, :cond_1

    .line 1538
    invoke-direct {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->getBaseModule()Lcom/android/camera/module/BaseModule;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/module/BaseModule;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v2, 0x7f090148

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 1539
    invoke-virtual {p1, v1}, Lcom/android/camera2/Camera2Proxy;->setFaceWaterMarkEnable(Z)V

    .line 1540
    invoke-virtual {p1, v0}, Lcom/android/camera2/Camera2Proxy;->setFaceWaterMarkFormat(Ljava/lang/String;)V

    .line 1542
    :cond_1
    goto :goto_0

    .line 1543
    :cond_2
    invoke-direct {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->getBaseModule()Lcom/android/camera/module/BaseModule;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/module/BaseModule;->getCameraDevice()Lcom/android/camera2/Camera2Proxy;

    move-result-object p1

    .line 1544
    if-eqz p1, :cond_3

    .line 1545
    invoke-virtual {p1, v4}, Lcom/android/camera2/Camera2Proxy;->setFaceWaterMarkEnable(Z)V

    .line 1548
    :cond_3
    :goto_0
    return-void
.end method

.method public configGradienterSwitch(I)V
    .locals 2

    .line 1141
    const-string v0, "pref_camera_gradienter_key"

    invoke-direct {p0, p1, v0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->getState(ILjava/lang/String;)Z

    move-result v0

    .line 1142
    const/4 v1, 0x1

    if-ne v1, p1, :cond_0

    .line 1143
    invoke-direct {p0, v0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->trackGradienterChanged(Z)V

    .line 1145
    :cond_0
    invoke-direct {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->getBaseModule()Lcom/android/camera/module/BaseModule;

    move-result-object p1

    check-cast p1, Lcom/android/camera/module/Camera2Module;

    invoke-virtual {p1, v0}, Lcom/android/camera/module/Camera2Module;->onGradienterSwitched(Z)V

    .line 1146
    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object p1

    invoke-virtual {p1, v0}, Lcom/android/camera/effect/EffectController;->setDrawGradienter(Z)V

    .line 1147
    return-void
.end method

.method public configGroupSwitch(I)V
    .locals 3

    .line 1252
    const-string v0, "pref_camera_groupshot_mode_key"

    invoke-direct {p0, p1, v0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->getState(ILjava/lang/String;)Z

    move-result v0

    .line 1253
    const/4 v1, 0x1

    if-ne v1, p1, :cond_0

    .line 1254
    invoke-direct {p0, v0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->trackGroupChanged(Z)V

    .line 1257
    :cond_0
    invoke-direct {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->getBaseModule()Lcom/android/camera/module/BaseModule;

    move-result-object p1

    check-cast p1, Lcom/android/camera/module/Camera2Module;

    .line 1258
    const v1, 0x7f0901b9

    if-eqz v0, :cond_2

    .line 1259
    invoke-direct {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->isBeautyPanelShow()Z

    move-result v0

    .line 1260
    const/4 v2, 0x4

    if-nez v0, :cond_1

    .line 1261
    const/4 v0, 0x2

    invoke-direct {p0, v2, v1, v0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->updateTipMessage(III)V

    .line 1266
    :cond_1
    const-string v0, "b"

    new-array v1, v2, [I

    fill-array-data v1, :array_0

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->closeMutexElement(Ljava/lang/String;[I)V

    .line 1271
    goto :goto_0

    .line 1272
    :cond_2
    const-string v0, "b"

    invoke-virtual {p0, v0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->restoreAllMutexElement(Ljava/lang/String;)V

    .line 1275
    invoke-direct {p0, v1}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->hideTipMessage(I)V

    .line 1277
    :goto_0
    invoke-virtual {p1}, Lcom/android/camera/module/Camera2Module;->onSharedPreferenceChanged()V

    .line 1278
    invoke-direct {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->getBaseModule()Lcom/android/camera/module/BaseModule;

    move-result-object p1

    const/4 v0, 0x3

    new-array v0, v0, [I

    fill-array-data v0, :array_1

    invoke-virtual {p1, v0}, Lcom/android/camera/module/BaseModule;->updatePreferenceInWorkThread([I)V

    .line 1280
    return-void

    :array_0
    .array-data 4
        0xc1
        0xc2
        0xc4
        0xc9
    .end array-data

    :array_1
    .array-data 4
        0x2a
        0x22
        0x1e
    .end array-data
.end method

.method public configHHTSwitch(I)V
    .locals 3

    .line 1151
    const-string v0, "pref_camera_hand_night_key"

    invoke-direct {p0, p1, v0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->getState(ILjava/lang/String;)Z

    move-result v0

    .line 1152
    const/4 v1, 0x1

    if-ne v1, p1, :cond_0

    .line 1153
    invoke-direct {p0, v0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->trackHHTChanged(Z)V

    .line 1156
    :cond_0
    invoke-direct {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->getBaseModule()Lcom/android/camera/module/BaseModule;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/module/BaseModule;->getMutexModePicker()Lcom/android/camera/MutexModeManager;

    move-result-object p1

    .line 1157
    const v1, 0x7f0901ba

    if-eqz v0, :cond_1

    .line 1158
    const/4 v0, 0x4

    const/4 v2, 0x2

    invoke-direct {p0, v0, v1, v2}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->updateTipMessage(III)V

    .line 1161
    const-string v0, "a"

    new-array v1, v2, [I

    fill-array-data v1, :array_0

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->closeMutexElement(Ljava/lang/String;[I)V

    .line 1163
    const/4 v0, 0x3

    invoke-virtual {p1, v0}, Lcom/android/camera/MutexModeManager;->setMutexModeMandatory(I)V

    goto :goto_0

    .line 1165
    :cond_1
    invoke-direct {p0, v1}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->hideTipMessage(I)V

    .line 1166
    invoke-virtual {p1}, Lcom/android/camera/MutexModeManager;->clearMandatoryFlag()V

    .line 1167
    invoke-direct {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->getBaseModule()Lcom/android/camera/module/BaseModule;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/module/BaseModule;->resetMutexModeManually()V

    .line 1168
    const-string p1, "a"

    invoke-virtual {p0, p1}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->restoreAllMutexElement(Ljava/lang/String;)V

    .line 1172
    :goto_0
    return-void

    :array_0
    .array-data 4
        0xc1
        0xc2
    .end array-data
.end method

.method public configHdr(Ljava/lang/String;)V
    .locals 2

    .line 1126
    invoke-direct {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->conflictWithFlashAndHdr()V

    .line 1127
    invoke-direct {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->getBaseModule()Lcom/android/camera/module/BaseModule;

    move-result-object v0

    .line 1132
    const/4 v1, 0x2

    new-array v1, v1, [I

    fill-array-data v1, :array_0

    invoke-virtual {v0, v1}, Lcom/android/camera/module/BaseModule;->updatePreferenceInWorkThread([I)V

    .line 1133
    const-string v0, "off"

    if-eq v0, p1, :cond_0

    invoke-static {}, Lcom/android/camera/CameraSettings;->isRearMenuUltraPixelPhotographyOn()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 1135
    const/4 p1, 0x3

    invoke-direct {p0, p1}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->configSwitchMenuUltraPixelPhotography(I)V

    .line 1137
    :cond_0
    return-void

    nop

    :array_0
    .array-data 4
        0xb
        0xa
    .end array-data
.end method

.method public configLiveShotSwitch(I)V
    .locals 5

    .line 1647
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->fC()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1648
    return-void

    .line 1651
    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xac

    .line 1652
    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    .line 1653
    if-nez v0, :cond_1

    .line 1654
    return-void

    .line 1657
    :cond_1
    invoke-direct {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->getBaseModule()Lcom/android/camera/module/BaseModule;

    move-result-object v1

    .line 1658
    if-eqz v1, :cond_7

    invoke-virtual {v1}, Lcom/android/camera/module/BaseModule;->getModuleIndex()I

    move-result v2

    const/16 v3, 0xa3

    if-eq v2, v3, :cond_2

    goto :goto_1

    .line 1662
    :cond_2
    check-cast v1, Lcom/android/camera/module/Camera2Module;

    .line 1663
    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eq p1, v3, :cond_3

    packed-switch p1, :pswitch_data_0

    goto :goto_0

    .line 1690
    :pswitch_0
    invoke-static {}, Lcom/android/camera/CameraSettings;->isLiveShotOn()Z

    move-result p1

    if-eqz p1, :cond_6

    .line 1691
    invoke-static {v2}, Lcom/android/camera/CameraSettings;->setLiveShotOn(Z)V

    .line 1692
    invoke-virtual {v1, v2}, Lcom/android/camera/module/Camera2Module;->stopLiveShot(Z)V

    goto :goto_0

    .line 1665
    :cond_3
    invoke-static {}, Lcom/android/camera/CameraSettings;->isLiveShotOn()Z

    move-result p1

    .line 1666
    xor-int/lit8 v4, p1, 0x1

    invoke-static {v4}, Lcom/android/camera/CameraSettings;->setLiveShotOn(Z)V

    .line 1667
    if-eqz p1, :cond_4

    .line 1668
    invoke-virtual {v1, v2}, Lcom/android/camera/module/Camera2Module;->stopLiveShot(Z)V

    .line 1669
    const p1, 0x7f090242

    invoke-interface {v0, v3, p1}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->alertSwitchHint(II)V

    goto :goto_0

    .line 1671
    :cond_4
    invoke-static {}, Lcom/android/camera/CameraSettings;->isRearMenuUltraPixelPhotographyOn()Z

    move-result p1

    if-nez p1, :cond_5

    .line 1672
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontMenuUltraPixelPhotographyOn()Z

    move-result p1

    if-nez p1, :cond_5

    .line 1673
    invoke-virtual {v1}, Lcom/android/camera/module/Camera2Module;->startLiveShot()V

    .line 1674
    const p1, 0x7f090241

    invoke-interface {v0, v3, p1}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->alertSwitchHint(II)V

    goto :goto_0

    .line 1682
    :cond_5
    sget-object p1, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->TAG:Ljava/lang/String;

    const-string v1, "Ignore #startLiveShot in ultra pixel photography mode"

    invoke-static {p1, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1685
    nop

    .line 1704
    :cond_6
    :goto_0
    new-array p1, v3, [I

    const/16 v1, 0xce

    aput v1, p1, v2

    invoke-interface {v0, p1}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->updateConfigItem([I)V

    .line 1705
    return-void

    .line 1659
    :cond_7
    :goto_1
    return-void

    :pswitch_data_0
    .packed-switch 0x3
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public configMagicFocusSwitch()V
    .locals 2

    .line 1245
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    const-string v1, "pref_camera_ubifocus_key"

    invoke-virtual {v0, v1}, Lcom/android/camera/data/data/runing/DataItemRunning;->triggerSwitchAndGet(Ljava/lang/String;)Z

    move-result v0

    .line 1247
    invoke-direct {p0, v0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->trackMagicMirrorChanged(Z)V

    .line 1248
    return-void
.end method

.method public configMagicMirrorSwitch(I)V
    .locals 5

    .line 1479
    const-string v0, "pref_camera_magic_mirror_key"

    invoke-direct {p0, p1, v0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->getState(ILjava/lang/String;)Z

    move-result v0

    .line 1480
    const/4 v1, 0x1

    if-ne v1, p1, :cond_0

    .line 1481
    invoke-direct {p0, v0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->trackMagicMirrorChanged(Z)V

    .line 1485
    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 v2, 0xa6

    .line 1486
    invoke-virtual {p1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    .line 1487
    invoke-interface {p1, v0}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->setShowMagicMirror(Z)V

    .line 1489
    invoke-direct {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->getBaseModule()Lcom/android/camera/module/BaseModule;

    move-result-object p1

    new-array v2, v1, [I

    const/16 v3, 0x27

    const/4 v4, 0x0

    aput v3, v2, v4

    invoke-virtual {p1, v2}, Lcom/android/camera/module/BaseModule;->updatePreferenceInWorkThread([I)V

    .line 1491
    if-eqz v0, :cond_2

    .line 1492
    invoke-direct {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->getBaseModule()Lcom/android/camera/module/BaseModule;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/module/BaseModule;->getCameraDevice()Lcom/android/camera2/Camera2Proxy;

    move-result-object p1

    .line 1493
    if-eqz p1, :cond_1

    .line 1495
    invoke-direct {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->getBaseModule()Lcom/android/camera/module/BaseModule;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/module/BaseModule;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v2, 0x7f090149

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 1496
    invoke-virtual {p1, v1}, Lcom/android/camera2/Camera2Proxy;->setFaceWaterMarkEnable(Z)V

    .line 1497
    invoke-virtual {p1, v0}, Lcom/android/camera2/Camera2Proxy;->setFaceWaterMarkFormat(Ljava/lang/String;)V

    .line 1499
    :cond_1
    goto :goto_0

    .line 1500
    :cond_2
    invoke-direct {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->getBaseModule()Lcom/android/camera/module/BaseModule;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/module/BaseModule;->getCameraDevice()Lcom/android/camera2/Camera2Proxy;

    move-result-object p1

    .line 1501
    if-eqz p1, :cond_3

    .line 1502
    invoke-virtual {p1, v4}, Lcom/android/camera2/Camera2Proxy;->setFaceWaterMarkEnable(Z)V

    .line 1505
    :cond_3
    :goto_0
    return-void
.end method

.method public configPortraitSwitch(I)V
    .locals 0

    .line 1516
    invoke-direct {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->getBaseModule()Lcom/android/camera/module/BaseModule;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/module/BaseModule;->onSharedPreferenceChanged()V

    .line 1517
    return-void
.end method

.method public configRawSwitch()V
    .locals 0

    .line 1511
    return-void
.end method

.method public configScene(I)V
    .locals 4

    .line 1294
    const-string v0, "pref_camera_scenemode_setting_key"

    invoke-direct {p0, p1, v0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->getState(ILjava/lang/String;)Z

    move-result v0

    .line 1296
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    const/16 v2, 0xb5

    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v1

    check-cast v1, Lcom/android/camera/protocol/ModeProtocol$ManuallyAdjust;

    .line 1299
    const/4 v2, 0x1

    const/4 v3, 0x2

    if-eqz v0, :cond_0

    .line 1300
    new-instance p1, Lcom/android/camera/module/impl/component/ConfigChangeImpl$1;

    invoke-direct {p1, p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl$1;-><init>(Lcom/android/camera/module/impl/component/ConfigChangeImpl;)V

    invoke-interface {v1, v3, v2, p1}, Lcom/android/camera/protocol/ModeProtocol$ManuallyAdjust;->setManuallyVisible(IILcom/android/camera/fragment/manually/ManuallyListener;)I

    goto :goto_1

    .line 1313
    :cond_0
    nop

    .line 1314
    if-ne p1, v2, :cond_1

    .line 1315
    nop

    .line 1316
    move p1, v3

    goto :goto_0

    :cond_1
    const/4 p1, 0x3

    :goto_0
    const/4 v0, 0x0

    .line 1313
    invoke-interface {v1, v3, p1, v0}, Lcom/android/camera/protocol/ModeProtocol$ManuallyAdjust;->setManuallyVisible(IILcom/android/camera/fragment/manually/ManuallyListener;)I

    .line 1320
    :goto_1
    invoke-direct {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->getBaseModule()Lcom/android/camera/module/BaseModule;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/module/BaseModule;->onSharedPreferenceChanged()V

    .line 1321
    invoke-direct {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->getBaseModule()Lcom/android/camera/module/BaseModule;

    move-result-object p1

    new-array v0, v2, [I

    const/4 v1, 0x0

    const/4 v2, 0x4

    aput v2, v0, v1

    invoke-virtual {p1, v0}, Lcom/android/camera/module/BaseModule;->updatePreferenceInWorkThread([I)V

    .line 1322
    return-void
.end method

.method public configSuperResolutionSwitch(I)V
    .locals 2

    .line 1176
    const-string v0, "pref_camera_super_resolution_key"

    invoke-direct {p0, p1, v0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->getState(ILjava/lang/String;)Z

    move-result v0

    .line 1177
    const/4 v1, 0x1

    if-ne v1, p1, :cond_0

    .line 1178
    invoke-direct {p0, v0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->trackSuperResolutionChanged(Z)V

    .line 1181
    :cond_0
    invoke-direct {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->getBaseModule()Lcom/android/camera/module/BaseModule;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/module/BaseModule;->getMutexModePicker()Lcom/android/camera/MutexModeManager;

    move-result-object p1

    .line 1182
    if-eqz v0, :cond_1

    .line 1183
    const-string v0, "c"

    const/4 v1, 0x2

    new-array v1, v1, [I

    fill-array-data v1, :array_0

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->closeMutexElement(Ljava/lang/String;[I)V

    .line 1185
    const/16 v0, 0xa

    invoke-virtual {p1, v0}, Lcom/android/camera/MutexModeManager;->setMutexModeMandatory(I)V

    goto :goto_0

    .line 1187
    :cond_1
    invoke-virtual {p1}, Lcom/android/camera/MutexModeManager;->clearMandatoryFlag()V

    .line 1188
    invoke-direct {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->getBaseModule()Lcom/android/camera/module/BaseModule;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/module/BaseModule;->resetMutexModeManually()V

    .line 1189
    const-string p1, "c"

    invoke-virtual {p0, p1}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->restoreAllMutexElement(Ljava/lang/String;)V

    .line 1191
    :goto_0
    return-void

    nop

    :array_0
    .array-data 4
        0xc1
        0xc2
    .end array-data
.end method

.method public configTiltSwitch(I)V
    .locals 6

    .line 1195
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    .line 1196
    const-string v1, "pref_camera_tilt_shift_mode"

    invoke-virtual {v0, v1}, Lcom/android/camera/data/data/runing/DataItemRunning;->isSwitchOn(Ljava/lang/String;)Z

    move-result v1

    .line 1197
    invoke-virtual {v0}, Lcom/android/camera/data/data/runing/DataItemRunning;->getComponentRunningTiltValue()Lcom/android/camera/data/data/runing/ComponentRunningTiltValue;

    move-result-object v2

    .line 1198
    const/4 v3, 0x0

    packed-switch p1, :pswitch_data_0

    goto :goto_1

    .line 1200
    :pswitch_0
    nop

    .line 1201
    const-string p1, "pref_camera_tilt_shift_mode"

    invoke-virtual {v0, p1}, Lcom/android/camera/data/data/runing/DataItemRunning;->switchOff(Ljava/lang/String;)V

    .line 1202
    nop

    .line 1229
    :goto_0
    move v1, v3

    goto :goto_1

    .line 1205
    :pswitch_1
    goto :goto_1

    .line 1208
    :pswitch_2
    const/16 p1, 0xa0

    if-nez v1, :cond_0

    .line 1209
    const/4 v1, 0x1

    .line 1210
    const-string v3, "circle"

    invoke-static {v3}, Lcom/android/camera/statistic/CameraStatUtil;->trackTiltShiftChanged(Ljava/lang/String;)V

    .line 1211
    const-string v3, "pref_camera_tilt_shift_mode"

    invoke-virtual {v0, v3}, Lcom/android/camera/data/data/runing/DataItemRunning;->switchOn(Ljava/lang/String;)V

    .line 1212
    const-string v0, "circle"

    invoke-virtual {v2, p1, v0}, Lcom/android/camera/data/data/runing/ComponentRunningTiltValue;->setComponentValue(ILjava/lang/String;)V

    goto :goto_1

    .line 1215
    :cond_0
    const-string v4, "circle"

    .line 1216
    invoke-virtual {v2, p1}, Lcom/android/camera/data/data/runing/ComponentRunningTiltValue;->getComponentValue(I)Ljava/lang/String;

    move-result-object v5

    .line 1215
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 1217
    const-string v0, "parallel"

    invoke-static {v0}, Lcom/android/camera/statistic/CameraStatUtil;->trackTiltShiftChanged(Ljava/lang/String;)V

    .line 1218
    const-string v0, "parallel"

    invoke-virtual {v2, p1, v0}, Lcom/android/camera/data/data/runing/ComponentRunningTiltValue;->setComponentValue(ILjava/lang/String;)V

    goto :goto_1

    .line 1221
    :cond_1
    const-string p1, "off"

    invoke-static {p1}, Lcom/android/camera/statistic/CameraStatUtil;->trackTiltShiftChanged(Ljava/lang/String;)V

    .line 1222
    const-string p1, "pref_camera_tilt_shift_mode"

    invoke-virtual {v0, p1}, Lcom/android/camera/data/data/runing/DataItemRunning;->switchOff(Ljava/lang/String;)V

    .line 1223
    goto :goto_0

    .line 1229
    :goto_1
    invoke-direct {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->getBaseModule()Lcom/android/camera/module/BaseModule;

    move-result-object p1

    check-cast p1, Lcom/android/camera/module/Camera2Module;

    invoke-virtual {p1, v1}, Lcom/android/camera/module/Camera2Module;->onTiltShiftSwitched(Z)V

    .line 1230
    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object p1

    invoke-virtual {p1, v1}, Lcom/android/camera/effect/EffectController;->setDrawTilt(Z)V

    .line 1231
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public configTimerSwitch()V
    .locals 3

    .line 1235
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    .line 1236
    invoke-virtual {v0}, Lcom/android/camera/data/data/runing/DataItemRunning;->getComponentRunningTimer()Lcom/android/camera/data/data/runing/ComponentRunningTimer;

    move-result-object v0

    .line 1237
    invoke-virtual {v0}, Lcom/android/camera/data/data/runing/ComponentRunningTimer;->getNextValue()Ljava/lang/String;

    move-result-object v1

    .line 1239
    invoke-static {v1}, Lcom/android/camera/statistic/CameraStatUtil;->trackTimerChanged(Ljava/lang/String;)V

    .line 1240
    const/16 v2, 0xa0

    invoke-virtual {v0, v2, v1}, Lcom/android/camera/data/data/runing/ComponentRunningTimer;->setComponentValue(ILjava/lang/String;)V

    .line 1241
    return-void
.end method

.method public configVideoFast()V
    .locals 9

    .line 1337
    invoke-static {}, Lcom/android/camera/data/DataRepository;->provider()Lcom/android/camera/data/provider/DataProvider;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider;->dataGlobal()Lcom/android/camera/data/provider/DataProvider$ProviderEvent;

    move-result-object v0

    check-cast v0, Lcom/android/camera/data/data/global/DataItemGlobal;

    .line 1339
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v1

    .line 1340
    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentMode()I

    move-result v2

    .line 1341
    const v3, 0x7f0901bb

    const/4 v4, 0x2

    const/16 v5, 0xa9

    const/4 v6, 0x1

    if-eq v2, v5, :cond_1

    .line 1342
    invoke-virtual {v0, v5}, Lcom/android/camera/data/data/global/DataItemGlobal;->setCurrentMode(I)V

    .line 1343
    const-string v0, "fast"

    invoke-static {v0}, Lcom/android/camera/statistic/CameraStatUtil;->trackVideoModeChanged(Ljava/lang/String;)V

    .line 1346
    const-string v0, "pref_video_speed_slow_key"

    invoke-virtual {v1, v0}, Lcom/android/camera/data/data/runing/DataItemRunning;->switchOff(Ljava/lang/String;)V

    .line 1347
    const-string v0, "pref_video_speed_hfr_key"

    invoke-virtual {v1, v0}, Lcom/android/camera/data/data/runing/DataItemRunning;->switchOff(Ljava/lang/String;)V

    .line 1350
    const-string v0, "pref_camera_auto_zoom"

    invoke-virtual {v1, v0}, Lcom/android/camera/data/data/runing/DataItemRunning;->switchOff(Ljava/lang/String;)V

    .line 1352
    const-string v0, "h"

    new-array v1, v6, [I

    const/16 v7, 0xef

    const/4 v8, 0x0

    aput v7, v1, v8

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->closeMutexElement(Ljava/lang/String;[I)V

    .line 1354
    invoke-static {v2}, Lcom/android/camera/CameraSettings;->isUltraWideConfigOpen(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1355
    invoke-static {v2, v8}, Lcom/android/camera/CameraSettings;->setUltraWideConfig(IZ)V

    .line 1358
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->mActivity:Lcom/android/camera/ActivityBase;

    invoke-static {v5}, Lcom/android/camera/module/loader/StartControl;->create(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object v1

    .line 1359
    invoke-virtual {v1, v4}, Lcom/android/camera/module/loader/StartControl;->setViewConfigType(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object v1

    .line 1360
    invoke-virtual {v1, v6}, Lcom/android/camera/module/loader/StartControl;->setNeedBlurAnimation(Z)Lcom/android/camera/module/loader/StartControl;

    move-result-object v1

    .line 1361
    invoke-virtual {v1, v6}, Lcom/android/camera/module/loader/StartControl;->setNeedReConfigureCamera(Z)Lcom/android/camera/module/loader/StartControl;

    move-result-object v1

    .line 1358
    invoke-virtual {v0, v1}, Lcom/android/camera/ActivityBase;->onModeSelected(Lcom/android/camera/module/loader/StartControl;)V

    .line 1369
    const/4 v0, 0x4

    invoke-direct {p0, v0, v3, v4}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->updateTipMessage(III)V

    goto :goto_0

    .line 1372
    :cond_1
    invoke-direct {p0, v3}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->hideTipMessage(I)V

    .line 1375
    const-string v2, "pref_video_speed_fast_key"

    invoke-virtual {v1, v2}, Lcom/android/camera/data/data/runing/DataItemRunning;->switchOff(Ljava/lang/String;)V

    .line 1377
    const/16 v1, 0xa2

    invoke-virtual {v0, v1}, Lcom/android/camera/data/data/global/DataItemGlobal;->setCurrentMode(I)V

    .line 1378
    const-string v0, "normal"

    invoke-static {v0}, Lcom/android/camera/statistic/CameraStatUtil;->trackVideoModeChanged(Ljava/lang/String;)V

    .line 1379
    iget-object v0, p0, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->mActivity:Lcom/android/camera/ActivityBase;

    invoke-static {v1}, Lcom/android/camera/module/loader/StartControl;->create(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object v1

    .line 1380
    invoke-virtual {v1, v4}, Lcom/android/camera/module/loader/StartControl;->setViewConfigType(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object v1

    .line 1381
    invoke-virtual {v1, v6}, Lcom/android/camera/module/loader/StartControl;->setNeedBlurAnimation(Z)Lcom/android/camera/module/loader/StartControl;

    move-result-object v1

    .line 1382
    invoke-virtual {v1, v6}, Lcom/android/camera/module/loader/StartControl;->setNeedReConfigureCamera(Z)Lcom/android/camera/module/loader/StartControl;

    move-result-object v1

    .line 1379
    invoke-virtual {v0, v1}, Lcom/android/camera/ActivityBase;->onModeSelected(Lcom/android/camera/module/loader/StartControl;)V

    .line 1392
    :goto_0
    return-void
.end method

.method public configVideoHFR()V
    .locals 7

    .line 1443
    invoke-static {}, Lcom/android/camera/data/DataRepository;->provider()Lcom/android/camera/data/provider/DataProvider;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider;->dataGlobal()Lcom/android/camera/data/provider/DataProvider$ProviderEvent;

    move-result-object v0

    check-cast v0, Lcom/android/camera/data/data/global/DataItemGlobal;

    .line 1444
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v1

    .line 1446
    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentMode()I

    move-result v2

    const/4 v3, 0x2

    const/16 v4, 0xaa

    const/4 v5, 0x1

    if-eq v2, v4, :cond_0

    .line 1447
    invoke-virtual {v0, v4}, Lcom/android/camera/data/data/global/DataItemGlobal;->setCurrentMode(I)V

    .line 1448
    const-string v0, "hfr"

    invoke-static {v0}, Lcom/android/camera/statistic/CameraStatUtil;->trackVideoModeChanged(Ljava/lang/String;)V

    .line 1451
    const-string v0, "pref_video_speed_fast_key"

    invoke-virtual {v1, v0}, Lcom/android/camera/data/data/runing/DataItemRunning;->switchOff(Ljava/lang/String;)V

    .line 1452
    const-string v0, "pref_video_speed_slow_key"

    invoke-virtual {v1, v0}, Lcom/android/camera/data/data/runing/DataItemRunning;->switchOff(Ljava/lang/String;)V

    .line 1454
    const-string v0, "h"

    new-array v1, v5, [I

    const/4 v2, 0x0

    const/16 v6, 0xef

    aput v6, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->closeMutexElement(Ljava/lang/String;[I)V

    .line 1459
    iget-object v0, p0, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->mActivity:Lcom/android/camera/ActivityBase;

    invoke-static {v4}, Lcom/android/camera/module/loader/StartControl;->create(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object v1

    .line 1460
    invoke-virtual {v1, v3}, Lcom/android/camera/module/loader/StartControl;->setViewConfigType(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object v1

    .line 1461
    invoke-virtual {v1, v5}, Lcom/android/camera/module/loader/StartControl;->setNeedBlurAnimation(Z)Lcom/android/camera/module/loader/StartControl;

    move-result-object v1

    .line 1462
    invoke-virtual {v1, v5}, Lcom/android/camera/module/loader/StartControl;->setNeedReConfigureCamera(Z)Lcom/android/camera/module/loader/StartControl;

    move-result-object v1

    .line 1459
    invoke-virtual {v0, v1}, Lcom/android/camera/ActivityBase;->onModeSelected(Lcom/android/camera/module/loader/StartControl;)V

    goto :goto_0

    .line 1466
    :cond_0
    const-string v2, "pref_video_speed_hfr_key"

    invoke-virtual {v1, v2}, Lcom/android/camera/data/data/runing/DataItemRunning;->switchOff(Ljava/lang/String;)V

    .line 1468
    const/16 v1, 0xa2

    invoke-virtual {v0, v1}, Lcom/android/camera/data/data/global/DataItemGlobal;->setCurrentMode(I)V

    .line 1469
    const-string v0, "normal"

    invoke-static {v0}, Lcom/android/camera/statistic/CameraStatUtil;->trackVideoModeChanged(Ljava/lang/String;)V

    .line 1470
    iget-object v0, p0, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->mActivity:Lcom/android/camera/ActivityBase;

    invoke-static {v1}, Lcom/android/camera/module/loader/StartControl;->create(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object v1

    .line 1471
    invoke-virtual {v1, v3}, Lcom/android/camera/module/loader/StartControl;->setViewConfigType(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object v1

    .line 1472
    invoke-virtual {v1, v5}, Lcom/android/camera/module/loader/StartControl;->setNeedBlurAnimation(Z)Lcom/android/camera/module/loader/StartControl;

    move-result-object v1

    .line 1473
    invoke-virtual {v1, v5}, Lcom/android/camera/module/loader/StartControl;->setNeedReConfigureCamera(Z)Lcom/android/camera/module/loader/StartControl;

    move-result-object v1

    .line 1470
    invoke-virtual {v0, v1}, Lcom/android/camera/ActivityBase;->onModeSelected(Lcom/android/camera/module/loader/StartControl;)V

    .line 1475
    :goto_0
    return-void
.end method

.method public configVideoSlow()V
    .locals 8

    .line 1397
    invoke-static {}, Lcom/android/camera/data/DataRepository;->provider()Lcom/android/camera/data/provider/DataProvider;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider;->dataGlobal()Lcom/android/camera/data/provider/DataProvider$ProviderEvent;

    move-result-object v0

    check-cast v0, Lcom/android/camera/data/data/global/DataItemGlobal;

    .line 1398
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v1

    .line 1400
    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentMode()I

    move-result v2

    const v3, 0x7f0901bc

    const/4 v4, 0x2

    const/16 v5, 0xa8

    const/4 v6, 0x1

    if-eq v2, v5, :cond_0

    .line 1401
    invoke-virtual {v0, v5}, Lcom/android/camera/data/data/global/DataItemGlobal;->setCurrentMode(I)V

    .line 1402
    const-string v0, "slow"

    invoke-static {v0}, Lcom/android/camera/statistic/CameraStatUtil;->trackVideoModeChanged(Ljava/lang/String;)V

    .line 1405
    const-string v0, "pref_video_speed_fast_key"

    invoke-virtual {v1, v0}, Lcom/android/camera/data/data/runing/DataItemRunning;->switchOff(Ljava/lang/String;)V

    .line 1406
    const-string v0, "pref_video_speed_hfr_key"

    invoke-virtual {v1, v0}, Lcom/android/camera/data/data/runing/DataItemRunning;->switchOff(Ljava/lang/String;)V

    .line 1408
    const-string v0, "h"

    new-array v1, v6, [I

    const/4 v2, 0x0

    const/16 v7, 0xef

    aput v7, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->closeMutexElement(Ljava/lang/String;[I)V

    .line 1411
    iget-object v0, p0, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->mActivity:Lcom/android/camera/ActivityBase;

    invoke-static {v5}, Lcom/android/camera/module/loader/StartControl;->create(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object v1

    .line 1412
    invoke-virtual {v1, v4}, Lcom/android/camera/module/loader/StartControl;->setViewConfigType(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object v1

    .line 1413
    invoke-virtual {v1, v6}, Lcom/android/camera/module/loader/StartControl;->setNeedBlurAnimation(Z)Lcom/android/camera/module/loader/StartControl;

    move-result-object v1

    .line 1414
    invoke-virtual {v1, v6}, Lcom/android/camera/module/loader/StartControl;->setNeedReConfigureCamera(Z)Lcom/android/camera/module/loader/StartControl;

    move-result-object v1

    .line 1411
    invoke-virtual {v0, v1}, Lcom/android/camera/ActivityBase;->onModeSelected(Lcom/android/camera/module/loader/StartControl;)V

    .line 1419
    const/4 v0, 0x4

    invoke-direct {p0, v0, v3, v4}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->updateTipMessage(III)V

    goto :goto_0

    .line 1422
    :cond_0
    invoke-direct {p0, v3}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->hideTipMessage(I)V

    .line 1425
    const-string v2, "pref_video_speed_slow_key"

    invoke-virtual {v1, v2}, Lcom/android/camera/data/data/runing/DataItemRunning;->switchOff(Ljava/lang/String;)V

    .line 1427
    const/16 v1, 0xa2

    invoke-virtual {v0, v1}, Lcom/android/camera/data/data/global/DataItemGlobal;->setCurrentMode(I)V

    .line 1428
    const-string v0, "normal"

    invoke-static {v0}, Lcom/android/camera/statistic/CameraStatUtil;->trackVideoModeChanged(Ljava/lang/String;)V

    .line 1429
    iget-object v0, p0, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->mActivity:Lcom/android/camera/ActivityBase;

    invoke-static {v1}, Lcom/android/camera/module/loader/StartControl;->create(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object v1

    .line 1430
    invoke-virtual {v1, v4}, Lcom/android/camera/module/loader/StartControl;->setViewConfigType(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object v1

    .line 1431
    invoke-virtual {v1, v6}, Lcom/android/camera/module/loader/StartControl;->setNeedBlurAnimation(Z)Lcom/android/camera/module/loader/StartControl;

    move-result-object v1

    .line 1432
    invoke-virtual {v1, v6}, Lcom/android/camera/module/loader/StartControl;->setNeedReConfigureCamera(Z)Lcom/android/camera/module/loader/StartControl;

    move-result-object v1

    .line 1429
    invoke-virtual {v0, v1}, Lcom/android/camera/ActivityBase;->onModeSelected(Lcom/android/camera/module/loader/StartControl;)V

    .line 1439
    :goto_0
    return-void
.end method

.method public onConfigChanged(I)V
    .locals 10

    .line 108
    invoke-direct {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->isAlive()Z

    move-result v0

    if-nez v0, :cond_0

    .line 109
    return-void

    .line 112
    :cond_0
    nop

    .line 113
    invoke-static {p1}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->isMutexConfig(I)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_7

    .line 117
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    .line 118
    sget-object v2, Lcom/android/camera/data/data/config/SupportedConfigFactory;->MUTEX_MENU_CONFIGS:[I

    array-length v3, v2

    const/4 v4, 0x0

    move v5, v4

    move v6, v5

    :goto_0
    const/4 v7, 0x3

    if-ge v5, v3, :cond_4

    aget v8, v2, v5

    .line 119
    if-ne v8, p1, :cond_1

    .line 120
    goto :goto_1

    .line 123
    :cond_1
    const/16 v9, 0xcb

    if-eq v8, v9, :cond_2

    packed-switch v8, :pswitch_data_0

    .line 137
    invoke-static {v8}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->getConfigKey(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v0, v9}, Lcom/android/camera/data/data/runing/DataItemRunning;->isSwitchOn(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_3

    .line 138
    invoke-direct {p0, v8, v7}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->applyConfig(II)V

    goto :goto_1

    .line 131
    :pswitch_0
    invoke-direct {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->closeComponentUltraPixelFront()Z

    move-result v6

    .line 132
    goto :goto_1

    .line 135
    :pswitch_1
    goto :goto_1

    .line 125
    :cond_2
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v7

    const/16 v8, 0xa2

    invoke-virtual {v7, v8}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v7

    check-cast v7, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;

    .line 126
    invoke-interface {v7}, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;->isShowLightingView()Z

    move-result v7

    if-eqz v7, :cond_3

    .line 127
    invoke-virtual {p0, v4}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->showOrHideLighting(Z)V

    .line 118
    :cond_3
    :goto_1
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 144
    :cond_4
    invoke-direct {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->getBaseModule()Lcom/android/camera/module/BaseModule;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/module/BaseModule;->onSharedPreferenceChanged()V

    .line 145
    invoke-direct {p0, p1, v1}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->applyConfig(II)V

    .line 147
    invoke-static {}, Lcom/android/camera/CameraSettings;->isRearMenuUltraPixelPhotographyOn()Z

    move-result v0

    if-eqz v0, :cond_5

    const/16 v0, 0xfa

    if-eq p1, v0, :cond_5

    .line 149
    invoke-direct {p0, v0, v7}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->applyConfig(II)V

    .line 151
    :cond_5
    if-eqz v6, :cond_6

    invoke-direct {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->getBaseModule()Lcom/android/camera/module/BaseModule;

    move-result-object p1

    if-eqz p1, :cond_6

    .line 152
    sget-object p1, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->TAG:Ljava/lang/String;

    const-string v0, "onConfigChanged: need restart module."

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 153
    invoke-direct {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->getBaseModule()Lcom/android/camera/module/BaseModule;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/module/BaseModule;->restartModule()V

    .line 155
    :cond_6
    goto :goto_2

    .line 159
    :cond_7
    invoke-direct {p0, p1, v1}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->applyConfig(II)V

    .line 161
    :goto_2
    return-void

    :pswitch_data_0
    .packed-switch 0xfa
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public onThermalNotification(I)V
    .locals 3

    .line 166
    invoke-direct {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->isAlive()Z

    move-result v0

    if-nez v0, :cond_0

    .line 167
    return-void

    .line 169
    :cond_0
    invoke-direct {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->getBaseModule()Lcom/android/camera/module/BaseModule;

    move-result-object v0

    .line 172
    if-eqz v0, :cond_7

    .line 173
    invoke-virtual {v0}, Lcom/android/camera/module/BaseModule;->isFrameAvailable()Z

    move-result v1

    if-eqz v1, :cond_7

    .line 175
    invoke-virtual {v0}, Lcom/android/camera/module/BaseModule;->isSelectingCapturedResult()Z

    move-result v1

    if-eqz v1, :cond_1

    goto :goto_1

    .line 181
    :cond_1
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentFlash()Lcom/android/camera/data/data/config/ComponentConfigFlash;

    move-result-object v1

    .line 182
    invoke-virtual {v1}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 183
    return-void

    .line 186
    :cond_2
    const-string v1, ""

    .line 188
    invoke-static {p1}, Lcom/android/camera/ThermalDetector;->thermalConstrained(I)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 189
    sget-object p1, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->TAG:Ljava/lang/String;

    const-string v1, "thermalConstrained"

    invoke-static {p1, v1}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 190
    const-string v1, "0"

    goto :goto_0

    .line 191
    :cond_3
    invoke-virtual {v0}, Lcom/android/camera/module/BaseModule;->isThermalThreshold()Z

    move-result v2

    if-eqz v2, :cond_6

    .line 192
    const/4 v2, 0x2

    if-ne p1, v2, :cond_4

    .line 193
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontCamera()Z

    move-result v2

    if-nez v2, :cond_5

    :cond_4
    const/4 v2, 0x3

    if-ne p1, v2, :cond_6

    .line 195
    :cond_5
    sget-object p1, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->TAG:Ljava/lang/String;

    const-string v1, "recording time is up to thermal threshold"

    invoke-static {p1, v1}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 196
    const-string v1, "0"

    .line 200
    :cond_6
    :goto_0
    invoke-direct {p0, v0, v1}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->updateFlashModeAndRefreshUI(Lcom/android/camera/module/BaseModule;Ljava/lang/String;)V

    .line 201
    return-void

    .line 176
    :cond_7
    :goto_1
    sget-object p1, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->TAG:Ljava/lang/String;

    const-string v0, "onThermalNotification current module is null ready"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 177
    return-void
.end method

.method public reCheckHandGesture()V
    .locals 3

    .line 317
    invoke-static {}, Lcom/android/camera/CameraSettings;->isHangGestureOpen()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 318
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xac

    .line 319
    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    .line 320
    if-eqz v0, :cond_0

    .line 321
    const/4 v1, 0x0

    const v2, 0x7f090283

    invoke-interface {v0, v1, v2}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->alertTopHint(II)V

    .line 324
    :cond_0
    return-void
.end method

.method public reCheckLighting()V
    .locals 3

    .line 926
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/runing/DataItemRunning;->getComponentRunningLighting()Lcom/android/camera/data/data/runing/ComponentRunningLighting;

    move-result-object v0

    .line 927
    const/16 v1, 0xab

    invoke-virtual {v0, v1}, Lcom/android/camera/data/data/runing/ComponentRunningLighting;->getComponentValue(I)Ljava/lang/String;

    move-result-object v0

    .line 929
    const-string v1, "0"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 931
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    const/16 v2, 0xa2

    .line 932
    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v1

    check-cast v1, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;

    .line 933
    invoke-interface {v1}, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;->isShowLightingView()Z

    move-result v2

    if-nez v2, :cond_0

    .line 934
    invoke-interface {v1}, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;->showOrHideLightingView()Z

    .line 936
    :cond_0
    const-string v1, "0"

    const/4 v2, 0x0

    invoke-virtual {p0, v2, v1, v0, v2}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->setLighting(ZLjava/lang/String;Ljava/lang/String;Z)V

    .line 938
    :cond_1
    return-void
.end method

.method public reCheckLiveShot()V
    .locals 3

    .line 294
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->fC()Z

    move-result v0

    if-nez v0, :cond_0

    .line 295
    return-void

    .line 298
    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xac

    .line 299
    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    .line 300
    if-nez v0, :cond_1

    .line 301
    return-void

    .line 304
    :cond_1
    invoke-direct {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->getBaseModule()Lcom/android/camera/module/BaseModule;

    move-result-object v1

    .line 305
    if-eqz v1, :cond_4

    invoke-virtual {v1}, Lcom/android/camera/module/BaseModule;->getModuleIndex()I

    move-result v1

    const/16 v2, 0xa3

    if-eq v1, v2, :cond_2

    goto :goto_0

    .line 309
    :cond_2
    invoke-static {}, Lcom/android/camera/CameraSettings;->isLiveShotOn()Z

    move-result v1

    .line 310
    if-eqz v1, :cond_3

    .line 311
    const/4 v1, 0x1

    const v2, 0x7f090241

    invoke-interface {v0, v1, v2}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->alertSwitchHint(II)V

    .line 313
    :cond_3
    return-void

    .line 306
    :cond_4
    :goto_0
    return-void
.end method

.method public reCheckMutexConfigs(I)V
    .locals 6

    .line 230
    invoke-direct {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->isAlive()Z

    move-result v0

    if-nez v0, :cond_0

    .line 231
    return-void

    .line 233
    :cond_0
    invoke-direct {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->getBaseModule()Lcom/android/camera/module/BaseModule;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/module/BaseModule;->isCreated()Z

    move-result v0

    if-nez v0, :cond_1

    .line 234
    return-void

    .line 237
    :cond_1
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    .line 238
    sget-object v1, Lcom/android/camera/data/data/config/SupportedConfigFactory;->MUTEX_MENU_CONFIGS:[I

    array-length v2, v1

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_5

    aget v4, v1, v3

    .line 239
    const/16 v5, 0xcb

    if-eq v4, v5, :cond_3

    const/16 v5, 0xfb

    if-eq v4, v5, :cond_2

    .line 248
    invoke-static {v4}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->getConfigKey(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Lcom/android/camera/data/data/runing/DataItemRunning;->isSwitchOn(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 249
    const/4 v5, 0x2

    invoke-direct {p0, v4, v5}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->applyConfig(II)V

    goto :goto_1

    .line 246
    :cond_2
    goto :goto_1

    .line 241
    :cond_3
    invoke-virtual {v0}, Lcom/android/camera/data/data/runing/DataItemRunning;->getComponentRunningLighting()Lcom/android/camera/data/data/runing/ComponentRunningLighting;

    move-result-object v4

    invoke-virtual {v4, p1}, Lcom/android/camera/data/data/runing/ComponentRunningLighting;->isSwitchOn(I)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 242
    invoke-virtual {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->reCheckLighting()V

    .line 238
    :cond_4
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 255
    :cond_5
    return-void
.end method

.method public reCheckUltraPixelPhotoGraphy()V
    .locals 5

    .line 259
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    .line 260
    const/16 v1, 0xac

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    .line 261
    if-eqz v0, :cond_7

    iget-object v1, p0, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->mActivity:Lcom/android/camera/ActivityBase;

    if-nez v1, :cond_0

    goto :goto_1

    .line 265
    :cond_0
    invoke-direct {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->getBaseModule()Lcom/android/camera/module/BaseModule;

    move-result-object v1

    .line 266
    if-nez v1, :cond_1

    .line 267
    return-void

    .line 271
    :cond_1
    invoke-virtual {v1}, Lcom/android/camera/module/BaseModule;->getModuleIndex()I

    move-result v2

    .line 272
    const/16 v3, 0xa3

    if-eq v2, v3, :cond_2

    const/16 v3, 0xa7

    if-eq v2, v3, :cond_2

    .line 273
    return-void

    .line 275
    :cond_2
    invoke-virtual {v1}, Lcom/android/camera/module/BaseModule;->getCameraCapabilities()Lcom/android/camera2/CameraCapabilities;

    move-result-object v1

    .line 276
    invoke-static {v1}, Lcom/android/camera/CameraSettings;->isSupportedUltraPixelPhotography(Lcom/android/camera2/CameraCapabilities;)Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_5

    .line 277
    invoke-static {}, Lcom/android/camera/CameraSettings;->isRearMenuUltraPixelPhotographyOn()Z

    move-result v1

    .line 278
    invoke-static {}, Lcom/android/camera/CameraSettings;->isUltraPixelPhotographyOn()Z

    move-result v2

    .line 279
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/camera/data/data/config/DataItemConfig;->getRearComponentConfigUltraPixel()Lcom/android/camera/data/data/config/ComponentConfigUltraPixel;

    move-result-object v4

    .line 280
    if-nez v1, :cond_3

    if-eqz v2, :cond_4

    .line 281
    :cond_3
    invoke-virtual {v4}, Lcom/android/camera/data/data/config/ComponentConfigUltraPixel;->getUltraPixelOpenTip()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v3, v1}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->alertTopHint(ILjava/lang/String;)V

    .line 283
    :cond_4
    goto :goto_0

    :cond_5
    invoke-static {v1}, Lcom/android/camera/CameraSettings;->isFrontSupportedUltraPixelPhotography(Lcom/android/camera2/CameraCapabilities;)Z

    move-result v1

    if-eqz v1, :cond_6

    .line 284
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontMenuUltraPixelPhotographyOn()Z

    move-result v1

    .line 285
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/data/data/config/DataItemConfig;->getFrontComponentConfigUltraPixel()Lcom/android/camera/data/data/config/ComponentConfigUltraPixel;

    move-result-object v2

    .line 286
    if-eqz v1, :cond_6

    .line 287
    invoke-virtual {v2}, Lcom/android/camera/data/data/config/ComponentConfigUltraPixel;->getUltraPixelOpenTip()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v3, v1}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->alertTopHint(ILjava/lang/String;)V

    .line 290
    :cond_6
    :goto_0
    return-void

    .line 262
    :cond_7
    :goto_1
    return-void
.end method

.method public registerProtocol()V
    .locals 2

    .line 97
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa4

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 98
    return-void
.end method

.method public restoreAllMutexElement(Ljava/lang/String;)V
    .locals 5

    .line 1888
    iget-object p1, p0, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->mRecordingMutexElements:[I

    if-nez p1, :cond_0

    .line 1889
    return-void

    .line 1891
    :cond_0
    iget-object p1, p0, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->mRecordingMutexElements:[I

    array-length p1, p1

    new-array p1, p1, [I

    .line 1892
    const/4 v0, 0x0

    move v1, v0

    :goto_0
    iget-object v2, p0, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->mRecordingMutexElements:[I

    array-length v2, v2

    const/4 v3, 0x0

    if-ge v1, v2, :cond_5

    .line 1893
    iget-object v2, p0, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->mRecordingMutexElements:[I

    aget v2, v2, v1

    const/16 v4, 0xc4

    if-eq v2, v4, :cond_4

    const/16 v4, 0xc9

    if-eq v2, v4, :cond_3

    const/16 v4, 0xce

    if-eq v2, v4, :cond_2

    const/16 v4, 0xef

    if-eq v2, v4, :cond_1

    packed-switch v2, :pswitch_data_0

    .line 1920
    new-instance p1, Ljava/lang/RuntimeException;

    const-string v0, "unknown mutex element"

    invoke-direct {p1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 1899
    :pswitch_0
    invoke-direct {p0, v0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->updateComponentHdr(Z)V

    .line 1900
    const/16 v2, 0xb

    aput v2, p1, v1

    .line 1901
    goto :goto_1

    .line 1895
    :pswitch_1
    invoke-direct {p0, v3, v0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->updateComponentFlash(Ljava/lang/String;Z)V

    .line 1896
    const/16 v2, 0xa

    aput v2, p1, v1

    .line 1897
    goto :goto_1

    .line 1908
    :cond_1
    invoke-direct {p0, v0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->updateComponentBeauty(Z)V

    .line 1909
    const/16 v2, 0xd

    aput v2, p1, v1

    .line 1910
    goto :goto_1

    .line 1916
    :cond_2
    invoke-direct {p0, v0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->updateLiveShot(Z)V

    .line 1917
    const/16 v2, 0x31

    aput v2, p1, v1

    .line 1918
    goto :goto_1

    .line 1912
    :cond_3
    invoke-direct {p0, v0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->updateAiScene(Z)V

    .line 1913
    const/16 v2, 0x24

    aput v2, p1, v1

    .line 1914
    goto :goto_1

    .line 1903
    :cond_4
    invoke-direct {p0, v0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->updateComponentFilter(Z)V

    .line 1904
    const/4 v2, 0x2

    aput v2, p1, v1

    .line 1905
    nop

    .line 1892
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1923
    :cond_5
    iput-object v3, p0, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->mRecordingMutexElements:[I

    .line 1924
    invoke-direct {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->getBaseModule()Lcom/android/camera/module/BaseModule;

    move-result-object v0

    .line 1925
    invoke-virtual {v0, p1}, Lcom/android/camera/module/BaseModule;->updatePreferenceInWorkThread([I)V

    .line 1926
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0xc1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public setEyeLight(Ljava/lang/String;)V
    .locals 3

    .line 1072
    invoke-direct {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->getBaseModule()Lcom/android/camera/module/BaseModule;

    move-result-object p1

    .line 1073
    const/4 v0, 0x1

    new-array v0, v0, [I

    const/4 v1, 0x0

    const/16 v2, 0x2d

    aput v2, v0, v1

    invoke-virtual {p1, v0}, Lcom/android/camera/module/BaseModule;->updatePreferenceInWorkThread([I)V

    .line 1074
    return-void
.end method

.method public setFilter(I)V
    .locals 6

    .line 1078
    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/camera/effect/EffectController;->setInvertFlag(I)V

    .line 1081
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v2, 0xac

    invoke-virtual {v0, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    .line 1083
    invoke-static {}, Lcom/android/camera/CameraSettings;->isGroupShotOn()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1085
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v2

    const/16 v3, 0xa4

    invoke-virtual {v2, v3}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v2

    check-cast v2, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;

    .line 1088
    const/4 v3, 0x4

    invoke-interface {v2, v3}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->configGroupSwitch(I)V

    .line 1089
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->refreshExtraMenu()V

    .line 1093
    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v2

    const/16 v3, 0xa5

    .line 1094
    invoke-virtual {v2, v3}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v2

    check-cast v2, Lcom/android/camera/protocol/ModeProtocol$FilterProtocol;

    .line 1095
    sget-object v3, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "setFilter: filterId = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, ", FilterProtocol = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1096
    if-eqz v2, :cond_1

    .line 1097
    invoke-static {p1}, Lcom/android/camera/effect/FilterInfo;->getCategory(I)I

    move-result v3

    invoke-static {p1}, Lcom/android/camera/effect/FilterInfo;->getIndex(I)I

    move-result p1

    invoke-interface {v2, v3, p1}, Lcom/android/camera/protocol/ModeProtocol$FilterProtocol;->onFilterChanged(II)V

    .line 1101
    :cond_1
    const/4 p1, 0x1

    new-array v2, p1, [I

    const/16 v3, 0xc4

    aput v3, v2, v1

    invoke-interface {v0, v2}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->updateConfigItem([I)V

    .line 1103
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontMenuUltraPixelPhotographyOn()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1104
    const-string v0, "k"

    new-array p1, p1, [I

    const/16 v2, 0xfb

    aput v2, p1, v1

    invoke-virtual {p0, v0, p1}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->closeMutexElement(Ljava/lang/String;[I)V

    .line 1107
    :cond_2
    return-void
.end method

.method public setLighting(ZLjava/lang/String;Ljava/lang/String;Z)V
    .locals 8

    .line 1023
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xac

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    .line 1024
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    const/16 v2, 0xaf

    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v1

    check-cast v1, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;

    .line 1025
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v2

    const/16 v3, 0xc6

    invoke-virtual {v2, v3}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v2

    check-cast v2, Lcom/android/camera/protocol/ModeProtocol$VerticalProtocol;

    .line 1027
    const-string v3, "0"

    invoke-virtual {p2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-nez p2, :cond_0

    const-string p2, "0"

    .line 1028
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_3

    .line 1030
    :cond_0
    new-array p2, v4, [I

    const/16 v5, 0xcb

    aput v5, p2, v3

    invoke-interface {v0, p2}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->updateConfigItem([I)V

    .line 1032
    const-string p2, "0"

    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    .line 1034
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v5

    const/16 v6, 0xa6

    .line 1035
    invoke-virtual {v5, v6}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v5

    check-cast v5, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    .line 1036
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v6

    const/16 v7, 0xa2

    .line 1037
    invoke-virtual {v6, v7}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v6

    check-cast v6, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;

    .line 1039
    if-eqz p2, :cond_2

    .line 1040
    if-nez p1, :cond_1

    .line 1041
    invoke-interface {v0, v4}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->alertLightingTitle(Z)V

    .line 1043
    :cond_1
    invoke-interface {v5}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->lightingCancel()V

    goto :goto_0

    .line 1045
    :cond_2
    invoke-interface {v0, v3}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->alertLightingTitle(Z)V

    .line 1046
    invoke-interface {v5}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->lightingStart()V

    .line 1047
    invoke-interface {v6, v4}, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;->setLightingViewStatus(Z)V

    .line 1053
    :cond_3
    :goto_0
    invoke-interface {v1, p3}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->setLightingPattern(Ljava/lang/String;)V

    .line 1054
    invoke-interface {v2, p3}, Lcom/android/camera/protocol/ModeProtocol$VerticalProtocol;->setLightingPattern(Ljava/lang/String;)V

    .line 1056
    const-string p1, "0"

    if-ne p3, p1, :cond_4

    .line 1057
    const/4 p1, -0x1

    invoke-interface {v0, p1}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->alertLightingHint(I)V

    .line 1058
    invoke-interface {v2, p1}, Lcom/android/camera/protocol/ModeProtocol$VerticalProtocol;->alertLightingHint(I)V

    .line 1061
    :cond_4
    invoke-direct {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->getBaseModule()Lcom/android/camera/module/BaseModule;

    move-result-object p1

    .line 1062
    new-array p2, v4, [I

    const/16 v0, 0x2b

    aput v0, p2, v3

    invoke-virtual {p1, p2}, Lcom/android/camera/module/BaseModule;->updatePreferenceInWorkThread([I)V

    .line 1064
    if-eqz p4, :cond_5

    .line 1065
    const/16 p1, 0xab

    invoke-static {p1, p3}, Lcom/android/camera/statistic/CameraStatUtil;->trackLightingChanged(ILjava/lang/String;)V

    .line 1068
    :cond_5
    return-void
.end method

.method public showCloseTip(IZ)V
    .locals 2

    .line 1930
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xaf

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;

    .line 1931
    invoke-interface {v0, p1, p2}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->showCloseTip(IZ)V

    .line 1932
    return-void
.end method

.method public showOrHideFilter()V
    .locals 8

    .line 867
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa0

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;

    .line 868
    if-nez v0, :cond_0

    .line 869
    return-void

    .line 872
    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa2

    .line 873
    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;

    .line 874
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;->isShowLightingView()Z

    move-result v1

    .line 875
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;->showOrHideFilterView()Z

    move-result v0

    .line 877
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v2

    const/16 v3, 0xd2

    .line 878
    invoke-virtual {v2, v3}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v2

    check-cast v2, Lcom/android/camera/protocol/ModeProtocol$BokehFNumberController;

    .line 879
    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz v0, :cond_1

    if-eqz v1, :cond_1

    .line 881
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/data/data/runing/DataItemRunning;->getComponentRunningLighting()Lcom/android/camera/data/data/runing/ComponentRunningLighting;

    move-result-object v1

    .line 882
    const/16 v5, 0xab

    invoke-virtual {v1, v5}, Lcom/android/camera/data/data/runing/ComponentRunningLighting;->getComponentValue(I)Ljava/lang/String;

    move-result-object v1

    .line 884
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v6

    invoke-virtual {v6}, Lcom/android/camera/data/data/runing/DataItemRunning;->getComponentRunningLighting()Lcom/android/camera/data/data/runing/ComponentRunningLighting;

    move-result-object v6

    const-string v7, "0"

    .line 885
    invoke-virtual {v6, v5, v7}, Lcom/android/camera/data/data/runing/ComponentRunningLighting;->setComponentValue(ILjava/lang/String;)V

    .line 887
    const-string v5, "0"

    invoke-virtual {p0, v4, v1, v5, v3}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->setLighting(ZLjava/lang/String;Ljava/lang/String;Z)V

    .line 889
    if-eqz v2, :cond_1

    .line 890
    invoke-interface {v2}, Lcom/android/camera/protocol/ModeProtocol$BokehFNumberController;->showFNumberPanel()V

    .line 893
    :cond_1
    if-eqz v2, :cond_2

    invoke-interface {v2}, Lcom/android/camera/protocol/ModeProtocol$BokehFNumberController;->isFNumberVisible()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 894
    invoke-interface {v2, v3, v3}, Lcom/android/camera/protocol/ModeProtocol$BokehFNumberController;->hideFNumberPanel(ZZ)V

    .line 895
    invoke-interface {v2}, Lcom/android/camera/protocol/ModeProtocol$BokehFNumberController;->showFNumberPanel()V

    .line 898
    :cond_2
    invoke-static {}, Lcom/android/camera/Util;->UI_DEBUG()Z

    move-result v1

    if-nez v1, :cond_4

    .line 899
    if-eqz v0, :cond_3

    .line 900
    invoke-virtual {p0, v4, v4}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->showCloseTip(IZ)V

    goto :goto_0

    .line 902
    :cond_3
    invoke-virtual {p0, v4, v3}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->showCloseTip(IZ)V

    goto :goto_0

    .line 905
    :cond_4
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    const/16 v2, 0xaf

    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v1

    check-cast v1, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;

    .line 906
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v2

    const/16 v3, 0xc2

    invoke-virtual {v2, v3}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v2

    check-cast v2, Lcom/android/camera/protocol/ModeProtocol$MiBeautyProtocol;

    .line 907
    if-eqz v1, :cond_7

    .line 908
    if-eqz v0, :cond_5

    .line 916
    invoke-interface {v1}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->updateLeftTipImage()V

    goto :goto_0

    .line 917
    :cond_5
    if-eqz v2, :cond_6

    invoke-interface {v2}, Lcom/android/camera/protocol/ModeProtocol$MiBeautyProtocol;->isBeautyPanelShow()Z

    move-result v0

    if-nez v0, :cond_7

    .line 918
    :cond_6
    invoke-interface {v1}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->updateLeftTipImage()V

    .line 922
    :cond_7
    :goto_0
    return-void
.end method

.method public showOrHideLighting(Z)V
    .locals 12

    .line 942
    invoke-direct {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->beautyMutexHandle()V

    .line 944
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa0

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;

    .line 945
    if-nez v0, :cond_0

    .line 946
    return-void

    .line 949
    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    const/16 v2, 0xa2

    .line 950
    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v1

    check-cast v1, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;

    .line 951
    invoke-interface {v1}, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;->showOrHideLightingView()Z

    move-result v1

    .line 955
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v2

    const/16 v3, 0xac

    invoke-virtual {v2, v3}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v2

    check-cast v2, Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    .line 957
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v3

    const/16 v4, 0xaf

    invoke-virtual {v3, v4}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v3

    check-cast v3, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;

    .line 960
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v5

    const/16 v6, 0xd2

    .line 961
    invoke-virtual {v5, v6}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v5

    check-cast v5, Lcom/android/camera/protocol/ModeProtocol$BokehFNumberController;

    .line 963
    const/4 v6, 0x0

    const/4 v7, 0x1

    if-eqz v1, :cond_2

    .line 964
    invoke-virtual {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->reCheckLighting()V

    .line 967
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v8

    invoke-virtual {v8}, Lcom/android/camera/data/data/runing/DataItemRunning;->getComponentConfigFilter()Lcom/android/camera/data/data/config/ComponentConfigFilter;

    move-result-object v8

    .line 968
    invoke-direct {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->getBaseModule()Lcom/android/camera/module/BaseModule;

    move-result-object v9

    invoke-virtual {v9}, Lcom/android/camera/module/BaseModule;->getModuleIndex()I

    move-result v9

    invoke-virtual {v8, v9}, Lcom/android/camera/data/data/config/ComponentConfigFilter;->reset(I)V

    .line 970
    sget v8, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_NONE:I

    invoke-virtual {p0, v8}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->setFilter(I)V

    .line 971
    invoke-interface {v2, v7}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->alertLightingTitle(Z)V

    .line 973
    if-eqz v5, :cond_1

    .line 974
    invoke-interface {v5, v7, v7}, Lcom/android/camera/protocol/ModeProtocol$BokehFNumberController;->hideFNumberPanel(ZZ)V

    .line 976
    :cond_1
    invoke-interface {v3}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->directHideTipImage()V

    .line 977
    goto :goto_0

    .line 979
    :cond_2
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v8

    invoke-virtual {v8}, Lcom/android/camera/data/data/runing/DataItemRunning;->getComponentRunningLighting()Lcom/android/camera/data/data/runing/ComponentRunningLighting;

    move-result-object v8

    .line 980
    const/16 v9, 0xab

    invoke-virtual {v8, v9}, Lcom/android/camera/data/data/runing/ComponentRunningLighting;->getComponentValue(I)Ljava/lang/String;

    move-result-object v8

    .line 982
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v10

    invoke-virtual {v10}, Lcom/android/camera/data/data/runing/DataItemRunning;->getComponentRunningLighting()Lcom/android/camera/data/data/runing/ComponentRunningLighting;

    move-result-object v10

    const-string v11, "0"

    .line 983
    invoke-virtual {v10, v9, v11}, Lcom/android/camera/data/data/runing/ComponentRunningLighting;->setComponentValue(ILjava/lang/String;)V

    .line 985
    const-string v9, "0"

    invoke-virtual {p0, v7, v8, v9, v6}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->setLighting(ZLjava/lang/String;Ljava/lang/String;Z)V

    .line 986
    invoke-interface {v3}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->reInitTipImage()V

    .line 987
    invoke-interface {v2, v6}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->alertLightingTitle(Z)V

    .line 989
    if-eqz v5, :cond_3

    .line 990
    invoke-interface {v5}, Lcom/android/camera/protocol/ModeProtocol$BokehFNumberController;->showFNumberPanel()V

    .line 995
    :cond_3
    :goto_0
    const v2, 0x7f0d001b

    invoke-interface {v0, v2}, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;->getActiveFragment(I)I

    move-result v2

    const/16 v3, 0xfb

    if-ne v2, v3, :cond_4

    .line 996
    const/4 v2, 0x7

    invoke-interface {v0, v2}, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;->delegateEvent(I)V

    .line 999
    :cond_4
    if-eqz p1, :cond_5

    .line 1000
    const-string p1, "counter"

    const-string v0, "lighting_button"

    invoke-static {p1, v0}, Lcom/android/camera/statistic/CameraStat;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    .line 1003
    :cond_5
    invoke-static {}, Lcom/android/camera/Util;->UI_DEBUG()Z

    move-result p1

    const/4 v0, 0x2

    if-nez p1, :cond_7

    .line 1004
    if-eqz v1, :cond_6

    .line 1005
    invoke-virtual {p0, v0, v7}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->showCloseTip(IZ)V

    goto :goto_1

    .line 1007
    :cond_6
    invoke-virtual {p0, v0, v6}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->showCloseTip(IZ)V

    goto :goto_1

    .line 1010
    :cond_7
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    invoke-virtual {p1, v4}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;

    .line 1011
    if-eqz p1, :cond_9

    .line 1012
    if-eqz v1, :cond_8

    .line 1013
    invoke-interface {p1, v0, v7}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->showCloseTip(IZ)V

    goto :goto_1

    .line 1015
    :cond_8
    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->updateLeftTipImage()V

    .line 1019
    :cond_9
    :goto_1
    return-void
.end method

.method public showSetting()V
    .locals 5

    .line 831
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 832
    iget-object v1, p0, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->mActivity:Lcom/android/camera/ActivityBase;

    const-class v2, Lcom/android/camera/CameraPreferenceActivity;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 833
    const-string v1, "from_where"

    .line 834
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentMode()I

    move-result v2

    .line 833
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 836
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/data/data/global/DataItemGlobal;->getIntentType()I

    move-result v1

    .line 838
    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    .line 839
    const-string v1, "IsCaptureIntent"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 842
    :cond_0
    const-string v1, ":miui:starting_window_label"

    iget-object v3, p0, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->mActivity:Lcom/android/camera/ActivityBase;

    .line 843
    invoke-virtual {v3}, Lcom/android/camera/ActivityBase;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f090045

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 842
    invoke-virtual {v0, v1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 845
    iget-object v1, p0, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->mActivity:Lcom/android/camera/ActivityBase;

    invoke-virtual {v1}, Lcom/android/camera/ActivityBase;->startFromKeyguard()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 846
    const-string v1, "StartActivityWhenLocked"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 849
    :cond_1
    iget-object v1, p0, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->mActivity:Lcom/android/camera/ActivityBase;

    invoke-virtual {v1}, Lcom/android/camera/ActivityBase;->getIntent()Landroid/content/Intent;

    move-result-object v1

    const-string v2, "android.intent.extras.CAMERA_FACING"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V

    .line 851
    iget-object v1, p0, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->mActivity:Lcom/android/camera/ActivityBase;

    invoke-virtual {v1, v0}, Lcom/android/camera/ActivityBase;->startActivity(Landroid/content/Intent;)V

    .line 852
    iget-object v0, p0, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->mActivity:Lcom/android/camera/ActivityBase;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Lcom/android/camera/ActivityBase;->setJumpFlag(I)V

    .line 854
    invoke-direct {p0}, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->trackGotoSettings()V

    .line 855
    return-void
.end method

.method public unRegisterProtocol()V
    .locals 2

    .line 102
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera/module/impl/component/ConfigChangeImpl;->mActivity:Lcom/android/camera/ActivityBase;

    .line 103
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa4

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 104
    return-void
.end method
