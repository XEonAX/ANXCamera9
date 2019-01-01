.class public final Lcom/google/zxing/common/detector/WhiteRectangleDetector;
.super Ljava/lang/Object;
.source "WhiteRectangleDetector.java"


# static fields
.field private static final CORR:I = 0x1

.field private static final INIT_SIZE:I = 0xa


# instance fields
.field private final downInit:I

.field private final height:I

.field private final image:Lcom/google/zxing/common/BitMatrix;

.field private final leftInit:I

.field private final rightInit:I

.field private final upInit:I

.field private final width:I


# direct methods
.method public constructor <init>(Lcom/google/zxing/common/BitMatrix;)V
    .locals 3
    .param p1, "image"    # Lcom/google/zxing/common/BitMatrix;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .line 47
    invoke-virtual {p1}, Lcom/google/zxing/common/BitMatrix;->getWidth()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    invoke-virtual {p1}, Lcom/google/zxing/common/BitMatrix;->getHeight()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    const/16 v2, 0xa

    invoke-direct {p0, p1, v2, v0, v1}, Lcom/google/zxing/common/detector/WhiteRectangleDetector;-><init>(Lcom/google/zxing/common/BitMatrix;III)V

    .line 48
    return-void
.end method

.method public constructor <init>(Lcom/google/zxing/common/BitMatrix;III)V
    .locals 3
    .param p1, "image"    # Lcom/google/zxing/common/BitMatrix;
    .param p2, "initSize"    # I
    .param p3, "x"    # I
    .param p4, "y"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 58
    iput-object p1, p0, Lcom/google/zxing/common/detector/WhiteRectangleDetector;->image:Lcom/google/zxing/common/BitMatrix;

    .line 59
    invoke-virtual {p1}, Lcom/google/zxing/common/BitMatrix;->getHeight()I

    move-result v0

    iput v0, p0, Lcom/google/zxing/common/detector/WhiteRectangleDetector;->height:I

    .line 60
    invoke-virtual {p1}, Lcom/google/zxing/common/BitMatrix;->getWidth()I

    move-result v0

    iput v0, p0, Lcom/google/zxing/common/detector/WhiteRectangleDetector;->width:I

    .line 61
    div-int/lit8 v0, p2, 0x2

    .line 62
    .local v0, "halfsize":I
    sub-int v1, p3, v0

    iput v1, p0, Lcom/google/zxing/common/detector/WhiteRectangleDetector;->leftInit:I

    .line 63
    add-int v1, p3, v0

    iput v1, p0, Lcom/google/zxing/common/detector/WhiteRectangleDetector;->rightInit:I

    .line 64
    sub-int v1, p4, v0

    iput v1, p0, Lcom/google/zxing/common/detector/WhiteRectangleDetector;->upInit:I

    .line 65
    add-int v1, p4, v0

    iput v1, p0, Lcom/google/zxing/common/detector/WhiteRectangleDetector;->downInit:I

    .line 66
    iget v1, p0, Lcom/google/zxing/common/detector/WhiteRectangleDetector;->upInit:I

    if-ltz v1, :cond_0

    iget v1, p0, Lcom/google/zxing/common/detector/WhiteRectangleDetector;->leftInit:I

    if-ltz v1, :cond_0

    iget v1, p0, Lcom/google/zxing/common/detector/WhiteRectangleDetector;->downInit:I

    iget v2, p0, Lcom/google/zxing/common/detector/WhiteRectangleDetector;->height:I

    if-ge v1, v2, :cond_0

    iget v1, p0, Lcom/google/zxing/common/detector/WhiteRectangleDetector;->rightInit:I

    iget v2, p0, Lcom/google/zxing/common/detector/WhiteRectangleDetector;->width:I

    if-ge v1, v2, :cond_0

    .line 69
    return-void

    .line 67
    :cond_0
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v1

    throw v1
.end method

