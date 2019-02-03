.class public Lcom/android/camera/effect/renders/DualWatermarkParam;
.super Ljava/lang/Object;
.source "DualWatermarkParam.java"


# instance fields
.field private mIsDualWatermarkEnable:Z

.field private mPaddingX:F

.field private mPaddingY:F

.field private mPath:Ljava/lang/String;

.field private mSize:F


# direct methods
.method public constructor <init>(ZLjava/lang/String;FFF)V
    .locals 0

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    iput-boolean p1, p0, Lcom/android/camera/effect/renders/DualWatermarkParam;->mIsDualWatermarkEnable:Z

    .line 13
    iput-object p2, p0, Lcom/android/camera/effect/renders/DualWatermarkParam;->mPath:Ljava/lang/String;

    .line 14
    iput p3, p0, Lcom/android/camera/effect/renders/DualWatermarkParam;->mSize:F

    .line 15
    iput p4, p0, Lcom/android/camera/effect/renders/DualWatermarkParam;->mPaddingX:F

    .line 16
    iput p5, p0, Lcom/android/camera/effect/renders/DualWatermarkParam;->mPaddingY:F

    .line 17
    return-void
.end method


# virtual methods
.method public getPaddingX()F
    .locals 1

    .line 32
    iget v0, p0, Lcom/android/camera/effect/renders/DualWatermarkParam;->mPaddingX:F

    return v0
.end method

.method public getPaddingY()F
    .locals 1

    .line 36
    iget v0, p0, Lcom/android/camera/effect/renders/DualWatermarkParam;->mPaddingY:F

    return v0
.end method

.method public getPath()Ljava/lang/String;
    .locals 1

    .line 24
    iget-object v0, p0, Lcom/android/camera/effect/renders/DualWatermarkParam;->mPath:Ljava/lang/String;

    return-object v0
.end method

.method public getSize()F
    .locals 1

    .line 28
    iget v0, p0, Lcom/android/camera/effect/renders/DualWatermarkParam;->mSize:F

    return v0
.end method

.method public isDualWatermarkEnable()Z
    .locals 1

    .line 20
    iget-boolean v0, p0, Lcom/android/camera/effect/renders/DualWatermarkParam;->mIsDualWatermarkEnable:Z

    return v0
.end method
