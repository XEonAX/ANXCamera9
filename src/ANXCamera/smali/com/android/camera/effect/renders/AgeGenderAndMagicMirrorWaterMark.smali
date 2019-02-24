.class Lcom/android/camera/effect/renders/AgeGenderAndMagicMirrorWaterMark;
.super Lcom/android/camera/effect/renders/WaterMark;
.source "AgeGenderAndMagicMirrorWaterMark.java"


# instance fields
.field private mCenterX:I

.field private mCenterY:I

.field private mHeight:I

.field private mImageTexture:Lcom/android/gallery3d/ui/BitmapTexture;

.field private mPaddingX:I

.field private mPaddingY:I

.field private mWidth:I


# direct methods
.method public constructor <init>(Landroid/graphics/Bitmap;IIIIIFF)V
    .locals 0

    .line 20
    invoke-direct {p0, p2, p3, p4}, Lcom/android/camera/effect/renders/WaterMark;-><init>(III)V

    .line 22
    invoke-static {p5, p6}, Ljava/lang/Math;->min(II)I

    move-result p4

    .line 23
    invoke-static {p2, p3}, Ljava/lang/Math;->min(II)I

    move-result p5

    .line 25
    div-int/2addr p5, p4

    int-to-float p4, p5

    .line 26
    invoke-static {p2, p3}, Ljava/lang/Math;->max(II)I

    move-result p5

    iput p5, p0, Lcom/android/camera/effect/renders/AgeGenderAndMagicMirrorWaterMark;->mHeight:I

    .line 27
    invoke-static {p2, p3}, Ljava/lang/Math;->min(II)I

    move-result p2

    iput p2, p0, Lcom/android/camera/effect/renders/AgeGenderAndMagicMirrorWaterMark;->mWidth:I

    .line 28
    mul-float/2addr p7, p4

    invoke-static {p7}, Ljava/lang/Math;->round(F)I

    move-result p2

    iput p2, p0, Lcom/android/camera/effect/renders/AgeGenderAndMagicMirrorWaterMark;->mPaddingX:I

    .line 29
    mul-float/2addr p8, p4

    invoke-static {p8}, Ljava/lang/Math;->round(F)I

    move-result p2

    iput p2, p0, Lcom/android/camera/effect/renders/AgeGenderAndMagicMirrorWaterMark;->mPaddingY:I

    .line 30
    new-instance p2, Lcom/android/gallery3d/ui/BitmapTexture;

    invoke-direct {p2, p1}, Lcom/android/gallery3d/ui/BitmapTexture;-><init>(Landroid/graphics/Bitmap;)V

    iput-object p2, p0, Lcom/android/camera/effect/renders/AgeGenderAndMagicMirrorWaterMark;->mImageTexture:Lcom/android/gallery3d/ui/BitmapTexture;

    .line 31
    iget-object p1, p0, Lcom/android/camera/effect/renders/AgeGenderAndMagicMirrorWaterMark;->mImageTexture:Lcom/android/gallery3d/ui/BitmapTexture;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Lcom/android/gallery3d/ui/BitmapTexture;->setOpaque(Z)V

    .line 32
    invoke-direct {p0}, Lcom/android/camera/effect/renders/AgeGenderAndMagicMirrorWaterMark;->calcCenterAxis()V

    .line 33
    return-void
.end method

.method private calcCenterAxis()V
    .locals 2

    .line 36
    iget v0, p0, Lcom/android/camera/effect/renders/AgeGenderAndMagicMirrorWaterMark;->mPaddingY:I

    invoke-virtual {p0}, Lcom/android/camera/effect/renders/AgeGenderAndMagicMirrorWaterMark;->getHeight()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    add-int/2addr v0, v1

    iput v0, p0, Lcom/android/camera/effect/renders/AgeGenderAndMagicMirrorWaterMark;->mCenterX:I

    .line 37
    iget v0, p0, Lcom/android/camera/effect/renders/AgeGenderAndMagicMirrorWaterMark;->mPaddingX:I

    invoke-virtual {p0}, Lcom/android/camera/effect/renders/AgeGenderAndMagicMirrorWaterMark;->getWidth()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    add-int/2addr v0, v1

    iput v0, p0, Lcom/android/camera/effect/renders/AgeGenderAndMagicMirrorWaterMark;->mCenterY:I

    .line 38
    return-void
.end method


# virtual methods
.method public getCenterX()I
    .locals 1

    .line 42
    iget v0, p0, Lcom/android/camera/effect/renders/AgeGenderAndMagicMirrorWaterMark;->mCenterX:I

    return v0
.end method

.method public getCenterY()I
    .locals 1

    .line 47
    iget v0, p0, Lcom/android/camera/effect/renders/AgeGenderAndMagicMirrorWaterMark;->mCenterY:I

    return v0
.end method

.method public getHeight()I
    .locals 1

    .line 57
    iget v0, p0, Lcom/android/camera/effect/renders/AgeGenderAndMagicMirrorWaterMark;->mHeight:I

    return v0
.end method

.method public getLeft()I
    .locals 1

    .line 67
    invoke-super {p0}, Lcom/android/camera/effect/renders/WaterMark;->getLeft()I

    move-result v0

    return v0
.end method

.method public getPaddingX()I
    .locals 1

    .line 77
    iget v0, p0, Lcom/android/camera/effect/renders/AgeGenderAndMagicMirrorWaterMark;->mPaddingX:I

    return v0
.end method

.method public getPaddingY()I
    .locals 1

    .line 82
    iget v0, p0, Lcom/android/camera/effect/renders/AgeGenderAndMagicMirrorWaterMark;->mPaddingY:I

    return v0
.end method

.method public getTexture()Lcom/android/gallery3d/ui/BasicTexture;
    .locals 1

    .line 62
    iget-object v0, p0, Lcom/android/camera/effect/renders/AgeGenderAndMagicMirrorWaterMark;->mImageTexture:Lcom/android/gallery3d/ui/BitmapTexture;

    return-object v0
.end method

.method public getTop()I
    .locals 1

    .line 72
    invoke-super {p0}, Lcom/android/camera/effect/renders/WaterMark;->getTop()I

    move-result v0

    return v0
.end method

.method public getWidth()I
    .locals 1

    .line 52
    iget v0, p0, Lcom/android/camera/effect/renders/AgeGenderAndMagicMirrorWaterMark;->mWidth:I

    return v0
.end method
