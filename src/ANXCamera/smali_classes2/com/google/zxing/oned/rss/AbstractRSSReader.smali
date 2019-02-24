.class public abstract Lcom/google/zxing/oned/rss/AbstractRSSReader;
.super Lcom/google/zxing/oned/OneDReader;
.source "AbstractRSSReader.java"


# static fields
.field private static final MAX_AVG_VARIANCE:F = 0.2f

.field private static final MAX_FINDER_PATTERN_RATIO:F = 0.89285713f

.field private static final MAX_INDIVIDUAL_VARIANCE:F = 0.45f

.field private static final MIN_FINDER_PATTERN_RATIO:F = 0.7916667f


# instance fields
.field private final dataCharacterCounters:[I

.field private final decodeFinderCounters:[I

.field private final evenCounts:[I

.field private final evenRoundingErrors:[F

.field private final oddCounts:[I

.field private final oddRoundingErrors:[F


# direct methods
.method protected constructor <init>()V
    .registers 3

    .line 37
    invoke-direct {p0}, Lcom/google/zxing/oned/OneDReader;-><init>()V

    .line 38
    const/4 v0, 0x4

    new-array v1, v0, [I

    iput-object v1, p0, Lcom/google/zxing/oned/rss/AbstractRSSReader;->decodeFinderCounters:[I

    .line 39
    const/16 v1, 0x8

    new-array v1, v1, [I

    iput-object v1, p0, Lcom/google/zxing/oned/rss/AbstractRSSReader;->dataCharacterCounters:[I

    .line 40
    new-array v1, v0, [F

    iput-object v1, p0, Lcom/google/zxing/oned/rss/AbstractRSSReader;->oddRoundingErrors:[F

    .line 41
    new-array v0, v0, [F

    iput-object v0, p0, Lcom/google/zxing/oned/rss/AbstractRSSReader;->evenRoundingErrors:[F

    .line 42
    iget-object v0, p0, Lcom/google/zxing/oned/rss/AbstractRSSReader;->dataCharacterCounters:[I

    array-length v0, v0

    div-int/lit8 v0, v0, 0x2

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/google/zxing/oned/rss/AbstractRSSReader;->oddCounts:[I

    .line 43
    iget-object v0, p0, Lcom/google/zxing/oned/rss/AbstractRSSReader;->dataCharacterCounters:[I

    array-length v0, v0

    div-int/lit8 v0, v0, 0x2

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/google/zxing/oned/rss/AbstractRSSReader;->evenCounts:[I

    .line 44
    return-void
.end method

.method protected static count([I)I
    .registers 5
    .param p0, "array"    # [I

    .line 82
    const/4 v0, 0x0

    .line 83
    .local v0, "count":I
    array-length v1, p0

    const/4 v2, 0x0

    :goto_3
    if-lt v2, v1, :cond_6

    .line 86
    return v0

    .line 83
    :cond_6
    aget v3, p0, v2

    .line 84
    .local v3, "a":I
    add-int/2addr v0, v3

    .line 83
    .end local v3    # "a":I
    add-int/lit8 v2, v2, 0x1

    goto :goto_3
.end method

.method protected static decrement([I[F)V
    .registers 6
    .param p0, "array"    # [I
    .param p1, "errors"    # [F

    .line 102
    const/4 v0, 0x0

    .line 103
    .local v0, "index":I
    const/4 v1, 0x0

    aget v1, p1, v1

    .line 104
    .local v1, "biggestError":F
    const/4 v2, 0x1

    .local v2, "i":I
    :goto_5
    array-length v3, p0

    if-lt v2, v3, :cond_f

    .line 110
    .end local v2    # "i":I
    aget v2, p0, v0

    add-int/lit8 v2, v2, -0x1

    aput v2, p0, v0

    .line 111
    return-void

    .line 105
    .restart local v2    # "i":I
    :cond_f
    aget v3, p1, v2

    cmpg-float v3, v3, v1

    if-gez v3, :cond_18

    .line 106
    aget v1, p1, v2

    .line 107
    move v0, v2

    .line 104
    :cond_18
    add-int/lit8 v2, v2, 0x1

    goto :goto_5
.end method

.method protected static increment([I[F)V
    .registers 6
    .param p0, "array"    # [I
    .param p1, "errors"    # [F

    .line 90
    const/4 v0, 0x0

    .line 91
    .local v0, "index":I
    const/4 v1, 0x0

    aget v1, p1, v1

    .line 92
    .local v1, "biggestError":F
    const/4 v2, 0x1

    .local v2, "i":I
    :goto_5
    array-length v3, p0

    if-lt v2, v3, :cond_f

    .line 98
    .end local v2    # "i":I
    aget v2, p0, v0

    add-int/lit8 v2, v2, 0x1

    aput v2, p0, v0

    .line 99
    return-void

    .line 93
    .restart local v2    # "i":I
    :cond_f
    aget v3, p1, v2

    cmpl-float v3, v3, v1

    if-lez v3, :cond_18

    .line 94
    aget v1, p1, v2

    .line 95
    move v0, v2

    .line 92
    :cond_18
    add-int/lit8 v2, v2, 0x1

    goto :goto_5
.end method

.method protected static isFinderPattern([I)Z
    .registers 11
    .param p0, "counters"    # [I

    .line 114
    const/4 v0, 0x0

    aget v1, p0, v0

    const/4 v2, 0x1

    aget v3, p0, v2

    add-int/2addr v1, v3

    .line 115
    .local v1, "firstTwoSum":I
    const/4 v3, 0x2

    aget v3, p0, v3

    add-int/2addr v3, v1

    const/4 v4, 0x3

    aget v4, p0, v4

    add-int/2addr v3, v4

    .line 116
    .local v3, "sum":I
    int-to-float v4, v1

    int-to-float v5, v3

    div-float/2addr v4, v5

    .line 117
    .local v4, "ratio":F
    const v5, 0x3f4aaaab

    cmpl-float v5, v4, v5

    if-ltz v5, :cond_3c

    const v5, 0x3f649249

    cmpg-float v5, v4, v5

    if-gtz v5, :cond_3c

    .line 119
    const v5, 0x7fffffff

    .line 120
    .local v5, "minCounter":I
    const/high16 v6, -0x80000000

    .line 121
    .local v6, "maxCounter":I
    array-length v7, p0

    move v8, v5

    move v5, v0

    .end local v5    # "minCounter":I
    .local v8, "minCounter":I
    :goto_28
    if-lt v5, v7, :cond_31

    .line 129
    const/16 v5, 0xa

    mul-int/2addr v5, v8

    if-ge v6, v5, :cond_30

    return v2

    :cond_30
    return v0

    .line 121
    :cond_31
    aget v9, p0, v5

    .line 122
    .local v9, "counter":I
    if-le v9, v6, :cond_36

    .line 123
    move v6, v9

    .line 125
    :cond_36
    if-ge v9, v8, :cond_39

    .line 126
    move v8, v9

    .line 121
    .end local v9    # "counter":I
    :cond_39
    add-int/lit8 v5, v5, 0x1

    goto :goto_28

    .line 131
    .end local v6    # "maxCounter":I
    .end local v8    # "minCounter":I
    :cond_3c
    return v0
.end method

.method protected static parseFinderValue([I[[I)I
    .registers 5
    .param p0, "counters"    # [I
    .param p1, "finderPatterns"    # [[I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .line 72
    const/4 v0, 0x0

    .local v0, "value":I
    :goto_1
    array-length v1, p1

    if-ge v0, v1, :cond_18

    .line 73
    aget-object v1, p1, v0

    const v2, 0x3ee66666    # 0.45f

    invoke-static {p0, v1, v2}, Lcom/google/zxing/oned/rss/AbstractRSSReader;->patternMatchVariance([I[IF)F

    move-result v1

    .line 74
    const v2, 0x3e4ccccd    # 0.2f

    cmpg-float v1, v1, v2

    if-gez v1, :cond_15

    .line 75
    return v0

    .line 72
    :cond_15
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 78
    .end local v0    # "value":I
    :cond_18
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v0

    throw v0
.end method


# virtual methods
.method protected final getDataCharacterCounters()[I
    .registers 2

    .line 51
    iget-object v0, p0, Lcom/google/zxing/oned/rss/AbstractRSSReader;->dataCharacterCounters:[I

    return-object v0
.end method

.method protected final getDecodeFinderCounters()[I
    .registers 2

    .line 47
    iget-object v0, p0, Lcom/google/zxing/oned/rss/AbstractRSSReader;->decodeFinderCounters:[I

    return-object v0
.end method

.method protected final getEvenCounts()[I
    .registers 2

    .line 67
    iget-object v0, p0, Lcom/google/zxing/oned/rss/AbstractRSSReader;->evenCounts:[I

    return-object v0
.end method

.method protected final getEvenRoundingErrors()[F
    .registers 2

    .line 59
    iget-object v0, p0, Lcom/google/zxing/oned/rss/AbstractRSSReader;->evenRoundingErrors:[F

    return-object v0
.end method

.method protected final getOddCounts()[I
    .registers 2

    .line 63
    iget-object v0, p0, Lcom/google/zxing/oned/rss/AbstractRSSReader;->oddCounts:[I

    return-object v0
.end method

.method protected final getOddRoundingErrors()[F
    .registers 2

    .line 55
    iget-object v0, p0, Lcom/google/zxing/oned/rss/AbstractRSSReader;->oddRoundingErrors:[F

    return-object v0
.end method
