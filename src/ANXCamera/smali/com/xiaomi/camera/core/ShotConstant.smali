.class public Lcom/xiaomi/camera/core/ShotConstant;
.super Ljava/lang/Object;
.source "ShotConstant.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/xiaomi/camera/core/ShotConstant$DispatchType;,
        Lcom/xiaomi/camera/core/ShotConstant$ResultImage;,
        Lcom/xiaomi/camera/core/ShotConstant$ParallelAlgo;,
        Lcom/xiaomi/camera/core/ShotConstant$ShotType;
    }
.end annotation


# static fields
.field public static final ALGO_CLEAR_SHOT:I = 0x2

.field public static final ALGO_HDR:I = 0x1

.field public static final DISPATCH_ALL:I = 0x3

.field public static final DISPATCH_MAIN:I = 0x1

.field public static final DISPATCH_SUB:I = 0x2

.field public static final RESULT_IMAGE_DEPTH:I = 0x3

.field public static final RESULT_IMAGE_NORMAL:I = 0x1

.field public static final RESULT_IMAGE_RAW:I = 0x2

.field public static final TYPE_BURST:I = 0x3

.field public static final TYPE_INTENT_NORMAL_SINGLE:I = -0x2

.field public static final TYPE_LIVE_SHOT:I = 0x1

.field public static final TYPE_NORMAL_DUAL:I = 0x2

.field public static final TYPE_NORMAL_SINGLE:I = 0x0

.field public static final TYPE_PARALLEL_DUAL:I = 0x6

.field public static final TYPE_PARALLEL_SEQUENCE:I = 0x7

.field public static final TYPE_PARALLEL_SINGLE:I = 0x5

.field public static final TYPE_PREVIEW_SHOT:I = -0x1

.field public static final TYPE_VIDEO_SHOT:I = 0x4


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static final isParallelEnabled(I)Z
    .locals 1

    .line 47
    const/4 v0, 0x5

    if-eq p0, v0, :cond_1

    const/4 v0, 0x6

    if-eq p0, v0, :cond_1

    const/4 v0, 0x7

    if-ne p0, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p0, 0x1

    :goto_1
    return p0
.end method
