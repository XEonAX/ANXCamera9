.class public Lcom/google/zxing/qrcode/detector/FinderPatternFinder;
.super Ljava/lang/Object;
.source "FinderPatternFinder.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/zxing/qrcode/detector/FinderPatternFinder$CenterComparator;,
        Lcom/google/zxing/qrcode/detector/FinderPatternFinder$FurthestFromAverageComparator;
    }
.end annotation


# static fields
.field private static final CENTER_QUORUM:I = 0x2

.field protected static final MAX_MODULES:I = 0x39

.field protected static final MIN_SKIP:I = 0x3


# instance fields
.field private final crossCheckStateCount:[I

.field private hasSkipped:Z

.field private final image:Lcom/google/zxing/common/BitMatrix;

.field private final possibleCenters:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/google/zxing/qrcode/detector/FinderPattern;",
            ">;"
        }
    .end annotation
.end field

.field private final resultPointCallback:Lcom/google/zxing/ResultPointCallback;


# direct methods
.method public constructor <init>(Lcom/google/zxing/common/BitMatrix;)V
    .registers 3
    .param p1, "image"    # Lcom/google/zxing/common/BitMatrix;

    .line 58
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;-><init>(Lcom/google/zxing/common/BitMatrix;Lcom/google/zxing/ResultPointCallback;)V

    .line 59
    return-void
.end method

