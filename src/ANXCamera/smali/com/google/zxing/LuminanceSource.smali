.class public abstract Lcom/google/zxing/LuminanceSource;
.super Ljava/lang/Object;
.source "LuminanceSource.java"


# instance fields
.field private final height:I

.field private final width:I


# direct methods
.method protected constructor <init>(II)V
    .registers 3
    .param p1, "width"    # I
    .param p2, "height"    # I

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    iput p1, p0, Lcom/google/zxing/LuminanceSource;->width:I

    .line 35
    iput p2, p0, Lcom/google/zxing/LuminanceSource;->height:I

    .line 36
    return-void
.end method


# virtual methods
.method public crop(IIII)Lcom/google/zxing/LuminanceSource;
    .registers 7
    .param p1, "left"    # I
    .param p2, "top"    # I
    .param p3, "width"    # I
    .param p4, "height"    # I

    .line 94
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "This luminance source does not support cropping."

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final getHeight()I
    .registers 2

    .line 73
    iget v0, p0, Lcom/google/zxing/LuminanceSource;->height:I

    return v0
.end method

.method public abstract getMatrix()[B
.end method

.method public abstract getRow(I[B)[B
.end method

.method public final getWidth()I
    .registers 2

    .line 66
    iget v0, p0, Lcom/google/zxing/LuminanceSource;->width:I

    return v0
.end method

.method public invert()Lcom/google/zxing/LuminanceSource;
    .registers 2

    .line 109
    new-instance v0, Lcom/google/zxing/InvertedLuminanceSource;

    invoke-direct {v0, p0}, Lcom/google/zxing/InvertedLuminanceSource;-><init>(Lcom/google/zxing/LuminanceSource;)V

    return-object v0
.end method

.method public isCropSupported()Z
    .registers 2

    .line 80
    const/4 v0, 0x0

    return v0
.end method

.method public isRotateSupported()Z
    .registers 2

    .line 101
    const/4 v0, 0x0

    return v0
.end method

.method public rotateCounterClockwise()Lcom/google/zxing/LuminanceSource;
    .registers 3

    .line 119
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "This luminance source does not support rotation by 90 degrees."

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public rotateCounterClockwise45()Lcom/google/zxing/LuminanceSource;
    .registers 3

    .line 129
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "This luminance source does not support rotation by 45 degrees."

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final toString()Ljava/lang/String;
    .registers 7

    .line 134
    iget v0, p0, Lcom/google/zxing/LuminanceSource;->width:I

    new-array v0, v0, [B

    .line 135
    .local v0, "row":[B
    new-instance v1, Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/google/zxing/LuminanceSource;->height:I

    iget v3, p0, Lcom/google/zxing/LuminanceSource;->width:I

    add-int/lit8 v3, v3, 0x1

    mul-int/2addr v2, v3

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 136
    .local v1, "result":Ljava/lang/StringBuilder;
    const/4 v2, 0x0

    .local v2, "y":I
    :goto_11
    iget v3, p0, Lcom/google/zxing/LuminanceSource;->height:I

    if-lt v2, v3, :cond_1a

    .line 154
    .end local v2    # "y":I
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 137
    .restart local v2    # "y":I
    :cond_1a
    invoke-virtual {p0, v2, v0}, Lcom/google/zxing/LuminanceSource;->getRow(I[B)[B

    move-result-object v0

    .line 138
    const/4 v3, 0x0

    .local v3, "x":I
    :goto_1f
    iget v4, p0, Lcom/google/zxing/LuminanceSource;->width:I

    if-lt v3, v4, :cond_2b

    .line 152
    .end local v3    # "x":I
    const/16 v3, 0xa

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 136
    add-int/lit8 v2, v2, 0x1

    goto :goto_11

    .line 139
    .restart local v3    # "x":I
    :cond_2b
    aget-byte v4, v0, v3

    and-int/lit16 v4, v4, 0xff

    .line 141
    .local v4, "luminance":I
    const/16 v5, 0x40

    if-ge v4, v5, :cond_36

    .line 142
    const/16 v5, 0x23

    .line 143
    .local v5, "c":C
    goto :goto_46

    .end local v5    # "c":C
    :cond_36
    const/16 v5, 0x80

    if-ge v4, v5, :cond_3d

    .line 144
    const/16 v5, 0x2b

    .line 145
    .restart local v5    # "c":C
    goto :goto_46

    .end local v5    # "c":C
    :cond_3d
    const/16 v5, 0xc0

    if-ge v4, v5, :cond_44

    .line 146
    const/16 v5, 0x2e

    .line 147
    .restart local v5    # "c":C
    goto :goto_46

    .line 148
    .end local v5    # "c":C
    :cond_44
    const/16 v5, 0x20

    .line 150
    .restart local v5    # "c":C
    :goto_46
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 138
    .end local v4    # "luminance":I
    .end local v5    # "c":C
    add-int/lit8 v3, v3, 0x1

    goto :goto_1f
.end method
