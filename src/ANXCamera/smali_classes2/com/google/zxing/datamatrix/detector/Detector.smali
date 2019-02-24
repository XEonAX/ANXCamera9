.class public final Lcom/google/zxing/datamatrix/detector/Detector;
.super Ljava/lang/Object;
.source "Detector.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/zxing/datamatrix/detector/Detector$ResultPointsAndTransitions;,
        Lcom/google/zxing/datamatrix/detector/Detector$ResultPointsAndTransitionsComparator;
    }
.end annotation


# instance fields
.field private final image:Lcom/google/zxing/common/BitMatrix;

.field private final rectangleDetector:Lcom/google/zxing/common/detector/WhiteRectangleDetector;


# direct methods
.method public constructor <init>(Lcom/google/zxing/common/BitMatrix;)V
    .registers 3
    .param p1, "image"    # Lcom/google/zxing/common/BitMatrix;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    iput-object p1, p0, Lcom/google/zxing/datamatrix/detector/Detector;->image:Lcom/google/zxing/common/BitMatrix;

    .line 48
    new-instance v0, Lcom/google/zxing/common/detector/WhiteRectangleDetector;

    invoke-direct {v0, p1}, Lcom/google/zxing/common/detector/WhiteRectangleDetector;-><init>(Lcom/google/zxing/common/BitMatrix;)V

    iput-object v0, p0, Lcom/google/zxing/datamatrix/detector/Detector;->rectangleDetector:Lcom/google/zxing/common/detector/WhiteRectangleDetector;

    .line 49
    return-void
.end method

.method private correctTopRight(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;I)Lcom/google/zxing/ResultPoint;
    .registers 15
    .param p1, "bottomLeft"    # Lcom/google/zxing/ResultPoint;
    .param p2, "bottomRight"    # Lcom/google/zxing/ResultPoint;
    .param p3, "topLeft"    # Lcom/google/zxing/ResultPoint;
    .param p4, "topRight"    # Lcom/google/zxing/ResultPoint;
    .param p5, "dimension"    # I

    .line 273
    invoke-static {p1, p2}, Lcom/google/zxing/datamatrix/detector/Detector;->distance(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)I

    move-result v0

    int-to-float v0, v0

    int-to-float v1, p5

    div-float/2addr v0, v1

    .line 274
    .local v0, "corr":F
    invoke-static {p3, p4}, Lcom/google/zxing/datamatrix/detector/Detector;->distance(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)I

    move-result v1

    .line 275
    .local v1, "norm":I
    invoke-virtual {p4}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v2

    invoke-virtual {p3}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v3

    sub-float/2addr v2, v3

    int-to-float v3, v1

    div-float/2addr v2, v3

    .line 276
    .local v2, "cos":F
    invoke-virtual {p4}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v3

    invoke-virtual {p3}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v4

    sub-float/2addr v3, v4

    int-to-float v4, v1

    div-float/2addr v3, v4

    .line 278
    .local v3, "sin":F
    new-instance v4, Lcom/google/zxing/ResultPoint;

    invoke-virtual {p4}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v5

    mul-float v6, v0, v2

    add-float/2addr v5, v6

    invoke-virtual {p4}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v6

    mul-float v7, v0, v3

    add-float/2addr v6, v7

    invoke-direct {v4, v5, v6}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    .line 280
    .local v4, "c1":Lcom/google/zxing/ResultPoint;
    invoke-static {p1, p3}, Lcom/google/zxing/datamatrix/detector/Detector;->distance(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)I

    move-result v5

    int-to-float v5, v5

    int-to-float v6, p5

    div-float/2addr v5, v6

    .line 281
    .end local v0    # "corr":F
    .local v5, "corr":F
    invoke-static {p2, p4}, Lcom/google/zxing/datamatrix/detector/Detector;->distance(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)I

    move-result v0

    .line 282
    .end local v1    # "norm":I
    .local v0, "norm":I
    invoke-virtual {p4}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v1

    invoke-virtual {p2}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v6

    sub-float/2addr v1, v6

    int-to-float v6, v0

    div-float/2addr v1, v6

    .line 283
    .end local v2    # "cos":F
    .local v1, "cos":F
    invoke-virtual {p4}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v2

    invoke-virtual {p2}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v6

    sub-float/2addr v2, v6

    int-to-float v6, v0

    div-float/2addr v2, v6

    .line 285
    .end local v3    # "sin":F
    .local v2, "sin":F
    new-instance v3, Lcom/google/zxing/ResultPoint;

    invoke-virtual {p4}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v6

    mul-float v7, v5, v1

    add-float/2addr v6, v7

    invoke-virtual {p4}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v7

    mul-float v8, v5, v2

    add-float/2addr v7, v8

    invoke-direct {v3, v6, v7}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    .line 287
    .local v3, "c2":Lcom/google/zxing/ResultPoint;
    invoke-direct {p0, v4}, Lcom/google/zxing/datamatrix/detector/Detector;->isValid(Lcom/google/zxing/ResultPoint;)Z

    move-result v6

    if-nez v6, :cond_77

    .line 288
    invoke-direct {p0, v3}, Lcom/google/zxing/datamatrix/detector/Detector;->isValid(Lcom/google/zxing/ResultPoint;)Z

    move-result v6

    if-eqz v6, :cond_75

    .line 289
    return-object v3

    .line 291
    :cond_75
    const/4 v6, 0x0

    return-object v6

    .line 293
    :cond_77
    invoke-direct {p0, v3}, Lcom/google/zxing/datamatrix/detector/Detector;->isValid(Lcom/google/zxing/ResultPoint;)Z

    move-result v6

    if-nez v6, :cond_7e

    .line 294
    return-object v4

    .line 297
    :cond_7e
    invoke-direct {p0, p3, v4}, Lcom/google/zxing/datamatrix/detector/Detector;->transitionsBetween(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)Lcom/google/zxing/datamatrix/detector/Detector$ResultPointsAndTransitions;

    move-result-object v6

    invoke-virtual {v6}, Lcom/google/zxing/datamatrix/detector/Detector$ResultPointsAndTransitions;->getTransitions()I

    move-result v6

    .line 298
    invoke-direct {p0, p2, v4}, Lcom/google/zxing/datamatrix/detector/Detector;->transitionsBetween(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)Lcom/google/zxing/datamatrix/detector/Detector$ResultPointsAndTransitions;

    move-result-object v7

    invoke-virtual {v7}, Lcom/google/zxing/datamatrix/detector/Detector$ResultPointsAndTransitions;->getTransitions()I

    move-result v7

    .line 297
    sub-int/2addr v6, v7

    invoke-static {v6}, Ljava/lang/Math;->abs(I)I

    move-result v6

    .line 299
    .local v6, "l1":I
    invoke-direct {p0, p3, v3}, Lcom/google/zxing/datamatrix/detector/Detector;->transitionsBetween(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)Lcom/google/zxing/datamatrix/detector/Detector$ResultPointsAndTransitions;

    move-result-object v7

    invoke-virtual {v7}, Lcom/google/zxing/datamatrix/detector/Detector$ResultPointsAndTransitions;->getTransitions()I

    move-result v7

    .line 300
    invoke-direct {p0, p2, v3}, Lcom/google/zxing/datamatrix/detector/Detector;->transitionsBetween(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)Lcom/google/zxing/datamatrix/detector/Detector$ResultPointsAndTransitions;

    move-result-object v8

    invoke-virtual {v8}, Lcom/google/zxing/datamatrix/detector/Detector$ResultPointsAndTransitions;->getTransitions()I

    move-result v8

    .line 299
    sub-int/2addr v7, v8

    invoke-static {v7}, Ljava/lang/Math;->abs(I)I

    move-result v7

    .line 302
    .local v7, "l2":I
    if-gt v6, v7, :cond_ac

    move-object v8, v4

    goto :goto_ad

    :cond_ac
    move-object v8, v3

    :goto_ad
    return-object v8
