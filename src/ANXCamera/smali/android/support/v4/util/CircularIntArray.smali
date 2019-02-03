.class public final Landroid/support/v4/util/CircularIntArray;
.super Ljava/lang/Object;
.source "CircularIntArray.java"


# instance fields
.field private mCapacityBitmask:I

.field private mElements:[I

.field private mHead:I

.field private mTail:I


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 48
    const/16 v0, 0x8

    invoke-direct {p0, v0}, Landroid/support/v4/util/CircularIntArray;-><init>(I)V

    .line 49
    return-void
.end method

.method public constructor <init>(I)V
    .registers 5
    .param p1, "minCapacity"    # I

    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    if-lez p1, :cond_1d

    .line 60
    move v0, p1

    .line 63
    .local v0, "arrayCapacity":I
    invoke-static {p1}, Ljava/lang/Integer;->bitCount(I)I

    move-result v1

    const/4 v2, 0x1

    if-eq v1, v2, :cond_14

    .line 64
    invoke-static {p1}, Ljava/lang/Integer;->highestOneBit(I)I

    move-result v1

    add-int/2addr v1, v2

    shl-int v0, v2, v1

    .line 66
    :cond_14
    add-int/lit8 v1, v0, -0x1

    iput v1, p0, Landroid/support/v4/util/CircularIntArray;->mCapacityBitmask:I

    .line 67
    new-array v1, v0, [I

    iput-object v1, p0, Landroid/support/v4/util/CircularIntArray;->mElements:[I

    .line 68
    return-void

    .line 58
    .end local v0    # "arrayCapacity":I
    :cond_1d
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "capacity must be positive"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private doubleCapacity()V
    .registers 8

    .line 29
    iget-object v0, p0, Landroid/support/v4/util/CircularIntArray;->mElements:[I

    array-length v0, v0

    .line 30
    .local v0, "n":I
    iget v1, p0, Landroid/support/v4/util/CircularIntArray;->mHead:I

    sub-int v1, v0, v1

    .line 31
    .local v1, "r":I
    shl-int/lit8 v2, v0, 0x1

    .line 32
    .local v2, "newCapacity":I
    if-ltz v2, :cond_27

    .line 35
    new-array v3, v2, [I

    .line 36
    .local v3, "a":[I
    iget-object v4, p0, Landroid/support/v4/util/CircularIntArray;->mElements:[I

    iget v5, p0, Landroid/support/v4/util/CircularIntArray;->mHead:I

    const/4 v6, 0x0

    invoke-static {v4, v5, v3, v6, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 37
    iget-object v4, p0, Landroid/support/v4/util/CircularIntArray;->mElements:[I

    iget v5, p0, Landroid/support/v4/util/CircularIntArray;->mHead:I

    invoke-static {v4, v6, v3, v1, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 38
    iput-object v3, p0, Landroid/support/v4/util/CircularIntArray;->mElements:[I

    .line 39
    iput v6, p0, Landroid/support/v4/util/CircularIntArray;->mHead:I

    .line 40
    iput v0, p0, Landroid/support/v4/util/CircularIntArray;->mTail:I

    .line 41
    add-int/lit8 v4, v2, -0x1

    iput v4, p0, Landroid/support/v4/util/CircularIntArray;->mCapacityBitmask:I

    .line 42
    return-void

    .line 33
    .end local v3    # "a":[I
    :cond_27
    new-instance v3, Ljava/lang/RuntimeException;

    const-string v4, "Max array capacity exceeded"

    invoke-direct {v3, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v3
.end method


# virtual methods
.method public addFirst(I)V
    .registers 4
    .param p1, "e"    # I

    .line 75
    iget v0, p0, Landroid/support/v4/util/CircularIntArray;->mHead:I

    add-int/lit8 v0, v0, -0x1

    iget v1, p0, Landroid/support/v4/util/CircularIntArray;->mCapacityBitmask:I

    and-int/2addr v0, v1

    iput v0, p0, Landroid/support/v4/util/CircularIntArray;->mHead:I

    .line 76
    iget-object v0, p0, Landroid/support/v4/util/CircularIntArray;->mElements:[I

    iget v1, p0, Landroid/support/v4/util/CircularIntArray;->mHead:I

    aput p1, v0, v1

    .line 77
    iget v0, p0, Landroid/support/v4/util/CircularIntArray;->mHead:I

    iget v1, p0, Landroid/support/v4/util/CircularIntArray;->mTail:I

    if-ne v0, v1, :cond_18

    .line 78
    invoke-direct {p0}, Landroid/support/v4/util/CircularIntArray;->doubleCapacity()V

    .line 80
    :cond_18
    return-void
.end method

.method public addLast(I)V
    .registers 4
    .param p1, "e"    # I

    .line 87
    iget-object v0, p0, Landroid/support/v4/util/CircularIntArray;->mElements:[I

    iget v1, p0, Landroid/support/v4/util/CircularIntArray;->mTail:I

    aput p1, v0, v1

    .line 88
    iget v0, p0, Landroid/support/v4/util/CircularIntArray;->mTail:I

    add-int/lit8 v0, v0, 0x1

    iget v1, p0, Landroid/support/v4/util/CircularIntArray;->mCapacityBitmask:I

    and-int/2addr v0, v1

    iput v0, p0, Landroid/support/v4/util/CircularIntArray;->mTail:I

    .line 89
    iget v0, p0, Landroid/support/v4/util/CircularIntArray;->mTail:I

    iget v1, p0, Landroid/support/v4/util/CircularIntArray;->mHead:I

    if-ne v0, v1, :cond_18

    .line 90
    invoke-direct {p0}, Landroid/support/v4/util/CircularIntArray;->doubleCapacity()V

    .line 92
    :cond_18
    return-void
.end method

.method public clear()V
    .registers 2

    .line 123
    iget v0, p0, Landroid/support/v4/util/CircularIntArray;->mHead:I

    iput v0, p0, Landroid/support/v4/util/CircularIntArray;->mTail:I

    .line 124
    return-void
.end method

.method public get(I)I
    .registers 5
    .param p1, "n"    # I

    .line 187
    if-ltz p1, :cond_13

    invoke-virtual {p0}, Landroid/support/v4/util/CircularIntArray;->size()I

    move-result v0

    if-ge p1, v0, :cond_13

    .line 188
    iget-object v0, p0, Landroid/support/v4/util/CircularIntArray;->mElements:[I

    iget v1, p0, Landroid/support/v4/util/CircularIntArray;->mHead:I

    add-int/2addr v1, p1

    iget v2, p0, Landroid/support/v4/util/CircularIntArray;->mCapacityBitmask:I

    and-int/2addr v1, v2

    aget v0, v0, v1

    return v0

    .line 187
    :cond_13
    new-instance v0, Ljava/lang/ArrayIndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>()V

    throw v0
.end method

.method public getFirst()I
    .registers 3

    .line 166
    iget v0, p0, Landroid/support/v4/util/CircularIntArray;->mHead:I

    iget v1, p0, Landroid/support/v4/util/CircularIntArray;->mTail:I

    if-eq v0, v1, :cond_d

    .line 167
    iget-object v0, p0, Landroid/support/v4/util/CircularIntArray;->mElements:[I

    iget v1, p0, Landroid/support/v4/util/CircularIntArray;->mHead:I

    aget v0, v0, v1

    return v0

    .line 166
    :cond_d
    new-instance v0, Ljava/lang/ArrayIndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>()V

    throw v0
.end method

.method public getLast()I
    .registers 4

    .line 176
    iget v0, p0, Landroid/support/v4/util/CircularIntArray;->mHead:I

    iget v1, p0, Landroid/support/v4/util/CircularIntArray;->mTail:I

    if-eq v0, v1, :cond_12

    .line 177
    iget-object v0, p0, Landroid/support/v4/util/CircularIntArray;->mElements:[I

    iget v1, p0, Landroid/support/v4/util/CircularIntArray;->mTail:I

    add-int/lit8 v1, v1, -0x1

    iget v2, p0, Landroid/support/v4/util/CircularIntArray;->mCapacityBitmask:I

    and-int/2addr v1, v2

    aget v0, v0, v1

    return v0

    .line 176
    :cond_12
    new-instance v0, Ljava/lang/ArrayIndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>()V

    throw v0
.end method

.method public isEmpty()Z
    .registers 3

    .line 204
    iget v0, p0, Landroid/support/v4/util/CircularIntArray;->mHead:I

    iget v1, p0, Landroid/support/v4/util/CircularIntArray;->mTail:I

    if-ne v0, v1, :cond_8

    const/4 v0, 0x1

    goto :goto_9

    :cond_8
    const/4 v0, 0x0

    :goto_9
    return v0
.end method

.method public popFirst()I
    .registers 4

    .line 100
    iget v0, p0, Landroid/support/v4/util/CircularIntArray;->mHead:I

    iget v1, p0, Landroid/support/v4/util/CircularIntArray;->mTail:I

    if-eq v0, v1, :cond_16

    .line 101
    iget-object v0, p0, Landroid/support/v4/util/CircularIntArray;->mElements:[I

    iget v1, p0, Landroid/support/v4/util/CircularIntArray;->mHead:I

    aget v0, v0, v1

    .line 102
    .local v0, "result":I
    iget v1, p0, Landroid/support/v4/util/CircularIntArray;->mHead:I

    add-int/lit8 v1, v1, 0x1

    iget v2, p0, Landroid/support/v4/util/CircularIntArray;->mCapacityBitmask:I

    and-int/2addr v1, v2

    iput v1, p0, Landroid/support/v4/util/CircularIntArray;->mHead:I

    .line 103
    return v0

    .line 100
    .end local v0    # "result":I
    :cond_16
    new-instance v0, Ljava/lang/ArrayIndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>()V

    throw v0
.end method

.method public popLast()I
    .registers 3

    .line 112
    iget v0, p0, Landroid/support/v4/util/CircularIntArray;->mHead:I

    iget v1, p0, Landroid/support/v4/util/CircularIntArray;->mTail:I

    if-eq v0, v1, :cond_14

    .line 113
    iget v0, p0, Landroid/support/v4/util/CircularIntArray;->mTail:I

    add-int/lit8 v0, v0, -0x1

    iget v1, p0, Landroid/support/v4/util/CircularIntArray;->mCapacityBitmask:I

    and-int/2addr v0, v1

    .line 114
    .local v0, "t":I
    iget-object v1, p0, Landroid/support/v4/util/CircularIntArray;->mElements:[I

    aget v1, v1, v0

    .line 115
    .local v1, "result":I
    iput v0, p0, Landroid/support/v4/util/CircularIntArray;->mTail:I

    .line 116
    return v1

    .line 112
    .end local v0    # "t":I
    .end local v1    # "result":I
    :cond_14
    new-instance v0, Ljava/lang/ArrayIndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>()V

    throw v0
.end method

.method public removeFromEnd(I)V
    .registers 4
    .param p1, "numOfElements"    # I

    .line 151
    if-gtz p1, :cond_3

    .line 152
    return-void

    .line 154
    :cond_3
    invoke-virtual {p0}, Landroid/support/v4/util/CircularIntArray;->size()I

    move-result v0

    if-gt p1, v0, :cond_12

    .line 157
    iget v0, p0, Landroid/support/v4/util/CircularIntArray;->mTail:I

    sub-int/2addr v0, p1

    iget v1, p0, Landroid/support/v4/util/CircularIntArray;->mCapacityBitmask:I

    and-int/2addr v0, v1

    iput v0, p0, Landroid/support/v4/util/CircularIntArray;->mTail:I

    .line 158
    return-void

    .line 155
    :cond_12
    new-instance v0, Ljava/lang/ArrayIndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>()V

    throw v0
.end method

.method public removeFromStart(I)V
    .registers 4
    .param p1, "numOfElements"    # I

    .line 134
    if-gtz p1, :cond_3

    .line 135
    return-void

    .line 137
    :cond_3
    invoke-virtual {p0}, Landroid/support/v4/util/CircularIntArray;->size()I

    move-result v0

    if-gt p1, v0, :cond_12

    .line 140
    iget v0, p0, Landroid/support/v4/util/CircularIntArray;->mHead:I

    add-int/2addr v0, p1

    iget v1, p0, Landroid/support/v4/util/CircularIntArray;->mCapacityBitmask:I

    and-int/2addr v0, v1

    iput v0, p0, Landroid/support/v4/util/CircularIntArray;->mHead:I

    .line 141
    return-void

    .line 138
    :cond_12
    new-instance v0, Ljava/lang/ArrayIndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>()V

    throw v0
.end method

.method public size()I
    .registers 3

    .line 196
    iget v0, p0, Landroid/support/v4/util/CircularIntArray;->mTail:I

    iget v1, p0, Landroid/support/v4/util/CircularIntArray;->mHead:I

    sub-int/2addr v0, v1

    iget v1, p0, Landroid/support/v4/util/CircularIntArray;->mCapacityBitmask:I

    and-int/2addr v0, v1

    return v0
.end method
