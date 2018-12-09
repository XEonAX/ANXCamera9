.class public Lcom/android/camera/ui/drawable/lighting/LightingPaintCircle;
.super Lcom/android/camera/ui/drawable/CameraPaintBase;
.source "LightingPaintCircle.java"


# instance fields
.field private arcRectF:Landroid/graphics/RectF;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 20
    invoke-direct {p0, p1}, Lcom/android/camera/ui/drawable/CameraPaintBase;-><init>(Landroid/content/Context;)V

    .line 21
    return-void
.end method


# virtual methods
.method protected draw(Landroid/graphics/Canvas;)V
    .locals 4

    .line 33
    iget-object v0, p0, Lcom/android/camera/ui/drawable/lighting/LightingPaintCircle;->mPaint:Landroid/graphics/Paint;

    const/high16 v1, 0x41000000    # 8.0f

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 34
    iget v0, p0, Lcom/android/camera/ui/drawable/lighting/LightingPaintCircle;->mMiddleX:F

    iget v1, p0, Lcom/android/camera/ui/drawable/lighting/LightingPaintCircle;->mMiddleY:F

    iget v2, p0, Lcom/android/camera/ui/drawable/lighting/LightingPaintCircle;->mBaseRadius:F

    iget v3, p0, Lcom/android/camera/ui/drawable/lighting/LightingPaintCircle;->mCurrentWidthPercent:F

    mul-float/2addr v2, v3

    iget-object v3, p0, Lcom/android/camera/ui/drawable/lighting/LightingPaintCircle;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 35
    return-void
.end method

.method protected initPaint(Landroid/content/Context;)V
    .locals 1

    .line 25
    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    iput-object p1, p0, Lcom/android/camera/ui/drawable/lighting/LightingPaintCircle;->arcRectF:Landroid/graphics/RectF;

    .line 26
    const/4 p1, -0x1

    iput p1, p0, Lcom/android/camera/ui/drawable/lighting/LightingPaintCircle;->mCurrentColor:I

    .line 27
    iget-object p1, p0, Lcom/android/camera/ui/drawable/lighting/LightingPaintCircle;->mPaint:Landroid/graphics/Paint;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 28
    iget-object p1, p0, Lcom/android/camera/ui/drawable/lighting/LightingPaintCircle;->mPaint:Landroid/graphics/Paint;

    sget-object v0, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 29
    return-void
.end method
