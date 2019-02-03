.class public final Lcom/google/zxing/PlanarYUVLuminanceSource;
.super Lcom/google/zxing/LuminanceSource;
.source "PlanarYUVLuminanceSource.java"


# static fields
.field private static final THUMBNAIL_SCALE_FACTOR:I = 0x2


# instance fields
.field private final dataHeight:I

.field private final dataWidth:I

.field private final left:I

.field private final top:I

.field private final yuvData:[B


# direct methods
.method public constructor <init>([BIIIIIIZ)V
    .registers 11
    .param p1, "yuvData"    # [B
    .param p2, "dataWidth"    # I
    .param p3, "dataHeight"    # I
    .param p4, "left"    # I
    .param p5, "top"    # I
    .param p6, "width"    # I
    .param p7, "height"    # I
    .param p8, "reverseHorizontal"    # Z

    .line 47
    invoke-direct {p0, p6, p7}, Lcom/google/zxing/LuminanceSource;-><init>(II)V

    .line 49
    add-int v0, p4, p6

    if-gt v0, p2, :cond_1b

    add-int v0, p5, p7

    if-gt v0, p3, :cond_1b

    .line 53
    iput-object p1, p0, Lcom/google/zxing/PlanarYUVLuminanceSource;->yuvData:[B

    .line 54
    iput p2, p0, Lcom/google/zxing/PlanarYUVLuminanceSource;->dataWidth:I

    .line 55
    iput p3, p0, Lcom/google/zxing/PlanarYUVLuminanceSource;->dataHeight:I

    .line 56
    iput p4, p0, Lcom/google/zxing/PlanarYUVLuminanceSource;->left:I

    .line 57
    iput p5, p0, Lcom/google/zxing/PlanarYUVLuminanceSource;->top:I

    .line 58
    if-eqz p8, :cond_1a

    .line 59
    invoke-direct {p0, p6, p7}, Lcom/google/zxing/PlanarYUVLuminanceSource;->reverseHorizontal(II)V

    .line 61
    :cond_1a
    return-void

    .line 50
    :cond_1b
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Crop rectangle does not fit within image data."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private reverseHorizontal(II)V
    .registers 11
    .param p1, "width"    # I
    .param p2, "height"    # I

    .line 158
    iget-object v0, p0, Lcom/google/zxing/PlanarYUVLuminanceSource;->yuvData:[B

    .line 159
    .local v0, "yuvData":[B
    const/4 v1, 0x0

    .local v1, "y":I
    iget v2, p0, Lcom/google/zxing/PlanarYUVLuminanceSource;->top:I

    iget v3, p0, Lcom/google/zxing/PlanarYUVLuminanceSource;->dataWidth:I

    mul-int/2addr v2, v3

    iget v3, p0, Lcom/google/zxing/PlanarYUVLuminanceSource;->left:I

    add-int/2addr v2, v3

    .local v2, "rowStart":I
    :goto_b
    if-lt v1, p2, :cond_e

    .line 167
    .end local v1    # "y":I
    .end local v2    # "rowStart":I
    return-void

    .line 160
    .restart local v1    # "y":I
    .restart local v2    # "rowStart":I
    :cond_e
    div-int/lit8 v3, p1, 0x2

    add-int/2addr v3, v2

    .line 161
    .local v3, "middle":I
    move v4, v2

    .local v4, "x1":I
    add-int v5, v2, p1

    add-int/lit8 v5, v5, -0x1

    .local v5, "x2":I
    :goto_16
    if-lt v4, v3, :cond_1e

    .line 159
    .end local v3    # "middle":I
    .end local v4    # "x1":I
    .end local v5    # "x2":I
    add-int/lit8 v1, v1, 0x1

    iget v3, p0, Lcom/google/zxing/PlanarYUVLuminanceSource;->dataWidth:I

    add-int/2addr v2, v3

    goto :goto_b

    .line 162
    .restart local v3    # "middle":I
    .restart local v4    # "x1":I
    .restart local v5    # "x2":I
    :cond_1e
    aget-byte v6, v0, v4

    .line 163
    .local v6, "temp":B
    aget-byte v7, v0, v5

    aput-byte v7, v0, v4

    .line 164
    aput-byte v6, v0, v5

    .line 161
    .end local v6    # "temp":B
    add-int/lit8 v4, v4, 0x1

    add-int/lit8 v5, v5, -0x1

    goto :goto_16
.end method


# virtual methods
.method public crop(IIII)Lcom/google/zxing/LuminanceSource;
    .registers 15
    .param p1, "left"    # I
    .param p2, "top"    # I
    .param p3, "width"    # I
    .param p4, "height"    # I

    .line 115
    new-instance v9, Lcom/google/zxing/PlanarYUVLuminanceSource;

    iget-object v1, p0, Lcom/google/zxing/PlanarYUVLuminanceSource;->yuvData:[B

    .line 116
    iget v2, p0, Lcom/google/zxing/PlanarYUVLuminanceSource;->dataWidth:I

    .line 117
    iget v3, p0, Lcom/google/zxing/PlanarYUVLuminanceSource;->dataHeight:I

    .line 118
    iget v0, p0, Lcom/google/zxing/PlanarYUVLuminanceSource;->left:I

    add-int v4, v0, p1

    .line 119
    iget v0, p0, Lcom/google/zxing/PlanarYUVLuminanceSource;->top:I

    add-int v5, v0, p2

    .line 120
    nop

    .line 121
    nop

    .line 122
    nop

    .line 115
    const/4 v8, 0x0

    move-object v0, v9

    move v6, p3

    move v7, p4

    invoke-direct/range {v0 .. v8}, Lcom/google/zxing/PlanarYUVLuminanceSource;-><init>([BIIIIIIZ)V

    return-object v9
.end method

.method public getMatrix()[B
    .registers 10

    .line 79
    invoke-virtual {p0}, Lcom/google/zxing/PlanarYUVLuminanceSource;->getWidth()I

    move-result v0

    .line 80
    .local v0, "width":I
    invoke-virtual {p0}, Lcom/google/zxing/PlanarYUVLuminanceSource;->getHeight()I

    move-result v1

    .line 84
    .local v1, "height":I
    iget v2, p0, Lcom/google/zxing/PlanarYUVLuminanceSource;->dataWidth:I

    if-ne v0, v2, :cond_13

    iget v2, p0, Lcom/google/zxing/PlanarYUVLuminanceSource;->dataHeight:I

    if-ne v1, v2, :cond_13

    .line 85
    iget-object v2, p0, Lcom/google/zxing/PlanarYUVLuminanceSource;->yuvData:[B

    return-object v2

    .line 88
    :cond_13
    mul-int v2, v0, v1

    .line 89
    .local v2, "area":I
    new-array v3, v2, [B

    .line 90
    .local v3, "matrix":[B
    iget v4, p0, Lcom/google/zxing/PlanarYUVLuminanceSource;->top:I

    iget v5, p0, Lcom/google/zxing/PlanarYUVLuminanceSource;->dataWidth:I

    mul-int/2addr v4, v5

    iget v5, p0, Lcom/google/zxing/PlanarYUVLuminanceSource;->left:I

    add-int/2addr v4, v5

    .line 93
    .local v4, "inputOffset":I
    iget v5, p0, Lcom/google/zxing/PlanarYUVLuminanceSource;->dataWidth:I

    if-ne v0, v5, :cond_2a

    .line 94
    iget-object v5, p0, Lcom/google/zxing/PlanarYUVLuminanceSource;->yuvData:[B

    const/4 v6, 0x0

    invoke-static {v5, v4, v3, v6, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 95
    return-object v3

    .line 99
    :cond_2a
    iget-object v5, p0, Lcom/google/zxing/PlanarYUVLuminanceSource;->yuvData:[B

    .line 100
    .local v5, "yuv":[B
    const/4 v6, 0x0

    .local v6, "y":I
    :goto_2d
    if-lt v6, v1, :cond_30

    .line 105
    .end local v6    # "y":I
    return-object v3

    .line 101
    .restart local v6    # "y":I
    :cond_30
    mul-int v7, v6, v0

    .line 102
    .local v7, "outputOffset":I
    invoke-static {v5, v4, v3, v7, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 103
    iget v8, p0, Lcom/google/zxing/PlanarYUVLuminanceSource;->dataWidth:I

    add-int/2addr v4, v8

    .line 100
    .end local v7    # "outputOffset":I
    add-int/lit8 v6, v6, 0x1

    goto :goto_2d
.end method

.method public getRow(I[B)[B
    .registers 7
    .param p1, "y"    # I
    .param p2, "row"    # [B

    .line 65
    if-ltz p1, :cond_23

    invoke-virtual {p0}, Lcom/google/zxing/PlanarYUVLuminanceSource;->getHeight()I

    move-result v0

    if-ge p1, v0, :cond_23

    .line 68
    invoke-virtual {p0}, Lcom/google/zxing/PlanarYUVLuminanceSource;->getWidth()I

    move-result v0

    .line 69
    .local v0, "width":I
    if-eqz p2, :cond_11

    array-length v1, p2

    if-ge v1, v0, :cond_13

    .line 70
    :cond_11
    new-array p2, v0, [B

    .line 72
    :cond_13
    iget v1, p0, Lcom/google/zxing/PlanarYUVLuminanceSource;->top:I

    add-int/2addr v1, p1

    iget v2, p0, Lcom/google/zxing/PlanarYUVLuminanceSource;->dataWidth:I

    mul-int/2addr v1, v2

    iget v2, p0, Lcom/google/zxing/PlanarYUVLuminanceSource;->left:I

    add-int/2addr v1, v2

    .line 73
    .local v1, "offset":I
    iget-object v2, p0, Lcom/google/zxing/PlanarYUVLuminanceSource;->yuvData:[B

    const/4 v3, 0x0

    invoke-static {v2, v1, p2, v3, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 74
    return-object p2

    .line 66
    .end local v0    # "width":I
    .end local v1    # "offset":I
    :cond_23
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Requested row is outside the image: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getThumbnailHeight()I
    .registers 2

    .line 154
    invoke-virtual {p0}, Lcom/google/zxing/PlanarYUVLuminanceSource;->getHeight()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    return v0
.end method

.method public getThumbnailWidth()I
    .registers 2

    .line 147
    invoke-virtual {p0}, Lcom/google/zxing/PlanarYUVLuminanceSource;->getWidth()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    return v0
.end method

.method public isCropSupported()Z
    .registers 2

    .line 110
    const/4 v0, 0x1

    return v0
.end method

.method public renderThumbnail()[I
    .registers 13

    .line 126
    invoke-virtual {p0}, Lcom/google/zxing/PlanarYUVLuminanceSource;->getWidth()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    .line 127
    .local v0, "width":I
    invoke-virtual {p0}, Lcom/google/zxing/PlanarYUVLuminanceSource;->getHeight()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    .line 128
    .local v1, "height":I
    mul-int v2, v0, v1

    new-array v2, v2, [I

    .line 129
    .local v2, "pixels":[I
    iget-object v3, p0, Lcom/google/zxing/PlanarYUVLuminanceSource;->yuvData:[B

    .line 130
    .local v3, "yuv":[B
    iget v4, p0, Lcom/google/zxing/PlanarYUVLuminanceSource;->top:I

    iget v5, p0, Lcom/google/zxing/PlanarYUVLuminanceSource;->dataWidth:I

    mul-int/2addr v4, v5

    iget v5, p0, Lcom/google/zxing/PlanarYUVLuminanceSource;->left:I

    add-int/2addr v4, v5

    .line 132
    .local v4, "inputOffset":I
    const/4 v5, 0x0

    .local v5, "y":I
    :goto_1b
    if-lt v5, v1, :cond_1e

    .line 140
    .end local v5    # "y":I
    return-object v2

    .line 133
    .restart local v5    # "y":I
    :cond_1e
    mul-int v6, v5, v0

    .line 134
    .local v6, "outputOffset":I
    const/4 v7, 0x0

    .local v7, "x":I
    :goto_21
    if-lt v7, v0, :cond_2b

    .line 138
    .end local v7    # "x":I
    iget v7, p0, Lcom/google/zxing/PlanarYUVLuminanceSource;->dataWidth:I

    mul-int/lit8 v7, v7, 0x2

    add-int/2addr v4, v7

    .line 132
    .end local v6    # "outputOffset":I
    add-int/lit8 v5, v5, 0x1

    goto :goto_1b

    .line 135
    .restart local v6    # "outputOffset":I
    .restart local v7    # "x":I
    :cond_2b
    mul-int/lit8 v8, v7, 0x2

    add-int/2addr v8, v4

    aget-byte v8, v3, v8

    and-int/lit16 v8, v8, 0xff

    .line 136
    .local v8, "grey":I
    add-int v9, v6, v7

    const/high16 v10, -0x1000000

    const v11, 0x10101

    mul-int/2addr v11, v8

    or-int/2addr v10, v11

    aput v10, v2, v9

    .line 134
    .end local v8    # "grey":I
    add-int/lit8 v7, v7, 0x1

    goto :goto_21
.end method
