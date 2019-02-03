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
.field public static final BASE_URL_CHINA:Ljava/lang/String; = "https://effect.snssdk.com/devicehub/getSettings?"

.field public static final BASE_URL_SINGAPORE:Ljava/lang/String; = "https://sg-effect.byteoversea.com/devicehub/getSetting?"

.field public static final BASE_URL_TEST:Ljava/lang/String; = "https://effect.snssdk.com/devicehub/getSettings/?"

.field public static final BASE_URL_US:Ljava/lang/String; = "https://va-effect.byteoversea.com/devicehub/getSettings?"

.field public static final DISABLE:I = 0x2

.field public static final ENABLE:I = 0x1

.field public static final KEY_I_EARPHONE_ECHO_AAUDIO:Ljava/lang/String; = "earphone_echo_aaudio"

.field public static final KEY_I_EARPHONE_ECHO_HUAWEI:Ljava/lang/String; = "earphone_echo_huawei"

.field public static final KEY_I_EARPHONE_ECHO_NORMAL:Ljava/lang/String; = "earphone_echo_normal"

.field public static final KEY_I_IMPORT_ENCODE_MODE:Ljava/lang/String; = "import_encode_mode"

.field public static final KEY_I_IMPORT_HW_BITRATE_MODE:Ljava/lang/String; = "import_hw_bitrate_mode"

.field public static final KEY_I_IMPORT_HW_PROFILE:Ljava/lang/String; = "import_hw_profile"

.field public static final KEY_I_IMPORT_SHORTER_PIXELS:Ljava/lang/String; = "import_shorter_pixels"

.field public static final KEY_I_IMPORT_SW_BITRATE_MODE:Ljava/lang/String; = "import_sw_bitrate_mode"

.field public static final KEY_I_IMPORT_VIDEO_HW_BITRATE:Ljava/lang/String; = "import_video_hw_bitrate"

.field public static final KEY_I_IMPORT_VIDEO_SW_CRF:Ljava/lang/String; = "import_video_sw_crf"

.field public static final KEY_I_IMPORT_VIDEO_SW_GOP:Ljava/lang/String; = "import_video_sw_gop"

.field public static final KEY_I_IMPORT_VIDEO_SW_MAXRATE:Ljava/lang/String; = "import_video_sw_maxrate"

.field public static final KEY_I_IMPORT_VIDEO_SW_PRESET:Ljava/lang/String; = "import_video_sw_preset"

.field public static final KEY_I_IMPORT_VIDEO_SW_QP:Ljava/lang/String; = "import_video_sw_qp"

.field public static final KEY_I_RECORD_CAMERA_COMPAT_LEVEL:Ljava/lang/String; = "record_camera_compat_level"

.field public static final KEY_I_RECORD_CAMERA_TYPE:Ljava/lang/String; = "record_camera_type"

.field public static final KEY_I_RECORD_ENCODE_MODE:Ljava/lang/String; = "record_encode_mode"

.field public static final KEY_I_RECORD_HW_BITRATE_MODE:Ljava/lang/String; = "record_hw_bitrate_mode"

.field public static final KEY_I_RECORD_HW_PROFILE:Ljava/lang/String; = "record_hw_profile"

.field public static final KEY_I_RECORD_RESOLUTION_HEIGHT:Ljava/lang/String; = "record_resolution_height"

.field public static final KEY_I_RECORD_RESOLUTION_WIDTH:Ljava/lang/String; = "record_resolution_width"

.field public static final KEY_I_RECORD_SW_BITRATE_MODE:Ljava/lang/String; = "record_sw_bitrate_mode"

.field public static final KEY_I_RECORD_VIDEO_HW_BITRATE:Ljava/lang/String; = "record_video_hw_bitrate"

.field public static final KEY_I_RECORD_VIDEO_SW_CRF:Ljava/lang/String; = "record_video_sw_crf"

.field public static final KEY_I_RECORD_VIDEO_SW_GOP:Ljava/lang/String; = "record_video_sw_gop"

.field public static final KEY_I_RECORD_VIDEO_SW_MAXRATE:Ljava/lang/String; = "record_video_sw_maxrate"

.field public static final KEY_I_RECORD_VIDEO_SW_PRESET:Ljava/lang/String; = "record_video_sw_preset"

.field public static final KEY_I_RECORD_VIDEO_SW_QP:Ljava/lang/String; = "record_video_sw_qp"

.field public static final KEY_I_SYNTHETIC_ENCODE_MODE:Ljava/lang/String; = "synthetic_encode_mode"

.field public static final KEY_I_SYNTHETIC_HW_BITRATE_MODE:Ljava/lang/String; = "synthetic_hw_bitrate_mode"

.field public static final KEY_I_SYNTHETIC_HW_PROFILE:Ljava/lang/String; = "synthetic_hw_profile"

.field public static final KEY_I_SYNTHETIC_SW_BITRATE_MODE:Ljava/lang/String; = "synthetic_sw_bitrate_mode"

.field public static final KEY_I_SYNTHETIC_VIDEO_HW_BITRATE:Ljava/lang/String; = "synthetic_video_hw_bitrate"

.field public static final KEY_I_SYNTHETIC_VIDEO_SW_CRF:Ljava/lang/String; = "synthetic_video_sw_crf"

.field public static final KEY_I_SYNTHETIC_VIDEO_SW_GOP:Ljava/lang/String; = "synthetic_video_sw_gop"

.field public static final KEY_I_SYNTHETIC_VIDEO_SW_MAXRATE:Ljava/lang/String; = "synthetic_video_sw_maxrate"

.field public static final KEY_I_SYNTHETIC_VIDEO_SW_PRESET:Ljava/lang/String; = "synthetic_video_sw_preset"

.field public static final KEY_I_SYNTHETIC_VIDEO_SW_QP:Ljava/lang/String; = "synthetic_video_sw_qp"

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

.field public static final sVECloudConfig:Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;


