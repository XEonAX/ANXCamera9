.class public Lcom/android/camera/ui/drawable/TriangleIndicatorDrawable;
.super Landroid/graphics/drawable/Drawable;
.source "TriangleIndicatorDrawable.java"


# instance fields
.field private mHeight:I

.field private mPaint:Landroid/graphics/Paint;

.field private mPath:Landroid/graphics/Path;

.field private mWidth:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 20
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 21
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Lcom/android/camera/ui/drawable/TriangleIndicatorDrawable;->mPath:Landroid/graphics/Path;

    .line 23
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/android/camera/ui/drawable/TriangleIndicatorDrawable;->mPaint:Landroid/graphics/Paint;

    .line 24
    iget-object v0, p0, Lcom/android/camera/ui/drawable/TriangleIndicatorDrawable;->mPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 25
    iget-object v0, p0, Lcom/android/camera/ui/drawable/TriangleIndicatorDrawable;->mPaint:Landroid/graphics/Paint;

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 26
    iget-object v0, p0, Lcom/android/camera/ui/drawable/TriangleIndicatorDrawable;->mPaint:Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 27
    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .locals 5

    .line 47
    iget v0, p0, Lcom/android/camera/ui/drawable/TriangleIndicatorDrawable;->mWidth:I

    .line 48
    iget v1, p0, Lcom/android/camera/ui/drawable/TriangleIndicatorDrawable;->mHeight:I

    .line 50
    iget-object v2, p0, Lcom/android/camera/ui/drawable/TriangleIndicatorDrawable;->mPath:Landroid/graphics/Path;

    invoke-virtual {v2}, Landroid/graphics/Path;->reset()V

    .line 51
    iget-object v2, p0, Lcom/android/camera/ui/drawable/TriangleIndicatorDrawable;->mPath:Landroid/graphics/Path;

    neg-int v3, v1

    div-int/lit8 v3, v3, 0x2

    int-to-float v3, v3

    const/4 v4, 0x0

    invoke-virtual {v2, v4, v3}, Landroid/graphics/Path;->moveTo(FF)V

    .line 52
    iget-object v2, p0, Lcom/android/camera/ui/drawable/TriangleIndicatorDrawable;->mPath:Landroid/graphics/Path;

    int-to-float v0, v0

    invoke-virtual {v2, v0, v4}, Landroid/graphics/Path;->lineTo(FF)V

    .line 53
    iget-object v0, p0, Lcom/android/camera/ui/drawable/TriangleIndicatorDrawable;->mPath:Landroid/graphics/Path;

    div-int/lit8 v1, v1, 0x2

    int-to-float v1, v1

    invoke-virtual {v0, v4, v1}, Landroid/graphics/Path;->lineTo(FF)V

    .line 54
    iget-object v0, p0, Lcom/android/camera/ui/drawable/TriangleIndicatorDrawable;->mPath:Landroid/graphics/Path;

    invoke-virtual {v0}, Landroid/graphics/Path;->close()V

    .line 55
    iget-object v0, p0, Lcom/android/camera/ui/drawable/TriangleIndicatorDrawable;->mPath:Landroid/graphics/Path;

    iget-object v1, p0, Lcom/android/camera/ui/drawable/TriangleIndicatorDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 56
    return-void
.end method

.method public getHeight()I
    .locals 1

    .line 38
    iget v0, p0, Lcom/android/camera/ui/drawable/TriangleIndicatorDrawable;->mHeight:I

    return v0
.end method

.method public getIntrinsicHeight()I
    .locals 1

    .line 80
    iget v0, p0, Lcom/android/camera/ui/drawable/TriangleIndicatorDrawable;->mHeight:I

    return v0
.end method

.method public getIntrinsicWidth()I
    .locals 1

    .line 75
    iget v0, p0, Lcom/android/camera/ui/drawable/TriangleIndicatorDrawable;->mWidth:I

    return v0
.end method

.method public getOpacity()I
    .locals 1

    .line 70
    const/4 v0, -0x1

    return v0
.end method

.method public getWidth()I
    .locals 1

    .line 30
    iget v0, p0, Lcom/android/camera/ui/drawable/TriangleIndicatorDrawable;->mWidth:I

    return v0
.end method

.method public setAlpha(I)V
    .locals 0

    .line 61
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 0

    .line 66
    return-void
.end method

.method public setHeight(I)V
    .locals 0

    .line 42
    iput p1, p0, Lcom/android/camera/ui/drawable/TriangleIndicatorDrawable;->mHeight:I

    .line 43
    return-void
.end method

.method public setWidth(I)V
    .locals 0

    .line 34
    iput p1, p0, Lcom/android/camera/ui/drawable/TriangleIndicatorDrawable;->mWidth:I

    .line 35
    return-void
.end method
