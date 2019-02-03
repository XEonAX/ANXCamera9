.class public final Lcom/google/zxing/common/BitMatrix;
.super Ljava/lang/Object;
.source "BitMatrix.java"

# interfaces
.implements Ljava/lang/Cloneable;


# instance fields
.field private final bits:[I

.field private final height:I

.field private final rowSize:I

.field private final width:I


# direct methods
.method public constructor <init>(I)V
    .registers 2
    .param p1, "dimension"    # I

    .line 45
    invoke-direct {p0, p1, p1}, Lcom/google/zxing/common/BitMatrix;-><init>(II)V

    .line 46
    return-void
.end method

.method public constructor <init>(II)V
    .registers 5
    .param p1, "width"    # I
    .param p2, "height"    # I

    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    const/4 v0, 0x1

    if-lt p1, v0, :cond_1a

    if-lt p2, v0, :cond_1a

    .line 52
    iput p1, p0, Lcom/google/zxing/common/BitMatrix;->width:I

    .line 53
    iput p2, p0, Lcom/google/zxing/common/BitMatrix;->height:I

    .line 54
    add-int/lit8 v0, p1, 0x1f

    div-int/lit8 v0, v0, 0x20

    iput v0, p0, Lcom/google/zxing/common/BitMatrix;->rowSize:I

    .line 55
    iget v0, p0, Lcom/google/zxing/common/BitMatrix;->rowSize:I

    mul-int/2addr v0, p2

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/google/zxing/common/BitMatrix;->bits:[I

    .line 56
    return-void

    .line 50
    :cond_1a
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Both dimensions must be greater than 0"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private constructor <init>(III[I)V
    .registers 5
    .param p1, "width"    # I
    .param p2, "height"    # I
    .param p3, "rowSize"    # I
    .param p4, "bits"    # [I

    .line 58
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 59
    iput p1, p0, Lcom/google/zxing/common/BitMatrix;->width:I

    .line 60
    iput p2, p0, Lcom/google/zxing/common/BitMatrix;->height:I

    .line 61
    iput p3, p0, Lcom/google/zxing/common/BitMatrix;->rowSize:I

    .line 62
    iput-object p4, p0, Lcom/google/zxing/common/BitMatrix;->bits:[I

    .line 63
    return-void
.end method


# virtual methods
.method public clear()V
    .registers 5

    .line 103
    iget-object v0, p0, Lcom/google/zxing/common/BitMatrix;->bits:[I

    array-length v0, v0

    .line 104
    .local v0, "max":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_4
    if-lt v1, v0, :cond_7

    .line 107
    .end local v1    # "i":I
    return-void

    .line 105
    .restart local v1    # "i":I
    :cond_7
    iget-object v2, p0, Lcom/google/zxing/common/BitMatrix;->bits:[I

    const/4 v3, 0x0

    aput v3, v2, v1

    .line 104
    add-int/lit8 v1, v1, 0x1

    goto :goto_4
.end method

.method public clone()Lcom/google/zxing/common/BitMatrix;
    .registers 6

    .line 332
    new-instance v0, Lcom/google/zxing/common/BitMatrix;

    iget v1, p0, Lcom/google/zxing/common/BitMatrix;->width:I

    iget v2, p0, Lcom/google/zxing/common/BitMatrix;->height:I

    iget v3, p0, Lcom/google/zxing/common/BitMatrix;->rowSize:I

    iget-object v4, p0, Lcom/google/zxing/common/BitMatrix;->bits:[I

    invoke-virtual {v4}, [I->clone()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [I

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/google/zxing/common/BitMatrix;-><init>(III[I)V

    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/google/zxing/common/BitMatrix;->clone()Lcom/google/zxing/common/BitMatrix;

    move-result-object v0

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 6
    .param p1, "o"    # Ljava/lang/Object;

    .line 300
    instance-of v0, p1, Lcom/google/zxing/common/BitMatrix;

    const/4 v1, 0x0

    if-nez v0, :cond_6

    .line 301
    return v1

    .line 303
    :cond_6
    move-object v0, p1

    check-cast v0, Lcom/google/zxing/common/BitMatrix;

    .line 304
    .local v0, "other":Lcom/google/zxing/common/BitMatrix;
    iget v2, p0, Lcom/google/zxing/common/BitMatrix;->width:I

    iget v3, v0, Lcom/google/zxing/common/BitMatrix;->width:I

    if-ne v2, v3, :cond_26

    iget v2, p0, Lcom/google/zxing/common/BitMatrix;->height:I

    iget v3, v0, Lcom/google/zxing/common/BitMatrix;->height:I

    if-ne v2, v3, :cond_26

    iget v2, p0, Lcom/google/zxing/common/BitMatrix;->rowSize:I

    iget v3, v0, Lcom/google/zxing/common/BitMatrix;->rowSize:I

    if-ne v2, v3, :cond_26

    .line 305
    iget-object v2, p0, Lcom/google/zxing/common/BitMatrix;->bits:[I

    iget-object v3, v0, Lcom/google/zxing/common/BitMatrix;->bits:[I

    invoke-static {v2, v3}, Ljava/util/Arrays;->equals([I[I)Z

    move-result v2

    if-eqz v2, :cond_26

    .line 304
    const/4 v1, 0x1

    :cond_26
    return v1
.end method

.method public flip(II)V
    .registers 8
    .param p1, "x"    # I
    .param p2, "y"    # I

    .line 95
    iget v0, p0, Lcom/google/zxing/common/BitMatrix;->rowSize:I

    mul-int/2addr v0, p2

    div-int/lit8 v1, p1, 0x20

    add-int/2addr v0, v1

    .line 96
    .local v0, "offset":I
    iget-object v1, p0, Lcom/google/zxing/common/BitMatrix;->bits:[I

    aget v2, v1, v0

    and-int/lit8 v3, p1, 0x1f

    const/4 v4, 0x1

    shl-int v3, v4, v3

    xor-int/2addr v2, v3

    aput v2, v1, v0

    .line 97
    return-void
.end method

.method public get(II)Z
    .registers 6
    .param p1, "x"    # I
    .param p2, "y"    # I

    .line 73
    iget v0, p0, Lcom/google/zxing/common/BitMatrix;->rowSize:I

    mul-int/2addr v0, p2

    div-int/lit8 v1, p1, 0x20

    add-int/2addr v0, v1

    .line 74
    .local v0, "offset":I
    iget-object v1, p0, Lcom/google/zxing/common/BitMatrix;->bits:[I

    aget v1, v1, v0

    and-int/lit8 v2, p1, 0x1f

    ushr-int/2addr v1, v2

    const/4 v2, 0x1

    and-int/2addr v1, v2

    if-eqz v1, :cond_12

    return v2

    :cond_12
    const/4 v1, 0x0

    return v1
.end method

.method public getBottomRightOnBit()[I
    .registers 9

    .line 263
    iget-object v0, p0, Lcom/google/zxing/common/BitMatrix;->bits:[I

    array-length v0, v0

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    .line 264
    .local v0, "bitsOffset":I
    :goto_5
    if-ltz v0, :cond_11

    iget-object v2, p0, Lcom/google/zxing/common/BitMatrix;->bits:[I

    aget v2, v2, v0

    if-eqz v2, :cond_e

    goto :goto_11

    .line 265
    :cond_e
    add-int/lit8 v0, v0, -0x1

    goto :goto_5

    .line 267
    :cond_11
    :goto_11
    if-gez v0, :cond_15

    .line 268
    const/4 v1, 0x0

    return-object v1

    .line 271
    :cond_15
    iget v2, p0, Lcom/google/zxing/common/BitMatrix;->rowSize:I

    div-int v2, v0, v2

    .line 272
    .local v2, "y":I
    iget v3, p0, Lcom/google/zxing/common/BitMatrix;->rowSize:I

    rem-int v3, v0, v3

    mul-int/lit8 v3, v3, 0x20

    .line 274
    .local v3, "x":I
    iget-object v4, p0, Lcom/google/zxing/common/BitMatrix;->bits:[I

    aget v4, v4, v0

    .line 275
    .local v4, "theBits":I
    const/16 v5, 0x1f

    .line 276
    .local v5, "bit":I
    :goto_25
    ushr-int v6, v4, v5

    if-eqz v6, :cond_33

    .line 279
    add-int/2addr v3, v5

    .line 281
    const/4 v6, 0x2

    new-array v6, v6, [I

    const/4 v7, 0x0

    aput v3, v6, v7

    aput v2, v6, v1

    return-object v6

    .line 277
    :cond_33
    add-int/lit8 v5, v5, -0x1

    goto :goto_25
.end method

.method public getEnclosingRectangle()[I
    .registers 10

    .line 190
    iget v0, p0, Lcom/google/zxing/common/BitMatrix;->width:I

    .line 191
    .local v0, "left":I
    iget v1, p0, Lcom/google/zxing/common/BitMatrix;->height:I

    .line 192
    .local v1, "top":I
    const/4 v2, -0x1

    .line 193
    .local v2, "right":I
    const/4 v3, -0x1

    .line 195
    .local v3, "bottom":I
    const/4 v4, 0x0

    .local v4, "y":I
    :goto_7
    iget v5, p0, Lcom/google/zxing/common/BitMatrix;->height:I

    if-lt v4, v5, :cond_26

    .line 227
    .end local v4    # "y":I
    sub-int v4, v2, v0

    .line 228
    .local v4, "width":I
    sub-int v5, v3, v1

    .line 230
    .local v5, "height":I
    if-ltz v4, :cond_24

    if-gez v5, :cond_14

    goto :goto_24

    .line 234
    :cond_14
    const/4 v6, 0x4

    new-array v6, v6, [I

    const/4 v7, 0x0

    aput v0, v6, v7

    const/4 v7, 0x1

    aput v1, v6, v7

    const/4 v7, 0x2

    aput v4, v6, v7

    const/4 v7, 0x3

    aput v5, v6, v7

    return-object v6

    .line 231
    :cond_24
    :goto_24
    const/4 v6, 0x0

    return-object v6

    .line 196
    .end local v5    # "height":I
    .local v4, "y":I
    :cond_26
    const/4 v5, 0x0

    .local v5, "x32":I
    :goto_27
    iget v6, p0, Lcom/google/zxing/common/BitMatrix;->rowSize:I

    if-lt v5, v6, :cond_2e

    .line 195
    .end local v5    # "x32":I
    add-int/lit8 v4, v4, 0x1

    goto :goto_7

    .line 197
    .restart local v5    # "x32":I
    :cond_2e
    iget-object v6, p0, Lcom/google/zxing/common/BitMatrix;->bits:[I

    iget v7, p0, Lcom/google/zxing/common/BitMatrix;->rowSize:I

    mul-int/2addr v7, v4

    add-int/2addr v7, v5

    aget v6, v6, v7

    .line 198
    .local v6, "theBits":I
    if-eqz v6, :cond_6f

    .line 199
    if-ge v4, v1, :cond_3b

    .line 200
    move v1, v4

    .line 202
    :cond_3b
    if-le v4, v3, :cond_3e

    .line 203
    move v3, v4

    .line 205
    :cond_3e
    mul-int/lit8 v7, v5, 0x20

    if-ge v7, v0, :cond_56

    .line 206
    const/4 v7, 0x0

    .line 207
    .local v7, "bit":I
    :goto_43
    rsub-int/lit8 v8, v7, 0x1f

    shl-int v8, v6, v8

    if-eqz v8, :cond_53

    .line 210
    mul-int/lit8 v8, v5, 0x20

    add-int/2addr v8, v7

    if-ge v8, v0, :cond_56

    .line 211
    mul-int/lit8 v8, v5, 0x20

    add-int/2addr v8, v7

    .line 214
    .end local v0    # "left":I
    .end local v7    # "bit":I
    .local v8, "left":I
    move v0, v8

    goto :goto_56

    .line 208
    .end local v8    # "left":I
    .restart local v0    # "left":I
    .restart local v7    # "bit":I
    :cond_53
    add-int/lit8 v7, v7, 0x1

    goto :goto_43

    .line 214
    .end local v7    # "bit":I
    :cond_56
    :goto_56
    mul-int/lit8 v7, v5, 0x20

    add-int/lit8 v7, v7, 0x1f

    if-le v7, v2, :cond_6f

    .line 215
    const/16 v7, 0x1f

    .line 216
    .restart local v7    # "bit":I
    :goto_5e
    ushr-int v8, v6, v7

    if-eqz v8, :cond_6c

    .line 219
    mul-int/lit8 v8, v5, 0x20

    add-int/2addr v8, v7

    if-le v8, v2, :cond_6f

    .line 220
    mul-int/lit8 v8, v5, 0x20

    add-int v2, v8, v7

    .end local v6    # "theBits":I
    .end local v7    # "bit":I
    goto :goto_6f

    .line 217
    .restart local v6    # "theBits":I
    .restart local v7    # "bit":I
    :cond_6c
    add-int/lit8 v7, v7, -0x1

    goto :goto_5e

    .line 196
    .end local v6    # "theBits":I
    .end local v7    # "bit":I
    :cond_6f
    :goto_6f
    add-int/lit8 v5, v5, 0x1

    goto :goto_27
.end method

.method public getHeight()I
    .registers 2

    .line 295
    iget v0, p0, Lcom/google/zxing/common/BitMatrix;->height:I

    return v0
.end method

.method public getRow(ILcom/google/zxing/common/BitArray;)Lcom/google/zxing/common/BitArray;
    .registers 8
    .param p1, "y"    # I
    .param p2, "row"    # Lcom/google/zxing/common/BitArray;

    .line 146
    if-eqz p2, :cond_f

    invoke-virtual {p2}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v0

    iget v1, p0, Lcom/google/zxing/common/BitMatrix;->width:I

    if-ge v0, v1, :cond_b

    goto :goto_f

    .line 149
    :cond_b
    invoke-virtual {p2}, Lcom/google/zxing/common/BitArray;->clear()V

    goto :goto_18

    .line 147
    :cond_f
    :goto_f
    new-instance v0, Lcom/google/zxing/common/BitArray;

    iget v1, p0, Lcom/google/zxing/common/BitMatrix;->width:I

    invoke-direct {v0, v1}, Lcom/google/zxing/common/BitArray;-><init>(I)V

    move-object p2, v0

    .line 148
    nop

    .line 151
    :goto_18
    iget v0, p0, Lcom/google/zxing/common/BitMatrix;->rowSize:I

    mul-int/2addr v0, p1

    .line 152
    .local v0, "offset":I
    const/4 v1, 0x0

    .local v1, "x":I
    :goto_1c
    iget v2, p0, Lcom/google/zxing/common/BitMatrix;->rowSize:I

    if-lt v1, v2, :cond_21

    .line 155
    .end local v1    # "x":I
    return-object p2

    .line 153
    .restart local v1    # "x":I
    :cond_21
    mul-int/lit8 v2, v1, 0x20

    iget-object v3, p0, Lcom/google/zxing/common/BitMatrix;->bits:[I

    add-int v4, v0, v1

    aget v3, v3, v4

    invoke-virtual {p2, v2, v3}, Lcom/google/zxing/common/BitArray;->setBulk(II)V

    .line 152
    add-int/lit8 v1, v1, 0x1

    goto :goto_1c
.end method

.method public getTopLeftOnBit()[I
    .registers 8

    .line 243
    const/4 v0, 0x0

    .line 244
    .local v0, "bitsOffset":I
    :goto_1
    iget-object v1, p0, Lcom/google/zxing/common/BitMatrix;->bits:[I

    array-length v1, v1

    if-ge v0, v1, :cond_10

    iget-object v1, p0, Lcom/google/zxing/common/BitMatrix;->bits:[I

    aget v1, v1, v0

    if-eqz v1, :cond_d

    goto :goto_10

    .line 245
    :cond_d
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 247
    :cond_10
    :goto_10
    iget-object v1, p0, Lcom/google/zxing/common/BitMatrix;->bits:[I

    array-length v1, v1

    if-ne v0, v1, :cond_17

    .line 248
    const/4 v1, 0x0

    return-object v1

    .line 250
    :cond_17
    iget v1, p0, Lcom/google/zxing/common/BitMatrix;->rowSize:I

    div-int v1, v0, v1

    .line 251
    .local v1, "y":I
    iget v2, p0, Lcom/google/zxing/common/BitMatrix;->rowSize:I

    rem-int v2, v0, v2

    mul-int/lit8 v2, v2, 0x20

    .line 253
    .local v2, "x":I
    iget-object v3, p0, Lcom/google/zxing/common/BitMatrix;->bits:[I

    aget v3, v3, v0

    .line 254
    .local v3, "theBits":I
    const/4 v4, 0x0

    .line 255
    .local v4, "bit":I
    :goto_26
    rsub-int/lit8 v5, v4, 0x1f

    shl-int v5, v3, v5

    if-eqz v5, :cond_37

    .line 258
    add-int/2addr v2, v4

    .line 259
    const/4 v5, 0x2

    new-array v5, v5, [I

    const/4 v6, 0x0

    aput v2, v5, v6

    const/4 v6, 0x1

    aput v1, v5, v6

    return-object v5

    .line 256
    :cond_37
    add-int/lit8 v4, v4, 0x1

    goto :goto_26
.end method

.method public getWidth()I
    .registers 2

    .line 288
    iget v0, p0, Lcom/google/zxing/common/BitMatrix;->width:I

    return v0
.end method

.method public hashCode()I
    .registers 5

    .line 310
    iget v0, p0, Lcom/google/zxing/common/BitMatrix;->width:I

    .line 311
    .local v0, "hash":I
    const/16 v1, 0x1f

    mul-int v2, v1, v0

    iget v3, p0, Lcom/google/zxing/common/BitMatrix;->width:I

    add-int/2addr v2, v3

    .line 312
    .end local v0    # "hash":I
    .local v2, "hash":I
    mul-int v0, v1, v2

    iget v3, p0, Lcom/google/zxing/common/BitMatrix;->height:I

    add-int/2addr v0, v3

    .line 313
    .end local v2    # "hash":I
    .restart local v0    # "hash":I
    mul-int v2, v1, v0

    iget v3, p0, Lcom/google/zxing/common/BitMatrix;->rowSize:I

    add-int/2addr v2, v3

    .line 314
    .end local v0    # "hash":I
    .restart local v2    # "hash":I
    mul-int/2addr v1, v2

    iget-object v0, p0, Lcom/google/zxing/common/BitMatrix;->bits:[I

    invoke-static {v0}, Ljava/util/Arrays;->hashCode([I)I

    move-result v0

    add-int/2addr v1, v0

    .line 315
    .end local v2    # "hash":I
    .local v1, "hash":I
    return v1
.end method

.method public rotate180()V
    .registers 7

    .line 170
    invoke-virtual {p0}, Lcom/google/zxing/common/BitMatrix;->getWidth()I

    move-result v0

    .line 171
    .local v0, "width":I
    invoke-virtual {p0}, Lcom/google/zxing/common/BitMatrix;->getHeight()I

    move-result v1

    .line 172
    .local v1, "height":I
    new-instance v2, Lcom/google/zxing/common/BitArray;

    invoke-direct {v2, v0}, Lcom/google/zxing/common/BitArray;-><init>(I)V

    .line 173
    .local v2, "topRow":Lcom/google/zxing/common/BitArray;
    new-instance v3, Lcom/google/zxing/common/BitArray;

    invoke-direct {v3, v0}, Lcom/google/zxing/common/BitArray;-><init>(I)V

    .line 174
    .local v3, "bottomRow":Lcom/google/zxing/common/BitArray;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_13
    add-int/lit8 v5, v1, 0x1

    div-int/lit8 v5, v5, 0x2

    if-lt v4, v5, :cond_1a

    .line 182
    .end local v4    # "i":I
    return-void

    .line 175
    .restart local v4    # "i":I
    :cond_1a
    invoke-virtual {p0, v4, v2}, Lcom/google/zxing/common/BitMatrix;->getRow(ILcom/google/zxing/common/BitArray;)Lcom/google/zxing/common/BitArray;

    move-result-object v2

    .line 176
    add-int/lit8 v5, v1, -0x1

    sub-int/2addr v5, v4

    invoke-virtual {p0, v5, v3}, Lcom/google/zxing/common/BitMatrix;->getRow(ILcom/google/zxing/common/BitArray;)Lcom/google/zxing/common/BitArray;

    move-result-object v3

    .line 177
    invoke-virtual {v2}, Lcom/google/zxing/common/BitArray;->reverse()V

    .line 178
    invoke-virtual {v3}, Lcom/google/zxing/common/BitArray;->reverse()V

    .line 179
    invoke-virtual {p0, v4, v3}, Lcom/google/zxing/common/BitMatrix;->setRow(ILcom/google/zxing/common/BitArray;)V

    .line 180
    add-int/lit8 v5, v1, -0x1

    sub-int/2addr v5, v4

    invoke-virtual {p0, v5, v2}, Lcom/google/zxing/common/BitMatrix;->setRow(ILcom/google/zxing/common/BitArray;)V

    .line 174
    add-int/lit8 v4, v4, 0x1

    goto :goto_13
.end method

.method public set(II)V
    .registers 8
    .param p1, "x"    # I
    .param p2, "y"    # I

    .line 84
    iget v0, p0, Lcom/google/zxing/common/BitMatrix;->rowSize:I

    mul-int/2addr v0, p2

    div-int/lit8 v1, p1, 0x20

    add-int/2addr v0, v1

    .line 85
    .local v0, "offset":I
    iget-object v1, p0, Lcom/google/zxing/common/BitMatrix;->bits:[I

    aget v2, v1, v0

    and-int/lit8 v3, p1, 0x1f

    const/4 v4, 0x1

    shl-int v3, v4, v3

    or-int/2addr v2, v3

    aput v2, v1, v0

    .line 86
    return-void
.end method

.method public setRegion(IIII)V
    .registers 15
    .param p1, "left"    # I
    .param p2, "top"    # I
    .param p3, "width"    # I
    .param p4, "height"    # I

    .line 118
    if-ltz p2, :cond_43

    if-ltz p1, :cond_43

    .line 121
    const/4 v0, 0x1

    if-lt p4, v0, :cond_3b

    if-lt p3, v0, :cond_3b

    .line 124
    add-int v1, p1, p3

    .line 125
    .local v1, "right":I
    add-int v2, p2, p4

    .line 126
    .local v2, "bottom":I
    iget v3, p0, Lcom/google/zxing/common/BitMatrix;->height:I

    if-gt v2, v3, :cond_33

    iget v3, p0, Lcom/google/zxing/common/BitMatrix;->width:I

    if-gt v1, v3, :cond_33

    .line 129
    move v3, p2

    .local v3, "y":I
    :goto_16
    if-lt v3, v2, :cond_19

    .line 135
    .end local v3    # "y":I
    return-void

    .line 130
    .restart local v3    # "y":I
    :cond_19
    iget v4, p0, Lcom/google/zxing/common/BitMatrix;->rowSize:I

    mul-int/2addr v4, v3

    .line 131
    .local v4, "offset":I
    move v5, p1

    .local v5, "x":I
    :goto_1d
    if-lt v5, v1, :cond_22

    .line 129
    .end local v4    # "offset":I
    .end local v5    # "x":I
    add-int/lit8 v3, v3, 0x1

    goto :goto_16

    .line 132
    .restart local v4    # "offset":I
    .restart local v5    # "x":I
    :cond_22
    iget-object v6, p0, Lcom/google/zxing/common/BitMatrix;->bits:[I

    div-int/lit8 v7, v5, 0x20

    add-int/2addr v7, v4

    aget v8, v6, v7

    and-int/lit8 v9, v5, 0x1f

    shl-int v9, v0, v9

    or-int/2addr v8, v9

    aput v8, v6, v7

    .line 131
    add-int/lit8 v5, v5, 0x1

    goto :goto_1d

    .line 127
    .end local v3    # "y":I
    .end local v4    # "offset":I
    .end local v5    # "x":I
    :cond_33
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v3, "The region must fit inside the matrix"

    invoke-direct {v0, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 122
    .end local v1    # "right":I
    .end local v2    # "bottom":I
    :cond_3b
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Height and width must be at least 1"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 119
    :cond_43
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Left and top must be nonnegative"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setRow(ILcom/google/zxing/common/BitArray;)V
    .registers 8
    .param p1, "y"    # I
    .param p2, "row"    # Lcom/google/zxing/common/BitArray;

    .line 163
    invoke-virtual {p2}, Lcom/google/zxing/common/BitArray;->getBitArray()[I

    move-result-object v0

    iget-object v1, p0, Lcom/google/zxing/common/BitMatrix;->bits:[I

    iget v2, p0, Lcom/google/zxing/common/BitMatrix;->rowSize:I

    mul-int/2addr v2, p1

    iget v3, p0, Lcom/google/zxing/common/BitMatrix;->rowSize:I

    const/4 v4, 0x0

    invoke-static {v0, v4, v1, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 164
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 5

    .line 320
    new-instance v0, Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/google/zxing/common/BitMatrix;->height:I

    iget v2, p0, Lcom/google/zxing/common/BitMatrix;->width:I

    add-int/lit8 v2, v2, 0x1

    mul-int/2addr v1, v2

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 321
    .local v0, "result":Ljava/lang/StringBuilder;
    const/4 v1, 0x0

    .local v1, "y":I
    :goto_d
    iget v2, p0, Lcom/google/zxing/common/BitMatrix;->height:I

    if-lt v1, v2, :cond_16

    .line 327
    .end local v1    # "y":I
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 322
    .restart local v1    # "y":I
    :cond_16
    const/4 v2, 0x0

    .local v2, "x":I
    :goto_17
    iget v3, p0, Lcom/google/zxing/common/BitMatrix;->width:I

    if-lt v2, v3, :cond_23

    .line 325
    .end local v2    # "x":I
    const/16 v2, 0xa

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 321
    add-int/lit8 v1, v1, 0x1

    goto :goto_d

    .line 323
    .restart local v2    # "x":I
    :cond_23
    invoke-virtual {p0, v2, v1}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v3

    if-eqz v3, :cond_2c

    const-string v3, "X "

    goto :goto_2e

    :cond_2c
    const-string v3, "  "

    :goto_2e
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 322
    add-int/lit8 v2, v2, 0x1

    goto :goto_17
.end method
