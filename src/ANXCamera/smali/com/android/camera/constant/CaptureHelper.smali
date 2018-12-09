.class public Lcom/android/camera/constant/CaptureHelper;
.super Ljava/lang/Object;
.source "CaptureHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/constant/CaptureHelper$ApplyType;,
        Lcom/android/camera/constant/CaptureHelper$PictureState;
    }
.end annotation


# static fields
.field public static final APPLY_BURST:I = 0x4

.field public static final APPLY_CAPTURE:I = 0x3

.field public static final APPLY_PREVIEW:I = 0x1

.field public static final APPLY_PRE_CAPTURE:I = 0x6

.field public static final STATE_FOCUSING:I = 0x1

.field public static final STATE_PICTURE_TAKEN:I = 0x6

.field public static final STATE_PREVIEW:I = 0x0

.field public static final STATE_WAITING_AE_LOCK:I = 0x3

.field public static final STATE_WAITING_AF_LOCK:I = 0x2

.field public static final STATE_WAITING_FLASH_CLOSE:I = 0x7

.field public static final STATE_WAITING_FLASH_FIRED:I = 0x8

.field public static final STATE_WAITING_PRECAPTURE:I = 0x4


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
