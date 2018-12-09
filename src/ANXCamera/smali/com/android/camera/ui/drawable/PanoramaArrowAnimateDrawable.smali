.class public Lcom/android/camera/ui/drawable/PanoramaArrowAnimateDrawable;
.super Landroid/graphics/drawable/Drawable;
.source "PanoramaArrowAnimateDrawable.java"


# static fields
.field public static final LEFT_ARROW_RATIO:F = 0.0f

.field public static final RIGHT_ARROW_RATIO:F = 2.0f


# instance fields
.field private mPaint:Landroid/graphics/Paint;

.field private mTransformationRatio:F


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 20
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 21
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/android/camera/ui/drawable/PanoramaArrowAnimateDrawable;->mPaint:Landroid/graphics/Paint;

    .line 22
    iget-object v0, p0, Lcom/android/camera/ui/drawable/PanoramaArrowAnimateDrawable;->mPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 23
    iget-object v0, p0, Lcom/android/camera/ui/drawable/PanoramaArrowAnimateDrawable;->mPaint:Landroid/graphics/Paint;

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 24
    iget-object v0, p0, Lcom/android/camera/ui/drawable/PanoramaArrowAnimateDrawable;->mPaint:Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 25
    const/high16 v0, 0x40000000    # 2.0f

    invoke-virtual {p0, v0}, Lcom/android/camera/ui/drawable/PanoramaArrowAnimateDrawable;->setTransformationRatio(F)V

    .line 26
    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .locals 7

    .line 39
    invoke-virtual {p0}, Lcom/android/camera/ui/drawable/PanoramaArrowAnimateDrawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    .line 40
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v1

    .line 41
    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v0

    .line 43
    new-instance v2, Landroid/graphics/Path;

    invoke-direct {v2}, Landroid/graphics/Path;-><init>()V

    .line 44
    iget v3, p0, Lcom/android/camera/ui/drawable/PanoramaArrowAnimateDrawable;->mTransformationRatio:F

    const/high16 v4, 0x40000000    # 2.0f

    sub-float v3, v4, v3

    int-to-float v0, v0

    mul-float/2addr v3, v0

    const/high16 v5, 0x40800000    # 4.0f

    div-float/2addr v3, v5

    const/4 v6, 0x0

    invoke-virtual {v2, v6, v3}, Landroid/graphics/Path;->moveTo(FF)V

    .line 45
    iget v3, p0, Lcom/android/camera/ui/drawable/PanoramaArrowAnimateDrawable;->mTransformationRatio:F

    add-float/2addr v3, v4

    mul-float/2addr v3, v0

    div-float/2addr v3, v5

    invoke-virtual {v2, v6, v3}, Landroid/graphics/Path;->lineTo(FF)V

    .line 46
    int-to-float v1, v1

    iget v3, p0, Lcom/android/camera/ui/drawable/PanoramaArrowAnimateDrawable;->mTransformationRatio:F

    sub-float v3, v4, v3

    add-float/2addr v3, v4

    mul-float/2addr v3, v0

    div-float/2addr v3, v5

    invoke-virtual {v2, v1, v3}, Landroid/graphics/Path;->lineTo(FF)V

    .line 47
    iget v3, p0, Lcom/android/camera/ui/drawable/PanoramaArrowAnimateDrawable;->mTransformationRatio:F

    sub-float v3, v4, v3

    sub-float v3, v4, v3

    mul-float/2addr v3, v0

    div-float/2addr v3, v5

    invoke-virtual {v2, v1, v3}, Landroid/graphics/Path;->lineTo(FF)V

    .line 48
    iget v1, p0, Lcom/android/camera/ui/drawable/PanoramaArrowAnimateDrawable;->mTransformationRatio:F

    sub-float/2addr v4, v1

    mul-float/2addr v4, v0

    div-float/2addr v4, v5

    invoke-virtual {v2, v6, v4}, Landroid/graphics/Path;->lineTo(FF)V

    .line 49
    invoke-virtual {v2}, Landroid/graphics/Path;->close()V

    .line 51
    iget-object v0, p0, Lcom/android/camera/ui/drawable/PanoramaArrowAnimateDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v2, v0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 52
    return-void
.end method

.method public getOpacity()I
    .locals 1

    .line 66
    const/4 v0, -0x1

    return v0
.end method

.method public getTransformationRatio()F
    .locals 1

    .line 29
    iget v0, p0, Lcom/android/camera/ui/drawable/PanoramaArrowAnimateDrawable;->mTransformationRatio:F

    return v0
.end method

.method public setAlpha(I)V
    .locals 0

    .line 57
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 0

    .line 62
    return-void
.end method

.method public setTransformationRatio(F)V
    .locals 0

    .line 33
    iput p1, p0, Lcom/android/camera/ui/drawable/PanoramaArrowAnimateDrawable;->mTransformationRatio:F

    .line 34
    invoke-virtual {p0}, Lcom/android/camera/ui/drawable/PanoramaArrowAnimateDrawable;->invalidateSelf()V

    .line 35
    return-void
.end method
