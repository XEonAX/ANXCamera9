.class public Lcom/android/camera/data/data/config/SupportedConfigFactory;
.super Ljava/lang/Object;
.source "SupportedConfigFactory.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/data/data/config/SupportedConfigFactory$CloseElementTrigger;,
        Lcom/android/camera/data/data/config/SupportedConfigFactory$MutexElement;,
        Lcom/android/camera/data/data/config/SupportedConfigFactory$ConfigItem;
    }
.end annotation


# static fields
.field public static final AI_DETECT:I = 0xf2

.field public static final AI_SCENE:I = 0xc9

.field public static final BACKLIGHT:I = 0xf9

.field public static final BEAUTY:I = 0xef

.field public static final CLOSE_BY_AI:Ljava/lang/String; = "e"

.field public static final CLOSE_BY_BURST_SHOOT:Ljava/lang/String; = "d"

.field public static final CLOSE_BY_FILTER:Ljava/lang/String; = "k"

.field public static final CLOSE_BY_GROUP:Ljava/lang/String; = "b"

.field public static final CLOSE_BY_HDR:Ljava/lang/String; = "g"

.field public static final CLOSE_BY_HHT:Ljava/lang/String; = "a"

.field public static final CLOSE_BY_SUPER_RESOLUTION:Ljava/lang/String; = "c"

.field public static final CLOSE_BY_ULTRA_PIXEL:Ljava/lang/String; = "j"

.field public static final CLOSE_BY_ULTRA_WIDE:Ljava/lang/String; = "i"

.field public static final CLOSE_BY_VIDEO:Ljava/lang/String; = "h"

.field public static final DUAL_WATER_MARK:I = 0xf0

.field public static final FAST:I = 0xe9

.field public static final FILTER:I = 0xc4

.field public static final FLASH:I = 0xc1

.field public static final FOCUS_PEAK:I = 0xc7

.field public static final GENDER_AGE:I = 0xee

.field public static final GRADIENTER:I = 0xe5

.field public static final GROUP:I = 0xeb

.field public static final HAND_GESTURE:I = 0xfc

.field public static final HDR:I = 0xc2

.field public static final HFR:I = 0xca

.field public static final HHT:I = 0xe6

.field public static final INVALID:I = 0xc6

.field public static final LIGHTING:I = 0xcb

.field public static final LIVE_MUSIC_SELECT:I = 0xf5

.field public static final LIVE_SHOT:I = 0xce

.field public static final MAGIC_FOCUS:I = 0xe7

.field public static final MAGIC_MIRROR:I = 0xec

.field public static final MENU_ULTRA_PIXEL_PHOTOGRAPHY:I = 0xfa

.field public static final MENU_ULTRA_PIXEL_PHOTOGRAPHY_FRONT:I = 0xfb

.field public static final MOON:I = 0xf6

.field public static final MORE:I = 0xc5

