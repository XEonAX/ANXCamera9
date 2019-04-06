.class public Lcom/android/camera/wideselfie/DrawImageView;
.super Landroid/view/View;
.source "DrawImageView.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "DrawImageView"


# instance fields
.field private mBitmap:Landroid/graphics/Bitmap;

.field private mBitmapPaint:Landroid/graphics/Paint;

.field private mBorderPaint:Landroid/graphics/Paint;

.field private mBorderRect:Landroid/graphics/Rect;

.field private mImageRect:Landroid/graphics/Rect;

.field private mOrientation:I

.field private mStillPreviewHeight:I

.field private mStillPreviewWidth:I

.field private mThumbBgHeightVertical:I

.field private mThumbBgWidth:I

.field private mThumbnailBackgroundWidth:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/android/camera/wideselfie/DrawImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p2, 0x0

    iput p2, p0, Lcom/android/camera/wideselfie/DrawImageView;->mOrientation:I

    const/4 p2, 0x0

    iput-object p2, p0, Lcom/android/camera/wideselfie/DrawImageView;->mImageRect:Landroid/graphics/Rect;

    iput-object p2, p0, Lcom/android/camera/wideselfie/DrawImageView;->mBitmap:Landroid/graphics/Bitmap;

    iput-object p2, p0, Lcom/android/camera/wideselfie/DrawImageView;->mBorderRect:Landroid/graphics/Rect;

    new-instance p2, Landroid/graphics/Paint;

    invoke-direct {p2}, Landroid/graphics/Paint;-><init>()V

    iput-object p2, p0, Lcom/android/camera/wideselfie/DrawImageView;->mBitmapPaint:Landroid/graphics/Paint;

    new-instance p2, Landroid/graphics/Paint;

    invoke-direct {p2}, Landroid/graphics/Paint;-><init>()V

    iput-object p2, p0, Lcom/android/camera/wideselfie/DrawImageView;->mBorderPaint:Landroid/graphics/Paint;

    iget-object p2, p0, Lcom/android/camera/wideselfie/DrawImageView;->mBorderPaint:Landroid/graphics/Paint;

    const/4 v0, 0x1

    invoke-virtual {p2, v0}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    iget-object p2, p0, Lcom/android/camera/wideselfie/DrawImageView;->mBorderPaint:Landroid/graphics/Paint;

    const v0, 0x7f0b0074

    invoke-virtual {p1, v0}, Landroid/content/Context;->getColor(I)I

    move-result v0

    invoke-virtual {p2, v0}, Landroid/graphics/Paint;->setColor(I)V

    iget-object p2, p0, Lcom/android/camera/wideselfie/DrawImageView;->mBorderPaint:Landroid/graphics/Paint;

    sget-object v0, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {p2, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object p2, p0, Lcom/android/camera/wideselfie/DrawImageView;->mBorderPaint:Landroid/graphics/Paint;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f0a015c

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p1

    invoke-virtual {p2, p1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    return-void
.end method

.method private convertBorderRect(Landroid/graphics/Rect;)Landroid/graphics/Rect;
    .locals 5

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iget v1, p0, Lcom/android/camera/wideselfie/DrawImageView;->mOrientation:I

    rem-int/lit16 v1, v1, 0xb4

    if-nez v1, :cond_0

    iget v1, p0, Lcom/android/camera/wideselfie/DrawImageView;->mStillPreviewWidth:I

    div-int/lit8 v1, v1, 0x2

    iget v2, p0, Lcom/android/camera/wideselfie/DrawImageView;->mThumbBgWidth:I

    iget v3, p1, Landroid/graphics/Rect;->bottom:I

    sub-int/2addr v2, v3

    iput v2, v0, Landroid/graphics/Rect;->left:I

    iget v2, p1, Landroid/graphics/Rect;->left:I

    iput v2, v0, Landroid/graphics/Rect;->top:I

    iget v2, v0, Landroid/graphics/Rect;->left:I

    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    move-result v3

    add-int/2addr v2, v3

    iput v2, v0, Landroid/graphics/Rect;->right:I

    iget p1, p1, Landroid/graphics/Rect;->right:I

    iput p1, v0, Landroid/graphics/Rect;->bottom:I

    invoke-virtual {v0, v1, v1}, Landroid/graphics/Rect;->offset(II)V

    iput v1, v0, Landroid/graphics/Rect;->top:I

    iget p1, p0, Lcom/android/camera/wideselfie/DrawImageView;->mStillPreviewHeight:I

    add-int/2addr v1, p1

    iput v1, v0, Landroid/graphics/Rect;->bottom:I

    goto :goto_0

    :cond_0
    iget v1, p0, Lcom/android/camera/wideselfie/DrawImageView;->mStillPreviewHeight:I

    div-int/lit8 v1, v1, 0x2

    iget v2, p1, Landroid/graphics/Rect;->top:I

    iput v2, v0, Landroid/graphics/Rect;->left:I

    iget v2, p1, Landroid/graphics/Rect;->left:I

    iget v3, p0, Lcom/android/camera/wideselfie/DrawImageView;->mThumbBgHeightVertical:I

    add-int/lit8 v3, v3, -0x2

    iget v4, p0, Lcom/android/camera/wideselfie/DrawImageView;->mStillPreviewHeight:I

    sub-int/2addr v3, v4

    div-int/lit8 v3, v3, 0x2

    add-int/2addr v2, v3

    iput v2, v0, Landroid/graphics/Rect;->top:I

    iget v2, p1, Landroid/graphics/Rect;->bottom:I

    iput v2, v0, Landroid/graphics/Rect;->right:I

    iget v2, v0, Landroid/graphics/Rect;->top:I

    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    move-result p1

    add-int/2addr v2, p1

    iput v2, v0, Landroid/graphics/Rect;->bottom:I

    invoke-virtual {v0, v1, v1}, Landroid/graphics/Rect;->offset(II)V

    iput v1, v0, Landroid/graphics/Rect;->left:I

    iget p1, p0, Lcom/android/camera/wideselfie/DrawImageView;->mStillPreviewWidth:I

    add-int/2addr v1, p1

    iput v1, v0, Landroid/graphics/Rect;->right:I

    :goto_0
    return-object v0
.end method

.method private convertImageRect(Landroid/graphics/Rect;)Landroid/graphics/Rect;
    .locals 4

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iget v1, p0, Lcom/android/camera/wideselfie/DrawImageView;->mOrientation:I

    rem-int/lit16 v1, v1, 0xb4

    if-nez v1, :cond_0

    iget v1, p0, Lcom/android/camera/wideselfie/DrawImageView;->mStillPreviewWidth:I

    div-int/lit8 v1, v1, 0x2

    iget v2, p0, Lcom/android/camera/wideselfie/DrawImageView;->mThumbBgWidth:I

    iget v3, p1, Landroid/graphics/Rect;->bottom:I

    sub-int/2addr v2, v3

    iput v2, v0, Landroid/graphics/Rect;->left:I

    iget v2, p1, Landroid/graphics/Rect;->left:I

    iput v2, v0, Landroid/graphics/Rect;->top:I

    iget v2, v0, Landroid/graphics/Rect;->left:I

    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    move-result v3

    add-int/2addr v2, v3

    iput v2, v0, Landroid/graphics/Rect;->right:I

    iget p1, p1, Landroid/graphics/Rect;->right:I

    iput p1, v0, Landroid/graphics/Rect;->bottom:I

    invoke-virtual {v0, v1, v1}, Landroid/graphics/Rect;->offset(II)V

    goto :goto_0

    :cond_0
    iget v1, p0, Lcom/android/camera/wideselfie/DrawImageView;->mStillPreviewHeight:I

    div-int/lit8 v1, v1, 0x2

    iget v2, p1, Landroid/graphics/Rect;->top:I

    iput v2, v0, Landroid/graphics/Rect;->left:I

    iget v2, p1, Landroid/graphics/Rect;->left:I

    iput v2, v0, Landroid/graphics/Rect;->top:I

    iget v2, p1, Landroid/graphics/Rect;->bottom:I

    iput v2, v0, Landroid/graphics/Rect;->right:I

    iget p1, p1, Landroid/graphics/Rect;->right:I

    iput p1, v0, Landroid/graphics/Rect;->bottom:I

    invoke-virtual {v0, v1, v1}, Landroid/graphics/Rect;->offset(II)V

    :goto_0
    return-object v0
.end method


# virtual methods
.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 4

    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    iget-object v0, p0, Lcom/android/camera/wideselfie/DrawImageView;->mBitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/wideselfie/DrawImageView;->mImageRect:Landroid/graphics/Rect;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/wideselfie/DrawImageView;->mBitmap:Landroid/graphics/Bitmap;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/android/camera/wideselfie/DrawImageView;->mImageRect:Landroid/graphics/Rect;

    iget-object v3, p0, Lcom/android/camera/wideselfie/DrawImageView;->mBitmapPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    iget-object v0, p0, Lcom/android/camera/wideselfie/DrawImageView;->mBorderRect:Landroid/graphics/Rect;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/wideselfie/DrawImageView;->mBorderRect:Landroid/graphics/Rect;

    iget-object v1, p0, Lcom/android/camera/wideselfie/DrawImageView;->mBorderPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    :cond_0
    return-void
.end method

.method public release()V
    .locals 1

    iget-object v0, p0, Lcom/android/camera/wideselfie/DrawImageView;->mBitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/wideselfie/DrawImageView;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera/wideselfie/DrawImageView;->mBitmap:Landroid/graphics/Bitmap;

    :cond_0
    return-void
.end method

.method public setImageBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;)V
    .locals 2

    iput-object p1, p0, Lcom/android/camera/wideselfie/DrawImageView;->mBitmap:Landroid/graphics/Bitmap;

    if-eqz p2, :cond_0

    invoke-direct {p0, p2}, Lcom/android/camera/wideselfie/DrawImageView;->convertImageRect(Landroid/graphics/Rect;)Landroid/graphics/Rect;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/wideselfie/DrawImageView;->mImageRect:Landroid/graphics/Rect;

    const-string p1, "DrawImageView"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "convertImageRect src = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p2, ", dest = "

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p2, p0, Lcom/android/camera/wideselfie/DrawImageView;->mImageRect:Landroid/graphics/Rect;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p2, ", mOrientation "

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p2, p0, Lcom/android/camera/wideselfie/DrawImageView;->mOrientation:I

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-direct {p0, p3}, Lcom/android/camera/wideselfie/DrawImageView;->convertBorderRect(Landroid/graphics/Rect;)Landroid/graphics/Rect;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/wideselfie/DrawImageView;->mBorderRect:Landroid/graphics/Rect;

    const-string p1, "DrawImageView"

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "convertBorderRect src = "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p3, ", dest = "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p3, p0, Lcom/android/camera/wideselfie/DrawImageView;->mBorderRect:Landroid/graphics/Rect;

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/wideselfie/DrawImageView;->invalidate()V

    return-void
.end method

.method public setOrientation(I)V
    .locals 0

    iput p1, p0, Lcom/android/camera/wideselfie/DrawImageView;->mOrientation:I

    return-void
.end method

.method public setParams(IIII)V
    .locals 0

    iput p1, p0, Lcom/android/camera/wideselfie/DrawImageView;->mStillPreviewWidth:I

    iput p2, p0, Lcom/android/camera/wideselfie/DrawImageView;->mStillPreviewHeight:I

    iput p3, p0, Lcom/android/camera/wideselfie/DrawImageView;->mThumbBgWidth:I

    iput p4, p0, Lcom/android/camera/wideselfie/DrawImageView;->mThumbBgHeightVertical:I

    return-void
.end method
