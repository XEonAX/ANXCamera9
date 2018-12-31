.class public Lcom/android/camera/constant/ModeConstant;
.super Ljava/lang/Object;
.source "ModeConstant.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/constant/ModeConstant$ConstantMode;
    }
.end annotation


# static fields
.field public static final MODE_CAPTURE:I = 0xa3

.field public static final MODE_FAST_MOTION:I = 0xa9

.field public static final MODE_FUN:I = 0xa1

.field public static final MODE_LIVE:I = 0xae

.field public static final MODE_MANUAL:I = 0xa7

.field public static final MODE_NEW_SLOW_MOTION:I = 0xac

.field public static final MODE_PANORAMA:I = 0xa6

.field public static final MODE_PORTRAIT:I = 0xab

.field public static final MODE_RECORD_VIDEO:I = 0xa2

.field public static final MODE_SLOW_MOTION:I = 0xa8

.field public static final MODE_SQUARE:I = 0xa5

.field public static final MODE_SUPER_NIGHT:I = 0xad

.field public static final MODE_UNSPECIFIED:I = 0xa0

.field public static final MODE_VIDEO_HFR:I = 0xaa

.field static sModeList:[I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 52
    const/16 v0, 0xe

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/android/camera/constant/ModeConstant;->sModeList:[I

    return-void

    :array_0
    .array-data 4
        0xa1
        0xac
        0xa2
        0xa3
        0xae
        0xad
        0xa5
        0xa6
        0xa6
        0xa7
        0xa8
        0xaa
        0xa9
        0xab
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getAllModes()[I
    .locals 1

    .line 58
    sget-object v0, Lcom/android/camera/constant/ModeConstant;->sModeList:[I

    return-object v0
.end method
