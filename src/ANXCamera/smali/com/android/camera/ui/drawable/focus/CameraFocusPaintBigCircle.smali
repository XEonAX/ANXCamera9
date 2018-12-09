.class public Lcom/android/camera/ui/drawable/focus/CameraFocusPaintBigCircle;
.super Lcom/android/camera/ui/drawable/CameraPaintBase;
.source "CameraFocusPaintBigCircle.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 17
    invoke-direct {p0, p1}, Lcom/android/camera/ui/drawable/CameraPaintBase;-><init>(Landroid/content/Context;)V

    .line 18
    return-void
.end method


# virtual methods
.method protected draw(Landroid/graphics/Canvas;)V
    .locals 4

    .line 30
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintBigCircle;->mPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintBigCircle;->mCurrentAlpha:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 32
    iget v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintBigCircle;->mMiddleX:F

    iget v1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintBigCircle;->mMiddleY:F

    iget v2, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintBigCircle;->mBaseRadius:F

    iget v3, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintBigCircle;->mCurrentWidthPercent:F

    mul-float/2addr v2, v3

    iget-object v3, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintBigCircle;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 33
    return-void
.end method

.method protected initPaint(Landroid/content/Context;)V
    .locals 1

    .line 22
    iget-object p1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintBigCircle;->mPaint:Landroid/graphics/Paint;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 23
    iget-object p1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintBigCircle;->mPaint:Landroid/graphics/Paint;

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-static {v0}, Lcom/android/camera/Util;->dpToPixel(F)I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 24
    iget-object p1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintBigCircle;->mPaint:Landroid/graphics/Paint;

    sget-object v0, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 25
    iget-object p1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintBigCircle;->mPaint:Landroid/graphics/Paint;

    iget v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintBigCircle;->mCurrentAlpha:I

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 26
    return-void
.end method
