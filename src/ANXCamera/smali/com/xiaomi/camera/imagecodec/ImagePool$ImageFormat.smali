.class public Lcom/xiaomi/camera/imagecodec/ImagePool$ImageFormat;
.super Ljava/lang/Object;
.source "ImagePool.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/xiaomi/camera/imagecodec/ImagePool;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ImageFormat"
.end annotation


# instance fields
.field private mFormat:I

.field private mHeight:I

.field private mWidth:I


# direct methods
.method public constructor <init>(III)V
    .locals 0

    .line 274
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 275
    iput p1, p0, Lcom/xiaomi/camera/imagecodec/ImagePool$ImageFormat;->mWidth:I

    .line 276
    iput p2, p0, Lcom/xiaomi/camera/imagecodec/ImagePool$ImageFormat;->mHeight:I

    .line 277
    iput p3, p0, Lcom/xiaomi/camera/imagecodec/ImagePool$ImageFormat;->mFormat:I

    .line 278
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 2
    .param p1    # Ljava/lang/Object;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .line 301
    instance-of v0, p1, Lcom/xiaomi/camera/imagecodec/ImagePool$ImageFormat;

    if-eqz v0, :cond_1

    .line 302
    check-cast p1, Lcom/xiaomi/camera/imagecodec/ImagePool$ImageFormat;

    .line 303
    iget v0, p0, Lcom/xiaomi/camera/imagecodec/ImagePool$ImageFormat;->mWidth:I

    invoke-virtual {p1}, Lcom/xiaomi/camera/imagecodec/ImagePool$ImageFormat;->getWidth()I

    move-result v1

    if-ne v0, v1, :cond_0

    iget v0, p0, Lcom/xiaomi/camera/imagecodec/ImagePool$ImageFormat;->mHeight:I

    .line 304
    invoke-virtual {p1}, Lcom/xiaomi/camera/imagecodec/ImagePool$ImageFormat;->getHeight()I

    move-result v1

    if-ne v0, v1, :cond_0

    iget v0, p0, Lcom/xiaomi/camera/imagecodec/ImagePool$ImageFormat;->mFormat:I

    .line 305
    invoke-virtual {p1}, Lcom/xiaomi/camera/imagecodec/ImagePool$ImageFormat;->getFormat()I

    move-result p1

    if-ne v0, p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    .line 303
    :goto_0
    return p1

    .line 307
    :cond_1
    invoke-super {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public getFormat()I
    .locals 1

    .line 289
    iget v0, p0, Lcom/xiaomi/camera/imagecodec/ImagePool$ImageFormat;->mFormat:I

    return v0
.end method

.method public getHeight()I
    .locals 1

    .line 285
    iget v0, p0, Lcom/xiaomi/camera/imagecodec/ImagePool$ImageFormat;->mHeight:I

    return v0
.end method

.method public getWidth()I
    .locals 1

    .line 281
    iget v0, p0, Lcom/xiaomi/camera/imagecodec/ImagePool$ImageFormat;->mWidth:I

    return v0
.end method

.method public hashCode()I
    .locals 3

    .line 294
    iget v0, p0, Lcom/xiaomi/camera/imagecodec/ImagePool$ImageFormat;->mWidth:I

    shl-int/lit8 v0, v0, 0x8

    iget v1, p0, Lcom/xiaomi/camera/imagecodec/ImagePool$ImageFormat;->mWidth:I

    ushr-int/lit8 v1, v1, 0x8

    or-int/2addr v0, v1

    .line 295
    iget v1, p0, Lcom/xiaomi/camera/imagecodec/ImagePool$ImageFormat;->mHeight:I

    shl-int/lit8 v1, v1, 0x10

    iget v2, p0, Lcom/xiaomi/camera/imagecodec/ImagePool$ImageFormat;->mHeight:I

    ushr-int/lit8 v2, v2, 0x10

    or-int/2addr v1, v2

    .line 296
    iget v2, p0, Lcom/xiaomi/camera/imagecodec/ImagePool$ImageFormat;->mFormat:I

    xor-int/2addr v0, v2

    xor-int/2addr v0, v1

    return v0
.end method
