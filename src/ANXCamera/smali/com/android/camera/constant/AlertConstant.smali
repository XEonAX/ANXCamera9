.class public Lcom/android/camera/constant/AlertConstant;
.super Ljava/lang/Object;
.source "AlertConstant.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/constant/AlertConstant$AlertCLearType;,
        Lcom/android/camera/constant/AlertConstant$AlertImageType;,
        Lcom/android/camera/constant/AlertConstant$ValueChangeType;,
        Lcom/android/camera/constant/AlertConstant$RecordState;
    }
.end annotation


# static fields
.field public static final ALERT_CLEAR:I = 0x1

.field public static final ALERT_IMAGE_TYPE_FLASH_ON:I = 0x1

.field public static final ALERT_IMAGE_TYPE_FLASH_TORCH:I = 0x2

.field public static final ALERT_IMAGE_TYPE_HDR_LIVE:I = 0x4

.field public static final ALERT_IMAGE_TYPE_HDR_ON:I = 0x3

.field public static final ALERT_IMAGE_TYPE_NULL:I = -0x1

.field public static final ALERT_NOT_CLEAR:I = 0x2

.field public static final RECORD_STATE_GONE:I = 0x2

.field public static final RECORD_STATE_HIDE:I = 0x5

.field public static final RECORD_STATE_PAUSE:I = 0x3

.field public static final RECORD_STATE_RESUME:I = 0x4

.field public static final RECORD_STATE_UNKNOWN:I = 0x0

.field public static final RECORD_STATE_VISIBLE:I = 0x1

.field public static final VALUE_CHANGE_ALL:I = 0x4

.field public static final VALUE_CHANGE_EV:I = 0x1

.field public static final VALUE_CHANGE_STEREO:I = 0x3

.field public static final VALUE_CHANGE_ZOOM:I = 0x2


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
