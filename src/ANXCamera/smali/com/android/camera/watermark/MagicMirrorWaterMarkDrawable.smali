.class public Lcom/android/camera/watermark/MagicMirrorWaterMarkDrawable;
.super Lcom/android/camera/watermark/BaseWaterMarkDrawable;
.source "MagicMirrorWaterMarkDrawable.java"


# static fields
.field private static final MAGIC_MIRROR_RECT_COLOR:I = -0x47c9


# instance fields
.field private mBeautyScoreIc:Landroid/graphics/drawable/Drawable;

.field private mFaceRectPaint:Landroid/graphics/Paint;

.field private mHonPadding:I

.field private mMagicMirrorInfoPop:Landroid/graphics/drawable/Drawable;


# direct methods
.method public constructor <init>(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/camera/watermark/WaterMarkData;",
            ">;)V"
        }
    .end annotation

    .line 22
    invoke-direct {p0, p1}, Lcom/android/camera/watermark/BaseWaterMarkDrawable;-><init>(Ljava/util/List;)V

    .line 23
    return-void
.end method


# virtual methods
.method protected getFaceRectPaint(Lcom/android/camera/watermark/WaterMarkData;)Landroid/graphics/Paint;
    .locals 0

    .line 41
    iget-object p1, p0, Lcom/android/camera/watermark/MagicMirrorWaterMarkDrawable;->mFaceRectPaint:Landroid/graphics/Paint;

    return-object p1
.end method

.method protected getHonPadding(Lcom/android/camera/watermark/WaterMarkData;)I
    .locals 0

    .line 46
    iget p1, p0, Lcom/android/camera/watermark/MagicMirrorWaterMarkDrawable;->mHonPadding:I

    return p1
.end method

.method protected getTopBackgroundDrawable(Lcom/android/camera/watermark/WaterMarkData;)Landroid/graphics/drawable/Drawable;
    .locals 0

    .line 51
    iget-object p1, p0, Lcom/android/camera/watermark/MagicMirrorWaterMarkDrawable;->mMagicMirrorInfoPop:Landroid/graphics/drawable/Drawable;

    return-object p1
.end method

.method protected getTopIndicatorDrawable(Lcom/android/camera/watermark/WaterMarkData;)Landroid/graphics/drawable/Drawable;
    .locals 0

    .line 56
    iget-object p1, p0, Lcom/android/camera/watermark/MagicMirrorWaterMarkDrawable;->mBeautyScoreIc:Landroid/graphics/drawable/Drawable;

    return-object p1
.end method

.method protected initBeforeDraw()V
    .locals 4

    .line 27
    iget-object v0, p0, Lcom/android/camera/watermark/MagicMirrorWaterMarkDrawable;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f020173

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/watermark/MagicMirrorWaterMarkDrawable;->mMagicMirrorInfoPop:Landroid/graphics/drawable/Drawable;

    .line 28
    iget-object v0, p0, Lcom/android/camera/watermark/MagicMirrorWaterMarkDrawable;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0200b2

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/watermark/MagicMirrorWaterMarkDrawable;->mBeautyScoreIc:Landroid/graphics/drawable/Drawable;

    .line 29
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/android/camera/watermark/MagicMirrorWaterMarkDrawable;->mFaceRectPaint:Landroid/graphics/Paint;

    .line 30
    iget-object v0, p0, Lcom/android/camera/watermark/MagicMirrorWaterMarkDrawable;->mFaceRectPaint:Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 31
    iget-object v0, p0, Lcom/android/camera/watermark/MagicMirrorWaterMarkDrawable;->mFaceRectPaint:Landroid/graphics/Paint;

    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f09004f

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 32
    iget-object v0, p0, Lcom/android/camera/watermark/MagicMirrorWaterMarkDrawable;->mFaceRectPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 33
    iget-object v0, p0, Lcom/android/camera/watermark/MagicMirrorWaterMarkDrawable;->mFaceRectPaint:Landroid/graphics/Paint;

    const/16 v1, -0x47c9

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 34
    iget-object v0, p0, Lcom/android/camera/watermark/MagicMirrorWaterMarkDrawable;->mMagicMirrorInfoPop:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v0

    int-to-double v0, v0

    const-wide v2, 0x3fbeb851eb851eb8L    # 0.12

    mul-double/2addr v0, v2

    double-to-int v0, v0

    iput v0, p0, Lcom/android/camera/watermark/MagicMirrorWaterMarkDrawable;->mFacePopupBottom:I

    .line 35
    iget-object v0, p0, Lcom/android/camera/watermark/MagicMirrorWaterMarkDrawable;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f090048

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/android/camera/watermark/MagicMirrorWaterMarkDrawable;->mHonPadding:I

    .line 36
    iget-object v0, p0, Lcom/android/camera/watermark/MagicMirrorWaterMarkDrawable;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f090049

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/android/camera/watermark/MagicMirrorWaterMarkDrawable;->mVerPadding:I

    .line 37
    return-void
.end method