.end method

.method private correctTopRightRectangular(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;II)Lcom/google/zxing/ResultPoint;
    .registers 16
    .param p1, "bottomLeft"    # Lcom/google/zxing/ResultPoint;
    .param p2, "bottomRight"    # Lcom/google/zxing/ResultPoint;
    .param p3, "topLeft"    # Lcom/google/zxing/ResultPoint;
    .param p4, "topRight"    # Lcom/google/zxing/ResultPoint;
    .param p5, "dimensionTop"    # I
    .param p6, "dimensionRight"    # I

    .line 227
    invoke-static {p1, p2}, Lcom/google/zxing/datamatrix/detector/Detector;->distance(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)I

    move-result v0

    int-to-float v0, v0

    int-to-float v1, p5

    div-float/2addr v0, v1

    .line 228
    .local v0, "corr":F
    invoke-static {p3, p4}, Lcom/google/zxing/datamatrix/detector/Detector;->distance(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)I

    move-result v1

    .line 229
    .local v1, "norm":I
    invoke-virtual {p4}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v2

    invoke-virtual {p3}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v3

    sub-float/2addr v2, v3

    int-to-float v3, v1

    div-float/2addr v2, v3

    .line 230
    .local v2, "cos":F
    invoke-virtual {p4}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v3

    invoke-virtual {p3}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v4

    sub-float/2addr v3, v4

    int-to-float v4, v1

    div-float/2addr v3, v4

    .line 232
    .local v3, "sin":F
    new-instance v4, Lcom/google/zxing/ResultPoint;

    invoke-virtual {p4}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v5

    mul-float v6, v0, v2

    add-float/2addr v5, v6

    invoke-virtual {p4}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v6

    mul-float v7, v0, v3

    add-float/2addr v6, v7

    invoke-direct {v4, v5, v6}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    .line 234
    .local v4, "c1":Lcom/google/zxing/ResultPoint;
    invoke-static {p1, p3}, Lcom/google/zxing/datamatrix/detector/Detector;->distance(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)I

    move-result v5

    int-to-float v5, v5

    int-to-float v6, p6

    div-float/2addr v5, v6

    .line 235
    .end local v0    # "corr":F
    .local v5, "corr":F
    invoke-static {p2, p4}, Lcom/google/zxing/datamatrix/detector/Detector;->distance(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)I

    move-result v0

    .line 236
    .end local v1    # "norm":I
    .local v0, "norm":I
    invoke-virtual {p4}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v1

    invoke-virtual {p2}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v6

    sub-float/2addr v1, v6

    int-to-float v6, v0

    div-float/2addr v1, v6

    .line 237
    .end local v2    # "cos":F
    .local v1, "cos":F
    invoke-virtual {p4}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v2

    invoke-virtual {p2}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v6

    sub-float/2addr v2, v6

    int-to-float v6, v0

    div-float/2addr v2, v6

    .line 239
    .end local v3    # "sin":F
    .local v2, "sin":F
    new-instance v3, Lcom/google/zxing/ResultPoint;

    invoke-virtual {p4}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v6

    mul-float v7, v5, v1

    add-float/2addr v6, v7

    invoke-virtual {p4}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v7

    mul-float v8, v5, v2

    add-float/2addr v7, v8

    invoke-direct {v3, v6, v7}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    .line 241
    .local v3, "c2":Lcom/google/zxing/ResultPoint;
    invoke-direct {p0, v4}, Lcom/google/zxing/datamatrix/detector/Detector;->isValid(Lcom/google/zxing/ResultPoint;)Z

    move-result v6

    if-nez v6, :cond_77

    .line 242
    invoke-direct {p0, v3}, Lcom/google/zxing/datamatrix/detector/Detector;->isValid(Lcom/google/zxing/ResultPoint;)Z

    move-result v6

    if-eqz v6, :cond_75

    .line 243
    return-object v3

    .line 245
    :cond_75
    const/4 v6, 0x0

    return-object v6

    .line 247
    :cond_77
    invoke-direct {p0, v3}, Lcom/google/zxing/datamatrix/detector/Detector;->isValid(Lcom/google/zxing/ResultPoint;)Z

    move-result v6

    if-nez v6, :cond_7e

    .line 248
    return-object v4

    .line 251
    :cond_7e
    invoke-direct {p0, p3, v4}, Lcom/google/zxing/datamatrix/detector/Detector;->transitionsBetween(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)Lcom/google/zxing/datamatrix/detector/Detector$ResultPointsAndTransitions;

    move-result-object v6

    invoke-virtual {v6}, Lcom/google/zxing/datamatrix/detector/Detector$ResultPointsAndTransitions;->getTransitions()I

    move-result v6

    sub-int v6, p5, v6

    invoke-static {v6}, Ljava/lang/Math;->abs(I)I

    move-result v6

    .line 252
    invoke-direct {p0, p2, v4}, Lcom/google/zxing/datamatrix/detector/Detector;->transitionsBetween(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)Lcom/google/zxing/datamatrix/detector/Detector$ResultPointsAndTransitions;

    move-result-object v7

    invoke-virtual {v7}, Lcom/google/zxing/datamatrix/detector/Detector$ResultPointsAndTransitions;->getTransitions()I

    move-result v7

    sub-int v7, p6, v7

    invoke-static {v7}, Ljava/lang/Math;->abs(I)I

    move-result v7

    .line 251
    add-int/2addr v6, v7

    .line 253
    .local v6, "l1":I
    invoke-direct {p0, p3, v3}, Lcom/google/zxing/datamatrix/detector/Detector;->transitionsBetween(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)Lcom/google/zxing/datamatrix/detector/Detector$ResultPointsAndTransitions;

    move-result-object v7

    invoke-virtual {v7}, Lcom/google/zxing/datamatrix/detector/Detector$ResultPointsAndTransitions;->getTransitions()I

    move-result v7

    sub-int v7, p5, v7

    invoke-static {v7}, Ljava/lang/Math;->abs(I)I

    move-result v7

    .line 254
    invoke-direct {p0, p2, v3}, Lcom/google/zxing/datamatrix/detector/Detector;->transitionsBetween(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)Lcom/google/zxing/datamatrix/detector/Detector$ResultPointsAndTransitions;

    move-result-object v8

    invoke-virtual {v8}, Lcom/google/zxing/datamatrix/detector/Detector$ResultPointsAndTransitions;->getTransitions()I

    move-result v8

    sub-int v8, p6, v8

    invoke-static {v8}, Ljava/lang/Math;->abs(I)I

    move-result v8

    .line 253
    add-int/2addr v7, v8

    .line 256
    .local v7, "l2":I
    if-gt v6, v7, :cond_bb

    .line 257
    return-object v4

    .line 260
    :cond_bb
    return-object v3
.end method

.method private static distance(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)I
    .registers 3
    .param p0, "a"    # Lcom/google/zxing/ResultPoint;
    .param p1, "b"    # Lcom/google/zxing/ResultPoint;

    .line 310
    invoke-static {p0, p1}, Lcom/google/zxing/ResultPoint;->distance(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)F

    move-result v0

    invoke-static {v0}, Lcom/google/zxing/common/detector/MathUtils;->round(F)I

    move-result v0

    return v0
