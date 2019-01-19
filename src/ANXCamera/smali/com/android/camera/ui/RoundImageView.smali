.class public Lcom/android/camera/ui/RoundImageView;
.super Landroid/widget/ImageView;
.source "RoundImageView.java"


# instance fields
.field private final mDrawFilter:Landroid/graphics/PaintFlagsDrawFilter;

.field private mMaskBitmap:Landroid/graphics/Bitmap;

.field private mPaint:Landroid/graphics/Paint;

.field private mRadius:F

.field private mSrcRectF:Landroid/graphics/RectF;

.field private mSrcSize:F

.field private mXfermode:Landroid/graphics/Xfermode;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 29
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/android/camera/ui/RoundImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 30
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 3

    .line 33
    invoke-direct {p0, p1, p2}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 34
    new-instance p1, Landroid/graphics/PaintFlagsDrawFilter;

    const/4 p2, 0x0

    const/4 v0, 0x3

    invoke-direct {p1, p2, v0}, Landroid/graphics/PaintFlagsDrawFilter;-><init>(II)V

    iput-object p1, p0, Lcom/android/camera/ui/RoundImageView;->mDrawFilter:Landroid/graphics/PaintFlagsDrawFilter;

    .line 35
    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    iput-object p1, p0, Lcom/android/camera/ui/RoundImageView;->mPaint:Landroid/graphics/Paint;

    .line 36
    iget-object p1, p0, Lcom/android/camera/ui/RoundImageView;->mPaint:Landroid/graphics/Paint;

    const/high16 p2, -0x1000000

    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setColor(I)V

    .line 37
    iget-object p1, p0, Lcom/android/camera/ui/RoundImageView;->mPaint:Landroid/graphics/Paint;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 38
    invoke-virtual {p0}, Lcom/android/camera/ui/RoundImageView;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f0a0131

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p1

    iput p1, p0, Lcom/android/camera/ui/RoundImageView;->mSrcSize:F

    .line 39
    new-instance p1, Landroid/graphics/RectF;

    iget v0, p0, Lcom/android/camera/ui/RoundImageView;->mSrcSize:F

    iget v1, p0, Lcom/android/camera/ui/RoundImageView;->mSrcSize:F

    const/4 v2, 0x0

    invoke-direct {p1, v2, v2, v0, v1}, Landroid/graphics/RectF;-><init>(FFFF)V

    iput-object p1, p0, Lcom/android/camera/ui/RoundImageView;->mSrcRectF:Landroid/graphics/RectF;

    .line 40
    invoke-virtual {p0}, Lcom/android/camera/ui/RoundImageView;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f0a0133

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    int-to-float p1, p1

    iput p1, p0, Lcom/android/camera/ui/RoundImageView;->mRadius:F

    .line 41
    new-instance p1, Landroid/graphics/PorterDuffXfermode;

    sget-object v0, Landroid/graphics/PorterDuff$Mode;->DST_IN:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {p1, v0}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    iput-object p1, p0, Lcom/android/camera/ui/RoundImageView;->mXfermode:Landroid/graphics/Xfermode;

    .line 42
    iget p1, p0, Lcom/android/camera/ui/RoundImageView;->mSrcSize:F

    float-to-int p1, p1

    iget v0, p0, Lcom/android/camera/ui/RoundImageView;->mSrcSize:F

    float-to-int v0, v0

    sget-object v1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {p1, v0, v1}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/ui/RoundImageView;->mMaskBitmap:Landroid/graphics/Bitmap;

    .line 43
    new-instance p1, Landroid/graphics/Canvas;

    iget-object v0, p0, Lcom/android/camera/ui/RoundImageView;->mMaskBitmap:Landroid/graphics/Bitmap;

    invoke-direct {p1, v0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 44
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 45
    invoke-virtual {v0, p2}, Landroid/graphics/Paint;->setColor(I)V

    .line 46
    iget-object p2, p0, Lcom/android/camera/ui/RoundImageView;->mSrcRectF:Landroid/graphics/RectF;

    iget v0, p0, Lcom/android/camera/ui/RoundImageView;->mRadius:F

    iget v1, p0, Lcom/android/camera/ui/RoundImageView;->mRadius:F

    iget-object v2, p0, Lcom/android/camera/ui/RoundImageView;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, p2, v0, v1, v2}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 47
    return-void
.end method


# virtual methods
.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 5

    .line 56
    iget-object v0, p0, Lcom/android/camera/ui/RoundImageView;->mSrcRectF:Landroid/graphics/RectF;

    const/4 v1, 0x0

    const/16 v2, 0x1f

    invoke-virtual {p1, v0, v1, v2}, Landroid/graphics/Canvas;->saveLayer(Landroid/graphics/RectF;Landroid/graphics/Paint;I)I

    move-result v0

    .line 57
    invoke-super {p0, p1}, Landroid/widget/ImageView;->onDraw(Landroid/graphics/Canvas;)V

    .line 58
    iget-object v2, p0, Lcom/android/camera/ui/RoundImageView;->mDrawFilter:Landroid/graphics/PaintFlagsDrawFilter;

    invoke-virtual {p1, v2}, Landroid/graphics/Canvas;->setDrawFilter(Landroid/graphics/DrawFilter;)V

    .line 59
    iget-object v2, p0, Lcom/android/camera/ui/RoundImageView;->mPaint:Landroid/graphics/Paint;

    iget-object v3, p0, Lcom/android/camera/ui/RoundImageView;->mXfermode:Landroid/graphics/Xfermode;

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 60
    iget-object v2, p0, Lcom/android/camera/ui/RoundImageView;->mMaskBitmap:Landroid/graphics/Bitmap;

    iget-object v3, p0, Lcom/android/camera/ui/RoundImageView;->mPaint:Landroid/graphics/Paint;

    const/4 v4, 0x0

    invoke-virtual {p1, v2, v4, v4, v3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 61
    iget-object v2, p0, Lcom/android/camera/ui/RoundImageView;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v2, v1}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 62
    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 63
    return-void
.end method

.method public setRoundRadius(F)V
    .locals 0

    .line 50
    iput p1, p0, Lcom/android/camera/ui/RoundImageView;->mRadius:F

    .line 51
    return-void
.end method
