.class public final Lcom/google/zxing/oned/rss/RSS14Reader;
.super Lcom/google/zxing/oned/rss/AbstractRSSReader;
.source "RSS14Reader.java"


# static fields
.field private static final FINDER_PATTERNS:[[I

.field private static final INSIDE_GSUM:[I

.field private static final INSIDE_ODD_TOTAL_SUBSET:[I

.field private static final INSIDE_ODD_WIDEST:[I

.field private static final OUTSIDE_EVEN_TOTAL_SUBSET:[I

.field private static final OUTSIDE_GSUM:[I

.field private static final OUTSIDE_ODD_WIDEST:[I


# instance fields
.field private final possibleLeftPairs:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/google/zxing/oned/rss/Pair;",
            ">;"
        }
    .end annotation
.end field

.field private final possibleRightPairs:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/google/zxing/oned/rss/Pair;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 8

    .line 37
    const/4 v0, 0x5

    new-array v1, v0, [I

    fill-array-data v1, :array_90

    sput-object v1, Lcom/google/zxing/oned/rss/RSS14Reader;->OUTSIDE_EVEN_TOTAL_SUBSET:[I

    .line 38
    const/4 v1, 0x4

    new-array v2, v1, [I

    fill-array-data v2, :array_9e

    sput-object v2, Lcom/google/zxing/oned/rss/RSS14Reader;->INSIDE_ODD_TOTAL_SUBSET:[I

    .line 39
    new-array v2, v0, [I

    const/4 v3, 0x1

    const/16 v4, 0xa1

    aput v4, v2, v3

    const/4 v4, 0x2

    const/16 v5, 0x3c1

    aput v5, v2, v4

    const/4 v5, 0x3

    const/16 v6, 0x7df

    aput v6, v2, v5

    const/16 v6, 0xa9b

    aput v6, v2, v1

    sput-object v2, Lcom/google/zxing/oned/rss/RSS14Reader;->OUTSIDE_GSUM:[I

    .line 40
    new-array v2, v1, [I

    const/16 v6, 0x150

    aput v6, v2, v3

    const/16 v6, 0x40c

    aput v6, v2, v4

    const/16 v6, 0x5ec

    aput v6, v2, v5

    sput-object v2, Lcom/google/zxing/oned/rss/RSS14Reader;->INSIDE_GSUM:[I

    .line 41
    new-array v2, v0, [I

    fill-array-data v2, :array_aa

    sput-object v2, Lcom/google/zxing/oned/rss/RSS14Reader;->OUTSIDE_ODD_WIDEST:[I

    .line 42
    new-array v2, v1, [I

    fill-array-data v2, :array_b8

    sput-object v2, Lcom/google/zxing/oned/rss/RSS14Reader;->INSIDE_ODD_WIDEST:[I

    .line 44
    const/16 v2, 0x9

    new-array v2, v2, [[I

    .line 45
    new-array v6, v1, [I

    fill-array-data v6, :array_c4

    const/4 v7, 0x0

    aput-object v6, v2, v7

    .line 46
    new-array v6, v1, [I

    fill-array-data v6, :array_d0

    aput-object v6, v2, v3

    .line 47
    new-array v3, v1, [I

    fill-array-data v3, :array_dc

    aput-object v3, v2, v4

    .line 48
    new-array v3, v1, [I

    fill-array-data v3, :array_e8

    aput-object v3, v2, v5

    .line 49
    new-array v3, v1, [I

    fill-array-data v3, :array_f4

    aput-object v3, v2, v1

    .line 50
    new-array v3, v1, [I

    fill-array-data v3, :array_100

    aput-object v3, v2, v0

    .line 51
    new-array v0, v1, [I

    fill-array-data v0, :array_10c

    const/4 v3, 0x6

    aput-object v0, v2, v3

    .line 52
    new-array v0, v1, [I

    fill-array-data v0, :array_118

    const/4 v3, 0x7

    aput-object v0, v2, v3

    .line 53
    new-array v0, v1, [I

    fill-array-data v0, :array_124

    const/16 v1, 0x8

    aput-object v0, v2, v1

    .line 44
    sput-object v2, Lcom/google/zxing/oned/rss/RSS14Reader;->FINDER_PATTERNS:[[I

    .line 54
    return-void

    :array_90
    .array-data 4
        0x1
        0xa
        0x22
        0x46
        0x7e
    .end array-data

    :array_9e
    .array-data 4
        0x4
        0x14
        0x30
        0x51
    .end array-data

    :array_aa
    .array-data 4
        0x8
        0x6
        0x4
        0x3
        0x1
    .end array-data

    :array_b8
    .array-data 4
        0x2
        0x4
        0x6
        0x8
    .end array-data

    :array_c4
    .array-data 4
        0x3
        0x8
        0x2
        0x1
    .end array-data

    :array_d0
    .array-data 4
        0x3
        0x5
        0x5
        0x1
    .end array-data

    :array_dc
    .array-data 4
        0x3
        0x3
        0x7
        0x1
    .end array-data

    :array_e8
    .array-data 4
        0x3
        0x1
        0x9
        0x1
    .end array-data

    :array_f4
    .array-data 4
        0x2
        0x7
        0x4
        0x1
    .end array-data

    :array_100
    .array-data 4
        0x2
        0x5
        0x6
        0x1
    .end array-data

    :array_10c
    .array-data 4
        0x2
        0x3
        0x8
        0x1
    .end array-data

    :array_118
    .array-data 4
        0x1
        0x5
        0x7
        0x1
    .end array-data

    :array_124
    .array-data 4
        0x1
        0x3
        0x9
        0x1
    .end array-data
.end method

.method public constructor <init>()V
    .registers 2

    .line 59
    invoke-direct {p0}, Lcom/google/zxing/oned/rss/AbstractRSSReader;-><init>()V

    .line 60
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/zxing/oned/rss/RSS14Reader;->possibleLeftPairs:Ljava/util/List;

    .line 61
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/zxing/oned/rss/RSS14Reader;->possibleRightPairs:Ljava/util/List;

    .line 62
    return-void
.end method

.method private static addOrTally(Ljava/util/Collection;Lcom/google/zxing/oned/rss/Pair;)V
    .registers 7
    .param p1, "pair"    # Lcom/google/zxing/oned/rss/Pair;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Lcom/google/zxing/oned/rss/Pair;",
            ">;",
            "Lcom/google/zxing/oned/rss/Pair;",
            ")V"
        }
    .end annotation

    .line 93
    .local p0, "possiblePairs":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/google/zxing/oned/rss/Pair;>;"
    if-nez p1, :cond_3

    .line 94
    return-void

    .line 96
    :cond_3
    const/4 v0, 0x0

    .line 97
    .local v0, "found":Z
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_8
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_f

    goto :goto_24

    :cond_f
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/zxing/oned/rss/Pair;

    .line 98
    .local v2, "other":Lcom/google/zxing/oned/rss/Pair;
    invoke-virtual {v2}, Lcom/google/zxing/oned/rss/Pair;->getValue()I

    move-result v3

    invoke-virtual {p1}, Lcom/google/zxing/oned/rss/Pair;->getValue()I

    move-result v4

    if-ne v3, v4, :cond_8

    .line 99
    invoke-virtual {v2}, Lcom/google/zxing/oned/rss/Pair;->incrementCount()V

    .line 100
    const/4 v0, 0x1

    .line 101
    nop

    .line 104
    .end local v2    # "other":Lcom/google/zxing/oned/rss/Pair;
    :goto_24
    if-nez v0, :cond_29

    .line 105
    invoke-interface {p0, p1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 107
    :cond_29
    return-void
.end method

.method private adjustOddEvenCounts(ZI)V
    .registers 15
    .param p1, "outsideChar"    # Z
    .param p2, "numModules"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .line 362
    invoke-virtual {p0}, Lcom/google/zxing/oned/rss/RSS14Reader;->getOddCounts()[I

    move-result-object v0

    invoke-static {v0}, Lcom/google/zxing/oned/rss/RSS14Reader;->count([I)I

    move-result v0

    .line 363
    .local v0, "oddSum":I
    invoke-virtual {p0}, Lcom/google/zxing/oned/rss/RSS14Reader;->getEvenCounts()[I

    move-result-object v1

    invoke-static {v1}, Lcom/google/zxing/oned/rss/RSS14Reader;->count([I)I

    move-result v1

    .line 364
    .local v1, "evenSum":I
    add-int v2, v0, v1

    sub-int/2addr v2, p2

    .line 365
    .local v2, "mismatch":I
    and-int/lit8 v3, v0, 0x1

    const/4 v4, 0x0

    const/4 v5, 0x1

    if-ne v3, p1, :cond_1b

    move v3, v5

    goto :goto_1c

    :cond_1b
    move v3, v4

    .line 366
    .local v3, "oddParityBad":Z
    :goto_1c
    and-int/lit8 v6, v1, 0x1

    if-ne v6, v5, :cond_22

    move v4, v5

    nop

    .line 368
    .local v4, "evenParityBad":Z
    :cond_22
    const/4 v6, 0x0

    .line 369
    .local v6, "incrementOdd":Z
    const/4 v7, 0x0

    .line 370
    .local v7, "decrementOdd":Z
    const/4 v8, 0x0

    .line 371
    .local v8, "incrementEven":Z
    const/4 v9, 0x0

    .line 373
    .local v9, "decrementEven":Z
    const/4 v10, 0x4

    if-eqz p1, :cond_3a

    .line 374
    const/16 v11, 0xc

    if-le v0, v11, :cond_2f

    .line 375
    const/4 v7, 0x1

    .line 376
    goto :goto_32

    :cond_2f
    if-ge v0, v10, :cond_32

    .line 377
    const/4 v6, 0x1

    .line 379
    :cond_32
    :goto_32
    if-le v1, v11, :cond_36

    .line 380
    const/4 v9, 0x1

    .line 381
    goto :goto_4d

    :cond_36
    if-ge v1, v10, :cond_4d

    .line 382
    const/4 v8, 0x1

    .line 384
    goto :goto_4d

    .line 385
    :cond_3a
    const/16 v11, 0xb

    if-le v0, v11, :cond_40

    .line 386
    const/4 v7, 0x1

    .line 387
    goto :goto_44

    :cond_40
    const/4 v11, 0x5

    if-ge v0, v11, :cond_44

    .line 388
    const/4 v6, 0x1

    .line 390
    :cond_44
    :goto_44
    const/16 v11, 0xa

    if-le v1, v11, :cond_4a

    .line 391
    const/4 v9, 0x1

    .line 392
    goto :goto_4d

    :cond_4a
    if-ge v1, v10, :cond_4d

    .line 393
    const/4 v8, 0x1

    .line 409
    :cond_4d
    :goto_4d
    if-ne v2, v5, :cond_63

    .line 410
    if-eqz v3, :cond_5a

    .line 411
    if-nez v4, :cond_55

    .line 414
    const/4 v7, 0x1

    .line 415
    goto :goto_8f

    .line 412
    :cond_55
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v5

    throw v5

    .line 416
    :cond_5a
    if-eqz v4, :cond_5e

    .line 419
    const/4 v9, 0x1

    .line 421
    goto :goto_8f

    .line 417
    :cond_5e
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v5

    throw v5

    .line 421
    :cond_63
    const/4 v5, -0x1

    if-ne v2, v5, :cond_7a

    .line 422
    if-eqz v3, :cond_71

    .line 423
    if-nez v4, :cond_6c

    .line 426
    const/4 v6, 0x1

    .line 427
    goto :goto_8f

    .line 424
    :cond_6c
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v5

    throw v5

    .line 428
    :cond_71
    if-eqz v4, :cond_75

    .line 431
    const/4 v8, 0x1

    .line 433
    goto :goto_8f

    .line 429
    :cond_75
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v5

    throw v5

    .line 433
    :cond_7a
    if-nez v2, :cond_d9

    .line 434
    if-eqz v3, :cond_8d

    .line 435
    if-eqz v4, :cond_88

    .line 439
    if-ge v0, v1, :cond_85

    .line 440
    const/4 v6, 0x1

    .line 441
    const/4 v9, 0x1

    .line 442
    goto :goto_8f

    .line 443
    :cond_85
    const/4 v7, 0x1

    .line 444
    const/4 v8, 0x1

    .line 446
    goto :goto_8f

    .line 436
    :cond_88
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v5

    throw v5

    .line 447
    :cond_8d
    if-nez v4, :cond_d4

    .line 456
    :goto_8f
    if-eqz v6, :cond_a4

    .line 457
    if-nez v7, :cond_9f

    .line 460
    invoke-virtual {p0}, Lcom/google/zxing/oned/rss/RSS14Reader;->getOddCounts()[I

    move-result-object v5

    invoke-virtual {p0}, Lcom/google/zxing/oned/rss/RSS14Reader;->getOddRoundingErrors()[F

    move-result-object v10

    invoke-static {v5, v10}, Lcom/google/zxing/oned/rss/RSS14Reader;->increment([I[F)V

    goto :goto_a4

    .line 458
    :cond_9f
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v5

    throw v5

    .line 462
    :cond_a4
    :goto_a4
    if-eqz v7, :cond_b1

    .line 463
    invoke-virtual {p0}, Lcom/google/zxing/oned/rss/RSS14Reader;->getOddCounts()[I

    move-result-object v5

    invoke-virtual {p0}, Lcom/google/zxing/oned/rss/RSS14Reader;->getOddRoundingErrors()[F

    move-result-object v10

    invoke-static {v5, v10}, Lcom/google/zxing/oned/rss/RSS14Reader;->decrement([I[F)V

    .line 465
    :cond_b1
    if-eqz v8, :cond_c6

    .line 466
    if-nez v9, :cond_c1

    .line 469
    invoke-virtual {p0}, Lcom/google/zxing/oned/rss/RSS14Reader;->getEvenCounts()[I

    move-result-object v5

    invoke-virtual {p0}, Lcom/google/zxing/oned/rss/RSS14Reader;->getOddRoundingErrors()[F

    move-result-object v10

    invoke-static {v5, v10}, Lcom/google/zxing/oned/rss/RSS14Reader;->increment([I[F)V

    goto :goto_c6

    .line 467
    :cond_c1
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v5

    throw v5

    .line 471
    :cond_c6
    :goto_c6
    if-eqz v9, :cond_d3

    .line 472
    invoke-virtual {p0}, Lcom/google/zxing/oned/rss/RSS14Reader;->getEvenCounts()[I

    move-result-object v5

    invoke-virtual {p0}, Lcom/google/zxing/oned/rss/RSS14Reader;->getEvenRoundingErrors()[F

    move-result-object v10

    invoke-static {v5, v10}, Lcom/google/zxing/oned/rss/RSS14Reader;->decrement([I[F)V

    .line 475
    :cond_d3
    return-void

    .line 448
    :cond_d4
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v5

    throw v5

    .line 453
    :cond_d9
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v5

    throw v5
.end method

.method private static checkChecksum(Lcom/google/zxing/oned/rss/Pair;Lcom/google/zxing/oned/rss/Pair;)Z
    .registers 5
    .param p0, "leftPair"    # Lcom/google/zxing/oned/rss/Pair;
    .param p1, "rightPair"    # Lcom/google/zxing/oned/rss/Pair;

    .line 151
    invoke-virtual {p0}, Lcom/google/zxing/oned/rss/Pair;->getChecksumPortion()I

    move-result v0

    invoke-virtual {p1}, Lcom/google/zxing/oned/rss/Pair;->getChecksumPortion()I

    move-result v1

    const/16 v2, 0x10

    mul-int/2addr v2, v1

    add-int/2addr v0, v2

    rem-int/lit8 v0, v0, 0x4f

    .line 153
    .local v0, "checkValue":I
    invoke-virtual {p0}, Lcom/google/zxing/oned/rss/Pair;->getFinderPattern()Lcom/google/zxing/oned/rss/FinderPattern;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/zxing/oned/rss/FinderPattern;->getValue()I

    move-result v1

    const/16 v2, 0x9

    mul-int/2addr v2, v1

    invoke-virtual {p1}, Lcom/google/zxing/oned/rss/Pair;->getFinderPattern()Lcom/google/zxing/oned/rss/FinderPattern;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/zxing/oned/rss/FinderPattern;->getValue()I

    move-result v1

    add-int/2addr v2, v1

    .line 152
    move v1, v2

    .line 154
    .local v1, "targetCheckValue":I
    const/16 v2, 0x48

    if-le v1, v2, :cond_29

    .line 155
    add-int/lit8 v1, v1, -0x1

    .line 157
    :cond_29
    const/16 v2, 0x8

    if-le v1, v2, :cond_2f

    .line 158
    add-int/lit8 v1, v1, -0x1

    .line 160
    :cond_2f
    if-ne v0, v1, :cond_33

    const/4 v2, 0x1

    return v2

    :cond_33
    const/4 v2, 0x0

    return v2
.end method

.method private static constructResult(Lcom/google/zxing/oned/rss/Pair;Lcom/google/zxing/oned/rss/Pair;)Lcom/google/zxing/Result;
    .registers 17
    .param p0, "leftPair"    # Lcom/google/zxing/oned/rss/Pair;
    .param p1, "rightPair"    # Lcom/google/zxing/oned/rss/Pair;

    .line 116
    invoke-virtual {p0}, Lcom/google/zxing/oned/rss/Pair;->getValue()I

    move-result v0

    int-to-long v0, v0

    const-wide/32 v2, 0x453af5

    mul-long/2addr v2, v0

    invoke-virtual/range {p1 .. p1}, Lcom/google/zxing/oned/rss/Pair;->getValue()I

    move-result v0

    int-to-long v0, v0

    add-long/2addr v2, v0

    .line 117
    .local v2, "symbolValue":J
    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    .line 119
    .local v0, "text":Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuilder;

    const/16 v4, 0xe

    invoke-direct {v1, v4}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 120
    .local v1, "buffer":Ljava/lang/StringBuilder;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v4

    const/16 v5, 0xd

    rsub-int/lit8 v4, v4, 0xd

    .local v4, "i":I
    :goto_22
    const/16 v6, 0x30

    if-gtz v4, :cond_81

    .line 123
    .end local v4    # "i":I
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 125
    const/4 v4, 0x0

    .line 126
    .local v4, "checkDigit":I
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_2b
    const/4 v8, 0x3

    if-lt v7, v5, :cond_71

    .line 130
    .end local v7    # "i":I
    rem-int/lit8 v5, v4, 0xa

    const/16 v6, 0xa

    rsub-int/lit8 v4, v5, 0xa

    .line 131
    if-ne v4, v6, :cond_37

    .line 132
    const/4 v4, 0x0

    .line 134
    :cond_37
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 136
    invoke-virtual {p0}, Lcom/google/zxing/oned/rss/Pair;->getFinderPattern()Lcom/google/zxing/oned/rss/FinderPattern;

    move-result-object v5

    invoke-virtual {v5}, Lcom/google/zxing/oned/rss/FinderPattern;->getResultPoints()[Lcom/google/zxing/ResultPoint;

    move-result-object v5

    .line 137
    .local v5, "leftPoints":[Lcom/google/zxing/ResultPoint;
    invoke-virtual/range {p1 .. p1}, Lcom/google/zxing/oned/rss/Pair;->getFinderPattern()Lcom/google/zxing/oned/rss/FinderPattern;

    move-result-object v6

    invoke-virtual {v6}, Lcom/google/zxing/oned/rss/FinderPattern;->getResultPoints()[Lcom/google/zxing/ResultPoint;

    move-result-object v6

    .line 138
    .local v6, "rightPoints":[Lcom/google/zxing/ResultPoint;
    new-instance v7, Lcom/google/zxing/Result;

    .line 139
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    .line 140
    const/4 v10, 0x0

    .line 141
    const/4 v11, 0x4

    new-array v11, v11, [Lcom/google/zxing/ResultPoint;

    const/4 v12, 0x0

    aget-object v13, v5, v12

    aput-object v13, v11, v12

    const/4 v13, 0x1

    aget-object v14, v5, v13

    aput-object v14, v11, v13

    const/4 v14, 0x2

    aget-object v12, v6, v12

    aput-object v12, v11, v14

    aget-object v12, v6, v13

    aput-object v12, v11, v8

    .line 142
    sget-object v8, Lcom/google/zxing/BarcodeFormat;->RSS_14:Lcom/google/zxing/BarcodeFormat;

    .line 138
    invoke-direct {v7, v9, v10, v11, v8}, Lcom/google/zxing/Result;-><init>(Ljava/lang/String;[B[Lcom/google/zxing/ResultPoint;Lcom/google/zxing/BarcodeFormat;)V

    return-object v7

    .line 127
    .end local v5    # "leftPoints":[Lcom/google/zxing/ResultPoint;
    .end local v6    # "rightPoints":[Lcom/google/zxing/ResultPoint;
    .restart local v7    # "i":I
    :cond_71
    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v9

    sub-int/2addr v9, v6

    .line 128
    .local v9, "digit":I
    and-int/lit8 v10, v7, 0x1

    if-nez v10, :cond_7c

    mul-int/2addr v8, v9

    goto :goto_7d

    :cond_7c
    move v8, v9

    :goto_7d
    add-int/2addr v4, v8

    .line 126
    .end local v9    # "digit":I
    add-int/lit8 v7, v7, 0x1

    goto :goto_2b

    .line 121
    .end local v7    # "i":I
    .local v4, "i":I
    :cond_81
    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 120
    add-int/lit8 v4, v4, -0x1

    goto :goto_22
.end method

.method private decodeDataCharacter(Lcom/google/zxing/common/BitArray;Lcom/google/zxing/oned/rss/FinderPattern;Z)Lcom/google/zxing/oned/rss/DataCharacter;
    .registers 31
    .param p1, "row"    # Lcom/google/zxing/common/BitArray;
    .param p2, "pattern"    # Lcom/google/zxing/oned/rss/FinderPattern;
    .param p3, "outsideChar"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    move-object/from16 v0, p1

    .line 193
    move/from16 v1, p3

    invoke-virtual/range {p0 .. p0}, Lcom/google/zxing/oned/rss/RSS14Reader;->getDataCharacterCounters()[I

    move-result-object v2

    .line 194
    .local v2, "counters":[I
    const/4 v3, 0x0

    aput v3, v2, v3

    .line 195
    const/4 v4, 0x1

    aput v3, v2, v4

    .line 196
    const/4 v5, 0x2

    aput v3, v2, v5

    .line 197
    const/4 v6, 0x3

    aput v3, v2, v6

    .line 198
    const/4 v7, 0x4

    aput v3, v2, v7

    .line 199
    const/4 v8, 0x5

    aput v3, v2, v8

    .line 200
    const/4 v8, 0x6

    aput v3, v2, v8

    .line 201
    const/4 v8, 0x7

    aput v3, v2, v8

    .line 203
    if-eqz v1, :cond_2c

    .line 204
    invoke-virtual/range {p2 .. p2}, Lcom/google/zxing/oned/rss/FinderPattern;->getStartEnd()[I

    move-result-object v8

    aget v8, v8, v3

    invoke-static {v0, v8, v2}, Lcom/google/zxing/oned/rss/RSS14Reader;->recordPatternInReverse(Lcom/google/zxing/common/BitArray;I[I)V

    .line 205
    goto :goto_3b

    .line 206
    :cond_2c
    invoke-virtual/range {p2 .. p2}, Lcom/google/zxing/oned/rss/FinderPattern;->getStartEnd()[I

    move-result-object v8

    aget v8, v8, v4

    add-int/2addr v8, v4

    invoke-static {v0, v8, v2}, Lcom/google/zxing/oned/rss/RSS14Reader;->recordPattern(Lcom/google/zxing/common/BitArray;I[I)V

    .line 208
    const/4 v8, 0x0

    .local v8, "i":I
    array-length v9, v2

    sub-int/2addr v9, v4

    .local v9, "j":I
    :goto_39
    if-lt v8, v9, :cond_153

    .line 215
    .end local v8    # "i":I
    .end local v9    # "j":I
    :goto_3b
    if-eqz v1, :cond_40

    const/16 v8, 0x10

    goto :goto_42

    :cond_40
    const/16 v8, 0xf

    :goto_42
    move v10, v8

    .line 216
    .local v10, "numModules":I
    invoke-static {v2}, Lcom/google/zxing/oned/rss/RSS14Reader;->count([I)I

    move-result v8

    int-to-float v8, v8

    int-to-float v9, v10

    div-float v11, v8, v9

    .line 218
    .local v11, "elementWidth":F
    invoke-virtual/range {p0 .. p0}, Lcom/google/zxing/oned/rss/RSS14Reader;->getOddCounts()[I

    move-result-object v12

    .line 219
    .local v12, "oddCounts":[I
    invoke-virtual/range {p0 .. p0}, Lcom/google/zxing/oned/rss/RSS14Reader;->getEvenCounts()[I

    move-result-object v13

    .line 220
    .local v13, "evenCounts":[I
    invoke-virtual/range {p0 .. p0}, Lcom/google/zxing/oned/rss/RSS14Reader;->getOddRoundingErrors()[F

    move-result-object v14

    .line 221
    .local v14, "oddRoundingErrors":[F
    invoke-virtual/range {p0 .. p0}, Lcom/google/zxing/oned/rss/RSS14Reader;->getEvenRoundingErrors()[F

    move-result-object v15

    .line 223
    .local v15, "evenRoundingErrors":[F
    const/4 v8, 0x0

    .restart local v8    # "i":I
    :goto_5c
    array-length v9, v2

    if-lt v8, v9, :cond_11c

    .line 241
    .end local v8    # "i":I
    move-object/from16 v9, p0

    invoke-direct {v9, v1, v10}, Lcom/google/zxing/oned/rss/RSS14Reader;->adjustOddEvenCounts(ZI)V

    .line 243
    const/4 v8, 0x0

    .line 244
    .local v8, "oddSum":I
    const/16 v16, 0x0

    .line 245
    .local v16, "oddChecksumPortion":I
    array-length v3, v12

    sub-int/2addr v3, v4

    .local v3, "i":I
    :goto_69
    if-gez v3, :cond_108

    .line 250
    .end local v3    # "i":I
    const/4 v3, 0x0

    .line 251
    .local v3, "evenChecksumPortion":I
    const/16 v18, 0x0

    .line 252
    .local v18, "evenSum":I
    array-length v5, v13

    sub-int/2addr v5, v4

    .local v5, "i":I
    move/from16 v20, v18

    .end local v18    # "evenSum":I
    .local v20, "evenSum":I
    :goto_72
    if-gez v5, :cond_f1

    .line 257
    .end local v5    # "i":I
    mul-int/2addr v6, v3

    add-int v6, v16, v6

    .line 259
    .local v6, "checksumPortion":I
    if-eqz v1, :cond_b3

    .line 260
    and-int/lit8 v5, v8, 0x1

    if-nez v5, :cond_ae

    const/16 v5, 0xc

    if-gt v8, v5, :cond_ae

    if-lt v8, v7, :cond_ae

    .line 263
    sub-int/2addr v5, v8

    const/4 v7, 0x2

    div-int/2addr v5, v7

    .line 264
    .local v5, "group":I
    sget-object v7, Lcom/google/zxing/oned/rss/RSS14Reader;->OUTSIDE_ODD_WIDEST:[I

    aget v7, v7, v5

    .line 265
    .local v7, "oddWidest":I
    rsub-int/lit8 v4, v7, 0x9

    .line 266
    .local v4, "evenWidest":I
    const/4 v0, 0x0

    invoke-static {v12, v7, v0}, Lcom/google/zxing/oned/rss/RSSUtils;->getRSSvalue([IIZ)I

    move-result v0

    .line 267
    .local v0, "vOdd":I
    const/4 v1, 0x1

    invoke-static {v13, v4, v1}, Lcom/google/zxing/oned/rss/RSSUtils;->getRSSvalue([IIZ)I

    move-result v1

    .line 268
    .local v1, "vEven":I
    sget-object v17, Lcom/google/zxing/oned/rss/RSS14Reader;->OUTSIDE_EVEN_TOTAL_SUBSET:[I

    aget v17, v17, v5

    .line 269
    .local v17, "tEven":I
    sget-object v18, Lcom/google/zxing/oned/rss/RSS14Reader;->OUTSIDE_GSUM:[I

    aget v18, v18, v5

    .line 270
    .local v18, "gSum":I
    move/from16 v21, v4

    new-instance v4, Lcom/google/zxing/oned/rss/DataCharacter;

    .end local v4    # "evenWidest":I
    .local v21, "evenWidest":I
    mul-int v19, v0, v17

    add-int v19, v19, v1

    move/from16 v22, v0

    add-int v0, v19, v18

    .end local v0    # "vOdd":I
    .local v22, "vOdd":I
    invoke-direct {v4, v0, v6}, Lcom/google/zxing/oned/rss/DataCharacter;-><init>(II)V

    return-object v4

    .line 261
    .end local v1    # "vEven":I
    .end local v5    # "group":I
    .end local v7    # "oddWidest":I
    .end local v17    # "tEven":I
    .end local v18    # "gSum":I
    .end local v21    # "evenWidest":I
    .end local v22    # "vOdd":I
    :cond_ae
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v0

    throw v0

    .line 272
    :cond_b3
    move/from16 v0, v20

    and-int/lit8 v1, v0, 0x1

    .end local v20    # "evenSum":I
    .local v0, "evenSum":I
    if-nez v1, :cond_ec

    const/16 v1, 0xa

    if-gt v0, v1, :cond_ec

    if-lt v0, v7, :cond_ec

    .line 275
    sub-int/2addr v1, v0

    const/4 v4, 0x2

    div-int/2addr v1, v4

    .line 276
    .local v1, "group":I
    sget-object v4, Lcom/google/zxing/oned/rss/RSS14Reader;->INSIDE_ODD_WIDEST:[I

    aget v4, v4, v1

    .line 277
    .local v4, "oddWidest":I
    rsub-int/lit8 v5, v4, 0x9

    .line 278
    .local v5, "evenWidest":I
    const/4 v7, 0x1

    invoke-static {v12, v4, v7}, Lcom/google/zxing/oned/rss/RSSUtils;->getRSSvalue([IIZ)I

    move-result v7

    .line 279
    .local v7, "vOdd":I
    move/from16 v23, v4

    const/4 v4, 0x0

    invoke-static {v13, v5, v4}, Lcom/google/zxing/oned/rss/RSSUtils;->getRSSvalue([IIZ)I

    move-result v4

    .line 280
    .local v4, "vEven":I
    .local v23, "oddWidest":I
    sget-object v17, Lcom/google/zxing/oned/rss/RSS14Reader;->INSIDE_ODD_TOTAL_SUBSET:[I

    aget v17, v17, v1

    .line 281
    .local v17, "tOdd":I
    sget-object v18, Lcom/google/zxing/oned/rss/RSS14Reader;->INSIDE_GSUM:[I

    aget v18, v18, v1

    .line 282
    .restart local v18    # "gSum":I
    move/from16 v24, v1

    new-instance v1, Lcom/google/zxing/oned/rss/DataCharacter;

    .end local v1    # "group":I
    .local v24, "group":I
    mul-int v19, v4, v17

    add-int v19, v19, v7

    move/from16 v25, v4

    add-int v4, v19, v18

    .end local v4    # "vEven":I
    .local v25, "vEven":I
    invoke-direct {v1, v4, v6}, Lcom/google/zxing/oned/rss/DataCharacter;-><init>(II)V

    return-object v1

    .line 273
    .end local v5    # "evenWidest":I
    .end local v7    # "vOdd":I
    .end local v17    # "tOdd":I
    .end local v18    # "gSum":I
    .end local v23    # "oddWidest":I
    .end local v24    # "group":I
    .end local v25    # "vEven":I
    :cond_ec
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v1

    throw v1

    .line 253
    .end local v0    # "evenSum":I
    .end local v6    # "checksumPortion":I
    .local v5, "i":I
    .restart local v20    # "evenSum":I
    :cond_f1
    move/from16 v0, v20

    const/4 v1, 0x2

    const/4 v4, 0x0

    .end local v20    # "evenSum":I
    .restart local v0    # "evenSum":I
    mul-int/lit8 v3, v3, 0x9

    .line 254
    aget v17, v13, v5

    add-int v3, v3, v17

    .line 255
    aget v17, v13, v5

    add-int v20, v0, v17

    .line 252
    .end local v0    # "evenSum":I
    .restart local v20    # "evenSum":I
    add-int/lit8 v5, v5, -0x1

    move-object/from16 v0, p1

    move/from16 v1, p3

    const/4 v4, 0x1

    goto/16 :goto_72

    .line 246
    .end local v5    # "i":I
    .end local v20    # "evenSum":I
    .local v3, "i":I
    :cond_108
    move v1, v5

    const/4 v4, 0x0

    mul-int/lit8 v16, v16, 0x9

    .line 247
    aget v0, v12, v3

    add-int v16, v16, v0

    .line 248
    aget v0, v12, v3

    add-int/2addr v8, v0

    .line 245
    add-int/lit8 v3, v3, -0x1

    move-object/from16 v0, p1

    move/from16 v1, p3

    const/4 v4, 0x1

    goto/16 :goto_69

    .line 224
    .end local v3    # "i":I
    .end local v16    # "oddChecksumPortion":I
    .local v8, "i":I
    :cond_11c
    move-object/from16 v9, p0

    move v4, v3

    move v1, v5

    aget v0, v2, v8

    int-to-float v0, v0

    div-float/2addr v0, v11

    .line 225
    .local v0, "value":F
    const/high16 v3, 0x3f000000    # 0.5f

    add-float/2addr v3, v0

    float-to-int v3, v3

    .line 226
    .local v3, "count":I
    const/4 v5, 0x1

    if-ge v3, v5, :cond_12d

    .line 227
    const/4 v3, 0x1

    .line 228
    goto :goto_133

    :cond_12d
    const/16 v1, 0x8

    if-le v3, v1, :cond_133

    .line 229
    const/16 v3, 0x8

    .line 231
    :cond_133
    :goto_133
    div-int/lit8 v1, v8, 0x2

    .line 232
    .local v1, "offset":I
    and-int/lit8 v16, v8, 0x1

    if-nez v16, :cond_141

    .line 233
    aput v3, v12, v1

    .line 234
    int-to-float v4, v3

    sub-float v4, v0, v4

    aput v4, v14, v1

    .line 235
    goto :goto_148

    .line 236
    :cond_141
    aput v3, v13, v1

    .line 237
    int-to-float v4, v3

    sub-float v4, v0, v4

    aput v4, v15, v1

    .line 223
    .end local v0    # "value":F
    .end local v1    # "offset":I
    .end local v3    # "count":I
    :goto_148
    add-int/lit8 v8, v8, 0x1

    move v4, v5

    move-object/from16 v0, p1

    move/from16 v1, p3

    const/4 v3, 0x0

    const/4 v5, 0x2

    goto/16 :goto_5c

    .line 209
    .end local v10    # "numModules":I
    .end local v11    # "elementWidth":F
    .end local v12    # "oddCounts":[I
    .end local v13    # "evenCounts":[I
    .end local v14    # "oddRoundingErrors":[F
    .end local v15    # "evenRoundingErrors":[F
    .restart local v9    # "j":I
    :cond_153
    move v5, v4

    aget v0, v2, v8

    .line 210
    .local v0, "temp":I
    aget v1, v2, v9

    aput v1, v2, v8

    .line 211
    aput v0, v2, v9

    .line 208
    .end local v0    # "temp":I
    add-int/lit8 v8, v8, 0x1

    add-int/lit8 v9, v9, -0x1

    move-object/from16 v0, p1

    move/from16 v1, p3

    const/4 v3, 0x0

    const/4 v5, 0x2

    goto/16 :goto_39
.end method

.method private decodePair(Lcom/google/zxing/common/BitArray;ZILjava/util/Map;)Lcom/google/zxing/oned/rss/Pair;
    .registers 16
    .param p1, "row"    # Lcom/google/zxing/common/BitArray;
    .param p2, "right"    # Z
    .param p3, "rowNumber"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/zxing/common/BitArray;",
            "ZI",
            "Ljava/util/Map<",
            "Lcom/google/zxing/DecodeHintType;",
            "*>;)",
            "Lcom/google/zxing/oned/rss/Pair;"
        }
    .end annotation

    .line 165
    .local p4, "hints":Ljava/util/Map;, "Ljava/util/Map<Lcom/google/zxing/DecodeHintType;*>;"
    const/4 v0, 0x0

    const/4 v1, 0x0

    :try_start_2
    invoke-direct {p0, p1, v1, p2}, Lcom/google/zxing/oned/rss/RSS14Reader;->findFinderPattern(Lcom/google/zxing/common/BitArray;IZ)[I

    move-result-object v2

    .line 166
    .local v2, "startEnd":[I
    invoke-direct {p0, p1, p3, p2, v2}, Lcom/google/zxing/oned/rss/RSS14Reader;->parseFoundFinderPattern(Lcom/google/zxing/common/BitArray;IZ[I)Lcom/google/zxing/oned/rss/FinderPattern;

    move-result-object v3

    .line 168
    .local v3, "pattern":Lcom/google/zxing/oned/rss/FinderPattern;
    if-nez p4, :cond_e

    move-object v4, v0

    goto :goto_16

    .line 169
    :cond_e
    sget-object v4, Lcom/google/zxing/DecodeHintType;->NEED_RESULT_POINT_CALLBACK:Lcom/google/zxing/DecodeHintType;

    invoke-interface {p4, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/google/zxing/ResultPointCallback;

    .line 168
    :goto_16
    nop

    .line 171
    .local v4, "resultPointCallback":Lcom/google/zxing/ResultPointCallback;
    const/4 v5, 0x1

    if-eqz v4, :cond_36

    .line 172
    aget v6, v2, v1

    aget v7, v2, v5

    add-int/2addr v6, v7

    int-to-float v6, v6

    const/high16 v7, 0x40000000    # 2.0f

    div-float/2addr v6, v7

    .line 173
    .local v6, "center":F
    if-eqz p2, :cond_2d

    .line 175
    invoke-virtual {p1}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v7

    sub-int/2addr v7, v5

    int-to-float v7, v7

    sub-float v6, v7, v6

    .line 177
    :cond_2d
    new-instance v7, Lcom/google/zxing/ResultPoint;

    int-to-float v8, p3

    invoke-direct {v7, v6, v8}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    invoke-interface {v4, v7}, Lcom/google/zxing/ResultPointCallback;->foundPossibleResultPoint(Lcom/google/zxing/ResultPoint;)V

    .line 180
    .end local v6    # "center":F
    :cond_36
    invoke-direct {p0, p1, v3, v5}, Lcom/google/zxing/oned/rss/RSS14Reader;->decodeDataCharacter(Lcom/google/zxing/common/BitArray;Lcom/google/zxing/oned/rss/FinderPattern;Z)Lcom/google/zxing/oned/rss/DataCharacter;

    move-result-object v5

    .line 181
    .local v5, "outside":Lcom/google/zxing/oned/rss/DataCharacter;
    invoke-direct {p0, p1, v3, v1}, Lcom/google/zxing/oned/rss/RSS14Reader;->decodeDataCharacter(Lcom/google/zxing/common/BitArray;Lcom/google/zxing/oned/rss/FinderPattern;Z)Lcom/google/zxing/oned/rss/DataCharacter;

    move-result-object v1

    .line 182
    .local v1, "inside":Lcom/google/zxing/oned/rss/DataCharacter;
    new-instance v6, Lcom/google/zxing/oned/rss/Pair;

    const/16 v7, 0x63d

    invoke-virtual {v5}, Lcom/google/zxing/oned/rss/DataCharacter;->getValue()I

    move-result v8

    mul-int/2addr v7, v8

    invoke-virtual {v1}, Lcom/google/zxing/oned/rss/DataCharacter;->getValue()I

    move-result v8

    add-int/2addr v7, v8

    .line 183
    invoke-virtual {v5}, Lcom/google/zxing/oned/rss/DataCharacter;->getChecksumPortion()I

    move-result v8

    const/4 v9, 0x4

    invoke-virtual {v1}, Lcom/google/zxing/oned/rss/DataCharacter;->getChecksumPortion()I

    move-result v10

    mul-int/2addr v9, v10

    add-int/2addr v8, v9

    .line 184
    nop

    .line 182
    invoke-direct {v6, v7, v8, v3}, Lcom/google/zxing/oned/rss/Pair;-><init>(IILcom/google/zxing/oned/rss/FinderPattern;)V
    :try_end_5b
    .catch Lcom/google/zxing/NotFoundException; {:try_start_2 .. :try_end_5b} :catch_5c

    return-object v6

    .line 185
    .end local v1    # "inside":Lcom/google/zxing/oned/rss/DataCharacter;
    .end local v2    # "startEnd":[I
    .end local v3    # "pattern":Lcom/google/zxing/oned/rss/FinderPattern;
    .end local v4    # "resultPointCallback":Lcom/google/zxing/ResultPointCallback;
    .end local v5    # "outside":Lcom/google/zxing/oned/rss/DataCharacter;
    :catch_5c
    move-exception v1

    .line 186
    .local v1, "ignored":Lcom/google/zxing/NotFoundException;
    return-object v0
.end method

.method private findFinderPattern(Lcom/google/zxing/common/BitArray;IZ)[I
    .registers 16
    .param p1, "row"    # Lcom/google/zxing/common/BitArray;
    .param p2, "rowOffset"    # I
    .param p3, "rightFinderPattern"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .line 290
    invoke-virtual {p0}, Lcom/google/zxing/oned/rss/RSS14Reader;->getDecodeFinderCounters()[I

    move-result-object v0

    .line 291
    .local v0, "counters":[I
    const/4 v1, 0x0

    aput v1, v0, v1

    .line 292
    const/4 v2, 0x1

    aput v1, v0, v2

    .line 293
    const/4 v3, 0x2

    aput v1, v0, v3

    .line 294
    const/4 v4, 0x3

    aput v1, v0, v4

    .line 296
    invoke-virtual {p1}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v5

    .line 297
    .local v5, "width":I
    const/4 v6, 0x0

    .line 298
    .local v6, "isWhite":Z
    :goto_15
    if-lt p2, v5, :cond_18

    goto :goto_21

    .line 299
    :cond_18
    invoke-virtual {p1, p2}, Lcom/google/zxing/common/BitArray;->get(I)Z

    move-result v7

    xor-int/2addr v7, v2

    move v6, v7

    .line 300
    if-ne p3, v6, :cond_69

    .line 302
    nop

    .line 307
    :goto_21
    const/4 v7, 0x0

    .line 308
    .local v7, "counterPosition":I
    move v8, p2

    .line 309
    .local v8, "patternStart":I
    move v9, p2

    .local v9, "x":I
    :goto_24
    if-ge v9, v5, :cond_64

    .line 310
    invoke-virtual {p1, v9}, Lcom/google/zxing/common/BitArray;->get(I)Z

    move-result v10

    xor-int/2addr v10, v6

    if-eqz v10, :cond_33

    .line 311
    aget v10, v0, v7

    add-int/2addr v10, v2

    aput v10, v0, v7

    .line 312
    goto :goto_61

    .line 313
    :cond_33
    if-ne v7, v4, :cond_57

    .line 314
    invoke-static {v0}, Lcom/google/zxing/oned/rss/RSS14Reader;->isFinderPattern([I)Z

    move-result v10

    if-eqz v10, :cond_42

    .line 315
    new-array v3, v3, [I

    aput v8, v3, v1

    aput v9, v3, v2

    return-object v3

    .line 317
    :cond_42
    aget v10, v0, v1

    aget v11, v0, v2

    add-int/2addr v10, v11

    add-int/2addr v8, v10

    .line 318
    aget v10, v0, v3

    aput v10, v0, v1

    .line 319
    aget v10, v0, v4

    aput v10, v0, v2

    .line 320
    aput v1, v0, v3

    .line 321
    aput v1, v0, v4

    .line 322
    add-int/lit8 v7, v7, -0x1

    .line 323
    goto :goto_59

    .line 324
    :cond_57
    add-int/lit8 v7, v7, 0x1

    .line 326
    :goto_59
    aput v2, v0, v7

    .line 327
    if-eqz v6, :cond_5f

    move v10, v1

    goto :goto_60

    :cond_5f
    move v10, v2

    :goto_60
    move v6, v10

    .line 309
    :goto_61
    add-int/lit8 v9, v9, 0x1

    goto :goto_24

    .line 330
    .end local v9    # "x":I
    :cond_64
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v1

    throw v1

    .line 304
    .end local v7    # "counterPosition":I
    .end local v8    # "patternStart":I
    :cond_69
    add-int/lit8 p2, p2, 0x1

    goto :goto_15
.end method

.method private parseFoundFinderPattern(Lcom/google/zxing/common/BitArray;IZ[I)Lcom/google/zxing/oned/rss/FinderPattern;
    .registers 22
    .param p1, "row"    # Lcom/google/zxing/common/BitArray;
    .param p2, "rowNumber"    # I
    .param p3, "right"    # Z
    .param p4, "startEnd"    # [I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    move-object/from16 v0, p1

    .line 337
    const/4 v1, 0x0

    aget v2, p4, v1

    invoke-virtual {v0, v2}, Lcom/google/zxing/common/BitArray;->get(I)Z

    move-result v2

    .line 338
    .local v2, "firstIsBlack":Z
    aget v3, p4, v1

    const/4 v4, 0x1

    sub-int/2addr v3, v4

    .line 340
    .local v3, "firstElementStart":I
    :goto_d
    if-ltz v3, :cond_1a

    invoke-virtual {v0, v3}, Lcom/google/zxing/common/BitArray;->get(I)Z

    move-result v5

    xor-int/2addr v5, v2

    if-nez v5, :cond_17

    goto :goto_1a

    .line 341
    :cond_17
    add-int/lit8 v3, v3, -0x1

    goto :goto_d

    .line 343
    :cond_1a
    :goto_1a
    add-int/2addr v3, v4

    .line 344
    aget v5, p4, v1

    sub-int/2addr v5, v3

    .line 346
    .local v5, "firstCounter":I
    invoke-virtual/range {p0 .. p0}, Lcom/google/zxing/oned/rss/RSS14Reader;->getDecodeFinderCounters()[I

    move-result-object v6

    .line 347
    .local v6, "counters":[I
    array-length v7, v6

    sub-int/2addr v7, v4

    invoke-static {v6, v1, v6, v4, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 348
    aput v5, v6, v1

    .line 349
    sget-object v7, Lcom/google/zxing/oned/rss/RSS14Reader;->FINDER_PATTERNS:[[I

    invoke-static {v6, v7}, Lcom/google/zxing/oned/rss/RSS14Reader;->parseFinderValue([I[[I)I

    move-result v7

    .line 350
    .local v7, "value":I
    move v8, v3

    .line 351
    .local v8, "start":I
    aget v9, p4, v4

    .line 352
    .local v9, "end":I
    if-eqz p3, :cond_43

    .line 354
    invoke-virtual/range {p1 .. p1}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v10

    sub-int/2addr v10, v4

    sub-int/2addr v10, v8

    .line 355
    .end local v8    # "start":I
    .local v10, "start":I
    invoke-virtual/range {p1 .. p1}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v8

    sub-int/2addr v8, v4

    sub-int/2addr v8, v9

    .line 357
    .end local v9    # "end":I
    .local v8, "end":I
    move v15, v8

    move v14, v10

    goto :goto_45

    .end local v10    # "start":I
    .local v8, "start":I
    .restart local v9    # "end":I
    :cond_43
    move v14, v8

    move v15, v9

    .end local v8    # "start":I
    .end local v9    # "end":I
    .local v14, "start":I
    .local v15, "end":I
    :goto_45
    new-instance v16, Lcom/google/zxing/oned/rss/FinderPattern;

    const/4 v8, 0x2

    new-array v10, v8, [I

    aput v3, v10, v1

    aget v1, p4, v4

    aput v1, v10, v4

    move-object/from16 v8, v16

    move v9, v7

    move v11, v14

    move v12, v15

    move/from16 v13, p2

    invoke-direct/range {v8 .. v13}, Lcom/google/zxing/oned/rss/FinderPattern;-><init>(I[IIII)V

    return-object v16
.end method


# virtual methods
.method public decodeRow(ILcom/google/zxing/common/BitArray;Ljava/util/Map;)Lcom/google/zxing/Result;
    .registers 14
    .param p1, "rowNumber"    # I
    .param p2, "row"    # Lcom/google/zxing/common/BitArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lcom/google/zxing/common/BitArray;",
            "Ljava/util/Map<",
            "Lcom/google/zxing/DecodeHintType;",
            "*>;)",
            "Lcom/google/zxing/Result;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .line 68
    .local p3, "hints":Ljava/util/Map;, "Ljava/util/Map<Lcom/google/zxing/DecodeHintType;*>;"
    const/4 v0, 0x0

    invoke-direct {p0, p2, v0, p1, p3}, Lcom/google/zxing/oned/rss/RSS14Reader;->decodePair(Lcom/google/zxing/common/BitArray;ZILjava/util/Map;)Lcom/google/zxing/oned/rss/Pair;

    move-result-object v0

    .line 69
    .local v0, "leftPair":Lcom/google/zxing/oned/rss/Pair;
    iget-object v1, p0, Lcom/google/zxing/oned/rss/RSS14Reader;->possibleLeftPairs:Ljava/util/List;

    invoke-static {v1, v0}, Lcom/google/zxing/oned/rss/RSS14Reader;->addOrTally(Ljava/util/Collection;Lcom/google/zxing/oned/rss/Pair;)V

    .line 70
    invoke-virtual {p2}, Lcom/google/zxing/common/BitArray;->reverse()V

    .line 71
    const/4 v1, 0x1

    invoke-direct {p0, p2, v1, p1, p3}, Lcom/google/zxing/oned/rss/RSS14Reader;->decodePair(Lcom/google/zxing/common/BitArray;ZILjava/util/Map;)Lcom/google/zxing/oned/rss/Pair;

    move-result-object v2

    .line 72
    .local v2, "rightPair":Lcom/google/zxing/oned/rss/Pair;
    iget-object v3, p0, Lcom/google/zxing/oned/rss/RSS14Reader;->possibleRightPairs:Ljava/util/List;

    invoke-static {v3, v2}, Lcom/google/zxing/oned/rss/RSS14Reader;->addOrTally(Ljava/util/Collection;Lcom/google/zxing/oned/rss/Pair;)V

    .line 73
    invoke-virtual {p2}, Lcom/google/zxing/common/BitArray;->reverse()V

    .line 74
    iget-object v3, p0, Lcom/google/zxing/oned/rss/RSS14Reader;->possibleLeftPairs:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    .line 75
    .local v3, "lefSize":I
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_21
    if-ge v4, v3, :cond_5a

    .line 76
    iget-object v5, p0, Lcom/google/zxing/oned/rss/RSS14Reader;->possibleLeftPairs:Ljava/util/List;

    invoke-interface {v5, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/google/zxing/oned/rss/Pair;

    .line 77
    .local v5, "left":Lcom/google/zxing/oned/rss/Pair;
    invoke-virtual {v5}, Lcom/google/zxing/oned/rss/Pair;->getCount()I

    move-result v6

    if-le v6, v1, :cond_57

    .line 78
    iget-object v6, p0, Lcom/google/zxing/oned/rss/RSS14Reader;->possibleRightPairs:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v6

    .line 79
    .local v6, "rightSize":I
    const/4 v7, 0x0

    .local v7, "j":I
    :goto_38
    if-lt v7, v6, :cond_3b

    .end local v5    # "left":Lcom/google/zxing/oned/rss/Pair;
    .end local v6    # "rightSize":I
    .end local v7    # "j":I
    goto :goto_57

    .line 80
    .restart local v5    # "left":Lcom/google/zxing/oned/rss/Pair;
    .restart local v6    # "rightSize":I
    .restart local v7    # "j":I
    :cond_3b
    iget-object v8, p0, Lcom/google/zxing/oned/rss/RSS14Reader;->possibleRightPairs:Ljava/util/List;

    invoke-interface {v8, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/google/zxing/oned/rss/Pair;

    .line 81
    .local v8, "right":Lcom/google/zxing/oned/rss/Pair;
    invoke-virtual {v8}, Lcom/google/zxing/oned/rss/Pair;->getCount()I

    move-result v9

    if-le v9, v1, :cond_54

    .line 82
    invoke-static {v5, v8}, Lcom/google/zxing/oned/rss/RSS14Reader;->checkChecksum(Lcom/google/zxing/oned/rss/Pair;Lcom/google/zxing/oned/rss/Pair;)Z

    move-result v9

    if-eqz v9, :cond_54

    .line 83
    invoke-static {v5, v8}, Lcom/google/zxing/oned/rss/RSS14Reader;->constructResult(Lcom/google/zxing/oned/rss/Pair;Lcom/google/zxing/oned/rss/Pair;)Lcom/google/zxing/Result;

    move-result-object v1

    return-object v1

    .line 79
    .end local v8    # "right":Lcom/google/zxing/oned/rss/Pair;
    :cond_54
    add-int/lit8 v7, v7, 0x1

    goto :goto_38

    .line 75
    .end local v5    # "left":Lcom/google/zxing/oned/rss/Pair;
    .end local v6    # "rightSize":I
    .end local v7    # "j":I
    :cond_57
    :goto_57
    add-int/lit8 v4, v4, 0x1

    goto :goto_21

    .line 89
    .end local v4    # "i":I
    :cond_5a
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v1

    throw v1
.end method

.method public reset()V
    .registers 2

    .line 111
    iget-object v0, p0, Lcom/google/zxing/oned/rss/RSS14Reader;->possibleLeftPairs:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 112
    iget-object v0, p0, Lcom/google/zxing/oned/rss/RSS14Reader;->possibleRightPairs:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 113
    return-void
.end method
