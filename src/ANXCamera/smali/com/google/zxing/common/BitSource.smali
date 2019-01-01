.class public final Lcom/google/zxing/common/BitSource;
.super Ljava/lang/Object;
.source "BitSource.java"


# instance fields
.field private bitOffset:I

.field private byteOffset:I

.field private final bytes:[B


# direct methods
.method public constructor <init>([B)V
    .locals 0
    .param p1, "bytes"    # [B

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    iput-object p1, p0, Lcom/google/zxing/common/BitSource;->bytes:[B

    .line 40
    return-void
.end method


# virtual methods
.method public available()I
    .locals 2

    .line 108
    iget-object v0, p0, Lcom/google/zxing/common/BitSource;->bytes:[B

    array-length v0, v0

    iget v1, p0, Lcom/google/zxing/common/BitSource;->byteOffset:I

    sub-int/2addr v0, v1

    const/16 v1, 0x8

    mul-int/2addr v1, v0

    iget v0, p0, Lcom/google/zxing/common/BitSource;->bitOffset:I

    sub-int/2addr v1, v0

    return v1
.end method

.method public getBitOffset()I
    .locals 1

    .line 46
    iget v0, p0, Lcom/google/zxing/common/BitSource;->bitOffset:I

    return v0
.end method

.method public getByteOffset()I
    .locals 1

    .line 53
    iget v0, p0, Lcom/google/zxing/common/BitSource;->byteOffset:I

    return v0
.end method

.method public readBits(I)I
    .locals 10
    .param p1, "numBits"    # I

    .line 63
    const/4 v0, 0x1

    if-lt p1, v0, :cond_4

    const/16 v1, 0x20

    if-gt p1, v1, :cond_4

    invoke-virtual {p0}, Lcom/google/zxing/common/BitSource;->available()I

    move-result v1

    if-gt p1, v1, :cond_4

    .line 67
    const/4 v1, 0x0

    .line 70
    .local v1, "result":I
    iget v2, p0, Lcom/google/zxing/common/BitSource;->bitOffset:I

    const/16 v3, 0xff

    const/16 v4, 0x8

    if-lez v2, :cond_1

    .line 71
    iget v2, p0, Lcom/google/zxing/common/BitSource;->bitOffset:I

    rsub-int/lit8 v2, v2, 0x8

    .line 72
    .local v2, "bitsLeft":I
    if-ge p1, v2, :cond_0

    move v5, p1

    goto :goto_0

    :cond_0
    move v5, v2

    .line 73
    .local v5, "toRead":I
    :goto_0
    sub-int v6, v2, v5

    .line 74
    .local v6, "bitsToNotRead":I
    rsub-int/lit8 v7, v5, 0x8

    shr-int v7, v3, v7

    shl-int/2addr v7, v6

    .line 75
    .local v7, "mask":I
    iget-object v8, p0, Lcom/google/zxing/common/BitSource;->bytes:[B

    iget v9, p0, Lcom/google/zxing/common/BitSource;->byteOffset:I

    aget-byte v8, v8, v9

    and-int/2addr v8, v7

    shr-int v1, v8, v6

    .line 76
    sub-int/2addr p1, v5

    .line 77
    iget v8, p0, Lcom/google/zxing/common/BitSource;->bitOffset:I

    add-int/2addr v8, v5

    iput v8, p0, Lcom/google/zxing/common/BitSource;->bitOffset:I

    .line 78
    iget v8, p0, Lcom/google/zxing/common/BitSource;->bitOffset:I

    if-ne v8, v4, :cond_1

    .line 79
    const/4 v8, 0x0

    iput v8, p0, Lcom/google/zxing/common/BitSource;->bitOffset:I

    .line 80
    iget v8, p0, Lcom/google/zxing/common/BitSource;->byteOffset:I

    add-int/2addr v8, v0

    iput v8, p0, Lcom/google/zxing/common/BitSource;->byteOffset:I

    .line 85
    .end local v2    # "bitsLeft":I
    .end local v5    # "toRead":I
    .end local v6    # "bitsToNotRead":I
    .end local v7    # "mask":I
    :cond_1
    if-lez p1, :cond_3

    .line 86
    :goto_1
    if-ge p1, v4, :cond_2

    .line 93
    if-lez p1, :cond_3

    .line 94
    sub-int/2addr v4, p1

    .line 95
    .local v4, "bitsToNotRead":I
    shr-int v0, v3, v4

    shl-int/2addr v0, v4

    .line 96
    .local v0, "mask":I
    shl-int v2, v1, p1

    iget-object v3, p0, Lcom/google/zxing/common/BitSource;->bytes:[B

    iget v5, p0, Lcom/google/zxing/common/BitSource;->byteOffset:I

    aget-byte v3, v3, v5

    and-int/2addr v3, v0

    shr-int/2addr v3, v4

    or-int v1, v2, v3

    .line 97
    iget v2, p0, Lcom/google/zxing/common/BitSource;->bitOffset:I

    add-int/2addr v2, p1

    iput v2, p0, Lcom/google/zxing/common/BitSource;->bitOffset:I

    .end local v0    # "mask":I
    .end local v4    # "bitsToNotRead":I
    goto :goto_2

    .line 87
    :cond_2
    shl-int/lit8 v2, v1, 0x8

    iget-object v5, p0, Lcom/google/zxing/common/BitSource;->bytes:[B

    iget v6, p0, Lcom/google/zxing/common/BitSource;->byteOffset:I

    aget-byte v5, v5, v6

    and-int/2addr v5, v3

    or-int v1, v2, v5

    .line 88
    iget v2, p0, Lcom/google/zxing/common/BitSource;->byteOffset:I

    add-int/2addr v2, v0

    iput v2, p0, Lcom/google/zxing/common/BitSource;->byteOffset:I

    .line 89
    add-int/lit8 p1, p1, -0x8

    goto :goto_1

    .line 101
    :cond_3
    :goto_2
    return v1

    .line 64
    .end local v1    # "result":I
    :cond_4
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
