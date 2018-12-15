.class public final Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;
.super Lcom/google/zxing/oned/rss/AbstractRSSReader;
.source "RSSExpandedReader.java"


# static fields
.field private static final EVEN_TOTAL_SUBSET:[I

.field private static final FINDER_PATTERNS:[[I

.field private static final FINDER_PATTERN_SEQUENCES:[[I

.field private static final FINDER_PAT_A:I = 0x0

.field private static final FINDER_PAT_B:I = 0x1

.field private static final FINDER_PAT_C:I = 0x2

.field private static final FINDER_PAT_D:I = 0x3

.field private static final FINDER_PAT_E:I = 0x4

.field private static final FINDER_PAT_F:I = 0x5

.field private static final GSUM:[I

.field private static final MAX_PAIRS:I = 0xb

.field private static final SYMBOL_WIDEST:[I

.field private static final WEIGHTS:[[I


# instance fields
.field private final pairs:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/google/zxing/oned/rss/expanded/ExpandedPair;",
            ">;"
        }
    .end annotation
.end field

.field private final rows:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/google/zxing/oned/rss/expanded/ExpandedRow;",
            ">;"
        }
    .end annotation
.end field

.field private final startEnd:[I

.field private startFromEven:Z


# direct methods
.method static constructor <clinit>()V
    .registers 15

    .line 54
    const/4 v0, 0x5

    new-array v1, v0, [I

    fill-array-data v1, :array_1ae

    sput-object v1, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->SYMBOL_WIDEST:[I

    .line 55
    new-array v1, v0, [I

    fill-array-data v1, :array_1bc

    sput-object v1, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->EVEN_TOTAL_SUBSET:[I

    .line 56
    new-array v1, v0, [I

    const/4 v2, 0x1

    const/16 v3, 0x15c

    aput v3, v1, v2

    const/4 v3, 0x2

    const/16 v4, 0x56c

    aput v4, v1, v3

    const/4 v4, 0x3

    const/16 v5, 0xb84

    aput v5, v1, v4

    const/4 v5, 0x4

    const/16 v6, 0xf94

    aput v6, v1, v5

    sput-object v1, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->GSUM:[I

    .line 58
    const/4 v1, 0x6

    new-array v6, v1, [[I

    .line 59
    new-array v7, v5, [I

    fill-array-data v7, :array_1ca

    const/4 v8, 0x0

    aput-object v7, v6, v8

    .line 60
    new-array v7, v5, [I

    fill-array-data v7, :array_1d6

    aput-object v7, v6, v2

    .line 61
    new-array v7, v5, [I

    fill-array-data v7, :array_1e2

    aput-object v7, v6, v3

    .line 62
    new-array v7, v5, [I

    fill-array-data v7, :array_1ee

    aput-object v7, v6, v4

    .line 63
    new-array v7, v5, [I

    fill-array-data v7, :array_1fa

    aput-object v7, v6, v5

    .line 64
    new-array v7, v5, [I

    fill-array-data v7, :array_206

    aput-object v7, v6, v0

    .line 58
    sput-object v6, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->FINDER_PATTERNS:[[I

    .line 67
    const/16 v6, 0x17

    new-array v6, v6, [[I

    .line 68
    const/16 v7, 0x8

    new-array v9, v7, [I

    fill-array-data v9, :array_212

    aput-object v9, v6, v8

    .line 69
    new-array v9, v7, [I

    fill-array-data v9, :array_226

    aput-object v9, v6, v2

    .line 70
    new-array v9, v7, [I

    fill-array-data v9, :array_23a

    aput-object v9, v6, v3

    .line 71
    new-array v9, v7, [I

    fill-array-data v9, :array_24e

    aput-object v9, v6, v4

    .line 72
    new-array v9, v7, [I

    fill-array-data v9, :array_262

    aput-object v9, v6, v5

    .line 73
    new-array v9, v7, [I

    fill-array-data v9, :array_276

    aput-object v9, v6, v0

    .line 74
    new-array v9, v7, [I

    fill-array-data v9, :array_28a

    aput-object v9, v6, v1

    .line 75
    new-array v9, v7, [I

    fill-array-data v9, :array_29e

    const/4 v10, 0x7

    aput-object v9, v6, v10

    .line 76
    new-array v9, v7, [I

    fill-array-data v9, :array_2b2

    aput-object v9, v6, v7

    .line 77
    new-array v9, v7, [I

    fill-array-data v9, :array_2c6

    const/16 v11, 0x9

    aput-object v9, v6, v11

    .line 78
    new-array v9, v7, [I

    fill-array-data v9, :array_2da

    const/16 v12, 0xa

    aput-object v9, v6, v12

    .line 79
    new-array v9, v7, [I

    fill-array-data v9, :array_2ee

    const/16 v13, 0xb

    aput-object v9, v6, v13

    .line 80
    new-array v9, v7, [I

    fill-array-data v9, :array_302

    const/16 v14, 0xc

    aput-object v9, v6, v14

    .line 81
    new-array v9, v7, [I

    fill-array-data v9, :array_316

    const/16 v14, 0xd

    aput-object v9, v6, v14

    .line 82
    new-array v9, v7, [I

    fill-array-data v9, :array_32a

    const/16 v14, 0xe

    aput-object v9, v6, v14

    .line 83
    new-array v9, v7, [I

    fill-array-data v9, :array_33e

    const/16 v14, 0xf

    aput-object v9, v6, v14

    .line 84
    new-array v9, v7, [I

    fill-array-data v9, :array_352

    const/16 v14, 0x10

    aput-object v9, v6, v14

    .line 85
    new-array v9, v7, [I

    fill-array-data v9, :array_366

    const/16 v14, 0x11

    aput-object v9, v6, v14

    .line 86
    new-array v9, v7, [I

    fill-array-data v9, :array_37a

    const/16 v14, 0x12

    aput-object v9, v6, v14

    .line 87
    new-array v9, v7, [I

    fill-array-data v9, :array_38e

    const/16 v14, 0x13

    aput-object v9, v6, v14

    .line 88
    new-array v9, v7, [I

    fill-array-data v9, :array_3a2

    const/16 v14, 0x14

    aput-object v9, v6, v14

    .line 89
    new-array v9, v7, [I

    fill-array-data v9, :array_3b6

    const/16 v14, 0x15

    aput-object v9, v6, v14

    .line 90
    new-array v9, v7, [I

    fill-array-data v9, :array_3ca

    const/16 v14, 0x16

    aput-object v9, v6, v14

    .line 67
    sput-object v6, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->WEIGHTS:[[I

    .line 100
    new-array v6, v12, [[I

    .line 101
    new-array v9, v3, [I

    aput-object v9, v6, v8

    .line 102
    new-array v8, v4, [I

    aput v2, v8, v2

    aput v2, v8, v3

    aput-object v8, v6, v2

    .line 103
    new-array v8, v5, [I

    aput v3, v8, v2

    aput v2, v8, v3

    aput v4, v8, v4

    aput-object v8, v6, v3

    .line 104
    new-array v8, v0, [I

    aput v5, v8, v2

    aput v2, v8, v3

    aput v4, v8, v4

    aput v3, v8, v5

    aput-object v8, v6, v4

    .line 105
    new-array v8, v1, [I

    aput v5, v8, v2

    aput v2, v8, v3

    aput v4, v8, v4

    aput v4, v8, v5

    aput v0, v8, v0

    aput-object v8, v6, v5

    .line 106
    new-array v8, v10, [I

    aput v5, v8, v2

    aput v2, v8, v3

    aput v4, v8, v4

    aput v5, v8, v5

    aput v0, v8, v0

    aput v0, v8, v1

    aput-object v8, v6, v0

    .line 107
    new-array v8, v7, [I

    aput v2, v8, v3

    aput v2, v8, v4

    aput v3, v8, v5

    aput v3, v8, v0

    aput v4, v8, v1

    aput v4, v8, v10

    aput-object v8, v6, v1

    .line 108
    new-array v8, v11, [I

    aput v2, v8, v3

    aput v2, v8, v4

    aput v3, v8, v5

    aput v3, v8, v0

    aput v4, v8, v1

    aput v5, v8, v10

    aput v5, v8, v7

    aput-object v8, v6, v10

    .line 109
    new-array v8, v12, [I

    aput v2, v8, v3

    aput v2, v8, v4

    aput v3, v8, v5

    aput v3, v8, v0

    aput v4, v8, v1

    aput v5, v8, v10

    aput v0, v8, v7

    aput v0, v8, v11

    aput-object v8, v6, v7

    .line 110
    new-array v8, v13, [I

    aput v2, v8, v3

    aput v2, v8, v4

    aput v3, v8, v5

    aput v4, v8, v0

    aput v4, v8, v1

    aput v5, v8, v10

    aput v5, v8, v7

    aput v0, v8, v11

    aput v0, v8, v12

    aput-object v8, v6, v11

    .line 100
    sput-object v6, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->FINDER_PATTERN_SEQUENCES:[[I

    .line 115
    return-void

    :array_1ae
    .array-data 4
        0x7
        0x5
        0x4
        0x3
        0x1
    .end array-data

    :array_1bc
    .array-data 4
        0x4
        0x14
        0x34
        0x68
        0xcc
    .end array-data

    :array_1ca
    .array-data 4
        0x1
        0x8
        0x4
        0x1
    .end array-data

    :array_1d6
    .array-data 4
        0x3
        0x6
        0x4
        0x1
    .end array-data

    :array_1e2
    .array-data 4
        0x3
        0x4
        0x6
        0x1
    .end array-data

    :array_1ee
    .array-data 4
        0x3
        0x2
        0x8
        0x1
    .end array-data

    :array_1fa
    .array-data 4
        0x2
        0x6
        0x5
        0x1
    .end array-data

    :array_206
    .array-data 4
        0x2
        0x2
        0x9
        0x1
    .end array-data

    :array_212
    .array-data 4
        0x1
        0x3
        0x9
        0x1b
        0x51
        0x20
        0x60
        0x4d
    .end array-data

    :array_226
    .array-data 4
        0x14
        0x3c
        0xb4
        0x76
        0x8f
        0x7
        0x15
        0x3f
    .end array-data

    :array_23a
    .array-data 4
        0xbd
        0x91
        0xd
        0x27
        0x75
        0x8c
        0xd1
        0xcd
    .end array-data

    :array_24e
    .array-data 4
        0xc1
        0x9d
        0x31
        0x93
        0x13
        0x39
        0xab
        0x5b
    .end array-data

    :array_262
    .array-data 4
        0x3e
        0xba
        0x88
        0xc5
        0xa9
        0x55
        0x2c
        0x84
    .end array-data

    :array_276
    .array-data 4
        0xb9
        0x85
        0xbc
        0x8e
        0x4
        0xc
        0x24
        0x6c
    .end array-data

    :array_28a
    .array-data 4
        0x71
        0x80
        0xad
        0x61
        0x50
        0x1d
        0x57
        0x32
    .end array-data

    :array_29e
    .array-data 4
        0x96
        0x1c
        0x54
        0x29
        0x7b
        0x9e
        0x34
        0x9c
    .end array-data

    :array_2b2
    .array-data 4
        0x2e
        0x8a
        0xcb
        0xbb
        0x8b
        0xce
        0xc4
        0xa6
    .end array-data

    :array_2c6
    .array-data 4
        0x4c
        0x11
        0x33
        0x99
        0x25
        0x6f
        0x7a
        0x9b
    .end array-data

    :array_2da
    .array-data 4
        0x2b
        0x81
        0xb0
        0x6a
        0x6b
        0x6e
        0x77
        0x92
    .end array-data

    :array_2ee
    .array-data 4
        0x10
        0x30
        0x90
        0xa
        0x1e
        0x5a
        0x3b
        0xb1
    .end array-data

    :array_302
    .array-data 4
        0x6d
        0x74
        0x89
        0xc8
        0xb2
        0x70
        0x7d
        0xa4
    .end array-data

    :array_316
    .array-data 4
        0x46
        0xd2
        0xd0
        0xca
        0xb8
        0x82
        0xb3
        0x73
    .end array-data

    :array_32a
    .array-data 4
        0x86
        0xbf
        0x97
        0x1f
        0x5d
        0x44
        0xcc
        0xbe
    .end array-data

    :array_33e
    .array-data 4
        0x94
        0x16
        0x42
        0xc6
        0xac
        0x5e
        0x47
        0x2
    .end array-data

    :array_352
    .array-data 4
        0x6
        0x12
        0x36
        0xa2
        0x40
        0xc0
        0x9a
        0x28
    .end array-data

    :array_366
    .array-data 4
        0x78
        0x95
        0x19
        0x4b
        0xe
        0x2a
        0x7e
        0xa7
    .end array-data

    :array_37a
    .array-data 4
        0x4f
        0x1a
        0x4e
        0x17
        0x45
        0xcf
        0xc7
        0xaf
    .end array-data

    :array_38e
    .array-data 4
        0x67
        0x62
        0x53
        0x26
        0x72
        0x83
        0xb6
        0x7c
    .end array-data

    :array_3a2
    .array-data 4
        0xa1
        0x3d
        0xb7
        0x7f
        0xaa
        0x58
        0x35
        0x9f
    .end array-data

    :array_3b6
    .array-data 4
        0x37
        0xa5
        0x49
        0x8
        0x18
        0x48
        0x5
        0xf
    .end array-data

    :array_3ca
    .array-data 4
        0x2d
        0x87
        0xc2
        0xa0
        0x3a
        0xae
        0x64
        0x59
    .end array-data
.end method

.method public constructor <init>()V
    .registers 3

    .line 52
    invoke-direct {p0}, Lcom/google/zxing/oned/rss/AbstractRSSReader;-><init>()V

    .line 117
    new-instance v0, Ljava/util/ArrayList;

    const/16 v1, 0xb

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->pairs:Ljava/util/List;

    .line 118
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->rows:Ljava/util/List;

    .line 119
    const/4 v0, 0x2

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->startEnd:[I

    .line 121
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->startFromEven:Z

    .line 52
    return-void
.end method

.method private adjustOddEvenCounts(I)V
    .registers 14
    .param p1, "numModules"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .line 699
    invoke-virtual {p0}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->getOddCounts()[I

    move-result-object v0

    invoke-static {v0}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->count([I)I

    move-result v0

    .line 700
    .local v0, "oddSum":I
    invoke-virtual {p0}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->getEvenCounts()[I

    move-result-object v1

    invoke-static {v1}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->count([I)I

    move-result v1

    .line 701
    .local v1, "evenSum":I
    add-int v2, v0, v1

    sub-int/2addr v2, p1

    .line 702
    .local v2, "mismatch":I
    and-int/lit8 v3, v0, 0x1

    const/4 v4, 0x0

    const/4 v5, 0x1

    if-ne v3, v5, :cond_1b

    move v3, v5

    goto :goto_1c

    :cond_1b
    move v3, v4

    .line 703
    .local v3, "oddParityBad":Z
    :goto_1c
    and-int/lit8 v6, v1, 0x1

    if-nez v6, :cond_22

    move v4, v5

    nop

    .line 705
    .local v4, "evenParityBad":Z
    :cond_22
    const/4 v6, 0x0

    .line 706
    .local v6, "incrementOdd":Z
    const/4 v7, 0x0

    .line 708
    .local v7, "decrementOdd":Z
    const/4 v8, 0x4

    const/16 v9, 0xd

    if-le v0, v9, :cond_2b

    .line 709
    const/4 v7, 0x1

    .line 710
    goto :goto_2e

    :cond_2b
    if-ge v0, v8, :cond_2e

    .line 711
    const/4 v6, 0x1

    .line 713
    :cond_2e
    :goto_2e
    const/4 v10, 0x0

    .line 714
    .local v10, "incrementEven":Z
    const/4 v11, 0x0

    .line 715
    .local v11, "decrementEven":Z
    if-le v1, v9, :cond_34

    .line 716
    const/4 v11, 0x1

    .line 717
    goto :goto_37

    :cond_34
    if-ge v1, v8, :cond_37

    .line 718
    const/4 v10, 0x1

    .line 721
    :cond_37
    :goto_37
    if-ne v2, v5, :cond_4d

    .line 722
    if-eqz v3, :cond_44

    .line 723
    if-nez v4, :cond_3f

    .line 726
    const/4 v7, 0x1

    .line 727
    goto :goto_79

    .line 724
    :cond_3f
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v5

    throw v5

    .line 728
    :cond_44
    if-eqz v4, :cond_48

    .line 731
    const/4 v11, 0x1

    .line 733
    goto :goto_79

    .line 729
    :cond_48
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v5

    throw v5

    .line 733
    :cond_4d
    const/4 v5, -0x1

    if-ne v2, v5, :cond_64

    .line 734
    if-eqz v3, :cond_5b

    .line 735
    if-nez v4, :cond_56

    .line 738
    const/4 v6, 0x1

    .line 739
    goto :goto_79

    .line 736
    :cond_56
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v5

    throw v5

    .line 740
    :cond_5b
    if-eqz v4, :cond_5f

    .line 743
    const/4 v10, 0x1

    .line 745
    goto :goto_79

    .line 741
    :cond_5f
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v5

    throw v5

    .line 745
    :cond_64
    if-nez v2, :cond_c3

    .line 746
    if-eqz v3, :cond_77

    .line 747
    if-eqz v4, :cond_72

    .line 751
    if-ge v0, v1, :cond_6f

    .line 752
    const/4 v6, 0x1

    .line 753
    const/4 v11, 0x1

    .line 754
    goto :goto_79

    .line 755
    :cond_6f
    const/4 v7, 0x1

    .line 756
    const/4 v10, 0x1

    .line 758
    goto :goto_79

    .line 748
    :cond_72
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v5

    throw v5

    .line 759
    :cond_77
    if-nez v4, :cond_be

    .line 768
    :goto_79
    if-eqz v6, :cond_8e

    .line 769
    if-nez v7, :cond_89

    .line 772
    invoke-virtual {p0}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->getOddCounts()[I

    move-result-object v5

    invoke-virtual {p0}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->getOddRoundingErrors()[F

    move-result-object v8

    invoke-static {v5, v8}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->increment([I[F)V

    goto :goto_8e

    .line 770
    :cond_89
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v5

    throw v5

    .line 774
    :cond_8e
    :goto_8e
    if-eqz v7, :cond_9b

    .line 775
    invoke-virtual {p0}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->getOddCounts()[I

    move-result-object v5

    invoke-virtual {p0}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->getOddRoundingErrors()[F

    move-result-object v8

    invoke-static {v5, v8}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->decrement([I[F)V

    .line 777
    :cond_9b
    if-eqz v10, :cond_b0

    .line 778
    if-nez v11, :cond_ab

    .line 781
    invoke-virtual {p0}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->getEvenCounts()[I

    move-result-object v5

    invoke-virtual {p0}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->getOddRoundingErrors()[F

    move-result-object v8

    invoke-static {v5, v8}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->increment([I[F)V

    goto :goto_b0

    .line 779
    :cond_ab
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v5

    throw v5

    .line 783
    :cond_b0
    :goto_b0
    if-eqz v11, :cond_bd

    .line 784
    invoke-virtual {p0}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->getEvenCounts()[I

    move-result-object v5

    invoke-virtual {p0}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->getEvenRoundingErrors()[F

    move-result-object v8

    invoke-static {v5, v8}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->decrement([I[F)V

    .line 786
    :cond_bd
    return-void

    .line 760
    :cond_be
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v5

    throw v5

    .line 765
    :cond_c3
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v5

    throw v5
.end method

.method private checkChecksum()Z
    .registers 11

    .line 384
    iget-object v0, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->pairs:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/zxing/oned/rss/expanded/ExpandedPair;

    .line 385
    .local v0, "firstPair":Lcom/google/zxing/oned/rss/expanded/ExpandedPair;
    invoke-virtual {v0}, Lcom/google/zxing/oned/rss/expanded/ExpandedPair;->getLeftChar()Lcom/google/zxing/oned/rss/DataCharacter;

    move-result-object v2

    .line 386
    .local v2, "checkCharacter":Lcom/google/zxing/oned/rss/DataCharacter;
    invoke-virtual {v0}, Lcom/google/zxing/oned/rss/expanded/ExpandedPair;->getRightChar()Lcom/google/zxing/oned/rss/DataCharacter;

    move-result-object v3

    .line 388
    .local v3, "firstCharacter":Lcom/google/zxing/oned/rss/DataCharacter;
    if-nez v3, :cond_14

    .line 389
    return v1

    .line 392
    :cond_14
    invoke-virtual {v3}, Lcom/google/zxing/oned/rss/DataCharacter;->getChecksumPortion()I

    move-result v4

    .line 393
    .local v4, "checksum":I
    const/4 v5, 0x2

    .line 395
    .local v5, "s":I
    const/4 v6, 0x1

    .local v6, "i":I
    :goto_1a
    iget-object v7, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->pairs:Ljava/util/List;

    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v7

    if-lt v6, v7, :cond_31

    .line 406
    .end local v6    # "i":I
    const/16 v6, 0xd3

    rem-int/2addr v4, v6

    .line 408
    add-int/lit8 v7, v5, -0x4

    mul-int/2addr v6, v7

    add-int/2addr v6, v4

    .line 410
    .local v6, "checkCharacterValue":I
    invoke-virtual {v2}, Lcom/google/zxing/oned/rss/DataCharacter;->getValue()I

    move-result v7

    if-ne v6, v7, :cond_30

    const/4 v1, 0x1

    :cond_30
    return v1

    .line 396
    .local v6, "i":I
    :cond_31
    iget-object v7, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->pairs:Ljava/util/List;

    invoke-interface {v7, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/google/zxing/oned/rss/expanded/ExpandedPair;

    .line 397
    .local v7, "currentPair":Lcom/google/zxing/oned/rss/expanded/ExpandedPair;
    invoke-virtual {v7}, Lcom/google/zxing/oned/rss/expanded/ExpandedPair;->getLeftChar()Lcom/google/zxing/oned/rss/DataCharacter;

    move-result-object v8

    invoke-virtual {v8}, Lcom/google/zxing/oned/rss/DataCharacter;->getChecksumPortion()I

    move-result v8

    add-int/2addr v4, v8

    .line 398
    add-int/lit8 v5, v5, 0x1

    .line 399
    invoke-virtual {v7}, Lcom/google/zxing/oned/rss/expanded/ExpandedPair;->getRightChar()Lcom/google/zxing/oned/rss/DataCharacter;

    move-result-object v8

    .line 400
    .local v8, "currentRightChar":Lcom/google/zxing/oned/rss/DataCharacter;
    if-eqz v8, :cond_51

    .line 401
    invoke-virtual {v8}, Lcom/google/zxing/oned/rss/DataCharacter;->getChecksumPortion()I

    move-result v9

    add-int/2addr v4, v9

    .line 402
    add-int/lit8 v5, v5, 0x1

    .line 395
    .end local v7    # "currentPair":Lcom/google/zxing/oned/rss/expanded/ExpandedPair;
    .end local v8    # "currentRightChar":Lcom/google/zxing/oned/rss/DataCharacter;
    :cond_51
    add-int/lit8 v6, v6, 0x1

    goto :goto_1a
.end method

.method private checkRows(Ljava/util/List;I)Ljava/util/List;
    .registers 9
    .param p2, "currentRow"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/google/zxing/oned/rss/expanded/ExpandedRow;",
            ">;I)",
            "Ljava/util/List<",
            "Lcom/google/zxing/oned/rss/expanded/ExpandedPair;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .line 220
    .local p1, "collectedRows":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/oned/rss/expanded/ExpandedRow;>;"
    move v0, p2

    .local v0, "i":I
    :goto_1
    iget-object v1, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->rows:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_60

    .line 221
    iget-object v1, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->rows:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/zxing/oned/rss/expanded/ExpandedRow;

    .line 222
    .local v1, "row":Lcom/google/zxing/oned/rss/expanded/ExpandedRow;
    iget-object v2, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->pairs:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->clear()V

    .line 223
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    .line 224
    .local v2, "size":I
    const/4 v3, 0x0

    .local v3, "j":I
    :goto_1b
    if-lt v3, v2, :cond_4e

    .line 227
    .end local v3    # "j":I
    iget-object v3, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->pairs:Ljava/util/List;

    invoke-virtual {v1}, Lcom/google/zxing/oned/rss/expanded/ExpandedRow;->getPairs()Ljava/util/List;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 229
    iget-object v3, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->pairs:Ljava/util/List;

    invoke-static {v3}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->isValidSequence(Ljava/util/List;)Z

    move-result v3

    if-nez v3, :cond_2f

    .line 230
    goto :goto_4b

    .line 233
    :cond_2f
    invoke-direct {p0}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->checkChecksum()Z

    move-result v3

    if-eqz v3, :cond_38

    .line 234
    iget-object v3, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->pairs:Ljava/util/List;

    return-object v3

    .line 237
    :cond_38
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 238
    .local v3, "rs":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/oned/rss/expanded/ExpandedRow;>;"
    invoke-interface {v3, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 239
    invoke-interface {v3, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 242
    add-int/lit8 v4, v0, 0x1

    :try_start_45
    invoke-direct {p0, v3, v4}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->checkRows(Ljava/util/List;I)Ljava/util/List;

    move-result-object v4
    :try_end_49
    .catch Lcom/google/zxing/NotFoundException; {:try_start_45 .. :try_end_49} :catch_4a

    return-object v4

    .line 243
    :catch_4a
    move-exception v4

    .line 220
    .end local v1    # "row":Lcom/google/zxing/oned/rss/expanded/ExpandedRow;
    .end local v2    # "size":I
    .end local v3    # "rs":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/oned/rss/expanded/ExpandedRow;>;"
    :goto_4b
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 225
    .restart local v1    # "row":Lcom/google/zxing/oned/rss/expanded/ExpandedRow;
    .restart local v2    # "size":I
    .local v3, "j":I
    :cond_4e
    iget-object v4, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->pairs:Ljava/util/List;

    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/google/zxing/oned/rss/expanded/ExpandedRow;

    invoke-virtual {v5}, Lcom/google/zxing/oned/rss/expanded/ExpandedRow;->getPairs()Ljava/util/List;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 224
    add-int/lit8 v3, v3, 0x1

    goto :goto_1b

    .line 248
    .end local v0    # "i":I
    .end local v1    # "row":Lcom/google/zxing/oned/rss/expanded/ExpandedRow;
    .end local v2    # "size":I
    .end local v3    # "j":I
    :cond_60
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v0

    throw v0
.end method

.method private checkRows(Z)Ljava/util/List;
    .registers 5
    .param p1, "reverse"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)",
            "Ljava/util/List<",
            "Lcom/google/zxing/oned/rss/expanded/ExpandedPair;",
            ">;"
        }
    .end annotation

    .line 193
    iget-object v0, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->rows:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x0

    const/16 v2, 0x19

    if-le v0, v2, :cond_11

    .line 194
    iget-object v0, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->rows:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 195
    return-object v1

    .line 198
    :cond_11
    iget-object v0, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->pairs:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 199
    if-eqz p1, :cond_1d

    .line 200
    iget-object v0, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->rows:Ljava/util/List;

    invoke-static {v0}, Ljava/util/Collections;->reverse(Ljava/util/List;)V

    .line 203
    :cond_1d
    move-object v0, v1

    .line 205
    .local v0, "ps":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/oned/rss/expanded/ExpandedPair;>;"
    :try_start_1e
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    const/4 v2, 0x0

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->checkRows(Ljava/util/List;I)Ljava/util/List;

    move-result-object v1
    :try_end_28
    .catch Lcom/google/zxing/NotFoundException; {:try_start_1e .. :try_end_28} :catch_2a

    move-object v0, v1

    .line 206
    goto :goto_2b

    :catch_2a
    move-exception v1

    .line 210
    :goto_2b
    if-eqz p1, :cond_32

    .line 211
    iget-object v1, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->rows:Ljava/util/List;

    invoke-static {v1}, Ljava/util/Collections;->reverse(Ljava/util/List;)V

    .line 214
    :cond_32
    return-object v0
.end method

.method static constructResult(Ljava/util/List;)Lcom/google/zxing/Result;
    .registers 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/google/zxing/oned/rss/expanded/ExpandedPair;",
            ">;)",
            "Lcom/google/zxing/Result;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;,
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    .line 367
    .local p0, "pairs":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/oned/rss/expanded/ExpandedPair;>;"
    invoke-static {p0}, Lcom/google/zxing/oned/rss/expanded/BitArrayBuilder;->buildBitArray(Ljava/util/List;)Lcom/google/zxing/common/BitArray;

    move-result-object v0

    .line 369
    .local v0, "binary":Lcom/google/zxing/common/BitArray;
    invoke-static {v0}, Lcom/google/zxing/oned/rss/expanded/decoders/AbstractExpandedDecoder;->createDecoder(Lcom/google/zxing/common/BitArray;)Lcom/google/zxing/oned/rss/expanded/decoders/AbstractExpandedDecoder;

    move-result-object v1

    .line 370
    .local v1, "decoder":Lcom/google/zxing/oned/rss/expanded/decoders/AbstractExpandedDecoder;
    invoke-virtual {v1}, Lcom/google/zxing/oned/rss/expanded/decoders/AbstractExpandedDecoder;->parseInformation()Ljava/lang/String;

    move-result-object v2

    .line 372
    .local v2, "resultingString":Ljava/lang/String;
    const/4 v3, 0x0

    invoke-interface {p0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/google/zxing/oned/rss/expanded/ExpandedPair;

    invoke-virtual {v4}, Lcom/google/zxing/oned/rss/expanded/ExpandedPair;->getFinderPattern()Lcom/google/zxing/oned/rss/FinderPattern;

    move-result-object v4

    invoke-virtual {v4}, Lcom/google/zxing/oned/rss/FinderPattern;->getResultPoints()[Lcom/google/zxing/ResultPoint;

    move-result-object v4

    .line 373
    .local v4, "firstPoints":[Lcom/google/zxing/ResultPoint;
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v5

    const/4 v6, 0x1

    sub-int/2addr v5, v6

    invoke-interface {p0, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/google/zxing/oned/rss/expanded/ExpandedPair;

    invoke-virtual {v5}, Lcom/google/zxing/oned/rss/expanded/ExpandedPair;->getFinderPattern()Lcom/google/zxing/oned/rss/FinderPattern;

    move-result-object v5

    invoke-virtual {v5}, Lcom/google/zxing/oned/rss/FinderPattern;->getResultPoints()[Lcom/google/zxing/ResultPoint;

    move-result-object v5

    .line 375
    .local v5, "lastPoints":[Lcom/google/zxing/ResultPoint;
    new-instance v7, Lcom/google/zxing/Result;

    .line 376
    nop

    .line 377
    nop

    .line 378
    const/4 v8, 0x4

    new-array v8, v8, [Lcom/google/zxing/ResultPoint;

    aget-object v9, v4, v3

    aput-object v9, v8, v3

    aget-object v9, v4, v6

    aput-object v9, v8, v6

    aget-object v3, v5, v3

    const/4 v9, 0x2

    aput-object v3, v8, v9

    aget-object v3, v5, v6

    const/4 v6, 0x3

    aput-object v3, v8, v6

    .line 379
    sget-object v3, Lcom/google/zxing/BarcodeFormat;->RSS_EXPANDED:Lcom/google/zxing/BarcodeFormat;

    .line 375
    const/4 v6, 0x0

    invoke-direct {v7, v2, v6, v8, v3}, Lcom/google/zxing/Result;-><init>(Ljava/lang/String;[B[Lcom/google/zxing/ResultPoint;Lcom/google/zxing/BarcodeFormat;)V

    return-object v7
.end method

.method private findNextPair(Lcom/google/zxing/common/BitArray;Ljava/util/List;I)V
    .registers 21
    .param p1, "row"    # Lcom/google/zxing/common/BitArray;
    .param p3, "forcedOffset"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/zxing/common/BitArray;",
            "Ljava/util/List<",
            "Lcom/google/zxing/oned/rss/expanded/ExpandedPair;",
            ">;I)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .local p2, "previousPairs":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/oned/rss/expanded/ExpandedPair;>;"
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    .line 468
    invoke-virtual/range {p0 .. p0}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->getDecodeFinderCounters()[I

    move-result-object v2

    .line 469
    .local v2, "counters":[I
    const/4 v3, 0x0

    aput v3, v2, v3

    .line 470
    const/4 v4, 0x1

    aput v3, v2, v4

    .line 471
    const/4 v5, 0x2

    aput v3, v2, v5

    .line 472
    const/4 v6, 0x3

    aput v3, v2, v6

    .line 474
    invoke-virtual/range {p1 .. p1}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v7

    .line 477
    .local v7, "width":I
    if-ltz p3, :cond_20

    .line 478
    move/from16 v8, p3

    .line 479
    .local v8, "rowOffset":I
    nop

    .line 483
    :goto_1d
    move-object/from16 v9, p2

    goto :goto_3f

    .line 479
    .end local v8    # "rowOffset":I
    :cond_20
    invoke-interface/range {p2 .. p2}, Ljava/util/List;->isEmpty()Z

    move-result v8

    if-eqz v8, :cond_28

    .line 480
    const/4 v8, 0x0

    .line 481
    .restart local v8    # "rowOffset":I
    goto :goto_1d

    .line 482
    .end local v8    # "rowOffset":I
    :cond_28
    invoke-interface/range {p2 .. p2}, Ljava/util/List;->size()I

    move-result v8

    sub-int/2addr v8, v4

    move-object/from16 v9, p2

    invoke-interface {v9, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/google/zxing/oned/rss/expanded/ExpandedPair;

    .line 483
    .local v8, "lastPair":Lcom/google/zxing/oned/rss/expanded/ExpandedPair;
    invoke-virtual {v8}, Lcom/google/zxing/oned/rss/expanded/ExpandedPair;->getFinderPattern()Lcom/google/zxing/oned/rss/FinderPattern;

    move-result-object v10

    invoke-virtual {v10}, Lcom/google/zxing/oned/rss/FinderPattern;->getStartEnd()[I

    move-result-object v10

    aget v8, v10, v4

    .line 485
    .local v8, "rowOffset":I
    :goto_3f
    invoke-interface/range {p2 .. p2}, Ljava/util/List;->size()I

    move-result v10

    rem-int/2addr v10, v5

    if-eqz v10, :cond_48

    move v10, v4

    goto :goto_49

    :cond_48
    move v10, v3

    .line 486
    .local v10, "searchingEvenPair":Z
    :goto_49
    iget-boolean v11, v0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->startFromEven:Z

    if-eqz v11, :cond_53

    .line 487
    if-eqz v10, :cond_51

    move v11, v3

    goto :goto_52

    :cond_51
    move v11, v4

    :goto_52
    move v10, v11

    .line 490
    :cond_53
    const/4 v11, 0x0

    .line 491
    .local v11, "isWhite":Z
    :goto_54
    if-lt v8, v7, :cond_57

    goto :goto_60

    .line 492
    :cond_57
    invoke-virtual {v1, v8}, Lcom/google/zxing/common/BitArray;->get(I)Z

    move-result v12

    xor-int/2addr v12, v4

    move v11, v12

    .line 493
    if-nez v11, :cond_b5

    .line 494
    nop

    .line 499
    :goto_60
    const/4 v12, 0x0

    .line 500
    .local v12, "counterPosition":I
    move v13, v8

    .line 501
    .local v13, "patternStart":I
    move v14, v8

    .local v14, "x":I
    :goto_63
    if-ge v14, v7, :cond_b0

    .line 502
    invoke-virtual {v1, v14}, Lcom/google/zxing/common/BitArray;->get(I)Z

    move-result v15

    xor-int/2addr v15, v11

    if-eqz v15, :cond_72

    .line 503
    aget v15, v2, v12

    add-int/2addr v15, v4

    aput v15, v2, v12

    .line 504
    goto :goto_ad

    .line 505
    :cond_72
    if-ne v12, v6, :cond_a3

    .line 506
    if-eqz v10, :cond_79

    .line 507
    invoke-static {v2}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->reverseCounters([I)V

    .line 510
    :cond_79
    invoke-static {v2}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->isFinderPattern([I)Z

    move-result v15

    if-eqz v15, :cond_88

    .line 511
    iget-object v5, v0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->startEnd:[I

    aput v13, v5, v3

    .line 512
    iget-object v3, v0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->startEnd:[I

    aput v14, v3, v4

    .line 513
    return-void

    .line 516
    :cond_88
    if-eqz v10, :cond_8d

    .line 517
    invoke-static {v2}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->reverseCounters([I)V

    .line 520
    :cond_8d
    aget v15, v2, v3

    aget v16, v2, v4

    add-int v15, v15, v16

    add-int/2addr v13, v15

    .line 521
    aget v15, v2, v5

    aput v15, v2, v3

    .line 522
    aget v15, v2, v6

    aput v15, v2, v4

    .line 523
    aput v3, v2, v5

    .line 524
    aput v3, v2, v6

    .line 525
    add-int/lit8 v12, v12, -0x1

    .line 526
    goto :goto_a5

    .line 527
    :cond_a3
    add-int/lit8 v12, v12, 0x1

    .line 529
    :goto_a5
    aput v4, v2, v12

    .line 530
    if-eqz v11, :cond_ab

    move v15, v3

    goto :goto_ac

    :cond_ab
    move v15, v4

    :goto_ac
    move v11, v15

    .line 501
    :goto_ad
    add-int/lit8 v14, v14, 0x1

    goto :goto_63

    .line 533
    .end local v14    # "x":I
    :cond_b0
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v3

    throw v3

    .line 496
    .end local v12    # "counterPosition":I
    .end local v13    # "patternStart":I
    :cond_b5
    add-int/lit8 v8, v8, 0x1

    goto :goto_54
.end method

.method private static getNextSecondBar(Lcom/google/zxing/common/BitArray;I)I
    .registers 3
    .param p0, "row"    # Lcom/google/zxing/common/BitArray;
    .param p1, "initialPos"    # I

    .line 415
    invoke-virtual {p0, p1}, Lcom/google/zxing/common/BitArray;->get(I)Z

    move-result v0

    if-eqz v0, :cond_f

    .line 416
    invoke-virtual {p0, p1}, Lcom/google/zxing/common/BitArray;->getNextUnset(I)I

    move-result v0

    .line 417
    .local v0, "currentPos":I
    invoke-virtual {p0, v0}, Lcom/google/zxing/common/BitArray;->getNextSet(I)I

    move-result v0

    .line 418
    goto :goto_17

    .line 419
    .end local v0    # "currentPos":I
    :cond_f
    invoke-virtual {p0, p1}, Lcom/google/zxing/common/BitArray;->getNextSet(I)I

    move-result v0

    .line 420
    .restart local v0    # "currentPos":I
    invoke-virtual {p0, v0}, Lcom/google/zxing/common/BitArray;->getNextUnset(I)I

    move-result v0

    .line 422
    :goto_17
    return v0
.end method

.method private static isNotA1left(Lcom/google/zxing/oned/rss/FinderPattern;ZZ)Z
    .registers 4
    .param p0, "pattern"    # Lcom/google/zxing/oned/rss/FinderPattern;
    .param p1, "isOddPattern"    # Z
    .param p2, "leftChar"    # Z

    .line 694
    invoke-virtual {p0}, Lcom/google/zxing/oned/rss/FinderPattern;->getValue()I

    move-result v0

    if-nez v0, :cond_c

    if-eqz p1, :cond_c

    if-eqz p2, :cond_c

    const/4 v0, 0x0

    goto :goto_d

    :cond_c
    const/4 v0, 0x1

    :goto_d
    return v0
.end method

.method private static isPartialRow(Ljava/lang/Iterable;Ljava/lang/Iterable;)Z
    .registers 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "Lcom/google/zxing/oned/rss/expanded/ExpandedPair;",
            ">;",
            "Ljava/lang/Iterable<",
            "Lcom/google/zxing/oned/rss/expanded/ExpandedRow;",
            ">;)Z"
        }
    .end annotation

    .line 337
    .local p0, "pairs":Ljava/lang/Iterable;, "Ljava/lang/Iterable<Lcom/google/zxing/oned/rss/expanded/ExpandedPair;>;"
    .local p1, "rows":Ljava/lang/Iterable;, "Ljava/lang/Iterable<Lcom/google/zxing/oned/rss/expanded/ExpandedRow;>;"
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_c

    .line 357
    const/4 v0, 0x0

    return v0

    .line 337
    :cond_c
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/zxing/oned/rss/expanded/ExpandedRow;

    .line 338
    .local v1, "r":Lcom/google/zxing/oned/rss/expanded/ExpandedRow;
    const/4 v2, 0x1

    .line 339
    .local v2, "allFound":Z
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_17
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_1e

    goto :goto_46

    :cond_1e
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/google/zxing/oned/rss/expanded/ExpandedPair;

    .line 340
    .local v4, "p":Lcom/google/zxing/oned/rss/expanded/ExpandedPair;
    const/4 v5, 0x0

    .line 341
    .local v5, "found":Z
    invoke-virtual {v1}, Lcom/google/zxing/oned/rss/expanded/ExpandedRow;->getPairs()Ljava/util/List;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_2d
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-nez v7, :cond_34

    goto :goto_42

    :cond_34
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/google/zxing/oned/rss/expanded/ExpandedPair;

    .line 342
    .local v7, "pp":Lcom/google/zxing/oned/rss/expanded/ExpandedPair;
    invoke-virtual {v4, v7}, Lcom/google/zxing/oned/rss/expanded/ExpandedPair;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_2d

    .line 343
    const/4 v5, 0x1

    .line 344
    nop

    .line 347
    .end local v7    # "pp":Lcom/google/zxing/oned/rss/expanded/ExpandedPair;
    :goto_42
    if-nez v5, :cond_17

    .line 348
    const/4 v2, 0x0

    .line 349
    nop

    .line 352
    .end local v4    # "p":Lcom/google/zxing/oned/rss/expanded/ExpandedPair;
    .end local v5    # "found":Z
    :goto_46
    if-eqz v2, :cond_4

    .line 354
    const/4 v0, 0x1

    return v0
.end method

.method private static isValidSequence(Ljava/util/List;)Z
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/google/zxing/oned/rss/expanded/ExpandedPair;",
            ">;)Z"
        }
    .end annotation

    .line 254
    .local p0, "pairs":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/oned/rss/expanded/ExpandedPair;>;"
    sget-object v0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->FINDER_PATTERN_SEQUENCES:[[I

    array-length v1, v0

    const/4 v2, 0x0

    move v3, v2

    :goto_5
    if-lt v3, v1, :cond_8

    .line 272
    return v2

    .line 254
    :cond_8
    aget-object v4, v0, v3

    .line 255
    .local v4, "sequence":[I
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v5

    array-length v6, v4

    if-le v5, v6, :cond_12

    .line 256
    goto :goto_33

    .line 259
    :cond_12
    const/4 v5, 0x1

    .line 260
    .local v5, "stop":Z
    const/4 v6, 0x0

    .local v6, "j":I
    :goto_14
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v7

    if-lt v6, v7, :cond_1b

    .end local v6    # "j":I
    goto :goto_2f

    .line 261
    .restart local v6    # "j":I
    :cond_1b
    invoke-interface {p0, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/google/zxing/oned/rss/expanded/ExpandedPair;

    invoke-virtual {v7}, Lcom/google/zxing/oned/rss/expanded/ExpandedPair;->getFinderPattern()Lcom/google/zxing/oned/rss/FinderPattern;

    move-result-object v7

    invoke-virtual {v7}, Lcom/google/zxing/oned/rss/FinderPattern;->getValue()I

    move-result v7

    aget v8, v4, v6

    if-eq v7, v8, :cond_36

    .line 262
    const/4 v5, 0x0

    .line 263
    nop

    .line 267
    .end local v6    # "j":I
    :goto_2f
    if-eqz v5, :cond_33

    .line 268
    const/4 v0, 0x1

    return v0

    .line 254
    .end local v4    # "sequence":[I
    .end local v5    # "stop":Z
    :cond_33
    :goto_33
    add-int/lit8 v3, v3, 0x1

    goto :goto_5

    .line 260
    .restart local v4    # "sequence":[I
    .restart local v5    # "stop":Z
    .restart local v6    # "j":I
    :cond_36
    add-int/lit8 v6, v6, 0x1

    goto :goto_14
.end method

.method private parseFoundFinderPattern(Lcom/google/zxing/common/BitArray;IZ)Lcom/google/zxing/oned/rss/FinderPattern;
    .registers 19
    .param p1, "row"    # Lcom/google/zxing/common/BitArray;
    .param p2, "rowNumber"    # I
    .param p3, "oddPattern"    # Z

    move-object v1, p0

    move-object/from16 v2, p1

    .line 551
    const/4 v0, 0x0

    const/4 v3, 0x1

    if-eqz p3, :cond_24

    .line 554
    iget-object v4, v1, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->startEnd:[I

    aget v4, v4, v0

    sub-int/2addr v4, v3

    .line 556
    .local v4, "firstElementStart":I
    :goto_c
    if-ltz v4, :cond_18

    invoke-virtual {v2, v4}, Lcom/google/zxing/common/BitArray;->get(I)Z

    move-result v5

    if-eqz v5, :cond_15

    goto :goto_18

    .line 557
    :cond_15
    add-int/lit8 v4, v4, -0x1

    goto :goto_c

    .line 560
    :cond_18
    :goto_18
    add-int/2addr v4, v3

    .line 561
    iget-object v5, v1, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->startEnd:[I

    aget v5, v5, v0

    sub-int/2addr v5, v4

    .line 562
    .local v5, "firstCounter":I
    move v6, v4

    .line 563
    .local v6, "start":I
    iget-object v7, v1, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->startEnd:[I

    aget v4, v7, v3

    .line 565
    .local v4, "end":I
    goto :goto_37

    .line 568
    .end local v4    # "end":I
    .end local v5    # "firstCounter":I
    .end local v6    # "start":I
    :cond_24
    iget-object v4, v1, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->startEnd:[I

    aget v6, v4, v0

    .line 570
    .restart local v6    # "start":I
    iget-object v4, v1, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->startEnd:[I

    aget v4, v4, v3

    add-int/2addr v4, v3

    invoke-virtual {v2, v4}, Lcom/google/zxing/common/BitArray;->getNextUnset(I)I

    move-result v4

    .line 571
    .restart local v4    # "end":I
    iget-object v5, v1, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->startEnd:[I

    aget v5, v5, v3

    sub-int v5, v4, v5

    .end local v6    # "start":I
    .restart local v5    # "firstCounter":I
    .local v12, "start":I
    :goto_37
    move v12, v6

    .line 575
    invoke-virtual {v1}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->getDecodeFinderCounters()[I

    move-result-object v13

    .line 576
    .local v13, "counters":[I
    array-length v6, v13

    sub-int/2addr v6, v3

    invoke-static {v13, v0, v13, v3, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 578
    aput v5, v13, v0

    .line 581
    :try_start_43
    sget-object v6, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->FINDER_PATTERNS:[[I

    invoke-static {v13, v6}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->parseFinderValue([I[[I)I

    move-result v7
    :try_end_49
    .catch Lcom/google/zxing/NotFoundException; {:try_start_43 .. :try_end_49} :catch_5d

    .line 582
    .local v7, "value":I
    nop

    .line 583
    nop

    .line 585
    new-instance v14, Lcom/google/zxing/oned/rss/FinderPattern;

    const/4 v6, 0x2

    new-array v8, v6, [I

    aput v12, v8, v0

    aput v4, v8, v3

    move-object v6, v14

    move v9, v12

    move v10, v4

    move/from16 v11, p2

    invoke-direct/range {v6 .. v11}, Lcom/google/zxing/oned/rss/FinderPattern;-><init>(I[IIII)V

    return-object v14

    .line 582
    .end local v7    # "value":I
    :catch_5d
    move-exception v0

    .line 583
    .local v0, "ignored":Lcom/google/zxing/NotFoundException;
    const/4 v3, 0x0

    return-object v3
.end method

.method private static removePartialRows(Ljava/util/List;Ljava/util/List;)V
    .registers 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/google/zxing/oned/rss/expanded/ExpandedPair;",
            ">;",
            "Ljava/util/List<",
            "Lcom/google/zxing/oned/rss/expanded/ExpandedRow;",
            ">;)V"
        }
    .end annotation

    .line 309
    .local p0, "pairs":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/oned/rss/expanded/ExpandedPair;>;"
    .local p1, "rows":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/oned/rss/expanded/ExpandedRow;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/google/zxing/oned/rss/expanded/ExpandedRow;>;"
    :cond_4
    :goto_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_b

    .line 333
    .end local v0    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/google/zxing/oned/rss/expanded/ExpandedRow;>;"
    return-void

    .line 310
    .restart local v0    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/google/zxing/oned/rss/expanded/ExpandedRow;>;"
    :cond_b
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/zxing/oned/rss/expanded/ExpandedRow;

    .line 311
    .local v1, "r":Lcom/google/zxing/oned/rss/expanded/ExpandedRow;
    invoke-virtual {v1}, Lcom/google/zxing/oned/rss/expanded/ExpandedRow;->getPairs()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v3

    if-ne v2, v3, :cond_20

    .line 312
    goto :goto_4

    .line 314
    :cond_20
    const/4 v2, 0x1

    .line 315
    .local v2, "allFound":Z
    invoke-virtual {v1}, Lcom/google/zxing/oned/rss/expanded/ExpandedRow;->getPairs()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_29
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_30

    goto :goto_54

    :cond_30
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/google/zxing/oned/rss/expanded/ExpandedPair;

    .line 316
    .local v4, "p":Lcom/google/zxing/oned/rss/expanded/ExpandedPair;
    const/4 v5, 0x0

    .line 317
    .local v5, "found":Z
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_3b
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-nez v7, :cond_42

    goto :goto_50

    :cond_42
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/google/zxing/oned/rss/expanded/ExpandedPair;

    .line 318
    .local v7, "pp":Lcom/google/zxing/oned/rss/expanded/ExpandedPair;
    invoke-virtual {v4, v7}, Lcom/google/zxing/oned/rss/expanded/ExpandedPair;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_3b

    .line 319
    const/4 v5, 0x1

    .line 320
    nop

    .line 323
    .end local v7    # "pp":Lcom/google/zxing/oned/rss/expanded/ExpandedPair;
    :goto_50
    if-nez v5, :cond_29

    .line 324
    const/4 v2, 0x0

    .line 325
    nop

    .line 328
    .end local v4    # "p":Lcom/google/zxing/oned/rss/expanded/ExpandedPair;
    .end local v5    # "found":Z
    :goto_54
    if-eqz v2, :cond_4

    .line 330
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    .end local v1    # "r":Lcom/google/zxing/oned/rss/expanded/ExpandedRow;
    .end local v2    # "allFound":Z
    goto :goto_4
.end method

.method private static reverseCounters([I)V
    .registers 5
    .param p0, "counters"    # [I

    .line 537
    array-length v0, p0

    .line 538
    .local v0, "length":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_2
    div-int/lit8 v2, v0, 0x2

    if-lt v1, v2, :cond_7

    .line 543
    .end local v1    # "i":I
    return-void

    .line 539
    .restart local v1    # "i":I
    :cond_7
    aget v2, p0, v1

    .line 540
    .local v2, "tmp":I
    sub-int v3, v0, v1

    add-int/lit8 v3, v3, -0x1

    aget v3, p0, v3

    aput v3, p0, v1

    .line 541
    sub-int v3, v0, v1

    add-int/lit8 v3, v3, -0x1

    aput v2, p0, v3

    .line 538
    .end local v2    # "tmp":I
    add-int/lit8 v1, v1, 0x1

    goto :goto_2
.end method

.method private storeRow(IZ)V
    .registers 9
    .param p1, "rowNumber"    # I
    .param p2, "wasReversed"    # Z

    .line 277
    const/4 v0, 0x0

    .line 278
    .local v0, "insertPos":I
    const/4 v1, 0x0

    .line 279
    .local v1, "prevIsSame":Z
    const/4 v2, 0x0

    .line 280
    .local v2, "nextIsSame":Z
    :goto_3
    iget-object v3, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->rows:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-lt v0, v3, :cond_c

    goto :goto_21

    .line 281
    :cond_c
    iget-object v3, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->rows:Ljava/util/List;

    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/zxing/oned/rss/expanded/ExpandedRow;

    .line 282
    .local v3, "erow":Lcom/google/zxing/oned/rss/expanded/ExpandedRow;
    invoke-virtual {v3}, Lcom/google/zxing/oned/rss/expanded/ExpandedRow;->getRowNumber()I

    move-result v4

    if-le v4, p1, :cond_46

    .line 283
    iget-object v4, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->pairs:Ljava/util/List;

    invoke-virtual {v3, v4}, Lcom/google/zxing/oned/rss/expanded/ExpandedRow;->isEquivalent(Ljava/util/List;)Z

    move-result v2

    .line 284
    nop

    .line 289
    .end local v3    # "erow":Lcom/google/zxing/oned/rss/expanded/ExpandedRow;
    :goto_21
    if-nez v2, :cond_45

    if-eqz v1, :cond_26

    goto :goto_45

    .line 298
    :cond_26
    iget-object v3, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->pairs:Ljava/util/List;

    iget-object v4, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->rows:Ljava/util/List;

    invoke-static {v3, v4}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->isPartialRow(Ljava/lang/Iterable;Ljava/lang/Iterable;)Z

    move-result v3

    if-eqz v3, :cond_31

    .line 299
    return-void

    .line 302
    :cond_31
    iget-object v3, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->rows:Ljava/util/List;

    new-instance v4, Lcom/google/zxing/oned/rss/expanded/ExpandedRow;

    iget-object v5, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->pairs:Ljava/util/List;

    invoke-direct {v4, v5, p1, p2}, Lcom/google/zxing/oned/rss/expanded/ExpandedRow;-><init>(Ljava/util/List;IZ)V

    invoke-interface {v3, v0, v4}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 304
    iget-object v3, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->pairs:Ljava/util/List;

    iget-object v4, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->rows:Ljava/util/List;

    invoke-static {v3, v4}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->removePartialRows(Ljava/util/List;Ljava/util/List;)V

    .line 305
    return-void

    .line 290
    :cond_45
    :goto_45
    return-void

    .line 286
    .restart local v3    # "erow":Lcom/google/zxing/oned/rss/expanded/ExpandedRow;
    :cond_46
    iget-object v4, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->pairs:Ljava/util/List;

    invoke-virtual {v3, v4}, Lcom/google/zxing/oned/rss/expanded/ExpandedRow;->isEquivalent(Ljava/util/List;)Z

    move-result v1

    .line 287
    add-int/lit8 v0, v0, 0x1

    .end local v3    # "erow":Lcom/google/zxing/oned/rss/expanded/ExpandedRow;
    goto :goto_3
.end method


# virtual methods
.method decodeDataCharacter(Lcom/google/zxing/common/BitArray;Lcom/google/zxing/oned/rss/FinderPattern;ZZ)Lcom/google/zxing/oned/rss/DataCharacter;
    .registers 30
    .param p1, "row"    # Lcom/google/zxing/common/BitArray;
    .param p2, "pattern"    # Lcom/google/zxing/oned/rss/FinderPattern;
    .param p3, "isOddPattern"    # Z
    .param p4, "leftChar"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    move-object/from16 v0, p1

    .line 592
    invoke-virtual/range {p0 .. p0}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->getDataCharacterCounters()[I

    move-result-object v1

    .line 593
    .local v1, "counters":[I
    const/4 v2, 0x0

    aput v2, v1, v2

    .line 594
    const/4 v3, 0x1

    aput v2, v1, v3

    .line 595
    const/4 v4, 0x2

    aput v2, v1, v4

    .line 596
    const/4 v5, 0x3

    aput v2, v1, v5

    .line 597
    const/4 v5, 0x4

    aput v2, v1, v5

    .line 598
    const/4 v6, 0x5

    aput v2, v1, v6

    .line 599
    const/4 v6, 0x6

    aput v2, v1, v6

    .line 600
    const/4 v6, 0x7

    aput v2, v1, v6

    .line 602
    if-eqz p4, :cond_2a

    .line 603
    invoke-virtual/range {p2 .. p2}, Lcom/google/zxing/oned/rss/FinderPattern;->getStartEnd()[I

    move-result-object v6

    aget v6, v6, v2

    invoke-static {v0, v6, v1}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->recordPatternInReverse(Lcom/google/zxing/common/BitArray;I[I)V

    .line 604
    goto :goto_38

    .line 605
    :cond_2a
    invoke-virtual/range {p2 .. p2}, Lcom/google/zxing/oned/rss/FinderPattern;->getStartEnd()[I

    move-result-object v6

    aget v6, v6, v3

    invoke-static {v0, v6, v1}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->recordPattern(Lcom/google/zxing/common/BitArray;I[I)V

    .line 607
    const/4 v6, 0x0

    .local v6, "i":I
    array-length v7, v1

    sub-int/2addr v7, v3

    .local v7, "j":I
    :goto_36
    if-lt v6, v7, :cond_182

    .line 614
    .end local v6    # "i":I
    .end local v7    # "j":I
    :goto_38
    const/16 v6, 0x11

    .line 615
    .local v6, "numModules":I
    invoke-static {v1}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->count([I)I

    move-result v7

    int-to-float v7, v7

    int-to-float v8, v6

    div-float/2addr v7, v8

    .line 618
    .local v7, "elementWidth":F
    invoke-virtual/range {p2 .. p2}, Lcom/google/zxing/oned/rss/FinderPattern;->getStartEnd()[I

    move-result-object v8

    aget v8, v8, v3

    invoke-virtual/range {p2 .. p2}, Lcom/google/zxing/oned/rss/FinderPattern;->getStartEnd()[I

    move-result-object v9

    aget v9, v9, v2

    sub-int/2addr v8, v9

    int-to-float v8, v8

    const/high16 v9, 0x41700000    # 15.0f

    div-float/2addr v8, v9

    .line 619
    .local v8, "expectedElementWidth":F
    sub-float v9, v7, v8

    invoke-static {v9}, Ljava/lang/Math;->abs(F)F

    move-result v9

    div-float/2addr v9, v8

    const v10, 0x3e99999a    # 0.3f

    cmpl-float v9, v9, v10

    if-gtz v9, :cond_179

    .line 623
    invoke-virtual/range {p0 .. p0}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->getOddCounts()[I

    move-result-object v9

    .line 624
    .local v9, "oddCounts":[I
    invoke-virtual/range {p0 .. p0}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->getEvenCounts()[I

    move-result-object v11

    .line 625
    .local v11, "evenCounts":[I
    invoke-virtual/range {p0 .. p0}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->getOddRoundingErrors()[F

    move-result-object v12

    .line 626
    .local v12, "oddRoundingErrors":[F
    invoke-virtual/range {p0 .. p0}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->getEvenRoundingErrors()[F

    move-result-object v13

    .line 628
    .local v13, "evenRoundingErrors":[F
    const/4 v14, 0x0

    .local v14, "i":I
    :goto_71
    array-length v10, v1

    if-lt v14, v10, :cond_11f

    .line 652
    .end local v14    # "i":I
    move-object/from16 v10, p0

    invoke-direct {v10, v6}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->adjustOddEvenCounts(I)V

    .line 654
    invoke-virtual/range {p2 .. p2}, Lcom/google/zxing/oned/rss/FinderPattern;->getValue()I

    move-result v14

    mul-int/2addr v14, v5

    if-eqz p3, :cond_82

    move v15, v2

    goto :goto_83

    :cond_82
    move v15, v4

    :goto_83
    add-int/2addr v14, v15

    xor-int/lit8 v15, p4, 0x1

    add-int/2addr v14, v15

    add-int/lit8 v16, v14, -0x1

    .line 656
    .local v16, "weightRowNumber":I
    const/4 v14, 0x0

    .line 657
    .local v14, "oddSum":I
    const/4 v15, 0x0

    .line 658
    .local v15, "oddChecksumPortion":I
    array-length v2, v9

    sub-int/2addr v2, v3

    .local v2, "i":I
    :goto_8d
    if-gez v2, :cond_f9

    .line 665
    .end local v2    # "i":I
    const/4 v2, 0x0

    .line 667
    .local v2, "evenChecksumPortion":I
    array-length v4, v11

    sub-int/2addr v4, v3

    .local v4, "i":I
    :goto_92
    if-gez v4, :cond_d6

    .line 674
    .end local v4    # "i":I
    add-int v4, v15, v2

    .line 676
    .local v4, "checksumPortion":I
    and-int/lit8 v19, v14, 0x1

    if-nez v19, :cond_cf

    const/16 v3, 0xd

    if-gt v14, v3, :cond_cf

    if-lt v14, v5, :cond_cf

    .line 680
    sub-int/2addr v3, v14

    const/4 v5, 0x2

    div-int/2addr v3, v5

    .line 681
    .local v3, "group":I
    sget-object v5, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->SYMBOL_WIDEST:[I

    aget v5, v5, v3

    .line 682
    .local v5, "oddWidest":I
    rsub-int/lit8 v0, v5, 0x9

    .line 683
    .local v0, "evenWidest":I
    move/from16 v20, v6

    const/4 v6, 0x1

    invoke-static {v9, v5, v6}, Lcom/google/zxing/oned/rss/RSSUtils;->getRSSvalue([IIZ)I

    move-result v6

    .line 684
    .local v6, "vOdd":I
    .local v20, "numModules":I
    move/from16 v21, v5

    const/4 v5, 0x0

    invoke-static {v11, v0, v5}, Lcom/google/zxing/oned/rss/RSSUtils;->getRSSvalue([IIZ)I

    move-result v5

    .line 685
    .local v5, "vEven":I
    .local v21, "oddWidest":I
    sget-object v17, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->EVEN_TOTAL_SUBSET:[I

    aget v17, v17, v3

    .line 686
    .local v17, "tEven":I
    sget-object v18, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->GSUM:[I

    aget v18, v18, v3

    .line 687
    .local v18, "gSum":I
    mul-int v19, v6, v17

    add-int v19, v19, v5

    move/from16 v22, v0

    add-int v0, v19, v18

    .line 689
    .local v0, "value":I
    .local v22, "evenWidest":I
    move/from16 v23, v3

    new-instance v3, Lcom/google/zxing/oned/rss/DataCharacter;

    .end local v3    # "group":I
    .local v23, "group":I
    invoke-direct {v3, v0, v4}, Lcom/google/zxing/oned/rss/DataCharacter;-><init>(II)V

    return-object v3

    .line 677
    .end local v0    # "value":I
    .end local v5    # "vEven":I
    .end local v17    # "tEven":I
    .end local v18    # "gSum":I
    .end local v20    # "numModules":I
    .end local v21    # "oddWidest":I
    .end local v22    # "evenWidest":I
    .end local v23    # "group":I
    .local v6, "numModules":I
    :cond_cf
    move/from16 v20, v6

    .end local v6    # "numModules":I
    .restart local v20    # "numModules":I
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v0

    throw v0

    .line 668
    .end local v20    # "numModules":I
    .local v4, "i":I
    .restart local v6    # "numModules":I
    :cond_d6
    move v0, v5

    move/from16 v20, v6

    const/4 v5, 0x0

    .end local v6    # "numModules":I
    .restart local v20    # "numModules":I
    invoke-static/range {p2 .. p4}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->isNotA1left(Lcom/google/zxing/oned/rss/FinderPattern;ZZ)Z

    move-result v3

    if-eqz v3, :cond_f0

    .line 669
    sget-object v3, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->WEIGHTS:[[I

    aget-object v3, v3, v16

    const/4 v6, 0x2

    mul-int v17, v6, v4

    const/4 v6, 0x1

    add-int/lit8 v17, v17, 0x1

    aget v3, v3, v17

    .line 670
    .local v3, "weight":I
    aget v6, v11, v4

    mul-int/2addr v6, v3

    add-int/2addr v2, v6

    .line 667
    .end local v3    # "weight":I
    :cond_f0
    add-int/lit8 v4, v4, -0x1

    move v5, v0

    move/from16 v6, v20

    move-object/from16 v0, p1

    const/4 v3, 0x1

    goto :goto_92

    .line 659
    .end local v4    # "i":I
    .end local v20    # "numModules":I
    .local v2, "i":I
    .restart local v6    # "numModules":I
    :cond_f9
    move v0, v5

    move/from16 v20, v6

    const/4 v5, 0x0

    .end local v6    # "numModules":I
    .restart local v20    # "numModules":I
    invoke-static/range {p2 .. p4}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->isNotA1left(Lcom/google/zxing/oned/rss/FinderPattern;ZZ)Z

    move-result v3

    if-eqz v3, :cond_111

    .line 660
    sget-object v3, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->WEIGHTS:[[I

    aget-object v3, v3, v16

    const/4 v4, 0x2

    mul-int v6, v4, v2

    aget v3, v3, v6

    .line 661
    .restart local v3    # "weight":I
    aget v6, v9, v2

    mul-int/2addr v6, v3

    add-int/2addr v15, v6

    .end local v3    # "weight":I
    goto :goto_112

    .line 663
    :cond_111
    const/4 v4, 0x2

    :goto_112
    aget v3, v9, v2

    add-int/2addr v14, v3

    .line 658
    add-int/lit8 v2, v2, -0x1

    move v5, v0

    move/from16 v6, v20

    move-object/from16 v0, p1

    const/4 v3, 0x1

    goto/16 :goto_8d

    .line 629
    .end local v2    # "i":I
    .end local v15    # "oddChecksumPortion":I
    .end local v16    # "weightRowNumber":I
    .end local v20    # "numModules":I
    .restart local v6    # "numModules":I
    .local v14, "i":I
    :cond_11f
    move-object/from16 v10, p0

    move v0, v5

    move/from16 v20, v6

    move v5, v2

    .end local v6    # "numModules":I
    .restart local v20    # "numModules":I
    const/high16 v2, 0x3f800000    # 1.0f

    aget v3, v1, v14

    int-to-float v3, v3

    mul-float/2addr v2, v3

    div-float/2addr v2, v7

    .line 630
    .local v2, "value":F
    const/high16 v3, 0x3f000000    # 0.5f

    add-float/2addr v3, v2

    float-to-int v3, v3

    .line 631
    .local v3, "count":I
    const/4 v6, 0x1

    if-ge v3, v6, :cond_141

    .line 632
    const v15, 0x3e99999a    # 0.3f

    cmpg-float v16, v2, v15

    if-ltz v16, :cond_13c

    .line 635
    const/4 v3, 0x1

    .line 636
    goto :goto_157

    .line 633
    :cond_13c
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v0

    throw v0

    .line 636
    :cond_141
    const v15, 0x3e99999a    # 0.3f

    const/16 v0, 0x8

    if-le v3, v0, :cond_157

    .line 637
    const v0, 0x410b3333    # 8.7f

    cmpl-float v0, v2, v0

    if-gtz v0, :cond_152

    .line 640
    const/16 v3, 0x8

    goto :goto_157

    .line 638
    :cond_152
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v0

    throw v0

    .line 642
    :cond_157
    :goto_157
    div-int/lit8 v0, v14, 0x2

    .line 643
    .local v0, "offset":I
    and-int/lit8 v16, v14, 0x1

    if-nez v16, :cond_165

    .line 644
    aput v3, v9, v0

    .line 645
    int-to-float v4, v3

    sub-float v4, v2, v4

    aput v4, v12, v0

    .line 646
    goto :goto_16c

    .line 647
    :cond_165
    aput v3, v11, v0

    .line 648
    int-to-float v4, v3

    sub-float v4, v2, v4

    aput v4, v13, v0

    .line 628
    .end local v0    # "offset":I
    .end local v2    # "value":F
    .end local v3    # "count":I
    :goto_16c
    add-int/lit8 v14, v14, 0x1

    move v2, v5

    move v3, v6

    move v10, v15

    move/from16 v6, v20

    move-object/from16 v0, p1

    const/4 v4, 0x2

    const/4 v5, 0x4

    goto/16 :goto_71

    .line 620
    .end local v9    # "oddCounts":[I
    .end local v11    # "evenCounts":[I
    .end local v12    # "oddRoundingErrors":[F
    .end local v13    # "evenRoundingErrors":[F
    .end local v14    # "i":I
    .end local v20    # "numModules":I
    .restart local v6    # "numModules":I
    :cond_179
    move-object/from16 v10, p0

    move/from16 v20, v6

    .end local v6    # "numModules":I
    .restart local v20    # "numModules":I
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v0

    throw v0

    .line 608
    .end local v8    # "expectedElementWidth":F
    .end local v20    # "numModules":I
    .local v6, "i":I
    .local v7, "j":I
    :cond_182
    move-object/from16 v10, p0

    move v5, v2

    move v0, v3

    aget v2, v1, v6

    .line 609
    .local v2, "temp":I
    aget v3, v1, v7

    aput v3, v1, v6

    .line 610
    aput v2, v1, v7

    .line 607
    .end local v2    # "temp":I
    add-int/lit8 v6, v6, 0x1

    add-int/lit8 v7, v7, -0x1

    move v3, v0

    move v2, v5

    move-object/from16 v0, p1

    const/4 v4, 0x2

    const/4 v5, 0x4

    goto/16 :goto_36
.end method

.method public decodeRow(ILcom/google/zxing/common/BitArray;Ljava/util/Map;)Lcom/google/zxing/Result;
    .registers 6
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
            Lcom/google/zxing/NotFoundException;,
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    .line 129
    .local p3, "hints":Ljava/util/Map;, "Ljava/util/Map<Lcom/google/zxing/DecodeHintType;*>;"
    iget-object v0, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->pairs:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 130
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->startFromEven:Z

    .line 132
    :try_start_8
    invoke-virtual {p0, p1, p2}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->decodeRow2pairs(ILcom/google/zxing/common/BitArray;)Ljava/util/List;

    move-result-object v0

    .line 133
    .local v0, "pairs":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/oned/rss/expanded/ExpandedPair;>;"
    invoke-static {v0}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->constructResult(Ljava/util/List;)Lcom/google/zxing/Result;

    move-result-object v1
    :try_end_10
    .catch Lcom/google/zxing/NotFoundException; {:try_start_8 .. :try_end_10} :catch_11

    return-object v1

    .line 134
    .end local v0    # "pairs":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/oned/rss/expanded/ExpandedPair;>;"
    :catch_11
    move-exception v0

    .line 138
    iget-object v0, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->pairs:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 139
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->startFromEven:Z

    .line 140
    invoke-virtual {p0, p1, p2}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->decodeRow2pairs(ILcom/google/zxing/common/BitArray;)Ljava/util/List;

    move-result-object v0

    .line 141
    .restart local v0    # "pairs":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/oned/rss/expanded/ExpandedPair;>;"
    invoke-static {v0}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->constructResult(Ljava/util/List;)Lcom/google/zxing/Result;

    move-result-object v1

    return-object v1
.end method

.method decodeRow2pairs(ILcom/google/zxing/common/BitArray;)Ljava/util/List;
    .registers 7
    .param p1, "rowNumber"    # I
    .param p2, "row"    # Lcom/google/zxing/common/BitArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lcom/google/zxing/common/BitArray;",
            ")",
            "Ljava/util/List<",
            "Lcom/google/zxing/oned/rss/expanded/ExpandedPair;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .line 154
    :goto_0
    :try_start_0
    iget-object v0, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->pairs:Ljava/util/List;

    invoke-virtual {p0, p2, v0, p1}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->retrieveNextPair(Lcom/google/zxing/common/BitArray;Ljava/util/List;I)Lcom/google/zxing/oned/rss/expanded/ExpandedPair;

    move-result-object v0

    .line 155
    .local v0, "nextPair":Lcom/google/zxing/oned/rss/expanded/ExpandedPair;
    iget-object v1, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->pairs:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_b
    .catch Lcom/google/zxing/NotFoundException; {:try_start_0 .. :try_end_b} :catch_c

    .line 153
    .end local v0    # "nextPair":Lcom/google/zxing/oned/rss/expanded/ExpandedPair;
    goto :goto_0

    .line 159
    :catch_c
    move-exception v0

    .line 160
    .local v0, "nfe":Lcom/google/zxing/NotFoundException;
    iget-object v1, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->pairs:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_40

    .line 166
    .end local v0    # "nfe":Lcom/google/zxing/NotFoundException;
    invoke-direct {p0}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->checkChecksum()Z

    move-result v0

    if-eqz v0, :cond_1e

    .line 167
    iget-object v0, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->pairs:Ljava/util/List;

    return-object v0

    .line 170
    :cond_1e
    iget-object v0, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->rows:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    const/4 v1, 0x1

    xor-int/2addr v0, v1

    .line 171
    .local v0, "tryStackedDecode":Z
    const/4 v2, 0x0

    .line 172
    .local v2, "wasReversed":Z
    invoke-direct {p0, p1, v2}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->storeRow(IZ)V

    .line 173
    if-eqz v0, :cond_3b

    .line 176
    const/4 v3, 0x0

    invoke-direct {p0, v3}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->checkRows(Z)Ljava/util/List;

    move-result-object v3

    .line 177
    .local v3, "ps":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/oned/rss/expanded/ExpandedPair;>;"
    if-eqz v3, :cond_34

    .line 178
    return-object v3

    .line 180
    :cond_34
    invoke-direct {p0, v1}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->checkRows(Z)Ljava/util/List;

    move-result-object v1

    .line 181
    .end local v3    # "ps":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/oned/rss/expanded/ExpandedPair;>;"
    .local v1, "ps":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/oned/rss/expanded/ExpandedPair;>;"
    if-eqz v1, :cond_3b

    .line 182
    return-object v1

    .line 186
    .end local v1    # "ps":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/oned/rss/expanded/ExpandedPair;>;"
    :cond_3b
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v1

    throw v1

    .line 161
    .end local v2    # "wasReversed":Z
    .local v0, "nfe":Lcom/google/zxing/NotFoundException;
    :cond_40
    throw v0
.end method

.method getRows()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/google/zxing/oned/rss/expanded/ExpandedRow;",
            ">;"
        }
    .end annotation

    .line 362
    iget-object v0, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->rows:Ljava/util/List;

    return-object v0
.end method

.method public reset()V
    .registers 2

    .line 146
    iget-object v0, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->pairs:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 147
    iget-object v0, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->rows:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 148
    return-void
.end method

.method retrieveNextPair(Lcom/google/zxing/common/BitArray;Ljava/util/List;I)Lcom/google/zxing/oned/rss/expanded/ExpandedPair;
    .registers 12
    .param p1, "row"    # Lcom/google/zxing/common/BitArray;
    .param p3, "rowNumber"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/zxing/common/BitArray;",
            "Ljava/util/List<",
            "Lcom/google/zxing/oned/rss/expanded/ExpandedPair;",
            ">;I)",
            "Lcom/google/zxing/oned/rss/expanded/ExpandedPair;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .line 428
    .local p2, "previousPairs":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/oned/rss/expanded/ExpandedPair;>;"
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v0

    rem-int/lit8 v0, v0, 0x2

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-nez v0, :cond_c

    move v0, v2

    goto :goto_d

    :cond_c
    move v0, v1

    .line 429
    .local v0, "isOddPattern":Z
    :goto_d
    iget-boolean v3, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->startFromEven:Z

    if-eqz v3, :cond_17

    .line 430
    if-eqz v0, :cond_15

    move v3, v1

    goto :goto_16

    :cond_15
    move v3, v2

    :goto_16
    move v0, v3

    .line 435
    :cond_17
    const/4 v3, 0x1

    .line 436
    .local v3, "keepFinding":Z
    const/4 v4, -0x1

    .line 438
    .local v4, "forcedOffset":I
    :cond_19
    invoke-direct {p0, p1, p2, v4}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->findNextPair(Lcom/google/zxing/common/BitArray;Ljava/util/List;I)V

    .line 439
    invoke-direct {p0, p1, p3, v0}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->parseFoundFinderPattern(Lcom/google/zxing/common/BitArray;IZ)Lcom/google/zxing/oned/rss/FinderPattern;

    move-result-object v5

    .line 440
    .local v5, "pattern":Lcom/google/zxing/oned/rss/FinderPattern;
    if-nez v5, :cond_2b

    .line 441
    iget-object v6, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->startEnd:[I

    aget v6, v6, v1

    invoke-static {p1, v6}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->getNextSecondBar(Lcom/google/zxing/common/BitArray;I)I

    move-result v4

    .line 442
    goto :goto_2c

    .line 443
    :cond_2b
    const/4 v3, 0x0

    .line 445
    :goto_2c
    if-nez v3, :cond_19

    .line 450
    invoke-virtual {p0, p1, v5, v0, v2}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->decodeDataCharacter(Lcom/google/zxing/common/BitArray;Lcom/google/zxing/oned/rss/FinderPattern;ZZ)Lcom/google/zxing/oned/rss/DataCharacter;

    move-result-object v6

    .line 452
    .local v6, "leftChar":Lcom/google/zxing/oned/rss/DataCharacter;
    invoke-interface {p2}, Ljava/util/List;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_4f

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v7

    sub-int/2addr v7, v2

    invoke-interface {p2, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/zxing/oned/rss/expanded/ExpandedPair;

    invoke-virtual {v2}, Lcom/google/zxing/oned/rss/expanded/ExpandedPair;->mustBeLast()Z

    move-result v2

    if-nez v2, :cond_4a

    goto :goto_4f

    .line 453
    :cond_4a
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v1

    throw v1

    .line 458
    :cond_4f
    :goto_4f
    :try_start_4f
    invoke-virtual {p0, p1, v5, v0, v1}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->decodeDataCharacter(Lcom/google/zxing/common/BitArray;Lcom/google/zxing/oned/rss/FinderPattern;ZZ)Lcom/google/zxing/oned/rss/DataCharacter;

    move-result-object v1
    :try_end_53
    .catch Lcom/google/zxing/NotFoundException; {:try_start_4f .. :try_end_53} :catch_54

    .line 459
    .local v1, "rightChar":Lcom/google/zxing/oned/rss/DataCharacter;
    goto :goto_56

    .end local v1    # "rightChar":Lcom/google/zxing/oned/rss/DataCharacter;
    :catch_54
    move-exception v1

    .line 460
    .local v1, "ignored":Lcom/google/zxing/NotFoundException;
    const/4 v1, 0x0

    .line 462
    .local v1, "rightChar":Lcom/google/zxing/oned/rss/DataCharacter;
    :goto_56
    const/4 v2, 0x1

    .line 463
    .local v2, "mayBeLast":Z
    new-instance v7, Lcom/google/zxing/oned/rss/expanded/ExpandedPair;

    invoke-direct {v7, v6, v1, v5, v2}, Lcom/google/zxing/oned/rss/expanded/ExpandedPair;-><init>(Lcom/google/zxing/oned/rss/DataCharacter;Lcom/google/zxing/oned/rss/DataCharacter;Lcom/google/zxing/oned/rss/FinderPattern;Z)V

    return-object v7
.end method
