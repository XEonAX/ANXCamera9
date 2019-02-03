.class public Lcom/android/camera/statistic/CameraStatUtil;
.super Ljava/lang/Object;
.source "CameraStatUtil.java"


# static fields
.field private static final AUTO:Ljava/lang/String; = "auto"

.field public static final AUTO_OFF:Ljava/lang/String; = "auto-off"

.field public static final AUTO_ON:Ljava/lang/String; = "auto-on"

.field public static final NONE:Ljava/lang/String; = "none"

.field private static final OTHERS:Ljava/lang/String; = "others"

.field private static final TAG:Ljava/lang/String;

.field private static sBeautyTypeToName:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static sCameraModeIdToName:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static sExposureTimeLessThan1sToName:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static sFilterTypeToName:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static sPictureQualityIndexToName:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static sTriggerModeIdToName:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 52
    const-class v0, Lcom/android/camera/statistic/CameraStatUtil;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/statistic/CameraStatUtil;->TAG:Ljava/lang/String;

    .line 61
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    sput-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sCameraModeIdToName:Landroid/util/SparseArray;

    .line 64
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sCameraModeIdToName:Landroid/util/SparseArray;

    const-string v1, "\u5c0f\u89c6\u9891"

    const/16 v2, 0xa1

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 65
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sCameraModeIdToName:Landroid/util/SparseArray;

    const-string v1, "\u62cd\u7167"

    const/16 v2, 0xa3

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 66
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sCameraModeIdToName:Landroid/util/SparseArray;

    const-string v1, "\u65b9\u5f62"

    const/16 v2, 0xa5

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 67
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sCameraModeIdToName:Landroid/util/SparseArray;

    const-string v1, "\u5168\u666f"

    const/16 v2, 0xa6

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 68
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sCameraModeIdToName:Landroid/util/SparseArray;

    const-string v1, "\u624b\u52a8"

    const/16 v2, 0xa7

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 69
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sCameraModeIdToName:Landroid/util/SparseArray;

    const-string v1, "\u4eba\u50cf"

    const/16 v2, 0xab

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 70
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sCameraModeIdToName:Landroid/util/SparseArray;

    const-string v1, "\u6162\u52a8\u4f5c"

    const/16 v2, 0xac

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 71
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sCameraModeIdToName:Landroid/util/SparseArray;

    const-string v1, "\u591c\u666f"

    const/16 v2, 0xad

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 74
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    sput-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sTriggerModeIdToName:Landroid/util/SparseArray;

    .line 77
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sTriggerModeIdToName:Landroid/util/SparseArray;

    const-string v1, "\u62cd\u7167\u952e"

    const/16 v2, 0xa

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 78
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sTriggerModeIdToName:Landroid/util/SparseArray;

    const-string v1, "\u97f3\u91cf\u952e"

    const/16 v2, 0x14

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 79
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sTriggerModeIdToName:Landroid/util/SparseArray;

    const-string v1, "\u6307\u7eb9"

    const/16 v2, 0x1e

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 80
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sTriggerModeIdToName:Landroid/util/SparseArray;

    const-string v1, "\u76f8\u673a\u952e"

    const/16 v2, 0x28

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 81
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sTriggerModeIdToName:Landroid/util/SparseArray;

    const-string v1, "dpad\u952e"

    const/16 v2, 0x32

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 82
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sTriggerModeIdToName:Landroid/util/SparseArray;

    const-string v1, "\u7269\u4f53\u8ffd\u8e2a"

    const/16 v2, 0x3c

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 83
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sTriggerModeIdToName:Landroid/util/SparseArray;

    const-string v1, "\u58f0\u63a7\u5feb\u95e8"

    const/16 v2, 0x46

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 84
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sTriggerModeIdToName:Landroid/util/SparseArray;

    const-string v1, "\u957f\u6309\u5c4f\u5e55"

    const/16 v2, 0x50

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 85
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sTriggerModeIdToName:Landroid/util/SparseArray;

    const-string v1, "\u66dd\u5149\u73af"

    const/16 v2, 0x5a

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 86
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sTriggerModeIdToName:Landroid/util/SparseArray;

    const-string v1, "\u624b\u52bf\u62cd\u7167"

    const/16 v2, 0x64

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 92
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    sput-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sPictureQualityIndexToName:Landroid/util/SparseArray;

    .line 95
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sPictureQualityIndexToName:Landroid/util/SparseArray;

    const-string v1, "\u6700\u4f4e"

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 96
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sPictureQualityIndexToName:Landroid/util/SparseArray;

    const-string v1, "\u66f4\u4f4e"

    const/4 v3, 0x1

    invoke-virtual {v0, v3, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 97
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sPictureQualityIndexToName:Landroid/util/SparseArray;

    const-string v1, "\u4f4e"

    const/4 v3, 0x2

    invoke-virtual {v0, v3, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 98
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sPictureQualityIndexToName:Landroid/util/SparseArray;

    const-string v1, "\u6807\u51c6"

    const/4 v3, 0x3

    invoke-virtual {v0, v3, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 99
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sPictureQualityIndexToName:Landroid/util/SparseArray;

    const-string v1, "\u9ad8"

    const/4 v3, 0x4

    invoke-virtual {v0, v3, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 100
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sPictureQualityIndexToName:Landroid/util/SparseArray;

    const-string v1, "\u66f4\u9ad8"

    const/4 v3, 0x5

    invoke-virtual {v0, v3, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 101
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sPictureQualityIndexToName:Landroid/util/SparseArray;

    const-string v1, "\u6700\u9ad8"

    const/4 v3, 0x6

    invoke-virtual {v0, v3, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 104
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    sput-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sExposureTimeLessThan1sToName:Landroid/util/SparseArray;

    .line 107
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sExposureTimeLessThan1sToName:Landroid/util/SparseArray;

    const-string v1, "auto"

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 108
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sExposureTimeLessThan1sToName:Landroid/util/SparseArray;

    const-string v1, "1/1000s"

    const/16 v2, 0x3e8

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 109
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sExposureTimeLessThan1sToName:Landroid/util/SparseArray;

    const-string v1, "1/500s"

    const/16 v2, 0x7d0

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 110
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sExposureTimeLessThan1sToName:Landroid/util/SparseArray;

    const-string v1, "1/250s"

    const/16 v2, 0xfa0

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 111
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sExposureTimeLessThan1sToName:Landroid/util/SparseArray;

    const-string v1, "1/250s"

    const/16 v2, 0x1388

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 112
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sExposureTimeLessThan1sToName:Landroid/util/SparseArray;

    const-string v1, "1/125s"

    const/16 v2, 0x1f40

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 113
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sExposureTimeLessThan1sToName:Landroid/util/SparseArray;

    const-string v1, "1/60s"

    const/16 v2, 0x411b

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 114
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sExposureTimeLessThan1sToName:Landroid/util/SparseArray;

    const-string v1, "1/30s"

    const v2, 0x8235

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 115
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sExposureTimeLessThan1sToName:Landroid/util/SparseArray;

    const-string v1, "1/15s"

    const v2, 0x1046b

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 116
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sExposureTimeLessThan1sToName:Landroid/util/SparseArray;

    const-string v1, "1/8s"

    const v2, 0x1e848

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 117
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sExposureTimeLessThan1sToName:Landroid/util/SparseArray;

    const-string v1, "1/4s"

    const v2, 0x3d090

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 118
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sExposureTimeLessThan1sToName:Landroid/util/SparseArray;

    const-string v1, "1/2s"

    const v2, 0x7a120

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 119
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sExposureTimeLessThan1sToName:Landroid/util/SparseArray;

    const-string v1, "1s"

    const v2, 0xf4240

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 120
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sExposureTimeLessThan1sToName:Landroid/util/SparseArray;

    const-string v1, "2s"

    const v2, 0x1e8480

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 121
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sExposureTimeLessThan1sToName:Landroid/util/SparseArray;

    const-string v1, "4s"

    const v2, 0x3d0900

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 122
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sExposureTimeLessThan1sToName:Landroid/util/SparseArray;

    const-string v1, "8s"

    const v2, 0x7a1200

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 123
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sExposureTimeLessThan1sToName:Landroid/util/SparseArray;

    const-string v1, "16s"

    const v2, 0xf42400

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 124
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sExposureTimeLessThan1sToName:Landroid/util/SparseArray;

    const-string v1, "32s"

    const v2, 0x1e84800

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 127
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    sput-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sBeautyTypeToName:Landroid/util/SparseArray;

    .line 130
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sBeautyTypeToName:Landroid/util/SparseArray;

    sget-object v1, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->WHITEN_STRENGTH:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    invoke-virtual {v1}, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->ordinal()I

    move-result v1

    const-string v2, "\u7f8e\u767d"

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 131
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sBeautyTypeToName:Landroid/util/SparseArray;

    sget-object v1, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->SHRINK_FACE_RATIO:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    invoke-virtual {v1}, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->ordinal()I

    move-result v1

    const-string v2, "\u7626\u8138"

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 132
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sBeautyTypeToName:Landroid/util/SparseArray;

    sget-object v1, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->ENLARGE_EYE_RATIO:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    invoke-virtual {v1}, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->ordinal()I

    move-result v1

    const-string v2, "\u5927\u773c"

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 133
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sBeautyTypeToName:Landroid/util/SparseArray;

    sget-object v1, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->SMOOTH_STRENGTH:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    invoke-virtual {v1}, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->ordinal()I

    move-result v1

    const-string v2, "\u5ae9\u80a4"

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 135
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sBeautyTypeToName:Landroid/util/SparseArray;

    sget-object v1, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->NOSE_RATIO:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    invoke-virtual {v1}, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->ordinal()I

    move-result v1

    const-string v2, "\u82ad\u6bd4\u9f3b"

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 136
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sBeautyTypeToName:Landroid/util/SparseArray;

    sget-object v1, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->RISORIUS_RATIO:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    invoke-virtual {v1}, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->ordinal()I

    move-result v1

    const-string v2, "\u82f9\u679c\u808c"

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 137
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sBeautyTypeToName:Landroid/util/SparseArray;

    sget-object v1, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->LIPS_RATIO:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    invoke-virtual {v1}, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->ordinal()I

    move-result v1

    const-string v2, "\u82b1\u74e3\u5507"

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 138
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sBeautyTypeToName:Landroid/util/SparseArray;

    sget-object v1, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->CHIN_RATIO:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    invoke-virtual {v1}, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->ordinal()I

    move-result v1

    const-string v2, "\u7fd8\u4e0b\u5df4"

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 139
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sBeautyTypeToName:Landroid/util/SparseArray;

    sget-object v1, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->NECK_RATIO:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    invoke-virtual {v1}, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->ordinal()I

    move-result v1

    const-string v2, "\u5929\u9e45\u9888"

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 141
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sBeautyTypeToName:Landroid/util/SparseArray;

    sget-object v1, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->SMILE_RATIO:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    invoke-virtual {v1}, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->ordinal()I

    move-result v1

    const-string v2, "\u5fae\u7b11"

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 142
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sBeautyTypeToName:Landroid/util/SparseArray;

    sget-object v1, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->SLIM_NOSE_RATIO:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    invoke-virtual {v1}, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->ordinal()I

    move-result v1

    const-string v2, "\u7626\u9f3b"

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 145
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    sput-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sFilterTypeToName:Landroid/util/SparseArray;

    .line 148
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sFilterTypeToName:Landroid/util/SparseArray;

    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->N_BERRY:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const-string v2, "\u6d46\u679c"

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 149
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sFilterTypeToName:Landroid/util/SparseArray;

    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->N_COOKIE:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const-string v2, "\u66f2\u5947"

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 150
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sFilterTypeToName:Landroid/util/SparseArray;

    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->N_DELICACY:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const-string v2, "\u7f8e\u5473"

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 151
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sFilterTypeToName:Landroid/util/SparseArray;

    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->N_FADE:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const-string v2, "\u892a\u8272"

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 152
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sFilterTypeToName:Landroid/util/SparseArray;

    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->N_FILM:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const-string v2, "\u80f6\u7247(\u62cd\u7167)"

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 153
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sFilterTypeToName:Landroid/util/SparseArray;

    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->N_KOIZORA:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const-string v2, "\u604b\u7a7a"

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 154
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sFilterTypeToName:Landroid/util/SparseArray;

    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->N_LATTE:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const-string v2, "\u62ff\u94c1"

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 155
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sFilterTypeToName:Landroid/util/SparseArray;

    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->N_LIGHT:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const-string v2, "\u6d6e\u5149"

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 156
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sFilterTypeToName:Landroid/util/SparseArray;

    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->N_LIVELY:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const-string v2, "\u751f\u52a8"

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 157
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sFilterTypeToName:Landroid/util/SparseArray;

    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->N_QUIET:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const-string v2, "\u9759\u8c27"

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 158
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sFilterTypeToName:Landroid/util/SparseArray;

    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->N_SODA:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const-string v2, "\u6c7d\u6c34"

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 159
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sFilterTypeToName:Landroid/util/SparseArray;

    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->N_WARM:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const-string v2, "\u6696\u9633"

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 160
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sFilterTypeToName:Landroid/util/SparseArray;

    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->B_FAIRYTALE:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const-string v2, "\u7ae5\u8bdd"

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 161
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sFilterTypeToName:Landroid/util/SparseArray;

    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->B_JAPANESE:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const-string v2, "\u65e5\u7cfb"

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 162
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sFilterTypeToName:Landroid/util/SparseArray;

    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->B_MINT:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const-string v2, "\u8584\u8377"

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 163
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sFilterTypeToName:Landroid/util/SparseArray;

    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->B_MOOD:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const-string v2, "\u5fc3\u5883"

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 164
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sFilterTypeToName:Landroid/util/SparseArray;

    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->B_NATURE:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const-string v2, "\u81ea\u7136"

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 165
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sFilterTypeToName:Landroid/util/SparseArray;

    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->B_PINK:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const-string v2, "\u7c89\u5ae9"

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 166
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sFilterTypeToName:Landroid/util/SparseArray;

    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->B_ROMANCE:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const-string v2, "\u6d6a\u6f2b"

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 167
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sFilterTypeToName:Landroid/util/SparseArray;

    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->B_MAZE:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const-string v2, "\u8ff7\u5bab"

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 168
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sFilterTypeToName:Landroid/util/SparseArray;

    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->B_WHITEANDBLACK:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const-string v2, "\u9ed1\u767d(\u4eba\u50cf)"

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 169
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sFilterTypeToName:Landroid/util/SparseArray;

    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->S_FILM:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const-string v2, "\u80f6\u7247(\u5f55\u50cf)"

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 170
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sFilterTypeToName:Landroid/util/SparseArray;

    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->S_YEARS:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const-string v2, "\u90a3\u4e9b\u5e74"

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 171
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sFilterTypeToName:Landroid/util/SparseArray;

    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->S_POLAROID:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const-string v2, "\u62cd\u7acb\u5f97"

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 172
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sFilterTypeToName:Landroid/util/SparseArray;

    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->S_FOREST:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const-string v2, "\u5c0f\u68ee\u6797"

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 173
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sFilterTypeToName:Landroid/util/SparseArray;

    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->S_BYGONE:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const-string v2, "\u5f80\u4e8b"

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 174
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sFilterTypeToName:Landroid/util/SparseArray;

    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->S_WHITEANDBLACK:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const-string v2, "\u9ed1\u767d(\u5f55\u50cf)"

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 175
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sFilterTypeToName:Landroid/util/SparseArray;

    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->N_WHITEANDBLACK:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const-string v2, "\u9ed1\u767d(\u62cd\u7167)"

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 176
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static addCameraSuffix(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 517
    if-eqz p0, :cond_1

    .line 518
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "_"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontCamera()Z

    move-result p0

    if-eqz p0, :cond_0

    const-string p0, "front"

    goto :goto_0

    :cond_0
    const-string p0, "back"

    :goto_0
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 519
    return-object p0

    .line 522
    :cond_1
    return-object p0
.end method

.method private static antiBandingToName(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 418
    if-nez p0, :cond_0

    .line 419
    sget-object p0, Lcom/android/camera/statistic/CameraStatUtil;->TAG:Ljava/lang/String;

    const-string v0, "null antiBanding"

    invoke-static {p0, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 420
    const-string p0, "others"

    return-object p0

    .line 422
    :cond_0
    const/4 v0, -0x1

    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    const-string v1, "3"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v0, 0x3

    goto :goto_0

    :pswitch_1
    const-string v1, "2"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v0, 0x2

    goto :goto_0

    :pswitch_2
    const-string v1, "1"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :pswitch_3
    const-string v1, "0"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v0, 0x0

    :cond_1
    :goto_0
    packed-switch v0, :pswitch_data_1

    .line 432
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "unexpected antiBanding "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 433
    const-string p0, "others"

    return-object p0

    .line 430
    :pswitch_4
    const-string p0, "auto"

    return-object p0

    .line 428
    :pswitch_5
    const-string p0, "60hz"

    return-object p0

    .line 426
    :pswitch_6
    const-string p0, "50hz"

    return-object p0

    .line 424
    :pswitch_7
    const-string p0, "off"

    return-object p0

    :pswitch_data_0
    .packed-switch 0x30
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
    .end packed-switch
.end method

.method private static autoExposureToName(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 279
    if-eqz p0, :cond_2

    .line 280
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 281
    const v1, 0x7f09010d

    .line 282
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 281
    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 283
    const-string p0, "\u5e73\u5747\u6d4b\u5149"

    return-object p0

    .line 284
    :cond_0
    const v1, 0x7f09010e

    .line 285
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 284
    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 286
    const-string p0, "\u4e2d\u5fc3\u6743\u91cd"

    return-object p0

    .line 287
    :cond_1
    const v1, 0x7f09010f

    .line 288
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 287
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 289
    const-string p0, "\u4e2d\u70b9\u6d4b\u5149"

    return-object p0

    .line 293
    :cond_2
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "unexpected auto exposure "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 294
    const-string p0, "others"

    return-object p0
.end method

.method private static autoWhiteBalanceToName(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 298
    if-nez p0, :cond_0

    .line 299
    sget-object p0, Lcom/android/camera/statistic/CameraStatUtil;->TAG:Ljava/lang/String;

    const-string v0, "null awb"

    invoke-static {p0, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 300
    const-string p0, "others"

    return-object p0

    .line 302
    :cond_0
    const/4 v0, -0x1

    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result v1

    sparse-switch v1, :sswitch_data_0

    goto :goto_0

    :sswitch_0
    const-string v1, "6"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v0, 0x5

    goto :goto_0

    :sswitch_1
    const-string v1, "5"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v0, 0x4

    goto :goto_0

    :sswitch_2
    const-string v1, "3"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v0, 0x3

    goto :goto_0

    :sswitch_3
    const-string v1, "2"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v0, 0x2

    goto :goto_0

    :sswitch_4
    const-string v1, "1"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :sswitch_5
    const-string v1, "manual"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v0, 0x0

    :cond_1
    :goto_0
    packed-switch v0, :pswitch_data_0

    .line 316
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "unexpected awb "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 317
    const-string p0, "others"

    return-object p0

    .line 314
    :pswitch_0
    const-string p0, "cloudy-daylight"

    return-object p0

    .line 312
    :pswitch_1
    const-string p0, "daylight"

    return-object p0

    .line 310
    :pswitch_2
    const-string p0, "fluorescent"

    return-object p0

    .line 308
    :pswitch_3
    const-string p0, "incandescent"

    return-object p0

    .line 306
    :pswitch_4
    const-string p0, "auto"

    return-object p0

    .line 304
    :pswitch_5
    return-object p0

    :sswitch_data_0
    .sparse-switch
        -0x4075183a -> :sswitch_5
        0x31 -> :sswitch_4
        0x32 -> :sswitch_3
        0x33 -> :sswitch_2
        0x35 -> :sswitch_1
        0x36 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static burstShotNumToName(I)Ljava/lang/String;
    .locals 0

    .line 246
    invoke-static {p0}, Lcom/android/camera/statistic/CameraStatUtil;->divideTo10Section(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static cameraIdToName(Z)Ljava/lang/String;
    .locals 0

    .line 220
    if-eqz p0, :cond_0

    const-string p0, "\u524d\u6444"

    goto :goto_0

    :cond_0
    const-string p0, "\u540e\u6444"

    :goto_0
    return-object p0
.end method

.method private static contrastToName(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 406
    const v0, 0x7f0e0015

    invoke-static {v0, p0}, Lcom/android/camera/statistic/CameraStatUtil;->pictureQualityToName(ILjava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static divideTo10Section(I)Ljava/lang/String;
    .locals 0

    .line 250
    if-nez p0, :cond_0

    .line 251
    const-string p0, "0"

    return-object p0

    .line 253
    :cond_0
    if-lez p0, :cond_1

    add-int/lit8 p0, p0, -0x1

    div-int/lit8 p0, p0, 0xa

    goto :goto_0

    :cond_1
    const/4 p0, 0x0

    .line 254
    :goto_0
    packed-switch p0, :pswitch_data_0

    .line 274
    const-string p0, "90+"

    return-object p0

    .line 272
    :pswitch_0
    const-string p0, "80+"

    return-object p0

    .line 270
    :pswitch_1
    const-string p0, "70+"

    return-object p0

    .line 268
    :pswitch_2
    const-string p0, "60+"

    return-object p0

    .line 266
    :pswitch_3
    const-string p0, "50+"

    return-object p0

    .line 264
    :pswitch_4
    const-string p0, "40+"

    return-object p0

    .line 262
    :pswitch_5
    const-string p0, "30+"

    return-object p0

    .line 260
    :pswitch_6
    const-string p0, "20+"

    return-object p0

    .line 258
    :pswitch_7
    const-string p0, "10+"

    return-object p0

    .line 256
    :pswitch_8
    const-string p0, "1+"

    return-object p0

    :pswitch_data_0
    .packed-switch 0x0
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

.method private static exposureTimeToName(Ljava/lang/String;)Ljava/lang/String;
    .locals 4

    .line 322
    if-eqz p0, :cond_2

    .line 324
    :try_start_0
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v0

    const-wide/16 v2, 0x3e8

    div-long/2addr v0, v2

    long-to-int v0, v0

    .line 325
    const v1, 0xf4240

    if-ge v0, v1, :cond_1

    .line 326
    sget-object v1, Lcom/android/camera/statistic/CameraStatUtil;->sExposureTimeLessThan1sToName:Landroid/util/SparseArray;

    invoke-virtual {v1, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 327
    if-eqz v0, :cond_0

    .line 328
    return-object v0

    .line 330
    :cond_0
    nop

    .line 336
    goto :goto_0

    .line 331
    :cond_1
    div-int/2addr v0, v1

    .line 332
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, "s"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 334
    :catch_0
    move-exception v0

    .line 335
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "invalid exposure time "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 339
    :cond_2
    :goto_0
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "unexpected exposure time "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 340
    const-string p0, "auto"

    return-object p0
.end method

.method public static faceBeautyRatioToName(I)Ljava/lang/String;
    .locals 0

    .line 239
    if-nez p0, :cond_0

    .line 240
    const-string p0, "0"

    return-object p0

    .line 242
    :cond_0
    invoke-static {p0}, Lcom/android/camera/statistic/CameraStatUtil;->divideTo10Section(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static filterIdToName(I)Ljava/lang/String;
    .locals 3

    .line 179
    sget v0, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_NONE:I

    if-ne v0, p0, :cond_0

    .line 180
    const-string p0, "none"

    return-object p0

    .line 183
    :cond_0
    invoke-static {p0}, Lcom/android/camera/effect/FilterInfo;->getCategory(I)I

    move-result v0

    .line 184
    packed-switch v0, :pswitch_data_0

    goto :goto_0

    .line 188
    :pswitch_0
    invoke-static {p0}, Lcom/android/camera/effect/FilterInfo;->getIndex(I)I

    move-result v0

    .line 189
    sget-object v1, Lcom/android/camera/statistic/CameraStatUtil;->sFilterTypeToName:Landroid/util/SparseArray;

    invoke-virtual {v1, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 190
    if-eqz v0, :cond_1

    .line 191
    return-object v0

    .line 197
    :cond_1
    :goto_0
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "unexpected filter id: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 198
    const-string p0, "none"

    return-object p0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method private static flashModeToName(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 493
    if-nez p0, :cond_0

    .line 494
    sget-object p0, Lcom/android/camera/statistic/CameraStatUtil;->TAG:Ljava/lang/String;

    const-string v0, "null flash mode"

    invoke-static {p0, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 495
    const-string p0, "others"

    return-object p0

    .line 497
    :cond_0
    const/4 v0, -0x1

    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result v1

    const v2, 0xbdf2

    if-eq v1, v2, :cond_2

    const v2, 0xbdf4

    if-eq v1, v2, :cond_1

    packed-switch v1, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    const-string v1, "3"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    const/4 v0, 0x0

    goto :goto_0

    :pswitch_1
    const-string v1, "2"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    const/4 v0, 0x4

    goto :goto_0

    :pswitch_2
    const-string v1, "1"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    const/4 v0, 0x1

    goto :goto_0

    :pswitch_3
    const-string v1, "0"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    const/4 v0, 0x5

    goto :goto_0

    :cond_1
    const-string v1, "103"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    const/4 v0, 0x2

    goto :goto_0

    :cond_2
    const-string v1, "101"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    const/4 v0, 0x3

    :cond_3
    :goto_0
    packed-switch v0, :pswitch_data_1

    .line 511
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "unexpected flash mode "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 512
    const-string p0, "others"

    return-object p0

    .line 509
    :pswitch_4
    const-string p0, "off"

    return-object p0

    .line 507
    :pswitch_5
    const-string p0, "torch"

    return-object p0

    .line 505
    :pswitch_6
    const-string p0, "screen-light-on"

    return-object p0

    .line 503
    :pswitch_7
    const-string p0, "screen-light-auto"

    return-object p0

    .line 501
    :pswitch_8
    const-string p0, "on"

    return-object p0

    .line 499
    :pswitch_9
    const-string p0, "auto"

    return-object p0

    :pswitch_data_0
    .packed-switch 0x30
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
    .end packed-switch
.end method

.method private static focusPositionToName(I)Ljava/lang/String;
    .locals 1

    .line 368
    const/16 v0, 0x3e8

    if-ne v0, p0, :cond_0

    .line 369
    const-string p0, "auto"

    return-object p0

    .line 371
    :cond_0
    sub-int/2addr v0, p0

    div-int/lit8 v0, v0, 0xa

    .line 372
    invoke-static {v0}, Lcom/android/camera/statistic/CameraStatUtil;->divideTo10Section(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static getDualZoomName(I)Ljava/lang/String;
    .locals 1

    .line 381
    packed-switch p0, :pswitch_data_0

    .line 388
    invoke-static {}, Lcom/android/camera/CameraSettings;->readZoom()F

    move-result p0

    .line 389
    invoke-static {p0}, Lcom/android/camera/statistic/CameraStatUtil;->zoomRatioToName(F)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 384
    :pswitch_0
    invoke-static {p0}, Lcom/android/camera/CameraSettings;->getCameraZoomMode(I)Ljava/lang/String;

    move-result-object p0

    .line 385
    const-string v0, "tele"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    .line 386
    const-string p0, "2x"

    goto :goto_0

    :cond_0
    const-string p0, "1x"

    .line 385
    :goto_0
    return-object p0

    :pswitch_data_0
    .packed-switch 0xa6
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method private static indexOfString([Ljava/lang/String;Ljava/lang/String;)I
    .locals 2

    .line 481
    if-eqz p0, :cond_1

    if-eqz p1, :cond_1

    .line 482
    const/4 v0, 0x0

    :goto_0
    array-length v1, p0

    if-ge v0, v1, :cond_1

    .line 483
    aget-object v1, p0, v0

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 484
    return v0

    .line 482
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 489
    :cond_1
    const/4 p0, -0x1

    return p0
.end method

.method private static isoToName(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 352
    if-eqz p0, :cond_1

    .line 353
    const-string v0, "auto"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 354
    const-string p0, "auto"

    return-object p0

    .line 356
    :cond_0
    sget-object v0, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {p0, v0}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    .line 357
    const-string v1, "ISO"

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    .line 358
    const/4 v1, -0x1

    if-le v0, v1, :cond_1

    .line 359
    const/4 v0, 0x3

    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 364
    :cond_1
    return-object p0
.end method

.method public static modeIdToName(I)Ljava/lang/String;
    .locals 1

    .line 202
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sCameraModeIdToName:Landroid/util/SparseArray;

    invoke-virtual {v0, p0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    .line 203
    if-nez p0, :cond_0

    .line 204
    const-string p0, "\u5f55\u50cf"

    .line 206
    :cond_0
    return-object p0
.end method

.method private static pictureQualityToName(ILjava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 465
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object p0

    .line 466
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sPictureQualityIndexToName:Landroid/util/SparseArray;

    invoke-virtual {v0}, Landroid/util/SparseArray;->size()I

    move-result v0

    array-length v1, p0

    if-lt v0, v1, :cond_1

    .line 470
    invoke-static {p0, p1}, Lcom/android/camera/statistic/CameraStatUtil;->indexOfString([Ljava/lang/String;Ljava/lang/String;)I

    move-result p1

    .line 471
    const/4 v0, -0x1

    if-le p1, v0, :cond_0

    .line 472
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sPictureQualityIndexToName:Landroid/util/SparseArray;

    invoke-virtual {v0}, Landroid/util/SparseArray;->size()I

    move-result v0

    array-length p0, p0

    sub-int/2addr v0, p0

    div-int/lit8 v0, v0, 0x2

    .line 473
    add-int/2addr p1, v0

    .line 474
    sget-object p0, Lcom/android/camera/statistic/CameraStatUtil;->sPictureQualityIndexToName:Landroid/util/SparseArray;

    invoke-virtual {p0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    return-object p0

    .line 477
    :cond_0
    const-string p0, "others"

    return-object p0

    .line 467
    :cond_1
    new-instance p0, Ljava/lang/RuntimeException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "picture quality array size is smaller than values size "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private static round(JI)J
    .locals 2

    .line 612
    if-gtz p2, :cond_0

    .line 613
    return-wide p0

    .line 615
    :cond_0
    div-int/lit8 v0, p2, 0x2

    int-to-long v0, v0

    add-long/2addr p0, v0

    int-to-long v0, p2

    div-long/2addr p0, v0

    mul-long/2addr p0, v0

    return-wide p0
.end method

.method private static saturationToName(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 410
    const v0, 0x7f0e0017

    invoke-static {v0, p0}, Lcom/android/camera/statistic/CameraStatUtil;->pictureQualityToName(ILjava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static sharpnessToName(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 414
    const v0, 0x7f0e0019

    invoke-static {v0, p0}, Lcom/android/camera/statistic/CameraStatUtil;->pictureQualityToName(ILjava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static slowMotionConfigToName(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 210
    const-string v0, "slow_motion_120"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 211
    const-string p0, "\u70b9\u51fb\u81f3120"

    return-object p0

    .line 212
    :cond_0
    const-string v0, "slow_motion_240"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_1

    .line 213
    const-string p0, "\u70b9\u51fb\u81f3240"

    return-object p0

    .line 215
    :cond_1
    const-string p0, "\u70b9\u51fb\u81f3960"

    return-object p0
.end method

.method private static slowMotionQualityIdToName(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 438
    if-nez p0, :cond_0

    .line 439
    const-string p0, "others"

    return-object p0

    .line 441
    :cond_0
    const/4 v0, -0x1

    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    const-string v1, "6"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :pswitch_1
    const-string v1, "5"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_1

    const/4 v0, 0x0

    :cond_1
    :goto_0
    packed-switch v0, :pswitch_data_1

    .line 447
    const-string p0, "others"

    return-object p0

    .line 445
    :pswitch_2
    const-string p0, "1080p"

    return-object p0

    .line 443
    :pswitch_3
    const-string p0, "720p"

    return-object p0

    nop

    :pswitch_data_0
    .packed-switch 0x35
        :pswitch_1
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
    .end packed-switch
.end method

.method private static timeLapseIntervalToName(I)Ljava/lang/String;
    .locals 5

    .line 579
    const/4 v0, 0x0

    const/4 v1, 0x1

    const/16 v2, 0x3e8

    if-ge p0, v2, :cond_0

    .line 580
    sget-object v2, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v3, "%.2fs"

    new-array v1, v1, [Ljava/lang/Object;

    int-to-float p0, p0

    const/high16 v4, 0x447a0000    # 1000.0f

    div-float/2addr p0, v4

    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p0

    aput-object p0, v1, v0

    invoke-static {v2, v3, v1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 582
    :cond_0
    sget-object v3, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v4, "%ds"

    new-array v1, v1, [Ljava/lang/Object;

    div-int/2addr p0, v2

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    aput-object p0, v1, v0

    invoke-static {v3, v4, v1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static varargs track(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V
    .locals 4

    .line 587
    array-length v0, p2

    rem-int/lit8 v0, v0, 0x2

    const/4 v1, 0x0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    move v0, v1

    :goto_0
    invoke-static {v0}, Lcom/android/camera/Util;->Assert(Z)V

    .line 588
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 589
    :goto_1
    array-length v2, p2

    if-ge v1, v2, :cond_1

    .line 590
    aget-object v2, p2, v1

    add-int/lit8 v3, v1, 0x1

    aget-object v3, p2, v3

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 589
    add-int/lit8 v1, v1, 0x2

    goto :goto_1

    .line 592
    :cond_1
    invoke-static {p0, p1, v0}, Lcom/android/camera/statistic/CameraStat;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 593
    return-void
.end method

.method public static trackAISceneChanged(IILandroid/content/res/Resources;)V
    .locals 2

    .line 1072
    invoke-static {}, Lcom/android/camera/statistic/CameraStat;->isCounterEventDisabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1073
    return-void

    .line 1075
    :cond_0
    const-string v0, "\u672a\u77e5"

    .line 1076
    const/high16 v1, 0x7f0e0000

    invoke-virtual {p2, v1}, Landroid/content/res/Resources;->obtainTypedArray(I)Landroid/content/res/TypedArray;

    move-result-object p2

    .line 1077
    if-ltz p1, :cond_1

    invoke-virtual {p2}, Landroid/content/res/TypedArray;->length()I

    move-result v1

    if-ge p1, v1, :cond_1

    .line 1078
    invoke-virtual {p2, p1}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 1080
    :cond_1
    invoke-virtual {p2}, Landroid/content/res/TypedArray;->recycle()V

    .line 1082
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 1083
    const-string p2, "\u6a21\u5f0f"

    invoke-static {p0}, Lcom/android/camera/statistic/CameraStatUtil;->modeIdToName(I)Ljava/lang/String;

    move-result-object p0

    invoke-interface {p1, p2, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1084
    const-string p0, "\u667a\u80fd\u573a\u666f\u53d1\u73b0"

    invoke-interface {p1, p0, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1085
    const-string p0, "counter"

    const-string p2, "ai_scene_changed"

    invoke-static {p0, p2, p1}, Lcom/android/camera/statistic/CameraStat;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 1086
    return-void
.end method

.method public static trackAwbChanged(Ljava/lang/String;)V
    .locals 2

    .line 1135
    invoke-static {}, Lcom/android/camera/statistic/CameraStat;->isCounterEventDisabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1136
    return-void

    .line 1138
    :cond_0
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 1139
    const-string v1, "\u767d\u5e73\u8861"

    invoke-static {p0}, Lcom/android/camera/statistic/CameraStatUtil;->autoWhiteBalanceToName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-interface {v0, v1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1140
    const-string p0, "counter"

    const-string v1, "manual_awb_changed"

    invoke-static {p0, v1, v0}, Lcom/android/camera/statistic/CameraStat;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 1142
    return-void
.end method

.method public static trackBeautyBodyCapture()V
    .locals 3

    .line 1538
    const-string v0, "capture"

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Lcom/android/camera/statistic/CameraStatUtil;->trackBeautyBodySlim(Ljava/lang/String;ILcom/android/camera/fragment/beauty/BeautyParameters$Type;)V

    .line 1539
    return-void
.end method

.method public static trackBeautyBodyCounter(Lcom/android/camera/fragment/beauty/BeautyParameters$Type;)V
    .locals 2

    .line 1549
    if-nez p0, :cond_0

    .line 1550
    return-void

    .line 1552
    :cond_0
    const-string v0, "counter"

    const/4 v1, 0x0

    invoke-static {v0, v1, p0}, Lcom/android/camera/statistic/CameraStatUtil;->trackBeautyBodySlim(Ljava/lang/String;ILcom/android/camera/fragment/beauty/BeautyParameters$Type;)V

    .line 1553
    return-void
.end method

.method public static trackBeautyBodyCounterPort(I)V
    .locals 2

    .line 1542
    if-gtz p0, :cond_0

    .line 1543
    return-void

    .line 1545
    :cond_0
    const-string v0, "counter"

    const/4 v1, 0x0

    invoke-static {v0, p0, v1}, Lcom/android/camera/statistic/CameraStatUtil;->trackBeautyBodySlim(Ljava/lang/String;ILcom/android/camera/fragment/beauty/BeautyParameters$Type;)V

    .line 1546
    return-void
.end method

.method private static trackBeautyBodySlim(Ljava/lang/String;ILcom/android/camera/fragment/beauty/BeautyParameters$Type;)V
    .locals 5

    .line 1469
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 1470
    nop

    .line 1471
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result v1

    const v2, 0x20efc746

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-eq v1, v2, :cond_1

    const v2, 0x391755fc

    if-eq v1, v2, :cond_0

    goto :goto_0

    :cond_0
    const-string v1, "counter"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    move v1, v3

    goto :goto_1

    :cond_1
    const-string v1, "capture"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    move v1, v4

    goto :goto_1

    :cond_2
    :goto_0
    const/4 v1, -0x1

    :goto_1
    const/4 v2, 0x0

    packed-switch v1, :pswitch_data_0

    goto/16 :goto_4

    .line 1495
    :pswitch_0
    const-string v1, "new_beauty"

    .line 1497
    nop

    .line 1498
    if-eq p1, v3, :cond_4

    const/4 v3, 0x5

    if-eq p1, v3, :cond_3

    goto :goto_2

    .line 1503
    :cond_3
    const-string v2, "\u7626\u8eab"

    .line 1504
    goto :goto_2

    .line 1500
    :cond_4
    const-string v2, "\u7f8e\u989c"

    .line 1501
    nop

    .line 1508
    :goto_2
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_5

    .line 1509
    const-string p1, "\u90e8\u4f4d"

    invoke-interface {v0, p1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1513
    :cond_5
    sget-object p1, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->HEAD_SLIM_RATIO:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    if-ne p1, p2, :cond_6

    .line 1514
    const-string v2, "\u5934\u90e8"

    goto :goto_3

    .line 1515
    :cond_6
    sget-object p1, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->SHOULDER_SLIM_RATIO:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    if-ne p1, p2, :cond_7

    .line 1516
    const-string v2, "\u80a9\u90e8"

    goto :goto_3

    .line 1517
    :cond_7
    sget-object p1, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->BODY_SLIM_RATIO:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    if-ne p1, p2, :cond_8

    .line 1518
    const-string v2, "\u7626\u8eab"

    goto :goto_3

    .line 1519
    :cond_8
    sget-object p1, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->LEG_SLIM_RATIO:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    if-ne p1, p2, :cond_9

    .line 1520
    const-string v2, "\u957f\u817f"

    goto :goto_3

    .line 1521
    :cond_9
    sget-object p1, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->BEAUTY_RESET:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    if-ne p1, p2, :cond_a

    .line 1522
    const-string v2, "\u91cd\u7f6e"

    .line 1524
    :cond_a
    :goto_3
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_b

    .line 1525
    const-string p1, "\u7626\u8eab"

    invoke-interface {v0, p1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1531
    :cond_b
    move-object v2, v1

    goto :goto_4

    .line 1473
    :pswitch_1
    const-string v2, "beauty_body_slim"

    .line 1474
    const-string p1, "pref_beauty_head_slim_ratio"

    .line 1475
    const-string p2, "pref_beauty_body_slim_ratio"

    .line 1476
    const-string v1, "pref_beauty_shoulder_slim_ratio"

    .line 1477
    const-string v3, "key_beauty_leg_slim_ratio"

    .line 1479
    invoke-static {p1, v4}, Lcom/android/camera/CameraSettings;->getFaceBeautyRatio(Ljava/lang/String;I)I

    move-result p1

    .line 1480
    invoke-static {p2, v4}, Lcom/android/camera/CameraSettings;->getFaceBeautyRatio(Ljava/lang/String;I)I

    move-result p2

    .line 1481
    invoke-static {v1, v4}, Lcom/android/camera/CameraSettings;->getFaceBeautyRatio(Ljava/lang/String;I)I

    move-result v1

    .line 1482
    invoke-static {v3, v4}, Lcom/android/camera/CameraSettings;->getFaceBeautyRatio(Ljava/lang/String;I)I

    move-result v3

    .line 1484
    const-string v4, "\u5934\u90e8"

    invoke-static {p1}, Lcom/android/camera/statistic/CameraStatUtil;->divideTo10Section(I)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, v4, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1486
    const-string p1, "\u80a9\u90e8"

    invoke-static {v1}, Lcom/android/camera/statistic/CameraStatUtil;->divideTo10Section(I)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1488
    const-string p1, "\u7626\u8eab"

    invoke-static {p2}, Lcom/android/camera/statistic/CameraStatUtil;->divideTo10Section(I)Ljava/lang/String;

    move-result-object p2

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1490
    const-string p1, "\u957f\u817f"

    invoke-static {v3}, Lcom/android/camera/statistic/CameraStatUtil;->divideTo10Section(I)Ljava/lang/String;

    move-result-object p2

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1492
    const-string p1, "\u6a21\u5f0f"

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object p2

    invoke-virtual {p2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentMode()I

    move-result p2

    invoke-static {p2}, Lcom/android/camera/statistic/CameraStatUtil;->modeIdToName(I)Ljava/lang/String;

    move-result-object p2

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1493
    nop

    .line 1531
    :goto_4
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_c

    .line 1532
    return-void

    .line 1534
    :cond_c
    invoke-static {p0, v2, v0}, Lcom/android/camera/statistic/CameraStat;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 1535
    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static trackBeautyInfo(ILjava/lang/String;Lcom/android/camera/fragment/beauty/BeautyValues;)V
    .locals 4

    .line 1214
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 1215
    const-string v1, "\u524d\u540e\u6444"

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1217
    invoke-static {}, Lcom/mi/config/b;->hR()Z

    move-result p1

    if-eqz p1, :cond_1

    .line 1218
    invoke-static {}, Lcom/android/camera/fragment/beauty/BeautyParameters;->getInstance()Lcom/android/camera/fragment/beauty/BeautyParameters;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/fragment/beauty/BeautyParameters;->getAdjustableTypes()Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    .line 1219
    sget-object v2, Lcom/android/camera/statistic/CameraStatUtil;->sBeautyTypeToName:Landroid/util/SparseArray;

    invoke-virtual {v1}, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->ordinal()I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 1220
    if-eqz v2, :cond_0

    .line 1221
    invoke-virtual {p2, v1}, Lcom/android/camera/fragment/beauty/BeautyValues;->get(Lcom/android/camera/fragment/beauty/BeautyParameters$Type;)I

    move-result v1

    invoke-static {v1}, Lcom/android/camera/statistic/CameraStatUtil;->faceBeautyRatioToName(I)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1223
    :cond_0
    goto :goto_0

    .line 1225
    :cond_1
    const-string p1, "\u7626\u8138"

    iget v1, p2, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautySlimFace:I

    .line 1226
    invoke-static {v1}, Lcom/android/camera/statistic/CameraStatUtil;->faceBeautyRatioToName(I)Ljava/lang/String;

    move-result-object v1

    .line 1225
    invoke-interface {v0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1227
    const-string p1, "\u5927\u773c"

    iget v1, p2, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyEnlargeEye:I

    .line 1228
    invoke-static {v1}, Lcom/android/camera/statistic/CameraStatUtil;->faceBeautyRatioToName(I)Ljava/lang/String;

    move-result-object v1

    .line 1227
    invoke-interface {v0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1229
    const-string p1, "\u7f8e\u767d"

    iget v1, p2, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautySkinColor:I

    .line 1230
    invoke-static {v1}, Lcom/android/camera/statistic/CameraStatUtil;->faceBeautyRatioToName(I)Ljava/lang/String;

    move-result-object v1

    .line 1229
    invoke-interface {v0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1231
    const-string p1, "\u5ae9\u80a4"

    iget v1, p2, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautySkinSmooth:I

    .line 1232
    invoke-static {v1}, Lcom/android/camera/statistic/CameraStatUtil;->faceBeautyRatioToName(I)Ljava/lang/String;

    move-result-object v1

    .line 1231
    invoke-interface {v0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1235
    :cond_2
    invoke-static {}, Lcom/mi/config/b;->hG()Z

    move-result p1

    if-eqz p1, :cond_4

    .line 1236
    const-string p1, "\u7b49\u7ea7"

    .line 1237
    invoke-static {}, Lcom/android/camera/CameraSettings;->isAdvancedBeautyOn()Z

    move-result v1

    if-eqz v1, :cond_3

    const-string p2, "advanced"

    goto :goto_1

    .line 1238
    :cond_3
    iget-object p2, p2, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyLevel:Ljava/lang/String;

    invoke-static {p2}, Lcom/android/camera/CameraSettings;->intelligentValueToBeautyLevel(Ljava/lang/String;)I

    move-result p2

    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p2

    .line 1236
    :goto_1
    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1239
    const-string p1, "capture"

    const-string p2, "picture_taken_beauty_legacy"

    int-to-long v1, p0

    invoke-static {p1, p2, v1, v2, v0}, Lcom/android/camera/statistic/CameraStat;->recordCalculateEvent(Ljava/lang/String;Ljava/lang/String;JLjava/util/Map;)V

    goto :goto_2

    .line 1242
    :cond_4
    iget-object p1, p2, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyLevel:Ljava/lang/String;

    invoke-static {p1}, Lcom/android/camera/CameraSettings;->intelligentValueToBeautyLevel(Ljava/lang/String;)I

    move-result p1

    .line 1243
    const-string p2, "\u7b49\u7ea7"

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1244
    const-string p1, "capture"

    const-string p2, "picture_taken_beauty"

    int-to-long v1, p0

    invoke-static {p1, p2, v1, v2, v0}, Lcom/android/camera/statistic/CameraStat;->recordCalculateEvent(Ljava/lang/String;Ljava/lang/String;JLjava/util/Map;)V

    .line 1247
    :goto_2
    return-void
.end method

.method public static trackBeautySwitchChanged(ILjava/lang/String;)V
    .locals 2

    .line 1013
    invoke-static {}, Lcom/android/camera/statistic/CameraStat;->isCounterEventDisabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1014
    return-void

    .line 1016
    :cond_0
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 1017
    const-string v1, "\u6a21\u5f0f"

    invoke-static {p0}, Lcom/android/camera/statistic/CameraStatUtil;->modeIdToName(I)Ljava/lang/String;

    move-result-object p0

    invoke-interface {v0, v1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1018
    const-string p0, "\u524d\u540e\u6444"

    .line 1019
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontCamera()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1020
    const-string v1, "\u524d\u6444"

    goto :goto_0

    :cond_1
    const-string v1, "\u540e\u6444"

    .line 1018
    :goto_0
    invoke-interface {v0, p0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1021
    invoke-static {p1}, Lcom/android/camera/CameraSettings;->intelligentValueToBeautyLevel(Ljava/lang/String;)I

    move-result p0

    .line 1022
    const-string p1, "\u7b49\u7ea7"

    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p0

    invoke-interface {v0, p1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1023
    const-string p0, "counter"

    const-string p1, "beauty_switch_changed"

    invoke-static {p0, p1, v0}, Lcom/android/camera/statistic/CameraStat;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 1025
    return-void
.end method

.method public static trackBokehTaken()V
    .locals 4

    .line 1646
    invoke-static {}, Lcom/android/camera/CameraSettings;->readFNumber()Ljava/lang/String;

    move-result-object v0

    .line 1647
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontCamera()Z

    move-result v1

    .line 1648
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 1649
    const-string v3, "\u865a\u5316\u7a0b\u5ea6"

    invoke-interface {v2, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1650
    const-string v0, "\u6a21\u5f0f"

    if-eqz v1, :cond_0

    const-string v1, "\u524d\u7f6e"

    goto :goto_0

    :cond_0
    const-string v1, "\u540e\u7f6e"

    :goto_0
    invoke-interface {v2, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1651
    const-string v0, "capture"

    const-string v1, "picture_taken_bokeh_adjust"

    invoke-static {v0, v1, v2}, Lcom/android/camera/statistic/CameraStat;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 1652
    return-void
.end method

.method public static trackBroadcastKillService()V
    .locals 3

    .line 557
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 558
    const-string v1, "\u524d\u540e\u6444"

    .line 559
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontCamera()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 560
    const-string v2, "\u524d\u6444"

    goto :goto_0

    :cond_0
    const-string v2, "\u540e\u6444"

    .line 558
    :goto_0
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 561
    const-string v1, "\u6a21\u5f0f"

    .line 562
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentMode()I

    move-result v2

    invoke-static {v2}, Lcom/android/camera/statistic/CameraStatUtil;->modeIdToName(I)Ljava/lang/String;

    move-result-object v2

    .line 561
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 563
    const-string v1, "counter"

    const-string v2, "camera_broadcast_kill_service"

    invoke-static {v1, v2, v0}, Lcom/android/camera/statistic/CameraStat;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 565
    return-void
.end method

.method public static trackCameraError(Ljava/lang/String;)V
    .locals 3

    .line 531
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 532
    const-string v1, "\u524d\u540e\u6444"

    .line 533
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontCamera()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 534
    const-string v2, "\u524d\u6444"

    goto :goto_0

    :cond_0
    const-string v2, "\u540e\u6444"

    .line 532
    :goto_0
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 535
    const-string v1, "\u6a21\u5f0f"

    .line 536
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentMode()I

    move-result v2

    invoke-static {v2}, Lcom/android/camera/statistic/CameraStatUtil;->modeIdToName(I)Ljava/lang/String;

    move-result-object v2

    .line 535
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 537
    const-string v1, "error"

    invoke-interface {v0, v1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 538
    const-string p0, "counter"

    const-string v1, "camera_hardware_error"

    invoke-static {p0, v1, v0}, Lcom/android/camera/statistic/CameraStat;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 540
    return-void
.end method

.method public static trackCameraErrorDialogShow()V
    .locals 3

    .line 546
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 547
    const-string v1, "\u524d\u540e\u6444"

    .line 548
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontCamera()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 549
    const-string v2, "\u524d\u6444"

    goto :goto_0

    :cond_0
    const-string v2, "\u540e\u6444"

    .line 547
    :goto_0
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 550
    const-string v1, "\u6a21\u5f0f"

    .line 551
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentMode()I

    move-result v2

    invoke-static {v2}, Lcom/android/camera/statistic/CameraStatUtil;->modeIdToName(I)Ljava/lang/String;

    move-result-object v2

    .line 550
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 552
    const-string v1, "counter"

    const-string v2, "camera_error_dialog_show"

    invoke-static {v1, v2, v0}, Lcom/android/camera/statistic/CameraStat;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 554
    return-void
.end method

.method public static trackConfigChange(Ljava/lang/String;Ljava/lang/String;ZZZ)V
    .locals 2

    .line 995
    invoke-static {}, Lcom/android/camera/statistic/CameraStat;->isCounterEventDisabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 996
    return-void

    .line 998
    :cond_0
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 999
    if-eqz p3, :cond_1

    .line 1000
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object p3

    invoke-virtual {p3}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentMode()I

    move-result p3

    .line 1001
    const-string v1, "\u6a21\u5f0f"

    invoke-static {p3}, Lcom/android/camera/statistic/CameraStatUtil;->modeIdToName(I)Ljava/lang/String;

    move-result-object p3

    invoke-interface {v0, v1, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1003
    :cond_1
    if-eqz p4, :cond_3

    .line 1004
    const-string p3, "\u524d\u540e\u6444"

    .line 1005
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontCamera()Z

    move-result p4

    if-eqz p4, :cond_2

    .line 1006
    const-string p4, "\u524d\u6444"

    goto :goto_0

    :cond_2
    const-string p4, "\u540e\u6444"

    .line 1004
    :goto_0
    invoke-interface {v0, p3, p4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1008
    :cond_3
    if-eqz p2, :cond_4

    const-string p2, "on"

    goto :goto_1

    :cond_4
    const-string p2, "off"

    :goto_1
    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1009
    const-string p1, "counter"

    invoke-static {p1, p0, v0}, Lcom/android/camera/statistic/CameraStat;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 1010
    return-void
.end method

.method public static trackDirectionChanged(I)V
    .locals 3

    .line 1112
    invoke-static {}, Lcom/android/camera/statistic/CameraStat;->isCounterEventDisabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1113
    return-void

    .line 1115
    :cond_0
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 1116
    const-string v1, "\u65b9\u5411"

    .line 1117
    const/4 v2, 0x3

    if-ne v2, p0, :cond_1

    .line 1118
    const-string p0, "\u4ece\u5de6\u5f80\u53f3"

    goto :goto_0

    :cond_1
    const-string p0, "\u4ece\u53f3\u5f80\u5de6"

    .line 1116
    :goto_0
    invoke-interface {v0, v1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1119
    const-string p0, "counter"

    const-string v1, "panorama_direction_changed"

    invoke-static {p0, v1, v0}, Lcom/android/camera/statistic/CameraStat;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 1121
    return-void
.end method

.method public static trackDualWaterMarkChanged(Z)V
    .locals 2

    .line 1028
    const-string v0, "settings"

    const-string v1, "pref_dualcamera_watermark"

    .line 1030
    if-eqz p0, :cond_0

    const-string p0, "on"

    goto :goto_0

    :cond_0
    const-string p0, "off"

    .line 1028
    :goto_0
    invoke-static {v0, v1, p0}, Lcom/android/camera/statistic/CameraStat;->recordStringPropertyEvent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1031
    return-void
.end method

.method public static trackDualZoomChanged(ILjava/lang/String;)V
    .locals 2

    .line 950
    invoke-static {}, Lcom/android/camera/statistic/CameraStat;->isCounterEventDisabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 951
    return-void

    .line 953
    :cond_0
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 954
    const-string v1, "\u6a21\u5f0f"

    invoke-static {p0}, Lcom/android/camera/statistic/CameraStatUtil;->modeIdToName(I)Ljava/lang/String;

    move-result-object p0

    invoke-interface {v0, v1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 955
    const-string p0, "\u53d8\u7126"

    invoke-interface {v0, p0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 956
    const-string p0, "counter"

    const-string p1, "dual_zoom_changed"

    invoke-static {p0, p1, v0}, Lcom/android/camera/statistic/CameraStat;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 958
    return-void
.end method

.method public static trackEvAdjusted()V
    .locals 3

    .line 926
    new-instance v0, Ljava/util/HashMap;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    .line 927
    const-string v1, "\u524d\u540e\u6444"

    .line 928
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontCamera()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 929
    const-string v2, "\u524d\u6444"

    goto :goto_0

    :cond_0
    const-string v2, "\u540e\u6444"

    .line 927
    :goto_0
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 930
    const-string v1, "\u6a21\u5f0f"

    .line 931
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentMode()I

    move-result v2

    invoke-static {v2}, Lcom/android/camera/statistic/CameraStatUtil;->modeIdToName(I)Ljava/lang/String;

    move-result-object v2

    .line 930
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 932
    const-string v1, "counter"

    const-string v2, "ev_adjusted"

    invoke-static {v1, v2, v0}, Lcom/android/camera/statistic/CameraStat;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 933
    return-void
.end method

.method public static trackExposureTimeChanged(Ljava/lang/String;)V
    .locals 2

    .line 1145
    invoke-static {}, Lcom/android/camera/statistic/CameraStat;->isCounterEventDisabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1146
    return-void

    .line 1148
    :cond_0
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 1149
    const-string v1, "\u5feb\u95e8"

    invoke-static {p0}, Lcom/android/camera/statistic/CameraStatUtil;->exposureTimeToName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-interface {v0, v1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1150
    const-string p0, "counter"

    const-string v1, "manual_exposure_time_changed"

    invoke-static {p0, v1, v0}, Lcom/android/camera/statistic/CameraStat;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 1152
    return-void
.end method

.method public static trackFilterChanged(IIZ)V
    .locals 2

    .line 961
    invoke-static {}, Lcom/android/camera/statistic/CameraStat;->isCounterEventDisabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 962
    return-void

    .line 964
    :cond_0
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 965
    const-string v1, "\u6a21\u5f0f"

    invoke-static {p0}, Lcom/android/camera/statistic/CameraStatUtil;->modeIdToName(I)Ljava/lang/String;

    move-result-object p0

    invoke-interface {v0, v1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 966
    const-string p0, "\u6ee4\u955c"

    invoke-static {p1}, Lcom/android/camera/statistic/CameraStatUtil;->filterIdToName(I)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 967
    const-string p0, "\u65b9\u5f0f"

    .line 968
    if-eqz p2, :cond_1

    const-string p1, "\u70b9\u51fb"

    goto :goto_0

    :cond_1
    const-string p1, "\u6ed1\u52a8"

    .line 967
    :goto_0
    invoke-interface {v0, p0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 969
    const-string p0, "counter"

    const-string p1, "filter_changed"

    invoke-static {p0, p1, v0}, Lcom/android/camera/statistic/CameraStat;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 970
    return-void
.end method

.method public static trackFlashChanged(ILjava/lang/String;)V
    .locals 2

    .line 973
    invoke-static {}, Lcom/android/camera/statistic/CameraStat;->isCounterEventDisabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 974
    return-void

    .line 976
    :cond_0
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 977
    const-string v1, "\u6a21\u5f0f"

    invoke-static {p0}, Lcom/android/camera/statistic/CameraStatUtil;->modeIdToName(I)Ljava/lang/String;

    move-result-object p0

    invoke-interface {v0, v1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 978
    const-string p0, "\u95ea\u5149\u706f"

    invoke-static {p1}, Lcom/android/camera/statistic/CameraStatUtil;->flashModeToName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 979
    const-string p0, "counter"

    const-string p1, "flash_changed"

    invoke-static {p0, p1, v0}, Lcom/android/camera/statistic/CameraStat;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 981
    return-void
.end method

.method public static trackFocusPositionChanged(I)V
    .locals 2

    .line 1101
    invoke-static {}, Lcom/android/camera/statistic/CameraStat;->isCounterEventDisabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1102
    return-void

    .line 1104
    :cond_0
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 1105
    const-string v1, "\u5bf9\u7126"

    .line 1106
    invoke-static {p0}, Lcom/android/camera/statistic/CameraStatUtil;->focusPositionToName(I)Ljava/lang/String;

    move-result-object p0

    .line 1105
    invoke-interface {v0, v1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1107
    const-string p0, "counter"

    const-string v1, "manual_focus_position_changed"

    invoke-static {p0, v1, v0}, Lcom/android/camera/statistic/CameraStat;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 1109
    return-void
.end method

.method public static trackGeneralInfo(IZIIZLcom/android/camera/MutexModeManager;Ljava/lang/String;)V
    .locals 5

    .line 662
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    .line 663
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v1

    .line 664
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 665
    nop

    .line 666
    const-string v3, "\u6a21\u5f0f"

    invoke-static {p2}, Lcom/android/camera/statistic/CameraStatUtil;->modeIdToName(I)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 667
    const-string v3, "\u5408\u5f71\u4f18\u9009"

    .line 668
    if-nez p1, :cond_0

    invoke-static {}, Lcom/android/camera/CameraSettings;->isGroupShotOn()Z

    move-result v4

    if-eqz v4, :cond_0

    const-string v4, "on"

    goto :goto_0

    :cond_0
    const-string v4, "off"

    .line 667
    :goto_0
    invoke-interface {v2, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 669
    const-string v3, "\u89e6\u53d1\u65b9\u5f0f"

    invoke-static {p3}, Lcom/android/camera/statistic/CameraStatUtil;->triggerModeToName(I)Ljava/lang/String;

    move-result-object p3

    invoke-interface {v2, v3, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 671
    const-string p3, "0"

    .line 672
    if-nez p1, :cond_1

    .line 673
    invoke-virtual {v0}, Lcom/android/camera/data/data/runing/DataItemRunning;->getComponentRunningTimer()Lcom/android/camera/data/data/runing/ComponentRunningTimer;

    move-result-object v3

    .line 674
    if-eqz v3, :cond_1

    .line 675
    invoke-virtual {v3, p2}, Lcom/android/camera/data/data/runing/ComponentRunningTimer;->getComponentValue(I)Ljava/lang/String;

    move-result-object p3

    .line 678
    :cond_1
    const-string v3, "\u5012\u8ba1\u65f6"

    invoke-interface {v2, v3, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 680
    const-string p3, "0"

    .line 681
    invoke-virtual {v1}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentFlash()Lcom/android/camera/data/data/config/ComponentConfigFlash;

    move-result-object v3

    .line 682
    if-eqz v3, :cond_2

    .line 683
    invoke-virtual {v3, p2}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->getComponentValue(I)Ljava/lang/String;

    move-result-object p3

    .line 684
    if-eqz p1, :cond_2

    const-string v3, "2"

    invoke-virtual {v3, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    .line 685
    const-string p3, "0"

    .line 688
    :cond_2
    if-eqz p6, :cond_3

    .line 689
    const-string p3, "\u95ea\u5149\u706f"

    invoke-interface {v2, p3, p6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 691
    :cond_3
    const-string p6, "\u95ea\u5149\u706f"

    invoke-static {p3}, Lcom/android/camera/statistic/CameraStatUtil;->flashModeToName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    invoke-interface {v2, p6, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 694
    :goto_1
    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object p3

    const/4 p6, 0x0

    invoke-virtual {p3, p6}, Lcom/android/camera/effect/EffectController;->getEffectForSaving(Z)I

    move-result p3

    .line 695
    const-string v3, "\u6ee4\u955c"

    .line 696
    if-eqz p1, :cond_4

    const-string p3, "none"

    goto :goto_2

    :cond_4
    invoke-static {p3}, Lcom/android/camera/statistic/CameraStatUtil;->filterIdToName(I)Ljava/lang/String;

    move-result-object p3

    .line 695
    :goto_2
    invoke-interface {v2, v3, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 698
    const-string p3, "\u52a8\u6001\u7167\u7247"

    .line 699
    invoke-static {}, Lcom/android/camera/CameraSettings;->isLiveShotOn()Z

    move-result v3

    if-eqz v3, :cond_5

    const-string v3, "on"

    goto :goto_3

    :cond_5
    const-string v3, "off"

    .line 698
    :goto_3
    invoke-interface {v2, p3, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 701
    const p3, 0x1ec7b00

    const v3, 0x2dc6c00

    if-eqz p4, :cond_c

    .line 702
    const-string p1, "\u5e74\u9f84\u68c0\u6d4b"

    .line 703
    invoke-static {}, Lcom/android/camera/CameraSettings;->showGenderAge()Z

    move-result p2

    if-eqz p2, :cond_6

    const-string p2, "on"

    goto :goto_4

    :cond_6
    const-string p2, "off"

    .line 702
    :goto_4
    invoke-interface {v2, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 704
    const-string p1, "\u9b54\u955c"

    .line 705
    invoke-static {}, Lcom/android/camera/CameraSettings;->isMagicMirrorOn()Z

    move-result p2

    if-eqz p2, :cond_7

    const-string p2, "on"

    goto :goto_5

    :cond_7
    const-string p2, "off"

    .line 704
    :goto_5
    invoke-interface {v2, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 707
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object p1

    invoke-virtual {p1}, Lcom/mi/config/a;->fQ()I

    move-result p1

    .line 708
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontMenuUltraPixelPhotographyOn()Z

    move-result p2

    .line 709
    if-ne p1, v3, :cond_9

    .line 710
    const-string p1, "4800\u4e07\u8d85\u6e05\u50cf\u7d20"

    .line 711
    if-eqz p2, :cond_8

    const-string p2, "on"

    goto :goto_6

    :cond_8
    const-string p2, "off"

    .line 710
    :goto_6
    invoke-interface {v2, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_8

    .line 712
    :cond_9
    if-ne p1, p3, :cond_b

    .line 713
    const-string p1, "3200\u4e07\u8d85\u6e05\u50cf\u7d20"

    .line 714
    if-eqz p2, :cond_a

    const-string p2, "on"

    goto :goto_7

    :cond_a
    const-string p2, "off"

    .line 713
    :goto_7
    invoke-interface {v2, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 716
    :cond_b
    :goto_8
    const-string p1, "capture"

    const-string p2, "front_camera_info"

    int-to-long p3, p0

    invoke-static {p1, p2, p3, p4, v2}, Lcom/android/camera/statistic/CameraStat;->recordCalculateEvent(Ljava/lang/String;Ljava/lang/String;JLjava/util/Map;)V

    .line 718
    goto/16 :goto_14

    .line 719
    :cond_c
    const-string p4, "\u79fb\u8f74"

    .line 720
    if-nez p1, :cond_d

    invoke-static {}, Lcom/android/camera/CameraSettings;->isTiltShiftOn()Z

    move-result v4

    if-eqz v4, :cond_d

    .line 722
    nop

    .line 721
    invoke-virtual {v0}, Lcom/android/camera/data/data/runing/DataItemRunning;->getComponentRunningTiltValue()Lcom/android/camera/data/data/runing/ComponentRunningTiltValue;

    move-result-object v0

    .line 722
    invoke-virtual {v0, p2}, Lcom/android/camera/data/data/runing/ComponentRunningTiltValue;->getComponentValue(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_9

    :cond_d
    const-string v0, "off"

    .line 719
    :goto_9
    invoke-interface {v2, p4, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 723
    const-string p4, "\u6c34\u5e73\u4eea"

    .line 724
    if-nez p1, :cond_e

    invoke-static {}, Lcom/android/camera/CameraSettings;->isGradienterOn()Z

    move-result v0

    if-eqz v0, :cond_e

    .line 725
    const-string v0, "on"

    goto :goto_a

    :cond_e
    const-string v0, "off"

    .line 723
    :goto_a
    invoke-interface {v2, p4, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 726
    const-string p4, "HHT"

    .line 727
    if-nez p1, :cond_f

    if-eqz p5, :cond_f

    invoke-virtual {p5}, Lcom/android/camera/MutexModeManager;->isHandNight()Z

    move-result v0

    if-eqz v0, :cond_f

    .line 728
    const-string v0, "on"

    goto :goto_b

    :cond_f
    const-string v0, "off"

    .line 726
    :goto_b
    invoke-interface {v2, p4, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 730
    const-string p4, "off"

    .line 731
    if-nez p1, :cond_12

    if-eqz p5, :cond_12

    .line 732
    invoke-virtual {p5}, Lcom/android/camera/MutexModeManager;->isHdr()Z

    move-result v0

    .line 733
    invoke-virtual {v1}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentHdr()Lcom/android/camera/data/data/config/ComponentConfigHdr;

    move-result-object v1

    .line 734
    if-eqz v1, :cond_11

    const-string v4, "auto"

    .line 735
    invoke-virtual {v1, p2}, Lcom/android/camera/data/data/config/ComponentConfigHdr;->getComponentValue(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_11

    .line 736
    if-eqz v0, :cond_10

    const-string p4, "auto-on"

    goto :goto_c

    :cond_10
    const-string p4, "auto-off"

    goto :goto_c

    .line 737
    :cond_11
    if-eqz v0, :cond_12

    .line 738
    const-string p4, "on"

    .line 741
    :cond_12
    :goto_c
    const-string v0, "HDR"

    invoke-interface {v2, v0, p4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 743
    const-string p4, "\u8d85\u5206\u8fa8\u7387"

    .line 744
    if-nez p1, :cond_13

    if-eqz p5, :cond_13

    invoke-virtual {p5}, Lcom/android/camera/MutexModeManager;->isSuperResolution()Z

    move-result p1

    if-eqz p1, :cond_13

    .line 745
    const-string p1, "on"

    goto :goto_d

    :cond_13
    const-string p1, "off"

    .line 743
    :goto_d
    invoke-interface {v2, p4, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 746
    const-string p1, "\u53d8\u7126"

    invoke-static {p2}, Lcom/android/camera/statistic/CameraStatUtil;->getDualZoomName(I)Ljava/lang/String;

    move-result-object p2

    invoke-interface {v2, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 748
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object p1

    invoke-virtual {p1}, Lcom/mi/config/a;->fP()I

    move-result p1

    .line 749
    invoke-static {}, Lcom/android/camera/CameraSettings;->isUltraPixelPhotographyOn()Z

    move-result p2

    if-nez p2, :cond_15

    .line 750
    invoke-static {}, Lcom/android/camera/CameraSettings;->isRearMenuUltraPixelPhotographyOn()Z

    move-result p2

    if-eqz p2, :cond_14

    goto :goto_e

    :cond_14
    goto :goto_f

    :cond_15
    :goto_e
    const/4 p6, 0x1

    .line 751
    :goto_f
    if-ne p1, v3, :cond_17

    .line 752
    const-string p1, "4800\u4e07\u8d85\u6e05\u50cf\u7d20"

    .line 753
    if-eqz p6, :cond_16

    const-string p2, "on"

    goto :goto_10

    :cond_16
    const-string p2, "off"

    .line 752
    :goto_10
    invoke-interface {v2, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_12

    .line 754
    :cond_17
    if-ne p1, p3, :cond_19

    .line 755
    const-string p1, "3200\u4e07\u8d85\u6e05\u50cf\u7d20"

    .line 756
    if-eqz p6, :cond_18

    const-string p2, "on"

    goto :goto_11

    :cond_18
    const-string p2, "off"

    .line 755
    :goto_11
    invoke-interface {v2, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 759
    :cond_19
    :goto_12
    const-string p1, "\u5168\u8eab\u6a21\u5f0f"

    .line 760
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object p2

    const-string p3, "pref_ultra_wide_bokeh_enabled"

    invoke-virtual {p2, p3}, Lcom/android/camera/data/data/runing/DataItemRunning;->isSwitchOn(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_1a

    .line 761
    const-string p2, "on"

    goto :goto_13

    :cond_1a
    const-string p2, "off"

    .line 759
    :goto_13
    invoke-interface {v2, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 763
    const-string p1, "capture"

    const-string p2, "back_camera_info"

    int-to-long p3, p0

    invoke-static {p1, p2, p3, p4, v2}, Lcom/android/camera/statistic/CameraStat;->recordCalculateEvent(Ljava/lang/String;Ljava/lang/String;JLjava/util/Map;)V

    .line 766
    :goto_14
    return-void
.end method

.method public static trackGotoGallery(I)V
    .locals 2

    .line 838
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 839
    const-string v1, "\u6a21\u5f0f"

    .line 840
    invoke-static {p0}, Lcom/android/camera/statistic/CameraStatUtil;->modeIdToName(I)Ljava/lang/String;

    move-result-object p0

    .line 839
    invoke-interface {v0, v1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 841
    const-string p0, "counter"

    const-string v1, "goto_gallery"

    invoke-static {p0, v1, v0}, Lcom/android/camera/statistic/CameraStat;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 842
    return-void
.end method

.method public static trackGotoSettings(I)V
    .locals 2

    .line 831
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 832
    const-string v1, "\u6a21\u5f0f"

    .line 833
    invoke-static {p0}, Lcom/android/camera/statistic/CameraStatUtil;->modeIdToName(I)Ljava/lang/String;

    move-result-object p0

    .line 832
    invoke-interface {v0, v1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 834
    const-string p0, "counter"

    const-string v1, "goto_settings"

    invoke-static {p0, v1, v0}, Lcom/android/camera/statistic/CameraStat;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 835
    return-void
.end method

.method public static trackHdrChanged(ILjava/lang/String;)V
    .locals 2

    .line 984
    invoke-static {}, Lcom/android/camera/statistic/CameraStat;->isCounterEventDisabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 985
    return-void

    .line 987
    :cond_0
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 988
    const-string v1, "\u6a21\u5f0f"

    invoke-static {p0}, Lcom/android/camera/statistic/CameraStatUtil;->modeIdToName(I)Ljava/lang/String;

    move-result-object p0

    invoke-interface {v0, v1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 989
    const-string p0, "HDR"

    invoke-interface {v0, p0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 990
    const-string p0, "counter"

    const-string p1, "hdr_changed"

    invoke-static {p0, p1, v0}, Lcom/android/camera/statistic/CameraStat;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 991
    return-void
.end method

.method public static trackIsoChanged(Ljava/lang/String;)V
    .locals 2

    .line 1155
    invoke-static {}, Lcom/android/camera/statistic/CameraStat;->isCounterEventDisabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1156
    return-void

    .line 1158
    :cond_0
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 1159
    const-string v1, "\u611f\u5149\u5ea6"

    invoke-static {p0}, Lcom/android/camera/statistic/CameraStatUtil;->isoToName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-interface {v0, v1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1160
    const-string p0, "counter"

    const-string v1, "manual_iso_changed"

    invoke-static {p0, v1, v0}, Lcom/android/camera/statistic/CameraStat;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 1162
    return-void
.end method

.method public static trackLensChanged(Ljava/lang/String;)V
    .locals 2

    .line 1165
    invoke-static {}, Lcom/android/camera/statistic/CameraStat;->isCounterEventDisabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1166
    return-void

    .line 1168
    :cond_0
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 1169
    const-string v1, "\u955c\u5934"

    invoke-interface {v0, v1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1170
    const-string p0, "counter"

    const-string v1, "manual_lens_changed"

    invoke-static {p0, v1, v0}, Lcom/android/camera/statistic/CameraStat;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 1172
    return-void
.end method

.method public static trackLightingChanged(ILjava/lang/String;)V
    .locals 2

    .line 1090
    invoke-static {}, Lcom/android/camera/statistic/CameraStat;->isCounterEventDisabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1091
    return-void

    .line 1094
    :cond_0
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 1095
    const-string v1, "\u6a21\u5f0f"

    invoke-static {p0}, Lcom/android/camera/statistic/CameraStatUtil;->modeIdToName(I)Ljava/lang/String;

    move-result-object p0

    invoke-interface {v0, v1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1096
    const-string p0, "\u5149\u6548"

    invoke-interface {v0, p0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1097
    const-string p0, "counter"

    const-string p1, "lighting_changed"

    invoke-static {p0, p1, v0}, Lcom/android/camera/statistic/CameraStat;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 1098
    return-void
.end method

.method public static trackLiveBeautyClick(I)V
    .locals 2

    .line 1438
    invoke-static {}, Lcom/android/camera/statistic/CameraStat;->isCounterEventDisabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1439
    return-void

    .line 1441
    :cond_0
    const/4 v0, 0x0

    .line 1442
    packed-switch p0, :pswitch_data_0

    goto :goto_0

    .line 1447
    :pswitch_0
    const-string v0, "\u7f8e\u989c"

    .line 1448
    goto :goto_0

    .line 1444
    :pswitch_1
    const-string v0, "\u6ee4\u955c"

    .line 1445
    nop

    .line 1452
    :goto_0
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_1

    .line 1453
    return-void

    .line 1455
    :cond_1
    new-instance p0, Ljava/util/HashMap;

    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    .line 1456
    const-string v1, "\u7f8e\u5316\u65b9\u5f0f"

    invoke-interface {p0, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1457
    const-string v0, "counter"

    const-string v1, "live_beauty"

    invoke-static {v0, v1, p0}, Lcom/android/camera/statistic/CameraStat;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 1458
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x6
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static trackLiveBeautyCounter(Lcom/android/camera/fragment/beauty/BeautyParameters$Type;)V
    .locals 3

    .line 1616
    if-nez p0, :cond_0

    .line 1617
    return-void

    .line 1619
    :cond_0
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 1621
    const/4 v1, 0x0

    .line 1622
    sget-object v2, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->LIVE_SHRINK_FACE_RATIO:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    if-ne v2, p0, :cond_1

    .line 1623
    const-string v1, "\u7626\u8138"

    goto :goto_0

    .line 1624
    :cond_1
    sget-object v2, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->LIVE_ENLARGE_EYE_RATIO:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    if-ne v2, p0, :cond_2

    .line 1625
    const-string v1, "\u5927\u773c"

    goto :goto_0

    .line 1626
    :cond_2
    sget-object v2, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->LIVE_SMOOTH_STRENGTH:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    if-ne v2, p0, :cond_3

    .line 1627
    const-string v1, "\u5ae9\u80a4"

    goto :goto_0

    .line 1628
    :cond_3
    sget-object v2, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->BEAUTY_RESET:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    if-ne v2, p0, :cond_4

    .line 1629
    const-string v1, "\u91cd\u7f6e"

    .line 1631
    :cond_4
    :goto_0
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_5

    .line 1632
    return-void

    .line 1635
    :cond_5
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontCamera()Z

    move-result p0

    if-eqz p0, :cond_6

    .line 1636
    const-string p0, "live_beauty_fron"

    .line 1637
    const-string v2, "live\u524d\u7f6e\u7f8e\u989c"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 1639
    :cond_6
    const-string p0, "live_beauty_back"

    .line 1640
    const-string v2, "live\u540e\u7f6e\u7f8e\u989c"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1642
    :goto_1
    const-string v1, "counter"

    invoke-static {v1, p0, v0}, Lcom/android/camera/statistic/CameraStat;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 1643
    return-void
.end method

.method public static trackLiveClick(Ljava/lang/String;)V
    .locals 1

    .line 1407
    invoke-static {}, Lcom/android/camera/statistic/CameraStat;->isCounterEventDisabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1408
    return-void

    .line 1410
    :cond_0
    const-string v0, "counter"

    invoke-static {v0, p0}, Lcom/android/camera/statistic/CameraStat;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    .line 1411
    return-void
.end method

.method public static trackLiveMusicClick()V
    .locals 2

    .line 1400
    invoke-static {}, Lcom/android/camera/statistic/CameraStat;->isCounterEventDisabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1401
    return-void

    .line 1403
    :cond_0
    const-string v0, "counter"

    const-string v1, "live\u97f3\u4e50"

    invoke-static {v0, v1}, Lcom/android/camera/statistic/CameraStat;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    .line 1404
    return-void
.end method

.method public static trackLiveRecordingParams(ZLjava/lang/String;ZLjava/lang/String;ZLjava/lang/String;Ljava/lang/String;ZIIIIZ)V
    .locals 7

    .line 1346
    invoke-static {}, Lcom/android/camera/statistic/CameraStat;->isCounterEventDisabled()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 1347
    return-void

    .line 1349
    :cond_0
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 1351
    if-eqz p12, :cond_1

    const-string v4, "(\u524d\u7f6e)"

    goto :goto_0

    :cond_1
    const-string v4, "(\u540e\u7f6e)"

    .line 1352
    :goto_0
    const-string v5, "live\u97f3\u4e502"

    if-eqz p0, :cond_2

    const-string v6, "on"

    goto :goto_1

    :cond_2
    const-string v6, "off"

    :goto_1
    invoke-interface {v3, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1353
    if-eqz p0, :cond_3

    .line 1354
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "live\u97f3\u4e50\u7c7b\u578b"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    move-object v5, p1

    invoke-interface {v3, v0, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1356
    :cond_3
    const-string v0, "\u6ee4\u955c2"

    if-eqz p2, :cond_4

    const-string v5, "on"

    goto :goto_2

    :cond_4
    const-string v5, "off"

    :goto_2
    invoke-interface {v3, v0, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1357
    if-eqz p2, :cond_5

    .line 1358
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\u6ee4\u955c\u7c7b\u578b"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    move-object v1, p3

    invoke-interface {v3, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1360
    :cond_5
    const-string v0, "\u9b54\u6cd5\u9053\u51772"

    if-eqz p4, :cond_6

    const-string v1, "on"

    goto :goto_3

    :cond_6
    const-string v1, "off"

    :goto_3
    invoke-interface {v3, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1361
    if-eqz p4, :cond_7

    .line 1362
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\u9b54\u6cd5\u9053\u5177\u7c7b\u578b"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    move-object v1, p5

    invoke-interface {v3, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1364
    :cond_7
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\u901f\u5ea6\u8c03\u8282\u7ec6\u8282"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    move-object v1, p6

    invoke-interface {v3, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1366
    const-string v0, "\u6296\u97f3\u7f8e\u989c2"

    if-eqz p7, :cond_8

    const-string v1, "on"

    goto :goto_4

    :cond_8
    const-string v1, "off"

    :goto_4
    invoke-interface {v3, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1367
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\u7626\u8138\u7b49\u7ea7"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p8}, Lcom/android/camera/statistic/CameraStatUtil;->divideTo10Section(I)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v3, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1368
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\u5927\u773c\u7b49\u7ea7"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static/range {p9 .. p9}, Lcom/android/camera/statistic/CameraStatUtil;->divideTo10Section(I)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v3, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1369
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\u7f8e\u767d\u7b49\u7ea7"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static/range {p10 .. p10}, Lcom/android/camera/statistic/CameraStatUtil;->divideTo10Section(I)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v3, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1371
    const-string v0, "\u524d\u540e\u6444"

    invoke-static/range {p12 .. p12}, Lcom/android/camera/statistic/CameraStatUtil;->cameraIdToName(Z)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v3, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1372
    const-string v0, "\u753b\u8d28"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move/from16 v2, p11

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/android/camera/statistic/CameraStatUtil;->videoQualityToName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v3, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1374
    const-string v0, "capture"

    const-string v1, "live_video"

    invoke-static {v0, v1, v3}, Lcom/android/camera/statistic/CameraStat;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 1376
    return-void
.end method

.method public static trackLiveStickerDownload(Ljava/lang/String;Z)V
    .locals 2

    .line 1414
    invoke-static {}, Lcom/android/camera/statistic/CameraStat;->isCounterEventDisabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1415
    return-void

    .line 1418
    :cond_0
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 1419
    const-string v1, "\u9b54\u6cd5\u9053\u5177\u7c7b\u578b"

    invoke-interface {v0, v1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1420
    const-string p0, "\u4e0b\u8f7d\u72b6\u6001"

    if-eqz p1, :cond_1

    .line 1421
    const-string p1, "\u6210\u529f"

    goto :goto_0

    .line 1422
    :cond_1
    const-string p1, "\u5931\u8d25"

    .line 1420
    :goto_0
    invoke-interface {v0, p0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1423
    return-void
.end method

.method public static trackLiveStickerMore(Z)V
    .locals 2

    .line 1426
    invoke-static {}, Lcom/android/camera/statistic/CameraStat;->isCounterEventDisabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1427
    return-void

    .line 1430
    :cond_0
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 1431
    const-string v1, "\u70b9\u51fb\u8df3\u8f6c"

    if-eqz p0, :cond_1

    .line 1432
    const-string p0, "\u5e94\u7528\u5546\u5e97"

    goto :goto_0

    .line 1433
    :cond_1
    const-string p0, "liveAPP"

    .line 1431
    :goto_0
    invoke-interface {v0, v1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1434
    const-string p0, "counter"

    const-string v1, "live_sticker_more"

    invoke-static {p0, v1, v0}, Lcom/android/camera/statistic/CameraStat;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 1435
    return-void
.end method

.method public static trackLiveVideoParams(IFZZZ)V
    .locals 2

    .line 1384
    invoke-static {}, Lcom/android/camera/statistic/CameraStat;->isCounterEventDisabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1385
    return-void

    .line 1387
    :cond_0
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 1389
    const-string v1, "\u6ee4\u955c1"

    if-eqz p2, :cond_1

    const-string p2, "on"

    goto :goto_0

    :cond_1
    const-string p2, "off"

    :goto_0
    invoke-interface {v0, v1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1390
    const-string p2, "\u9b54\u6cd5\u9053\u51771"

    if-eqz p3, :cond_2

    const-string p3, "on"

    goto :goto_1

    :cond_2
    const-string p3, "off"

    :goto_1
    invoke-interface {v0, p2, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1391
    const-string p2, "\u6296\u97f3\u7f8e\u989c1"

    if-eqz p4, :cond_3

    const-string p3, "on"

    goto :goto_2

    :cond_3
    const-string p3, "off"

    :goto_2
    invoke-interface {v0, p2, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1393
    const-string p2, "\u5f55\u5236\u6b21\u6570"

    invoke-static {p0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object p0

    invoke-interface {v0, p2, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1394
    const-string p0, "\u6296\u97f3\u89c6\u9891\u5f55\u5236\u65f6\u957f"

    float-to-int p1, p1

    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1396
    const-string p0, "capture"

    const-string p1, "live_video"

    invoke-static {p0, p1, v0}, Lcom/android/camera/statistic/CameraStat;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 1397
    return-void
.end method

.method public static trackMoonMode(ZZ)V
    .locals 3

    .line 1605
    if-nez p0, :cond_0

    .line 1606
    return-void

    .line 1609
    :cond_0
    new-instance p0, Ljava/util/HashMap;

    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    .line 1610
    const-string v0, "\u6a21\u5f0f\u9009\u62e9"

    if-eqz p1, :cond_1

    const-string p1, "\u6708\u4eae\u6a21\u5f0f"

    goto :goto_0

    :cond_1
    const-string p1, "\u591c\u666f\u6a21\u5f0f"

    :goto_0
    invoke-interface {p0, v0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1611
    const-string p1, "\u53d8\u7126"

    invoke-static {}, Lcom/android/camera/CameraSettings;->readZoom()F

    move-result v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    move-result-object v0

    invoke-interface {p0, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1612
    const-string p1, "capture"

    const-string v0, "moon_mode"

    const-wide/16 v1, 0x1

    invoke-static {p1, v0, v1, v2, p0}, Lcom/android/camera/statistic/CameraStat;->recordCalculateEvent(Ljava/lang/String;Ljava/lang/String;JLjava/util/Map;)V

    .line 1613
    return-void
.end method

.method public static trackNewSlowMotionVideoRecorded(Ljava/lang/String;IIIJ)V
    .locals 3

    .line 913
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 914
    const-string v1, "\u524d\u540e\u6444"

    const-string v2, "\u540e\u6444"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 915
    const-string v1, "\u6a21\u5f0f"

    invoke-interface {v0, v1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 916
    const-string p0, "\u753b\u8d28"

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/android/camera/statistic/CameraStatUtil;->slowMotionQualityIdToName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 917
    const-string p0, "\u95ea\u5149\u706f"

    .line 918
    const/4 p1, 0x2

    if-ne p2, p1, :cond_0

    .line 919
    const-string p1, "torch"

    goto :goto_0

    :cond_0
    const-string p1, "off"

    .line 917
    :goto_0
    invoke-interface {v0, p0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 920
    const-string p0, "\u5e27\u7387"

    invoke-static {p3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 921
    const-string p0, "\u65f6\u957f"

    invoke-static {p4, p5}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 922
    const-string p0, "capture"

    const-string p1, "video_taken"

    invoke-static {p0, p1, v0}, Lcom/android/camera/statistic/CameraStat;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 923
    return-void
.end method

.method public static trackPauseVideoRecording(Z)V
    .locals 2

    .line 852
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 853
    const-string v1, "\u524d\u540e\u6444"

    .line 854
    if-eqz p0, :cond_0

    const-string p0, "\u524d\u6444"

    goto :goto_0

    :cond_0
    const-string p0, "\u540e\u6444"

    .line 853
    :goto_0
    invoke-interface {v0, v1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 855
    const-string p0, "capture"

    const-string v1, "video_pause_recording"

    invoke-static {p0, v1, v0}, Lcom/android/camera/statistic/CameraStat;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 857
    return-void
.end method

.method public static trackPictureTaken(IZIZZLjava/lang/String;)V
    .locals 3

    .line 774
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 775
    nop

    .line 776
    const-string v1, "\u524d\u540e\u6444"

    .line 777
    if-eqz p3, :cond_0

    const-string v2, "\u524d\u6444"

    goto :goto_0

    :cond_0
    const-string v2, "\u540e\u6444"

    .line 776
    :goto_0
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 778
    nop

    .line 779
    const-string v1, "\u753b\u5e45"

    .line 780
    const/16 v2, 0xa5

    if-ne v2, p2, :cond_1

    const-string v2, "1x1"

    goto :goto_1

    :cond_1
    const-string v2, "4x3"

    invoke-static {v2}, Lcom/android/camera/CameraSettings;->getPictureSizeRatioString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 779
    :goto_1
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 781
    const-string v1, "\u753b\u8d28"

    invoke-static {p1}, Lcom/android/camera/CameraSettings;->getJpegQuality(Z)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 782
    const-string v1, "\u65f6\u95f4\u6c34\u5370"

    .line 783
    invoke-static {}, Lcom/android/camera/CameraSettings;->isTimeWaterMarkOpen()Z

    move-result v2

    if-eqz v2, :cond_2

    const-string v2, "on"

    goto :goto_2

    :cond_2
    const-string v2, "off"

    .line 782
    :goto_2
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 784
    const-string v1, "\u53cc\u6444\u6c34\u5370"

    .line 785
    invoke-static {}, Lcom/android/camera/CameraSettings;->isDualCameraWaterMarkOpen()Z

    move-result v2

    if-eqz v2, :cond_3

    const-string v2, "on"

    goto :goto_3

    :cond_3
    const-string v2, "off"

    .line 784
    :goto_3
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 786
    const-string v1, "\u5730\u7406\u4f4d\u7f6e"

    .line 787
    if-eqz p4, :cond_4

    const-string p4, "\u6709"

    goto :goto_4

    .line 788
    :cond_4
    invoke-static {}, Lcom/android/camera/CameraSettings;->isRecordLocation()Z

    move-result p4

    if-eqz p4, :cond_5

    .line 789
    const-string p4, "\u65e0"

    goto :goto_4

    :cond_5
    const-string p4, "\u5173"

    .line 786
    :goto_4
    invoke-interface {v0, v1, p4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 791
    if-eqz p5, :cond_6

    .line 792
    const-string p4, "\u667a\u80fd\u573a\u666f\u53d1\u73b0"

    invoke-interface {v0, p4, p5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 795
    :cond_6
    const/16 p4, 0xab

    if-ne p2, p4, :cond_7

    if-nez p3, :cond_7

    .line 796
    const-string p2, "\u5149\u6548"

    invoke-static {}, Lcom/android/camera/CameraSettings;->getPortraitLightingPattern()I

    move-result p4

    invoke-static {p4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p4

    invoke-interface {v0, p2, p4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 799
    :cond_7
    const-string p2, "\u52a8\u6001\u7167\u7247"

    .line 800
    invoke-static {}, Lcom/android/camera/CameraSettings;->isLiveShotOn()Z

    move-result p4

    if-eqz p4, :cond_8

    const-string p4, "on"

    goto :goto_5

    :cond_8
    const-string p4, "off"

    .line 799
    :goto_5
    invoke-interface {v0, p2, p4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 802
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object p2

    invoke-virtual {p2}, Lcom/mi/config/a;->fP()I

    move-result p2

    .line 803
    if-eqz p3, :cond_9

    .line 804
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontMenuUltraPixelPhotographyOn()Z

    move-result p3

    goto :goto_6

    .line 805
    :cond_9
    invoke-static {}, Lcom/android/camera/CameraSettings;->isRearMenuUltraPixelPhotographyOn()Z

    move-result p3

    .line 806
    :goto_6
    const p4, 0x2dc6c00

    if-ne p2, p4, :cond_b

    .line 807
    const-string p2, "4800\u4e07\u8d85\u6e05\u50cf\u7d20"

    .line 808
    if-eqz p3, :cond_a

    const-string p3, "on"

    goto :goto_7

    :cond_a
    const-string p3, "off"

    .line 807
    :goto_7
    invoke-interface {v0, p2, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_9

    .line 809
    :cond_b
    const p4, 0x1ec7b00

    if-ne p2, p4, :cond_d

    .line 810
    const-string p2, "3200\u4e07\u8d85\u6e05\u50cf\u7d20"

    .line 811
    if-eqz p3, :cond_c

    const-string p3, "on"

    goto :goto_8

    :cond_c
    const-string p3, "off"

    .line 810
    :goto_8
    invoke-interface {v0, p2, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 814
    :cond_d
    :goto_9
    const-string p2, "capture"

    const-string p3, "picture_taken"

    int-to-long p4, p0

    invoke-static {p2, p3, p4, p5, v0}, Lcom/android/camera/statistic/CameraStat;->recordCalculateEvent(Ljava/lang/String;Ljava/lang/String;JLjava/util/Map;)V

    .line 817
    if-eqz p1, :cond_f

    .line 818
    invoke-static {}, Lcom/android/camera/CameraSettings;->isPressDownCapture()Z

    move-result p1

    if-eqz p1, :cond_e

    const/4 p1, 0x1

    if-le p0, p1, :cond_e

    .line 819
    add-int/lit8 p0, p0, -0x1

    .line 821
    :cond_e
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 822
    const-string p2, "\u5f20\u6570"

    invoke-static {p0}, Lcom/android/camera/statistic/CameraStatUtil;->burstShotNumToName(I)Ljava/lang/String;

    move-result-object p3

    invoke-interface {p1, p2, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 823
    const-string p2, "capture"

    const-string p3, "picture_taken_burst"

    int-to-long p4, p0

    invoke-static {p2, p3, p4, p5, p1}, Lcom/android/camera/statistic/CameraStat;->recordCalculateEvent(Ljava/lang/String;Ljava/lang/String;JLjava/util/Map;)V

    .line 825
    const-string p0, "capture"

    const-string p2, "burst_shot_times"

    invoke-static {p0, p2, p1}, Lcom/android/camera/statistic/CameraStat;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 828
    :cond_f
    return-void
.end method

.method public static trackPictureTakenInManual(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V
    .locals 2

    .line 1188
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 1189
    const-string v1, "\u767d\u5e73\u8861"

    invoke-static {p1}, Lcom/android/camera/statistic/CameraStatUtil;->autoWhiteBalanceToName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1190
    const-string p1, "\u5bf9\u7126"

    .line 1191
    invoke-static {}, Lcom/android/camera/CameraSettings;->getFocusPosition()I

    move-result v1

    invoke-static {v1}, Lcom/android/camera/statistic/CameraStatUtil;->focusPositionToName(I)Ljava/lang/String;

    move-result-object v1

    .line 1190
    invoke-interface {v0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1192
    const-string p1, "\u5feb\u95e8"

    invoke-static {p2}, Lcom/android/camera/statistic/CameraStatUtil;->exposureTimeToName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1193
    const-string p1, "\u611f\u5149\u5ea6"

    invoke-static {p3}, Lcom/android/camera/statistic/CameraStatUtil;->isoToName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1194
    const-string p1, "\u955c\u5934"

    invoke-static {p4}, Lcom/android/camera/CameraSettings;->getCameraZoomMode(I)Ljava/lang/String;

    move-result-object p2

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1195
    const-string p1, "\u5cf0\u503c\u5bf9\u7126"

    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object p2

    invoke-virtual {p2}, Lcom/android/camera/effect/EffectController;->isNeedDrawPeaking()Z

    move-result p2

    if-eqz p2, :cond_0

    .line 1196
    const-string p2, "on"

    goto :goto_0

    :cond_0
    const-string p2, "off"

    .line 1195
    :goto_0
    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1197
    invoke-static {}, Lcom/android/camera/CameraSettings;->readZoom()F

    move-result p1

    .line 1198
    const-string p2, "\u53d8\u7126"

    invoke-static {p1}, Lcom/android/camera/statistic/CameraStatUtil;->zoomRatioToName(F)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1200
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object p1

    invoke-virtual {p1}, Lcom/mi/config/a;->fP()I

    move-result p1

    .line 1201
    invoke-static {}, Lcom/android/camera/CameraSettings;->isUltraPixelPhotographyOn()Z

    move-result p2

    .line 1202
    const p3, 0x2dc6c00

    if-ne p1, p3, :cond_2

    .line 1203
    const-string p1, "4800\u4e07\u8d85\u6e05\u50cf\u7d20"

    .line 1204
    if-eqz p2, :cond_1

    const-string p2, "on"

    goto :goto_1

    :cond_1
    const-string p2, "off"

    .line 1203
    :goto_1
    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_3

    .line 1205
    :cond_2
    const p3, 0x1ec7b00

    if-ne p1, p3, :cond_4

    .line 1206
    const-string p1, "3200\u4e07\u8d85\u6e05\u50cf\u7d20"

    .line 1207
    if-eqz p2, :cond_3

    const-string p2, "on"

    goto :goto_2

    :cond_3
    const-string p2, "off"

    .line 1206
    :goto_2
    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1209
    :cond_4
    :goto_3
    const-string p1, "capture"

    const-string p2, "picture_taken_manual"

    int-to-long p3, p0

    invoke-static {p1, p2, p3, p4, v0}, Lcom/android/camera/statistic/CameraStat;->recordCalculateEvent(Ljava/lang/String;Ljava/lang/String;JLjava/util/Map;)V

    .line 1211
    return-void
.end method

.method public static trackPictureTakenInPanorama(I)V
    .locals 5

    .line 1175
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 1176
    const-string v1, "\u65b9\u5411"

    .line 1177
    invoke-static {}, Lcom/android/camera/CameraSettings;->getPanoramaMoveDirection()I

    move-result v2

    const/4 v3, 0x3

    if-ne v3, v2, :cond_0

    .line 1178
    const-string v2, "\u4ece\u5de6\u5f80\u53f3"

    goto :goto_0

    :cond_0
    const-string v2, "\u4ece\u53f3\u5f80\u5de6"

    .line 1176
    :goto_0
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1179
    const-string v1, "capture"

    const-string v2, "picture_taken_panorama"

    int-to-long v3, p0

    invoke-static {v1, v2, v3, v4, v0}, Lcom/android/camera/statistic/CameraStat;->recordCalculateEvent(Ljava/lang/String;Ljava/lang/String;JLjava/util/Map;)V

    .line 1181
    return-void
.end method

.method public static trackPocketModeEnter(Ljava/lang/String;)V
    .locals 5

    .line 936
    const-string v0, "counter"

    const-string v1, "pocket_mode_enter"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/String;

    const-string v3, "\u65b9\u5f0f"

    const/4 v4, 0x0

    aput-object v3, v2, v4

    const/4 v3, 0x1

    aput-object p0, v2, v3

    invoke-static {v0, v1, v2}, Lcom/android/camera/statistic/CameraStatUtil;->track(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    .line 938
    return-void
.end method

.method public static trackPocketModeExit(Ljava/lang/String;)V
    .locals 5

    .line 941
    const-string v0, "counter"

    const-string v1, "pocket_mode_keyguard_exit"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/String;

    const-string v3, "\u65b9\u5f0f"

    const/4 v4, 0x0

    aput-object v3, v2, v4

    const/4 v3, 0x1

    aput-object p0, v2, v3

    invoke-static {v0, v1, v2}, Lcom/android/camera/statistic/CameraStatUtil;->track(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    .line 943
    return-void
.end method

.method public static trackPocketModeSensorDelay()V
    .locals 2

    .line 946
    const-string v0, "counter"

    const-string v1, "pocket_mode_sensor_delay"

    invoke-static {v0, v1}, Lcom/android/camera/statistic/CameraStat;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    .line 947
    return-void
.end method

.method public static trackPreferenceChange(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 3

    .line 1277
    if-nez p0, :cond_0

    .line 1278
    return-void

    .line 1281
    :cond_0
    instance-of v0, p1, Ljava/lang/Boolean;

    if-eqz v0, :cond_2

    .line 1282
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_1

    const-string p1, "on"

    goto :goto_0

    :cond_1
    const-string p1, "off"

    goto :goto_0

    .line 1284
    :cond_2
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .line 1287
    :goto_0
    const/4 v0, -0x1

    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result v1

    sparse-switch v1, :sswitch_data_0

    goto/16 :goto_1

    :sswitch_0
    const-string v1, "pref_camera_jpegquality_key"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    const/4 v0, 0x2

    goto/16 :goto_1

    :sswitch_1
    const-string v1, "pref_qc_camera_contrast_key"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    const/4 v0, 0x6

    goto/16 :goto_1

    :sswitch_2
    const-string v1, "pref_video_time_lapse_frame_interval_key"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    const/4 v0, 0x1

    goto/16 :goto_1

    :sswitch_3
    const-string v1, "pref_qc_camera_sharpness_key"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    const/16 v0, 0x8

    goto :goto_1

    :sswitch_4
    const-string v1, "pref_video_hfr_key"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    const/4 v0, 0x4

    goto :goto_1

    :sswitch_5
    const-string v1, "pref_camera_autoexposure_key"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    const/4 v0, 0x5

    goto :goto_1

    :sswitch_6
    const-string v1, "pref_camera_antibanding_key"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    const/16 v0, 0x9

    goto :goto_1

    :sswitch_7
    const-string v1, "pref_qc_camera_saturation_key"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    const/4 v0, 0x7

    goto :goto_1

    :sswitch_8
    const-string v1, "pref_video_new_slow_motion_key"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    const/16 v0, 0xa

    goto :goto_1

    :sswitch_9
    const-string v1, "pref_video_quality_key"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    const/4 v0, 0x0

    goto :goto_1

    :sswitch_a
    const-string v1, "pref_camera_picturesize_key"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    const/4 v0, 0x3

    goto :goto_1

    :sswitch_b
    const-string v1, "pref_camera_normal_wide_ldc_key"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    const/16 v0, 0xb

    goto :goto_1

    :sswitch_c
    const-string v1, "pref_camera_ultra_wide_ldc_key"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    const/16 v0, 0xc

    :cond_3
    :goto_1
    packed-switch v0, :pswitch_data_0

    goto :goto_2

    .line 1331
    :pswitch_0
    const-string p0, "ultra_wide_ldc"

    goto :goto_2

    .line 1328
    :pswitch_1
    const-string p0, "normal_wide_ldc"

    .line 1329
    goto :goto_2

    .line 1325
    :pswitch_2
    invoke-static {p1}, Lcom/android/camera/statistic/CameraStatUtil;->slowMotionQualityIdToName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 1326
    goto :goto_2

    .line 1322
    :pswitch_3
    invoke-static {p1}, Lcom/android/camera/statistic/CameraStatUtil;->antiBandingToName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 1323
    goto :goto_2

    .line 1319
    :pswitch_4
    invoke-static {p1}, Lcom/android/camera/statistic/CameraStatUtil;->sharpnessToName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 1320
    goto :goto_2

    .line 1316
    :pswitch_5
    invoke-static {p1}, Lcom/android/camera/statistic/CameraStatUtil;->saturationToName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 1317
    goto :goto_2

    .line 1313
    :pswitch_6
    invoke-static {p1}, Lcom/android/camera/statistic/CameraStatUtil;->contrastToName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 1314
    goto :goto_2

    .line 1310
    :pswitch_7
    invoke-static {p1}, Lcom/android/camera/statistic/CameraStatUtil;->autoExposureToName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 1311
    goto :goto_2

    .line 1307
    :pswitch_8
    invoke-static {p0}, Lcom/android/camera/statistic/CameraStatUtil;->addCameraSuffix(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 1308
    goto :goto_2

    .line 1304
    :pswitch_9
    invoke-static {p0}, Lcom/android/camera/statistic/CameraStatUtil;->addCameraSuffix(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 1305
    goto :goto_2

    .line 1301
    :pswitch_a
    invoke-static {p0}, Lcom/android/camera/statistic/CameraStatUtil;->addCameraSuffix(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 1302
    goto :goto_2

    .line 1294
    :pswitch_b
    :try_start_0
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    .line 1295
    invoke-static {v0}, Lcom/android/camera/statistic/CameraStatUtil;->timeLapseIntervalToName(I)Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1298
    nop

    .line 1334
    move-object p1, v0

    goto :goto_2

    .line 1296
    :catch_0
    move-exception v0

    .line 1297
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "invalid interval "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1299
    goto :goto_2

    .line 1289
    :pswitch_c
    invoke-static {p0}, Lcom/android/camera/statistic/CameraStatUtil;->addCameraSuffix(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 1290
    invoke-static {p1}, Lcom/android/camera/statistic/CameraStatUtil;->videoQualityToName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 1291
    nop

    .line 1334
    :goto_2
    const-string v0, "settings"

    invoke-static {v0, p0, p1}, Lcom/android/camera/statistic/CameraStat;->recordStringPropertyEvent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1335
    return-void

    nop

    :sswitch_data_0
    .sparse-switch
        -0x7fd41d70 -> :sswitch_c
        -0x7daaeb87 -> :sswitch_b
        -0x6f8f075f -> :sswitch_a
        -0x34c80dc1 -> :sswitch_9
        -0x25bfd22b -> :sswitch_8
        -0x1205ef05 -> :sswitch_7
        -0x2057773 -> :sswitch_6
        0x20b91a14 -> :sswitch_5
        0x339531f4 -> :sswitch_4
        0x37d1e4b8 -> :sswitch_3
        0x399aa61b -> :sswitch_2
        0x71b59e6b -> :sswitch_1
        0x7349fa39 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
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

.method public static trackSelectObject(Z)V
    .locals 2

    .line 860
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 861
    const-string v1, "\u9009\u53d6\u4e3b\u4f53\u7269"

    if-eqz p0, :cond_0

    const-string p0, "\u5f55\u50cf\u4e2d"

    goto :goto_0

    :cond_0
    const-string p0, "\u5f55\u50cf\u524d"

    :goto_0
    invoke-interface {v0, v1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 862
    const-string p0, "counter"

    const-string v1, "select_object"

    invoke-static {p0, v1, v0}, Lcom/android/camera/statistic/CameraStat;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 863
    return-void
.end method

.method public static trackSnapInfo(Z)V
    .locals 2

    .line 1271
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 1272
    const-string v1, "mode"

    if-eqz p0, :cond_0

    const-string p0, "video"

    goto :goto_0

    :cond_0
    const-string p0, "photo"

    :goto_0
    invoke-interface {v0, v1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1273
    const-string p0, "capture"

    const-string v1, "snap_camera"

    invoke-static {p0, v1, v0}, Lcom/android/camera/statistic/CameraStat;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 1274
    return-void
.end method

.method public static trackStartAppCost(J)V
    .locals 3

    .line 619
    const-wide/16 v0, 0x0

    cmp-long v0, p0, v0

    if-ltz v0, :cond_0

    const-wide/16 v0, 0x2710

    cmp-long v0, p0, v0

    if-gtz v0, :cond_0

    .line 620
    const-string v0, "capture"

    const-string v1, "start_app_cost"

    const/16 v2, 0x32

    .line 621
    invoke-static {p0, p1, v2}, Lcom/android/camera/statistic/CameraStatUtil;->round(JI)J

    move-result-wide p0

    .line 620
    invoke-static {v0, v1, p0, p1}, Lcom/android/camera/statistic/CameraStat;->recordCalculateEvent(Ljava/lang/String;Ljava/lang/String;J)V

    .line 625
    return-void

    .line 623
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "The time cost when start app is illegal: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static trackTakePictureCost(JZI)V
    .locals 2

    .line 603
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 604
    const-string v1, "\u524d\u540e\u6444"

    .line 605
    if-eqz p2, :cond_0

    const-string p2, "\u524d\u6444"

    goto :goto_0

    :cond_0
    const-string p2, "\u540e\u6444"

    .line 604
    :goto_0
    invoke-interface {v0, v1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 606
    const-string p2, "\u6a21\u5f0f"

    invoke-static {p3}, Lcom/android/camera/statistic/CameraStatUtil;->modeIdToName(I)Ljava/lang/String;

    move-result-object p3

    invoke-interface {v0, p2, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 607
    const-string p2, "capture"

    const-string p3, "take_picture_cost"

    const/16 v1, 0x32

    .line 608
    invoke-static {p0, p1, v1}, Lcom/android/camera/statistic/CameraStatUtil;->round(JI)J

    move-result-wide p0

    .line 607
    invoke-static {p2, p3, p0, p1, v0}, Lcom/android/camera/statistic/CameraStat;->recordCalculateEvent(Ljava/lang/String;Ljava/lang/String;JLjava/util/Map;)V

    .line 609
    return-void
.end method

.method public static trackTiltShiftChanged(Ljava/lang/String;)V
    .locals 3

    .line 1058
    invoke-static {}, Lcom/android/camera/statistic/CameraStat;->isCounterEventDisabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1059
    return-void

    .line 1061
    :cond_0
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 1062
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentMode()I

    move-result v1

    .line 1063
    const-string v2, "\u6a21\u5f0f"

    invoke-static {v1}, Lcom/android/camera/statistic/CameraStatUtil;->modeIdToName(I)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1064
    const-string v1, "\u79fb\u8f74"

    invoke-interface {v0, v1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1065
    const-string p0, "counter"

    const-string v1, "tiltshift_changed"

    invoke-static {p0, v1, v0}, Lcom/android/camera/statistic/CameraStat;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 1067
    return-void
.end method

.method public static trackTimerChanged(Ljava/lang/String;)V
    .locals 3

    .line 1044
    invoke-static {}, Lcom/android/camera/statistic/CameraStat;->isCounterEventDisabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1045
    return-void

    .line 1047
    :cond_0
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 1048
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentMode()I

    move-result v1

    .line 1049
    const-string v2, "\u6a21\u5f0f"

    invoke-static {v1}, Lcom/android/camera/statistic/CameraStatUtil;->modeIdToName(I)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1050
    const-string v1, "\u524d\u540e\u6444"

    .line 1051
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontCamera()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 1052
    const-string v2, "\u524d\u6444"

    goto :goto_0

    :cond_1
    const-string v2, "\u540e\u6444"

    .line 1050
    :goto_0
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1053
    const-string v1, "\u5012\u8ba1\u65f6"

    invoke-interface {v0, v1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1054
    const-string p0, "counter"

    const-string v1, "timer_changed"

    invoke-static {p0, v1, v0}, Lcom/android/camera/statistic/CameraStat;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 1055
    return-void
.end method

.method private static trackUltraWide(Ljava/lang/String;)V
    .locals 4

    .line 1561
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->fx()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_1

    .line 1564
    :cond_0
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 1565
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->getActiveModuleIndex()I

    move-result v1

    .line 1566
    invoke-static {v1}, Lcom/android/camera/CameraSettings;->isUltraWideConfigOpen(I)Z

    move-result v1

    .line 1567
    if-eqz v1, :cond_1

    .line 1568
    const-string v1, "\u8d85\u5e7f\u89d2"

    const-string v2, "on"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 1570
    :cond_1
    const-string v1, "\u8d85\u5e7f\u89d2"

    const-string v2, "off"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1572
    :goto_0
    const-string v1, "capture"

    const-wide/16 v2, 0x1

    invoke-static {v1, p0, v2, v3, v0}, Lcom/android/camera/statistic/CameraStat;->recordCalculateEvent(Ljava/lang/String;Ljava/lang/String;JLjava/util/Map;)V

    .line 1573
    return-void

    .line 1562
    :cond_2
    :goto_1
    return-void
.end method

.method public static trackUltraWideFunTaken()V
    .locals 1

    .line 1598
    const-string v0, "live_video"

    invoke-static {v0}, Lcom/android/camera/statistic/CameraStatUtil;->trackUltraWide(Ljava/lang/String;)V

    .line 1599
    return-void
.end method

.method public static trackUltraWideManualTaken(I)V
    .locals 4

    .line 1584
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->fx()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1585
    return-void

    .line 1587
    :cond_0
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 1588
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/data/data/config/DataItemConfig;->getManuallyDualLens()Lcom/android/camera/data/data/config/ComponentManuallyDualLens;

    move-result-object v1

    invoke-virtual {v1, p0}, Lcom/android/camera/data/data/config/ComponentManuallyDualLens;->getComponentValue(I)Ljava/lang/String;

    move-result-object p0

    .line 1589
    const-string v1, "ultra"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_1

    .line 1590
    const-string p0, "\u8d85\u5e7f\u89d2"

    const-string v1, "on"

    invoke-interface {v0, p0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 1592
    :cond_1
    const-string p0, "\u8d85\u5e7f\u89d2"

    const-string v1, "off"

    invoke-interface {v0, p0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1594
    :goto_0
    const-string p0, "capture"

    const-string v1, "picture_taken_manual"

    const-wide/16 v2, 0x1

    invoke-static {p0, v1, v2, v3, v0}, Lcom/android/camera/statistic/CameraStat;->recordCalculateEvent(Ljava/lang/String;Ljava/lang/String;JLjava/util/Map;)V

    .line 1595
    return-void
.end method

.method public static trackUltraWidePictureTaken()V
    .locals 1

    .line 1576
    const-string v0, "picture_taken"

    invoke-static {v0}, Lcom/android/camera/statistic/CameraStatUtil;->trackUltraWide(Ljava/lang/String;)V

    .line 1577
    return-void
.end method

.method public static trackUltraWideVideoTaken()V
    .locals 1

    .line 1580
    const-string v0, "video_taken"

    invoke-static {v0}, Lcom/android/camera/statistic/CameraStatUtil;->trackUltraWide(Ljava/lang/String;)V

    .line 1581
    return-void
.end method

.method public static trackVideoModeChanged(Ljava/lang/String;)V
    .locals 2

    .line 1034
    invoke-static {}, Lcom/android/camera/statistic/CameraStat;->isCounterEventDisabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1035
    return-void

    .line 1037
    :cond_0
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 1038
    const-string v1, "\u6a21\u5f0f"

    invoke-interface {v0, v1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1039
    const-string p0, "counter"

    const-string v1, "video_mode_changed"

    invoke-static {p0, v1, v0}, Lcom/android/camera/statistic/CameraStat;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 1041
    return-void
.end method

.method public static trackVideoRecorded(ZIZZLjava/lang/String;IIIILcom/android/camera/fragment/beauty/BeautyValues;J)V
    .locals 4

    .line 876
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 877
    const-string v1, "\u524d\u540e\u6444"

    .line 878
    if-eqz p0, :cond_0

    const-string v2, "\u524d\u6444"

    goto :goto_0

    :cond_0
    const-string v2, "\u540e\u6444"

    .line 877
    :goto_0
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 879
    const-string v1, "\u6a21\u5f0f"

    invoke-interface {v0, v1, p4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 880
    const-string v1, "\u753b\u8d28"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p5

    invoke-static {p5}, Lcom/android/camera/statistic/CameraStatUtil;->videoQualityToName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p5

    invoke-interface {v0, v1, p5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 881
    const-string p5, "\u95ea\u5149\u706f"

    .line 882
    const/4 v1, 0x2

    if-ne p6, v1, :cond_1

    .line 883
    const-string p6, "torch"

    goto :goto_1

    :cond_1
    const-string p6, "off"

    .line 881
    :goto_1
    invoke-interface {v0, p5, p6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 884
    const-string p5, "\u5e27\u7387"

    invoke-static {p7}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p6

    invoke-interface {v0, p5, p6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 885
    const/16 p5, 0xa2

    if-ne p1, p5, :cond_4

    if-nez p0, :cond_4

    .line 886
    if-eqz p2, :cond_3

    .line 887
    const-string p0, "\u8fd0\u52a8\u8ddf\u62cd"

    if-eqz p3, :cond_2

    const-string p1, "\u8d85\u5e7f\u89d2\u6a21\u5f0f\u4e0b\u8fd0\u52a8\u8ddf\u62cd"

    goto :goto_2

    :cond_2
    const-string p1, "\u975e\u8d85\u5e7f\u89d2\u6a21\u5f0f\u4e0b\u8fd0\u52a8\u8ddf\u62cd"

    :goto_2
    invoke-interface {v0, p0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_3

    .line 889
    :cond_3
    const-string p0, "\u8fd0\u52a8\u8ddf\u62cd"

    const-string p1, "off"

    invoke-interface {v0, p0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 892
    :cond_4
    :goto_3
    if-eqz p9, :cond_5

    .line 893
    const-string p0, "\u7b49\u7ea7"

    iget-object p1, p9, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyLevel:Ljava/lang/String;

    .line 894
    invoke-static {p1}, Lcom/android/camera/CameraSettings;->intelligentValueToBeautyLevel(Ljava/lang/String;)I

    move-result p1

    .line 893
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 896
    :cond_5
    const-string p0, "\u65f6\u957f"

    invoke-static {p10, p11}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 897
    const-string p0, "capture"

    const-string p1, "video_taken"

    invoke-static {p0, p1, v0}, Lcom/android/camera/statistic/CameraStat;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 899
    if-lez p8, :cond_6

    const-string p0, "fast"

    invoke-virtual {p0, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_6

    .line 900
    new-instance p0, Ljava/util/HashMap;

    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    .line 901
    const-string p1, "\u95f4\u9694"

    .line 902
    invoke-static {p8}, Lcom/android/camera/statistic/CameraStatUtil;->timeLapseIntervalToName(I)Ljava/lang/String;

    move-result-object p2

    .line 901
    invoke-interface {p0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 903
    const-string p1, "capture"

    const-string p2, "video_time_lapse_interval"

    invoke-static {p1, p2, p0}, Lcom/android/camera/statistic/CameraStat;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 906
    :cond_6
    return-void
.end method

.method public static trackVideoSnapshot(Z)V
    .locals 2

    .line 845
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 846
    const-string v1, "\u524d\u540e\u6444"

    .line 847
    if-eqz p0, :cond_0

    const-string p0, "\u524d\u6444"

    goto :goto_0

    :cond_0
    const-string p0, "\u540e\u6444"

    .line 846
    :goto_0
    invoke-interface {v0, v1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 848
    const-string p0, "capture"

    const-string v1, "video_snapshot"

    invoke-static {p0, v1, v0}, Lcom/android/camera/statistic/CameraStat;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 849
    return-void
.end method

.method public static trackVoiceControl(Landroid/content/Intent;)V
    .locals 3

    .line 1250
    if-nez p0, :cond_0

    .line 1251
    return-void

    .line 1254
    :cond_0
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 1255
    nop

    .line 1257
    const/4 v1, 0x0

    :try_start_0
    invoke-static {p0}, Lcom/android/camera/CameraIntentManager;->getInstance(Landroid/content/Intent;)Lcom/android/camera/CameraIntentManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/CameraIntentManager;->isUseFrontCamera()Z

    move-result v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1260
    goto :goto_0

    .line 1258
    :catch_0
    move-exception v2

    .line 1261
    move v2, v1

    :goto_0
    if-eqz v2, :cond_1

    const/4 v1, 0x1

    nop

    .line 1262
    :cond_1
    invoke-static {p0}, Lcom/android/camera/CameraIntentManager;->getInstance(Landroid/content/Intent;)Lcom/android/camera/CameraIntentManager;

    move-result-object p0

    invoke-virtual {p0}, Lcom/android/camera/CameraIntentManager;->getCameraModeId()I

    move-result p0

    .line 1263
    const-string v2, "\u524d\u540e\u6444"

    if-nez v1, :cond_2

    .line 1264
    const-string v1, "\u540e\u6444"

    goto :goto_1

    :cond_2
    const-string v1, "\u524d\u6444"

    .line 1263
    :goto_1
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1265
    const-string v1, "\u6a21\u5f0f"

    invoke-static {p0}, Lcom/android/camera/statistic/CameraStatUtil;->modeIdToName(I)Ljava/lang/String;

    move-result-object p0

    invoke-interface {v0, v1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1266
    const-string p0, "counter"

    const-string v1, "voice_assist_call_event"

    invoke-static {p0, v1, v0}, Lcom/android/camera/statistic/CameraStat;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 1268
    return-void
.end method

.method public static trackZoomAdjusted(Ljava/lang/String;)V
    .locals 3

    .line 568
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 569
    const-string v1, "\u524d\u540e\u6444"

    .line 570
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontCamera()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 571
    const-string v2, "\u524d\u6444"

    goto :goto_0

    :cond_0
    const-string v2, "\u540e\u6444"

    .line 569
    :goto_0
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 572
    const-string v1, "\u6a21\u5f0f"

    .line 573
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentMode()I

    move-result v2

    invoke-static {v2}, Lcom/android/camera/statistic/CameraStatUtil;->modeIdToName(I)Ljava/lang/String;

    move-result-object v2

    .line 572
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 574
    const-string v1, "mode"

    invoke-interface {v0, v1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 575
    const-string p0, "counter"

    const-string v1, "zoom_adjusted"

    invoke-static {p0, v1, v0}, Lcom/android/camera/statistic/CameraStat;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 576
    return-void
.end method

.method private static triggerModeToName(I)Ljava/lang/String;
    .locals 1

    .line 377
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sTriggerModeIdToName:Landroid/util/SparseArray;

    invoke-virtual {v0, p0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    return-object p0
.end method

.method private static videoQualityToName(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 224
    const/16 v0, 0x8

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 225
    const-string p0, "4k"

    return-object p0

    .line 226
    :cond_0
    const/4 v0, 0x6

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 227
    const-string p0, "1080p"

    return-object p0

    .line 228
    :cond_1
    const/4 v0, 0x5

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 229
    const-string p0, "720p"

    return-object p0

    .line 230
    :cond_2
    const/4 v0, 0x4

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 231
    const-string p0, "480p"

    return-object p0

    .line 233
    :cond_3
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "unexpected video quality: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 234
    const-string p0, "others"

    return-object p0
.end method

.method private static zoomRatioToName(F)Ljava/lang/String;
    .locals 5

    .line 394
    const/high16 v0, 0x3f800000    # 1.0f

    cmpl-float v0, v0, p0

    if-nez v0, :cond_0

    .line 395
    const-string p0, "1x"

    return-object p0

    .line 396
    :cond_0
    const/high16 v0, 0x40000000    # 2.0f

    cmpl-float v0, v0, p0

    if-nez v0, :cond_1

    .line 397
    const-string p0, "2x"

    return-object p0

    .line 400
    :cond_1
    const/high16 v0, 0x41200000    # 10.0f

    mul-float/2addr p0, v0

    float-to-int p0, p0

    .line 401
    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v2, "%.1fx"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    int-to-float p0, p0

    div-float/2addr p0, v0

    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p0

    aput-object p0, v3, v4

    invoke-static {v1, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