.method private centerEdges(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)[Lcom/google/zxing/ResultPoint;
    .locals 17
    .param p1, "y"    # Lcom/google/zxing/ResultPoint;
    .param p2, "z"    # Lcom/google/zxing/ResultPoint;
    .param p3, "x"    # Lcom/google/zxing/ResultPoint;
    .param p4, "t"    # Lcom/google/zxing/ResultPoint;

    .line 290
    invoke-virtual/range {p1 .. p1}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v0

    .line 291
    .local v0, "yi":F
    invoke-virtual/range {p1 .. p1}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v1

    .line 292
    .local v1, "yj":F
    invoke-virtual/range {p2 .. p2}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v2

    .line 293
    .local v2, "zi":F
    invoke-virtual/range {p2 .. p2}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v3

    .line 294
    .local v3, "zj":F
    invoke-virtual/range {p3 .. p3}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v4

    .line 295
    .local v4, "xi":F
    invoke-virtual/range {p3 .. p3}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v5

    .line 296
    .local v5, "xj":F
    invoke-virtual/range {p4 .. p4}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v6

    .line 297
    .local v6, "ti":F
    invoke-virtual/range {p4 .. p4}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v7

    .line 299
    .local v7, "tj":F
    move-object/from16 v8, p0

    iget v9, v8, Lcom/google/zxing/common/detector/WhiteRectangleDetector;->width:I

    int-to-float v9, v9

    const/high16 v10, 0x40000000    # 2.0f

    div-float/2addr v9, v10

    cmpg-float v9, v0, v9

    const/4 v12, 0x1

    const/4 v13, 0x0

    const/4 v14, 0x4

    const/high16 v15, 0x3f800000    # 1.0f

    if-gez v9, :cond_0

    .line 300
    new-array v9, v14, [Lcom/google/zxing/ResultPoint;

    .line 301
    new-instance v14, Lcom/google/zxing/ResultPoint;

    sub-float v10, v6, v15

    add-float v11, v7, v15

    invoke-direct {v14, v10, v11}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    aput-object v14, v9, v13

    .line 302
    new-instance v10, Lcom/google/zxing/ResultPoint;

    add-float v11, v2, v15

    add-float v13, v3, v15

    invoke-direct {v10, v11, v13}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    aput-object v10, v9, v12

    .line 303
    new-instance v10, Lcom/google/zxing/ResultPoint;

    sub-float v11, v4, v15

    sub-float v12, v5, v15

    invoke-direct {v10, v11, v12}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    const/4 v11, 0x2

    aput-object v10, v9, v11

    .line 304
    new-instance v10, Lcom/google/zxing/ResultPoint;

    add-float v11, v0, v15

    sub-float v12, v1, v15

    invoke-direct {v10, v11, v12}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    const/4 v11, 0x3

    aput-object v10, v9, v11

    .line 300
    return-object v9

    .line 306
    :cond_0
    new-array v9, v14, [Lcom/google/zxing/ResultPoint;

    .line 307
    new-instance v10, Lcom/google/zxing/ResultPoint;

    add-float v11, v6, v15

    add-float v14, v7, v15

    invoke-direct {v10, v11, v14}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    aput-object v10, v9, v13

    .line 308
    new-instance v10, Lcom/google/zxing/ResultPoint;

    add-float v11, v2, v15

    sub-float v13, v3, v15

    invoke-direct {v10, v11, v13}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    aput-object v10, v9, v12

    .line 309
    new-instance v10, Lcom/google/zxing/ResultPoint;

    sub-float v11, v4, v15

    add-float v12, v5, v15

    invoke-direct {v10, v11, v12}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    const/4 v11, 0x2

    aput-object v10, v9, v11

    .line 310
    new-instance v10, Lcom/google/zxing/ResultPoint;

    sub-float v11, v0, v15

    sub-float v12, v1, v15

    invoke-direct {v10, v11, v12}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    const/4 v11, 0x3

    aput-object v10, v9, v11

    .line 306
    return-object v9
.end method

.method private containsBlackPoint(IIIZ)Z
    .locals 3
    .param p1, "a"    # I
    .param p2, "b"    # I
    .param p3, "fixed"    # I
    .param p4, "horizontal"    # Z

    .line 325
    const/4 v0, 0x1

    if-eqz p4, :cond_2

    .line 326
    move v1, p1

    .local v1, "x":I
    :goto_0
    if-le v1, p2, :cond_0

    .line 331
    .end local v1    # "x":I
    goto :goto_2

    .line 327
    .restart local v1    # "x":I
    :cond_0
    iget-object v2, p0, Lcom/google/zxing/common/detector/WhiteRectangleDetector;->image:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v2, v1, p3}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 328
    return v0

    .line 326
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 332
    .end local v1    # "x":I
    :cond_2
    move v1, p1

    .local v1, "y":I
    :goto_1
    if-le v1, p2, :cond_3

    .line 339
    .end local v1    # "y":I
    :goto_2
    const/4 v0, 0x0

    return v0

    .line 333
    .restart local v1    # "y":I
    :cond_3
    iget-object v2, p0, Lcom/google/zxing/common/detector/WhiteRectangleDetector;->image:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v2, p3, v1}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 334
    return v0

    .line 332
    :cond_4
    add-int/lit8 v1, v1, 0x1

    goto :goto_1
.end method

.method private getBlackPointOnSegment(FFFF)Lcom/google/zxing/ResultPoint;
    .locals 9
    .param p1, "aX"    # F
    .param p2, "aY"    # F
    .param p3, "bX"    # F
    .param p4, "bY"    # F

    .line 253
    invoke-static {p1, p2, p3, p4}, Lcom/google/zxing/common/detector/MathUtils;->distance(FFFF)F

    move-result v0

    invoke-static {v0}, Lcom/google/zxing/common/detector/MathUtils;->round(F)I

    move-result v0

    .line 254
    .local v0, "dist":I
    sub-float v1, p3, p1

    int-to-float v2, v0

    div-float/2addr v1, v2

    .line 255
    .local v1, "xStep":F
    sub-float v2, p4, p2

    int-to-float v3, v0

    div-float/2addr v2, v3

    .line 257
    .local v2, "yStep":F
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    if-lt v3, v0, :cond_0

    .line 264
    .end local v3    # "i":I
    const/4 v3, 0x0

    return-object v3

    .line 258
    .restart local v3    # "i":I
    :cond_0
    int-to-float v4, v3

    mul-float/2addr v4, v1

    add-float/2addr v4, p1

    invoke-static {v4}, Lcom/google/zxing/common/detector/MathUtils;->round(F)I

    move-result v4

    .line 259
    .local v4, "x":I
    int-to-float v5, v3

    mul-float/2addr v5, v2

    add-float/2addr v5, p2

    invoke-static {v5}, Lcom/google/zxing/common/detector/MathUtils;->round(F)I

    move-result v5

    .line 260
    .local v5, "y":I
    iget-object v6, p0, Lcom/google/zxing/common/detector/WhiteRectangleDetector;->image:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v6, v4, v5}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 261
    new-instance v6, Lcom/google/zxing/ResultPoint;

    int-to-float v7, v4

    int-to-float v8, v5

    invoke-direct {v6, v7, v8}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    return-object v6

    .line 257
    .end local v4    # "x":I
    .end local v5    # "y":I
    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0
