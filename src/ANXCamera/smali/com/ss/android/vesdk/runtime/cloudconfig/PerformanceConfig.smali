.class public Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;
.super Ljava/lang/Object;
.source "PerformanceConfig.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig$ConfigAsyncTask;,
        Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig$ConfigKey;
    }
.end annotation


# static fields
.field public static final BASE_URL:Ljava/lang/String; = "https://effect.snssdk.com/devicehub/getSettings?"

.field public static final BASE_URL_TEST:Ljava/lang/String; = "http://10.1.10.91:6789/devicehub/getSettings?"

.field public static final DISABLE:I = 0x2

.field public static final ENABLE:I = 0x1

.field public static final KEY_F_IMPORT_VIDEO_HW_BITRATE:Ljava/lang/String; = "import_video_hw_bitrate"

.field public static final KEY_F_RECORD_VIDEO_HW_BITRATE:Ljava/lang/String; = "record_video_hw_bitrate"

.field public static final KEY_F_SYNTHETIC_VIDEO_HW_BITRATE:Ljava/lang/String; = "synthetic_video_hw_bitrate"

.field public static final KEY_I_IMPORT_ENCODE_MODE:Ljava/lang/String; = "import_encode_mode"

.field public static final KEY_I_IMPORT_SHORTER_PIXELS:Ljava/lang/String; = "import_shorter_pixels"

.field public static final KEY_I_IMPORT_VIDEO_SW_CRF:Ljava/lang/String; = "import_video_sw_crf"

.field public static final KEY_I_RECORD_CAMERA_TYPE:Ljava/lang/String; = "record_camera_type"

.field public static final KEY_I_RECORD_ENCODE_MODE:Ljava/lang/String; = "record_encode_mode"

.field public static final KEY_I_RECORD_RESOLUTION_HEIGHT:Ljava/lang/String; = "record_resolution_height"

.field public static final KEY_I_RECORD_RESOLUTION_WIDTH:Ljava/lang/String; = "record_resolution_width"

.field public static final KEY_I_RECORD_VIDEO_SW_CRF:Ljava/lang/String; = "record_video_sw_crf"

.field public static final KEY_I_SYNTHETIC_ENCODE_MODE:Ljava/lang/String; = "synthetic_encode_mode"

.field public static final KEY_I_SYNTHETIC_VIDEO_SW_CRF:Ljava/lang/String; = "synthetic_video_sw_crf"

.field public static final KEY_I_SYNTHETIC_VIDEO_SW_GOP:Ljava/lang/String; = "synthetic_video_sw_gop"

.field public static final KEY_I_SYNTHETIC_VIDEO_SW_MAXRATE:Ljava/lang/String; = "synthetic_video_sw_maxrate"

.field public static final KEY_I_SYNTHETIC_VIDEO_SW_PRESET:Ljava/lang/String; = "synthetic_video_sw_preset"

.field public static final KEY_I_USE_OPENSL:Ljava/lang/String; = "use_opensl"

.field private static final TAG:Ljava/lang/String; = "PerfConfig"

.field public static final UNDEFINED:I = 0x0

.field public static final sConfigList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/ss/android/vesdk/runtime/cloudconfig/Config;",
            ">;"
        }
    .end annotation
.end field

.field private static final sConfigs:Ljava/lang/String; = "ShortVideoConfig"

.field private static final sPerfConfigPrefix:Ljava/lang/String; = "PerfConfig_"

