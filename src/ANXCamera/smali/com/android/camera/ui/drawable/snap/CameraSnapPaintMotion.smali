.class public Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;
.super Lcom/android/camera/ui/drawable/CameraPaintBase;
.source "CameraSnapPaintMotion.java"


# instance fields
.field private mIsOutstandingRound:Z

.field private mLastAngle:F


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 19
    invoke-direct {p0, p1}, Lcom/android/camera/ui/drawable/CameraPaintBase;-><init>(Landroid/content/Context;)V

    .line 15
    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->mIsOutstandingRound:Z

    .line 16
    const/4 p1, 0x0

    iput p1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->mLastAngle:F

    .line 20
    return-void
.end method


# virtual methods
.method protected draw(Landroid/graphics/Canvas;)V
    .locals 14

    .line 31
    iget v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->mBaseRadius:F

    iget v1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->mCurrentWidthPercent:F

    mul-float/2addr v0, v1

    .line 33
    nop

    .line 34
    nop

    .line 37
    iget v1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->timeAngle:F

    iget v2, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->mLastAngle:F

    sub-float/2addr v1, v2

    const/4 v2, 0x0

    cmpg-float v1, v1, v2

    if-gez v1, :cond_0

    .line 38
    iget-boolean v1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->mIsOutstandingRound:Z

    xor-int/lit8 v1, v1, 0x1

    iput-boolean v1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->mIsOutstandingRound:Z

    .line 40
    :cond_0
    const/4 v1, 0x0

    :goto_0
    const/16 v3, 0x28

    if-ge v1, v3, :cond_7

    .line 41
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 43
    mul-int/lit8 v3, v1, 0x9

    int-to-float v3, v3

    .line 44
    iget v4, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->mMiddleX:F

    iget v5, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->mMiddleY:F

    invoke-virtual {p1, v3, v4, v5}, Landroid/graphics/Canvas;->rotate(FFF)V

    .line 46
    const/16 v4, 0xc

    .line 47
    iget v5, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->mCurrentAlpha:I

    .line 49
    iget-boolean v6, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->isRecording:Z

    const/16 v7, 0x13

    const/high16 v8, 0x42b40000    # 90.0f

    if-eqz v6, :cond_5

    .line 50
    cmpl-float v6, v3, v2

    if-nez v6, :cond_1

    iget-boolean v6, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->needZero:Z

    if-eqz v6, :cond_1

    .line 51
    iget-object v6, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->mPaint:Landroid/graphics/Paint;

    sget v9, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->ALPHA_OUTSTANDING:I

    invoke-virtual {v6, v9}, Landroid/graphics/Paint;->setAlpha(I)V

    goto :goto_3

    .line 52
    :cond_1
    iget v6, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->timeAngle:F

    cmpg-float v6, v3, v6

    if-gez v6, :cond_3

    .line 53
    iget-object v6, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->mPaint:Landroid/graphics/Paint;

    iget-boolean v9, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->mIsOutstandingRound:Z

    if-eqz v9, :cond_2

    sget v9, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->ALPHA_OUTSTANDING:I

    goto :goto_1

    :cond_2
    sget v9, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->ALPHA_HINT:I

    :goto_1
    invoke-virtual {v6, v9}, Landroid/graphics/Paint;->setAlpha(I)V

    goto :goto_3

    .line 55
    :cond_3
    iget-object v6, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->mPaint:Landroid/graphics/Paint;

    iget-boolean v9, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->mIsOutstandingRound:Z

    if-eqz v9, :cond_4

    sget v9, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->ALPHA_HINT:I

    goto :goto_2

    :cond_4
    sget v9, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->ALPHA_OUTSTANDING:I

    :goto_2
    invoke-virtual {v6, v9}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 57
    :goto_3
    rem-float/2addr v3, v8

    cmpl-float v3, v3, v2

    if-nez v3, :cond_6

    .line 58
    goto :goto_4

    .line 61
    :cond_5
    rem-float/2addr v3, v8

    cmpl-float v3, v3, v2

    if-nez v3, :cond_6

    .line 62
    goto :goto_4

    .line 66
    :cond_6
    move v7, v4

    :goto_4
    iget v9, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->mMiddleX:F

    iget v3, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->mMiddleY:F

    sub-float v10, v3, v0

    iget v11, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->mMiddleX:F

    iget v3, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->mMiddleY:F

    sub-float/2addr v3, v0

    int-to-float v4, v7

    add-float v12, v3, v4

    iget-object v13, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->mPaint:Landroid/graphics/Paint;

    move-object v8, p1

    invoke-virtual/range {v8 .. v13}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 68
    iget-object v3, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v3, v5}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 69
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 40
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 71
    :cond_7
    iget v1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->timeAngle:F

    iput v1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->mLastAngle:F

    .line 73
    iget-boolean v1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->isRecording:Z

    if-eqz v1, :cond_8

    .line 74
    iget v1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->timeAngle:F

    iget v2, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->mMiddleX:F

    iget v3, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->mMiddleY:F

    invoke-virtual {p1, v1, v2, v3}, Landroid/graphics/Canvas;->rotate(FFF)V

    .line 75
    iget v1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->mCurrentAlpha:I

    .line 76
    iget-object v2, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->mPaint:Landroid/graphics/Paint;

    sget v3, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->ALPHA_OUTSTANDING:I

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 77
    iget v5, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->mMiddleX:F

    iget v2, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->mMiddleY:F

    sub-float v6, v2, v0

    iget v7, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->mMiddleX:F

    iget v2, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->mMiddleY:F

    sub-float/2addr v2, v0

    const/high16 v0, 0x41980000    # 19.0f

    add-float v8, v2, v0

    iget-object v9, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->mPaint:Landroid/graphics/Paint;

    move-object v4, p1

    invoke-virtual/range {v4 .. v9}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 78
    iget-object p1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 80
    :cond_8
    return-void
.end method

.method protected initPaint(Landroid/content/Context;)V
    .locals 1

    .line 24
    iget-object p1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->mPaint:Landroid/graphics/Paint;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 25
    iget-object p1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->mPaint:Landroid/graphics/Paint;

    sget-object v0, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 26
    iget-object p1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->mPaint:Landroid/graphics/Paint;

    const/high16 v0, 0x40400000    # 3.0f

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 27
    return-void
.end method