.end method


# virtual methods
.method public detect()[Lcom/google/zxing/ResultPoint;
    .locals 24
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .line 87
    move-object/from16 v0, p0

    iget v1, v0, Lcom/google/zxing/common/detector/WhiteRectangleDetector;->leftInit:I

    .line 88
    .local v1, "left":I
    iget v2, v0, Lcom/google/zxing/common/detector/WhiteRectangleDetector;->rightInit:I

    .line 89
    .local v2, "right":I
    iget v3, v0, Lcom/google/zxing/common/detector/WhiteRectangleDetector;->upInit:I

    .line 90
    .local v3, "up":I
    iget v4, v0, Lcom/google/zxing/common/detector/WhiteRectangleDetector;->downInit:I

    .line 91
    .local v4, "down":I
    const/4 v5, 0x0

    .line 92
    .local v5, "sizeExceeded":Z
    const/4 v6, 0x1

    .line 93
    .local v6, "aBlackPointFoundOnBorder":Z
    const/4 v7, 0x0

    .line 95
    .local v7, "atLeastOneBlackPointFoundOnBorder":Z
    const/4 v8, 0x0

    .line 96
    .local v8, "atLeastOneBlackPointFoundOnRight":Z
    const/4 v9, 0x0

    .line 97
    .local v9, "atLeastOneBlackPointFoundOnBottom":Z
    const/4 v10, 0x0

    .line 98
    .local v10, "atLeastOneBlackPointFoundOnLeft":Z
    const/4 v11, 0x0

    .line 100
    .local v11, "atLeastOneBlackPointFoundOnTop":Z
    :goto_0
    if-nez v6, :cond_0

    goto :goto_5

    .line 102
    :cond_0
    const/4 v6, 0x0

    .line 107
    const/4 v12, 0x1

    .line 108
    .local v12, "rightBorderNotWhite":Z
    :goto_1
    if-nez v12, :cond_1

    if-nez v8, :cond_2

    :cond_1
    iget v14, v0, Lcom/google/zxing/common/detector/WhiteRectangleDetector;->width:I

    if-lt v2, v14, :cond_24

    .line 119
    :cond_2
    iget v14, v0, Lcom/google/zxing/common/detector/WhiteRectangleDetector;->width:I

    if-lt v2, v14, :cond_3

    .line 120
    const/4 v5, 0x1

    .line 121
    goto :goto_5

    .line 127
    :cond_3
    const/4 v14, 0x1

    .line 128
    .local v14, "bottomBorderNotWhite":Z
    :goto_2
    const/4 v15, 0x1

    if-nez v14, :cond_4

    if-nez v9, :cond_5

    :cond_4
    iget v13, v0, Lcom/google/zxing/common/detector/WhiteRectangleDetector;->height:I

    if-lt v4, v13, :cond_21

    .line 139
    :cond_5
    iget v13, v0, Lcom/google/zxing/common/detector/WhiteRectangleDetector;->height:I

    if-lt v4, v13, :cond_6

    .line 140
    const/4 v5, 0x1

    .line 141
    goto :goto_5

    .line 147
    :cond_6
    const/4 v13, 0x1

    .line 148
    .local v13, "leftBorderNotWhite":Z
    :goto_3
    if-nez v13, :cond_7

    if-nez v10, :cond_8

    :cond_7
    if-gez v1, :cond_1e

    .line 159
    :cond_8
    if-gez v1, :cond_9

    .line 160
    const/4 v5, 0x1

    .line 161
    goto :goto_5

    .line 167
    :cond_9
    const/16 v16, 0x1

    .line 168
    .local v16, "topBorderNotWhite":Z
    :goto_4
    if-nez v16, :cond_a

    if-nez v11, :cond_b

    :cond_a
    if-gez v3, :cond_1b

    .line 179
    :cond_b
    if-gez v3, :cond_19

    .line 180
    const/4 v5, 0x1

    .line 181
    nop

    .line 190
    .end local v12    # "rightBorderNotWhite":Z
    .end local v13    # "leftBorderNotWhite":Z
    .end local v14    # "bottomBorderNotWhite":Z
    .end local v16    # "topBorderNotWhite":Z
    :goto_5
    if-nez v5, :cond_18

    if-eqz v7, :cond_18

    .line 192
    sub-int v12, v2, v1

    .line 194
    .local v12, "maxSize":I
    const/4 v13, 0x0

    .line 195
    .local v13, "z":Lcom/google/zxing/ResultPoint;
    const/4 v14, 0x1

    .local v14, "i":I
    :goto_6
    if-lt v14, v12, :cond_c

    .line 202
    .end local v14    # "i":I
    move/from16 v17, v5

    move/from16 v18, v6

    move/from16 v19, v7

    goto :goto_7

    .line 196
    .restart local v14    # "i":I
    :cond_c
    int-to-float v15, v1

    move/from16 v17, v5

    sub-int v5, v4, v14

    .end local v5    # "sizeExceeded":Z
    .local v17, "sizeExceeded":Z
    int-to-float v5, v5

    move/from16 v18, v6

    add-int v6, v1, v14

    .end local v6    # "aBlackPointFoundOnBorder":Z
    .local v18, "aBlackPointFoundOnBorder":Z
    int-to-float v6, v6

    move/from16 v19, v7

    int-to-float v7, v4

    .end local v7    # "atLeastOneBlackPointFoundOnBorder":Z
    .local v19, "atLeastOneBlackPointFoundOnBorder":Z
    invoke-direct {v0, v15, v5, v6, v7}, Lcom/google/zxing/common/detector/WhiteRectangleDetector;->getBlackPointOnSegment(FFFF)Lcom/google/zxing/ResultPoint;

    move-result-object v13

    .line 197
    if-eqz v13, :cond_17

    .line 198
    nop

    .line 202
    .end local v14    # "i":I
    :goto_7
    if-eqz v13, :cond_16

    .line 206
    const/4 v5, 0x0

    .line 208
    .local v5, "t":Lcom/google/zxing/ResultPoint;
    const/4 v6, 0x1

    .local v6, "i":I
    :goto_8
    if-lt v6, v12, :cond_d

    .line 215
    .end local v6    # "i":I
    move/from16 v20, v1

    goto :goto_9

    .line 209
    .restart local v6    # "i":I
    :cond_d
    int-to-float v7, v1

    add-int v14, v3, v6

    int-to-float v14, v14

    add-int v15, v1, v6

    int-to-float v15, v15

    move/from16 v20, v1

    int-to-float v1, v3

    .end local v1    # "left":I
    .local v20, "left":I
    invoke-direct {v0, v7, v14, v15, v1}, Lcom/google/zxing/common/detector/WhiteRectangleDetector;->getBlackPointOnSegment(FFFF)Lcom/google/zxing/ResultPoint;

    move-result-object v5

    .line 210
    if-eqz v5, :cond_15

    .line 211
    nop

    .line 215
    .end local v6    # "i":I
    :goto_9
    if-eqz v5, :cond_14

    .line 219
    const/4 v1, 0x0

    .line 221
    .local v1, "x":Lcom/google/zxing/ResultPoint;
    const/4 v6, 0x1

    .restart local v6    # "i":I
    :goto_a
    if-lt v6, v12, :cond_e

    .end local v6    # "i":I
    goto :goto_b

    .line 222
    .restart local v6    # "i":I
    :cond_e
    int-to-float v7, v2

    add-int v14, v3, v6

    int-to-float v14, v14

    sub-int v15, v2, v6

    int-to-float v15, v15

    move-object/from16 v21, v1

    int-to-float v1, v3

    .end local v1    # "x":Lcom/google/zxing/ResultPoint;
    .local v21, "x":Lcom/google/zxing/ResultPoint;
    invoke-direct {v0, v7, v14, v15, v1}, Lcom/google/zxing/common/detector/WhiteRectangleDetector;->getBlackPointOnSegment(FFFF)Lcom/google/zxing/ResultPoint;

    move-result-object v1

    .line 223
    .end local v21    # "x":Lcom/google/zxing/ResultPoint;
    .restart local v1    # "x":Lcom/google/zxing/ResultPoint;
    if-eqz v1, :cond_13

    .line 224
    nop

    .line 228
    .end local v6    # "i":I
    :goto_b
    if-eqz v1, :cond_12

    .line 232
    const/4 v6, 0x0

    .line 234
    .local v6, "y":Lcom/google/zxing/ResultPoint;
    const/4 v7, 0x1

    .local v7, "i":I
    :goto_c
    if-lt v7, v12, :cond_f

    .line 241
    .end local v7    # "i":I
    move/from16 v23, v2

    move/from16 v22, v3

    goto :goto_d

    .line 235
    .restart local v7    # "i":I
    :cond_f
    int-to-float v14, v2

    sub-int v15, v4, v7

    int-to-float v15, v15

    move/from16 v22, v3

    sub-int v3, v2, v7

    .end local v3    # "up":I
    .local v22, "up":I
    int-to-float v3, v3

    move/from16 v23, v2

    int-to-float v2, v4

    .end local v2    # "right":I
    .local v23, "right":I
    invoke-direct {v0, v14, v15, v3, v2}, Lcom/google/zxing/common/detector/WhiteRectangleDetector;->getBlackPointOnSegment(FFFF)Lcom/google/zxing/ResultPoint;

    move-result-object v6

    .line 236
    if-eqz v6, :cond_11

    .line 237
    nop

    .line 241
    .end local v7    # "i":I
    :goto_d
    if-eqz v6, :cond_10

    .line 245
    invoke-direct {v0, v6, v13, v1, v5}, Lcom/google/zxing/common/detector/WhiteRectangleDetector;->centerEdges(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)[Lcom/google/zxing/ResultPoint;

    move-result-object v2

    return-object v2

    .line 242
    :cond_10
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v2

    throw v2

    .line 234
    .restart local v7    # "i":I
    :cond_11
    add-int/lit8 v7, v7, 0x1

    move/from16 v3, v22

    move/from16 v2, v23

    goto :goto_c

    .line 229
    .end local v6    # "y":Lcom/google/zxing/ResultPoint;
    .end local v7    # "i":I
    .end local v22    # "up":I
    .end local v23    # "right":I
    .restart local v2    # "right":I
    .restart local v3    # "up":I
    :cond_12
    move/from16 v23, v2

    move/from16 v22, v3

    .end local v2    # "right":I
    .end local v3    # "up":I
    .restart local v22    # "up":I
    .restart local v23    # "right":I
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v2

    throw v2

    .line 221
    .end local v22    # "up":I
    .end local v23    # "right":I
    .restart local v2    # "right":I
    .restart local v3    # "up":I
    .local v6, "i":I
    :cond_13
    move/from16 v23, v2

    move/from16 v22, v3

    .end local v2    # "right":I
    .end local v3    # "up":I
    .restart local v22    # "up":I
    .restart local v23    # "right":I
    add-int/lit8 v6, v6, 0x1

    goto :goto_a

    .line 216
    .end local v1    # "x":Lcom/google/zxing/ResultPoint;
    .end local v6    # "i":I
    .end local v22    # "up":I
    .end local v23    # "right":I
    .restart local v2    # "right":I
    .restart local v3    # "up":I
    :cond_14
    move/from16 v23, v2

    move/from16 v22, v3

    .end local v2    # "right":I
    .end local v3    # "up":I
    .restart local v22    # "up":I
    .restart local v23    # "right":I
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v1

    throw v1

    .line 208
    .end local v22    # "up":I
    .end local v23    # "right":I
    .restart local v2    # "right":I
    .restart local v3    # "up":I
    .restart local v6    # "i":I
    :cond_15
    move/from16 v23, v2

    move/from16 v22, v3

    .end local v2    # "right":I
    .end local v3    # "up":I
    .restart local v22    # "up":I
    .restart local v23    # "right":I
    add-int/lit8 v6, v6, 0x1

    move/from16 v1, v20

    goto/16 :goto_8

    .line 203
    .end local v5    # "t":Lcom/google/zxing/ResultPoint;
    .end local v6    # "i":I
    .end local v20    # "left":I
    .end local v22    # "up":I
    .end local v23    # "right":I
    .local v1, "left":I
    .restart local v2    # "right":I
    .restart local v3    # "up":I
    :cond_16
    move/from16 v20, v1

    move/from16 v23, v2

    move/from16 v22, v3

    .end local v1    # "left":I
    .end local v2    # "right":I
    .end local v3    # "up":I
    .restart local v20    # "left":I
    .restart local v22    # "up":I
    .restart local v23    # "right":I
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v1

    throw v1

    .line 195
    .end local v20    # "left":I
    .end local v22    # "up":I
    .end local v23    # "right":I
    .restart local v1    # "left":I
    .restart local v2    # "right":I
    .restart local v3    # "up":I
    .restart local v14    # "i":I
    :cond_17
    move/from16 v20, v1

    move/from16 v23, v2

    move/from16 v22, v3

    .end local v1    # "left":I
    .end local v2    # "right":I
    .end local v3    # "up":I
    .restart local v20    # "left":I
    .restart local v22    # "up":I
    .restart local v23    # "right":I
    add-int/lit8 v14, v14, 0x1

    move/from16 v5, v17

    move/from16 v6, v18

    move/from16 v7, v19

    goto/16 :goto_6

    .line 248
    .end local v12    # "maxSize":I
    .end local v13    # "z":Lcom/google/zxing/ResultPoint;
    .end local v14    # "i":I
    .end local v17    # "sizeExceeded":Z
    .end local v18    # "aBlackPointFoundOnBorder":Z
    .end local v19    # "atLeastOneBlackPointFoundOnBorder":Z
    .end local v20    # "left":I
    .end local v22    # "up":I
    .end local v23    # "right":I
    .restart local v1    # "left":I
    .restart local v2    # "right":I
    .restart local v3    # "up":I
    .local v5, "sizeExceeded":Z
    .local v6, "aBlackPointFoundOnBorder":Z
    .local v7, "atLeastOneBlackPointFoundOnBorder":Z
    :cond_18
    move/from16 v20, v1

    move/from16 v23, v2

    move/from16 v22, v3

    move/from16 v17, v5

    move/from16 v18, v6

    move/from16 v19, v7

    .end local v1    # "left":I
    .end local v2    # "right":I
    .end local v3    # "up":I
    .end local v5    # "sizeExceeded":Z
    .end local v6    # "aBlackPointFoundOnBorder":Z
    .end local v7    # "atLeastOneBlackPointFoundOnBorder":Z
    .restart local v17    # "sizeExceeded":Z
    .restart local v18    # "aBlackPointFoundOnBorder":Z
    .restart local v19    # "atLeastOneBlackPointFoundOnBorder":Z
    .restart local v20    # "left":I
    .restart local v22    # "up":I
    .restart local v23    # "right":I
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v1

    throw v1

    .line 184
    .end local v17    # "sizeExceeded":Z
    .end local v18    # "aBlackPointFoundOnBorder":Z
    .end local v19    # "atLeastOneBlackPointFoundOnBorder":Z
    .end local v20    # "left":I
    .end local v22    # "up":I
    .end local v23    # "right":I
    .restart local v1    # "left":I
    .restart local v2    # "right":I
    .restart local v3    # "up":I
    .restart local v5    # "sizeExceeded":Z
    .restart local v6    # "aBlackPointFoundOnBorder":Z
    .restart local v7    # "atLeastOneBlackPointFoundOnBorder":Z
    .local v12, "rightBorderNotWhite":Z
    .local v13, "leftBorderNotWhite":Z
    .local v14, "bottomBorderNotWhite":Z
    .restart local v16    # "topBorderNotWhite":Z
    :cond_19
    move/from16 v19, v7

    .end local v7    # "atLeastOneBlackPointFoundOnBorder":Z
    .restart local v19    # "atLeastOneBlackPointFoundOnBorder":Z
    if-eqz v6, :cond_1a

    .line 185
    const/4 v7, 0x1

    .end local v12    # "rightBorderNotWhite":Z
    .end local v13    # "leftBorderNotWhite":Z
    .end local v14    # "bottomBorderNotWhite":Z
    .end local v16    # "topBorderNotWhite":Z
    .end local v19    # "atLeastOneBlackPointFoundOnBorder":Z
    .restart local v7    # "atLeastOneBlackPointFoundOnBorder":Z
    goto/16 :goto_0

    .line 100
    .end local v7    # "atLeastOneBlackPointFoundOnBorder":Z
    .restart local v19    # "atLeastOneBlackPointFoundOnBorder":Z
    :cond_1a
    move/from16 v7, v19

    goto/16 :goto_0

    .line 169
    .end local v19    # "atLeastOneBlackPointFoundOnBorder":Z
    .restart local v7    # "atLeastOneBlackPointFoundOnBorder":Z
    .restart local v12    # "rightBorderNotWhite":Z
    .restart local v13    # "leftBorderNotWhite":Z
    .restart local v14    # "bottomBorderNotWhite":Z
    .restart local v16    # "topBorderNotWhite":Z
    :cond_1b
    move/from16 v19, v7

    .end local v7    # "atLeastOneBlackPointFoundOnBorder":Z
    .restart local v19    # "atLeastOneBlackPointFoundOnBorder":Z
    invoke-direct {v0, v1, v2, v3, v15}, Lcom/google/zxing/common/detector/WhiteRectangleDetector;->containsBlackPoint(IIIZ)Z

    move-result v16

    .line 170
    if-eqz v16, :cond_1d

    .line 171
    add-int/lit8 v3, v3, -0x1

    .line 172
    const/4 v6, 0x1

    .line 173
    const/4 v11, 0x1

    .line 174
    nop

    .line 168
    .end local v19    # "atLeastOneBlackPointFoundOnBorder":Z
    .restart local v7    # "atLeastOneBlackPointFoundOnBorder":Z
    :cond_1c
    :goto_e
    move/from16 v7, v19

    goto/16 :goto_4

    .line 174
    .end local v7    # "atLeastOneBlackPointFoundOnBorder":Z
    .restart local v19    # "atLeastOneBlackPointFoundOnBorder":Z
    :cond_1d
    if-nez v11, :cond_1c

    .line 175
    add-int/lit8 v3, v3, -0x1

    goto :goto_e

    .line 149
    .end local v16    # "topBorderNotWhite":Z
    .end local v19    # "atLeastOneBlackPointFoundOnBorder":Z
    .restart local v7    # "atLeastOneBlackPointFoundOnBorder":Z
    :cond_1e
    move/from16 v19, v7

    .end local v7    # "atLeastOneBlackPointFoundOnBorder":Z
    .restart local v19    # "atLeastOneBlackPointFoundOnBorder":Z
    const/4 v7, 0x0

    invoke-direct {v0, v3, v4, v1, v7}, Lcom/google/zxing/common/detector/WhiteRectangleDetector;->containsBlackPoint(IIIZ)Z

    move-result v13

    .line 150
    if-eqz v13, :cond_20

    .line 151
    add-int/lit8 v1, v1, -0x1

    .line 152
    const/4 v6, 0x1

    .line 153
    const/4 v10, 0x1

    .line 154
    nop

    .line 148
    .end local v19    # "atLeastOneBlackPointFoundOnBorder":Z
    .restart local v7    # "atLeastOneBlackPointFoundOnBorder":Z
    :cond_1f
    :goto_f
    move/from16 v7, v19

    goto/16 :goto_3

    .line 154
    .end local v7    # "atLeastOneBlackPointFoundOnBorder":Z
    .restart local v19    # "atLeastOneBlackPointFoundOnBorder":Z
    :cond_20
    if-nez v10, :cond_1f

    .line 155
    add-int/lit8 v1, v1, -0x1

    goto :goto_f

    .line 129
    .end local v13    # "leftBorderNotWhite":Z
    .end local v19    # "atLeastOneBlackPointFoundOnBorder":Z
    .restart local v7    # "atLeastOneBlackPointFoundOnBorder":Z
    :cond_21
    move/from16 v19, v7

    .end local v7    # "atLeastOneBlackPointFoundOnBorder":Z
    .restart local v19    # "atLeastOneBlackPointFoundOnBorder":Z
    invoke-direct {v0, v1, v2, v4, v15}, Lcom/google/zxing/common/detector/WhiteRectangleDetector;->containsBlackPoint(IIIZ)Z

    move-result v14

    .line 130
    if-eqz v14, :cond_23

    .line 131
    add-int/lit8 v4, v4, 0x1

    .line 132
    const/4 v6, 0x1

    .line 133
    const/4 v9, 0x1

    .line 134
    nop

    .line 128
    .end local v19    # "atLeastOneBlackPointFoundOnBorder":Z
    .restart local v7    # "atLeastOneBlackPointFoundOnBorder":Z
    :cond_22
    :goto_10
    move/from16 v7, v19

    goto/16 :goto_2

    .line 134
    .end local v7    # "atLeastOneBlackPointFoundOnBorder":Z
    .restart local v19    # "atLeastOneBlackPointFoundOnBorder":Z
    :cond_23
    if-nez v9, :cond_22

    .line 135
    add-int/lit8 v4, v4, 0x1

    goto :goto_10

    .line 109
    .end local v14    # "bottomBorderNotWhite":Z
    .end local v19    # "atLeastOneBlackPointFoundOnBorder":Z
    .restart local v7    # "atLeastOneBlackPointFoundOnBorder":Z
    :cond_24
    move/from16 v19, v7

    .end local v7    # "atLeastOneBlackPointFoundOnBorder":Z
    .restart local v19    # "atLeastOneBlackPointFoundOnBorder":Z
    const/4 v7, 0x0

    invoke-direct {v0, v3, v4, v2, v7}, Lcom/google/zxing/common/detector/WhiteRectangleDetector;->containsBlackPoint(IIIZ)Z

    move-result v12

    .line 110
    if-eqz v12, :cond_26

    .line 111
    add-int/lit8 v2, v2, 0x1

    .line 112
    const/4 v6, 0x1

    .line 113
    const/4 v8, 0x1

    .line 114
    nop

    .line 108
    .end local v19    # "atLeastOneBlackPointFoundOnBorder":Z
    .restart local v7    # "atLeastOneBlackPointFoundOnBorder":Z
    :cond_25
    :goto_11
    move/from16 v7, v19

    goto/16 :goto_1

    .line 114
    .end local v7    # "atLeastOneBlackPointFoundOnBorder":Z
    .restart local v19    # "atLeastOneBlackPointFoundOnBorder":Z
    :cond_26
    if-nez v8, :cond_25

    .line 115
    add-int/lit8 v2, v2, 0x1

    goto :goto_11
.end method
