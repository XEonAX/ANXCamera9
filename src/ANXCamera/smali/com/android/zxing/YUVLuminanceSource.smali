.class final Lcom/android/zxing/YUVLuminanceSource;
.super Lcom/google/zxing/LuminanceSource;
.source "YUVLuminanceSource.java"


# instance fields
.field private final mDataHeight:I

.field private final mDataWidth:I

.field private final mLeft:I

.field private final mTop:I

.field private final mYUVData:[B


# direct methods
.method public constructor <init>([BIIIIII)V
    .locals 0

    .line 22
    invoke-direct {p0, p6, p7}, Lcom/google/zxing/LuminanceSource;-><init>(II)V

    .line 24
    add-int/2addr p6, p4

    if-gt p6, p2, :cond_0

    add-int/2addr p7, p5

    if-gt p7, p3, :cond_0

    .line 28
    iput-object p1, p0, Lcom/android/zxing/YUVLuminanceSource;->mYUVData:[B

    .line 29
    iput p2, p0, Lcom/android/zxing/YUVLuminanceSource;->mDataWidth:I

    .line 30
    iput p3, p0, Lcom/android/zxing/YUVLuminanceSource;->mDataHeight:I

    .line 31
    iput p4, p0, Lcom/android/zxing/YUVLuminanceSource;->mLeft:I

    .line 32
    iput p5, p0, Lcom/android/zxing/YUVLuminanceSource;->mTop:I

    .line 33
    return-void

    .line 25
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Crop rectangle does not fit within image data."

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public getDataHeight()I
    .locals 1

    .line 90
    iget v0, p0, Lcom/android/zxing/YUVLuminanceSource;->mDataHeight:I

    return v0
.end method

.method public getDataWidth()I
    .locals 1

    .line 86
    iget v0, p0, Lcom/android/zxing/YUVLuminanceSource;->mDataWidth:I

    return v0
.end method

.method public getMatrix()[B
    .locals 7

    .line 51
    invoke-virtual {p0}, Lcom/android/zxing/YUVLuminanceSource;->getWidth()I

    move-result v0

    .line 52
    invoke-virtual {p0}, Lcom/android/zxing/YUVLuminanceSource;->getHeight()I

    move-result v1

    .line 56
    iget v2, p0, Lcom/android/zxing/YUVLuminanceSource;->mDataWidth:I

    if-ne v0, v2, :cond_0

    iget v2, p0, Lcom/android/zxing/YUVLuminanceSource;->mDataHeight:I

    if-ne v1, v2, :cond_0

    .line 57
    iget-object v0, p0, Lcom/android/zxing/YUVLuminanceSource;->mYUVData:[B

    return-object v0

    .line 60
    :cond_0
    mul-int v2, v0, v1

    .line 61
    new-array v3, v2, [B

    .line 62
    iget v4, p0, Lcom/android/zxing/YUVLuminanceSource;->mTop:I

    iget v5, p0, Lcom/android/zxing/YUVLuminanceSource;->mDataWidth:I

    mul-int/2addr v4, v5

    iget v5, p0, Lcom/android/zxing/YUVLuminanceSource;->mLeft:I

    add-int/2addr v4, v5

    .line 65
    iget v5, p0, Lcom/android/zxing/YUVLuminanceSource;->mDataWidth:I

    const/4 v6, 0x0

    if-ne v0, v5, :cond_1

    .line 66
    iget-object v0, p0, Lcom/android/zxing/YUVLuminanceSource;->mYUVData:[B

    invoke-static {v0, v4, v3, v6, v2}, Ljava/lang/System;->arraycopy([BI[BII)V

    .line 67
    return-object v3

    .line 71
    :cond_1
    iget-object v2, p0, Lcom/android/zxing/YUVLuminanceSource;->mYUVData:[B

    .line 72
    :goto_0
    if-ge v6, v1, :cond_2

    .line 73
    mul-int v5, v6, v0

    .line 74
    invoke-static {v2, v4, v3, v5, v0}, Ljava/lang/System;->arraycopy([BI[BII)V

    .line 75
    iget v5, p0, Lcom/android/zxing/YUVLuminanceSource;->mDataWidth:I

    add-int/2addr v4, v5

    .line 72
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 77
    :cond_2
    return-object v3
.end method

.method public getRow(I[B)[B
    .locals 3

    .line 37
    if-ltz p1, :cond_2

    invoke-virtual {p0}, Lcom/android/zxing/YUVLuminanceSource;->getHeight()I

    move-result v0

    if-ge p1, v0, :cond_2

    .line 40
    invoke-virtual {p0}, Lcom/android/zxing/YUVLuminanceSource;->getWidth()I

    move-result v0

    .line 41
    if-eqz p2, :cond_0

    array-length v1, p2

    if-ge v1, v0, :cond_1

    .line 42
    :cond_0
    new-array p2, v0, [B

    .line 44
    :cond_1
    iget v1, p0, Lcom/android/zxing/YUVLuminanceSource;->mTop:I

    add-int/2addr p1, v1

    iget v1, p0, Lcom/android/zxing/YUVLuminanceSource;->mDataWidth:I

    mul-int/2addr p1, v1

    iget v1, p0, Lcom/android/zxing/YUVLuminanceSource;->mLeft:I

    add-int/2addr p1, v1

    .line 45
    iget-object v1, p0, Lcom/android/zxing/YUVLuminanceSource;->mYUVData:[B

    const/4 v2, 0x0

    invoke-static {v1, p1, p2, v2, v0}, Ljava/lang/System;->arraycopy([BI[BII)V

    .line 46
    return-object p2

    .line 38
    :cond_2
    new-instance p2, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Requested row is outside the image: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public isCropSupported()Z
    .locals 1

    .line 82
    const/4 v0, 0x1

    return v0
.end method

.method public renderCroppedGreyscaleBitmap()Landroid/graphics/Bitmap;
    .locals 13

    .line 94
    invoke-virtual {p0}, Lcom/android/zxing/YUVLuminanceSource;->getWidth()I

    move-result v6

    .line 95
    invoke-virtual {p0}, Lcom/android/zxing/YUVLuminanceSource;->getHeight()I

    move-result v7

    .line 96
    mul-int v0, v6, v7

    new-array v1, v0, [I

    .line 97
    iget-object v0, p0, Lcom/android/zxing/YUVLuminanceSource;->mYUVData:[B

    .line 98
    iget v2, p0, Lcom/android/zxing/YUVLuminanceSource;->mTop:I

    iget v3, p0, Lcom/android/zxing/YUVLuminanceSource;->mDataWidth:I

    mul-int/2addr v2, v3

    iget v3, p0, Lcom/android/zxing/YUVLuminanceSource;->mLeft:I

    add-int/2addr v2, v3

    .line 100
    const/4 v3, 0x0

    move v4, v2

    move v2, v3

    :goto_0
    if-ge v2, v7, :cond_1

    .line 101
    mul-int v5, v2, v6

    .line 102
    move v8, v3

    :goto_1
    if-ge v8, v6, :cond_0

    .line 103
    add-int v9, v4, v8

    aget-byte v9, v0, v9

    and-int/lit16 v9, v9, 0xff

    .line 104
    add-int v10, v5, v8

    const/high16 v11, -0x1000000

    const v12, 0x10101

    mul-int/2addr v9, v12

    or-int/2addr v9, v11

    aput v9, v1, v10

    .line 102
    add-int/lit8 v8, v8, 0x1

    goto :goto_1

    .line 106
    :cond_0
    iget v5, p0, Lcom/android/zxing/YUVLuminanceSource;->mDataWidth:I

    add-int/2addr v4, v5

    .line 100
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 109
    :cond_1
    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v6, v7, v0}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v8

    .line 110
    const/4 v2, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v0, v8

    move v3, v6

    invoke-virtual/range {v0 .. v7}, Landroid/graphics/Bitmap;->setPixels([IIIIIII)V

    .line 111
    return-object v8
.end method
