.class public Lcom/android/camera/ui/drawable/snap/CameraSnapPaintRound;
.super Lcom/android/camera/ui/drawable/CameraPaintBase;
.source "CameraSnapPaintRound.java"


# static fields
.field private static final RECORDING_ROUND_WIDTH:F = 0.265f


# instance fields
.field public isRecordingCircle:Z

.field private mCurrentRoundRectRadius:F

.field private mRectF:Landroid/graphics/RectF;

.field private mRoundingProgress:F


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 24
    invoke-direct {p0, p1}, Lcom/android/camera/ui/drawable/CameraPaintBase;-><init>(Landroid/content/Context;)V

    .line 16
    const/high16 p1, 0x3f800000    # 1.0f

    iput p1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintRound;->mRoundingProgress:F

    .line 25
    return-void
.end method


# virtual methods
.method protected draw(Landroid/graphics/Canvas;)V
    .locals 6

    .line 58
    iget-boolean v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintRound;->isRecording:Z

    if-nez v0, :cond_0

    .line 59
    iget v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintRound;->mMiddleX:F

    iget v1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintRound;->mMiddleY:F

    iget v2, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintRound;->mBaseRadius:F

    iget v3, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintRound;->mCurrentWidthPercent:F

    mul-float/2addr v2, v3

    iget-object v3, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintRound;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    goto :goto_0

    .line 61
    :cond_0
    iget-boolean v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintRound;->isRecordingCircle:Z

    if-eqz v0, :cond_1

    .line 62
    iget v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintRound;->mMiddleX:F

    iget v1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintRound;->mMiddleY:F

    iget v2, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintRound;->mBaseRadius:F

    const v3, 0x3f0ccccd    # 0.55f

    mul-float/2addr v2, v3

    iget-object v3, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintRound;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    goto :goto_0

    .line 64
    :cond_1
    iget v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintRound;->mBaseRadius:F

    iget v1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintRound;->mCurrentRoundRectRadius:F

    mul-float/2addr v0, v1

    .line 65
    iget v1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintRound;->mMiddleX:F

    sub-float/2addr v1, v0

    .line 66
    iget v2, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintRound;->mMiddleX:F

    add-float/2addr v2, v0

    .line 67
    iget v3, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintRound;->mMiddleY:F

    sub-float/2addr v3, v0

    .line 68
    iget v4, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintRound;->mMiddleY:F

    add-float/2addr v4, v0

    .line 69
    iget-object v5, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintRound;->mRectF:Landroid/graphics/RectF;

    invoke-virtual {v5, v1, v3, v2, v4}, Landroid/graphics/RectF;->set(FFFF)V

    .line 70
    iget-object v1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintRound;->mRectF:Landroid/graphics/RectF;

    iget v2, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintRound;->mRoundingProgress:F

    mul-float/2addr v2, v0

    iget v3, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintRound;->mRoundingProgress:F

    mul-float/2addr v0, v3

    iget-object v3, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintRound;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v1, v2, v0, v3}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 74
    :goto_0
    return-void
.end method

.method protected initPaint(Landroid/content/Context;)V
    .locals 1

    .line 51
    iget-object p1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintRound;->mPaint:Landroid/graphics/Paint;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 52
    iget-object p1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintRound;->mPaint:Landroid/graphics/Paint;

    sget-object v0, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 53
    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    iput-object p1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintRound;->mRectF:Landroid/graphics/RectF;

    .line 54
    return-void
.end method

.method public prepareRecord()V
    .locals 1

    .line 34
    iget v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintRound;->mCurrentWidthPercent:F

    iput v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintRound;->mCurrentRoundRectRadius:F

    .line 35
    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintRound;->mRoundingProgress:F

    .line 36
    return-void
.end method

.method public resetRecordingState()V
    .locals 1

    .line 29
    invoke-super {p0}, Lcom/android/camera/ui/drawable/CameraPaintBase;->resetRecordingState()V

    .line 30
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintRound;->isRecordingCircle:Z

    .line 31
    return-void
.end method

.method public updateRecordValue(FZ)V
    .locals 2

    .line 39
    const v0, 0x3f266666    # 0.65f

    const v1, 0x3e87ae14    # 0.265f

    if-eqz p2, :cond_0

    .line 40
    const/high16 p2, 0x3f800000    # 1.0f

    mul-float/2addr v0, p1

    sub-float/2addr p2, v0

    iput p2, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintRound;->mRoundingProgress:F

    .line 41
    iget p2, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintRound;->mCurrentWidthPercent:F

    iget v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintRound;->mCurrentWidthPercent:F

    sub-float/2addr v0, v1

    mul-float/2addr v0, p1

    sub-float/2addr p2, v0

    iput p2, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintRound;->mCurrentRoundRectRadius:F

    goto :goto_0

    .line 44
    :cond_0
    const p2, 0x3eb33333    # 0.35f

    mul-float/2addr v0, p1

    add-float/2addr p2, v0

    iput p2, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintRound;->mRoundingProgress:F

    .line 45
    iget p2, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintRound;->mCurrentWidthPercent:F

    sub-float/2addr p2, v1

    mul-float/2addr p2, p1

    add-float/2addr v1, p2

    iput v1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintRound;->mCurrentRoundRectRadius:F

    .line 47
    :goto_0
    return-void
.end method