.field public static final MUTEX_MENU_CONFIGS:[I

.field public static final NEW_SLOW_MOTION:I = 0xcc

.field public static final NIGHT:I = 0xf7

.field public static final PORTRAIT:I = 0xc3

.field public static final RAW:I = 0xed

.field public static final SCENE:I = 0xea

.field public static final SETTING:I = 0xe1

.field public static final SILHOUETTE:I = 0xf8

.field public static final SLOW:I = 0xe8

.field public static final SUPER_RESOLUTION:I = 0xf1

.field public static final TILT:I = 0xe4

.field public static final TIMER:I = 0xe2

.field public static final ULTRA_PIXEL_PHOTOGRAPHY:I = 0xd1

.field public static final ULTRA_WIDE:I = 0xcd

.field public static final ULTRA_WIDE_BOKEH:I = 0xcf

.field public static final USER_DEFINE_WATER_MARK:I = 0xf4

.field public static final VIDEO_BOKEH:I = 0xf3

.field public static gRecordingMutexElements:[I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 102
    const/16 v0, 0xe

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/android/camera/data/data/config/SupportedConfigFactory;->MUTEX_MENU_CONFIGS:[I

    return-void

    :array_0
    .array-data 4
        0xe5
        0xec
        0xeb
        0xe4
        0xe6
        0xf1
        0xea
        0xc3
        0xee
        0xc7
        0xcb
        0xce
        0xfa
        0xfb
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;
    .locals 1

    .line 381
    new-instance v0, Lcom/android/camera/data/data/config/TopConfigItem;

    invoke-direct {v0, p0}, Lcom/android/camera/data/data/config/TopConfigItem;-><init>(I)V

    return-object v0
.end method

.method private static createConfigItem(II)Lcom/android/camera/data/data/config/TopConfigItem;
    .locals 1

    .line 377
    new-instance v0, Lcom/android/camera/data/data/config/TopConfigItem;

    invoke-direct {v0, p0, p1}, Lcom/android/camera/data/data/config/TopConfigItem;-><init>(II)V

    return-object v0
.end method

.method public static findViewPosition(I)I
    .locals 0

    .line 552
    invoke-static {p0}, Lcom/android/camera/data/data/config/TopViewPositionArray;->getCurrentUseViewPositionFromConfig(I)I

    move-result p0

    return p0
.end method

.method public static getConfigKey(I)Ljava/lang/String;
    .locals 1

    .line 166
    const/16 v0, 0xc3

    if-eq p0, v0, :cond_5

    const/16 v0, 0xc7

    if-eq p0, v0, :cond_4

    const/16 v0, 0xc9

    if-eq p0, v0, :cond_3

    const/16 v0, 0xce

    if-eq p0, v0, :cond_2

    const/16 v0, 0xee

    if-eq p0, v0, :cond_1

    const/16 v0, 0xf1

    if-eq p0, v0, :cond_0

    packed-switch p0, :pswitch_data_0

    packed-switch p0, :pswitch_data_1

    packed-switch p0, :pswitch_data_2

    .line 198
    new-instance p0, Ljava/lang/RuntimeException;

    const-string v0, "unknown config item"

    invoke-direct {p0, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 196
    :pswitch_0
    const-string p0, "pref_hand_gesture"

    return-object p0

    .line 194
    :pswitch_1
    const-string p0, "pref_menu_ultra_pixel_photography_front"

    return-object p0

    .line 192
    :pswitch_2
    const-string p0, "pref_menu_ultra_pixel_photography_rear"

    return-object p0

    .line 170
    :pswitch_3
    const-string p0, "pref_camera_magic_mirror_key"

    return-object p0

    .line 172
    :pswitch_4
    const-string p0, "pref_camera_groupshot_mode_key"

    return-object p0

    .line 180
    :pswitch_5
    const-string p0, "pref_camera_scenemode_setting_key"

    return-object p0

    .line 176
    :pswitch_6
    const-string p0, "pref_camera_hand_night_key"

    return-object p0

    .line 168
    :pswitch_7
    const-string p0, "pref_camera_gradienter_key"

    return-object p0

    .line 174
    :pswitch_8
    const-string p0, "pref_camera_tilt_shift_mode"

    return-object p0

    .line 178
    :cond_0
    const-string p0, "pref_camera_super_resolution_key"

    return-object p0

    .line 184
    :cond_1
    const-string p0, "pref_camera_show_gender_age_key"

    return-object p0

    .line 190
    :cond_2
    const-string p0, "pref_live_shot_enabled"

    return-object p0

    .line 188
    :cond_3
    const-string p0, "pref_camera_ai_scene_mode_key"

    return-object p0

    .line 186
    :cond_4
    const-string p0, "pref_camera_peak_key"

    return-object p0

    .line 182
    :cond_5
    const-string p0, "pref_camera_portrait_mode_key"

    return-object p0

    :pswitch_data_0
    .packed-switch 0xe4
        :pswitch_8
        :pswitch_7
        :pswitch_6
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0xea
        :pswitch_5
        :pswitch_4
        :pswitch_3
    .end packed-switch

    :pswitch_data_2
    .packed-switch 0xfa
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static final getSupportedExtraConfigs(IILcom/android/camera/data/cloud/DataCloud$CloudFeature;Lcom/android/camera2/CameraCapabilities;Z)Lcom/android/camera/data/data/config/SupportedConfigs;
    .locals 8

    .line 387
    new-instance v0, Lcom/android/camera/data/data/config/SupportedConfigs;

    invoke-direct {v0}, Lcom/android/camera/data/data/config/SupportedConfigs;-><init>()V

    .line 392
    const/16 v1, 0xae

    const/16 v2, 0xef

    const/16 v3, 0xe1

    if-eq p0, v1, :cond_15

    packed-switch p0, :pswitch_data_0

    const/16 v1, 0xfc

    const/16 v4, 0xec

    const/16 v5, 0xee

    const/16 v6, 0xe2

    packed-switch p0, :pswitch_data_1

    .line 396
    invoke-virtual {v0, v3}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    move-result-object v3

    invoke-virtual {v3, v6}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    .line 397
    const/16 v3, 0xeb

    const/16 v6, 0xa3

    const/16 v7, 0xa5

    packed-switch p1, :pswitch_data_2

    goto/16 :goto_1

    .line 454
    :pswitch_0
    if-eqz p4, :cond_0

    invoke-static {}, Lcom/mi/config/b;->hs()Z

    move-result p1

    if-eqz p1, :cond_0

    if-eq p0, v7, :cond_0

    .line 455
    invoke-virtual {v0, v3}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    .line 457
    :cond_0
    if-eq p0, v7, :cond_1

    if-ne p0, v6, :cond_e

    .line 458
    :cond_1
    invoke-static {}, Lcom/mi/config/b;->ga()Z

    move-result p1

    if-eqz p1, :cond_2

    invoke-static {}, Lcom/mi/config/b;->fZ()Z

    move-result p1

    if-eqz p1, :cond_2

    .line 459
    invoke-virtual {v0, v5}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    .line 462
    :cond_2
    invoke-static {}, Lcom/mi/config/b;->he()Z

    move-result p1

    if-eqz p1, :cond_3

    .line 463
    invoke-virtual {v0, v4}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    .line 466
    :cond_3
    if-ne p0, v6, :cond_e

    .line 468
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object p0

    invoke-virtual {p0}, Lcom/mi/config/a;->fO()I

    move-result p0

    .line 469
    invoke-static {p3}, Lcom/android/camera/CameraSettings;->isFrontSupportedUltraPixelPhotography(Lcom/android/camera2/CameraCapabilities;)Z

    move-result p1

    if-eqz p1, :cond_4

    if-eqz p4, :cond_4

    if-lez p0, :cond_4

    .line 470
    const/16 p1, 0xfb

    invoke-virtual {v0, p1}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    .line 471
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/data/data/config/DataItemConfig;->getFrontComponentConfigUltraPixel()Lcom/android/camera/data/data/config/ComponentConfigUltraPixel;

    move-result-object p1

    invoke-virtual {p1, p0}, Lcom/android/camera/data/data/config/ComponentConfigUltraPixel;->initUltraPixelResource(I)V

    .line 473
    :cond_4
    invoke-static {}, Lcom/mi/config/b;->fP()Z

    move-result p0

    if-eqz p0, :cond_e

    .line 474
    invoke-virtual {v0, v1}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    goto/16 :goto_1

    .line 399
    :pswitch_1
    invoke-static {}, Lcom/mi/config/b;->gZ()Z

    move-result p1

    if-eqz p1, :cond_5

    .line 400
    const/16 p1, 0xe4

    invoke-virtual {v0, p1}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    .line 403
    :cond_5
    invoke-static {}, Lcom/mi/config/b;->gS()Z

    move-result p1

    if-eqz p1, :cond_6

    .line 404
    const/16 p1, 0xe5

    invoke-virtual {v0, p1}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    .line 407
    :cond_6
    invoke-static {}, Lcom/mi/config/b;->gy()Z

    move-result p1

    if-eqz p1, :cond_7

    .line 408
    const/16 p1, 0xea

    invoke-virtual {v0, p1}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    .line 411
    :cond_7
    if-eq p0, v7, :cond_8

    if-eqz p4, :cond_8

    .line 412
    invoke-static {}, Lcom/mi/config/b;->hs()Z

    move-result p1

    if-eqz p1, :cond_8

    .line 413
    invoke-virtual {v0, v3}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    .line 420
    :cond_8
    invoke-static {}, Lcom/android/camera/Util;->UI_DEBUG()Z

    move-result p1

    if-nez p1, :cond_a

    .line 421
    if-eq p0, v7, :cond_9

    if-ne p0, v6, :cond_a

    .line 422
    :cond_9
    invoke-static {}, Lcom/mi/config/b;->fZ()Z

    move-result p1

    if-eqz p1, :cond_a

    .line 423
    invoke-virtual {v0, v2}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    .line 436
    :cond_a
    if-eqz p4, :cond_b

    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lcom/android/camera/CameraSettings;->checkLensAvailability(Landroid/content/Context;)Z

    move-result p1

    if-eqz p1, :cond_b

    .line 437
    const/16 p1, 0xf2

    invoke-virtual {v0, p1}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    .line 439
    :cond_b
    if-eq p0, v6, :cond_c

    goto :goto_0

    .line 442
    :cond_c
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object p0

    invoke-virtual {p0}, Lcom/mi/config/a;->fN()I

    move-result p0

    .line 443
    invoke-static {p3}, Lcom/android/camera/CameraSettings;->isSupportedUltraPixelPhotography(Lcom/android/camera2/CameraCapabilities;)Z

    move-result p1

    if-eqz p1, :cond_d

    if-eqz p4, :cond_d

    if-lez p0, :cond_d

    .line 445
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object p1

    invoke-virtual {p1}, Lcom/mi/config/a;->fL()Z

    move-result p1

    if-nez p1, :cond_d

    .line 446
    const/16 p1, 0xfa

    invoke-virtual {v0, p1}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    .line 447
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/data/data/config/DataItemConfig;->getRearComponentConfigUltraPixel()Lcom/android/camera/data/data/config/ComponentConfigUltraPixel;

    move-result-object p1

    invoke-virtual {p1, p0}, Lcom/android/camera/data/data/config/ComponentConfigUltraPixel;->initUltraPixelResource(I)V

    .line 451
    :cond_d
    :goto_0
    nop

    .line 480
    :cond_e
    :goto_1
    goto/16 :goto_3

    .line 483
    :pswitch_2
    invoke-virtual {v0, v3}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    move-result-object p0

    invoke-virtual {p0, v6}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    .line 484
    const/4 p0, 0x1

    if-ne p1, p0, :cond_11

    invoke-static {}, Lcom/mi/config/b;->hn()Z

    move-result p0

    if-eqz p0, :cond_11

    .line 485
    invoke-static {}, Lcom/mi/config/b;->ga()Z

    move-result p0

    if-eqz p0, :cond_f

    invoke-static {}, Lcom/mi/config/b;->fZ()Z

    move-result p0

    if-eqz p0, :cond_f

    .line 486
    invoke-virtual {v0, v5}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    .line 489
    :cond_f
    invoke-static {}, Lcom/mi/config/b;->he()Z

    move-result p0

    if-eqz p0, :cond_10

    .line 490
    invoke-virtual {v0, v4}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    .line 492
    :cond_10
    invoke-static {}, Lcom/mi/config/b;->fP()Z

    move-result p0

    if-eqz p0, :cond_16

    .line 493
    invoke-virtual {v0, v1}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    goto :goto_3

    .line 495
    :cond_11
    if-nez p1, :cond_16

    .line 497
    invoke-static {}, Lcom/android/camera/Util;->UI_DEBUG()Z

    move-result p0

    if-nez p0, :cond_16

    .line 498
    invoke-static {}, Lcom/android/camera/CameraSettings;->isCameraPortraitWithFaceBeauty()Z

    move-result p0

    if-eqz p0, :cond_16

    invoke-static {}, Lcom/mi/config/b;->fZ()Z

    move-result p0

    if-eqz p0, :cond_16

    .line 499
    invoke-virtual {v0, v2}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    goto :goto_3

    .line 505
    :pswitch_3
    invoke-virtual {v0, v3}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    move-result-object p0

    invoke-virtual {p0, v6}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    .line 510
    goto :goto_3

    .line 517
    :pswitch_4
    if-eqz p1, :cond_12

    goto :goto_2

    .line 519
    :cond_12
    invoke-virtual {v0, v3}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    move-result-object p0

    const/16 p1, 0xe9

    invoke-virtual {p0, p1}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    .line 520
    invoke-static {}, Lcom/mi/config/b;->gq()Z

    move-result p0

    if-eqz p0, :cond_13

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object p0

    invoke-virtual {p0}, Lcom/mi/config/a;->fs()Z

    move-result p0

    if-nez p0, :cond_13

    .line 521
    const/16 p0, 0xe8

    invoke-virtual {v0, p0}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    .line 524
    :cond_13
    invoke-static {}, Lcom/android/camera/Util;->UI_DEBUG()Z

    move-result p0

    if-nez p0, :cond_14

    .line 525
    invoke-virtual {p3}, Lcom/android/camera2/CameraCapabilities;->isSupportVideoBeauty()Z

    move-result p0

    if-eqz p0, :cond_14

    .line 526
    invoke-virtual {v0, v2}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    .line 532
    :cond_14
    :goto_2
    goto :goto_3

    .line 536
    :cond_15
    :pswitch_5
    if-nez p1, :cond_16

    .line 537
    invoke-virtual {p3}, Lcom/android/camera2/CameraCapabilities;->isSupportVideoBeauty()Z

    move-result p0

    if-eqz p0, :cond_16

    .line 538
    invoke-virtual {v0, v3}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    .line 540
    invoke-static {}, Lcom/android/camera/Util;->UI_DEBUG()Z

    move-result p0

    if-nez p0, :cond_16

    .line 541
    invoke-virtual {v0, v2}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    .line 548
    :cond_16
    :goto_3
    invoke-interface {p2, v0}, Lcom/android/camera/data/cloud/DataCloud$CloudFeature;->filterFeature(Lcom/android/camera/data/data/config/SupportedConfigs;)Lcom/android/camera/data/data/config/SupportedConfigs;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_0
    .packed-switch 0xa1
        :pswitch_5
        :pswitch_4
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0xa7
        :pswitch_3
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_2
    .end packed-switch

    :pswitch_data_2
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static final getSupportedTopConfigs(ILcom/android/camera/data/data/config/DataItemConfig;ILcom/android/camera2/CameraCapabilities;Z)Lcom/android/camera/data/data/config/SupportedConfigs;
    .locals 10

    .line 210
    invoke-virtual {p1, p0, p3}, Lcom/android/camera/data/data/config/DataItemConfig;->reInitComponent(ILcom/android/camera2/CameraCapabilities;)V

    .line 212
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 214
    invoke-virtual {p1}, Lcom/android/camera/data/data/config/DataItemConfig;->supportFlash()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 215
    invoke-static {p0}, Lcom/android/camera/CameraSettings;->isUltraWideConfigOpen(I)Z

    move-result v1

    const/16 v2, 0xc1

    if-eqz v1, :cond_0

    .line 217
    invoke-static {v2}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object v1

    .line 218
    const/4 v2, 0x0

    iput-boolean v2, v1, Lcom/android/camera/data/data/config/TopConfigItem;->enable:Z

    .line 219
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 220
    goto :goto_0

    .line 221
    :cond_0
    invoke-static {v2}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 224
    :cond_1
    :goto_0
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mi/config/a;->fA()Z

    move-result v1

    .line 225
    const/16 v2, 0xc9

    const/16 v3, 0x11

    const/16 v4, 0xf3

    const/16 v5, 0xc2

    const/4 v6, 0x1

    const/16 v7, 0xc5

    const/16 v8, 0xc4

    const/16 v9, 0xe1

    packed-switch p0, :pswitch_data_0

    .line 228
    :pswitch_0
    invoke-virtual {p1}, Lcom/android/camera/data/data/config/DataItemConfig;->supportHdr()Z

    move-result p0

    if-eqz p0, :cond_16

    .line 229
    invoke-static {v5}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_3

    .line 332
    :pswitch_1
    if-eqz p4, :cond_2

    if-eqz p2, :cond_2

    .line 333
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object p0

    invoke-virtual {p0}, Lcom/mi/config/a;->fd()Z

    move-result p0

    if-eqz p0, :cond_2

    .line 334
    invoke-static {v4}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 336
    :cond_2
    const/16 p0, 0xf5

    invoke-static {p0, v3}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(II)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 337
    invoke-static {v9}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 338
    goto/16 :goto_4

    .line 367
    :pswitch_2
    invoke-static {v9}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_4

    .line 362
    :pswitch_3
    const/16 p0, 0xcc

    invoke-static {p0}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 363
    invoke-static {v9}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 364
    goto/16 :goto_4

    .line 247
    :pswitch_4
    invoke-static {}, Lcom/android/camera/Util;->UI_DEBUG()Z

    move-result p0

    if-nez p0, :cond_4

    .line 248
    if-eqz p4, :cond_4

    invoke-virtual {p3}, Lcom/android/camera2/CameraCapabilities;->isSupportPortraitLighting()Z

    move-result p0

    if-eqz p0, :cond_4

    .line 249
    const/16 p0, 0xcb

    if-nez p2, :cond_3

    .line 250
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object p1

    invoke-virtual {p1}, Lcom/mi/config/a;->eZ()Z

    move-result p1

    if-eqz p1, :cond_4

    .line 251
    invoke-static {p0}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 253
    :cond_3
    if-ne p2, v6, :cond_4

    .line 254
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object p1

    invoke-virtual {p1}, Lcom/mi/config/a;->fa()Z

    move-result p1

    if-eqz p1, :cond_4

    .line 255
    invoke-static {p0}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 260
    :cond_4
    :goto_1
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object p0

    invoke-virtual {p0}, Lcom/mi/config/a;->fx()Z

    move-result p0

    if-eqz p0, :cond_5

    if-nez p2, :cond_5

    if-eqz p4, :cond_5

    .line 262
    const/16 p0, 0xcf

    invoke-static {p0}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 264
    :cond_5
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object p0

    invoke-virtual {p0}, Lcom/mi/config/a;->fc()Z

    move-result p0

    if-eqz p0, :cond_7

    if-eqz p2, :cond_6

    .line 266
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object p0

    invoke-virtual {p0}, Lcom/mi/config/a;->fb()Z

    move-result p0

    if-eqz p0, :cond_7

    if-ne p2, v6, :cond_7

    .line 268
    :cond_6
    invoke-static {v2}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 270
    :cond_7
    invoke-static {v8, v3}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(II)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 271
    invoke-static {v7}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 272
    goto/16 :goto_4

    .line 303
    :pswitch_5
    invoke-virtual {p1}, Lcom/android/camera/data/data/config/DataItemConfig;->getManuallyFocus()Lcom/android/camera/data/data/config/ComponentManuallyFocus;

    move-result-object p1

    .line 304
    invoke-static {}, Lcom/mi/config/b;->gO()Z

    move-result p2

    if-eqz p2, :cond_8

    .line 305
    invoke-virtual {p1, p0}, Lcom/android/camera/data/data/config/ComponentManuallyFocus;->getComponentValue(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p0}, Lcom/android/camera/data/data/config/ComponentManuallyFocus;->getDefaultValue(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_8

    .line 306
    const/16 p0, 0xc7

    invoke-static {p0}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 308
    :cond_8
    invoke-static {p3}, Lcom/android/camera/CameraSettings;->isSupportedUltraPixelPhotography(Lcom/android/camera2/CameraCapabilities;)Z

    move-result p0

    if-eqz p0, :cond_9

    if-eqz p4, :cond_9

    .line 309
    const/16 p0, 0xd1

    invoke-static {p0}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 310
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object p0

    invoke-virtual {p0}, Lcom/mi/config/a;->fN()I

    move-result p0

    .line 311
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/data/data/config/DataItemConfig;->getRearComponentConfigUltraPixel()Lcom/android/camera/data/data/config/ComponentConfigUltraPixel;

    move-result-object p1

    invoke-virtual {p1, p0}, Lcom/android/camera/data/data/config/ComponentConfigUltraPixel;->initUltraPixelResource(I)V

    .line 313
    :cond_9
    invoke-static {v8}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 314
    invoke-static {v7}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 315
    goto/16 :goto_4

    .line 357
    :pswitch_6
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 358
    invoke-static {v9}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 359
    goto/16 :goto_4

    .line 318
    :pswitch_7
    invoke-virtual {p1}, Lcom/android/camera/data/data/config/DataItemConfig;->supportHdr()Z

    move-result p0

    if-eqz p0, :cond_a

    .line 319
    invoke-static {v5}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 322
    :cond_a
    invoke-static {}, Lcom/mi/config/b;->gz()Z

    move-result p0

    if-eqz p0, :cond_b

    if-eqz p2, :cond_c

    .line 323
    :cond_b
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object p0

    invoke-virtual {p0}, Lcom/mi/config/a;->fb()Z

    move-result p0

    if-eqz p0, :cond_d

    if-ne p2, v6, :cond_d

    .line 324
    :cond_c
    invoke-static {v2}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 327
    :cond_d
    invoke-static {v8}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 328
    invoke-static {v7}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 329
    goto/16 :goto_4

    .line 278
    :pswitch_8
    if-nez p2, :cond_11

    .line 279
    if-nez p4, :cond_e

    .line 280
    invoke-static {v9}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_4

    .line 282
    :cond_e
    invoke-virtual {p1}, Lcom/android/camera/data/data/config/DataItemConfig;->supportHdr()Z

    move-result p0

    if-eqz p0, :cond_f

    .line 283
    invoke-static {v5}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 285
    :cond_f
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object p0

    invoke-virtual {p0}, Lcom/mi/config/a;->fs()Z

    move-result p0

    if-nez p0, :cond_10

    .line 286
    invoke-static {}, Lcom/mi/config/b;->gq()Z

    move-result p0

    if-eqz p0, :cond_10

    invoke-static {}, Lcom/mi/config/b;->hI()Z

    move-result p0

    if-eqz p0, :cond_10

    .line 287
    const/16 p0, 0xca

    invoke-static {p0}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 290
    :cond_10
    invoke-static {v7}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_4

    .line 293
    :cond_11
    if-eqz p4, :cond_12

    const/16 p1, 0xa2

    if-ne p0, p1, :cond_12

    .line 294
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object p0

    invoke-virtual {p0}, Lcom/mi/config/a;->fd()Z

    move-result p0

    if-eqz p0, :cond_12

    .line 295
    invoke-static {v4}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 297
    :cond_12
    invoke-static {v9}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 299
    goto/16 :goto_4

    .line 340
    :pswitch_9
    if-eqz p4, :cond_13

    if-eqz p2, :cond_13

    .line 341
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object p0

    invoke-virtual {p0}, Lcom/mi/config/a;->fd()Z

    move-result p0

    if-eqz p0, :cond_13

    .line 342
    invoke-static {v4}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 344
    :cond_13
    if-ne p2, v6, :cond_14

    .line 345
    invoke-static {v8, v3}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(II)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 347
    :cond_14
    invoke-static {v8}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 349
    :goto_2
    if-nez p2, :cond_15

    invoke-virtual {p3}, Lcom/android/camera2/CameraCapabilities;->isSupportVideoBeauty()Z

    move-result p0

    if-eqz p0, :cond_15

    .line 350
    invoke-static {v7}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_4

    .line 352
    :cond_15
    invoke-static {v9}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 354
    goto :goto_4

    .line 232
    :cond_16
    :goto_3
    invoke-static {}, Lcom/mi/config/b;->gz()Z

    move-result p0

    if-eqz p0, :cond_17

    if-eqz p2, :cond_18

    .line 233
    :cond_17
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object p0

    invoke-virtual {p0}, Lcom/mi/config/a;->fb()Z

    move-result p0

    if-eqz p0, :cond_19

    if-ne p2, v6, :cond_19

    .line 234
    :cond_18
    invoke-static {v2}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 237
    :cond_19
    if-eqz v1, :cond_1a

    if-eqz p4, :cond_1a

    .line 238
    const/16 p0, 0xce

    invoke-static {p0}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 240
    :cond_1a
    invoke-static {v8}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 241
    invoke-static {v7}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 243
    nop

    .line 370
    :goto_4
    invoke-static {v0}, Lcom/android/camera/data/data/config/TopViewPositionArray;->fillNotUseViewPosition(Ljava/util/List;)Ljava/util/List;

    .line 371
    new-instance p0, Lcom/android/camera/data/data/config/SupportedConfigs;

    invoke-direct {p0}, Lcom/android/camera/data/data/config/SupportedConfigs;-><init>()V

    .line 372
    invoke-virtual {p0, v0}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(Ljava/util/List;)V

    .line 373
    return-object p0

    :pswitch_data_0
    .packed-switch 0xa1
        :pswitch_9
        :pswitch_8
        :pswitch_0
        :pswitch_0
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_8
        :pswitch_8
        :pswitch_8
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method public static isMutexConfig(I)Z
    .locals 5

    .line 157
    sget-object v0, Lcom/android/camera/data/data/config/SupportedConfigFactory;->MUTEX_MENU_CONFIGS:[I

    array-length v1, v0

    const/4 v2, 0x0

    move v3, v2

    :goto_0
    if-ge v3, v1, :cond_1

    aget v4, v0, v3

    .line 158
    if-ne v4, p0, :cond_0

    .line 159
    const/4 p0, 0x1

    return p0

    .line 157
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 162
    :cond_1
    return v2
.end method