.end method

.method private static increment(Ljava/util/Map;Lcom/google/zxing/ResultPoint;)V
    .registers 5
    .param p1, "key"    # Lcom/google/zxing/ResultPoint;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Lcom/google/zxing/ResultPoint;",
            "Ljava/lang/Integer;",
            ">;",
            "Lcom/google/zxing/ResultPoint;",
            ")V"
        }
    .end annotation

    .line 317
    .local p0, "table":Ljava/util/Map;, "Ljava/util/Map<Lcom/google/zxing/ResultPoint;Ljava/lang/Integer;>;"
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 318
    .local v0, "value":Ljava/lang/Integer;
    const/4 v1, 0x1

    if-nez v0, :cond_a

    goto :goto_f

    :cond_a
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    add-int/2addr v1, v2

    :goto_f
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {p0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 319
    return-void
.end method

.method private isValid(Lcom/google/zxing/ResultPoint;)Z
    .registers 5
    .param p1, "p"    # Lcom/google/zxing/ResultPoint;

    .line 306
    invoke-virtual {p1}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v0

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-ltz v0, :cond_31

    invoke-virtual {p1}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v0

    iget-object v2, p0, Lcom/google/zxing/datamatrix/detector/Detector;->image:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v2}, Lcom/google/zxing/common/BitMatrix;->getWidth()I

    move-result v2

    int-to-float v2, v2

    cmpg-float v0, v0, v2

    if-gez v0, :cond_31

    invoke-virtual {p1}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v0

    cmpl-float v0, v0, v1

    if-lez v0, :cond_31

    invoke-virtual {p1}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v0

    iget-object v1, p0, Lcom/google/zxing/datamatrix/detector/Detector;->image:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v1}, Lcom/google/zxing/common/BitMatrix;->getHeight()I

    move-result v1

    int-to-float v1, v1

    cmpg-float v0, v0, v1

    if-gez v0, :cond_31

    const/4 v0, 0x1

    return v0

    :cond_31
    const/4 v0, 0x0

    return v0
.end method

.method private static sampleGrid(Lcom/google/zxing/common/BitMatrix;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;II)Lcom/google/zxing/common/BitMatrix;
    .registers 30
    .param p0, "image"    # Lcom/google/zxing/common/BitMatrix;
    .param p1, "topLeft"    # Lcom/google/zxing/ResultPoint;
    .param p2, "bottomLeft"    # Lcom/google/zxing/ResultPoint;
    .param p3, "bottomRight"    # Lcom/google/zxing/ResultPoint;
    .param p4, "topRight"    # Lcom/google/zxing/ResultPoint;
    .param p5, "dimensionX"    # I
    .param p6, "dimensionY"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    move/from16 v15, p5

    .line 329
    move/from16 v14, p6

    invoke-static {}, Lcom/google/zxing/common/GridSampler;->getInstance()Lcom/google/zxing/common/GridSampler;

    move-result-object v20

    .line 331
    .local v20, "sampler":Lcom/google/zxing/common/GridSampler;
    nop

    .line 332
    nop

    .line 333
    nop

    .line 334
    nop

    .line 335
    nop

    .line 336
    int-to-float v0, v15

    const/high16 v1, 0x3f000000    # 0.5f

    sub-float v6, v0, v1

    .line 337
    nop

    .line 338
    int-to-float v0, v15

    sub-float v8, v0, v1

    .line 339
    int-to-float v0, v14

    sub-float v9, v0, v1

    .line 340
    nop

    .line 341
    int-to-float v0, v14

    sub-float v11, v0, v1

    .line 342
    invoke-virtual/range {p1 .. p1}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v12

    .line 343
    invoke-virtual/range {p1 .. p1}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v13

    .line 344
    invoke-virtual/range {p4 .. p4}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v16

    .line 345
    invoke-virtual/range {p4 .. p4}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v17

    .line 346
    invoke-virtual/range {p3 .. p3}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v18

    .line 347
    invoke-virtual/range {p3 .. p3}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v19

    .line 348
    invoke-virtual/range {p2 .. p2}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v21

    .line 349
    invoke-virtual/range {p2 .. p2}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v22

    .line 331
    const/high16 v4, 0x3f000000    # 0.5f

    const/high16 v5, 0x3f000000    # 0.5f

    const/high16 v7, 0x3f000000    # 0.5f

    const/high16 v10, 0x3f000000    # 0.5f

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    move v2, v15

    move v3, v14

    move/from16 v14, v16

    move/from16 v15, v17

    move/from16 v16, v18

    move/from16 v17, v19

    move/from16 v18, v21

    move/from16 v19, v22

    invoke-virtual/range {v0 .. v19}, Lcom/google/zxing/common/GridSampler;->sampleGrid(Lcom/google/zxing/common/BitMatrix;IIFFFFFFFFFFFFFFFF)Lcom/google/zxing/common/BitMatrix;

    move-result-object v0

    return-object v0
.end method