.field public static sVECloudConfig:Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .line 116
    new-instance v0, Ljava/util/ArrayList;

    const/16 v1, 0x14

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    sput-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sConfigList:Ljava/util/List;

    .line 120
    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sConfigList:Ljava/util/List;

    new-instance v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;

    const-string v2, "use_opensl"

    const/4 v3, 0x0

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-direct {v1, v2, v3, v4}, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;-><init>(Ljava/lang/String;ILjava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 121
    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sConfigList:Ljava/util/List;

    new-instance v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;

    const-string v2, "record_camera_type"

    const/4 v4, 0x1

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-direct {v1, v2, v3, v4}, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;-><init>(Ljava/lang/String;ILjava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 122
    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sConfigList:Ljava/util/List;

    new-instance v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;

    const-string v2, "record_video_sw_crf"

    const/16 v4, 0xf

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-direct {v1, v2, v3, v5}, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;-><init>(Ljava/lang/String;ILjava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 123
    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sConfigList:Ljava/util/List;

    new-instance v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;

    const-string v2, "record_video_hw_bitrate"

    const/16 v5, 0x1000

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-direct {v1, v2, v3, v6}, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;-><init>(Ljava/lang/String;ILjava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 124
    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sConfigList:Ljava/util/List;

    new-instance v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;

    const-string v2, "record_encode_mode"

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-direct {v1, v2, v3, v6}, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;-><init>(Ljava/lang/String;ILjava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 125
    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sConfigList:Ljava/util/List;

    new-instance v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;

    const-string v2, "record_resolution_width"

    const/16 v6, 0x240

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-direct {v1, v2, v3, v7}, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;-><init>(Ljava/lang/String;ILjava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 126
    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sConfigList:Ljava/util/List;

    new-instance v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;

    const-string v2, "record_resolution_height"

    const/16 v7, 0x400

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-direct {v1, v2, v3, v7}, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;-><init>(Ljava/lang/String;ILjava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 127
    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sConfigList:Ljava/util/List;

    new-instance v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;

    const-string v2, "import_encode_mode"

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-direct {v1, v2, v3, v7}, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;-><init>(Ljava/lang/String;ILjava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 128
    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sConfigList:Ljava/util/List;

    new-instance v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;

    const-string v2, "import_shorter_pixels"

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-direct {v1, v2, v3, v6}, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;-><init>(Ljava/lang/String;ILjava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 129
    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sConfigList:Ljava/util/List;

    new-instance v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;

    const-string v2, "import_video_sw_crf"

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-direct {v1, v2, v3, v6}, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;-><init>(Ljava/lang/String;ILjava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 130
    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sConfigList:Ljava/util/List;

    new-instance v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;

    const-string v2, "import_video_hw_bitrate"

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-direct {v1, v2, v3, v6}, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;-><init>(Ljava/lang/String;ILjava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 131
    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sConfigList:Ljava/util/List;

    new-instance v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;

    const-string v2, "synthetic_encode_mode"

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-direct {v1, v2, v3, v6}, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;-><init>(Ljava/lang/String;ILjava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 132
    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sConfigList:Ljava/util/List;

    new-instance v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;

    const-string v2, "synthetic_video_sw_crf"

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-direct {v1, v2, v3, v4}, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;-><init>(Ljava/lang/String;ILjava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 133
    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sConfigList:Ljava/util/List;

    new-instance v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;

    const-string v2, "synthetic_video_hw_bitrate"

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-direct {v1, v2, v3, v4}, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;-><init>(Ljava/lang/String;ILjava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 134
    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sConfigList:Ljava/util/List;

    new-instance v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;

    const-string v2, "synthetic_video_sw_maxrate"

    const v4, 0x4c4b40

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-direct {v1, v2, v3, v4}, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;-><init>(Ljava/lang/String;ILjava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 135
    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sConfigList:Ljava/util/List;

    new-instance v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;

    const-string v2, "synthetic_video_sw_preset"

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-direct {v1, v2, v3, v4}, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;-><init>(Ljava/lang/String;ILjava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 136
    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sConfigList:Ljava/util/List;

    new-instance v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;

    const-string v2, "synthetic_video_sw_gop"

    const/16 v4, 0x23

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-direct {v1, v2, v3, v4}, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;-><init>(Ljava/lang/String;ILjava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 137
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static doubtingFilter(Lcom/ss/android/vesdk/runtime/cloudconfig/Config;Lorg/json/JSONObject;Z)Ljava/lang/String;
    .locals 17

    move-object/from16 v1, p0

    move-object/from16 v0, p1

    .line 450
    if-eqz v0, :cond_d

    .line 453
    iget-object v3, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->key:Ljava/lang/String;

    .line 454
    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v4

    const/4 v5, 0x0

    if-nez v4, :cond_1

    .line 455
    const-string v0, "PerfConfig"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "fetched config do not contain config.key = "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 456
    if-eqz p2, :cond_0

    .line 457
    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 459
    :cond_0
    return-object v5

    .line 463
    :cond_1
    nop

    .line 464
    nop

    .line 466
    nop

    .line 467
    const-wide/high16 v6, -0x4010000000000000L    # -1.0

    .line 469
    const/4 v4, -0x1

    const/4 v8, 0x0

    const/4 v9, 0x1

    :try_start_0
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v10

    const/16 v11, 0x9

    sparse-switch v10, :sswitch_data_0

    goto/16 :goto_0

    :sswitch_0
    const-string v10, "import_shorter_pixels"

    invoke-virtual {v3, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_2

    const/16 v10, 0x8

    goto/16 :goto_1

    :sswitch_1
    const-string v10, "synthetic_video_sw_preset"

    invoke-virtual {v3, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_2

    const/16 v10, 0xf

    goto/16 :goto_1

    :sswitch_2
    const-string v10, "synthetic_video_sw_maxrate"

    invoke-virtual {v3, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_2

    const/16 v10, 0xe

    goto/16 :goto_1

    :sswitch_3
    const-string v10, "synthetic_encode_mode"

    invoke-virtual {v3, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_2

    const/16 v10, 0xb

    goto/16 :goto_1

    :sswitch_4
    const-string v10, "record_video_hw_bitrate"

    invoke-virtual {v3, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_2

    const/4 v10, 0x3

    goto/16 :goto_1

    :sswitch_5
    const-string v10, "import_video_sw_crf"

    invoke-virtual {v3, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_2

    move v10, v11

    goto/16 :goto_1

    :sswitch_6
    const-string v10, "record_video_sw_crf"

    invoke-virtual {v3, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_2

    const/4 v10, 0x2

    goto/16 :goto_1

    :sswitch_7
    const-string v10, "record_resolution_width"

    invoke-virtual {v3, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_2

    const/4 v10, 0x5

    goto/16 :goto_1

    :sswitch_8
    const-string v10, "synthetic_video_sw_gop"

    invoke-virtual {v3, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_2

    const/16 v10, 0x10

    goto :goto_1

    :sswitch_9
    const-string v10, "synthetic_video_sw_crf"

    invoke-virtual {v3, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_2

    const/16 v10, 0xc

    goto :goto_1

    :sswitch_a
    const-string v10, "record_resolution_height"

    invoke-virtual {v3, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_2

    const/4 v10, 0x6

    goto :goto_1

    :sswitch_b
    const-string v10, "import_video_hw_bitrate"

    invoke-virtual {v3, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_2

    const/16 v10, 0xa

    goto :goto_1

    :sswitch_c
    const-string v10, "record_camera_type"

    invoke-virtual {v3, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_2

    move v10, v9

    goto :goto_1

    :sswitch_d
    const-string v10, "use_opensl"

    invoke-virtual {v3, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_2

    move v10, v8

    goto :goto_1

    :sswitch_e
    const-string v10, "record_encode_mode"

    invoke-virtual {v3, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_2

    const/4 v10, 0x4

    goto :goto_1

    :sswitch_f
    const-string v10, "import_encode_mode"

    invoke-virtual {v3, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_2

    const/4 v10, 0x7

    goto :goto_1

    :sswitch_10
    const-string v10, "synthetic_video_hw_bitrate"

    invoke-virtual {v3, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_2

    const/16 v10, 0xd

    goto :goto_1

    :cond_2
    :goto_0
    move v10, v4

    :goto_1
    const/16 v12, 0xa00

    const/16 v13, 0xa0

    const/16 v14, 0x32

    const-wide/16 v15, 0x0

    packed-switch v10, :pswitch_data_0

    .line 607
    new-instance v0, Ljava/lang/IllegalStateException;

    goto/16 :goto_4

    .line 599
    :pswitch_0
    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v10
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_2

    .line 600
    if-ltz v10, :cond_7

    const/16 v0, 0x3e8

    if-gt v10, v0, :cond_7

    .line 601
    :try_start_1
    invoke-static {v10}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_3

    .line 591
    :pswitch_1
    :try_start_2
    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v10
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_2

    .line 592
    if-ltz v10, :cond_7

    if-gt v10, v11, :cond_7

    .line 593
    :try_start_3
    invoke-static {v10}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0
    :try_end_3
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_0

    goto/16 :goto_3

    .line 583
    :pswitch_2
    :try_start_4
    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v10
    :try_end_4
    .catch Lorg/json/JSONException; {:try_start_4 .. :try_end_4} :catch_2

    .line 584
    const v0, 0x186a0

    if-lt v10, v0, :cond_7

    const v0, 0x989680

    if-gt v10, v0, :cond_7

    .line 585
    :try_start_5
    invoke-static {v10}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0
    :try_end_5
    .catch Lorg/json/JSONException; {:try_start_5 .. :try_end_5} :catch_0

    goto/16 :goto_3

    .line 575
    :pswitch_3
    :try_start_6
    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v10
    :try_end_6
    .catch Lorg/json/JSONException; {:try_start_6 .. :try_end_6} :catch_2

    .line 576
    cmpl-double v0, v10, v15

    if-lez v0, :cond_6

    .line 577
    :try_start_7
    invoke-static {v10, v11}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    move-result-object v0
    :try_end_7
    .catch Lorg/json/JSONException; {:try_start_7 .. :try_end_7} :catch_1

    goto/16 :goto_2

    .line 567
    :pswitch_4
    :try_start_8
    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v10
    :try_end_8
    .catch Lorg/json/JSONException; {:try_start_8 .. :try_end_8} :catch_2

    .line 568
    if-lt v10, v9, :cond_7

    if-gt v10, v14, :cond_7

    .line 569
    :try_start_9
    invoke-static {v10}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0
    :try_end_9
    .catch Lorg/json/JSONException; {:try_start_9 .. :try_end_9} :catch_0

    goto/16 :goto_3

    .line 559
    :pswitch_5
    :try_start_a
    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v10
    :try_end_a
    .catch Lorg/json/JSONException; {:try_start_a .. :try_end_a} :catch_2

    .line 560
    if-eqz v10, :cond_3

    if-ne v10, v9, :cond_7

    .line 561
    :cond_3
    :try_start_b
    invoke-static {v10}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0
    :try_end_b
    .catch Lorg/json/JSONException; {:try_start_b .. :try_end_b} :catch_0

    goto/16 :goto_3

    .line 551
    :pswitch_6
    :try_start_c
    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v10
    :try_end_c
    .catch Lorg/json/JSONException; {:try_start_c .. :try_end_c} :catch_2

    .line 552
    cmpl-double v0, v10, v15

    if-lez v0, :cond_6

    .line 553
    :try_start_d
    invoke-static {v10, v11}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    move-result-object v0
    :try_end_d
    .catch Lorg/json/JSONException; {:try_start_d .. :try_end_d} :catch_1

    goto/16 :goto_2

    .line 543
    :pswitch_7
    :try_start_e
    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v10
    :try_end_e
    .catch Lorg/json/JSONException; {:try_start_e .. :try_end_e} :catch_2

    .line 544
    if-lt v10, v9, :cond_7

    if-gt v10, v14, :cond_7

    .line 545
    :try_start_f
    invoke-static {v10}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0
    :try_end_f
    .catch Lorg/json/JSONException; {:try_start_f .. :try_end_f} :catch_0

    goto/16 :goto_3

    .line 535
    :pswitch_8
    :try_start_10
    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v10
    :try_end_10
    .catch Lorg/json/JSONException; {:try_start_10 .. :try_end_10} :catch_2

    .line 536
    :try_start_11
    rem-int/lit8 v0, v10, 0x10

    if-nez v0, :cond_7

    if-lt v10, v13, :cond_7

    if-gt v10, v12, :cond_7

    .line 537
    invoke-static {v10}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0
    :try_end_11
    .catch Lorg/json/JSONException; {:try_start_11 .. :try_end_11} :catch_0

    goto/16 :goto_3

    .line 527
    :pswitch_9
    :try_start_12
    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v10
    :try_end_12
    .catch Lorg/json/JSONException; {:try_start_12 .. :try_end_12} :catch_2

    .line 528
    if-eqz v10, :cond_4

    if-ne v10, v9, :cond_7

    .line 529
    :cond_4
    :try_start_13
    invoke-static {v10}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0
    :try_end_13
    .catch Lorg/json/JSONException; {:try_start_13 .. :try_end_13} :catch_0

    goto/16 :goto_3

    .line 519
    :pswitch_a
    :try_start_14
    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v10
    :try_end_14
    .catch Lorg/json/JSONException; {:try_start_14 .. :try_end_14} :catch_2

    .line 520
    :try_start_15
    rem-int/lit8 v0, v10, 0x10

    if-nez v0, :cond_7

    if-lt v10, v13, :cond_7

    if-gt v10, v12, :cond_7

    .line 521
    invoke-static {v10}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0
    :try_end_15
    .catch Lorg/json/JSONException; {:try_start_15 .. :try_end_15} :catch_0

    goto/16 :goto_3

    .line 511
    :pswitch_b
    :try_start_16
    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v10
    :try_end_16
    .catch Lorg/json/JSONException; {:try_start_16 .. :try_end_16} :catch_2

    .line 512
    :try_start_17
    rem-int/lit8 v0, v10, 0x10

    if-nez v0, :cond_7

    if-lt v10, v13, :cond_7

    if-gt v10, v12, :cond_7

    .line 513
    invoke-static {v10}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0
    :try_end_17
    .catch Lorg/json/JSONException; {:try_start_17 .. :try_end_17} :catch_0

    goto :goto_3

    .line 610
    :catch_0
    move-exception v0

    goto :goto_6

    .line 503
    :pswitch_c
    :try_start_18
    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v10
    :try_end_18
    .catch Lorg/json/JSONException; {:try_start_18 .. :try_end_18} :catch_2

    .line 504
    if-eqz v10, :cond_5

    if-ne v10, v9, :cond_7

    .line 505
    :cond_5
    :try_start_19
    invoke-static {v10}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0
    :try_end_19
    .catch Lorg/json/JSONException; {:try_start_19 .. :try_end_19} :catch_0

    goto :goto_3

    .line 495
    :pswitch_d
    :try_start_1a
    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v10
    :try_end_1a
    .catch Lorg/json/JSONException; {:try_start_1a .. :try_end_1a} :catch_2

    .line 496
    cmpl-double v0, v10, v15

    if-lez v0, :cond_6

    .line 497
    :try_start_1b
    invoke-static {v10, v11}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    move-result-object v0
    :try_end_1b
    .catch Lorg/json/JSONException; {:try_start_1b .. :try_end_1b} :catch_1

    goto :goto_2

    .line 610
    :catch_1
    move-exception v0

    move-wide v6, v10

    goto :goto_5

    .line 614
    :cond_6
    move-object v0, v5

    :goto_2
    move-wide v6, v10

    move v10, v4

    goto :goto_3

    .line 487
    :pswitch_e
    :try_start_1c
    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v10
    :try_end_1c
    .catch Lorg/json/JSONException; {:try_start_1c .. :try_end_1c} :catch_2

    .line 488
    if-lt v10, v9, :cond_7

    if-gt v10, v14, :cond_7

    .line 489
    :try_start_1d
    invoke-static {v10}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0
    :try_end_1d
    .catch Lorg/json/JSONException; {:try_start_1d .. :try_end_1d} :catch_0

    goto :goto_3

    .line 479
    :pswitch_f
    :try_start_1e
    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v10
    :try_end_1e
    .catch Lorg/json/JSONException; {:try_start_1e .. :try_end_1e} :catch_2

    .line 480
    if-lt v10, v9, :cond_7

    .line 481
    :try_start_1f
    invoke-static {v10}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0
    :try_end_1f
    .catch Lorg/json/JSONException; {:try_start_1f .. :try_end_1f} :catch_0

    goto :goto_3

    .line 614
    :cond_7
    move-object v0, v5

    goto :goto_3

    .line 471
    :pswitch_10
    :try_start_20
    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v10
    :try_end_20
    .catch Lorg/json/JSONException; {:try_start_20 .. :try_end_20} :catch_2

    .line 472
    if-eqz v10, :cond_8

    if-ne v10, v9, :cond_7

    .line 473
    :cond_8
    :try_start_21
    invoke-static {v10}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0
    :try_end_21
    .catch Lorg/json/JSONException; {:try_start_21 .. :try_end_21} :catch_0

    .line 614
    :goto_3
    goto :goto_7

    .line 607
    :goto_4
    :try_start_22
    const-string v8, "Shouldn\'t reach here. Unmatched config.key case"

    invoke-direct {v0, v8}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_22
    .catch Lorg/json/JSONException; {:try_start_22 .. :try_end_22} :catch_2

    .line 610
    :catch_2
    move-exception v0

    :goto_5
    move v10, v4

    .line 611
    :goto_6
    const-string v4, "PerfConfig"

    const-string v8, "Parse json result failed! "

    invoke-static {v4, v8, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 612
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    .line 613
    nop

    .line 616
    move-object v0, v5

    move v8, v9

    :goto_7
    if-nez v8, :cond_a

    if-nez v0, :cond_a

    .line 617
    iget v4, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->type:I

    if-nez v4, :cond_9

    .line 618
    const-string v4, "doubtingFilter report: "

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Checked config did not pass: key = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v7, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->key:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, " value = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_8

    .line 619
    :cond_9
    iget v4, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->type:I

    if-ne v4, v9, :cond_a

    .line 620
    const-string v4, "doubtingFilter report: "

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Checked config did not pass: key = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v9, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->key:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v9, " value = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v6, v7}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 623
    :cond_a
    :goto_8
    if-nez v0, :cond_c

    .line 624
    if-eqz p2, :cond_b

    iget-object v0, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->defaultValue:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    nop

    :cond_b
    return-object v5

    .line 626
    :cond_c
    const-string v1, "doubtingFilter report: "

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " == "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 627
    return-object v0

    .line 451
    :cond_d
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "fetchedConfigs == null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    nop

    :sswitch_data_0
    .sparse-switch
        -0x777dcbc5 -> :sswitch_10
        -0x6c3a6b6e -> :sswitch_f
        -0x650114c2 -> :sswitch_e
        -0x5ea6f425 -> :sswitch_d
        -0x5cdd72da -> :sswitch_c
        -0x520c0c25 -> :sswitch_b
        -0x4db68054 -> :sswitch_a
        -0x49b5df86 -> :sswitch_9
        -0x49b5d0d5 -> :sswitch_8
        -0x43bd255f -> :sswitch_7
        -0x1b41d112 -> :sswitch_6
        0x4ccb01a -> :sswitch_5
        0x28a1e8af -> :sswitch_4
        0x3ea89832 -> :sswitch_3
        0x40203567 -> :sswitch_2
        0x52699d5c -> :sswitch_1
        0x5370a55d -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
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

.method public static fetch()V
    .locals 2

    .line 288
    new-instance v0, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig$ConfigAsyncTask;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig$ConfigAsyncTask;-><init>(Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig$1;)V

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig$ConfigAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 289
    return-void
.end method

.method private static getDefaultFloat(Ljava/lang/String;)F
    .locals 3

    .line 382
    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sConfigList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;

    .line 383
    iget-object v2, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->key:Ljava/lang/String;

    invoke-virtual {v2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 384
    iget-object p0, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->defaultValue:Ljava/lang/Object;

    check-cast p0, Ljava/lang/Float;

    invoke-virtual {p0}, Ljava/lang/Float;->floatValue()F

    move-result p0

    return p0

    .line 386
    :cond_0
    goto :goto_0

    .line 387
    :cond_1
    const/high16 p0, -0x40800000    # -1.0f

    return p0
.end method

.method private static getDefaultInt(Ljava/lang/String;)I
    .locals 3

    .line 373
    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sConfigList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;

    .line 374
    iget-object v2, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->key:Ljava/lang/String;

    invoke-virtual {v2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 375
    iget-object p0, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->defaultValue:Ljava/lang/Object;

    check-cast p0, Ljava/lang/Integer;

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    return p0

    .line 377
    :cond_0
    goto :goto_0

    .line 378
    :cond_1
    const/4 p0, -0x1

    return p0
.end method

.method private static getFloatConfig(Ljava/util/Map;Ljava/lang/String;F)F
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "F)F"
        }
    .end annotation

    .line 247
    if-nez p0, :cond_0

    .line 248
    const/4 p0, 0x0

    return p0

    .line 250
    :cond_0
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    .line 252
    :try_start_0
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_1

    .line 253
    invoke-static {p0}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    .line 257
    :cond_1
    goto :goto_0

    .line 255
    :catch_0
    move-exception p0

    .line 256
    const-string p1, "PerfConfig"

    const-string v0, "getIntConfig: error"

    invoke-static {p1, v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 258
    :goto_0
    return p2
.end method

.method private static getIntConfig(Ljava/util/Map;Ljava/lang/String;I)I
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "I)I"
        }
    .end annotation

    .line 229
    if-nez p0, :cond_0

    .line 230
    const/4 p0, 0x0

    return p0

    .line 232
    :cond_0
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    .line 234
    :try_start_0
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_1

    .line 235
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    .line 239
    :cond_1
    goto :goto_0

    .line 237
    :catch_0
    move-exception p0

    .line 238
    const-string p1, "PerfConfig"

    const-string v0, "getIntConfig: error"

    invoke-static {p1, v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 240
    :goto_0
    return p2
.end method

.method public static getPerformanceConfig(Landroid/content/Context;)Ljava/util/Map;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 660
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 662
    const-string v1, "ShortVideoConfig"

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    .line 663
    invoke-interface {p0}, Landroid/content/SharedPreferences;->getAll()Ljava/util/Map;

    move-result-object p0

    .line 664
    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 665
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    const-string v3, "PerfConfig_"

    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 666
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    const-string v3, "PerfConfig_"

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 668
    :cond_0
    goto :goto_0

    .line 669
    :cond_1
    return-object v0
.end method

.method public static restoreFromCache()V
    .locals 2
    .annotation build Landroid/support/annotation/RestrictTo;
        value = {
            .enum Landroid/support/annotation/RestrictTo$Scope;->LIBRARY:Landroid/support/annotation/RestrictTo$Scope;
        }
    .end annotation

    .line 144
    invoke-static {}, Lcom/ss/android/vesdk/runtime/VERuntime;->getInstance()Lcom/ss/android/vesdk/runtime/VERuntime;

    move-result-object v0

    invoke-virtual {v0}, Lcom/ss/android/vesdk/runtime/VERuntime;->getContext()Landroid/content/Context;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 147
    invoke-static {}, Lcom/ss/android/vesdk/runtime/VERuntime;->getInstance()Lcom/ss/android/vesdk/runtime/VERuntime;

    move-result-object v0

    invoke-virtual {v0}, Lcom/ss/android/vesdk/runtime/VERuntime;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->getPerformanceConfig(Landroid/content/Context;)Ljava/util/Map;

    move-result-object v0

    invoke-static {v0}, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->setConfigsFromMap(Ljava/util/Map;)V

    .line 148
    return-void

    .line 145
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Must call VideoSdkCore.init() before."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static setConfigsFromMap(Ljava/util/Map;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 167
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 168
    sget-object v1, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sConfigList:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;

    .line 169
    iget v3, v2, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->type:I

    if-nez v3, :cond_0

    .line 170
    iget-object v3, v2, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->key:Ljava/lang/String;

    iget-object v4, v2, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->key:Ljava/lang/String;

    iget-object v2, v2, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->defaultValue:Ljava/lang/Object;

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-static {p0, v4, v2}, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->getIntConfig(Ljava/util/Map;Ljava/lang/String;I)I

    move-result v2

    invoke-virtual {v0, v3, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    goto :goto_1

    .line 171
    :cond_0
    iget v3, v2, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->type:I

    const/4 v4, 0x1

    if-ne v3, v4, :cond_1

    .line 172
    iget-object v3, v2, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->key:Ljava/lang/String;

    iget-object v4, v2, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->key:Ljava/lang/String;

    iget-object v2, v2, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->defaultValue:Ljava/lang/Object;

    check-cast v2, Ljava/lang/Float;

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    invoke-static {p0, v4, v2}, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->getFloatConfig(Ljava/util/Map;Ljava/lang/String;F)F

    move-result v2

    invoke-virtual {v0, v3, v2}, Landroid/os/Bundle;->putFloat(Ljava/lang/String;F)V

    .line 176
    :goto_1
    goto :goto_0

    .line 174
    :cond_1
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string v0, "Not support"

    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 178
    :cond_2
    new-instance v0, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;

    invoke-direct {v0}, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;-><init>()V

    sput-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sVECloudConfig:Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;

    .line 179
    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sConfigList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_13

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;

    .line 180
    const-string v2, "record_camera_type"

    iget-object v3, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->key:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 181
    sget-object v2, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sVECloudConfig:Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;

    iget-object v3, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->key:Ljava/lang/String;

    iget-object v1, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->defaultValue:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-static {p0, v3, v1}, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->getIntConfig(Ljava/util/Map;Ljava/lang/String;I)I

    move-result v1

    iput v1, v2, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mRecordCameraType:I

    goto/16 :goto_3

    .line 182
    :cond_3
    const-string v2, "record_video_sw_crf"

    iget-object v3, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->key:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 183
    sget-object v2, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sVECloudConfig:Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;

    iget-object v3, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->key:Ljava/lang/String;

    iget-object v1, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->defaultValue:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-static {p0, v3, v1}, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->getIntConfig(Ljava/util/Map;Ljava/lang/String;I)I

    move-result v1

    iput v1, v2, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mRecordSWEncodeCRF:I

    goto/16 :goto_3

    .line 184
    :cond_4
    const-string v2, "record_video_hw_bitrate"

    iget-object v3, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->key:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 185
    sget-object v2, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sVECloudConfig:Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;

    iget-object v3, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->key:Ljava/lang/String;

    iget-object v1, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->defaultValue:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-static {p0, v3, v1}, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->getIntConfig(Ljava/util/Map;Ljava/lang/String;I)I

    move-result v1

    iput v1, v2, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mRecordHWEncodeBPS:I

    goto/16 :goto_3

    .line 186
    :cond_5
    const-string v2, "record_encode_mode"

    iget-object v3, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->key:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 187
    sget-object v2, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sVECloudConfig:Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;

    iget-object v3, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->key:Ljava/lang/String;

    iget-object v1, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->defaultValue:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-static {p0, v3, v1}, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->getIntConfig(Ljava/util/Map;Ljava/lang/String;I)I

    move-result v1

    iput v1, v2, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mRecordEncodeMode:I

    goto/16 :goto_3

    .line 188
    :cond_6
    const-string v2, "record_resolution_width"

    iget-object v3, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->key:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 189
    sget-object v2, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sVECloudConfig:Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;

    iget-object v3, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->key:Ljava/lang/String;

    iget-object v1, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->defaultValue:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-static {p0, v3, v1}, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->getIntConfig(Ljava/util/Map;Ljava/lang/String;I)I

    move-result v1

    iput v1, v2, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mRecordResolutionWidth:I

    goto/16 :goto_3

    .line 190
    :cond_7
    const-string v2, "record_resolution_height"

    iget-object v3, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->key:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 191
    sget-object v2, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sVECloudConfig:Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;

    iget-object v3, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->key:Ljava/lang/String;

    iget-object v1, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->defaultValue:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-static {p0, v3, v1}, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->getIntConfig(Ljava/util/Map;Ljava/lang/String;I)I

    move-result v1

    iput v1, v2, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mRecordResolutionHeight:I

    goto/16 :goto_3

    .line 192
    :cond_8
    const-string v2, "import_encode_mode"

    iget-object v3, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->key:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    .line 193
    sget-object v2, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sVECloudConfig:Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;

    iget-object v3, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->key:Ljava/lang/String;

    iget-object v1, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->defaultValue:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-static {p0, v3, v1}, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->getIntConfig(Ljava/util/Map;Ljava/lang/String;I)I

    move-result v1

    iput v1, v2, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mImportEncodeMode:I

    goto/16 :goto_3

    .line 194
    :cond_9
    const-string v2, "import_shorter_pixels"

    iget-object v3, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->key:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_a

    .line 195
    sget-object v2, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sVECloudConfig:Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;

    iget-object v3, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->key:Ljava/lang/String;

    iget-object v1, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->defaultValue:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-static {p0, v3, v1}, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->getIntConfig(Ljava/util/Map;Ljava/lang/String;I)I

    move-result v1

    iput v1, v2, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mImportShortEdgeValue:I

    goto/16 :goto_3

    .line 196
    :cond_a
    const-string v2, "import_video_sw_crf"

    iget-object v3, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->key:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_b

    .line 197
    sget-object v2, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sVECloudConfig:Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;

    iget-object v3, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->key:Ljava/lang/String;

    iget-object v1, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->defaultValue:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-static {p0, v3, v1}, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->getIntConfig(Ljava/util/Map;Ljava/lang/String;I)I

    move-result v1

    iput v1, v2, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mImportSWEncodeCRF:I

    goto/16 :goto_3

    .line 198
    :cond_b
    const-string v2, "import_video_hw_bitrate"

    iget-object v3, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->key:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_c

    .line 199
    sget-object v2, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sVECloudConfig:Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;

    iget-object v3, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->key:Ljava/lang/String;

    iget-object v1, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->defaultValue:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-static {p0, v3, v1}, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->getIntConfig(Ljava/util/Map;Ljava/lang/String;I)I

    move-result v1

    iput v1, v2, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mImportHWEncodeBPS:I

    goto/16 :goto_3

    .line 200
    :cond_c
    const-string v2, "synthetic_encode_mode"

    iget-object v3, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->key:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_d

    .line 201
    sget-object v2, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sVECloudConfig:Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;

    iget-object v3, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->key:Ljava/lang/String;

    iget-object v1, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->defaultValue:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-static {p0, v3, v1}, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->getIntConfig(Ljava/util/Map;Ljava/lang/String;I)I

    move-result v1

    iput v1, v2, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mCompileEncodeMode:I

    goto/16 :goto_3

    .line 202
    :cond_d
    const-string v2, "synthetic_video_sw_crf"

    iget-object v3, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->key:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_e

    .line 203
    sget-object v2, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sVECloudConfig:Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;

    iget-object v3, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->key:Ljava/lang/String;

    iget-object v1, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->defaultValue:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-static {p0, v3, v1}, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->getIntConfig(Ljava/util/Map;Ljava/lang/String;I)I

    move-result v1

    iput v1, v2, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mCompileEncodeSWCRF:I

    goto/16 :goto_3

    .line 204
    :cond_e
    const-string v2, "synthetic_video_hw_bitrate"

    iget-object v3, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->key:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_f

    .line 205
    sget-object v2, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sVECloudConfig:Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;

    iget-object v3, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->key:Ljava/lang/String;

    iget-object v1, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->defaultValue:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-static {p0, v3, v1}, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->getIntConfig(Ljava/util/Map;Ljava/lang/String;I)I

    move-result v1

    iput v1, v2, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mCompileEncodeHWBPS:I

    goto :goto_3

    .line 206
    :cond_f
    const-string v2, "synthetic_video_sw_maxrate"

    iget-object v3, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->key:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_10

    .line 207
    sget-object v2, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sVECloudConfig:Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;

    iget-object v3, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->key:Ljava/lang/String;

    iget-object v1, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->defaultValue:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-static {p0, v3, v1}, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->getIntConfig(Ljava/util/Map;Ljava/lang/String;I)I

    move-result v1

    iput v1, v2, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mCompileEncodeSWCRFMax:I

    goto :goto_3

    .line 208
    :cond_10
    const-string v2, "synthetic_video_sw_preset"

    iget-object v3, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->key:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_11

    .line 209
    sget-object v2, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sVECloudConfig:Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;

    iget-object v3, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->key:Ljava/lang/String;

    iget-object v1, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->defaultValue:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-static {p0, v3, v1}, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->getIntConfig(Ljava/util/Map;Ljava/lang/String;I)I

    move-result v1

    iput v1, v2, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mCompileEncodeSWCRFPreset:I

    goto :goto_3

    .line 210
    :cond_11
    const-string v2, "synthetic_video_sw_gop"

    iget-object v3, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->key:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_12

    .line 211
    sget-object v2, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sVECloudConfig:Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;

    iget-object v3, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->key:Ljava/lang/String;

    iget-object v1, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->defaultValue:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-static {p0, v3, v1}, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->getIntConfig(Ljava/util/Map;Ljava/lang/String;I)I

    move-result v1

    iput v1, v2, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mCompileEncodeGOP:I

    .line 213
    :cond_12
    :goto_3
    goto/16 :goto_2

    .line 216
    :cond_13
    return-void
.end method

.method public static setPerformanceConfig(Landroid/content/Context;Ljava/util/Map;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 641
    if-nez p1, :cond_0

    .line 642
    return-void

    .line 644
    :cond_0
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p1

    .line 645
    const-string v0, "ShortVideoConfig"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    .line 646
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    .line 647
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 648
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "PerfConfig_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-interface {p0, v1, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 649
    goto :goto_0

    .line 650
    :cond_1
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 651
    return-void
.end method

.method public static updateConfig(Ljava/util/Map;)V
    .locals 1
    .annotation build Landroid/support/annotation/RestrictTo;
        value = {
            .enum Landroid/support/annotation/RestrictTo$Scope;->LIBRARY:Landroid/support/annotation/RestrictTo$Scope;
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 156
    invoke-static {p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->setConfigsFromMap(Ljava/util/Map;)V

    .line 158
    invoke-static {}, Lcom/ss/android/vesdk/runtime/VERuntime;->getInstance()Lcom/ss/android/vesdk/runtime/VERuntime;

    move-result-object v0

    invoke-virtual {v0}, Lcom/ss/android/vesdk/runtime/VERuntime;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->setPerformanceConfig(Landroid/content/Context;Ljava/util/Map;)V

    .line 159
    return-void
.end method
