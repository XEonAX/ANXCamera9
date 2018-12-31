.class public Lcom/android/camera/ui/drawable/lighting/LightingPaintMask;
.super Lcom/android/camera/ui/drawable/CameraPaintBase;
.source "LightingPaintMask.java"


# instance fields
.field private mHeight:I

.field private mWidth:I

.field private porterDuffXfermode:Landroid/graphics/PorterDuffXfermode;


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
    .locals 7

    .line 37
    iget-object v0, p0, Lcom/android/camera/ui/drawable/lighting/LightingPaintMask;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0}, Landroid/graphics/Paint;->reset()V

    .line 38
    iget-object v0, p0, Lcom/android/camera/ui/drawable/lighting/LightingPaintMask;->mPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/android/camera/ui/drawable/lighting/LightingPaintMask;->mCurrentAlpha:I

    const/4 v2, 0x0

    invoke-static {v1, v2, v2, v2}, Landroid/graphics/Color;->argb(IIII)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 39
    iget v0, p0, Lcom/android/camera/ui/drawable/lighting/LightingPaintMask;->mWidth:I

    int-to-float v4, v0

    iget v0, p0, Lcom/android/camera/ui/drawable/lighting/LightingPaintMask;->mHeight:I

    int-to-float v5, v0

    iget-object v6, p0, Lcom/android/camera/ui/drawable/lighting/LightingPaintMask;->mPaint:Landroid/graphics/Paint;

    const/4 v2, 0x0

    const/4 v3, 0x0

    move-object v1, p1

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 41
    iget-object v0, p0, Lcom/android/camera/ui/drawable/lighting/LightingPaintMask;->mPaint:Landroid/graphics/Paint;

    new-instance v1, Landroid/graphics/PorterDuffXfermode;

    sget-object v2, Landroid/graphics/PorterDuff$Mode;->CLEAR:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {v1, v2}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 43
    iget v0, p0, Lcom/android/camera/ui/drawable/lighting/LightingPaintMask;->mMiddleX:F

    iget v1, p0, Lcom/android/camera/ui/drawable/lighting/LightingPaintMask;->mMiddleY:F

    iget v2, p0, Lcom/android/camera/ui/drawable/lighting/LightingPaintMask;->mBaseRadius:F

    iget v3, p0, Lcom/android/camera/ui/drawable/lighting/LightingPaintMask;->mCurrentWidthPercent:F

    mul-float/2addr v2, v3

    iget-object v3, p0, Lcom/android/camera/ui/drawable/lighting/LightingPaintMask;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 44
    return-void
.end method

.method protected initPaint(Landroid/content/Context;)V
    .locals 1

    .line 30
    iget-object p1, p0, Lcom/android/camera/ui/drawable/lighting/LightingPaintMask;->mPaint:Landroid/graphics/Paint;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 31
    new-instance p1, Landroid/graphics/PorterDuffXfermode;

    sget-object v0, Landroid/graphics/PorterDuff$Mode;->CLEAR:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {p1, v0}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    iput-object p1, p0, Lcom/android/camera/ui/drawable/lighting/LightingPaintMask;->porterDuffXfermode:Landroid/graphics/PorterDuffXfermode;

    .line 32
    return-void
.end method

.method public setData(II)V
    .locals 0

    .line 24
    iput p1, p0, Lcom/android/camera/ui/drawable/lighting/LightingPaintMask;->mWidth:I

    .line 25
    iput p2, p0, Lcom/android/camera/ui/drawable/lighting/LightingPaintMask;->mHeight:I

    .line 26
    return-void
.end method