.method private transitionsBetween(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)Lcom/google/zxing/datamatrix/detector/Detector$ResultPointsAndTransitions;
    .registers 20
    .param p1, "from"    # Lcom/google/zxing/ResultPoint;
    .param p2, "to"    # Lcom/google/zxing/ResultPoint;

    move-object/from16 v0, p0

    .line 357
    invoke-virtual/range {p1 .. p1}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v1

    float-to-int v1, v1

    .line 358
    .local v1, "fromX":I
    invoke-virtual/range {p1 .. p1}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v2

    float-to-int v2, v2

    .line 359
    .local v2, "fromY":I
    invoke-virtual/range {p2 .. p2}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v3

    float-to-int v3, v3

    .line 360
    .local v3, "toX":I
    invoke-virtual/range {p2 .. p2}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v4

    float-to-int v4, v4

    .line 361
    .local v4, "toY":I
    sub-int v5, v4, v2

    invoke-static {v5}, Ljava/lang/Math;->abs(I)I

    move-result v5

    sub-int v6, v3, v1

    invoke-static {v6}, Ljava/lang/Math;->abs(I)I

    move-result v6

    const/4 v7, 0x1

    if-le v5, v6, :cond_27

    move v5, v7

    goto :goto_28

    :cond_27
    const/4 v5, 0x0

    .line 362
    .local v5, "steep":Z
    :goto_28
    if-eqz v5, :cond_30

    .line 363
    move v6, v1

    .line 364
    .local v6, "temp":I
    move v1, v2

    .line 365
    move v2, v6

    .line 366
    move v6, v3

    .line 367
    move v3, v4

    .line 368
    move v4, v6

    .line 371
    .end local v6    # "temp":I
    :cond_30
    sub-int v6, v3, v1

    invoke-static {v6}, Ljava/lang/Math;->abs(I)I

    move-result v6

    .line 372
    .local v6, "dx":I
    sub-int v8, v4, v2

    invoke-static {v8}, Ljava/lang/Math;->abs(I)I

    move-result v8

    .line 373
    .local v8, "dy":I
    neg-int v9, v6

    div-int/lit8 v9, v9, 0x2

    .line 374
    .local v9, "error":I
    const/4 v10, -0x1

    if-ge v2, v4, :cond_44

    move v11, v7

    goto :goto_45

    :cond_44
    move v11, v10

    .line 375
    .local v11, "ystep":I
    :goto_45
    if-ge v1, v3, :cond_48

    goto :goto_49

    :cond_48
    move v7, v10

    .line 376
    .local v7, "xstep":I
    :goto_49
    const/4 v10, 0x0

    .line 377
    .local v10, "transitions":I
    iget-object v12, v0, Lcom/google/zxing/datamatrix/detector/Detector;->image:Lcom/google/zxing/common/BitMatrix;

    if-eqz v5, :cond_50

    move v13, v2

    goto :goto_51

    :cond_50
    move v13, v1

    :goto_51
    if-eqz v5, :cond_55

    move v14, v1

    goto :goto_56

    :cond_55
    move v14, v2

    :goto_56
    invoke-virtual {v12, v13, v14}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v12

    .line 378
    .local v12, "inBlack":Z
    move v13, v1

    .local v13, "x":I
    move v14, v2

    .local v14, "y":I
    :goto_5c
    if-ne v13, v3, :cond_61

    .line 393
    .end local v13    # "x":I
    .end local v14    # "y":I
    move/from16 v16, v1

    goto :goto_81

    .line 379
    .restart local v13    # "x":I
    .restart local v14    # "y":I
    :cond_61
    iget-object v15, v0, Lcom/google/zxing/datamatrix/detector/Detector;->image:Lcom/google/zxing/common/BitMatrix;

    if-eqz v5, :cond_67

    move v0, v14

    goto :goto_68

    :cond_67
    move v0, v13

    :goto_68
    if-eqz v5, :cond_6e

    move/from16 v16, v1

    move v1, v13

    goto :goto_71

    :cond_6e
    move/from16 v16, v1

    move v1, v14

    .end local v1    # "fromX":I
    .local v16, "fromX":I
    :goto_71
    invoke-virtual {v15, v0, v1}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v0

    .line 380
    .local v0, "isBlack":Z
    if-eq v0, v12, :cond_7b

    .line 381
    add-int/lit8 v10, v10, 0x1

    .line 382
    move v1, v0

    .line 384
    .end local v12    # "inBlack":Z
    .local v1, "inBlack":Z
    move v12, v1

    .end local v1    # "inBlack":Z
    .restart local v12    # "inBlack":Z
    :cond_7b
    add-int/2addr v9, v8

    .line 385
    if-lez v9, :cond_91

    .line 386
    if-ne v14, v4, :cond_8c

    .line 387
    nop

    .line 393
    .end local v0    # "isBlack":Z
    .end local v13    # "x":I
    .end local v14    # "y":I
    :goto_81
    new-instance v0, Lcom/google/zxing/datamatrix/detector/Detector$ResultPointsAndTransitions;

    const/4 v1, 0x0

    move-object/from16 v15, p1

    move-object/from16 v13, p2

    invoke-direct {v0, v15, v13, v10, v1}, Lcom/google/zxing/datamatrix/detector/Detector$ResultPointsAndTransitions;-><init>(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;ILcom/google/zxing/datamatrix/detector/Detector$ResultPointsAndTransitions;)V

    return-object v0

    .line 389
    .restart local v0    # "isBlack":Z
    .restart local v13    # "x":I
    .restart local v14    # "y":I
    :cond_8c
    move-object/from16 v15, p1

    add-int/2addr v14, v11

    .line 390
    sub-int/2addr v9, v6

    .end local v0    # "isBlack":Z
    goto :goto_93

    .line 378
    :cond_91
    move-object/from16 v15, p1

    :goto_93
    add-int/2addr v13, v7

    move/from16 v1, v16

    move-object/from16 v0, p0

    goto :goto_5c
.end method


