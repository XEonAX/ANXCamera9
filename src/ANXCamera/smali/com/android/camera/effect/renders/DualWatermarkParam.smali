.class public Lcom/android/camera/effect/renders/DualWatermarkParam;
.super Ljava/lang/Object;
.source "DualWatermarkParam.java"


# instance fields
.field private mPaddingX:F

.field private mPaddingY:F

.field private mPath:Ljava/lang/String;

.field private mSize:F


# direct methods
.method public constructor <init>(Ljava/lang/String;FFF)V
    .locals 0

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    iput-object p1, p0, Lcom/android/camera/effect/renders/DualWatermarkParam;->mPath:Ljava/lang/String;

    .line 13
    iput p2, p0, Lcom/android/camera/effect/renders/DualWatermarkParam;->mSize:F

    .line 14
    iput p3, p0, Lcom/android/camera/effect/renders/DualWatermarkParam;->mPaddingX:F

    .line 15
    iput p4, p0, Lcom/android/camera/effect/renders/DualWatermarkParam;->mPaddingY:F

    .line 16
    return-void
.end method


# virtual methods
.method public getPaddingX()F
    .locals 1

    .line 27
    iget v0, p0, Lcom/android/camera/effect/renders/DualWatermarkParam;->mPaddingX:F

    return v0
.end method

.method public getPaddingY()F
    .locals 1

    .line 31
    iget v0, p0, Lcom/android/camera/effect/renders/DualWatermarkParam;->mPaddingY:F

    return v0
.end method

.method public getPath()Ljava/lang/String;
    .locals 1

    .line 19
    iget-object v0, p0, Lcom/android/camera/effect/renders/DualWatermarkParam;->mPath:Ljava/lang/String;

    return-object v0
.end method

.method public getSize()F
    .locals 1

    .line 23
    iget v0, p0, Lcom/android/camera/effect/renders/DualWatermarkParam;->mSize:F

    return v0
.end method
