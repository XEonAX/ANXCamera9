.class public Lcom/android/camera/constant/AutoExposure;
.super Ljava/lang/Object;
.source "AutoExposure.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/constant/AutoExposure$MeteringMode;,
        Lcom/android/camera/constant/AutoExposure$AntiBandingMode;,
        Lcom/android/camera/constant/AutoExposure$FlashMode;
    }
.end annotation


# static fields
.field public static final FLASH_MODE_AUTO:I = 0x3

.field public static final FLASH_MODE_OFF:I = 0x0

.field public static final FLASH_MODE_ON:I = 0x1

.field public static final FLASH_MODE_RED_EYE:I = 0x4

.field public static final FLASH_MODE_SCREEN_LIGHT_AUTO:I = 0x67

.field public static final FLASH_MODE_SCREEN_LIGHT_ON:I = 0x65

.field public static final FLASH_MODE_TORCH:I = 0x2

.field public static final METERING_MODE_CENTER_WEIGHTED:I = 0x1

.field public static final METERING_MODE_FRAME_AVERAGE:I = 0x0

.field public static final METERING_MODE_SPOT_METERING:I = 0x2


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
