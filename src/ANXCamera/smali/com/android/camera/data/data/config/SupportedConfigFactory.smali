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

.field public static final CLOSE_BY_GROUP:Ljava/lang/String; = "b"

.field public static final CLOSE_BY_HDR:Ljava/lang/String; = "g"

.field public static final CLOSE_BY_HHT:Ljava/lang/String; = "a"

.field public static final CLOSE_BY_SUPER_RESOLUTION:Ljava/lang/String; = "c"

.field public static final CLOSE_BY_VIDEO:Ljava/lang/String; = "h"

.field public static final DUAL_WATER_MARK:I = 0xf0

.field public static final FAST:I = 0xe9

.field public static final FILTER:I = 0xc4

.field public static final FLASH:I = 0xc1

.field public static final FOCUS_PEAK:I = 0xc7

.field public static final GENDER_AGE:I = 0xee

.field public static final GRADIENTER:I = 0xe5

.field public static final GROUP:I = 0xeb

.field public static final HDR:I = 0xc2

.field public static final HFR:I = 0xca

.field public static final HHT:I = 0xe6

.field public static final INVALID:I = 0xc6

.field public static final LIGHTING:I = 0xcb

.field public static final LIVE_MUSIC_SELECT:I = 0xf5

.field public static final LIVE_SHOT:I = 0xce

.field public static final MAGIC_FOCUS:I = 0xe7

.field public static final MAGIC_MIRROR:I = 0xec

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


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 98
    const/16 v0, 0xc

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
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static findViewPosition(I)I
    .locals 0

    .line 552
    invoke-static {p0}, Lcom/android/camera/data/data/config/TopViewPositionArray;->getCurrentUseViewPositionFromConfig(I)I

    move-result p0

    return p0
.end method

.method private static getConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;
    .locals 1

    .line 405
    new-instance v0, Lcom/android/camera/data/data/config/TopConfigItem;

    invoke-direct {v0, p0}, Lcom/android/camera/data/data/config/TopConfigItem;-><init>(I)V

    return-object v0
.end method

.method private static getConfigItem(II)Lcom/android/camera/data/data/config/TopConfigItem;
    .locals 1

    .line 401
    new-instance v0, Lcom/android/camera/data/data/config/TopConfigItem;

    invoke-direct {v0, p0, p1}, Lcom/android/camera/data/data/config/TopConfigItem;-><init>(II)V

    return-object v0
.end method