# virtual methods
.method public detect()Lcom/google/zxing/common/DetectorResult;
    .registers 36
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .line 59
    move-object/from16 v7, p0

    iget-object v0, v7, Lcom/google/zxing/datamatrix/detector/Detector;->rectangleDetector:Lcom/google/zxing/common/detector/WhiteRectangleDetector;

    invoke-virtual {v0}, Lcom/google/zxing/common/detector/WhiteRectangleDetector;->detect()[Lcom/google/zxing/ResultPoint;

    move-result-object v8

    .line 60
    .local v8, "cornerPoints":[Lcom/google/zxing/ResultPoint;
    const/4 v9, 0x0

    aget-object v10, v8, v9

    .line 61
    .local v10, "pointA":Lcom/google/zxing/ResultPoint;
    const/4 v11, 0x1

    aget-object v12, v8, v11

    .line 62
    .local v12, "pointB":Lcom/google/zxing/ResultPoint;
    const/4 v13, 0x2

    aget-object v14, v8, v13

    .line 63
    .local v14, "pointC":Lcom/google/zxing/ResultPoint;
    const/4 v15, 0x3

    aget-object v6, v8, v15

    .line 68
    .local v6, "pointD":Lcom/google/zxing/ResultPoint;
    new-instance v0, Ljava/util/ArrayList;

    const/4 v5, 0x4

    invoke-direct {v0, v5}, Ljava/util/ArrayList;-><init>(I)V

    move-object v4, v0

    .line 69
    .local v4, "transitions":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/datamatrix/detector/Detector$ResultPointsAndTransitions;>;"
    invoke-direct {v7, v10, v12}, Lcom/google/zxing/datamatrix/detector/Detector;->transitionsBetween(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)Lcom/google/zxing/datamatrix/detector/Detector$ResultPointsAndTransitions;

    move-result-object v0

    invoke-interface {v4, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 70
    invoke-direct {v7, v10, v14}, Lcom/google/zxing/datamatrix/detector/Detector;->transitionsBetween(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)Lcom/google/zxing/datamatrix/detector/Detector$ResultPointsAndTransitions;

    move-result-object v0

    invoke-interface {v4, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 71
    invoke-direct {v7, v12, v6}, Lcom/google/zxing/datamatrix/detector/Detector;->transitionsBetween(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)Lcom/google/zxing/datamatrix/detector/Detector$ResultPointsAndTransitions;

    move-result-object v0

    invoke-interface {v4, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 72
    invoke-direct {v7, v14, v6}, Lcom/google/zxing/datamatrix/detector/Detector;->transitionsBetween(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)Lcom/google/zxing/datamatrix/detector/Detector$ResultPointsAndTransitions;

    move-result-object v0

    invoke-interface {v4, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 73
    new-instance v0, Lcom/google/zxing/datamatrix/detector/Detector$ResultPointsAndTransitionsComparator;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/google/zxing/datamatrix/detector/Detector$ResultPointsAndTransitionsComparator;-><init>(Lcom/google/zxing/datamatrix/detector/Detector$ResultPointsAndTransitionsComparator;)V

    invoke-static {v4, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 77
    invoke-interface {v4, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    move-object v3, v0

    check-cast v3, Lcom/google/zxing/datamatrix/detector/Detector$ResultPointsAndTransitions;

    .line 78
    .local v3, "lSideOne":Lcom/google/zxing/datamatrix/detector/Detector$ResultPointsAndTransitions;
    invoke-interface {v4, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    move-object v2, v0

    check-cast v2, Lcom/google/zxing/datamatrix/detector/Detector$ResultPointsAndTransitions;

    .line 82
    .local v2, "lSideTwo":Lcom/google/zxing/datamatrix/detector/Detector$ResultPointsAndTransitions;
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    move-object v1, v0

    .line 83
    .local v1, "pointCount":Ljava/util/Map;, "Ljava/util/Map<Lcom/google/zxing/ResultPoint;Ljava/lang/Integer;>;"
    invoke-virtual {v3}, Lcom/google/zxing/datamatrix/detector/Detector$ResultPointsAndTransitions;->getFrom()Lcom/google/zxing/ResultPoint;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/google/zxing/datamatrix/detector/Detector;->increment(Ljava/util/Map;Lcom/google/zxing/ResultPoint;)V

    .line 84
    invoke-virtual {v3}, Lcom/google/zxing/datamatrix/detector/Detector$ResultPointsAndTransitions;->getTo()Lcom/google/zxing/ResultPoint;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/google/zxing/datamatrix/detector/Detector;->increment(Ljava/util/Map;Lcom/google/zxing/ResultPoint;)V

    .line 85
    invoke-virtual {v2}, Lcom/google/zxing/datamatrix/detector/Detector$ResultPointsAndTransitions;->getFrom()Lcom/google/zxing/ResultPoint;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/google/zxing/datamatrix/detector/Detector;->increment(Ljava/util/Map;Lcom/google/zxing/ResultPoint;)V

    .line 86
    invoke-virtual {v2}, Lcom/google/zxing/datamatrix/detector/Detector$ResultPointsAndTransitions;->getTo()Lcom/google/zxing/ResultPoint;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/google/zxing/datamatrix/detector/Detector;->increment(Ljava/util/Map;Lcom/google/zxing/ResultPoint;)V

    .line 88
    const/4 v0, 0x0

    .line 89
    .local v0, "maybeTopLeft":Lcom/google/zxing/ResultPoint;
    const/16 v16, 0x0

    .line 90
    .local v16, "bottomLeft":Lcom/google/zxing/ResultPoint;
    const/16 v17, 0x0

    .line 91
    .local v17, "maybeBottomRight":Lcom/google/zxing/ResultPoint;
    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    move-object/from16 v34, v16

    move-object/from16 v16, v0

    move-object/from16 v0, v34

    .local v0, "bottomLeft":Lcom/google/zxing/ResultPoint;
    .local v16, "maybeTopLeft":Lcom/google/zxing/ResultPoint;
    :goto_83
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v19

    if-nez v19, :cond_1ea

    .line 106
    if-eqz v16, :cond_1d9

    if-eqz v0, :cond_1d9

    if-eqz v17, :cond_1d9

    .line 111
    new-array v5, v15, [Lcom/google/zxing/ResultPoint;

    aput-object v16, v5, v9

    aput-object v0, v5, v11

    aput-object v17, v5, v13

    .line 113
    .local v5, "corners":[Lcom/google/zxing/ResultPoint;
    invoke-static {v5}, Lcom/google/zxing/ResultPoint;->orderBestPatterns([Lcom/google/zxing/ResultPoint;)V

    .line 116
    aget-object v15, v5, v9

    .line 117
    .local v15, "bottomRight":Lcom/google/zxing/ResultPoint;
    aget-object v26, v5, v11

    .line 118
    .end local v0    # "bottomLeft":Lcom/google/zxing/ResultPoint;
    .local v26, "bottomLeft":Lcom/google/zxing/ResultPoint;
    aget-object v0, v5, v13

    .line 122
    .local v0, "topLeft":Lcom/google/zxing/ResultPoint;
    invoke-interface {v1, v10}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v19

    if-nez v19, :cond_a9

    .line 123
    move-object/from16 v19, v10

    .line 124
    .local v19, "topRight":Lcom/google/zxing/ResultPoint;
    goto :goto_bd

    .end local v19    # "topRight":Lcom/google/zxing/ResultPoint;
    :cond_a9
    invoke-interface {v1, v12}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v19

    if-nez v19, :cond_b2

    .line 125
    move-object/from16 v19, v12

    .line 126
    .restart local v19    # "topRight":Lcom/google/zxing/ResultPoint;
    goto :goto_bd

    .end local v19    # "topRight":Lcom/google/zxing/ResultPoint;
    :cond_b2
    invoke-interface {v1, v14}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v19

    if-nez v19, :cond_bb

    .line 127
    move-object/from16 v19, v14

    .line 128
    .restart local v19    # "topRight":Lcom/google/zxing/ResultPoint;
    goto :goto_bd

    .line 129
    .end local v19    # "topRight":Lcom/google/zxing/ResultPoint;
    :cond_bb
    move-object/from16 v19, v6

    .restart local v19    # "topRight":Lcom/google/zxing/ResultPoint;
    :goto_bd
    move-object/from16 v27, v19

    .line 141
    .end local v19    # "topRight":Lcom/google/zxing/ResultPoint;
    .local v27, "topRight":Lcom/google/zxing/ResultPoint;
    move-object/from16 v9, v27

    invoke-direct {v7, v0, v9}, Lcom/google/zxing/datamatrix/detector/Detector;->transitionsBetween(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)Lcom/google/zxing/datamatrix/detector/Detector$ResultPointsAndTransitions;

    move-result-object v13

    .end local v27    # "topRight":Lcom/google/zxing/ResultPoint;
    .local v9, "topRight":Lcom/google/zxing/ResultPoint;
    invoke-virtual {v13}, Lcom/google/zxing/datamatrix/detector/Detector$ResultPointsAndTransitions;->getTransitions()I

    move-result v13

    .line 142
    .local v13, "dimensionTop":I
    invoke-direct {v7, v15, v9}, Lcom/google/zxing/datamatrix/detector/Detector;->transitionsBetween(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)Lcom/google/zxing/datamatrix/detector/Detector$ResultPointsAndTransitions;

    move-result-object v11

    invoke-virtual {v11}, Lcom/google/zxing/datamatrix/detector/Detector$ResultPointsAndTransitions;->getTransitions()I

    move-result v11

    .line 144
    .local v11, "dimensionRight":I
    move-object/from16 v28, v0

    and-int/lit8 v0, v13, 0x1

    .end local v0    # "topLeft":Lcom/google/zxing/ResultPoint;
    .local v28, "topLeft":Lcom/google/zxing/ResultPoint;
    move-object/from16 v29, v1

    const/4 v1, 0x1

    if-ne v0, v1, :cond_dc

    .line 146
    .end local v1    # "pointCount":Ljava/util/Map;, "Ljava/util/Map<Lcom/google/zxing/ResultPoint;Ljava/lang/Integer;>;"
    .local v29, "pointCount":Ljava/util/Map;, "Ljava/util/Map<Lcom/google/zxing/ResultPoint;Ljava/lang/Integer;>;"
    add-int/lit8 v13, v13, 0x1

    .line 148
    :cond_dc
    const/4 v0, 0x2

    add-int/2addr v13, v0

    .line 150
    and-int/lit8 v0, v11, 0x1

    if-ne v0, v1, :cond_e4

    .line 152
    add-int/lit8 v11, v11, 0x1

    .line 154
    :cond_e4
    const/4 v0, 0x2

    add-int/2addr v11, v0

    .line 162
    const/16 v18, 0x4

    mul-int v0, v18, v13

    const/4 v1, 0x7

    move-object/from16 v31, v2

    mul-int v2, v1, v11

    .end local v2    # "lSideTwo":Lcom/google/zxing/datamatrix/detector/Detector$ResultPointsAndTransitions;
    .local v31, "lSideTwo":Lcom/google/zxing/datamatrix/detector/Detector$ResultPointsAndTransitions;
    if-ge v0, v2, :cond_16c

    mul-int v0, v18, v11

    mul-int/2addr v1, v13

    if-lt v0, v1, :cond_108

    .line 166
    move-object/from16 v30, v3

    move-object/from16 v33, v8

    move/from16 v8, v18

    move-object/from16 v18, v5

    move-object/from16 v5, v28

    move-object/from16 v28, v29

    move-object/from16 v29, v31

    move-object/from16 v31, v4

    goto/16 :goto_17c

    .line 189
    :cond_108
    invoke-static {v11, v13}, Ljava/lang/Math;->min(II)I

    move-result v27

    .line 191
    .local v27, "dimension":I
    move-object/from16 v2, v28

    move-object v0, v7

    .end local v28    # "topLeft":Lcom/google/zxing/ResultPoint;
    .local v2, "topLeft":Lcom/google/zxing/ResultPoint;
    move-object/from16 v28, v29

    move-object/from16 v1, v26

    .end local v29    # "pointCount":Ljava/util/Map;, "Ljava/util/Map<Lcom/google/zxing/ResultPoint;Ljava/lang/Integer;>;"
    .local v28, "pointCount":Ljava/util/Map;, "Ljava/util/Map<Lcom/google/zxing/ResultPoint;Ljava/lang/Integer;>;"
    move-object/from16 v32, v2

    move-object/from16 v29, v31

    move-object v2, v15

    .end local v2    # "topLeft":Lcom/google/zxing/ResultPoint;
    .end local v31    # "lSideTwo":Lcom/google/zxing/datamatrix/detector/Detector$ResultPointsAndTransitions;
    .local v29, "lSideTwo":Lcom/google/zxing/datamatrix/detector/Detector$ResultPointsAndTransitions;
    .local v32, "topLeft":Lcom/google/zxing/ResultPoint;
    move-object/from16 v30, v3

    move-object/from16 v3, v32

    .end local v3    # "lSideOne":Lcom/google/zxing/datamatrix/detector/Detector$ResultPointsAndTransitions;
    .local v30, "lSideOne":Lcom/google/zxing/datamatrix/detector/Detector$ResultPointsAndTransitions;
    move-object/from16 v31, v4

    move-object v4, v9

    .end local v4    # "transitions":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/datamatrix/detector/Detector$ResultPointsAndTransitions;>;"
    .local v31, "transitions":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/datamatrix/detector/Detector$ResultPointsAndTransitions;>;"
    move-object/from16 v33, v8

    move/from16 v8, v18

    move-object/from16 v18, v5

    move/from16 v5, v27

    .end local v5    # "corners":[Lcom/google/zxing/ResultPoint;
    .end local v8    # "cornerPoints":[Lcom/google/zxing/ResultPoint;
    .local v18, "corners":[Lcom/google/zxing/ResultPoint;
    .local v33, "cornerPoints":[Lcom/google/zxing/ResultPoint;
    invoke-direct/range {v0 .. v5}, Lcom/google/zxing/datamatrix/detector/Detector;->correctTopRight(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;I)Lcom/google/zxing/ResultPoint;

    move-result-object v0

    .line 192
    .local v0, "correctedTopRight":Lcom/google/zxing/ResultPoint;
    if-nez v0, :cond_12e

    .line 193
    move-object v0, v9

    .line 197
    :cond_12e
    move-object/from16 v5, v32

    invoke-direct {v7, v5, v0}, Lcom/google/zxing/datamatrix/detector/Detector;->transitionsBetween(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)Lcom/google/zxing/datamatrix/detector/Detector$ResultPointsAndTransitions;

    move-result-object v1

    .end local v32    # "topLeft":Lcom/google/zxing/ResultPoint;
    .local v5, "topLeft":Lcom/google/zxing/ResultPoint;
    invoke-virtual {v1}, Lcom/google/zxing/datamatrix/detector/Detector$ResultPointsAndTransitions;->getTransitions()I

    move-result v1

    .line 198
    invoke-direct {v7, v15, v0}, Lcom/google/zxing/datamatrix/detector/Detector;->transitionsBetween(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)Lcom/google/zxing/datamatrix/detector/Detector$ResultPointsAndTransitions;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/zxing/datamatrix/detector/Detector$ResultPointsAndTransitions;->getTransitions()I

    move-result v2

    .line 197
    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v1

    .line 199
    .local v1, "dimensionCorrected":I
    const/4 v2, 0x1

    add-int/2addr v1, v2

    .line 200
    and-int/lit8 v3, v1, 0x1

    if-ne v3, v2, :cond_14c

    .line 201
    add-int/lit8 v1, v1, 0x1

    .line 204
    :cond_14c
    iget-object v2, v7, Lcom/google/zxing/datamatrix/detector/Detector;->image:Lcom/google/zxing/common/BitMatrix;

    .line 205
    nop

    .line 206
    nop

    .line 207
    nop

    .line 208
    nop

    .line 209
    nop

    .line 210
    nop

    .line 204
    move-object/from16 v19, v2

    move-object/from16 v20, v5

    move-object/from16 v21, v26

    move-object/from16 v22, v15

    move-object/from16 v23, v0

    move/from16 v24, v1

    move/from16 v25, v1

    invoke-static/range {v19 .. v25}, Lcom/google/zxing/datamatrix/detector/Detector;->sampleGrid(Lcom/google/zxing/common/BitMatrix;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;II)Lcom/google/zxing/common/BitMatrix;

    move-result-object v1

    .end local v1    # "dimensionCorrected":I
    .end local v27    # "dimension":I
    move-object v8, v5

    move-object/from16 v27, v6

    move v2, v11

    goto/16 :goto_1c3

    .line 166
    .end local v0    # "correctedTopRight":Lcom/google/zxing/ResultPoint;
    .end local v18    # "corners":[Lcom/google/zxing/ResultPoint;
    .end local v30    # "lSideOne":Lcom/google/zxing/datamatrix/detector/Detector$ResultPointsAndTransitions;
    .end local v33    # "cornerPoints":[Lcom/google/zxing/ResultPoint;
    .restart local v3    # "lSideOne":Lcom/google/zxing/datamatrix/detector/Detector$ResultPointsAndTransitions;
    .restart local v4    # "transitions":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/datamatrix/detector/Detector$ResultPointsAndTransitions;>;"
    .local v5, "corners":[Lcom/google/zxing/ResultPoint;
    .restart local v8    # "cornerPoints":[Lcom/google/zxing/ResultPoint;
    .local v28, "topLeft":Lcom/google/zxing/ResultPoint;
    .local v29, "pointCount":Ljava/util/Map;, "Ljava/util/Map<Lcom/google/zxing/ResultPoint;Ljava/lang/Integer;>;"
    .local v31, "lSideTwo":Lcom/google/zxing/datamatrix/detector/Detector$ResultPointsAndTransitions;
    :cond_16c
    move-object/from16 v30, v3

    move-object/from16 v33, v8

    move/from16 v8, v18

    move-object/from16 v18, v5

    move-object/from16 v5, v28

    move-object/from16 v28, v29

    move-object/from16 v29, v31

    move-object/from16 v31, v4

    .end local v3    # "lSideOne":Lcom/google/zxing/datamatrix/detector/Detector$ResultPointsAndTransitions;
    .end local v4    # "transitions":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/datamatrix/detector/Detector$ResultPointsAndTransitions;>;"
    .end local v8    # "cornerPoints":[Lcom/google/zxing/ResultPoint;
    .local v5, "topLeft":Lcom/google/zxing/ResultPoint;
    .restart local v18    # "corners":[Lcom/google/zxing/ResultPoint;
    .local v28, "pointCount":Ljava/util/Map;, "Ljava/util/Map<Lcom/google/zxing/ResultPoint;Ljava/lang/Integer;>;"
    .local v29, "lSideTwo":Lcom/google/zxing/datamatrix/detector/Detector$ResultPointsAndTransitions;
    .restart local v30    # "lSideOne":Lcom/google/zxing/datamatrix/detector/Detector$ResultPointsAndTransitions;
    .local v31, "transitions":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/datamatrix/detector/Detector$ResultPointsAndTransitions;>;"
    .restart local v33    # "cornerPoints":[Lcom/google/zxing/ResultPoint;
    :goto_17c
    move-object v0, v7

    move-object/from16 v1, v26

    move-object v2, v15

    move-object v3, v5

    move-object v4, v9

    move-object v8, v5

    move v5, v13

    .end local v5    # "topLeft":Lcom/google/zxing/ResultPoint;
    .local v8, "topLeft":Lcom/google/zxing/ResultPoint;
    move-object/from16 v27, v6

    move v6, v11

    .end local v6    # "pointD":Lcom/google/zxing/ResultPoint;
    .local v27, "pointD":Lcom/google/zxing/ResultPoint;
    invoke-direct/range {v0 .. v6}, Lcom/google/zxing/datamatrix/detector/Detector;->correctTopRightRectangular(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;II)Lcom/google/zxing/ResultPoint;

    move-result-object v0

    .line 165
    nop

    .line 167
    .restart local v0    # "correctedTopRight":Lcom/google/zxing/ResultPoint;
    if-nez v0, :cond_18f

    .line 168
    move-object v0, v9

    .line 171
    :cond_18f
    invoke-direct {v7, v8, v0}, Lcom/google/zxing/datamatrix/detector/Detector;->transitionsBetween(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)Lcom/google/zxing/datamatrix/detector/Detector$ResultPointsAndTransitions;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/zxing/datamatrix/detector/Detector$ResultPointsAndTransitions;->getTransitions()I

    move-result v1

    .line 172
    .end local v13    # "dimensionTop":I
    .local v1, "dimensionTop":I
    invoke-direct {v7, v15, v0}, Lcom/google/zxing/datamatrix/detector/Detector;->transitionsBetween(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)Lcom/google/zxing/datamatrix/detector/Detector$ResultPointsAndTransitions;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/zxing/datamatrix/detector/Detector$ResultPointsAndTransitions;->getTransitions()I

    move-result v2

    .line 174
    .end local v11    # "dimensionRight":I
    .local v2, "dimensionRight":I
    and-int/lit8 v3, v1, 0x1

    const/4 v4, 0x1

    if-ne v3, v4, :cond_1a6

    .line 176
    add-int/lit8 v1, v1, 0x1

    .line 179
    :cond_1a6
    and-int/lit8 v3, v2, 0x1

    if-ne v3, v4, :cond_1ac

    .line 181
    add-int/lit8 v2, v2, 0x1

    .line 184
    :cond_1ac
    iget-object v3, v7, Lcom/google/zxing/datamatrix/detector/Detector;->image:Lcom/google/zxing/common/BitMatrix;

    move-object/from16 v19, v3

    move-object/from16 v20, v8

    move-object/from16 v21, v26

    move-object/from16 v22, v15

    move-object/from16 v23, v0

    move/from16 v24, v1

    move/from16 v25, v2

    invoke-static/range {v19 .. v25}, Lcom/google/zxing/datamatrix/detector/Detector;->sampleGrid(Lcom/google/zxing/common/BitMatrix;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;II)Lcom/google/zxing/common/BitMatrix;

    move-result-object v3

    .line 186
    .local v3, "bits":Lcom/google/zxing/common/BitMatrix;
    nop

    .line 204
    move v13, v1

    move-object v1, v3

    .line 213
    .end local v3    # "bits":Lcom/google/zxing/common/BitMatrix;
    .local v1, "bits":Lcom/google/zxing/common/BitMatrix;
    .restart local v13    # "dimensionTop":I
    :goto_1c3
    new-instance v3, Lcom/google/zxing/common/DetectorResult;

    const/4 v4, 0x4

    new-array v4, v4, [Lcom/google/zxing/ResultPoint;

    const/4 v6, 0x0

    aput-object v8, v4, v6

    const/4 v11, 0x1

    aput-object v26, v4, v11

    const/4 v5, 0x2

    aput-object v15, v4, v5

    const/16 v19, 0x3

    aput-object v0, v4, v19

    invoke-direct {v3, v1, v4}, Lcom/google/zxing/common/DetectorResult;-><init>(Lcom/google/zxing/common/BitMatrix;[Lcom/google/zxing/ResultPoint;)V

    return-object v3

    .line 107
    .end local v9    # "topRight":Lcom/google/zxing/ResultPoint;
    .end local v13    # "dimensionTop":I
    .end local v15    # "bottomRight":Lcom/google/zxing/ResultPoint;
    .end local v18    # "corners":[Lcom/google/zxing/ResultPoint;
    .end local v26    # "bottomLeft":Lcom/google/zxing/ResultPoint;
    .end local v27    # "pointD":Lcom/google/zxing/ResultPoint;
    .end local v28    # "pointCount":Ljava/util/Map;, "Ljava/util/Map<Lcom/google/zxing/ResultPoint;Ljava/lang/Integer;>;"
    .end local v29    # "lSideTwo":Lcom/google/zxing/datamatrix/detector/Detector$ResultPointsAndTransitions;
    .end local v30    # "lSideOne":Lcom/google/zxing/datamatrix/detector/Detector$ResultPointsAndTransitions;
    .end local v31    # "transitions":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/datamatrix/detector/Detector$ResultPointsAndTransitions;>;"
    .end local v33    # "cornerPoints":[Lcom/google/zxing/ResultPoint;
    .local v0, "bottomLeft":Lcom/google/zxing/ResultPoint;
    .local v1, "pointCount":Ljava/util/Map;, "Ljava/util/Map<Lcom/google/zxing/ResultPoint;Ljava/lang/Integer;>;"
    .local v2, "lSideTwo":Lcom/google/zxing/datamatrix/detector/Detector$ResultPointsAndTransitions;
    .local v3, "lSideOne":Lcom/google/zxing/datamatrix/detector/Detector$ResultPointsAndTransitions;
    .restart local v4    # "transitions":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/datamatrix/detector/Detector$ResultPointsAndTransitions;>;"
    .restart local v6    # "pointD":Lcom/google/zxing/ResultPoint;
    .local v8, "cornerPoints":[Lcom/google/zxing/ResultPoint;
    :cond_1d9
    move-object/from16 v28, v1

    move-object/from16 v29, v2

    move-object/from16 v30, v3

    move-object/from16 v31, v4

    move-object/from16 v27, v6

    move-object/from16 v33, v8

    .end local v1    # "pointCount":Ljava/util/Map;, "Ljava/util/Map<Lcom/google/zxing/ResultPoint;Ljava/lang/Integer;>;"
    .end local v2    # "lSideTwo":Lcom/google/zxing/datamatrix/detector/Detector$ResultPointsAndTransitions;
    .end local v3    # "lSideOne":Lcom/google/zxing/datamatrix/detector/Detector$ResultPointsAndTransitions;
    .end local v4    # "transitions":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/datamatrix/detector/Detector$ResultPointsAndTransitions;>;"
    .end local v6    # "pointD":Lcom/google/zxing/ResultPoint;
    .end local v8    # "cornerPoints":[Lcom/google/zxing/ResultPoint;
    .restart local v27    # "pointD":Lcom/google/zxing/ResultPoint;
    .restart local v28    # "pointCount":Ljava/util/Map;, "Ljava/util/Map<Lcom/google/zxing/ResultPoint;Ljava/lang/Integer;>;"
    .restart local v29    # "lSideTwo":Lcom/google/zxing/datamatrix/detector/Detector$ResultPointsAndTransitions;
    .restart local v30    # "lSideOne":Lcom/google/zxing/datamatrix/detector/Detector$ResultPointsAndTransitions;
    .restart local v31    # "transitions":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/datamatrix/detector/Detector$ResultPointsAndTransitions;>;"
    .restart local v33    # "cornerPoints":[Lcom/google/zxing/ResultPoint;
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v1

    throw v1

    .line 91
    .end local v27    # "pointD":Lcom/google/zxing/ResultPoint;
    .end local v28    # "pointCount":Ljava/util/Map;, "Ljava/util/Map<Lcom/google/zxing/ResultPoint;Ljava/lang/Integer;>;"
    .end local v29    # "lSideTwo":Lcom/google/zxing/datamatrix/detector/Detector$ResultPointsAndTransitions;
    .end local v30    # "lSideOne":Lcom/google/zxing/datamatrix/detector/Detector$ResultPointsAndTransitions;
    .end local v31    # "transitions":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/datamatrix/detector/Detector$ResultPointsAndTransitions;>;"
    .end local v33    # "cornerPoints":[Lcom/google/zxing/ResultPoint;
    .restart local v1    # "pointCount":Ljava/util/Map;, "Ljava/util/Map<Lcom/google/zxing/ResultPoint;Ljava/lang/Integer;>;"
    .restart local v2    # "lSideTwo":Lcom/google/zxing/datamatrix/detector/Detector$ResultPointsAndTransitions;
    .restart local v3    # "lSideOne":Lcom/google/zxing/datamatrix/detector/Detector$ResultPointsAndTransitions;
    .restart local v4    # "transitions":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/datamatrix/detector/Detector$ResultPointsAndTransitions;>;"
    .restart local v6    # "pointD":Lcom/google/zxing/ResultPoint;
    .restart local v8    # "cornerPoints":[Lcom/google/zxing/ResultPoint;
    :cond_1ea
    move-object/from16 v28, v1

    move-object/from16 v29, v2

    move-object/from16 v30, v3

    move-object/from16 v31, v4

    move-object/from16 v27, v6

    move-object/from16 v33, v8

    move v6, v9

    move/from16 v19, v15

    const/4 v4, 0x4

    .end local v1    # "pointCount":Ljava/util/Map;, "Ljava/util/Map<Lcom/google/zxing/ResultPoint;Ljava/lang/Integer;>;"
    .end local v2    # "lSideTwo":Lcom/google/zxing/datamatrix/detector/Detector$ResultPointsAndTransitions;
    .end local v3    # "lSideOne":Lcom/google/zxing/datamatrix/detector/Detector$ResultPointsAndTransitions;
    .end local v4    # "transitions":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/datamatrix/detector/Detector$ResultPointsAndTransitions;>;"
    .end local v6    # "pointD":Lcom/google/zxing/ResultPoint;
    .end local v8    # "cornerPoints":[Lcom/google/zxing/ResultPoint;
    .restart local v27    # "pointD":Lcom/google/zxing/ResultPoint;
    .restart local v28    # "pointCount":Ljava/util/Map;, "Ljava/util/Map<Lcom/google/zxing/ResultPoint;Ljava/lang/Integer;>;"
    .restart local v29    # "lSideTwo":Lcom/google/zxing/datamatrix/detector/Detector$ResultPointsAndTransitions;
    .restart local v30    # "lSideOne":Lcom/google/zxing/datamatrix/detector/Detector$ResultPointsAndTransitions;
    .restart local v31    # "transitions":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/datamatrix/detector/Detector$ResultPointsAndTransitions;>;"
    .restart local v33    # "cornerPoints":[Lcom/google/zxing/ResultPoint;
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 92
    .local v1, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lcom/google/zxing/ResultPoint;Ljava/lang/Integer;>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/zxing/ResultPoint;

    .line 93
    .local v2, "point":Lcom/google/zxing/ResultPoint;
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    .line 94
    .local v3, "value":Ljava/lang/Integer;
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v8

    const/4 v9, 0x2

    if-ne v8, v9, :cond_227

    .line 95
    move-object v0, v2

    .line 96
    nop

    .line 91
    .end local v27    # "pointD":Lcom/google/zxing/ResultPoint;
    .end local v28    # "pointCount":Ljava/util/Map;, "Ljava/util/Map<Lcom/google/zxing/ResultPoint;Ljava/lang/Integer;>;"
    .end local v29    # "lSideTwo":Lcom/google/zxing/datamatrix/detector/Detector$ResultPointsAndTransitions;
    .end local v30    # "lSideOne":Lcom/google/zxing/datamatrix/detector/Detector$ResultPointsAndTransitions;
    .end local v31    # "transitions":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/datamatrix/detector/Detector$ResultPointsAndTransitions;>;"
    .end local v33    # "cornerPoints":[Lcom/google/zxing/ResultPoint;
    .local v1, "pointCount":Ljava/util/Map;, "Ljava/util/Map<Lcom/google/zxing/ResultPoint;Ljava/lang/Integer;>;"
    .local v2, "lSideTwo":Lcom/google/zxing/datamatrix/detector/Detector$ResultPointsAndTransitions;
    .local v3, "lSideOne":Lcom/google/zxing/datamatrix/detector/Detector$ResultPointsAndTransitions;
    .restart local v4    # "transitions":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/datamatrix/detector/Detector$ResultPointsAndTransitions;>;"
    .restart local v6    # "pointD":Lcom/google/zxing/ResultPoint;
    .restart local v8    # "cornerPoints":[Lcom/google/zxing/ResultPoint;
    :goto_215
    move v13, v9

    move/from16 v15, v19

    move-object/from16 v1, v28

    move-object/from16 v2, v29

    move-object/from16 v3, v30

    move-object/from16 v4, v31

    move-object/from16 v8, v33

    move v9, v6

    move-object/from16 v6, v27

    goto/16 :goto_83

    .line 98
    .end local v4    # "transitions":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/datamatrix/detector/Detector$ResultPointsAndTransitions;>;"
    .end local v6    # "pointD":Lcom/google/zxing/ResultPoint;
    .end local v8    # "cornerPoints":[Lcom/google/zxing/ResultPoint;
    .local v1, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lcom/google/zxing/ResultPoint;Ljava/lang/Integer;>;"
    .local v2, "point":Lcom/google/zxing/ResultPoint;
    .local v3, "value":Ljava/lang/Integer;
    .restart local v27    # "pointD":Lcom/google/zxing/ResultPoint;
    .restart local v28    # "pointCount":Ljava/util/Map;, "Ljava/util/Map<Lcom/google/zxing/ResultPoint;Ljava/lang/Integer;>;"
    .restart local v29    # "lSideTwo":Lcom/google/zxing/datamatrix/detector/Detector$ResultPointsAndTransitions;
    .restart local v30    # "lSideOne":Lcom/google/zxing/datamatrix/detector/Detector$ResultPointsAndTransitions;
    .restart local v31    # "transitions":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/datamatrix/detector/Detector$ResultPointsAndTransitions;>;"
    .restart local v33    # "cornerPoints":[Lcom/google/zxing/ResultPoint;
    :cond_227
    if-nez v16, :cond_22c

    .line 99
    move-object/from16 v16, v2

    .line 100
    goto :goto_215

    .line 101
    :cond_22c
    move-object/from16 v17, v2

    .end local v1    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lcom/google/zxing/ResultPoint;Ljava/lang/Integer;>;"
    .end local v2    # "point":Lcom/google/zxing/ResultPoint;
    .end local v3    # "value":Ljava/lang/Integer;
    goto :goto_215
.end method
