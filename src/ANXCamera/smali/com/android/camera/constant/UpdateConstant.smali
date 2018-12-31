.class public Lcom/android/camera/constant/UpdateConstant;
.super Ljava/lang/Object;
.source "UpdateConstant.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/constant/UpdateConstant$UpdateType;
    }
.end annotation


# static fields
.field public static final AI_SCENE_CONFIG:[I
    .annotation build Lcom/android/camera/constant/UpdateConstant$UpdateType;
    .end annotation
.end field

.field public static final CAMERA_TYPES_INIT:[I
    .annotation build Lcom/android/camera/constant/UpdateConstant$UpdateType;
    .end annotation
.end field

.field public static final CAMERA_TYPES_MANUALLY:[I
    .annotation build Lcom/android/camera/constant/UpdateConstant$UpdateType;
    .end annotation
.end field

.field public static final CAMERA_TYPES_ON_PREVIEW_SUCCESS:[I
    .annotation build Lcom/android/camera/constant/UpdateConstant$UpdateType;
    .end annotation
.end field

.field public static final FUN_TYPES_INIT:[I
    .annotation build Lcom/android/camera/constant/UpdateConstant$UpdateType;
    .end annotation
.end field

.field public static final FUN_TYPES_ON_PREVIEW_SUCCESS:[I
    .annotation build Lcom/android/camera/constant/UpdateConstant$UpdateType;
    .end annotation
.end field

.field public static final PANORAMA_ON_PREVIEW_SUCCESS:[I
    .annotation build Lcom/android/camera/constant/UpdateConstant$UpdateType;
    .end annotation
.end field

.field public static final PANORAMA_TYPES_INIT:[I
    .annotation build Lcom/android/camera/constant/UpdateConstant$UpdateType;
    .end annotation
.end field

.field public static final TYPE_AI_SCENE:I = 0x24

.field public static final TYPE_ANTI_BANDING:I = 0x9

.field public static final TYPE_AREA_FOCUS_AND_METERING:I = 0x3

.field public static final TYPE_BEAUTY:I = 0xd

.field public static final TYPE_BOKEH:I = 0x25

.field public static final TYPE_CHANGED_OPERATEMODE:I = 0x29

.field public static final TYPE_CONTRAST:I = 0x1a

.field public static final TYPE_DEVICE_ORIENTATION:I = 0x23

.field public static final TYPE_EIS:I = 0x1f

.field public static final TYPE_EXPOSURE_COMPENSATION:I = 0xc

.field public static final TYPE_EXPOSURE_TIME:I = 0x10

.field public static final TYPE_EYE_LIGHT:I = 0x2d

.field public static final TYPE_FACE_AGE_ANALYZE:I = 0x26

.field public static final TYPE_FACE_DETECTION:I = 0x5

.field public static final TYPE_FACE_SCORE:I = 0x27

.field public static final TYPE_FILTER:I = 0x2

.field public static final TYPE_FLASH_MODE:I = 0xa

.field public static final TYPE_FOCUS_CENTER:I = 0x19

.field public static final TYPE_FOCUS_MODE:I = 0xe

.field public static final TYPE_FPS_RANGE:I = 0x13

.field public static final TYPE_FRONT_MIRROR:I = 0x28

.field public static final TYPE_F_NUMBER:I = 0x30

.field public static final TYPE_GENDER_AGE:I = 0x11

.field public static final TYPE_HDR:I = 0xb

.field public static final TYPE_ISO:I = 0xf

.field public static final TYPE_JPEG_QUALITY:I = 0x7

.field public static final TYPE_JPEG_THUMBNAIL_SIZE:I = 0x8

.field public static final TYPE_LIVE_SHOT:I = 0x31

.field public static final TYPE_METERING_MODE:I = 0x1d

.field public static final TYPE_MFNR:I = 0x22

.field public static final TYPE_MUTE:I = 0x15

.field public static final TYPE_NORMAL_WIDE_LDC:I = 0x2e

.field public static final TYPE_OIS:I = 0x14

.field public static final TYPE_PORTRAIT_LIGHTING:I = 0x2b

.field public static final TYPE_QR:I = 0x17

.field public static final TYPE_SATURATION:I = 0x1b

.field public static final TYPE_SCENE:I = 0x4

.field public static final TYPE_SHARPNESS:I = 0x1c

.field public static final TYPE_SHOT_DETERMINE:I = 0x2c

.field public static final TYPE_SIZE_PICTURE_AND_PREVIEW:I = 0x1

.field public static final TYPE_SIZE_SNAPSHOT:I = 0x21

.field public static final TYPE_SUPER_RESOLUTION:I = 0x1e

.field public static final TYPE_SW_MFNR:I = 0x2a

.field public static final TYPE_ULTRA_WIDE_LDC:I = 0x2f

.field public static final TYPE_UPDATE_PANORAMA_SETUP:I = 0x20

.field public static final TYPE_WHITE_BALANCE:I = 0x6

.field public static final TYPE_ZOOM:I = 0x18

.field public static final TYPE_ZSL:I = 0x16

.field public static final VIDEO_TYPES_INIT:[I
    .annotation build Lcom/android/camera/constant/UpdateConstant$UpdateType;
    .end annotation
.end field

.field public static final VIDEO_TYPES_ON_PREVIEW_SUCCESS:[I
    .annotation build Lcom/android/camera/constant/UpdateConstant$UpdateType;
    .end annotation
.end field

.field public static final VIDEO_TYPES_RECORD:[I
    .annotation build Lcom/android/camera/constant/UpdateConstant$UpdateType;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 270
    const/16 v0, 0xa

    new-array v1, v0, [I

    fill-array-data v1, :array_0

    sput-object v1, Lcom/android/camera/constant/UpdateConstant;->CAMERA_TYPES_INIT:[I

    .line 287
    const/16 v1, 0x17

    new-array v1, v1, [I

    fill-array-data v1, :array_1

    sput-object v1, Lcom/android/camera/constant/UpdateConstant;->CAMERA_TYPES_ON_PREVIEW_SUCCESS:[I

    .line 314
    const/4 v1, 0x3

    new-array v1, v1, [I

    fill-array-data v1, :array_2

    sput-object v1, Lcom/android/camera/constant/UpdateConstant;->CAMERA_TYPES_MANUALLY:[I

    .line 324
    const/4 v1, 0x6

    new-array v2, v1, [I

    fill-array-data v2, :array_3

    sput-object v2, Lcom/android/camera/constant/UpdateConstant;->VIDEO_TYPES_INIT:[I

    .line 337
    new-array v1, v1, [I

    fill-array-data v1, :array_4

    sput-object v1, Lcom/android/camera/constant/UpdateConstant;->VIDEO_TYPES_ON_PREVIEW_SUCCESS:[I

    .line 350
    const/4 v1, 0x5

    new-array v1, v1, [I

    fill-array-data v1, :array_5

    sput-object v1, Lcom/android/camera/constant/UpdateConstant;->VIDEO_TYPES_RECORD:[I

    .line 362
    const/4 v1, 0x7

    new-array v2, v1, [I

    fill-array-data v2, :array_6

    sput-object v2, Lcom/android/camera/constant/UpdateConstant;->FUN_TYPES_INIT:[I

    .line 376
    new-array v1, v1, [I

    fill-array-data v1, :array_7

    sput-object v1, Lcom/android/camera/constant/UpdateConstant;->FUN_TYPES_ON_PREVIEW_SUCCESS:[I

    .line 390
    const/4 v1, 0x1

    new-array v2, v1, [I

    const/4 v3, 0x0

    aput v1, v2, v3

    sput-object v2, Lcom/android/camera/constant/UpdateConstant;->PANORAMA_TYPES_INIT:[I

    .line 398
    new-array v1, v1, [I

    const/16 v2, 0x20

    aput v2, v1, v3

    sput-object v1, Lcom/android/camera/constant/UpdateConstant;->PANORAMA_ON_PREVIEW_SUCCESS:[I

    .line 403
    new-array v0, v0, [I

    fill-array-data v0, :array_8

    sput-object v0, Lcom/android/camera/constant/UpdateConstant;->AI_SCENE_CONFIG:[I

    return-void

    :array_0
    .array-data 4
        0x2c
        0x1
        0x2
        0x1a
        0x1b
        0x1c
        0x1d
        0x2e
        0x2f
        0x1d
    .end array-data

    :array_1
    .array-data 4
        0x7
        0x8
        0xa
        0xb
        0xe
        0x13
        0x4
        0xd
        0x2d
        0x5
        0x9
        0x14
        0x15
        0x16
        0x22
        0x17
        0x19
        0x24
        0x25
        0x2a
        0x2b
        0x30
        0x31
    .end array-data

    :array_2
    .array-data 4
        0x6
        0x10
        0xf
    .end array-data

    :array_3
    .array-data 4
        0x1
        0x1d
        0xd
        0x23
        0x13
        0x2f
    .end array-data

    :array_4
    .array-data 4
        0x1f
        0x5
        0x9
        0xa
        0xe
        0x19
    .end array-data

    :array_5
    .array-data 4
        0x13
        0x1f
        0x28
        0x23
        0x21
    .end array-data

    :array_6
    .array-data 4
        0x1
        0x2
        0x1d
        0x23
        0xd
        0x13
        0x2f
    .end array-data

    :array_7
    .array-data 4
        0x5
        0x9
        0xa
        0xe
        0x19
        0x1f
        0x13
    .end array-data

    :array_8
    .array-data 4
        0xd
        0xb
        0x1c
        0x22
        0x1b
        0x14
        0x1a
        0x1e
        0x10
        0x2a
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
