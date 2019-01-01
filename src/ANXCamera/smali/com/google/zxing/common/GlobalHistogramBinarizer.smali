.class public Lcom/google/zxing/common/GlobalHistogramBinarizer;
.super Lcom/google/zxing/Binarizer;
.source "GlobalHistogramBinarizer.java"


# static fields
.field private static final EMPTY:[B

.field private static final LUMINANCE_BITS:I = 0x5

.field private static final LUMINANCE_BUCKETS:I = 0x20

.field private static final LUMINANCE_SHIFT:I = 0x3


# instance fields
.field private final buckets:[I

.field private luminances:[B


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 39
    const/4 v0, 0x0

    new-array v0, v0, [B

    sput-object v0, Lcom/google/zxing/common/GlobalHistogramBinarizer;->EMPTY:[B

    return-void
.end method

.method public constructor <init>(Lcom/google/zxing/LuminanceSource;)V
    .locals 1
    .param p1, "source"    # Lcom/google/zxing/LuminanceSource;

    .line 45
    invoke-direct {p0, p1}, Lcom/google/zxing/Binarizer;-><init>(Lcom/google/zxing/LuminanceSource;)V

    .line 46
    sget-object v0, Lcom/google/zxing/common/GlobalHistogramBinarizer;->EMPTY:[B

    iput-object v0, p0, Lcom/google/zxing/common/GlobalHistogramBinarizer;->luminances:[B

    .line 47
    const/16 v0, 0x20

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/google/zxing/common/GlobalHistogramBinarizer;->buckets:[I

    .line 48
    return-void
.end method

.method private static estimateBlackPoint([I)I
    .locals 12
    .param p0, "buckets"    # [I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .line 141
    array-length v0, p0

    .line 142
    .local v0, "numBuckets":I
    const/4 v1, 0x0

    .line 143
    .local v1, "maxBucketCount":I
    const/4 v2, 0x0

    .line 144
    .local v2, "firstPeak":I
    const/4 v3, 0x0

    .line 145
    .local v3, "firstPeakSize":I
    const/4 v4, 0x0

    .local v4, "x":I
    :goto_0
    if-lt v4, v0, :cond_6

    .line 156
    .end local v4    # "x":I
    const/4 v4, 0x0

    .line 157
    .local v4, "secondPeak":I
    const/4 v5, 0x0

    .line 158
    .local v5, "secondPeakScore":I
    const/4 v6, 0x0

    .local v6, "x":I
    :goto_1
    if-lt v6, v0, :cond_4

    .line 169
    .end local v6    # "x":I
    if-le v2, v4, :cond_0

    .line 170
    move v6, v2

    .line 171
    .local v6, "temp":I
    move v2, v4

    .line 172
    move v4, v6

    .line 177
    .end local v6    # "temp":I
    :cond_0
    sub-int v6, v4, v2

    div-int/lit8 v7, v0, 0x10

    if-le v6, v7, :cond_3

    .line 182
    add-int/lit8 v6, v4, -0x1

    .line 183
    .local v6, "bestValley":I
    const/4 v7, -0x1

    .line 184
    .local v7, "bestValleyScore":I
    add-int/lit8 v8, v4, -0x1

    .local v8, "x":I
    :goto_2
    if-gt v8, v2, :cond_1

    .line 193
    .end local v8    # "x":I
    shl-int/lit8 v8, v6, 0x3

    return v8

    .line 185
    .restart local v8    # "x":I
    :cond_1
    sub-int v9, v8, v2

    .line 186
    .local v9, "fromFirst":I
    mul-int v10, v9, v9

    sub-int v11, v4, v8

    mul-int/2addr v10, v11

    aget v11, p0, v8

    sub-int v11, v1, v11

    mul-int/2addr v10, v11

    .line 187
    .local v10, "score":I
    if-le v10, v7, :cond_2

    .line 188
    move v6, v8

    .line 189
    move v7, v10

    .line 184
    .end local v9    # "fromFirst":I
    .end local v10    # "score":I
    :cond_2
    add-int/lit8 v8, v8, -0x1

    goto :goto_2

    .line 178
    .end local v6    # "bestValley":I
    .end local v7    # "bestValleyScore":I
    .end local v8    # "x":I
    :cond_3
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v6

    throw v6

    .line 159
    .local v6, "x":I
    :cond_4
    sub-int v7, v6, v2

    .line 161
    .local v7, "distanceToBiggest":I
    aget v8, p0, v6

    mul-int/2addr v8, v7

    mul-int/2addr v8, v7

    .line 162
    .local v8, "score":I
    if-le v8, v5, :cond_5

    .line 163
    move v4, v6

    .line 164
    move v5, v8

    .line 158
    .end local v7    # "distanceToBiggest":I
    .end local v8    # "score":I
    :cond_5
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    .line 146
    .end local v5    # "secondPeakScore":I
    .end local v6    # "x":I
    .local v4, "x":I
    :cond_6
    aget v5, p0, v4

    if-le v5, v3, :cond_7

    .line 147
    move v2, v4

    .line 148
    aget v3, p0, v4

    .line 150
    :cond_7
    aget v5, p0, v4

    if-le v5, v1, :cond_8

    .line 151
    aget v1, p0, v4

    .line 145
    :cond_8
    add-int/lit8 v4, v4, 0x1

    goto :goto_0
.end method

.method private initArrays(I)V
    .locals 3
    .param p1, "luminanceSize"    # I

    .line 131
    iget-object v0, p0, Lcom/google/zxing/common/GlobalHistogramBinarizer;->luminances:[B

    array-length v0, v0

    if-ge v0, p1, :cond_0

    .line 132
    new-array v0, p1, [B

    iput-object v0, p0, Lcom/google/zxing/common/GlobalHistogramBinarizer;->luminances:[B

    .line 134
    :cond_0
    const/4 v0, 0x0

    .local v0, "x":I
    :goto_0
    const/16 v1, 0x20

    if-lt v0, v1, :cond_1

    .line 137
    .end local v0    # "x":I
    return-void

    .line 135
    .restart local v0    # "x":I
    :cond_1
    iget-object v1, p0, Lcom/google/zxing/common/GlobalHistogramBinarizer;->buckets:[I

    const/4 v2, 0x0

    aput v2, v1, v0

    .line 134
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method


# virtual methods
.method public createBinarizer(Lcom/google/zxing/LuminanceSource;)Lcom/google/zxing/Binarizer;
    .locals 1
    .param p1, "source"    # Lcom/google/zxing/LuminanceSource;

    .line 127
    new-instance v0, Lcom/google/zxing/common/GlobalHistogramBinarizer;

    invoke-direct {v0, p1}, Lcom/google/zxing/common/GlobalHistogramBinarizer;-><init>(Lcom/google/zxing/LuminanceSource;)V

    return-object v0
.end method

.method public getBlackMatrix()Lcom/google/zxing/common/BitMatrix;
    .locals 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .line 88
    invoke-virtual {p0}, Lcom/google/zxing/common/GlobalHistogramBinarizer;->getLuminanceSource()Lcom/google/zxing/LuminanceSource;

    move-result-object v0

    .line 89
    .local v0, "source":Lcom/google/zxing/LuminanceSource;
    invoke-virtual {v0}, Lcom/google/zxing/LuminanceSource;->getWidth()I

    move-result v1

    .line 90
    .local v1, "width":I
    invoke-virtual {v0}, Lcom/google/zxing/LuminanceSource;->getHeight()I

    move-result v2

    .line 91
    .local v2, "height":I
    new-instance v3, Lcom/google/zxing/common/BitMatrix;

    invoke-direct {v3, v1, v2}, Lcom/google/zxing/common/BitMatrix;-><init>(II)V

    .line 95
    .local v3, "matrix":Lcom/google/zxing/common/BitMatrix;
    invoke-direct {p0, v1}, Lcom/google/zxing/common/GlobalHistogramBinarizer;->initArrays(I)V

    .line 96
    iget-object v4, p0, Lcom/google/zxing/common/GlobalHistogramBinarizer;->buckets:[I

    .line 97
    .local v4, "localBuckets":[I
    const/4 v5, 0x1

    .local v5, "y":I
    :goto_0
    const/4 v6, 0x5

    if-lt v5, v6, :cond_3

    .line 106
    .end local v5    # "y":I
    invoke-static {v4}, Lcom/google/zxing/common/GlobalHistogramBinarizer;->estimateBlackPoint([I)I

    move-result v7

    .line 111
    .local v7, "blackPoint":I
    invoke-virtual {v0}, Lcom/google/zxing/LuminanceSource;->getMatrix()[B

    move-result-object v8

    .line 112
    .local v8, "localLuminances":[B
    const/4 v5, 0x0

    .restart local v5    # "y":I
    move v9, v5

    .end local v5    # "y":I
    .local v9, "y":I
    :goto_1
    if-lt v9, v2, :cond_0

    .line 122
    .end local v9    # "y":I
    return-object v3

    .line 113
    .restart local v9    # "y":I
    :cond_0
    mul-int v10, v9, v1

    .line 114
    .local v10, "offset":I
    const/4 v5, 0x0

    .local v5, "x":I
    :goto_2
    if-lt v5, v1, :cond_1

    .line 112
    .end local v5    # "x":I
    .end local v10    # "offset":I
    add-int/lit8 v9, v9, 0x1

    goto :goto_1

    .line 115
    .restart local v5    # "x":I
    .restart local v10    # "offset":I
    :cond_1
    add-int v6, v10, v5

    aget-byte v6, v8, v6

    and-int/lit16 v6, v6, 0xff

    .line 116
    .local v6, "pixel":I
    if-ge v6, v7, :cond_2

    .line 117
    invoke-virtual {v3, v5, v9}, Lcom/google/zxing/common/BitMatrix;->set(II)V

    .line 114
    .end local v6    # "pixel":I
    :cond_2
    add-int/lit8 v5, v5, 0x1

    goto :goto_2

    .line 98
    .end local v7    # "blackPoint":I
    .end local v8    # "localLuminances":[B
    .end local v9    # "y":I
    .end local v10    # "offset":I
    .local v5, "y":I
    :cond_3
    mul-int v7, v2, v5

    div-int/2addr v7, v6

    .line 99
    .local v7, "row":I
    iget-object v8, p0, Lcom/google/zxing/common/GlobalHistogramBinarizer;->luminances:[B

    invoke-virtual {v0, v7, v8}, Lcom/google/zxing/LuminanceSource;->getRow(I[B)[B

    move-result-object v8

    .line 100
    .restart local v8    # "localLuminances":[B
    mul-int/lit8 v9, v1, 0x4

    div-int/2addr v9, v6

    .line 101
    .local v9, "right":I
    div-int/lit8 v6, v1, 0x5

    .local v6, "x":I
    :goto_3
    if-lt v6, v9, :cond_4

    .line 97
    .end local v6    # "x":I
    .end local v7    # "row":I
    .end local v8    # "localLuminances":[B
    .end local v9    # "right":I
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 102
    .restart local v6    # "x":I
    .restart local v7    # "row":I
    .restart local v8    # "localLuminances":[B
    .restart local v9    # "right":I
    :cond_4
    aget-byte v10, v8, v6

    and-int/lit16 v10, v10, 0xff

    .line 103
    .local v10, "pixel":I
    shr-int/lit8 v11, v10, 0x3

    aget v12, v4, v11

    add-int/lit8 v12, v12, 0x1

    aput v12, v4, v11

    .line 101
    .end local v10    # "pixel":I
    add-int/lit8 v6, v6, 0x1

    goto :goto_3
.end method

.method public getBlackRow(ILcom/google/zxing/common/BitArray;)Lcom/google/zxing/common/BitArray;
    .locals 10
    .param p1, "y"    # I
    .param p2, "row"    # Lcom/google/zxing/common/BitArray;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .line 53
    invoke-virtual {p0}, Lcom/google/zxing/common/GlobalHistogramBinarizer;->getLuminanceSource()Lcom/google/zxing/LuminanceSource;

    move-result-object v0

    .line 54
    .local v0, "source":Lcom/google/zxing/LuminanceSource;
    invoke-virtual {v0}, Lcom/google/zxing/LuminanceSource;->getWidth()I

    move-result v1

    .line 55
    .local v1, "width":I
    if-eqz p2, :cond_1

    invoke-virtual {p2}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v2

    if-ge v2, v1, :cond_0

    goto :goto_0

    .line 58
    :cond_0
    invoke-virtual {p2}, Lcom/google/zxing/common/BitArray;->clear()V

    goto :goto_1

    .line 56
    :cond_1
    :goto_0
    new-instance v2, Lcom/google/zxing/common/BitArray;

    invoke-direct {v2, v1}, Lcom/google/zxing/common/BitArray;-><init>(I)V

    move-object p2, v2

    .line 57
    nop

    .line 61
    :goto_1
    invoke-direct {p0, v1}, Lcom/google/zxing/common/GlobalHistogramBinarizer;->initArrays(I)V

    .line 62
    iget-object v2, p0, Lcom/google/zxing/common/GlobalHistogramBinarizer;->luminances:[B

    invoke-virtual {v0, p1, v2}, Lcom/google/zxing/LuminanceSource;->getRow(I[B)[B

    move-result-object v2

    .line 63
    .local v2, "localLuminances":[B
    iget-object v3, p0, Lcom/google/zxing/common/GlobalHistogramBinarizer;->buckets:[I

    .line 64
    .local v3, "localBuckets":[I
    const/4 v4, 0x0

    .local v4, "x":I
    :goto_2
    const/4 v5, 0x1

    if-lt v4, v1, :cond_4

    .line 68
    .end local v4    # "x":I
    invoke-static {v3}, Lcom/google/zxing/common/GlobalHistogramBinarizer;->estimateBlackPoint([I)I

    move-result v6

    .line 70
    .local v6, "blackPoint":I
    const/4 v4, 0x0

    aget-byte v4, v2, v4

    and-int/lit16 v4, v4, 0xff

    .line 71
    .local v4, "left":I
    aget-byte v5, v2, v5

    and-int/lit16 v5, v5, 0xff

    .line 72
    .local v5, "center":I
    const/4 v7, 0x1

    .local v7, "x":I
    :goto_3
    add-int/lit8 v8, v1, -0x1

    if-lt v7, v8, :cond_2

    .line 82
    .end local v7    # "x":I
    return-object p2

    .line 73
    .restart local v7    # "x":I
    :cond_2
    add-int/lit8 v8, v7, 0x1

    aget-byte v8, v2, v8

    and-int/lit16 v8, v8, 0xff

    .line 75
    .local v8, "right":I
    mul-int/lit8 v9, v5, 0x4

    sub-int/2addr v9, v4

    sub-int/2addr v9, v8

    div-int/lit8 v9, v9, 0x2

    .line 76
    .local v9, "luminance":I
    if-ge v9, v6, :cond_3

    .line 77
    invoke-virtual {p2, v7}, Lcom/google/zxing/common/BitArray;->set(I)V

    .line 79
    :cond_3
    move v4, v5

    .line 80
    move v5, v8

    .line 72
    .end local v8    # "right":I
    .end local v9    # "luminance":I
    add-int/lit8 v7, v7, 0x1

    goto :goto_3

    .line 65
    .end local v5    # "center":I
    .end local v6    # "blackPoint":I
    .end local v7    # "x":I
    .local v4, "x":I
    :cond_4
    aget-byte v6, v2, v4

    and-int/lit16 v6, v6, 0xff

    .line 66
    .local v6, "pixel":I
    shr-int/lit8 v7, v6, 0x3

    aget v8, v3, v7

    add-int/2addr v8, v5

    aput v8, v3, v7

    .line 64
    .end local v6    # "pixel":I
    add-int/lit8 v4, v4, 0x1

    goto :goto_2
.end method