# direct methods
.method static constructor <clinit>()V
    .locals 12

    .line 55
    new-instance v0, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;

    invoke-direct {v0}, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;-><init>()V

    sput-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sVECloudConfig:Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;

    .line 173
    new-instance v0, Ljava/util/ArrayList;

    const/16 v1, 0x14

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    sput-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sConfigList:Ljava/util/List;

    .line 177
    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sConfigList:Ljava/util/List;

    new-instance v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;

    const-string v2, "record_camera_type"

    const/4 v3, 0x1

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v5, 0x0

    invoke-direct {v1, v2, v5, v4}, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;-><init>(Ljava/lang/String;ILjava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 178
    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sConfigList:Ljava/util/List;

    new-instance v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;

    const-string v2, "record_video_sw_crf"

    const/16 v4, 0xf

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-direct {v1, v2, v5, v6}, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;-><init>(Ljava/lang/String;ILjava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 179
    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sConfigList:Ljava/util/List;

    new-instance v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;

    const-string v2, "record_video_hw_bitrate"

    const/high16 v6, 0x400000

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-direct {v1, v2, v5, v7}, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;-><init>(Ljava/lang/String;ILjava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 180
    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sConfigList:Ljava/util/List;

    new-instance v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;

    const-string v2, "record_encode_mode"

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-direct {v1, v2, v5, v7}, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;-><init>(Ljava/lang/String;ILjava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 181
    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sConfigList:Ljava/util/List;

    new-instance v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;

    const-string v2, "record_resolution_width"

    const/16 v7, 0x240

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-direct {v1, v2, v5, v8}, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;-><init>(Ljava/lang/String;ILjava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 182
    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sConfigList:Ljava/util/List;

    new-instance v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;

    const-string v2, "record_resolution_height"

    const/16 v8, 0x400

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-direct {v1, v2, v5, v8}, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;-><init>(Ljava/lang/String;ILjava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 183
    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sConfigList:Ljava/util/List;

    new-instance v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;

    const-string v2, "record_camera_compat_level"

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-direct {v1, v2, v5, v8}, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;-><init>(Ljava/lang/String;ILjava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 184
    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sConfigList:Ljava/util/List;

    new-instance v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;

    const-string v2, "record_video_sw_maxrate"

    const v8, 0x4c4b40

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-direct {v1, v2, v5, v9}, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;-><init>(Ljava/lang/String;ILjava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 185
    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sConfigList:Ljava/util/List;

    new-instance v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;

    const-string v2, "record_video_sw_preset"

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-direct {v1, v2, v5, v9}, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;-><init>(Ljava/lang/String;ILjava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 186
    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sConfigList:Ljava/util/List;

    new-instance v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;

    const-string v2, "record_video_sw_gop"

    const/16 v9, 0x23

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-direct {v1, v2, v5, v10}, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;-><init>(Ljava/lang/String;ILjava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 187
    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sConfigList:Ljava/util/List;

    new-instance v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;

    const-string v2, "record_video_sw_qp"

    const/4 v10, 0x2

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-direct {v1, v2, v5, v11}, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;-><init>(Ljava/lang/String;ILjava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 188
    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sConfigList:Ljava/util/List;

    new-instance v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;

    const-string v2, "record_sw_bitrate_mode"

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-direct {v1, v2, v5, v11}, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;-><init>(Ljava/lang/String;ILjava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 189
    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sConfigList:Ljava/util/List;

    new-instance v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;

    const-string v2, "record_hw_bitrate_mode"

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-direct {v1, v2, v5, v11}, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;-><init>(Ljava/lang/String;ILjava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 190
    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sConfigList:Ljava/util/List;

    new-instance v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;

    const-string v2, "record_hw_profile"

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-direct {v1, v2, v5, v11}, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;-><init>(Ljava/lang/String;ILjava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 191
    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sConfigList:Ljava/util/List;

    new-instance v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;

    const-string v2, "import_encode_mode"

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-direct {v1, v2, v5, v11}, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;-><init>(Ljava/lang/String;ILjava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 192
    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sConfigList:Ljava/util/List;

    new-instance v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;

    const-string v2, "import_shorter_pixels"

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-direct {v1, v2, v5, v7}, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;-><init>(Ljava/lang/String;ILjava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 193
    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sConfigList:Ljava/util/List;

    new-instance v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;

    const-string v2, "import_video_sw_crf"

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-direct {v1, v2, v5, v7}, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;-><init>(Ljava/lang/String;ILjava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 194
    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sConfigList:Ljava/util/List;

    new-instance v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;

    const-string v2, "import_video_hw_bitrate"

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-direct {v1, v2, v5, v7}, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;-><init>(Ljava/lang/String;ILjava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 195
    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sConfigList:Ljava/util/List;

    new-instance v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;

    const-string v2, "import_video_sw_maxrate"

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-direct {v1, v2, v5, v7}, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;-><init>(Ljava/lang/String;ILjava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 196
    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sConfigList:Ljava/util/List;

    new-instance v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;

    const-string v2, "import_video_sw_preset"

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-direct {v1, v2, v5, v7}, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;-><init>(Ljava/lang/String;ILjava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 197
    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sConfigList:Ljava/util/List;

    new-instance v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;

    const-string v2, "import_video_sw_gop"

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-direct {v1, v2, v5, v7}, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;-><init>(Ljava/lang/String;ILjava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 198
    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sConfigList:Ljava/util/List;

    new-instance v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;

    const-string v2, "import_video_sw_qp"

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-direct {v1, v2, v5, v7}, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;-><init>(Ljava/lang/String;ILjava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 199
    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sConfigList:Ljava/util/List;

    new-instance v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;

    const-string v2, "import_sw_bitrate_mode"

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-direct {v1, v2, v5, v7}, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;-><init>(Ljava/lang/String;ILjava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 200
    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sConfigList:Ljava/util/List;

    new-instance v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;

    const-string v2, "import_hw_bitrate_mode"

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-direct {v1, v2, v5, v7}, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;-><init>(Ljava/lang/String;ILjava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 201
    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sConfigList:Ljava/util/List;

    new-instance v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;

    const-string v2, "import_hw_profile"

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-direct {v1, v2, v5, v7}, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;-><init>(Ljava/lang/String;ILjava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 202
    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sConfigList:Ljava/util/List;

    new-instance v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;

    const-string v2, "synthetic_encode_mode"

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-direct {v1, v2, v5, v7}, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;-><init>(Ljava/lang/String;ILjava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 203
    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sConfigList:Ljava/util/List;

    new-instance v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;

    const-string v2, "synthetic_video_sw_crf"

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-direct {v1, v2, v5, v4}, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;-><init>(Ljava/lang/String;ILjava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 204
    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sConfigList:Ljava/util/List;

    new-instance v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;

    const-string v2, "synthetic_video_hw_bitrate"

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-direct {v1, v2, v5, v4}, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;-><init>(Ljava/lang/String;ILjava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 205
    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sConfigList:Ljava/util/List;

    new-instance v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;

    const-string v2, "synthetic_video_sw_maxrate"

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-direct {v1, v2, v5, v4}, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;-><init>(Ljava/lang/String;ILjava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 206
    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sConfigList:Ljava/util/List;

    new-instance v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;

    const-string v2, "synthetic_video_sw_preset"

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-direct {v1, v2, v5, v4}, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;-><init>(Ljava/lang/String;ILjava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 207
    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sConfigList:Ljava/util/List;

    new-instance v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;

    const-string v2, "synthetic_video_sw_gop"

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-direct {v1, v2, v5, v4}, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;-><init>(Ljava/lang/String;ILjava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 208
    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sConfigList:Ljava/util/List;

    new-instance v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;

    const-string v2, "synthetic_video_sw_qp"

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-direct {v1, v2, v5, v4}, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;-><init>(Ljava/lang/String;ILjava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 209
    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sConfigList:Ljava/util/List;

    new-instance v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;

    const-string v2, "synthetic_sw_bitrate_mode"

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-direct {v1, v2, v5, v4}, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;-><init>(Ljava/lang/String;ILjava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 210
    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sConfigList:Ljava/util/List;

    new-instance v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;

    const-string v2, "synthetic_hw_bitrate_mode"

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-direct {v1, v2, v5, v4}, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;-><init>(Ljava/lang/String;ILjava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 211
    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sConfigList:Ljava/util/List;

    new-instance v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;

    const-string v2, "synthetic_hw_profile"

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-direct {v1, v2, v5, v4}, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;-><init>(Ljava/lang/String;ILjava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 212
    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sConfigList:Ljava/util/List;

    new-instance v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;

    const-string v2, "earphone_echo_normal"

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-direct {v1, v2, v5, v4}, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;-><init>(Ljava/lang/String;ILjava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 213
    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sConfigList:Ljava/util/List;

    new-instance v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;

    const-string v2, "earphone_echo_aaudio"

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-direct {v1, v2, v5, v4}, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;-><init>(Ljava/lang/String;ILjava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 214
    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sConfigList:Ljava/util/List;

    new-instance v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;

    const-string v2, "earphone_echo_huawei"

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-direct {v1, v2, v5, v3}, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;-><init>(Ljava/lang/String;ILjava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 215
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static doubtingFilter(Lcom/ss/android/vesdk/runtime/cloudconfig/Config;Lorg/json/JSONObject;Z)Ljava/lang/String;
    .locals 16

    move-object/from16 v1, p0

    move-object/from16 v0, p1

    .line 609
    if-eqz v0, :cond_c

    .line 612
    iget-object v3, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->key:Ljava/lang/String;

    .line 613
    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v4

    const/4 v5, 0x0

    if-nez v4, :cond_1

    .line 614
    const-string v0, "PerfConfig"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "fetched config do not contain config.key = "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 615
    if-eqz p2, :cond_0

    .line 616
    iget-object v0, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->defaultValue:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 618
    :cond_0
    return-object v5

    .line 622
    :cond_1
    nop

    .line 623
    nop

    .line 625
    nop

    .line 626
    const-wide/high16 v6, -0x4010000000000000L    # -1.0

    .line 628
    const/4 v4, -0x1

    const/4 v8, 0x0

    const/4 v9, 0x1

    :try_start_0
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v10

    const/4 v11, 0x2

    const/16 v12, 0x9

    sparse-switch v10, :sswitch_data_0

    goto/16 :goto_0

    :sswitch_0
    const-string v10, "record_video_sw_qp"

    invoke-virtual {v3, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_2

    const/16 v10, 0x1d

    goto/16 :goto_1

    :sswitch_1
    const-string v10, "import_sw_bitrate_mode"

    invoke-virtual {v3, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_2

    const/16 v10, 0x21

    goto/16 :goto_1

    :sswitch_2
    const-string v10, "import_video_sw_qp"

    invoke-virtual {v3, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_2

    const/16 v10, 0x1e

    goto/16 :goto_1

    :sswitch_3
    const-string v10, "synthetic_hw_profile"

    invoke-virtual {v3, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_2

    const/16 v10, 0x19

    goto/16 :goto_1

    :sswitch_4
    const-string v10, "import_video_sw_maxrate"

    invoke-virtual {v3, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_2

    const/16 v10, 0xe

    goto/16 :goto_1

    :sswitch_5
    const-string v10, "import_shorter_pixels"

    invoke-virtual {v3, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_2

    const/16 v10, 0xc

    goto/16 :goto_1

    :sswitch_6
    const-string v10, "synthetic_video_sw_preset"

    invoke-virtual {v3, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_2

    const/16 v10, 0x10

    goto/16 :goto_1

    :sswitch_7
    const-string v10, "synthetic_hw_bitrate_mode"

    invoke-virtual {v3, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_2

    const/16 v10, 0x15

    goto/16 :goto_1

    :sswitch_8
    const-string v10, "synthetic_video_sw_maxrate"

    invoke-virtual {v3, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_2

    const/16 v10, 0xf

    goto/16 :goto_1

    :sswitch_9
    const-string v10, "record_camera_compat_level"

    invoke-virtual {v3, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_2

    const/16 v10, 0x13

    goto/16 :goto_1

    :sswitch_a
    const-string v10, "synthetic_encode_mode"

    invoke-virtual {v3, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_2

    move v10, v12

    goto/16 :goto_1

    :sswitch_b
    const-string v10, "synthetic_sw_bitrate_mode"

    invoke-virtual {v3, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_2

    const/16 v10, 0x22

    goto/16 :goto_1

    :sswitch_c
    const-string v10, "record_video_hw_bitrate"

    invoke-virtual {v3, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_2

    const/4 v10, 0x4

    goto/16 :goto_1

    :sswitch_d
    const-string v10, "record_video_sw_preset"

    invoke-virtual {v3, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_2

    const/16 v10, 0x11

    goto/16 :goto_1

    :sswitch_e
    const-string v10, "record_hw_bitrate_mode"

    invoke-virtual {v3, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_2

    const/16 v10, 0x14

    goto/16 :goto_1

    :sswitch_f
    const-string v10, "synthetic_video_sw_qp"

    invoke-virtual {v3, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_2

    const/16 v10, 0x1f

    goto/16 :goto_1

    :sswitch_10
    const-string v10, "import_video_sw_gop"

    invoke-virtual {v3, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_2

    const/16 v10, 0x1b

    goto/16 :goto_1

    :sswitch_11
    const-string v10, "import_video_sw_crf"

    invoke-virtual {v3, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_2

    move v10, v11

    goto/16 :goto_1

    :sswitch_12
    const-string v10, "record_sw_bitrate_mode"

    invoke-virtual {v3, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_2

    const/16 v10, 0x20

    goto/16 :goto_1

    :sswitch_13
    const-string v10, "import_hw_profile"

    invoke-virtual {v3, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_2

    const/16 v10, 0x18

    goto/16 :goto_1

    :sswitch_14
    const-string v10, "record_video_sw_gop"

    invoke-virtual {v3, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_2

    const/16 v10, 0x1a

    goto/16 :goto_1

    :sswitch_15
    const-string v10, "record_video_sw_crf"

    invoke-virtual {v3, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_2

    move v10, v9

    goto/16 :goto_1

    :sswitch_16
    const-string v10, "record_video_sw_maxrate"

    invoke-virtual {v3, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_2

    const/16 v10, 0xd

    goto/16 :goto_1

    :sswitch_17
    const-string v10, "record_resolution_width"

    invoke-virtual {v3, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_2

    const/16 v10, 0xa

    goto/16 :goto_1

    :sswitch_18
    const-string v10, "synthetic_video_sw_gop"

    invoke-virtual {v3, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_2

    const/16 v10, 0x1c

    goto/16 :goto_1

    :sswitch_19
    const-string v10, "synthetic_video_sw_crf"

    invoke-virtual {v3, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_2

    const/4 v10, 0x3

    goto/16 :goto_1

    :sswitch_1a
    const-string v10, "record_hw_profile"

    invoke-virtual {v3, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_2

    const/16 v10, 0x17

    goto/16 :goto_1

    :sswitch_1b
    const-string v10, "record_resolution_height"

    invoke-virtual {v3, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_2

    const/16 v10, 0xb

    goto/16 :goto_1

    :sswitch_1c
    const-string v10, "import_video_hw_bitrate"

    invoke-virtual {v3, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_2

    const/4 v10, 0x5

    goto/16 :goto_1

    :sswitch_1d
    const-string v10, "record_camera_type"

    invoke-virtual {v3, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_2

    move v10, v8

    goto :goto_1

    :sswitch_1e
    const-string v10, "earphone_echo_normal"

    invoke-virtual {v3, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_2

    const/16 v10, 0x23

    goto :goto_1

    :sswitch_1f
    const-string v10, "import_video_sw_preset"

    invoke-virtual {v3, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_2

    const/16 v10, 0x12

    goto :goto_1

    :sswitch_20
    const-string v10, "import_hw_bitrate_mode"

    invoke-virtual {v3, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_2

    const/16 v10, 0x16

    goto :goto_1

    :sswitch_21
    const-string v10, "record_encode_mode"

    invoke-virtual {v3, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_2

    const/4 v10, 0x7

    goto :goto_1

    :sswitch_22
    const-string v10, "earphone_echo_huawei"

    invoke-virtual {v3, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_2

    const/16 v10, 0x25

    goto :goto_1

    :sswitch_23
    const-string v10, "import_encode_mode"

    invoke-virtual {v3, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_2

    const/16 v10, 0x8

    goto :goto_1

    :sswitch_24
    const-string v10, "earphone_echo_aaudio"

    invoke-virtual {v3, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_2

    const/16 v10, 0x24

    goto :goto_1

    :sswitch_25
    const-string v10, "synthetic_video_hw_bitrate"

    invoke-virtual {v3, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_2

    const/4 v10, 0x6

    goto :goto_1

    :cond_2
    :goto_0
    move v10, v4

    :goto_1
    const/16 v13, 0x32

    const/16 v14, 0x1400

    const/16 v15, 0xa0

    packed-switch v10, :pswitch_data_0

    .line 796
    new-instance v0, Ljava/lang/IllegalStateException;

    goto/16 :goto_3

    .line 788
    :pswitch_0
    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v10
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_1

    .line 789
    if-eqz v10, :cond_3

    if-ne v10, v9, :cond_7

    .line 790
    :cond_3
    :try_start_1
    invoke-static {v10}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_2

    .line 780
    :pswitch_1
    :try_start_2
    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v10
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_1

    .line 781
    if-eqz v10, :cond_4

    if-ne v10, v9, :cond_7

    .line 782
    :cond_4
    :try_start_3
    invoke-static {v10}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0
    :try_end_3
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_0

    goto/16 :goto_2

    .line 772
    :pswitch_2
    :try_start_4
    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v10
    :try_end_4
    .catch Lorg/json/JSONException; {:try_start_4 .. :try_end_4} :catch_1

    .line 773
    if-eqz v10, :cond_5

    if-ne v10, v9, :cond_7

    .line 774
    :cond_5
    :try_start_5
    invoke-static {v10}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0
    :try_end_5
    .catch Lorg/json/JSONException; {:try_start_5 .. :try_end_5} :catch_0

    goto/16 :goto_2

    .line 764
    :pswitch_3
    :try_start_6
    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v10
    :try_end_6
    .catch Lorg/json/JSONException; {:try_start_6 .. :try_end_6} :catch_1

    .line 765
    if-ltz v10, :cond_7

    if-gt v10, v11, :cond_7

    .line 766
    :try_start_7
    invoke-static {v10}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0
    :try_end_7
    .catch Lorg/json/JSONException; {:try_start_7 .. :try_end_7} :catch_0

    goto/16 :goto_2

    .line 754
    :pswitch_4
    :try_start_8
    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v10
    :try_end_8
    .catch Lorg/json/JSONException; {:try_start_8 .. :try_end_8} :catch_1

    .line 755
    if-lt v10, v9, :cond_7

    if-gt v10, v13, :cond_7

    .line 756
    :try_start_9
    invoke-static {v10}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0
    :try_end_9
    .catch Lorg/json/JSONException; {:try_start_9 .. :try_end_9} :catch_0

    goto/16 :goto_2

    .line 744
    :pswitch_5
    :try_start_a
    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v10
    :try_end_a
    .catch Lorg/json/JSONException; {:try_start_a .. :try_end_a} :catch_1

    .line 745
    if-lt v10, v9, :cond_7

    .line 746
    :try_start_b
    invoke-static {v10}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0
    :try_end_b
    .catch Lorg/json/JSONException; {:try_start_b .. :try_end_b} :catch_0

    goto/16 :goto_2

    .line 733
    :pswitch_6
    :try_start_c
    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v10
    :try_end_c
    .catch Lorg/json/JSONException; {:try_start_c .. :try_end_c} :catch_1

    .line 734
    if-ltz v10, :cond_7

    .line 735
    :try_start_d
    invoke-static {v10}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0
    :try_end_d
    .catch Lorg/json/JSONException; {:try_start_d .. :try_end_d} :catch_0

    goto/16 :goto_2

    .line 723
    :pswitch_7
    :try_start_e
    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v10
    :try_end_e
    .catch Lorg/json/JSONException; {:try_start_e .. :try_end_e} :catch_1

    .line 724
    if-ltz v10, :cond_7

    .line 725
    :try_start_f
    invoke-static {v10}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0
    :try_end_f
    .catch Lorg/json/JSONException; {:try_start_f .. :try_end_f} :catch_0

    goto/16 :goto_2

    .line 713
    :pswitch_8
    :try_start_10
    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v10
    :try_end_10
    .catch Lorg/json/JSONException; {:try_start_10 .. :try_end_10} :catch_1

    .line 714
    if-ltz v10, :cond_7

    .line 715
    :try_start_11
    invoke-static {v10}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0
    :try_end_11
    .catch Lorg/json/JSONException; {:try_start_11 .. :try_end_11} :catch_0

    goto/16 :goto_2

    .line 705
    :pswitch_9
    :try_start_12
    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v10
    :try_end_12
    .catch Lorg/json/JSONException; {:try_start_12 .. :try_end_12} :catch_1

    .line 706
    if-ltz v10, :cond_7

    if-gt v10, v12, :cond_7

    .line 707
    :try_start_13
    invoke-static {v10}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0
    :try_end_13
    .catch Lorg/json/JSONException; {:try_start_13 .. :try_end_13} :catch_0

    goto/16 :goto_2

    .line 695
    :pswitch_a
    :try_start_14
    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v10
    :try_end_14
    .catch Lorg/json/JSONException; {:try_start_14 .. :try_end_14} :catch_1

    .line 696
    const v0, 0x186a0

    if-lt v10, v0, :cond_7

    const v0, 0x989680

    if-gt v10, v0, :cond_7

    .line 697
    :try_start_15
    invoke-static {v10}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0
    :try_end_15
    .catch Lorg/json/JSONException; {:try_start_15 .. :try_end_15} :catch_0

    goto/16 :goto_2

    .line 685
    :pswitch_b
    :try_start_16
    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v10
    :try_end_16
    .catch Lorg/json/JSONException; {:try_start_16 .. :try_end_16} :catch_1

    .line 686
    :try_start_17
    rem-int/lit8 v0, v10, 0x10

    if-nez v0, :cond_7

    if-lt v10, v15, :cond_7

    if-gt v10, v14, :cond_7

    .line 687
    invoke-static {v10}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0
    :try_end_17
    .catch Lorg/json/JSONException; {:try_start_17 .. :try_end_17} :catch_0

    goto :goto_2

    .line 676
    :pswitch_c
    :try_start_18
    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v10
    :try_end_18
    .catch Lorg/json/JSONException; {:try_start_18 .. :try_end_18} :catch_1

    .line 677
    :try_start_19
    rem-int/lit8 v0, v10, 0x10

    if-nez v0, :cond_7

    if-lt v10, v15, :cond_7

    if-gt v10, v14, :cond_7

    .line 678
    invoke-static {v10}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0
    :try_end_19
    .catch Lorg/json/JSONException; {:try_start_19 .. :try_end_19} :catch_0

    goto :goto_2

    .line 668
    :pswitch_d
    :try_start_1a
    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v10
    :try_end_1a
    .catch Lorg/json/JSONException; {:try_start_1a .. :try_end_1a} :catch_1

    .line 669
    :try_start_1b
    rem-int/lit8 v0, v10, 0x10

    if-nez v0, :cond_7

    if-lt v10, v15, :cond_7

    if-gt v10, v14, :cond_7

    .line 670
    invoke-static {v10}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0
    :try_end_1b
    .catch Lorg/json/JSONException; {:try_start_1b .. :try_end_1b} :catch_0

    goto :goto_2

    .line 799
    :catch_0
    move-exception v0

    goto :goto_4

    .line 660
    :pswitch_e
    :try_start_1c
    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v10
    :try_end_1c
    .catch Lorg/json/JSONException; {:try_start_1c .. :try_end_1c} :catch_1

    .line 661
    if-eqz v10, :cond_6

    if-ne v10, v9, :cond_7

    .line 662
    :cond_6
    :try_start_1d
    invoke-static {v10}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0
    :try_end_1d
    .catch Lorg/json/JSONException; {:try_start_1d .. :try_end_1d} :catch_0

    goto :goto_2

    .line 650
    :pswitch_f
    :try_start_1e
    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v10
    :try_end_1e
    .catch Lorg/json/JSONException; {:try_start_1e .. :try_end_1e} :catch_1

    .line 651
    if-lez v10, :cond_7

    .line 652
    :try_start_1f
    invoke-static {v10}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0
    :try_end_1f
    .catch Lorg/json/JSONException; {:try_start_1f .. :try_end_1f} :catch_0

    goto :goto_2

    .line 640
    :pswitch_10
    :try_start_20
    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v10
    :try_end_20
    .catch Lorg/json/JSONException; {:try_start_20 .. :try_end_20} :catch_1

    .line 641
    if-lt v10, v9, :cond_7

    if-gt v10, v13, :cond_7

    .line 642
    :try_start_21
    invoke-static {v10}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0
    :try_end_21
    .catch Lorg/json/JSONException; {:try_start_21 .. :try_end_21} :catch_0

    goto :goto_2

    .line 630
    :pswitch_11
    :try_start_22
    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v10
    :try_end_22
    .catch Lorg/json/JSONException; {:try_start_22 .. :try_end_22} :catch_1

    .line 631
    if-lt v10, v9, :cond_7

    .line 632
    :try_start_23
    invoke-static {v10}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0
    :try_end_23
    .catch Lorg/json/JSONException; {:try_start_23 .. :try_end_23} :catch_0

    goto :goto_2

    .line 803
    :cond_7
    move-object v0, v5

    :goto_2
    goto :goto_5

    .line 796
    :goto_3
    :try_start_24
    const-string v8, "Shouldn\'t reach here. Unmatched config.key case"

    invoke-direct {v0, v8}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_24
    .catch Lorg/json/JSONException; {:try_start_24 .. :try_end_24} :catch_1

    .line 799
    :catch_1
    move-exception v0

    move v10, v4

    .line 800
    :goto_4
    const-string v4, "PerfConfig"

    const-string v8, "Parse json result failed! "

    invoke-static {v4, v8, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 801
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    .line 802
    nop

    .line 805
    move-object v0, v5

    move v8, v9

    :goto_5
    if-nez v8, :cond_9

    if-nez v0, :cond_9

    .line 806
    iget v4, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->type:I

    if-nez v4, :cond_8

    .line 807
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

    goto :goto_6

    .line 808
    :cond_8
    iget v4, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->type:I

    if-ne v4, v9, :cond_9

    .line 809
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

    .line 812
    :cond_9
    :goto_6
    if-nez v0, :cond_b

    .line 813
    if-eqz p2, :cond_a

    iget-object v0, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->defaultValue:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    nop

    :cond_a
    return-object v5

    .line 815
    :cond_b
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

    .line 816
    return-object v0

    .line 610
    :cond_c
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "fetchedRawConfigs == null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :sswitch_data_0
    .sparse-switch
        -0x777dcbc5 -> :sswitch_25
        -0x776b4a78 -> :sswitch_24
        -0x6c3a6b6e -> :sswitch_23
        -0x6a6858a6 -> :sswitch_22
        -0x650114c2 -> :sswitch_21
        -0x63704035 -> :sswitch_20
        -0x620e9644 -> :sswitch_1f
        -0x60783da6 -> :sswitch_1e
        -0x5cdd72da -> :sswitch_1d
        -0x520c0c25 -> :sswitch_1c
        -0x4db68054 -> :sswitch_1b
        -0x4a6a84d9 -> :sswitch_1a
        -0x49b5df86 -> :sswitch_19
        -0x49b5d0d5 -> :sswitch_18
        -0x43bd255f -> :sswitch_17
        -0x1fc01625 -> :sswitch_16
        -0x1b41d112 -> :sswitch_15
        -0x1b41c261 -> :sswitch_14
        -0x895a8ad -> :sswitch_13
        0x1137142 -> :sswitch_12
        0x4ccb01a -> :sswitch_11
        0x4ccbecb -> :sswitch_10
        0x1ea78f1c -> :sswitch_f
        0x24a5e077 -> :sswitch_e
        0x26078a68 -> :sswitch_d
        0x28a1e8af -> :sswitch_c
        0x2d758436 -> :sswitch_b
        0x3ea89832 -> :sswitch_a
        0x3faa5a73 -> :sswitch_9
        0x40203567 -> :sswitch_8
        0x5107f36b -> :sswitch_7
        0x52699d5c -> :sswitch_6
        0x5370a55d -> :sswitch_5
        0x6591f507 -> :sswitch_4
        0x68485fb3 -> :sswitch_3
        0x73c48b7c -> :sswitch_2
        0x78fd5096 -> :sswitch_1
        0x7afde228 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_11
        :pswitch_10
        :pswitch_10
        :pswitch_10
        :pswitch_f
        :pswitch_f
        :pswitch_f
        :pswitch_e
        :pswitch_e
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_a
        :pswitch_a
        :pswitch_9
        :pswitch_9
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_7
        :pswitch_7
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static fetch()V
    .locals 2

    .line 450
    new-instance v0, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig$ConfigAsyncTask;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig$ConfigAsyncTask;-><init>(Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig$1;)V

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig$ConfigAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 451
    return-void
.end method

.method private static getDefaultFloat(Ljava/lang/String;)F
    .locals 3

    .line 544
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

    .line 545
    iget-object v2, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->key:Ljava/lang/String;

    invoke-virtual {v2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 546
    iget-object p0, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->defaultValue:Ljava/lang/Object;

    check-cast p0, Ljava/lang/Float;

    invoke-virtual {p0}, Ljava/lang/Float;->floatValue()F

    move-result p0

    return p0

    .line 548
    :cond_0
    goto :goto_0

    .line 549
    :cond_1
    const/high16 p0, -0x40800000    # -1.0f

    return p0
.end method

.method private static getDefaultInt(Ljava/lang/String;)I
    .locals 3

    .line 535
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

    .line 536
    iget-object v2, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->key:Ljava/lang/String;

    invoke-virtual {v2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 537
    iget-object p0, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->defaultValue:Ljava/lang/Object;

    check-cast p0, Ljava/lang/Integer;

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    return p0

    .line 539
    :cond_0
    goto :goto_0

    .line 540
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

    .line 409
    if-nez p0, :cond_0

    .line 410
    const/4 p0, 0x0

    return p0

    .line 412
    :cond_0
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    .line 414
    :try_start_0
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_1

    .line 415
    invoke-static {p0}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    .line 419
    :cond_1
    goto :goto_0

    .line 417
    :catch_0
    move-exception p0

    .line 418
    const-string p1, "PerfConfig"

    const-string v0, "getIntConfig: error"

    invoke-static {p1, v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 420
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

    .line 391
    if-nez p0, :cond_0

    .line 392
    const/4 p0, 0x0

    return p0

    .line 394
    :cond_0
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    .line 396
    :try_start_0
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_1

    .line 397
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    .line 401
    :cond_1
    goto :goto_0

    .line 399
    :catch_0
    move-exception p0

    .line 400
    const-string p1, "PerfConfig"

    const-string v0, "getIntConfig: error"

    invoke-static {p1, v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 402
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

    .line 849
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 851
    const-string v1, "ShortVideoConfig"

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    .line 852
    invoke-interface {p0}, Landroid/content/SharedPreferences;->getAll()Ljava/util/Map;

    move-result-object p0

    .line 853
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

    .line 854
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    const-string v3, "PerfConfig_"

    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 855
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

    .line 857
    :cond_0
    goto :goto_0

    .line 858
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

    .line 222
    invoke-static {}, Lcom/ss/android/vesdk/runtime/VERuntime;->getInstance()Lcom/ss/android/vesdk/runtime/VERuntime;

    move-result-object v0

    invoke-virtual {v0}, Lcom/ss/android/vesdk/runtime/VERuntime;->getContext()Landroid/content/Context;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 225
    invoke-static {}, Lcom/ss/android/vesdk/runtime/VERuntime;->getInstance()Lcom/ss/android/vesdk/runtime/VERuntime;

    move-result-object v0

    invoke-virtual {v0}, Lcom/ss/android/vesdk/runtime/VERuntime;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->getPerformanceConfig(Landroid/content/Context;)Ljava/util/Map;

    move-result-object v0

    invoke-static {v0}, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->setConfigsFromMap(Ljava/util/Map;)V

    .line 226
    return-void

    .line 223
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

    .line 256
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

    .line 257
    iget-object v2, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->key:Ljava/lang/String;

    const/4 v3, -0x1

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v4

    sparse-switch v4, :sswitch_data_0

    goto/16 :goto_1

    :sswitch_0
    const-string v4, "record_video_sw_qp"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/16 v3, 0xa

    goto/16 :goto_1

    :sswitch_1
    const-string v4, "import_sw_bitrate_mode"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/16 v3, 0x16

    goto/16 :goto_1

    :sswitch_2
    const-string v4, "import_video_sw_qp"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/16 v3, 0x15

    goto/16 :goto_1

    :sswitch_3
    const-string v4, "synthetic_hw_profile"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/16 v3, 0x22

    goto/16 :goto_1

    :sswitch_4
    const-string v4, "import_video_sw_maxrate"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/16 v3, 0x12

    goto/16 :goto_1

    :sswitch_5
    const-string v4, "import_shorter_pixels"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/16 v3, 0xf

    goto/16 :goto_1

    :sswitch_6
    const-string v4, "synthetic_video_sw_preset"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/16 v3, 0x1d

    goto/16 :goto_1

    :sswitch_7
    const-string v4, "synthetic_hw_bitrate_mode"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/16 v3, 0x21

    goto/16 :goto_1

    :sswitch_8
    const-string v4, "synthetic_video_sw_maxrate"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/16 v3, 0x1c

    goto/16 :goto_1

    :sswitch_9
    const-string v4, "record_camera_compat_level"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v3, 0x6

    goto/16 :goto_1

    :sswitch_a
    const-string v4, "synthetic_encode_mode"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/16 v3, 0x19

    goto/16 :goto_1

    :sswitch_b
    const-string v4, "synthetic_sw_bitrate_mode"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/16 v3, 0x20

    goto/16 :goto_1

    :sswitch_c
    const-string v4, "record_video_hw_bitrate"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v3, 0x2

    goto/16 :goto_1

    :sswitch_d
    const-string v4, "record_video_sw_preset"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/16 v3, 0x8

    goto/16 :goto_1

    :sswitch_e
    const-string v4, "record_hw_bitrate_mode"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/16 v3, 0xc

    goto/16 :goto_1

    :sswitch_f
    const-string v4, "synthetic_video_sw_qp"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/16 v3, 0x1f

    goto/16 :goto_1

    :sswitch_10
    const-string v4, "import_video_sw_gop"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/16 v3, 0x14

    goto/16 :goto_1

    :sswitch_11
    const-string v4, "import_video_sw_crf"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/16 v3, 0x10

    goto/16 :goto_1

    :sswitch_12
    const-string v4, "record_sw_bitrate_mode"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/16 v3, 0xb

    goto/16 :goto_1

    :sswitch_13
    const-string v4, "import_hw_profile"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/16 v3, 0x18

    goto/16 :goto_1

    :sswitch_14
    const-string v4, "record_video_sw_gop"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/16 v3, 0x9

    goto/16 :goto_1

    :sswitch_15
    const-string v4, "record_video_sw_crf"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v3, 0x1

    goto/16 :goto_1

    :sswitch_16
    const-string v4, "record_video_sw_maxrate"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v3, 0x7

    goto/16 :goto_1

    :sswitch_17
    const-string v4, "record_resolution_width"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v3, 0x4

    goto/16 :goto_1

    :sswitch_18
    const-string v4, "synthetic_video_sw_gop"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/16 v3, 0x1e

    goto/16 :goto_1

    :sswitch_19
    const-string v4, "synthetic_video_sw_crf"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/16 v3, 0x1a

    goto/16 :goto_1

    :sswitch_1a
    const-string v4, "record_hw_profile"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/16 v3, 0xd

    goto/16 :goto_1

    :sswitch_1b
    const-string v4, "record_resolution_height"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v3, 0x5

    goto/16 :goto_1

    :sswitch_1c
    const-string v4, "import_video_hw_bitrate"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/16 v3, 0x11

    goto :goto_1

    :sswitch_1d
    const-string v4, "record_camera_type"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v3, 0x0

    goto :goto_1

    :sswitch_1e
    const-string v4, "earphone_echo_normal"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/16 v3, 0x23

    goto :goto_1

    :sswitch_1f
    const-string v4, "import_video_sw_preset"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/16 v3, 0x13

    goto :goto_1

    :sswitch_20
    const-string v4, "import_hw_bitrate_mode"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/16 v3, 0x17

    goto :goto_1

    :sswitch_21
    const-string v4, "record_encode_mode"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v3, 0x3

    goto :goto_1

    :sswitch_22
    const-string v4, "earphone_echo_huawei"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/16 v3, 0x25

    goto :goto_1

    :sswitch_23
    const-string v4, "import_encode_mode"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/16 v3, 0xe

    goto :goto_1

    :sswitch_24
    const-string v4, "earphone_echo_aaudio"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/16 v3, 0x24

    goto :goto_1

    :sswitch_25
    const-string v4, "synthetic_video_hw_bitrate"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/16 v3, 0x1b

    :cond_0
    :goto_1
    packed-switch v3, :pswitch_data_0

    .line 373
    new-instance p0, Ljava/lang/IllegalStateException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unexpected Config.key = "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->key:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 370
    :pswitch_0
    sget-object v2, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sVECloudConfig:Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;

    iget-object v3, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->key:Ljava/lang/String;

    iget-object v1, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->defaultValue:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-static {p0, v3, v1}, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->getIntConfig(Ljava/util/Map;Ljava/lang/String;I)I

    move-result v1

    iput v1, v2, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mEarphoneEchoHuawei:I

    .line 371
    goto/16 :goto_2

    .line 367
    :pswitch_1
    sget-object v2, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sVECloudConfig:Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;

    iget-object v3, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->key:Ljava/lang/String;

    iget-object v1, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->defaultValue:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-static {p0, v3, v1}, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->getIntConfig(Ljava/util/Map;Ljava/lang/String;I)I

    move-result v1

    iput v1, v2, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mEarphoneEchoAAudio:I

    .line 368
    goto/16 :goto_2

    .line 364
    :pswitch_2
    sget-object v2, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sVECloudConfig:Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;

    iget-object v3, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->key:Ljava/lang/String;

    iget-object v1, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->defaultValue:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-static {p0, v3, v1}, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->getIntConfig(Ljava/util/Map;Ljava/lang/String;I)I

    move-result v1

    iput v1, v2, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mEarphoneEchoNormal:I

    .line 365
    goto/16 :goto_2

    .line 361
    :pswitch_3
    sget-object v2, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sVECloudConfig:Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;

    iget-object v3, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->key:Ljava/lang/String;

    iget-object v1, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->defaultValue:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-static {p0, v3, v1}, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->getIntConfig(Ljava/util/Map;Ljava/lang/String;I)I

    move-result v1

    iput v1, v2, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mCompileHwProfile:I

    .line 362
    goto/16 :goto_2

    .line 358
    :pswitch_4
    sget-object v2, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sVECloudConfig:Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;

    iget-object v3, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->key:Ljava/lang/String;

    iget-object v1, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->defaultValue:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-static {p0, v3, v1}, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->getIntConfig(Ljava/util/Map;Ljava/lang/String;I)I

    move-result v1

    iput v1, v2, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mCompileHwBitrateMode:I

    .line 359
    goto/16 :goto_2

    .line 355
    :pswitch_5
    sget-object v2, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sVECloudConfig:Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;

    iget-object v3, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->key:Ljava/lang/String;

    iget-object v1, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->defaultValue:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-static {p0, v3, v1}, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->getIntConfig(Ljava/util/Map;Ljava/lang/String;I)I

    move-result v1

    iput v1, v2, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mCompileSWBitrateMode:I

    .line 356
    goto/16 :goto_2

    .line 352
    :pswitch_6
    sget-object v2, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sVECloudConfig:Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;

    iget-object v3, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->key:Ljava/lang/String;

    iget-object v1, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->defaultValue:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-static {p0, v3, v1}, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->getIntConfig(Ljava/util/Map;Ljava/lang/String;I)I

    move-result v1

    iput v1, v2, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mCompileVideoSWQP:I

    .line 353
    goto/16 :goto_2

    .line 349
    :pswitch_7
    sget-object v2, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sVECloudConfig:Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;

    iget-object v3, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->key:Ljava/lang/String;

    iget-object v1, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->defaultValue:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-static {p0, v3, v1}, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->getIntConfig(Ljava/util/Map;Ljava/lang/String;I)I

    move-result v1

    iput v1, v2, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mCompileEncodeSWGOP:I

    .line 350
    goto/16 :goto_2

    .line 346
    :pswitch_8
    sget-object v2, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sVECloudConfig:Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;

    iget-object v3, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->key:Ljava/lang/String;

    iget-object v1, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->defaultValue:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-static {p0, v3, v1}, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->getIntConfig(Ljava/util/Map;Ljava/lang/String;I)I

    move-result v1

    iput v1, v2, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mCompileEncodeSWCRFPreset:I

    .line 347
    goto/16 :goto_2

    .line 343
    :pswitch_9
    sget-object v2, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sVECloudConfig:Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;

    iget-object v3, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->key:Ljava/lang/String;

    iget-object v1, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->defaultValue:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-static {p0, v3, v1}, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->getIntConfig(Ljava/util/Map;Ljava/lang/String;I)I

    move-result v1

    iput v1, v2, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mCompileEncodeSWMaxrate:I

    .line 344
    goto/16 :goto_2

    .line 340
    :pswitch_a
    sget-object v2, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sVECloudConfig:Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;

    iget-object v3, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->key:Ljava/lang/String;

    iget-object v1, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->defaultValue:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-static {p0, v3, v1}, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->getIntConfig(Ljava/util/Map;Ljava/lang/String;I)I

    move-result v1

    iput v1, v2, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mCompileEncodeHWBPS:I

    .line 341
    goto/16 :goto_2

    .line 337
    :pswitch_b
    sget-object v2, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sVECloudConfig:Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;

    iget-object v3, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->key:Ljava/lang/String;

    iget-object v1, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->defaultValue:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-static {p0, v3, v1}, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->getIntConfig(Ljava/util/Map;Ljava/lang/String;I)I

    move-result v1

    iput v1, v2, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mCompileEncodeSWCRF:I

    .line 338
    goto/16 :goto_2

    .line 334
    :pswitch_c
    sget-object v2, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sVECloudConfig:Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;

    iget-object v3, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->key:Ljava/lang/String;

    iget-object v1, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->defaultValue:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-static {p0, v3, v1}, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->getIntConfig(Ljava/util/Map;Ljava/lang/String;I)I

    move-result v1

    iput v1, v2, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mCompileEncodeMode:I

    .line 335
    goto/16 :goto_2

    .line 331
    :pswitch_d
    sget-object v2, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sVECloudConfig:Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;

    iget-object v3, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->key:Ljava/lang/String;

    iget-object v1, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->defaultValue:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-static {p0, v3, v1}, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->getIntConfig(Ljava/util/Map;Ljava/lang/String;I)I

    move-result v1

    iput v1, v2, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mImportHwProfile:I

    .line 332
    goto/16 :goto_2

    .line 328
    :pswitch_e
    sget-object v2, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sVECloudConfig:Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;

    iget-object v3, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->key:Ljava/lang/String;

    iget-object v1, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->defaultValue:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-static {p0, v3, v1}, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->getIntConfig(Ljava/util/Map;Ljava/lang/String;I)I

    move-result v1

    iput v1, v2, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mImportHwBitrateMode:I

    .line 329
    goto/16 :goto_2

    .line 325
    :pswitch_f
    sget-object v2, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sVECloudConfig:Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;

    iget-object v3, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->key:Ljava/lang/String;

    iget-object v1, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->defaultValue:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-static {p0, v3, v1}, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->getIntConfig(Ljava/util/Map;Ljava/lang/String;I)I

    move-result v1

    iput v1, v2, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mImportSWBitrateMode:I

    .line 326
    goto/16 :goto_2

    .line 322
    :pswitch_10
    sget-object v2, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sVECloudConfig:Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;

    iget-object v3, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->key:Ljava/lang/String;

    iget-object v1, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->defaultValue:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-static {p0, v3, v1}, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->getIntConfig(Ljava/util/Map;Ljava/lang/String;I)I

    move-result v1

    iput v1, v2, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mImportVideoSWQP:I

    .line 323
    goto/16 :goto_2

    .line 319
    :pswitch_11
    sget-object v2, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sVECloudConfig:Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;

    iget-object v3, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->key:Ljava/lang/String;

    iget-object v1, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->defaultValue:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-static {p0, v3, v1}, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->getIntConfig(Ljava/util/Map;Ljava/lang/String;I)I

    move-result v1

    iput v1, v2, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mImportVideoSWGop:I

    .line 320
    goto/16 :goto_2

    .line 316
    :pswitch_12
    sget-object v2, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sVECloudConfig:Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;

    iget-object v3, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->key:Ljava/lang/String;

    iget-object v1, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->defaultValue:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-static {p0, v3, v1}, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->getIntConfig(Ljava/util/Map;Ljava/lang/String;I)I

    move-result v1

    iput v1, v2, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mImportVideoSWPreset:I

    .line 317
    goto/16 :goto_2

    .line 313
    :pswitch_13
    sget-object v2, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sVECloudConfig:Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;

    iget-object v3, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->key:Ljava/lang/String;

    iget-object v1, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->defaultValue:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-static {p0, v3, v1}, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->getIntConfig(Ljava/util/Map;Ljava/lang/String;I)I

    move-result v1

    iput v1, v2, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mImportVideoSWMaxrate:I

    .line 314
    goto/16 :goto_2

    .line 310
    :pswitch_14
    sget-object v2, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sVECloudConfig:Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;

    iget-object v3, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->key:Ljava/lang/String;

    iget-object v1, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->defaultValue:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-static {p0, v3, v1}, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->getIntConfig(Ljava/util/Map;Ljava/lang/String;I)I

    move-result v1

    iput v1, v2, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mImportHWEncodeBPS:I

    .line 311
    goto/16 :goto_2

    .line 307
    :pswitch_15
    sget-object v2, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sVECloudConfig:Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;

    iget-object v3, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->key:Ljava/lang/String;

    iget-object v1, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->defaultValue:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-static {p0, v3, v1}, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->getIntConfig(Ljava/util/Map;Ljava/lang/String;I)I

    move-result v1

    iput v1, v2, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mImportSWEncodeCRF:I

    .line 308
    goto/16 :goto_2

    .line 304
    :pswitch_16
    sget-object v2, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sVECloudConfig:Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;

    iget-object v3, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->key:Ljava/lang/String;

    iget-object v1, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->defaultValue:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-static {p0, v3, v1}, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->getIntConfig(Ljava/util/Map;Ljava/lang/String;I)I

    move-result v1

    iput v1, v2, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mImportShortEdgeValue:I

    .line 305
    goto/16 :goto_2

    .line 301
    :pswitch_17
    sget-object v2, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sVECloudConfig:Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;

    iget-object v3, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->key:Ljava/lang/String;

    iget-object v1, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->defaultValue:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-static {p0, v3, v1}, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->getIntConfig(Ljava/util/Map;Ljava/lang/String;I)I

    move-result v1

    iput v1, v2, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mImportEncodeMode:I

    .line 302
    goto/16 :goto_2

    .line 298
    :pswitch_18
    sget-object v2, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sVECloudConfig:Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;

    iget-object v3, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->key:Ljava/lang/String;

    iget-object v1, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->defaultValue:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-static {p0, v3, v1}, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->getIntConfig(Ljava/util/Map;Ljava/lang/String;I)I

    move-result v1

    iput v1, v2, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mRecordHwProfile:I

    .line 299
    goto/16 :goto_2

    .line 295
    :pswitch_19
    sget-object v2, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sVECloudConfig:Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;

    iget-object v3, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->key:Ljava/lang/String;

    iget-object v1, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->defaultValue:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-static {p0, v3, v1}, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->getIntConfig(Ljava/util/Map;Ljava/lang/String;I)I

    move-result v1

    iput v1, v2, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mRecordHwBitrateMode:I

    .line 296
    goto/16 :goto_2

    .line 292
    :pswitch_1a
    sget-object v2, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sVECloudConfig:Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;

    iget-object v3, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->key:Ljava/lang/String;

    iget-object v1, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->defaultValue:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-static {p0, v3, v1}, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->getIntConfig(Ljava/util/Map;Ljava/lang/String;I)I

    move-result v1

    iput v1, v2, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mRecordSWBitrateMode:I

    .line 293
    goto/16 :goto_2

    .line 289
    :pswitch_1b
    sget-object v2, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sVECloudConfig:Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;

    iget-object v3, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->key:Ljava/lang/String;

    iget-object v1, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->defaultValue:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-static {p0, v3, v1}, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->getIntConfig(Ljava/util/Map;Ljava/lang/String;I)I

    move-result v1

    iput v1, v2, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mRecordVideoSWQP:I

    .line 290
    goto/16 :goto_2

    .line 286
    :pswitch_1c
    sget-object v2, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sVECloudConfig:Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;

    iget-object v3, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->key:Ljava/lang/String;

    iget-object v1, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->defaultValue:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-static {p0, v3, v1}, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->getIntConfig(Ljava/util/Map;Ljava/lang/String;I)I

    move-result v1

    iput v1, v2, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mRecordVideoSWGop:I

    .line 287
    goto/16 :goto_2

    .line 283
    :pswitch_1d
    sget-object v2, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sVECloudConfig:Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;

    iget-object v3, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->key:Ljava/lang/String;

    iget-object v1, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->defaultValue:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-static {p0, v3, v1}, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->getIntConfig(Ljava/util/Map;Ljava/lang/String;I)I

    move-result v1

    iput v1, v2, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mRecordVideoSWPreset:I

    .line 284
    goto/16 :goto_2

    .line 280
    :pswitch_1e
    sget-object v2, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sVECloudConfig:Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;

    iget-object v3, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->key:Ljava/lang/String;

    iget-object v1, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->defaultValue:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-static {p0, v3, v1}, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->getIntConfig(Ljava/util/Map;Ljava/lang/String;I)I

    move-result v1

    iput v1, v2, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mRecordVideoSWMaxrate:I

    .line 281
    goto/16 :goto_2

    .line 277
    :pswitch_1f
    sget-object v2, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sVECloudConfig:Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;

    iget-object v3, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->key:Ljava/lang/String;

    iget-object v1, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->defaultValue:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-static {p0, v3, v1}, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->getIntConfig(Ljava/util/Map;Ljava/lang/String;I)I

    move-result v1

    iput v1, v2, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mRecordCameraCompatLevel:I

    .line 278
    goto :goto_2

    .line 274
    :pswitch_20
    sget-object v2, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sVECloudConfig:Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;

    iget-object v3, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->key:Ljava/lang/String;

    iget-object v1, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->defaultValue:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-static {p0, v3, v1}, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->getIntConfig(Ljava/util/Map;Ljava/lang/String;I)I

    move-result v1

    iput v1, v2, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mRecordResolutionHeight:I

    .line 275
    goto :goto_2

    .line 271
    :pswitch_21
    sget-object v2, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sVECloudConfig:Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;

    iget-object v3, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->key:Ljava/lang/String;

    iget-object v1, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->defaultValue:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-static {p0, v3, v1}, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->getIntConfig(Ljava/util/Map;Ljava/lang/String;I)I

    move-result v1

    iput v1, v2, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mRecordResolutionWidth:I

    .line 272
    goto :goto_2

    .line 268
    :pswitch_22
    sget-object v2, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sVECloudConfig:Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;

    iget-object v3, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->key:Ljava/lang/String;

    iget-object v1, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->defaultValue:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-static {p0, v3, v1}, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->getIntConfig(Ljava/util/Map;Ljava/lang/String;I)I

    move-result v1

    iput v1, v2, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mRecordEncodeMode:I

    .line 269
    goto :goto_2

    .line 265
    :pswitch_23
    sget-object v2, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sVECloudConfig:Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;

    iget-object v3, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->key:Ljava/lang/String;

    iget-object v1, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->defaultValue:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-static {p0, v3, v1}, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->getIntConfig(Ljava/util/Map;Ljava/lang/String;I)I

    move-result v1

    iput v1, v2, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mRecordHWEncodeBPS:I

    .line 266
    goto :goto_2

    .line 262
    :pswitch_24
    sget-object v2, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sVECloudConfig:Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;

    iget-object v3, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->key:Ljava/lang/String;

    iget-object v1, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->defaultValue:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-static {p0, v3, v1}, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->getIntConfig(Ljava/util/Map;Ljava/lang/String;I)I

    move-result v1

    iput v1, v2, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mRecordSWEncodeCRF:I

    .line 263
    goto :goto_2

    .line 259
    :pswitch_25
    sget-object v2, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sVECloudConfig:Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;

    iget-object v3, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->key:Ljava/lang/String;

    iget-object v1, v1, Lcom/ss/android/vesdk/runtime/cloudconfig/Config;->defaultValue:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-static {p0, v3, v1}, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->getIntConfig(Ljava/util/Map;Ljava/lang/String;I)I

    move-result v1

    iput v1, v2, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mRecordCameraType:I

    .line 260
    nop

    .line 375
    :goto_2
    goto/16 :goto_0

    .line 378
    :cond_1
    return-void

    nop

    :sswitch_data_0
    .sparse-switch
        -0x777dcbc5 -> :sswitch_25
        -0x776b4a78 -> :sswitch_24
        -0x6c3a6b6e -> :sswitch_23
        -0x6a6858a6 -> :sswitch_22
        -0x650114c2 -> :sswitch_21
        -0x63704035 -> :sswitch_20
        -0x620e9644 -> :sswitch_1f
        -0x60783da6 -> :sswitch_1e
        -0x5cdd72da -> :sswitch_1d
        -0x520c0c25 -> :sswitch_1c
        -0x4db68054 -> :sswitch_1b
        -0x4a6a84d9 -> :sswitch_1a
        -0x49b5df86 -> :sswitch_19
        -0x49b5d0d5 -> :sswitch_18
        -0x43bd255f -> :sswitch_17
        -0x1fc01625 -> :sswitch_16
        -0x1b41d112 -> :sswitch_15
        -0x1b41c261 -> :sswitch_14
        -0x895a8ad -> :sswitch_13
        0x1137142 -> :sswitch_12
        0x4ccb01a -> :sswitch_11
        0x4ccbecb -> :sswitch_10
        0x1ea78f1c -> :sswitch_f
        0x24a5e077 -> :sswitch_e
        0x26078a68 -> :sswitch_d
        0x28a1e8af -> :sswitch_c
        0x2d758436 -> :sswitch_b
        0x3ea89832 -> :sswitch_a
        0x3faa5a73 -> :sswitch_9
        0x40203567 -> :sswitch_8
        0x5107f36b -> :sswitch_7
        0x52699d5c -> :sswitch_6
        0x5370a55d -> :sswitch_5
        0x6591f507 -> :sswitch_4
        0x68485fb3 -> :sswitch_3
        0x73c48b7c -> :sswitch_2
        0x78fd5096 -> :sswitch_1
        0x7afde228 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_25
        :pswitch_24
        :pswitch_23
        :pswitch_22
        :pswitch_21
        :pswitch_20
        :pswitch_1f
        :pswitch_1e
        :pswitch_1d
        :pswitch_1c
        :pswitch_1b
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
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

    .line 830
    if-nez p1, :cond_0

    .line 831
    return-void

    .line 833
    :cond_0
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p1

    .line 834
    const-string v0, "ShortVideoConfig"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    .line 835
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    .line 836
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 837
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

    .line 838
    goto :goto_0

    .line 839
    :cond_1
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 840
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

    .line 234
    invoke-static {p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->setConfigsFromMap(Ljava/util/Map;)V

    .line 236
    invoke-static {}, Lcom/ss/android/vesdk/runtime/VERuntime;->getInstance()Lcom/ss/android/vesdk/runtime/VERuntime;

    move-result-object v0

    invoke-virtual {v0}, Lcom/ss/android/vesdk/runtime/VERuntime;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->setPerformanceConfig(Landroid/content/Context;Ljava/util/Map;)V

    .line 237
    return-void
.end method
