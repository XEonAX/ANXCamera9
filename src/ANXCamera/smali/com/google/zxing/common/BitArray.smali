.class public final Lcom/google/zxing/common/BitArray;
.super Ljava/lang/Object;
.source "BitArray.java"

# interfaces
.implements Ljava/lang/Cloneable;


# instance fields
.field private bits:[I

.field private size:I


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    const/4 v0, 0x0

    iput v0, p0, Lcom/google/zxing/common/BitArray;->size:I

    .line 33
    const/4 v0, 0x1

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/google/zxing/common/BitArray;->bits:[I

    .line 34
    return-void
.end method

.method public constructor <init>(I)V
    .registers 3
    .param p1, "size"    # I

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    iput p1, p0, Lcom/google/zxing/common/BitArray;->size:I

    .line 38
    invoke-static {p1}, Lcom/google/zxing/common/BitArray;->makeArray(I)[I

    move-result-object v0

    iput-object v0, p0, Lcom/google/zxing/common/BitArray;->bits:[I

    .line 39
    return-void
.end method

.method constructor <init>([II)V
    .registers 3
    .param p1, "bits"    # [I
    .param p2, "size"    # I

    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    iput-object p1, p0, Lcom/google/zxing/common/BitArray;->bits:[I

    .line 44
    iput p2, p0, Lcom/google/zxing/common/BitArray;->size:I

    .line 45
    return-void
.end method

.method private ensureCapacity(I)V
    .registers 6
    .param p1, "size"    # I

    .line 56
    iget-object v0, p0, Lcom/google/zxing/common/BitArray;->bits:[I

    array-length v0, v0

    mul-int/lit8 v0, v0, 0x20

    if-le p1, v0, :cond_16

    .line 57
    invoke-static {p1}, Lcom/google/zxing/common/BitArray;->makeArray(I)[I

    move-result-object v0

    .line 58
    .local v0, "newBits":[I
    iget-object v1, p0, Lcom/google/zxing/common/BitArray;->bits:[I

    iget-object v2, p0, Lcom/google/zxing/common/BitArray;->bits:[I

    array-length v2, v2

    const/4 v3, 0x0

    invoke-static {v1, v3, v0, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 59
    iput-object v0, p0, Lcom/google/zxing/common/BitArray;->bits:[I

    .line 61
    .end local v0    # "newBits":[I
    :cond_16
    return-void
.end method

.method private static makeArray(I)[I
    .registers 2
    .param p0, "size"    # I

    .line 341
    add-int/lit8 v0, p0, 0x1f

    div-int/lit8 v0, v0, 0x20

    new-array v0, v0, [I

    return-object v0
.end method


# virtual methods
.method public appendBit(Z)V
    .registers 7
    .param p1, "bit"    # Z

    .line 231
    iget v0, p0, Lcom/google/zxing/common/BitArray;->size:I

    const/4 v1, 0x1

    add-int/2addr v0, v1

    invoke-direct {p0, v0}, Lcom/google/zxing/common/BitArray;->ensureCapacity(I)V

    .line 232
    if-eqz p1, :cond_1a

    .line 233
    iget-object v0, p0, Lcom/google/zxing/common/BitArray;->bits:[I

    iget v2, p0, Lcom/google/zxing/common/BitArray;->size:I

    div-int/lit8 v2, v2, 0x20

    aget v3, v0, v2

    iget v4, p0, Lcom/google/zxing/common/BitArray;->size:I

    and-int/lit8 v4, v4, 0x1f

    shl-int v4, v1, v4

    or-int/2addr v3, v4

    aput v3, v0, v2

    .line 235
    :cond_1a
    iget v0, p0, Lcom/google/zxing/common/BitArray;->size:I

    add-int/2addr v0, v1

    iput v0, p0, Lcom/google/zxing/common/BitArray;->size:I

    .line 236
    return-void
.end method

.method public appendBitArray(Lcom/google/zxing/common/BitArray;)V
    .registers 5
    .param p1, "other"    # Lcom/google/zxing/common/BitArray;

    .line 257
    iget v0, p1, Lcom/google/zxing/common/BitArray;->size:I

    .line 258
    .local v0, "otherSize":I
    iget v1, p0, Lcom/google/zxing/common/BitArray;->size:I

    add-int/2addr v1, v0

    invoke-direct {p0, v1}, Lcom/google/zxing/common/BitArray;->ensureCapacity(I)V

    .line 259
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_9
    if-lt v1, v0, :cond_c

    .line 262
    .end local v1    # "i":I
    return-void

    .line 260
    .restart local v1    # "i":I
    :cond_c
    invoke-virtual {p1, v1}, Lcom/google/zxing/common/BitArray;->get(I)Z

    move-result v2

    invoke-virtual {p0, v2}, Lcom/google/zxing/common/BitArray;->appendBit(Z)V

    .line 259
    add-int/lit8 v1, v1, 0x1

    goto :goto_9
.end method

.method public appendBits(II)V
    .registers 6
    .param p1, "value"    # I
    .param p2, "numBits"    # I

    .line 247
    if-ltz p2, :cond_20

    const/16 v0, 0x20

    if-gt p2, v0, :cond_20

    .line 250
    iget v0, p0, Lcom/google/zxing/common/BitArray;->size:I

    add-int/2addr v0, p2

    invoke-direct {p0, v0}, Lcom/google/zxing/common/BitArray;->ensureCapacity(I)V

    .line 251
    move v0, p2

    .local v0, "numBitsLeft":I
    :goto_d
    if-gtz v0, :cond_10

    .line 254
    .end local v0    # "numBitsLeft":I
    return-void

    .line 252
    .restart local v0    # "numBitsLeft":I
    :cond_10
    add-int/lit8 v1, v0, -0x1

    shr-int v1, p1, v1

    const/4 v2, 0x1

    and-int/2addr v1, v2

    if-ne v1, v2, :cond_19

    goto :goto_1a

    :cond_19
    const/4 v2, 0x0

    :goto_1a
    invoke-virtual {p0, v2}, Lcom/google/zxing/common/BitArray;->appendBit(Z)V

    .line 251
    add-int/lit8 v0, v0, -0x1

    goto :goto_d

    .line 248
    .end local v0    # "numBitsLeft":I
    :cond_20
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Num bits must be between 0 and 32"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public clear()V
    .registers 5

    .line 183
    iget-object v0, p0, Lcom/google/zxing/common/BitArray;->bits:[I

    array-length v0, v0

    .line 184
    .local v0, "max":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_4
    if-lt v1, v0, :cond_7

    .line 187
    .end local v1    # "i":I
    return-void

    .line 185
    .restart local v1    # "i":I
    :cond_7
    iget-object v2, p0, Lcom/google/zxing/common/BitArray;->bits:[I

    const/4 v3, 0x0

    aput v3, v2, v1

    .line 184
    add-int/lit8 v1, v1, 0x1

    goto :goto_4
.end method

.method public clone()Lcom/google/zxing/common/BitArray;
    .registers 4

    .line 372
    new-instance v0, Lcom/google/zxing/common/BitArray;

    iget-object v1, p0, Lcom/google/zxing/common/BitArray;->bits:[I

    invoke-virtual {v1}, [I->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [I

    iget v2, p0, Lcom/google/zxing/common/BitArray;->size:I

    invoke-direct {v0, v1, v2}, Lcom/google/zxing/common/BitArray;-><init>([II)V

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
    invoke-virtual {p0}, Lcom/google/zxing/common/BitArray;->clone()Lcom/google/zxing/common/BitArray;

    move-result-object v0

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 6
    .param p1, "o"    # Ljava/lang/Object;

    .line 346
    instance-of v0, p1, Lcom/google/zxing/common/BitArray;

    const/4 v1, 0x0

    if-nez v0, :cond_6

    .line 347
    return v1

    .line 349
    :cond_6
    move-object v0, p1

    check-cast v0, Lcom/google/zxing/common/BitArray;

    .line 350
    .local v0, "other":Lcom/google/zxing/common/BitArray;
    iget v2, p0, Lcom/google/zxing/common/BitArray;->size:I

    iget v3, v0, Lcom/google/zxing/common/BitArray;->size:I

    if-ne v2, v3, :cond_1a

    iget-object v2, p0, Lcom/google/zxing/common/BitArray;->bits:[I

    iget-object v3, v0, Lcom/google/zxing/common/BitArray;->bits:[I

    invoke-static {v2, v3}, Ljava/util/Arrays;->equals([I[I)Z

    move-result v2

    if-eqz v2, :cond_1a

    const/4 v1, 0x1

    :cond_1a
    return v1
.end method

.method public flip(I)V
    .registers 7
    .param p1, "i"    # I

    .line 86
    iget-object v0, p0, Lcom/google/zxing/common/BitArray;->bits:[I

    div-int/lit8 v1, p1, 0x20

    aget v2, v0, v1

    and-int/lit8 v3, p1, 0x1f

    const/4 v4, 0x1

    shl-int v3, v4, v3

    xor-int/2addr v2, v3

    aput v2, v0, v1

    .line 87
    return-void
.end method

.method public get(I)Z
    .registers 5
    .param p1, "i"    # I

    .line 68
    iget-object v0, p0, Lcom/google/zxing/common/BitArray;->bits:[I

    div-int/lit8 v1, p1, 0x20

    aget v0, v0, v1

    and-int/lit8 v1, p1, 0x1f

    const/4 v2, 0x1

    shl-int v1, v2, v1

    and-int/2addr v0, v1

    if-eqz v0, :cond_f

    return v2

    :cond_f
    const/4 v0, 0x0

    return v0
.end method

.method public getBitArray()[I
    .registers 2

    .line 301
    iget-object v0, p0, Lcom/google/zxing/common/BitArray;->bits:[I

    return-object v0
.end method

.method public getNextSet(I)I
    .registers 6
    .param p1, "from"    # I

    .line 96
    iget v0, p0, Lcom/google/zxing/common/BitArray;->size:I

    if-lt p1, v0, :cond_7

    .line 97
    iget v0, p0, Lcom/google/zxing/common/BitArray;->size:I

    return v0

    .line 99
    :cond_7
    div-int/lit8 v0, p1, 0x20

    .line 100
    .local v0, "bitsOffset":I
    iget-object v1, p0, Lcom/google/zxing/common/BitArray;->bits:[I

    aget v1, v1, v0

    .line 102
    .local v1, "currentBits":I
    and-int/lit8 v2, p1, 0x1f

    const/4 v3, 0x1

    shl-int v2, v3, v2

    sub-int/2addr v2, v3

    not-int v2, v2

    and-int/2addr v1, v2

    .line 103
    :goto_15
    if-eqz v1, :cond_27

    .line 109
    mul-int/lit8 v2, v0, 0x20

    invoke-static {v1}, Ljava/lang/Integer;->numberOfTrailingZeros(I)I

    move-result v3

    add-int/2addr v2, v3

    .line 110
    .local v2, "result":I
    iget v3, p0, Lcom/google/zxing/common/BitArray;->size:I

    if-le v2, v3, :cond_25

    iget v3, p0, Lcom/google/zxing/common/BitArray;->size:I

    goto :goto_26

    :cond_25
    move v3, v2

    :goto_26
    return v3

    .line 104
    .end local v2    # "result":I
    :cond_27
    add-int/lit8 v0, v0, 0x1

    iget-object v2, p0, Lcom/google/zxing/common/BitArray;->bits:[I

    array-length v2, v2

    if-ne v0, v2, :cond_31

    .line 105
    iget v2, p0, Lcom/google/zxing/common/BitArray;->size:I

    return v2

    .line 107
    :cond_31
    iget-object v2, p0, Lcom/google/zxing/common/BitArray;->bits:[I

    aget v1, v2, v0

    goto :goto_15
.end method

.method public getNextUnset(I)I
    .registers 6
    .param p1, "from"    # I

    .line 119
    iget v0, p0, Lcom/google/zxing/common/BitArray;->size:I

    if-lt p1, v0, :cond_7

    .line 120
    iget v0, p0, Lcom/google/zxing/common/BitArray;->size:I

    return v0

    .line 122
    :cond_7
    div-int/lit8 v0, p1, 0x20

    .line 123
    .local v0, "bitsOffset":I
    iget-object v1, p0, Lcom/google/zxing/common/BitArray;->bits:[I

    aget v1, v1, v0

    not-int v1, v1

    .line 125
    .local v1, "currentBits":I
    and-int/lit8 v2, p1, 0x1f

    const/4 v3, 0x1

    shl-int v2, v3, v2

    sub-int/2addr v2, v3

    not-int v2, v2

    and-int/2addr v1, v2

    .line 126
    :goto_16
    if-eqz v1, :cond_28

    .line 132
    mul-int/lit8 v2, v0, 0x20

    invoke-static {v1}, Ljava/lang/Integer;->numberOfTrailingZeros(I)I

    move-result v3

    add-int/2addr v2, v3

    .line 133
    .local v2, "result":I
    iget v3, p0, Lcom/google/zxing/common/BitArray;->size:I

    if-le v2, v3, :cond_26

    iget v3, p0, Lcom/google/zxing/common/BitArray;->size:I

    goto :goto_27

    :cond_26
    move v3, v2

    :goto_27
    return v3

    .line 127
    .end local v2    # "result":I
    :cond_28
    add-int/lit8 v0, v0, 0x1

    iget-object v2, p0, Lcom/google/zxing/common/BitArray;->bits:[I

    array-length v2, v2

    if-ne v0, v2, :cond_32

    .line 128
    iget v2, p0, Lcom/google/zxing/common/BitArray;->size:I

    return v2

    .line 130
    :cond_32
    iget-object v2, p0, Lcom/google/zxing/common/BitArray;->bits:[I

    aget v2, v2, v0

    not-int v1, v2

    goto :goto_16
.end method

.method public getSize()I
    .registers 2

    .line 48
    iget v0, p0, Lcom/google/zxing/common/BitArray;->size:I

    return v0
.end method

.method public getSizeInBytes()I
    .registers 2

    .line 52
    iget v0, p0, Lcom/google/zxing/common/BitArray;->size:I

    add-int/lit8 v0, v0, 0x7

    div-int/lit8 v0, v0, 0x8

    return v0
.end method

.method public hashCode()I
    .registers 3

    .line 355
    iget v0, p0, Lcom/google/zxing/common/BitArray;->size:I

    const/16 v1, 0x1f

    mul-int/2addr v1, v0

    iget-object v0, p0, Lcom/google/zxing/common/BitArray;->bits:[I

    invoke-static {v0}, Ljava/util/Arrays;->hashCode([I)I

    move-result v0

    add-int/2addr v1, v0

    return v1
.end method

.method public isRange(IIZ)Z
    .registers 14
    .param p1, "start"    # I
    .param p2, "end"    # I
    .param p3, "value"    # Z

    .line 199
    if-lt p2, p1, :cond_41

    .line 202
    const/4 v0, 0x1

    if-ne p2, p1, :cond_6

    .line 203
    return v0

    .line 205
    :cond_6
    add-int/lit8 v1, p2, -0x1

    .line 206
    .end local p2    # "end":I
    .local v1, "end":I
    div-int/lit8 v2, p1, 0x20

    .line 207
    .local v2, "firstInt":I
    div-int/lit8 v3, v1, 0x20

    .line 208
    .local v3, "lastInt":I
    move p2, v2

    .local p2, "i":I
    move v4, p2

    .end local p2    # "i":I
    .local v4, "i":I
    :goto_e
    if-le v4, v3, :cond_11

    .line 227
    .end local v4    # "i":I
    return v0

    .line 209
    .restart local v4    # "i":I
    :cond_11
    const/4 v5, 0x0

    if-le v4, v2, :cond_16

    move p2, v5

    goto :goto_18

    :cond_16
    and-int/lit8 p2, p1, 0x1f

    :goto_18
    move v6, p2

    .line 210
    .local v6, "firstBit":I
    const/16 p2, 0x1f

    if-ge v4, v3, :cond_1f

    move v7, p2

    goto :goto_21

    :cond_1f
    and-int/lit8 v7, v1, 0x1f

    .line 212
    .local v7, "lastBit":I
    :goto_21
    if-nez v6, :cond_27

    if-ne v7, p2, :cond_27

    .line 213
    const/4 p2, -0x1

    .line 214
    .local p2, "mask":I
    goto :goto_2b

    .line 215
    .end local p2    # "mask":I
    :cond_27
    const/4 p2, 0x0

    .line 216
    .restart local p2    # "mask":I
    move v8, v6

    .local v8, "j":I
    :goto_29
    if-le v8, v7, :cond_3b

    .line 223
    .end local v8    # "j":I
    :goto_2b
    iget-object v8, p0, Lcom/google/zxing/common/BitArray;->bits:[I

    aget v8, v8, v4

    and-int/2addr v8, p2

    if-eqz p3, :cond_34

    move v9, p2

    goto :goto_35

    :cond_34
    move v9, v5

    :goto_35
    if-eq v8, v9, :cond_38

    .line 224
    return v5

    .line 208
    .end local v6    # "firstBit":I
    .end local v7    # "lastBit":I
    .end local p2    # "mask":I
    :cond_38
    add-int/lit8 v4, v4, 0x1

    goto :goto_e

    .line 217
    .restart local v6    # "firstBit":I
    .restart local v7    # "lastBit":I
    .restart local v8    # "j":I
    .restart local p2    # "mask":I
    :cond_3b
    shl-int v9, v0, v8

    or-int/2addr p2, v9

    .line 216
    add-int/lit8 v8, v8, 0x1

    goto :goto_29

    .line 200
    .end local v1    # "end":I
    .end local v2    # "firstInt":I
    .end local v3    # "lastInt":I
    .end local v4    # "i":I
    .end local v6    # "firstBit":I
    .end local v7    # "lastBit":I
    .end local v8    # "j":I
    .local p2, "end":I
    :cond_41
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0
.end method

.method public reverse()V
    .registers 13

    .line 308
    iget-object v0, p0, Lcom/google/zxing/common/BitArray;->bits:[I

    array-length v0, v0

    new-array v0, v0, [I

    .line 310
    .local v0, "newBits":[I
    iget v1, p0, Lcom/google/zxing/common/BitArray;->size:I

    const/4 v2, 0x1

    sub-int/2addr v1, v2

    div-int/lit8 v1, v1, 0x20

    .line 311
    .local v1, "len":I
    add-int/lit8 v3, v1, 0x1

    .line 312
    .local v3, "oldBitsLen":I
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_e
    if-lt v4, v3, :cond_4a

    .line 322
    .end local v4    # "i":I
    iget v4, p0, Lcom/google/zxing/common/BitArray;->size:I

    mul-int/lit8 v5, v3, 0x20

    if-eq v4, v5, :cond_47

    .line 323
    mul-int/lit8 v4, v3, 0x20

    iget v5, p0, Lcom/google/zxing/common/BitArray;->size:I

    sub-int/2addr v4, v5

    .line 324
    .local v4, "leftOffset":I
    const/4 v5, 0x1

    .line 325
    .local v5, "mask":I
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_1d
    rsub-int/lit8 v7, v4, 0x1f

    if-lt v6, v7, :cond_40

    .line 328
    .end local v6    # "i":I
    const/4 v2, 0x0

    aget v2, v0, v2

    shr-int/2addr v2, v4

    and-int/2addr v2, v5

    .line 329
    .local v2, "currentInt":I
    const/4 v6, 0x1

    .restart local v6    # "i":I
    :goto_27
    if-lt v6, v3, :cond_2e

    .line 335
    .end local v6    # "i":I
    add-int/lit8 v6, v3, -0x1

    aput v2, v0, v6

    .end local v2    # "currentInt":I
    .end local v4    # "leftOffset":I
    .end local v5    # "mask":I
    goto :goto_47

    .line 330
    .restart local v2    # "currentInt":I
    .restart local v4    # "leftOffset":I
    .restart local v5    # "mask":I
    .restart local v6    # "i":I
    :cond_2e
    aget v7, v0, v6

    .line 331
    .local v7, "nextInt":I
    rsub-int/lit8 v8, v4, 0x20

    shl-int v8, v7, v8

    or-int/2addr v2, v8

    .line 332
    add-int/lit8 v8, v6, -0x1

    aput v2, v0, v8

    .line 333
    shr-int v8, v7, v4

    and-int v2, v8, v5

    .line 329
    .end local v7    # "nextInt":I
    add-int/lit8 v6, v6, 0x1

    goto :goto_27

    .line 326
    .end local v2    # "currentInt":I
    :cond_40
    shl-int/lit8 v7, v5, 0x1

    or-int/lit8 v5, v7, 0x1

    .line 325
    add-int/lit8 v6, v6, 0x1

    goto :goto_1d

    .line 337
    .end local v4    # "leftOffset":I
    .end local v5    # "mask":I
    .end local v6    # "i":I
    :cond_47
    :goto_47
    iput-object v0, p0, Lcom/google/zxing/common/BitArray;->bits:[I

    .line 338
    return-void

    .line 313
    .local v4, "i":I
    :cond_4a
    iget-object v5, p0, Lcom/google/zxing/common/BitArray;->bits:[I

    aget v5, v5, v4

    int-to-long v5, v5

    .line 314
    .local v5, "x":J
    shr-long v7, v5, v2

    const-wide/32 v9, 0x55555555

    and-long/2addr v7, v9

    and-long/2addr v9, v5

    shl-long/2addr v9, v2

    or-long v5, v7, v9

    .line 315
    const/4 v7, 0x2

    shr-long v8, v5, v7

    const-wide/32 v10, 0x33333333

    and-long/2addr v8, v10

    and-long/2addr v10, v5

    shl-long/2addr v10, v7

    or-long v5, v8, v10

    .line 316
    const/4 v7, 0x4

    shr-long v8, v5, v7

    const-wide/32 v10, 0xf0f0f0f

    and-long/2addr v8, v10

    and-long/2addr v10, v5

    shl-long/2addr v10, v7

    or-long v5, v8, v10

    .line 317
    const/16 v7, 0x8

    shr-long v8, v5, v7

    const-wide/32 v10, 0xff00ff

    and-long/2addr v8, v10

    and-long/2addr v10, v5

    shl-long/2addr v10, v7

    or-long v5, v8, v10

    .line 318
    const/16 v7, 0x10

    shr-long v8, v5, v7

    const-wide/32 v10, 0xffff

    and-long/2addr v8, v10

    and-long/2addr v10, v5

    shl-long/2addr v10, v7

    or-long v5, v8, v10

    .line 319
    sub-int v7, v1, v4

    long-to-int v8, v5

    aput v8, v0, v7

    .line 312
    .end local v5    # "x":J
    add-int/lit8 v4, v4, 0x1

    goto/16 :goto_e
.end method

.method public set(I)V
    .registers 7
    .param p1, "i"    # I

    .line 77
    iget-object v0, p0, Lcom/google/zxing/common/BitArray;->bits:[I

    div-int/lit8 v1, p1, 0x20

    aget v2, v0, v1

    and-int/lit8 v3, p1, 0x1f

    const/4 v4, 0x1

    shl-int v3, v4, v3

    or-int/2addr v2, v3

    aput v2, v0, v1

    .line 78
    return-void
.end method

.method public setBulk(II)V
    .registers 5
    .param p1, "i"    # I
    .param p2, "newBits"    # I

    .line 144
    iget-object v0, p0, Lcom/google/zxing/common/BitArray;->bits:[I

    div-int/lit8 v1, p1, 0x20

    aput p2, v0, v1

    .line 145
    return-void
.end method

.method public setRange(II)V
    .registers 11
    .param p1, "start"    # I
    .param p2, "end"    # I

    .line 154
    if-lt p2, p1, :cond_39

    .line 157
    if-ne p2, p1, :cond_5

    .line 158
    return-void

    .line 160
    :cond_5
    add-int/lit8 v0, p2, -0x1

    .line 161
    .end local p2    # "end":I
    .local v0, "end":I
    div-int/lit8 v1, p1, 0x20

    .line 162
    .local v1, "firstInt":I
    div-int/lit8 v2, v0, 0x20

    .line 163
    .local v2, "lastInt":I
    move p2, v1

    .local p2, "i":I
    move v3, p2

    .end local p2    # "i":I
    .local v3, "i":I
    :goto_d
    if-le v3, v2, :cond_10

    .line 177
    .end local v3    # "i":I
    return-void

    .line 164
    .restart local v3    # "i":I
    :cond_10
    if-le v3, v1, :cond_14

    const/4 p2, 0x0

    goto :goto_16

    :cond_14
    and-int/lit8 p2, p1, 0x1f

    :goto_16
    move v4, p2

    .line 165
    .local v4, "firstBit":I
    const/16 p2, 0x1f

    if-ge v3, v2, :cond_1d

    move v5, p2

    goto :goto_1f

    :cond_1d
    and-int/lit8 v5, v0, 0x1f

    .line 167
    .local v5, "lastBit":I
    :goto_1f
    if-nez v4, :cond_25

    if-ne v5, p2, :cond_25

    .line 168
    const/4 p2, -0x1

    .line 169
    .local p2, "mask":I
    goto :goto_29

    .line 170
    .end local p2    # "mask":I
    :cond_25
    const/4 p2, 0x0

    .line 171
    .restart local p2    # "mask":I
    move v6, v4

    .local v6, "j":I
    :goto_27
    if-le v6, v5, :cond_33

    .line 175
    .end local v6    # "j":I
    :goto_29
    iget-object v6, p0, Lcom/google/zxing/common/BitArray;->bits:[I

    aget v7, v6, v3

    or-int/2addr v7, p2

    aput v7, v6, v3

    .line 163
    .end local v4    # "firstBit":I
    .end local v5    # "lastBit":I
    .end local p2    # "mask":I
    add-int/lit8 v3, v3, 0x1

    goto :goto_d

    .line 172
    .restart local v4    # "firstBit":I
    .restart local v5    # "lastBit":I
    .restart local v6    # "j":I
    .restart local p2    # "mask":I
    :cond_33
    const/4 v7, 0x1

    shl-int/2addr v7, v6

    or-int/2addr p2, v7

    .line 171
    add-int/lit8 v6, v6, 0x1

    goto :goto_27

    .line 155
    .end local v0    # "end":I
    .end local v1    # "firstInt":I
    .end local v2    # "lastInt":I
    .end local v3    # "i":I
    .end local v4    # "firstBit":I
    .end local v5    # "lastBit":I
    .end local v6    # "j":I
    .local p2, "end":I
    :cond_39
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0
.end method

.method public toBytes(I[BII)V
    .registers 10
    .param p1, "bitOffset"    # I
    .param p2, "array"    # [B
    .param p3, "offset"    # I
    .param p4, "numBytes"    # I

    .line 284
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    if-lt v0, p4, :cond_4

    .line 294
    .end local v0    # "i":I
    return-void

    .line 285
    .restart local v0    # "i":I
    :cond_4
    const/4 v1, 0x0

    .line 286
    .local v1, "theByte":I
    const/4 v2, 0x0

    .local v2, "j":I
    :goto_6
    const/16 v3, 0x8

    if-lt v2, v3, :cond_12

    .line 292
    .end local v2    # "j":I
    add-int v2, p3, v0

    int-to-byte v3, v1

    aput-byte v3, p2, v2

    .line 284
    .end local v1    # "theByte":I
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 287
    .restart local v1    # "theByte":I
    .restart local v2    # "j":I
    :cond_12
    invoke-virtual {p0, p1}, Lcom/google/zxing/common/BitArray;->get(I)Z

    move-result v3

    if-eqz v3, :cond_1e

    .line 288
    rsub-int/lit8 v3, v2, 0x7

    const/4 v4, 0x1

    shl-int v3, v4, v3

    or-int/2addr v1, v3

    .line 290
    :cond_1e
    add-int/lit8 p1, p1, 0x1

    .line 286
    add-int/lit8 v2, v2, 0x1

    goto :goto_6
.end method

.method public toString()Ljava/lang/String;
    .registers 4

    .line 360
    new-instance v0, Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/google/zxing/common/BitArray;->size:I

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 361
    .local v0, "result":Ljava/lang/StringBuilder;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_8
    iget v2, p0, Lcom/google/zxing/common/BitArray;->size:I

    if-lt v1, v2, :cond_11

    .line 367
    .end local v1    # "i":I
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 362
    .restart local v1    # "i":I
    :cond_11
    and-int/lit8 v2, v1, 0x7

    if-nez v2, :cond_1a

    .line 363
    const/16 v2, 0x20

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 365
    :cond_1a
    invoke-virtual {p0, v1}, Lcom/google/zxing/common/BitArray;->get(I)Z

    move-result v2

    if-eqz v2, :cond_23

    const/16 v2, 0x58

    goto :goto_25

    :cond_23
    const/16 v2, 0x2e

    :goto_25
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 361
    add-int/lit8 v1, v1, 0x1

    goto :goto_8
.end method

.method public xor(Lcom/google/zxing/common/BitArray;)V
    .registers 6
    .param p1, "other"    # Lcom/google/zxing/common/BitArray;

    .line 265
    iget-object v0, p0, Lcom/google/zxing/common/BitArray;->bits:[I

    array-length v0, v0

    iget-object v1, p1, Lcom/google/zxing/common/BitArray;->bits:[I

    array-length v1, v1

    if-ne v0, v1, :cond_1d

    .line 268
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_9
    iget-object v1, p0, Lcom/google/zxing/common/BitArray;->bits:[I

    array-length v1, v1

    if-lt v0, v1, :cond_f

    .line 273
    .end local v0    # "i":I
    return-void

    .line 271
    .restart local v0    # "i":I
    :cond_f
    iget-object v1, p0, Lcom/google/zxing/common/BitArray;->bits:[I

    aget v2, v1, v0

    iget-object v3, p1, Lcom/google/zxing/common/BitArray;->bits:[I

    aget v3, v3, v0

    xor-int/2addr v2, v3

    aput v2, v1, v0

    .line 268
    add-int/lit8 v0, v0, 0x1

    goto :goto_9

    .line 266
    .end local v0    # "i":I
    :cond_1d
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Sizes don\'t match"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
