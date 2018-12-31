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

.field public static final MENU_ULTRA_PIXEL_PHOTOGRAPHY:I = 0xfa

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

    .line 99
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

.method private static createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;
    .locals 1

    .line 365
    new-instance v0, Lcom/android/camera/data/data/config/TopConfigItem;

    invoke-direct {v0, p0}, Lcom/android/camera/data/data/config/TopConfigItem;-><init>(I)V

    return-object v0
.end method

.method private static createConfigItem(II)Lcom/android/camera/data/data/config/TopConfigItem;
    .locals 1

    .line 361
    new-instance v0, Lcom/android/camera/data/data/config/TopConfigItem;

    invoke-direct {v0, p0, p1}, Lcom/android/camera/data/data/config/TopConfigItem;-><init>(II)V

    return-object v0
.end method

.method public static findViewPosition(I)I
    .locals 0

    .line 515
    invoke-static {p0}, Lcom/android/camera/data/data/config/TopViewPositionArray;->getCurrentUseViewPositionFromConfig(I)I

    move-result p0

    return p0
.end method

.method public static getConfigKey(I)Ljava/lang/String;
    .locals 1

    .line 153
    const/16 v0, 0xc3

    if-eq p0, v0, :cond_6

    const/16 v0, 0xc7

    if-eq p0, v0, :cond_5

    const/16 v0, 0xc9

    if-eq p0, v0, :cond_4

    const/16 v0, 0xce

    if-eq p0, v0, :cond_3

    const/16 v0, 0xee

    if-eq p0, v0, :cond_2

    const/16 v0, 0xf1

    if-eq p0, v0, :cond_1

    const/16 v0, 0xfa

    if-eq p0, v0, :cond_0

    packed-switch p0, :pswitch_data_0

    packed-switch p0, :pswitch_data_1

    .line 181
    new-instance p0, Ljava/lang/RuntimeException;

    const-string v0, "unknown config item"

    invoke-direct {p0, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 157
    :pswitch_0
    const-string p0, "pref_camera_magic_mirror_key"

    return-object p0

    .line 159
    :pswitch_1
    const-string p0, "pref_camera_groupshot_mode_key"

    return-object p0

    .line 167
    :pswitch_2
    const-string p0, "pref_camera_scenemode_setting_key"

    return-object p0

    .line 163
    :pswitch_3
    const-string p0, "pref_camera_hand_night_key"

    return-object p0

    .line 155
    :pswitch_4
    const-string p0, "pref_camera_gradienter_key"

    return-object p0

    .line 161
    :pswitch_5
    const-string p0, "pref_camera_tilt_shift_mode"

    return-object p0

    .line 179
    :cond_0
    const-string p0, "pref_menu_ultra_pixel_photography_48mp"

    return-object p0

    .line 165
    :cond_1
    const-string p0, "pref_camera_super_resolution_key"

    return-object p0

    .line 171
    :cond_2
    const-string p0, "pref_camera_show_gender_age_key"

    return-object p0

    .line 177
    :cond_3
    const-string p0, "pref_live_shot_enabled"

    return-object p0

    .line 175
    :cond_4
    const-string p0, "pref_camera_ai_scene_mode_key"

    return-object p0

    .line 173
    :cond_5
    const-string p0, "pref_camera_peak_key"

    return-object p0

    .line 169
    :cond_6
    const-string p0, "pref_camera_portrait_mode_key"

    return-object p0

    nop

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
    .locals 7

    .line 371
    new-instance v0, Lcom/android/camera/data/data/config/SupportedConfigs;

    invoke-direct {v0}, Lcom/android/camera/data/data/config/SupportedConfigs;-><init>()V

    .line 376
    const/16 v1, 0xae

    const/16 v2, 0xef

    const/16 v3, 0xe1

    if-eq p0, v1, :cond_10

    packed-switch p0, :pswitch_data_0

    const/16 v1, 0xec

    const/16 v4, 0xee

    const/16 v5, 0xe2

    packed-switch p0, :pswitch_data_1

    .line 381
    invoke-virtual {v0, v3}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    move-result-object v3

    invoke-virtual {v3, v5}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    .line 383
    const/16 v3, 0xa3

    const/16 v5, 0xeb

    const/16 v6, 0xa5

    packed-switch p1, :pswitch_data_2

    goto/16 :goto_0

    .line 431
    :pswitch_0
    invoke-static {}, Lcom/mi/config/b;->hj()Z

    move-result p1

    if-eqz p1, :cond_0

    if-eq p0, v6, :cond_0

    .line 432
    invoke-virtual {v0, v5}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    .line 434
    :cond_0
    if-eq p0, v6, :cond_1

    if-ne p0, v3, :cond_a

    .line 435
    :cond_1
    invoke-static {}, Lcom/mi/config/b;->fQ()Z

    move-result p0

    if-eqz p0, :cond_2

    invoke-static {}, Lcom/mi/config/b;->fP()Z

    move-result p0

    if-eqz p0, :cond_2

    .line 436
    invoke-virtual {v0, v4}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    .line 439
    :cond_2
    invoke-static {}, Lcom/mi/config/b;->gV()Z

    move-result p0

    if-eqz p0, :cond_a

    .line 440
    invoke-virtual {v0, v1}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    goto :goto_0

    .line 385
    :pswitch_1
    invoke-static {}, Lcom/mi/config/b;->gQ()Z

    move-result p1

    if-eqz p1, :cond_3

    .line 386
    const/16 p1, 0xe4

    invoke-virtual {v0, p1}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    .line 389
    :cond_3
    invoke-static {}, Lcom/mi/config/b;->gJ()Z

    move-result p1

    if-eqz p1, :cond_4

    .line 390
    const/16 p1, 0xe5

    invoke-virtual {v0, p1}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    .line 393
    :cond_4
    invoke-static {}, Lcom/mi/config/b;->gp()Z

    move-result p1

    if-eqz p1, :cond_5

    .line 394
    const/16 p1, 0xea

    invoke-virtual {v0, p1}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    .line 397
    :cond_5
    if-eq p0, v6, :cond_6

    if-eqz p4, :cond_6

    .line 398
    invoke-static {}, Lcom/mi/config/b;->hj()Z

    move-result p1

    if-eqz p1, :cond_6

    .line 399
    invoke-virtual {v0, v5}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    .line 406
    :cond_6
    invoke-static {}, Lcom/android/camera/Util;->UI_DEBUG()Z

    move-result p1

    if-nez p1, :cond_8

    .line 407
    if-eq p0, v6, :cond_7

    if-ne p0, v3, :cond_8

    .line 408
    :cond_7
    invoke-static {}, Lcom/mi/config/b;->fP()Z

    move-result p0

    if-eqz p0, :cond_8

    .line 409
    invoke-virtual {v0, v2}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    .line 422
    :cond_8
    if-eqz p4, :cond_9

    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lcom/android/camera/CameraSettings;->checkLensAvailability(Landroid/content/Context;)Z

    move-result p0

    if-eqz p0, :cond_9

    .line 423
    const/16 p0, 0xf2

    invoke-virtual {v0, p0}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    .line 425
    :cond_9
    invoke-static {p3}, Lcom/android/camera/CameraSettings;->isSupportedUltraPixelPhotography(Lcom/android/camera2/CameraCapabilities;)Z

    move-result p0

    if-eqz p0, :cond_a

    if-eqz p4, :cond_a

    .line 426
    const/16 p0, 0xfa

    invoke-virtual {v0, p0}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    .line 446
    :cond_a
    :goto_0
    goto/16 :goto_2

    .line 449
    :pswitch_2
    invoke-virtual {v0, v3}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    move-result-object p0

    invoke-virtual {p0, v5}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    .line 450
    const/4 p0, 0x1

    if-ne p1, p0, :cond_c

    invoke-static {}, Lcom/mi/config/b;->he()Z

    move-result p0

    if-eqz p0, :cond_c

    .line 451
    invoke-static {}, Lcom/mi/config/b;->fQ()Z

    move-result p0

    if-eqz p0, :cond_b

    invoke-static {}, Lcom/mi/config/b;->fP()Z

    move-result p0

    if-eqz p0, :cond_b

    .line 452
    invoke-virtual {v0, v4}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    .line 455
    :cond_b
    invoke-static {}, Lcom/mi/config/b;->gV()Z

    move-result p0

    if-eqz p0, :cond_11

    .line 456
    invoke-virtual {v0, v1}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    goto :goto_2

    .line 458
    :cond_c
    if-nez p1, :cond_11

    .line 460
    invoke-static {}, Lcom/android/camera/Util;->UI_DEBUG()Z

    move-result p0

    if-nez p0, :cond_11

    .line 461
    invoke-static {}, Lcom/android/camera/CameraSettings;->isCameraPortraitWithFaceBeauty()Z

    move-result p0

    if-eqz p0, :cond_11

    invoke-static {}, Lcom/mi/config/b;->fP()Z

    move-result p0

    if-eqz p0, :cond_11

    .line 462
    invoke-virtual {v0, v2}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    goto :goto_2

    .line 468
    :pswitch_3
    invoke-virtual {v0, v3}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    move-result-object p0

    invoke-virtual {p0, v5}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    .line 473
    goto :goto_2

    .line 480
    :pswitch_4
    if-eqz p1, :cond_d

    goto :goto_1

    .line 482
    :cond_d
    invoke-virtual {v0, v3}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    move-result-object p0

    const/16 p1, 0xe9

    invoke-virtual {p0, p1}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    .line 483
    invoke-static {}, Lcom/mi/config/b;->gh()Z

    move-result p0

    if-eqz p0, :cond_e

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object p0

    invoke-virtual {p0}, Lcom/mi/config/a;->fr()Z

    move-result p0

    if-nez p0, :cond_e

    .line 484
    const/16 p0, 0xe8

    invoke-virtual {v0, p0}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    .line 487
    :cond_e
    invoke-static {}, Lcom/android/camera/Util;->UI_DEBUG()Z

    move-result p0

    if-nez p0, :cond_f

    .line 488
    invoke-virtual {p3}, Lcom/android/camera2/CameraCapabilities;->isSupportVideoBeauty()Z

    move-result p0

    if-eqz p0, :cond_f

    .line 489
    invoke-virtual {v0, v2}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    .line 495
    :cond_f
    :goto_1
    goto :goto_2

    .line 499
    :cond_10
    :pswitch_5
    if-nez p1, :cond_11

    .line 500
    invoke-virtual {p3}, Lcom/android/camera2/CameraCapabilities;->isSupportVideoBeauty()Z

    move-result p0

    if-eqz p0, :cond_11

    .line 501
    invoke-virtual {v0, v3}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    .line 503
    invoke-static {}, Lcom/android/camera/Util;->UI_DEBUG()Z

    move-result p0

    if-nez p0, :cond_11

    .line 504
    invoke-virtual {v0, v2}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    .line 511
    :cond_11
    :goto_2
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

    .line 193
    invoke-virtual {p1, p0, p3}, Lcom/android/camera/data/data/config/DataItemConfig;->reInitComponent(ILcom/android/camera2/CameraCapabilities;)V

    .line 195
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 197
    invoke-virtual {p1}, Lcom/android/camera/data/data/config/DataItemConfig;->supportFlash()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 198
    invoke-static {p0}, Lcom/android/camera/CameraSettings;->isUltraWideConfigOpen(I)Z

    move-result v1

    const/16 v2, 0xc1

    if-eqz v1, :cond_0

    .line 200
    invoke-static {v2}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object v1

    .line 201
    const/4 v2, 0x0

    iput-boolean v2, v1, Lcom/android/camera/data/data/config/TopConfigItem;->enable:Z

    .line 202
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 203
    goto :goto_0

    .line 204
    :cond_0
    invoke-static {v2}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 207
    :cond_1
    :goto_0
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mi/config/a;->fA()Z

    move-result v1

    .line 208
    const/16 v2, 0x11

    const/16 v3, 0xc9

    const/16 v4, 0xf3

    const/16 v5, 0xc2

    const/4 v6, 0x1

    const/16 v7, 0xc5

    const/16 v8, 0xc4

    const/16 v9, 0xe1

    packed-switch p0, :pswitch_data_0

    .line 211
    :pswitch_0
    invoke-virtual {p1}, Lcom/android/camera/data/data/config/DataItemConfig;->supportHdr()Z

    move-result p0

    if-eqz p0, :cond_16

    .line 212
    invoke-static {v5}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_3

    .line 316
    :pswitch_1
    if-eqz p4, :cond_2

    if-eqz p2, :cond_2

    .line 317
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object p0

    invoke-virtual {p0}, Lcom/mi/config/a;->fc()Z

    move-result p0

    if-eqz p0, :cond_2

    .line 318
    invoke-static {v4}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 320
    :cond_2
    const/16 p0, 0xf5

    invoke-static {p0}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 321
    invoke-static {v9}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 322
    goto/16 :goto_4

    .line 351
    :pswitch_2
    invoke-static {v9}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_4

    .line 346
    :pswitch_3
    const/16 p0, 0xcc

    invoke-static {p0}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 347
    invoke-static {v9}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 348
    goto/16 :goto_4

    .line 233
    :pswitch_4
    invoke-static {}, Lcom/android/camera/Util;->UI_DEBUG()Z

    move-result p0

    if-nez p0, :cond_4

    .line 234
    if-eqz p4, :cond_4

    invoke-virtual {p3}, Lcom/android/camera2/CameraCapabilities;->isSupportPortraitLighting()Z

    move-result p0

    if-eqz p0, :cond_4

    .line 235
    const/16 p0, 0xcb

    if-nez p2, :cond_3

    .line 236
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object p1

    invoke-virtual {p1}, Lcom/mi/config/a;->eY()Z

    move-result p1

    if-eqz p1, :cond_4

    .line 237
    invoke-static {p0}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 239
    :cond_3
    if-ne p2, v6, :cond_4

    .line 240
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object p1

    invoke-virtual {p1}, Lcom/mi/config/a;->eZ()Z

    move-result p1

    if-eqz p1, :cond_4

    .line 241
    invoke-static {p0}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 246
    :cond_4
    :goto_1
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object p0

    invoke-virtual {p0}, Lcom/mi/config/a;->fw()Z

    move-result p0

    if-eqz p0, :cond_5

    if-nez p2, :cond_5

    .line 248
    const/16 p0, 0xcf

    invoke-static {p0}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 250
    :cond_5
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object p0

    invoke-virtual {p0}, Lcom/mi/config/a;->fb()Z

    move-result p0

    if-eqz p0, :cond_7

    if-eqz p2, :cond_6

    .line 252
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object p0

    invoke-virtual {p0}, Lcom/mi/config/a;->fa()Z

    move-result p0

    if-eqz p0, :cond_7

    if-ne p2, v6, :cond_7

    .line 254
    :cond_6
    invoke-static {v3}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 256
    :cond_7
    invoke-static {v8, v2}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(II)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 257
    invoke-static {v7}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 258
    goto/16 :goto_4

    .line 289
    :pswitch_5
    invoke-virtual {p1}, Lcom/android/camera/data/data/config/DataItemConfig;->getManuallyFocus()Lcom/android/camera/data/data/config/ComponentManuallyFocus;

    move-result-object p1

    .line 290
    invoke-static {}, Lcom/mi/config/b;->gF()Z

    move-result p2

    if-eqz p2, :cond_8

    .line 291
    invoke-virtual {p1, p0}, Lcom/android/camera/data/data/config/ComponentManuallyFocus;->getComponentValue(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p0}, Lcom/android/camera/data/data/config/ComponentManuallyFocus;->getDefaultValue(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_8

    .line 292
    const/16 p0, 0xc7

    invoke-static {p0}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 294
    :cond_8
    invoke-static {p3}, Lcom/android/camera/CameraSettings;->isSupportedUltraPixelPhotography(Lcom/android/camera2/CameraCapabilities;)Z

    move-result p0

    if-eqz p0, :cond_9

    if-eqz p4, :cond_9

    .line 295
    const/16 p0, 0xd1

    invoke-static {p0}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 297
    :cond_9
    invoke-static {v8}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 298
    invoke-static {v7}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 299
    goto/16 :goto_4

    .line 341
    :pswitch_6
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 342
    invoke-static {v9}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 343
    goto/16 :goto_4

    .line 302
    :pswitch_7
    invoke-virtual {p1}, Lcom/android/camera/data/data/config/DataItemConfig;->supportHdr()Z

    move-result p0

    if-eqz p0, :cond_a

    .line 303
    invoke-static {v5}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 306
    :cond_a
    invoke-static {}, Lcom/mi/config/b;->gq()Z

    move-result p0

    if-eqz p0, :cond_b

    if-eqz p2, :cond_c

    .line 307
    :cond_b
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object p0

    invoke-virtual {p0}, Lcom/mi/config/a;->fa()Z

    move-result p0

    if-eqz p0, :cond_d

    if-ne p2, v6, :cond_d

    .line 308
    :cond_c
    invoke-static {v3}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 311
    :cond_d
    invoke-static {v8}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 312
    invoke-static {v7}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 313
    goto/16 :goto_4

    .line 264
    :pswitch_8
    if-nez p2, :cond_11

    .line 265
    if-nez p4, :cond_e

    .line 266
    invoke-static {v9}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_4

    .line 268
    :cond_e
    invoke-virtual {p1}, Lcom/android/camera/data/data/config/DataItemConfig;->supportHdr()Z

    move-result p0

    if-eqz p0, :cond_f

    .line 269
    invoke-static {v5}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 271
    :cond_f
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object p0

    invoke-virtual {p0}, Lcom/mi/config/a;->fr()Z

    move-result p0

    if-nez p0, :cond_10

    .line 272
    invoke-static {}, Lcom/mi/config/b;->gh()Z

    move-result p0

    if-eqz p0, :cond_10

    invoke-static {}, Lcom/mi/config/b;->hz()Z

    move-result p0

    if-eqz p0, :cond_10

    .line 273
    const/16 p0, 0xca

    invoke-static {p0}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 276
    :cond_10
    invoke-static {v7}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_4

    .line 279
    :cond_11
    if-eqz p4, :cond_12

    const/16 p1, 0xa2

    if-ne p0, p1, :cond_12

    .line 280
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object p0

    invoke-virtual {p0}, Lcom/mi/config/a;->fc()Z

    move-result p0

    if-eqz p0, :cond_12

    .line 281
    invoke-static {v4}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 283
    :cond_12
    invoke-static {v9}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 285
    goto/16 :goto_4

    .line 324
    :pswitch_9
    if-eqz p4, :cond_13

    if-eqz p2, :cond_13

    .line 325
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object p0

    invoke-virtual {p0}, Lcom/mi/config/a;->fc()Z

    move-result p0

    if-eqz p0, :cond_13

    .line 326
    invoke-static {v4}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 328
    :cond_13
    if-ne p2, v6, :cond_14

    .line 329
    invoke-static {v8, v2}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(II)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 331
    :cond_14
    invoke-static {v8}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 333
    :goto_2
    if-nez p2, :cond_15

    invoke-virtual {p3}, Lcom/android/camera2/CameraCapabilities;->isSupportVideoBeauty()Z

    move-result p0

    if-eqz p0, :cond_15

    .line 334
    invoke-static {v7}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_4

    .line 336
    :cond_15
    invoke-static {v9}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 338
    goto :goto_4

    .line 215
    :cond_16
    :goto_3
    invoke-static {}, Lcom/mi/config/b;->gq()Z

    move-result p0

    if-eqz p0, :cond_17

    if-eqz p2, :cond_18

    .line 216
    :cond_17
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object p0

    invoke-virtual {p0}, Lcom/mi/config/a;->fa()Z

    move-result p0

    if-eqz p0, :cond_19

    if-ne p2, v6, :cond_19

    .line 217
    :cond_18
    invoke-static {v3}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 220
    :cond_19
    if-eqz v1, :cond_1a

    if-eqz p4, :cond_1a

    .line 221
    const/16 p0, 0xce

    invoke-static {p0}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 224
    :cond_1a
    invoke-static {p3}, Lcom/android/camera/CameraSettings;->isSupportedUltraPixelPhotography(Lcom/android/camera2/CameraCapabilities;)Z

    move-result p0

    if-eqz p0, :cond_1b

    invoke-static {}, Lcom/android/camera/CameraSettings;->isMeunUltraPixelPhotographyOn()Z

    move-result p0

    if-nez p0, :cond_1c

    .line 225
    :cond_1b
    invoke-static {v8}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 227
    :cond_1c
    invoke-static {v7}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->createConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 229
    nop

    .line 354
    :goto_4
    invoke-static {v0}, Lcom/android/camera/data/data/config/TopViewPositionArray;->fillNotUseViewPosition(Ljava/util/List;)Ljava/util/List;

    .line 355
    new-instance p0, Lcom/android/camera/data/data/config/SupportedConfigs;

    invoke-direct {p0}, Lcom/android/camera/data/data/config/SupportedConfigs;-><init>()V

    .line 356
    invoke-virtual {p0, v0}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(Ljava/util/List;)V

    .line 357
    return-object p0

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

    .line 144
    sget-object v0, Lcom/android/camera/data/data/config/SupportedConfigFactory;->MUTEX_MENU_CONFIGS:[I

    array-length v1, v0

    const/4 v2, 0x0

    move v3, v2

    :goto_0
    if-ge v3, v1, :cond_1

    aget v4, v0, v3

    .line 145
    if-ne v4, p0, :cond_0

    .line 146
    const/4 p0, 0x1

    return p0

    .line 144
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 149
    :cond_1
    return v2
.end method