.method public static getConfigKey(I)Ljava/lang/String;
    .locals 1

    .line 152
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

    .line 178
    new-instance p0, Ljava/lang/RuntimeException;

    const-string v0, "unknown config item"

    invoke-direct {p0, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 156
    :pswitch_0
    const-string p0, "pref_camera_magic_mirror_key"

    return-object p0

    .line 158
    :pswitch_1
    const-string p0, "pref_camera_groupshot_mode_key"

    return-object p0

    .line 166
    :pswitch_2
    const-string p0, "pref_camera_scenemode_setting_key"

    return-object p0

    .line 162
    :pswitch_3
    const-string p0, "pref_camera_hand_night_key"

    return-object p0

    .line 154
    :pswitch_4
    const-string p0, "pref_camera_gradienter_key"

    return-object p0

    .line 160
    :pswitch_5
    const-string p0, "pref_camera_tilt_shift_mode"

    return-object p0

    .line 164
    :cond_0
    const-string p0, "pref_camera_super_resolution_key"

    return-object p0

    .line 170
    :cond_1
    const-string p0, "pref_camera_show_gender_age_key"

    return-object p0

    .line 176
    :cond_2
    const-string p0, "pref_live_shot_enabled"

    return-object p0

    .line 174
    :cond_3
    const-string p0, "pref_camera_ai_scene_mode_key"

    return-object p0

    .line 172
    :cond_4
    const-string p0, "pref_camera_peak_key"

    return-object p0

    .line 168
    :cond_5
    const-string p0, "pref_camera_portrait_mode_key"

    return-object p0

    :pswitch_data_0
    .packed-switch 0xe4
        :pswitch_5
        :pswitch_4
        :pswitch_3
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0xea
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static final getSupportedExtraConfigs(IILcom/android/camera/data/cloud/DataCloud$CloudFeature;Lcom/android/camera2/CameraCapabilities;Z)Lcom/android/camera/data/data/config/SupportedConfigs;
    .locals 6

    .line 411
    new-instance v0, Lcom/android/camera/data/data/config/SupportedConfigs;

    invoke-direct {v0}, Lcom/android/camera/data/data/config/SupportedConfigs;-><init>()V

    .line 416
    const/16 v1, 0xae

    const/16 v2, 0xef

    const/16 v3, 0xe1

    if-eq p0, v1, :cond_f

    packed-switch p0, :pswitch_data_0

    const/16 v1, 0xec

    const/16 v4, 0xee

    const/16 v5, 0xe2

    packed-switch p0, :pswitch_data_1

    .line 421
    invoke-virtual {v0, v3}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    move-result-object p3

    invoke-virtual {p3, v5}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    .line 423
    const/16 p3, 0xa3

    const/16 v3, 0xeb

    const/16 v5, 0xa5

    packed-switch p1, :pswitch_data_2

    goto/16 :goto_0

    .line 468
    :pswitch_0
    invoke-static {}, Lcom/mi/config/b;->hg()Z

    move-result p1

    if-eqz p1, :cond_0

    if-eq p0, v5, :cond_0

    .line 469
    invoke-virtual {v0, v3}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    .line 471
    :cond_0
    if-eq p0, v5, :cond_1

    if-ne p0, p3, :cond_9

    .line 472
    :cond_1
    invoke-static {}, Lcom/mi/config/b;->fN()Z

    move-result p0

    if-eqz p0, :cond_2

    invoke-static {}, Lcom/mi/config/b;->fM()Z

    move-result p0

    if-eqz p0, :cond_2

    .line 473
    invoke-virtual {v0, v4}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    .line 476
    :cond_2
    invoke-static {}, Lcom/mi/config/b;->gS()Z

    move-result p0

    if-eqz p0, :cond_9

    .line 477
    invoke-virtual {v0, v1}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    goto :goto_0

    .line 425
    :pswitch_1
    invoke-static {}, Lcom/mi/config/b;->gN()Z

    move-result p1

    if-eqz p1, :cond_3

    .line 426
    const/16 p1, 0xe4

    invoke-virtual {v0, p1}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    .line 429
    :cond_3
    invoke-static {}, Lcom/mi/config/b;->gG()Z

    move-result p1

    if-eqz p1, :cond_4

    .line 430
    const/16 p1, 0xe5

    invoke-virtual {v0, p1}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    .line 433
    :cond_4
    invoke-static {}, Lcom/mi/config/b;->gm()Z

    move-result p1

    if-eqz p1, :cond_5

    .line 434
    const/16 p1, 0xea

    invoke-virtual {v0, p1}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    .line 437
    :cond_5
    if-eq p0, v5, :cond_6

    if-eqz p4, :cond_6

    .line 438
    invoke-static {}, Lcom/mi/config/b;->hg()Z

    move-result p1

    if-eqz p1, :cond_6

    .line 439
    invoke-virtual {v0, v3}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    .line 446
    :cond_6
    invoke-static {}, Lcom/android/camera/Util;->UI_DEBUG()Z

    move-result p1

    if-nez p1, :cond_8

    .line 447
    if-eq p0, v5, :cond_7

    if-ne p0, p3, :cond_8

    .line 448
    :cond_7
    invoke-static {}, Lcom/mi/config/b;->fM()Z

    move-result p0

    if-eqz p0, :cond_8

    .line 449
    invoke-virtual {v0, v2}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    .line 462
    :cond_8
    if-eqz p4, :cond_9

    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lcom/android/camera/CameraSettings;->checkLensAvailability(Landroid/content/Context;)Z

    move-result p0

    if-eqz p0, :cond_9

    .line 463
    const/16 p0, 0xf2

    invoke-virtual {v0, p0}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    .line 483
    :cond_9
    :goto_0
    goto/16 :goto_2

    .line 486
    :pswitch_2
    invoke-virtual {v0, v3}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    move-result-object p0

    invoke-virtual {p0, v5}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    .line 487
    const/4 p0, 0x1

    if-ne p1, p0, :cond_b

    invoke-static {}, Lcom/mi/config/b;->hb()Z

    move-result p0

    if-eqz p0, :cond_b

    .line 488
    invoke-static {}, Lcom/mi/config/b;->fN()Z

    move-result p0

    if-eqz p0, :cond_a

    invoke-static {}, Lcom/mi/config/b;->fM()Z

    move-result p0

    if-eqz p0, :cond_a

    .line 489
    invoke-virtual {v0, v4}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    .line 492
    :cond_a
    invoke-static {}, Lcom/mi/config/b;->gS()Z

    move-result p0

    if-eqz p0, :cond_10

    .line 493
    invoke-virtual {v0, v1}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    goto :goto_2

    .line 495
    :cond_b
    if-nez p1, :cond_10

    .line 497
    invoke-static {}, Lcom/android/camera/Util;->UI_DEBUG()Z

    move-result p0

    if-nez p0, :cond_10

    .line 498
    invoke-static {}, Lcom/android/camera/CameraSettings;->isCameraPortraitWithFaceBeauty()Z

    move-result p0

    if-eqz p0, :cond_10

    invoke-static {}, Lcom/mi/config/b;->fM()Z

    move-result p0

    if-eqz p0, :cond_10

    .line 499
    invoke-virtual {v0, v2}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    goto :goto_2

    .line 505
    :pswitch_3
    invoke-virtual {v0, v3}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    move-result-object p0

    invoke-virtual {p0, v5}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    .line 510
    goto :goto_2

    .line 517
    :pswitch_4
    if-eqz p1, :cond_c

    goto :goto_1

    .line 519
    :cond_c
    invoke-virtual {v0, v3}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    move-result-object p0

    const/16 p1, 0xe9

    invoke-virtual {p0, p1}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    .line 520
    invoke-static {}, Lcom/mi/config/b;->ge()Z

    move-result p0

    if-eqz p0, :cond_d

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object p0

    invoke-virtual {p0}, Lcom/mi/config/a;->fp()Z

    move-result p0

    if-nez p0, :cond_d

    .line 521
    const/16 p0, 0xe8

    invoke-virtual {v0, p0}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    .line 524
    :cond_d
    invoke-static {}, Lcom/android/camera/Util;->UI_DEBUG()Z

    move-result p0

    if-nez p0, :cond_e

    .line 525
    invoke-virtual {p3}, Lcom/android/camera2/CameraCapabilities;->isSupportVideoBeauty()Z

    move-result p0

    if-eqz p0, :cond_e

    .line 526
    invoke-virtual {v0, v2}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    .line 532
    :cond_e
    :goto_1
    goto :goto_2

    .line 536
    :cond_f
    :pswitch_5
    if-nez p1, :cond_10

    .line 537
    invoke-virtual {p3}, Lcom/android/camera2/CameraCapabilities;->isSupportVideoBeauty()Z

    move-result p0

    if-eqz p0, :cond_10

    .line 538
    invoke-virtual {v0, v3}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    .line 540
    invoke-static {}, Lcom/android/camera/Util;->UI_DEBUG()Z

    move-result p0

    if-nez p0, :cond_10

    .line 541
    invoke-virtual {v0, v2}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    .line 548
    :cond_10
    :goto_2
    invoke-interface {p2, v0}, Lcom/android/camera/data/cloud/DataCloud$CloudFeature;->filterFeature(Lcom/android/camera/data/data/config/SupportedConfigs;)Lcom/android/camera/data/data/config/SupportedConfigs;

    move-result-object p0

    return-object p0

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
    .locals 17

    move/from16 v0, p0

    move/from16 v1, p2

    .line 191
    move-object/from16 v3, p1

    move-object/from16 v4, p3

    invoke-virtual {v3, v0, v4}, Lcom/android/camera/data/data/config/DataItemConfig;->reInitComponent(ILcom/android/camera2/CameraCapabilities;)V

    .line 193
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 195
    invoke-virtual/range {p1 .. p1}, Lcom/android/camera/data/data/config/DataItemConfig;->supportFlash()Z

    move-result v6

    const/16 v7, 0xc1

    if-eqz v6, :cond_0

    .line 196
    invoke-static {v7}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->getConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object v6

    invoke-interface {v5, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 197
    :cond_0
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v6

    invoke-virtual {v6}, Lcom/mi/config/a;->fu()Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-static {}, Lcom/android/camera/CameraSettings;->isUltraWideConfigOpen()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 199
    invoke-static {v7}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->getConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object v6

    .line 200
    const/4 v7, 0x0

    iput-boolean v7, v6, Lcom/android/camera/data/data/config/TopConfigItem;->enable:Z

    .line 201
    invoke-interface {v5, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 203
    :cond_1
    :goto_0
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v6

    invoke-virtual {v6}, Lcom/mi/config/a;->fu()Z

    move-result v6

    .line 204
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v7

    invoke-virtual {v7}, Lcom/mi/config/a;->fy()Z

    move-result v7

    .line 205
    const/16 v8, 0xc9

    const/16 v9, 0x11

    const/16 v10, 0xf3

    const/16 v12, 0xcd

    const/16 v13, 0xe1

    const/16 v14, 0xc5

    const/16 v15, 0xc4

    const/4 v11, 0x1

    packed-switch v0, :pswitch_data_0

    .line 208
    :pswitch_0
    invoke-virtual/range {p1 .. p1}, Lcom/android/camera/data/data/config/DataItemConfig;->supportHdr()Z

    move-result v0

    if-eqz v0, :cond_22

    .line 209
    const/16 v0, 0xc2

    invoke-static {v0}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->getConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object v0

    invoke-interface {v5, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_4

    .line 332
    :pswitch_1
    if-eqz v6, :cond_2

    if-nez v1, :cond_2

    .line 333
    invoke-static {v12}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->getConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object v0

    invoke-interface {v5, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 335
    :cond_2
    if-eqz p4, :cond_3

    if-eqz v1, :cond_3

    .line 336
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->fb()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 337
    invoke-static {v10}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->getConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object v0

    invoke-interface {v5, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 339
    :cond_3
    const/16 v0, 0xf5

    invoke-static {v0}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->getConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object v0

    invoke-interface {v5, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 341
    invoke-static {}, Lcom/android/camera/Util;->UI_DEBUG()Z

    move-result v0

    if-nez v0, :cond_5

    .line 342
    if-ne v1, v11, :cond_4

    .line 343
    invoke-static {v15, v9}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->getConfigItem(II)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object v0

    invoke-interface {v5, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 345
    :cond_4
    invoke-static {v15}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->getConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object v0

    invoke-interface {v5, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 348
    :cond_5
    :goto_1
    if-nez v1, :cond_6

    invoke-virtual/range {p3 .. p3}, Lcom/android/camera2/CameraCapabilities;->isSupportVideoBeauty()Z

    move-result v0

    if-eqz v0, :cond_6

    .line 349
    invoke-static {v14}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->getConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object v0

    invoke-interface {v5, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_5

    .line 351
    :cond_6
    invoke-static {v13}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->getConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object v0

    invoke-interface {v5, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 353
    goto/16 :goto_5

    .line 388
    :pswitch_2
    if-eqz v6, :cond_7

    .line 389
    invoke-static {v12, v11}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->getConfigItem(II)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object v0

    invoke-interface {v5, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 391
    :cond_7
    invoke-static {v13}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->getConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object v0

    invoke-interface {v5, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_5

    .line 383
    :pswitch_3
    const/16 v0, 0xcc

    invoke-static {v0}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->getConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object v0

    invoke-interface {v5, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 384
    invoke-static {v13}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->getConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object v0

    invoke-interface {v5, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 385
    goto/16 :goto_5

    .line 234
    :pswitch_4
    if-eqz p4, :cond_9

    invoke-virtual/range {p3 .. p3}, Lcom/android/camera2/CameraCapabilities;->isSupportPortraitLighting()Z

    move-result v0

    if-eqz v0, :cond_9

    .line 235
    const/16 v0, 0xcb

    if-nez v1, :cond_8

    .line 236
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mi/config/a;->eX()Z

    move-result v2

    if-eqz v2, :cond_9

    .line 237
    invoke-static {v0}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->getConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object v0

    invoke-interface {v5, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 239
    :cond_8
    if-ne v1, v11, :cond_9

    .line 240
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mi/config/a;->eY()Z

    move-result v2

    if-eqz v2, :cond_9

    .line 241
    invoke-static {v0}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->getConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object v0

    invoke-interface {v5, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 245
    :cond_9
    :goto_2
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->fa()Z

    move-result v0

    if-eqz v0, :cond_b

    if-eqz v1, :cond_a

    .line 247
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->eZ()Z

    move-result v0

    if-eqz v0, :cond_b

    if-ne v1, v11, :cond_b

    .line 249
    :cond_a
    invoke-static {v8}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->getConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object v0

    invoke-interface {v5, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 251
    :cond_b
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->fu()Z

    move-result v0

    if-eqz v0, :cond_c

    if-nez v1, :cond_c

    .line 253
    const/16 v0, 0xcf

    invoke-static {v0}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->getConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object v0

    invoke-interface {v5, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 256
    :cond_c
    invoke-static {}, Lcom/android/camera/Util;->UI_DEBUG()Z

    move-result v0

    if-nez v0, :cond_d

    .line 257
    invoke-static {v15, v9}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->getConfigItem(II)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object v0

    invoke-interface {v5, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 259
    :cond_d
    invoke-static {v14}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->getConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object v0

    invoke-interface {v5, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 260
    goto/16 :goto_5

    .line 295
    :pswitch_5
    invoke-virtual/range {p1 .. p1}, Lcom/android/camera/data/data/config/DataItemConfig;->getManuallyFocus()Lcom/android/camera/data/data/config/ComponentManuallyFocus;

    move-result-object v1

    .line 296
    invoke-static {}, Lcom/mi/config/b;->gC()Z

    move-result v2

    if-eqz v2, :cond_e

    .line 297
    invoke-virtual {v1, v0}, Lcom/android/camera/data/data/config/ComponentManuallyFocus;->getComponentValue(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v0}, Lcom/android/camera/data/data/config/ComponentManuallyFocus;->getDefaultValue(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_e

    .line 298
    const/16 v0, 0xc7

    invoke-static {v0}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->getConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object v0

    invoke-interface {v5, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 300
    :cond_e
    invoke-virtual/range {p3 .. p3}, Lcom/android/camera2/CameraCapabilities;->isUltraPixelPhotographySupported()Z

    move-result v0

    if-eqz v0, :cond_f

    .line 301
    const/16 v0, 0xd1

    invoke-static {v0}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->getConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object v0

    invoke-interface {v5, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 304
    :cond_f
    invoke-static {}, Lcom/android/camera/Util;->UI_DEBUG()Z

    move-result v0

    if-nez v0, :cond_10

    .line 305
    invoke-static {v15}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->getConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object v0

    invoke-interface {v5, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 307
    :cond_10
    invoke-static {v14}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->getConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object v0

    invoke-interface {v5, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 308
    goto/16 :goto_5

    .line 378
    :pswitch_6
    invoke-interface {v5}, Ljava/util/List;->clear()V

    .line 379
    invoke-static {v13}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->getConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object v0

    invoke-interface {v5, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 380
    goto/16 :goto_5

    .line 311
    :pswitch_7
    invoke-virtual/range {p1 .. p1}, Lcom/android/camera/data/data/config/DataItemConfig;->supportHdr()Z

    move-result v0

    if-eqz v0, :cond_11

    .line 312
    const/16 v0, 0xc2

    invoke-static {v0}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->getConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object v0

    invoke-interface {v5, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 315
    :cond_11
    invoke-static {}, Lcom/mi/config/b;->gn()Z

    move-result v0

    if-eqz v0, :cond_12

    if-eqz v1, :cond_13

    .line 316
    :cond_12
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->eZ()Z

    move-result v0

    if-eqz v0, :cond_14

    if-ne v1, v11, :cond_14

    .line 317
    :cond_13
    invoke-static {v8}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->getConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object v0

    invoke-interface {v5, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 320
    :cond_14
    if-eqz v6, :cond_15

    if-nez v1, :cond_15

    .line 321
    invoke-static {v12}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->getConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object v0

    invoke-interface {v5, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 325
    :cond_15
    invoke-static {}, Lcom/android/camera/Util;->UI_DEBUG()Z

    move-result v0

    if-nez v0, :cond_16

    .line 326
    invoke-static {v15}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->getConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object v0

    invoke-interface {v5, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 328
    :cond_16
    invoke-static {v14}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->getConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object v0

    invoke-interface {v5, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 329
    goto/16 :goto_5

    .line 266
    :pswitch_8
    if-nez v1, :cond_1b

    .line 267
    if-nez p4, :cond_17

    .line 268
    invoke-static {v13}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->getConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object v0

    invoke-interface {v5, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_5

    .line 270
    :cond_17
    invoke-virtual/range {p1 .. p1}, Lcom/android/camera/data/data/config/DataItemConfig;->supportHdr()Z

    move-result v0

    if-eqz v0, :cond_18

    .line 271
    const/16 v0, 0xc2

    invoke-static {v0}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->getConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object v0

    invoke-interface {v5, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 273
    :cond_18
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->fp()Z

    move-result v0

    if-nez v0, :cond_19

    .line 274
    invoke-static {}, Lcom/mi/config/b;->ge()Z

    move-result v0

    if-eqz v0, :cond_19

    invoke-static {}, Lcom/mi/config/b;->hx()Z

    move-result v0

    if-eqz v0, :cond_19

    .line 275
    const/16 v0, 0xca

    invoke-static {v0}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->getConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object v0

    invoke-interface {v5, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 278
    :cond_19
    if-eqz v6, :cond_1a

    .line 279
    invoke-static {v12}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->getConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object v0

    invoke-interface {v5, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 282
    :cond_1a
    invoke-static {v14}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->getConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object v0

    invoke-interface {v5, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_5

    .line 285
    :cond_1b
    if-eqz p4, :cond_1c

    const/16 v1, 0xa2

    if-ne v0, v1, :cond_1c

    .line 286
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->fb()Z

    move-result v0

    if-eqz v0, :cond_1c

    .line 287
    invoke-static {v10}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->getConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object v0

    invoke-interface {v5, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 289
    :cond_1c
    invoke-static {v13}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->getConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object v0

    invoke-interface {v5, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 291
    goto/16 :goto_5

    .line 355
    :pswitch_9
    if-eqz v6, :cond_1d

    if-nez v1, :cond_1d

    .line 356
    invoke-static {v12}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->getConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object v0

    invoke-interface {v5, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 358
    :cond_1d
    if-eqz p4, :cond_1e

    if-eqz v1, :cond_1e

    .line 359
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->fb()Z

    move-result v0

    if-eqz v0, :cond_1e

    .line 360
    invoke-static {v10}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->getConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object v0

    invoke-interface {v5, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 363
    :cond_1e
    invoke-static {}, Lcom/android/camera/Util;->UI_DEBUG()Z

    move-result v0

    if-nez v0, :cond_20

    .line 364
    if-ne v1, v11, :cond_1f

    .line 365
    invoke-static {v15, v9}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->getConfigItem(II)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object v0

    invoke-interface {v5, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_3

    .line 367
    :cond_1f
    invoke-static {v15}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->getConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object v0

    invoke-interface {v5, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 370
    :cond_20
    :goto_3
    if-nez v1, :cond_21

    invoke-virtual/range {p3 .. p3}, Lcom/android/camera2/CameraCapabilities;->isSupportVideoBeauty()Z

    move-result v0

    if-eqz v0, :cond_21

    .line 371
    invoke-static {v14}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->getConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object v0

    invoke-interface {v5, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_5

    .line 373
    :cond_21
    invoke-static {v13}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->getConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object v0

    invoke-interface {v5, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 375
    goto :goto_5

    .line 212
    :cond_22
    :goto_4
    invoke-static {}, Lcom/mi/config/b;->gn()Z

    move-result v0

    if-eqz v0, :cond_23

    if-eqz v1, :cond_24

    .line 213
    :cond_23
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->eZ()Z

    move-result v0

    if-eqz v0, :cond_25

    if-ne v1, v11, :cond_25

    .line 214
    :cond_24
    invoke-static {v8}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->getConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object v0

    invoke-interface {v5, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 217
    :cond_25
    if-eqz v6, :cond_26

    if-eq v1, v11, :cond_26

    .line 218
    invoke-static {v12}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->getConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object v0

    invoke-interface {v5, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 221
    :cond_26
    if-eqz v7, :cond_27

    if-eqz p4, :cond_27

    .line 222
    const/16 v0, 0xce

    invoke-static {v0}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->getConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object v0

    invoke-interface {v5, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 226
    :cond_27
    invoke-static {}, Lcom/android/camera/Util;->UI_DEBUG()Z

    move-result v0

    if-nez v0, :cond_28

    .line 227
    invoke-static {v15}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->getConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object v0

    invoke-interface {v5, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 229
    :cond_28
    invoke-static {v14}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->getConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object v0

    invoke-interface {v5, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 231
    nop

    .line 394
    :goto_5
    invoke-static {v5}, Lcom/android/camera/data/data/config/TopViewPositionArray;->fillNotUseViewPosition(Ljava/util/List;)Ljava/util/List;

    .line 395
    new-instance v0, Lcom/android/camera/data/data/config/SupportedConfigs;

    invoke-direct {v0}, Lcom/android/camera/data/data/config/SupportedConfigs;-><init>()V

    .line 396
    invoke-virtual {v0, v5}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(Ljava/util/List;)V

    .line 397
    return-object v0

    nop

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

    .line 143
    sget-object v0, Lcom/android/camera/data/data/config/SupportedConfigFactory;->MUTEX_MENU_CONFIGS:[I

    array-length v1, v0

    const/4 v2, 0x0

    move v3, v2

    :goto_0
    if-ge v3, v1, :cond_1

    aget v4, v0, v3

    .line 144
    if-ne v4, p0, :cond_0

    .line 145
    const/4 p0, 0x1

    return p0

    .line 143
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 148
    :cond_1
    return v2
.end method