.method public constructor <init>(Lcom/google/zxing/common/BitMatrix;Lcom/google/zxing/ResultPointCallback;)V
    .registers 4
    .param p1, "image"    # Lcom/google/zxing/common/BitMatrix;
    .param p2, "resultPointCallback"    # Lcom/google/zxing/ResultPointCallback;

    .line 61
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 62
    iput-object p1, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->image:Lcom/google/zxing/common/BitMatrix;

    .line 63
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/List;

    .line 64
    const/4 v0, 0x5

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->crossCheckStateCount:[I

    .line 65
    iput-object p2, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->resultPointCallback:Lcom/google/zxing/ResultPointCallback;

    .line 66
    return-void
.end method

.method private static centerFromEnd([II)F
    .registers 5
    .param p0, "stateCount"    # [I
    .param p1, "end"    # I

    .line 191
    const/4 v0, 0x4

    aget v0, p0, v0

    sub-int v0, p1, v0

    const/4 v1, 0x3

    aget v1, p0, v1

    sub-int/2addr v0, v1

    int-to-float v0, v0

    const/4 v1, 0x2

    aget v1, p0, v1

    int-to-float v1, v1

    const/high16 v2, 0x40000000    # 2.0f

    div-float/2addr v1, v2

    sub-float/2addr v0, v1

    return v0
.end method

.method private crossCheckDiagonal(IIII)Z
    .registers 21
    .param p1, "startI"    # I
    .param p2, "centerJ"    # I
    .param p3, "maxCount"    # I
    .param p4, "originalStateCountTotal"    # I

    move-object/from16 v0, p0

    move/from16 v1, p1

    move/from16 v2, p2

    move/from16 v3, p3

    .line 244
    invoke-direct/range {p0 .. p0}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->getCrossCheckStateCount()[I

    move-result-object v4

    .line 247
    .local v4, "stateCount":[I
    const/4 v5, 0x0

    .line 248
    .local v5, "i":I
    :goto_d
    const/4 v6, 0x2

    const/4 v7, 0x1

    if-lt v1, v5, :cond_28

    if-lt v2, v5, :cond_28

    iget-object v8, v0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->image:Lcom/google/zxing/common/BitMatrix;

    sub-int v9, v2, v5

    sub-int v10, v1, v5

    invoke-virtual {v8, v9, v10}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v8

    if-nez v8, :cond_20

    goto :goto_28

    .line 249
    :cond_20
    aget v8, v4, v6

    add-int/2addr v8, v7

    aput v8, v4, v6

    .line 250
    add-int/lit8 v5, v5, 0x1

    goto :goto_d

    .line 253
    :cond_28
    :goto_28
    const/4 v8, 0x0

    if-lt v1, v5, :cond_127

    if-ge v2, v5, :cond_2f

    goto/16 :goto_127

    .line 258
    :cond_2f
    :goto_2f
    if-lt v1, v5, :cond_4c

    if-lt v2, v5, :cond_4c

    iget-object v9, v0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->image:Lcom/google/zxing/common/BitMatrix;

    sub-int v10, v2, v5

    sub-int v11, v1, v5

    invoke-virtual {v9, v10, v11}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v9

    if-nez v9, :cond_4c

    .line 259
    aget v9, v4, v7

    .line 258
    if-le v9, v3, :cond_44

    goto :goto_4c

    .line 260
    :cond_44
    aget v9, v4, v7

    add-int/2addr v9, v7

    aput v9, v4, v7

    .line 261
    add-int/lit8 v5, v5, 0x1

    goto :goto_2f

    .line 265
    :cond_4c
    :goto_4c
    if-lt v1, v5, :cond_126

    if-lt v2, v5, :cond_126

    aget v9, v4, v7

    if-le v9, v3, :cond_56

    goto/16 :goto_126

    .line 270
    :cond_56
    :goto_56
    if-lt v1, v5, :cond_73

    if-lt v2, v5, :cond_73

    iget-object v9, v0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->image:Lcom/google/zxing/common/BitMatrix;

    sub-int v10, v2, v5

    sub-int v11, v1, v5

    invoke-virtual {v9, v10, v11}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v9

    if-eqz v9, :cond_73

    .line 271
    aget v9, v4, v8

    .line 270
    if-le v9, v3, :cond_6b

    goto :goto_73

    .line 272
    :cond_6b
    aget v9, v4, v8

    add-int/2addr v9, v7

    aput v9, v4, v8

    .line 273
    add-int/lit8 v5, v5, 0x1

    goto :goto_56

    .line 275
    :cond_73
    :goto_73
    aget v9, v4, v8

    if-le v9, v3, :cond_78

    .line 276
    return v8

    .line 279
    :cond_78
    iget-object v9, v0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->image:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v9}, Lcom/google/zxing/common/BitMatrix;->getHeight()I

    move-result v9

    .line 280
    .local v9, "maxI":I
    iget-object v10, v0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->image:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v10}, Lcom/google/zxing/common/BitMatrix;->getWidth()I

    move-result v10

    .line 283
    .local v10, "maxJ":I
    const/4 v5, 0x1

    .line 284
    :goto_85
    add-int v11, v1, v5

    if-ge v11, v9, :cond_a2

    add-int v11, v2, v5

    if-ge v11, v10, :cond_a2

    iget-object v11, v0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->image:Lcom/google/zxing/common/BitMatrix;

    add-int v12, v2, v5

    add-int v13, v1, v5

    invoke-virtual {v11, v12, v13}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v11

    if-nez v11, :cond_9a

    goto :goto_a2

    .line 285
    :cond_9a
    aget v11, v4, v6

    add-int/2addr v11, v7

    aput v11, v4, v6

    .line 286
    add-int/lit8 v5, v5, 0x1

    goto :goto_85

    .line 290
    :cond_a2
    :goto_a2
    add-int v11, v1, v5

    if-ge v11, v9, :cond_125

    add-int v11, v2, v5

    if-lt v11, v10, :cond_ac

    goto/16 :goto_125

    .line 294
    :cond_ac
    :goto_ac
    add-int v11, v1, v5

    const/4 v12, 0x3

    if-ge v11, v9, :cond_ce

    add-int v11, v2, v5

    if-ge v11, v10, :cond_ce

    iget-object v11, v0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->image:Lcom/google/zxing/common/BitMatrix;

    add-int v13, v2, v5

    add-int v14, v1, v5

    invoke-virtual {v11, v13, v14}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v11

    if-nez v11, :cond_ce

    .line 295
    aget v11, v4, v12

    .line 294
    if-lt v11, v3, :cond_c6

    goto :goto_ce

    .line 296
    :cond_c6
    aget v11, v4, v12

    add-int/2addr v11, v7

    aput v11, v4, v12

    .line 297
    add-int/lit8 v5, v5, 0x1

    goto :goto_ac

    .line 300
    :cond_ce
    :goto_ce
    add-int v11, v1, v5

    if-ge v11, v9, :cond_124

    add-int v11, v2, v5

    if-ge v11, v10, :cond_124

    aget v11, v4, v12

    if-lt v11, v3, :cond_db

    goto :goto_124

    .line 304
    :cond_db
    :goto_db
    add-int v11, v1, v5

    const/4 v13, 0x4

    if-ge v11, v9, :cond_fe

    add-int v11, v2, v5

    if-ge v11, v10, :cond_fe

    iget-object v11, v0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->image:Lcom/google/zxing/common/BitMatrix;

    add-int v14, v2, v5

    add-int v12, v1, v5

    invoke-virtual {v11, v14, v12}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v11

    if-eqz v11, :cond_fe

    .line 305
    aget v11, v4, v13

    .line 304
    if-lt v11, v3, :cond_f5

    goto :goto_fe

    .line 306
    :cond_f5
    aget v11, v4, v13

    add-int/2addr v11, v7

    aput v11, v4, v13

    .line 307
    add-int/lit8 v5, v5, 0x1

    .line 304
    const/4 v12, 0x3

    goto :goto_db

    .line 310
    :cond_fe
    :goto_fe
    aget v11, v4, v13

    if-lt v11, v3, :cond_103

    .line 311
    return v8

    .line 316
    :cond_103
    aget v11, v4, v8

    aget v12, v4, v7

    add-int/2addr v11, v12

    aget v12, v4, v6

    add-int/2addr v11, v12

    const/4 v12, 0x3

    aget v12, v4, v12

    add-int/2addr v11, v12

    aget v12, v4, v13

    add-int/2addr v11, v12

    .line 318
    .local v11, "stateCountTotal":I
    sub-int v12, v11, p4

    invoke-static {v12}, Ljava/lang/Math;->abs(I)I

    move-result v12

    mul-int v6, v6, p4

    if-ge v12, v6, :cond_123

    .line 319
    invoke-static {v4}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->foundPatternCross([I)Z

    move-result v6

    if-eqz v6, :cond_123

    .line 317
    return v7

    :cond_123
    return v8

    .line 301
    .end local v11    # "stateCountTotal":I
    :cond_124
    :goto_124
    return v8

    .line 291
    :cond_125
    :goto_125
    return v8

    .line 266
    .end local v9    # "maxI":I
    .end local v10    # "maxJ":I
    :cond_126
    :goto_126
    return v8

    .line 254
    :cond_127
    :goto_127
    return v8
.end method

.method private crossCheckHorizontal(IIII)F
    .registers 16
    .param p1, "startJ"    # I
    .param p2, "centerI"    # I
    .param p3, "maxCount"    # I
    .param p4, "originalStateCountTotal"    # I

    .line 407
    iget-object v0, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->image:Lcom/google/zxing/common/BitMatrix;

    .line 409
    .local v0, "image":Lcom/google/zxing/common/BitMatrix;
    invoke-virtual {v0}, Lcom/google/zxing/common/BitMatrix;->getWidth()I

    move-result v1

    .line 410
    .local v1, "maxJ":I
    invoke-direct {p0}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->getCrossCheckStateCount()[I

    move-result-object v2

    .line 412
    .local v2, "stateCount":[I
    move v3, p1

    .line 413
    .local v3, "j":I
    :goto_b
    const/4 v4, 0x2

    const/4 v5, 0x1

    if-ltz v3, :cond_1e

    invoke-virtual {v0, v3, p2}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v6

    if-nez v6, :cond_16

    goto :goto_1e

    .line 414
    :cond_16
    aget v6, v2, v4

    add-int/2addr v6, v5

    aput v6, v2, v4

    .line 415
    add-int/lit8 v3, v3, -0x1

    goto :goto_b

    .line 417
    :cond_1e
    :goto_1e
    const/high16 v6, 0x7fc00000    # Float.NaN

    if-gez v3, :cond_23

    .line 418
    return v6

    .line 420
    :cond_23
    :goto_23
    if-ltz v3, :cond_38

    invoke-virtual {v0, v3, p2}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v7

    if-nez v7, :cond_38

    aget v7, v2, v5

    if-le v7, p3, :cond_30

    goto :goto_38

    .line 421
    :cond_30
    aget v7, v2, v5

    add-int/2addr v7, v5

    aput v7, v2, v5

    .line 422
    add-int/lit8 v3, v3, -0x1

    goto :goto_23

    .line 424
    :cond_38
    :goto_38
    if-ltz v3, :cond_cf

    aget v7, v2, v5

    if-le v7, p3, :cond_40

    goto/16 :goto_cf

    .line 427
    :cond_40
    :goto_40
    const/4 v7, 0x0

    if-ltz v3, :cond_56

    invoke-virtual {v0, v3, p2}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v8

    if-eqz v8, :cond_56

    aget v8, v2, v7

    if-le v8, p3, :cond_4e

    goto :goto_56

    .line 428
    :cond_4e
    aget v8, v2, v7

    add-int/2addr v8, v5

    aput v8, v2, v7

    .line 429
    add-int/lit8 v3, v3, -0x1

    goto :goto_40

    .line 431
    :cond_56
    :goto_56
    aget v8, v2, v7

    if-le v8, p3, :cond_5b

    .line 432
    return v6

    .line 435
    :cond_5b
    add-int/lit8 v3, p1, 0x1

    .line 436
    :goto_5d
    if-ge v3, v1, :cond_6e

    invoke-virtual {v0, v3, p2}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v8

    if-nez v8, :cond_66

    goto :goto_6e

    .line 437
    :cond_66
    aget v8, v2, v4

    add-int/2addr v8, v5

    aput v8, v2, v4

    .line 438
    add-int/lit8 v3, v3, 0x1

    goto :goto_5d

    .line 440
    :cond_6e
    :goto_6e
    if-ne v3, v1, :cond_71

    .line 441
    return v6

    .line 443
    :cond_71
    :goto_71
    const/4 v8, 0x3

    if-ge v3, v1, :cond_87

    invoke-virtual {v0, v3, p2}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v9

    if-nez v9, :cond_87

    aget v9, v2, v8

    if-lt v9, p3, :cond_7f

    goto :goto_87

    .line 444
    :cond_7f
    aget v9, v2, v8

    add-int/2addr v9, v5

    aput v9, v2, v8

    .line 445
    add-int/lit8 v3, v3, 0x1

    goto :goto_71

    .line 447
    :cond_87
    :goto_87
    if-eq v3, v1, :cond_ce

    aget v9, v2, v8

    if-lt v9, p3, :cond_8e

    goto :goto_ce

    .line 450
    :cond_8e
    :goto_8e
    const/4 v9, 0x4

    if-ge v3, v1, :cond_a4

    invoke-virtual {v0, v3, p2}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v10

    if-eqz v10, :cond_a4

    aget v10, v2, v9

    if-lt v10, p3, :cond_9c

    goto :goto_a4

    .line 451
    :cond_9c
    aget v10, v2, v9

    add-int/2addr v10, v5

    aput v10, v2, v9

    .line 452
    add-int/lit8 v3, v3, 0x1

    goto :goto_8e

    .line 454
    :cond_a4
    :goto_a4
    aget v10, v2, v9

    if-lt v10, p3, :cond_a9

    .line 455
    return v6

    .line 460
    :cond_a9
    aget v7, v2, v7

    aget v5, v2, v5

    add-int/2addr v7, v5

    aget v4, v2, v4

    add-int/2addr v7, v4

    aget v4, v2, v8

    add-int/2addr v7, v4

    .line 461
    aget v4, v2, v9

    .line 460
    add-int/2addr v7, v4

    .line 462
    .local v7, "stateCountTotal":I
    const/4 v4, 0x5

    sub-int v5, v7, p4

    invoke-static {v5}, Ljava/lang/Math;->abs(I)I

    move-result v5

    mul-int/2addr v4, v5

    if-lt v4, p4, :cond_c2

    .line 463
    return v6

    .line 466
    :cond_c2
    invoke-static {v2}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->foundPatternCross([I)Z

    move-result v4

    if-eqz v4, :cond_cd

    invoke-static {v2, v3}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->centerFromEnd([II)F

    move-result v6

    nop

    :cond_cd
    return v6

    .line 448
    .end local v7    # "stateCountTotal":I
    :cond_ce
    :goto_ce
    return v6

    .line 425
    :cond_cf
    :goto_cf
    return v6
.end method

.method private crossCheckVertical(IIII)F
    .registers 16
    .param p1, "startI"    # I
    .param p2, "centerJ"    # I
    .param p3, "maxCount"    # I
    .param p4, "originalStateCountTotal"    # I

    .line 335
    iget-object v0, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->image:Lcom/google/zxing/common/BitMatrix;

    .line 337
    .local v0, "image":Lcom/google/zxing/common/BitMatrix;
    invoke-virtual {v0}, Lcom/google/zxing/common/BitMatrix;->getHeight()I

    move-result v1

    .line 338
    .local v1, "maxI":I
    invoke-direct {p0}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->getCrossCheckStateCount()[I

    move-result-object v2

    .line 341
    .local v2, "stateCount":[I
    move v3, p1

    .line 342
    .local v3, "i":I
    :goto_b
    const/4 v4, 0x2

    const/4 v5, 0x1

    if-ltz v3, :cond_1e

    invoke-virtual {v0, p2, v3}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v6

    if-nez v6, :cond_16

    goto :goto_1e

    .line 343
    :cond_16
    aget v6, v2, v4

    add-int/2addr v6, v5

    aput v6, v2, v4

    .line 344
    add-int/lit8 v3, v3, -0x1

    goto :goto_b

    .line 346
    :cond_1e
    :goto_1e
    const/high16 v6, 0x7fc00000    # Float.NaN

    if-gez v3, :cond_23

    .line 347
    return v6

    .line 349
    :cond_23
    :goto_23
    if-ltz v3, :cond_38

    invoke-virtual {v0, p2, v3}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v7

    if-nez v7, :cond_38

    aget v7, v2, v5

    if-le v7, p3, :cond_30

    goto :goto_38

    .line 350
    :cond_30
    aget v7, v2, v5

    add-int/2addr v7, v5

    aput v7, v2, v5

    .line 351
    add-int/lit8 v3, v3, -0x1

    goto :goto_23

    .line 354
    :cond_38
    :goto_38
    if-ltz v3, :cond_d0

    aget v7, v2, v5

    if-le v7, p3, :cond_40

    goto/16 :goto_d0

    .line 357
    :cond_40
    :goto_40
    const/4 v7, 0x0

    if-ltz v3, :cond_56

    invoke-virtual {v0, p2, v3}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v8

    if-eqz v8, :cond_56

    aget v8, v2, v7

    if-le v8, p3, :cond_4e

    goto :goto_56

    .line 358
    :cond_4e
    aget v8, v2, v7

    add-int/2addr v8, v5

    aput v8, v2, v7

    .line 359
    add-int/lit8 v3, v3, -0x1

    goto :goto_40

    .line 361
    :cond_56
    :goto_56
    aget v8, v2, v7

    if-le v8, p3, :cond_5b

    .line 362
    return v6

    .line 366
    :cond_5b
    add-int/lit8 v3, p1, 0x1

    .line 367
    :goto_5d
    if-ge v3, v1, :cond_6e

    invoke-virtual {v0, p2, v3}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v8

    if-nez v8, :cond_66

    goto :goto_6e

    .line 368
    :cond_66
    aget v8, v2, v4

    add-int/2addr v8, v5

    aput v8, v2, v4

    .line 369
    add-int/lit8 v3, v3, 0x1

    goto :goto_5d

    .line 371
    :cond_6e
    :goto_6e
    if-ne v3, v1, :cond_71

    .line 372
    return v6

    .line 374
    :cond_71
    :goto_71
    const/4 v8, 0x3

    if-ge v3, v1, :cond_87

    invoke-virtual {v0, p2, v3}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v9

    if-nez v9, :cond_87

    aget v9, v2, v8

    if-lt v9, p3, :cond_7f

    goto :goto_87

    .line 375
    :cond_7f
    aget v9, v2, v8

    add-int/2addr v9, v5

    aput v9, v2, v8

    .line 376
    add-int/lit8 v3, v3, 0x1

    goto :goto_71

    .line 378
    :cond_87
    :goto_87
    if-eq v3, v1, :cond_cf

    aget v9, v2, v8

    if-lt v9, p3, :cond_8e

    goto :goto_cf

    .line 381
    :cond_8e
    :goto_8e
    const/4 v9, 0x4

    if-ge v3, v1, :cond_a4

    invoke-virtual {v0, p2, v3}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v10

    if-eqz v10, :cond_a4

    aget v10, v2, v9

    if-lt v10, p3, :cond_9c

    goto :goto_a4

    .line 382
    :cond_9c
    aget v10, v2, v9

    add-int/2addr v10, v5

    aput v10, v2, v9

    .line 383
    add-int/lit8 v3, v3, 0x1

    goto :goto_8e

    .line 385
    :cond_a4
    :goto_a4
    aget v10, v2, v9

    if-lt v10, p3, :cond_a9

    .line 386
    return v6

    .line 391
    :cond_a9
    aget v7, v2, v7

    aget v5, v2, v5

    add-int/2addr v7, v5

    aget v5, v2, v4

    add-int/2addr v7, v5

    aget v5, v2, v8

    add-int/2addr v7, v5

    .line 392
    aget v5, v2, v9

    .line 391
    add-int/2addr v7, v5

    .line 393
    .local v7, "stateCountTotal":I
    const/4 v5, 0x5

    sub-int v8, v7, p4

    invoke-static {v8}, Ljava/lang/Math;->abs(I)I

    move-result v8

    mul-int/2addr v5, v8

    mul-int/2addr v4, p4

    if-lt v5, v4, :cond_c3

    .line 394
    return v6

    .line 397
    :cond_c3
    invoke-static {v2}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->foundPatternCross([I)Z

    move-result v4

    if-eqz v4, :cond_ce

    invoke-static {v2, v3}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->centerFromEnd([II)F

    move-result v6

    nop

    :cond_ce
    return v6

    .line 379
    .end local v7    # "stateCountTotal":I
    :cond_cf
    :goto_cf
    return v6

    .line 355
    :cond_d0
    :goto_d0
    return v6
.end method

.method private findRowSkip()I
    .registers 9

    .line 528
    iget-object v0, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    .line 529
    .local v0, "max":I
    const/4 v1, 0x0

    const/4 v2, 0x1

    if-gt v0, v2, :cond_b

    .line 530
    return v1

    .line 532
    :cond_b
    const/4 v3, 0x0

    .line 533
    .local v3, "firstConfirmedCenter":Lcom/google/zxing/ResultPoint;
    iget-object v4, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_12
    :goto_12
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-nez v5, :cond_19

    .line 549
    return v1

    .line 533
    :cond_19
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/google/zxing/qrcode/detector/FinderPattern;

    .line 534
    .local v5, "center":Lcom/google/zxing/qrcode/detector/FinderPattern;
    invoke-virtual {v5}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getCount()I

    move-result v6

    const/4 v7, 0x2

    if-lt v6, v7, :cond_12

    .line 535
    if-nez v3, :cond_2a

    .line 536
    move-object v3, v5

    .line 537
    goto :goto_12

    .line 543
    :cond_2a
    iput-boolean v2, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->hasSkipped:Z

    .line 544
    invoke-virtual {v3}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v1

    invoke-virtual {v5}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getX()F

    move-result v2

    sub-float/2addr v1, v2

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v1

    .line 545
    invoke-virtual {v3}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v2

    invoke-virtual {v5}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getY()F

    move-result v4

    sub-float/2addr v2, v4

    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v2

    .line 544
    sub-float/2addr v1, v2

    float-to-int v1, v1

    .line 545
    nop

    .line 544
    div-int/2addr v1, v7

    return v1
.end method

.method protected static foundPatternCross([I)Z
    .registers 9
    .param p0, "stateCount"    # [I

    .line 200
    const/4 v0, 0x0

    .line 201
    .local v0, "totalModuleSize":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_2
    const/4 v2, 0x5

    const/4 v3, 0x0

    if-lt v1, v2, :cond_5d

    .line 208
    .end local v1    # "i":I
    const/4 v1, 0x7

    if-ge v0, v1, :cond_a

    .line 209
    return v3

    .line 211
    :cond_a
    int-to-float v1, v0

    const/high16 v2, 0x40e00000    # 7.0f

    div-float/2addr v1, v2

    .line 212
    .local v1, "moduleSize":F
    const/high16 v2, 0x40000000    # 2.0f

    div-float v2, v1, v2

    .line 215
    .local v2, "maxVariance":F
    aget v4, p0, v3

    int-to-float v4, v4

    sub-float v4, v1, v4

    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v4

    cmpg-float v4, v4, v2

    if-gez v4, :cond_5c

    .line 216
    const/4 v4, 0x1

    aget v5, p0, v4

    int-to-float v5, v5

    sub-float v5, v1, v5

    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    move-result v5

    cmpg-float v5, v5, v2

    if-gez v5, :cond_5c

    .line 217
    const/high16 v5, 0x40400000    # 3.0f

    mul-float v6, v5, v1

    const/4 v7, 0x2

    aget v7, p0, v7

    int-to-float v7, v7

    sub-float/2addr v6, v7

    invoke-static {v6}, Ljava/lang/Math;->abs(F)F

    move-result v6

    mul-float/2addr v5, v2

    cmpg-float v5, v6, v5

    if-gez v5, :cond_5c

    .line 218
    const/4 v5, 0x3

    aget v5, p0, v5

    int-to-float v5, v5

    sub-float v5, v1, v5

    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    move-result v5

    cmpg-float v5, v5, v2

    if-gez v5, :cond_5c

    .line 219
    const/4 v5, 0x4

    aget v5, p0, v5

    int-to-float v5, v5

    sub-float v5, v1, v5

    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    move-result v5

    .line 214
    cmpg-float v5, v5, v2

    if-gez v5, :cond_5c

    return v4

    :cond_5c
    return v3

    .line 202
    .end local v2    # "maxVariance":F
    .local v1, "i":I
    :cond_5d
    aget v2, p0, v1

    .line 203
    .local v2, "count":I
    if-nez v2, :cond_62

    .line 204
    return v3

    .line 206
    :cond_62
    add-int/2addr v0, v2

    .line 201
    .end local v2    # "count":I
    add-int/lit8 v1, v1, 0x1

    goto :goto_2
.end method

.method private getCrossCheckStateCount()[I
    .registers 4

    .line 223
    iget-object v0, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->crossCheckStateCount:[I

    const/4 v1, 0x0

    aput v1, v0, v1

    .line 224
    iget-object v0, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->crossCheckStateCount:[I

    const/4 v2, 0x1

    aput v1, v0, v2

    .line 225
    iget-object v0, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->crossCheckStateCount:[I

    const/4 v2, 0x2

    aput v1, v0, v2

    .line 226
    iget-object v0, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->crossCheckStateCount:[I

    const/4 v2, 0x3

    aput v1, v0, v2

    .line 227
    iget-object v0, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->crossCheckStateCount:[I

    const/4 v2, 0x4

    aput v1, v0, v2

    .line 228
    iget-object v0, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->crossCheckStateCount:[I

    return-object v0
.end method

.method private haveMultiplyConfirmedCenters()Z
    .registers 10

    .line 558
    const/4 v0, 0x0

    .line 559
    .local v0, "confirmedCount":I
    const/4 v1, 0x0

    .line 560
    .local v1, "totalModuleSize":F
    iget-object v2, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    .line 561
    .local v2, "max":I
    iget-object v3, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_e
    :goto_e
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_44

    .line 567
    const/4 v3, 0x3

    const/4 v4, 0x0

    if-ge v0, v3, :cond_19

    .line 568
    return v4

    .line 574
    :cond_19
    int-to-float v3, v2

    div-float v5, v1, v3

    .line 575
    .local v5, "average":F
    const/4 v3, 0x0

    .line 576
    .local v3, "totalDeviation":F
    iget-object v6, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_23
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-nez v7, :cond_33

    .line 579
    const v6, 0x3d4ccccd    # 0.05f

    mul-float/2addr v6, v1

    cmpg-float v6, v3, v6

    if-gtz v6, :cond_32

    const/4 v4, 0x1

    :cond_32
    return v4

    .line 576
    :cond_33
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/google/zxing/qrcode/detector/FinderPattern;

    .line 577
    .local v7, "pattern":Lcom/google/zxing/qrcode/detector/FinderPattern;
    invoke-virtual {v7}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getEstimatedModuleSize()F

    move-result v8

    sub-float/2addr v8, v5

    invoke-static {v8}, Ljava/lang/Math;->abs(F)F

    move-result v8

    add-float/2addr v3, v8

    .end local v7    # "pattern":Lcom/google/zxing/qrcode/detector/FinderPattern;
    goto :goto_23

    .line 561
    .end local v3    # "totalDeviation":F
    .end local v5    # "average":F
    :cond_44
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/google/zxing/qrcode/detector/FinderPattern;

    .line 562
    .local v4, "pattern":Lcom/google/zxing/qrcode/detector/FinderPattern;
    invoke-virtual {v4}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getCount()I

    move-result v5

    const/4 v6, 0x2

    if-lt v5, v6, :cond_e

    .line 563
    add-int/lit8 v0, v0, 0x1

    .line 564
    invoke-virtual {v4}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getEstimatedModuleSize()F

    move-result v5

    add-float/2addr v1, v5

    .end local v4    # "pattern":Lcom/google/zxing/qrcode/detector/FinderPattern;
    goto :goto_e
.end method

.method private selectBestPatterns()[Lcom/google/zxing/qrcode/detector/FinderPattern;
    .registers 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .line 590
    iget-object v0, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    .line 591
    .local v0, "startSize":I
    const/4 v1, 0x3

    if-lt v0, v1, :cond_e2

    .line 597
    const/4 v2, 0x0

    const/4 v3, 0x1

    if-le v0, v1, :cond_7b

    .line 599
    const/4 v4, 0x0

    .line 600
    .local v4, "totalModuleSize":F
    const/4 v5, 0x0

    .line 601
    .local v5, "square":F
    iget-object v6, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_15
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-nez v7, :cond_6c

    .line 606
    int-to-float v6, v0

    div-float v6, v4, v6

    .line 607
    .local v6, "average":F
    int-to-float v7, v0

    div-float v7, v5, v7

    mul-float v8, v6, v6

    sub-float/2addr v7, v8

    float-to-double v7, v7

    invoke-static {v7, v8}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v7

    double-to-float v7, v7

    .line 609
    .local v7, "stdDev":F
    iget-object v8, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/List;

    new-instance v9, Lcom/google/zxing/qrcode/detector/FinderPatternFinder$FurthestFromAverageComparator;

    invoke-direct {v9, v6, v2}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder$FurthestFromAverageComparator;-><init>(FLcom/google/zxing/qrcode/detector/FinderPatternFinder$FurthestFromAverageComparator;)V

    invoke-static {v8, v9}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 611
    const v8, 0x3e4ccccd    # 0.2f

    mul-float/2addr v8, v6

    invoke-static {v8, v7}, Ljava/lang/Math;->max(FF)F

    move-result v8

    .line 613
    .local v8, "limit":F
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_3d
    iget-object v10, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/List;

    invoke-interface {v10}, Ljava/util/List;->size()I

    move-result v10

    if-ge v9, v10, :cond_7b

    iget-object v10, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/List;

    invoke-interface {v10}, Ljava/util/List;->size()I

    move-result v10

    if-gt v10, v1, :cond_4e

    .end local v4    # "totalModuleSize":F
    .end local v5    # "square":F
    .end local v6    # "average":F
    .end local v7    # "stdDev":F
    .end local v8    # "limit":F
    .end local v9    # "i":I
    goto :goto_7b

    .line 614
    .restart local v4    # "totalModuleSize":F
    .restart local v5    # "square":F
    .restart local v6    # "average":F
    .restart local v7    # "stdDev":F
    .restart local v8    # "limit":F
    .restart local v9    # "i":I
    :cond_4e
    iget-object v10, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/List;

    invoke-interface {v10, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/google/zxing/qrcode/detector/FinderPattern;

    .line 615
    .local v10, "pattern":Lcom/google/zxing/qrcode/detector/FinderPattern;
    invoke-virtual {v10}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getEstimatedModuleSize()F

    move-result v11

    sub-float/2addr v11, v6

    invoke-static {v11}, Ljava/lang/Math;->abs(F)F

    move-result v11

    cmpl-float v11, v11, v8

    if-lez v11, :cond_6a

    .line 616
    iget-object v11, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/List;

    invoke-interface {v11, v9}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 617
    add-int/lit8 v9, v9, -0x1

    .line 613
    .end local v10    # "pattern":Lcom/google/zxing/qrcode/detector/FinderPattern;
    :cond_6a
    add-int/2addr v9, v3

    goto :goto_3d

    .line 601
    .end local v6    # "average":F
    .end local v7    # "stdDev":F
    .end local v8    # "limit":F
    .end local v9    # "i":I
    :cond_6c
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/google/zxing/qrcode/detector/FinderPattern;

    .line 602
    .local v7, "center":Lcom/google/zxing/qrcode/detector/FinderPattern;
    invoke-virtual {v7}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getEstimatedModuleSize()F

    move-result v8

    .line 603
    .local v8, "size":F
    add-float/2addr v4, v8

    .line 604
    mul-float v9, v8, v8

    add-float/2addr v5, v9

    .end local v7    # "center":Lcom/google/zxing/qrcode/detector/FinderPattern;
    .end local v8    # "size":F
    goto :goto_15

    .line 622
    .end local v4    # "totalModuleSize":F
    .end local v5    # "square":F
    :cond_7b
    :goto_7b
    iget-object v4, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    if-le v4, v1, :cond_bf

    .line 625
    const/4 v4, 0x0

    .line 626
    .restart local v4    # "totalModuleSize":F
    iget-object v5, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_8a
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-nez v6, :cond_b3

    .line 630
    iget-object v5, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    int-to-float v5, v5

    div-float v5, v4, v5

    .line 632
    .local v5, "average":F
    iget-object v6, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/List;

    new-instance v7, Lcom/google/zxing/qrcode/detector/FinderPatternFinder$CenterComparator;

    invoke-direct {v7, v5, v2}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder$CenterComparator;-><init>(FLcom/google/zxing/qrcode/detector/FinderPatternFinder$CenterComparator;)V

    invoke-static {v6, v7}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 634
    iget-object v2, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/List;

    iget-object v6, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v6

    invoke-interface {v2, v1, v6}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->clear()V

    .end local v4    # "totalModuleSize":F
    .end local v5    # "average":F
    goto :goto_bf

    .line 626
    .restart local v4    # "totalModuleSize":F
    :cond_b3
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/google/zxing/qrcode/detector/FinderPattern;

    .line 627
    .local v6, "possibleCenter":Lcom/google/zxing/qrcode/detector/FinderPattern;
    invoke-virtual {v6}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getEstimatedModuleSize()F

    move-result v7

    add-float/2addr v4, v7

    .end local v6    # "possibleCenter":Lcom/google/zxing/qrcode/detector/FinderPattern;
    goto :goto_8a

    .line 637
    .end local v4    # "totalModuleSize":F
    :cond_bf
    :goto_bf
    new-array v1, v1, [Lcom/google/zxing/qrcode/detector/FinderPattern;

    .line 638
    iget-object v2, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/List;

    const/4 v4, 0x0

    invoke-interface {v2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/zxing/qrcode/detector/FinderPattern;

    aput-object v2, v1, v4

    .line 639
    iget-object v2, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/List;

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/zxing/qrcode/detector/FinderPattern;

    aput-object v2, v1, v3

    .line 640
    iget-object v2, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/List;

    const/4 v3, 0x2

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/zxing/qrcode/detector/FinderPattern;

    aput-object v2, v1, v3

    .line 637
    return-object v1

    .line 593
    :cond_e2
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v1

    throw v1
.end method


# virtual methods
.method final find(Ljava/util/Map;)Lcom/google/zxing/qrcode/detector/FinderPatternInfo;
    .registers 22
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Lcom/google/zxing/DecodeHintType;",
            "*>;)",
            "Lcom/google/zxing/qrcode/detector/FinderPatternInfo;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .local p1, "hints":Ljava/util/Map;, "Ljava/util/Map<Lcom/google/zxing/DecodeHintType;*>;"
    move-object/from16 v0, p0

    .line 77
    move-object/from16 v1, p1

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eqz v1, :cond_12

    sget-object v4, Lcom/google/zxing/DecodeHintType;->TRY_HARDER:Lcom/google/zxing/DecodeHintType;

    invoke-interface {v1, v4}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_12

    move v4, v3

    goto :goto_13

    :cond_12
    move v4, v2

    .line 78
    .local v4, "tryHarder":Z
    :goto_13
    if-eqz v1, :cond_1f

    sget-object v5, Lcom/google/zxing/DecodeHintType;->PURE_BARCODE:Lcom/google/zxing/DecodeHintType;

    invoke-interface {v1, v5}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1f

    move v5, v3

    goto :goto_20

    :cond_1f
    move v5, v2

    .line 79
    .local v5, "pureBarcode":Z
    :goto_20
    iget-object v6, v0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->image:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v6}, Lcom/google/zxing/common/BitMatrix;->getHeight()I

    move-result v6

    .line 80
    .local v6, "maxI":I
    iget-object v7, v0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->image:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v7}, Lcom/google/zxing/common/BitMatrix;->getWidth()I

    move-result v7

    .line 88
    .local v7, "maxJ":I
    const/4 v8, 0x3

    mul-int v9, v8, v6

    div-int/lit16 v9, v9, 0xe4

    .line 89
    .local v9, "iSkip":I
    if-lt v9, v8, :cond_35

    if-eqz v4, :cond_36

    .line 90
    :cond_35
    const/4 v9, 0x3

    .line 93
    :cond_36
    const/4 v10, 0x0

    .line 94
    .local v10, "done":Z
    const/4 v11, 0x5

    new-array v11, v11, [I

    .line 95
    .local v11, "stateCount":[I
    add-int/lit8 v12, v9, -0x1

    .local v12, "i":I
    :goto_3c
    if-ge v12, v6, :cond_124

    if-eqz v10, :cond_42

    .end local v12    # "i":I
    goto/16 :goto_124

    .line 97
    .restart local v12    # "i":I
    :cond_42
    aput v2, v11, v2

    .line 98
    aput v2, v11, v3

    .line 99
    const/4 v13, 0x2

    aput v2, v11, v13

    .line 100
    aput v2, v11, v8

    .line 101
    const/4 v14, 0x4

    aput v2, v11, v14

    .line 102
    const/4 v15, 0x0

    .line 103
    .local v15, "currentState":I
    const/16 v16, 0x0

    .local v16, "j":I
    move/from16 v19, v10

    move v10, v9

    move/from16 v9, v16

    move/from16 v16, v19

    .local v9, "j":I
    .local v10, "iSkip":I
    .local v16, "done":Z
    :goto_58
    if-lt v9, v7, :cond_7b

    .line 168
    .end local v9    # "j":I
    invoke-static {v11}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->foundPatternCross([I)Z

    move-result v9

    if-eqz v9, :cond_76

    .line 169
    invoke-virtual {v0, v11, v12, v7, v5}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->handlePossibleCenter([IIIZ)Z

    move-result v9

    .line 170
    .local v9, "confirmed":Z
    if-eqz v9, :cond_76

    .line 171
    aget v10, v11, v2

    .line 172
    iget-boolean v13, v0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->hasSkipped:Z

    if-eqz v13, :cond_76

    .line 174
    invoke-direct/range {p0 .. p0}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->haveMultiplyConfirmedCenters()Z

    move-result v9

    .line 95
    .end local v15    # "currentState":I
    .end local v16    # "done":Z
    .local v9, "done":Z
    move/from16 v19, v10

    move v10, v9

    move/from16 v9, v19

    goto :goto_79

    .end local v9    # "done":Z
    .restart local v16    # "done":Z
    :cond_76
    move v9, v10

    move/from16 v10, v16

    .end local v16    # "done":Z
    .local v9, "iSkip":I
    .local v10, "done":Z
    :goto_79
    add-int/2addr v12, v9

    goto :goto_3c

    .line 104
    .local v9, "j":I
    .local v10, "iSkip":I
    .restart local v15    # "currentState":I
    .restart local v16    # "done":Z
    :cond_7b
    iget-object v8, v0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->image:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v8, v9, v12}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v8

    if-eqz v8, :cond_94

    .line 106
    and-int/lit8 v8, v15, 0x1

    if-ne v8, v3, :cond_89

    .line 107
    add-int/lit8 v15, v15, 0x1

    .line 109
    :cond_89
    aget v8, v11, v15

    add-int/2addr v8, v3

    aput v8, v11, v15

    .line 110
    nop

    .line 103
    move v8, v3

    move v3, v14

    const/4 v14, 0x3

    goto/16 :goto_11b

    .line 111
    :cond_94
    and-int/lit8 v8, v15, 0x1

    if-nez v8, :cond_112

    .line 112
    if-ne v15, v14, :cond_106

    .line 113
    invoke-static {v11}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->foundPatternCross([I)Z

    move-result v8

    if-eqz v8, :cond_f1

    .line 114
    invoke-virtual {v0, v11, v12, v9, v5}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->handlePossibleCenter([IIIZ)Z

    move-result v8

    .line 115
    .local v8, "confirmed":Z
    if-eqz v8, :cond_d6

    .line 118
    const/4 v10, 0x2

    .line 119
    iget-boolean v14, v0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->hasSkipped:Z

    if-eqz v14, :cond_b0

    .line 120
    invoke-direct/range {p0 .. p0}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->haveMultiplyConfirmedCenters()Z

    move-result v16

    .line 121
    goto :goto_c2

    .line 122
    :cond_b0
    invoke-direct/range {p0 .. p0}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->findRowSkip()I

    move-result v14

    .line 123
    .local v14, "rowSkip":I
    aget v3, v11, v13

    if-le v14, v3, :cond_c2

    .line 132
    aget v3, v11, v13

    sub-int v3, v14, v3

    sub-int/2addr v3, v10

    add-int/2addr v12, v3

    .line 133
    add-int/lit8 v3, v7, -0x1

    .line 136
    .end local v9    # "j":I
    .end local v14    # "rowSkip":I
    .local v3, "j":I
    nop

    .line 146
    move v9, v3

    .end local v3    # "j":I
    .restart local v9    # "j":I
    :cond_c2
    :goto_c2
    const/4 v3, 0x0

    .line 147
    .end local v15    # "currentState":I
    .local v3, "currentState":I
    aput v2, v11, v2

    .line 148
    const/4 v14, 0x1

    aput v2, v11, v14

    .line 149
    aput v2, v11, v13

    .line 150
    const/4 v14, 0x3

    aput v2, v11, v14

    .line 151
    const/16 v17, 0x4

    aput v2, v11, v17

    .line 152
    .end local v8    # "confirmed":Z
    nop

    .line 103
    move v15, v3

    move/from16 v3, v17

    goto :goto_ef

    .line 137
    .end local v3    # "currentState":I
    .restart local v8    # "confirmed":Z
    .restart local v15    # "currentState":I
    :cond_d6
    move/from16 v17, v14

    const/4 v14, 0x3

    aget v3, v11, v13

    aput v3, v11, v2

    .line 138
    aget v3, v11, v14

    const/16 v18, 0x1

    aput v3, v11, v18

    .line 139
    aget v3, v11, v17

    aput v3, v11, v13

    .line 140
    aput v18, v11, v14

    .line 141
    aput v2, v11, v17

    .line 142
    const/4 v3, 0x3

    .line 143
    .end local v15    # "currentState":I
    .restart local v3    # "currentState":I
    nop

    .line 103
    move v15, v3

    const/4 v3, 0x4

    .end local v3    # "currentState":I
    .end local v8    # "confirmed":Z
    .restart local v15    # "currentState":I
    :goto_ef
    const/4 v8, 0x1

    goto :goto_11b

    .line 153
    :cond_f1
    const/4 v14, 0x3

    aget v3, v11, v13

    aput v3, v11, v2

    .line 154
    aget v3, v11, v14

    const/4 v8, 0x1

    aput v3, v11, v8

    .line 155
    const/4 v3, 0x4

    aget v17, v11, v3

    aput v17, v11, v13

    .line 156
    aput v8, v11, v14

    .line 157
    aput v2, v11, v3

    .line 158
    const/4 v15, 0x3

    .line 160
    goto :goto_11b

    .line 161
    :cond_106
    move v8, v3

    move v3, v14

    const/4 v14, 0x3

    add-int/lit8 v15, v15, 0x1

    aget v17, v11, v15

    add-int/lit8 v17, v17, 0x1

    aput v17, v11, v15

    .line 163
    goto :goto_11b

    .line 164
    :cond_112
    move v8, v3

    move v3, v14

    const/4 v14, 0x3

    aget v17, v11, v15

    add-int/lit8 v17, v17, 0x1

    aput v17, v11, v15

    .line 103
    :goto_11b
    add-int/2addr v9, v8

    move/from16 v19, v14

    move v14, v3

    move v3, v8

    move/from16 v8, v19

    goto/16 :goto_58

    .line 180
    .end local v12    # "i":I
    .end local v15    # "currentState":I
    .end local v16    # "done":Z
    .local v9, "iSkip":I
    .local v10, "done":Z
    :cond_124
    :goto_124
    invoke-direct/range {p0 .. p0}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->selectBestPatterns()[Lcom/google/zxing/qrcode/detector/FinderPattern;

    move-result-object v2

    .line 181
    .local v2, "patternInfo":[Lcom/google/zxing/qrcode/detector/FinderPattern;
    invoke-static {v2}, Lcom/google/zxing/ResultPoint;->orderBestPatterns([Lcom/google/zxing/ResultPoint;)V

    .line 183
    new-instance v3, Lcom/google/zxing/qrcode/detector/FinderPatternInfo;

    invoke-direct {v3, v2}, Lcom/google/zxing/qrcode/detector/FinderPatternInfo;-><init>([Lcom/google/zxing/qrcode/detector/FinderPattern;)V

    return-object v3
.end method

.method protected final getImage()Lcom/google/zxing/common/BitMatrix;
    .registers 2

    .line 69
    iget-object v0, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->image:Lcom/google/zxing/common/BitMatrix;

    return-object v0
.end method

.method protected final getPossibleCenters()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/google/zxing/qrcode/detector/FinderPattern;",
            ">;"
        }
    .end annotation

    .line 73
    iget-object v0, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/List;

    return-object v0
.end method

.method protected final handlePossibleCenter([IIIZ)Z
    .registers 15
    .param p1, "stateCount"    # [I
    .param p2, "i"    # I
    .param p3, "j"    # I
    .param p4, "pureBarcode"    # Z

    .line 488
    const/4 v0, 0x0

    aget v1, p1, v0

    const/4 v2, 0x1

    aget v3, p1, v2

    add-int/2addr v1, v3

    const/4 v3, 0x2

    aget v4, p1, v3

    add-int/2addr v1, v4

    const/4 v4, 0x3

    aget v4, p1, v4

    add-int/2addr v1, v4

    .line 489
    const/4 v4, 0x4

    aget v4, p1, v4

    .line 488
    add-int/2addr v1, v4

    .line 490
    .local v1, "stateCountTotal":I
    invoke-static {p1, p3}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->centerFromEnd([II)F

    move-result v4

    .line 491
    .local v4, "centerJ":F
    float-to-int v5, v4

    aget v6, p1, v3

    invoke-direct {p0, p2, v5, v6, v1}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->crossCheckVertical(IIII)F

    move-result v5

    .line 492
    .local v5, "centerI":F
    invoke-static {v5}, Ljava/lang/Float;->isNaN(F)Z

    move-result v6

    if-nez v6, :cond_80

    .line 494
    float-to-int v6, v4

    float-to-int v7, v5

    aget v8, p1, v3

    invoke-direct {p0, v6, v7, v8, v1}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->crossCheckHorizontal(IIII)F

    move-result v4

    .line 495
    invoke-static {v4}, Ljava/lang/Float;->isNaN(F)Z

    move-result v6

    if-nez v6, :cond_80

    .line 496
    if-eqz p4, :cond_3e

    float-to-int v6, v5

    float-to-int v7, v4

    aget v3, p1, v3

    invoke-direct {p0, v6, v7, v3, v1}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->crossCheckDiagonal(IIII)Z

    move-result v3

    if-eqz v3, :cond_80

    .line 497
    :cond_3e
    int-to-float v0, v1

    const/high16 v3, 0x40e00000    # 7.0f

    div-float v3, v0, v3

    .line 498
    .local v3, "estimatedModuleSize":F
    const/4 v6, 0x0

    .line 499
    .local v6, "found":Z
    const/4 v0, 0x0

    .local v0, "index":I
    :goto_45
    iget-object v7, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/List;

    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v7

    if-lt v0, v7, :cond_4e

    .end local v0    # "index":I
    goto :goto_67

    .line 500
    .restart local v0    # "index":I
    :cond_4e
    iget-object v7, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/List;

    invoke-interface {v7, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/google/zxing/qrcode/detector/FinderPattern;

    .line 502
    .local v7, "center":Lcom/google/zxing/qrcode/detector/FinderPattern;
    invoke-virtual {v7, v3, v5, v4}, Lcom/google/zxing/qrcode/detector/FinderPattern;->aboutEquals(FFF)Z

    move-result v8

    if-eqz v8, :cond_7d

    .line 503
    iget-object v8, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/List;

    invoke-virtual {v7, v5, v4, v3}, Lcom/google/zxing/qrcode/detector/FinderPattern;->combineEstimate(FFF)Lcom/google/zxing/qrcode/detector/FinderPattern;

    move-result-object v9

    invoke-interface {v8, v0, v9}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 504
    const/4 v6, 0x1

    .line 505
    nop

    .line 508
    .end local v0    # "index":I
    .end local v7    # "center":Lcom/google/zxing/qrcode/detector/FinderPattern;
    :goto_67
    if-nez v6, :cond_7c

    .line 509
    new-instance v0, Lcom/google/zxing/qrcode/detector/FinderPattern;

    invoke-direct {v0, v4, v5, v3}, Lcom/google/zxing/qrcode/detector/FinderPattern;-><init>(FFF)V

    .line 510
    .local v0, "point":Lcom/google/zxing/qrcode/detector/FinderPattern;
    iget-object v7, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/List;

    invoke-interface {v7, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 511
    iget-object v7, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->resultPointCallback:Lcom/google/zxing/ResultPointCallback;

    if-eqz v7, :cond_7c

    .line 512
    iget-object v7, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->resultPointCallback:Lcom/google/zxing/ResultPointCallback;

    invoke-interface {v7, v0}, Lcom/google/zxing/ResultPointCallback;->foundPossibleResultPoint(Lcom/google/zxing/ResultPoint;)V

    .line 515
    .end local v0    # "point":Lcom/google/zxing/qrcode/detector/FinderPattern;
    :cond_7c
    return v2

    .line 499
    .local v0, "index":I
    :cond_7d
    add-int/lit8 v0, v0, 0x1

    goto :goto_45

    .line 518
    .end local v0    # "index":I
    .end local v3    # "estimatedModuleSize":F
    .end local v6    # "found":Z
    :cond_80
    return v0
.end method
