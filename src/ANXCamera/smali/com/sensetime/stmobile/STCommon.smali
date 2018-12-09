.class public Lcom/sensetime/stmobile/STCommon;
.super Ljava/lang/Object;
.source "STCommon.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sensetime/stmobile/STCommon$ResultCode;
    }
.end annotation


# static fields
.field public static final ST_MOBILE_ENABLE_FACE_DETECT:I = 0x40

.field public static final ST_MOBILE_ENABLE_HAND_DETECT:I = 0x80

.field public static final ST_MOBILE_ENABLE_SEGMENT_DETECT:I = 0x100

.field public static final ST_MOBILE_TRACKING_ENABLE_DEBOUNCE:I = 0x10

.field public static final ST_MOBILE_TRACKING_ENABLE_FACE_ACTION:I = 0x20

.field public static final ST_MOBILE_TRACKING_MULTI_THREAD:I = 0x0

.field public static final ST_MOBILE_TRACKING_SINGLE_THREAD:I = 0x10000

.field public static final ST_PIX_FMT_BGR888:I = 0x5

.field public static final ST_PIX_FMT_BGRA8888:I = 0x4

.field public static final ST_PIX_FMT_GRAY8:I = 0x0

.field public static final ST_PIX_FMT_NV12:I = 0x2

.field public static final ST_PIX_FMT_NV21:I = 0x3

.field public static final ST_PIX_FMT_RGBA8888:I = 0x6

.field public static final ST_PIX_FMT_YUV420P:I = 0x1


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
