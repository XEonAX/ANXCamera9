.class public final Lcom/google/zxing/common/detector/MonochromeRectangleDetector;
.super Ljava/lang/Object;
.source "MonochromeRectangleDetector.java"


# static fields
.field private static final MAX_MODULES:I = 0x20


# instance fields
.field private final image:Lcom/google/zxing/common/BitMatrix;


# direct methods
.method public constructor <init>(Lcom/google/zxing/common/BitMatrix;)V
    .locals 0
    .param p1, "image"    # Lcom/google/zxing/common/BitMatrix;

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    iput-object p1, p0, Lcom/google/zxing/common/detector/MonochromeRectangleDetector;->image:Lcom/google/zxing/common/BitMatrix;

    .line 38
    return-void
.end method

.method private blackWhiteRange(IIIIZ)[I
    .locals 7
    .param p1, "fixedDimension"    # I
    .param p2, "maxWhiteRun"    # I
    .param p3, "minDim"    # I
    .param p4, "maxDim"    # I
    .param p5, "horizontal"    # Z

    .line 170
    add-int v0, p3, p4

    const/4 v1, 0x2

    div-int/2addr v0, v1

    .line 173
    .local v0, "center":I
    move v2, v0

    .line 174
    .local v2, "start":I
    :goto_0
    if-ge v2, p3, :cond_0

    goto :goto_4

    .line 175
    :cond_0
    if-eqz p5, :cond_1

    iget-object v3, p0, Lcom/google/zxing/common/detector/MonochromeRectangleDetector;->image:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v3, v2, p1}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v3

    if-eqz v3, :cond_2

    goto :goto_1

    :cond_1
    iget-object v3, p0, Lcom/google/zxing/common/detector/MonochromeRectangleDetector;->image:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v3, p1, v2}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 176
    :goto_1
    add-int/lit8 v2, v2, -0x1

    .line 177
    goto :goto_0

    .line 178
    :cond_2
    move v3, v2

    .line 180
    .local v2, "whiteRunStart":I
    .local v3, "start":I
    :cond_3
    add-int/lit8 v3, v3, -0x1

    .line 181
    if-lt v3, p3, :cond_5

    .line 182
    if-eqz p5, :cond_4

    iget-object v4, p0, Lcom/google/zxing/common/detector/MonochromeRectangleDetector;->image:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v4, v3, p1}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v4

    if-eqz v4, :cond_3

    goto :goto_2

    :cond_4
    iget-object v4, p0, Lcom/google/zxing/common/detector/MonochromeRectangleDetector;->image:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v4, p1, v3}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 183
    :cond_5
    :goto_2
    sub-int v4, v2, v3

    .line 184
    .local v4, "whiteRunSize":I
    if-lt v3, p3, :cond_7

    if-le v4, p2, :cond_6

    goto :goto_3

    .line 174
    .end local v2    # "whiteRunStart":I
    .end local v4    # "whiteRunSize":I
    :cond_6
    move v2, v3

    goto :goto_0

    .line 185
    .restart local v2    # "whiteRunStart":I
    .restart local v4    # "whiteRunSize":I
    :cond_7
    :goto_3
    move v3, v2

    .line 186
    nop

    .line 190
    .end local v3    # "start":I
    .end local v4    # "whiteRunSize":I
    .local v2, "start":I
    :goto_4
    const/4 v3, 0x1

    add-int/2addr v2, v3

    .line 193
    move v4, v0

    .line 194
    .local v4, "end":I
    :goto_5
    if-lt v4, p4, :cond_8

    goto :goto_9

    .line 195
    :cond_8
    if-eqz p5, :cond_9

    iget-object v5, p0, Lcom/google/zxing/common/detector/MonochromeRectangleDetector;->image:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v5, v4, p1}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v5

    if-eqz v5, :cond_a

    goto :goto_6

    :cond_9
    iget-object v5, p0, Lcom/google/zxing/common/detector/MonochromeRectangleDetector;->image:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v5, p1, v4}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v5

    if-eqz v5, :cond_a

    .line 196
    :goto_6
    add-int/lit8 v4, v4, 0x1

    .line 197
    goto :goto_5

    .line 198
    :cond_a
    move v5, v4

    .line 200
    .local v4, "whiteRunStart":I
    .local v5, "end":I
    :cond_b
    add-int/2addr v5, v3

    .line 201
    if-ge v5, p4, :cond_d

    .line 202
    if-eqz p5, :cond_c

    iget-object v6, p0, Lcom/google/zxing/common/detector/MonochromeRectangleDetector;->image:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v6, v5, p1}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v6

    if-eqz v6, :cond_b

    goto :goto_7

    :cond_c
    iget-object v6, p0, Lcom/google/zxing/common/detector/MonochromeRectangleDetector;->image:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v6, p1, v5}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v6

    if-eqz v6, :cond_b

    .line 203
    :cond_d
    :goto_7
    sub-int v6, v5, v4

    .line 204
    .local v6, "whiteRunSize":I
    if-ge v5, p4, :cond_f

    if-le v6, p2, :cond_e

    goto :goto_8

    .line 194
    .end local v4    # "whiteRunStart":I
    .end local v6    # "whiteRunSize":I
    :cond_e
    move v4, v5

    goto :goto_5

    .line 205
    .restart local v4    # "whiteRunStart":I
    .restart local v6    # "whiteRunSize":I
    :cond_f
    :goto_8
    move v5, v4

    .line 206
    nop

    .line 210
    .end local v5    # "end":I
    .end local v6    # "whiteRunSize":I
    .local v4, "end":I
    :goto_9
    add-int/lit8 v4, v4, -0x1

    .line 212
    if-le v4, v2, :cond_10

    new-array v1, v1, [I

    const/4 v5, 0x0

    aput v2, v1, v5

    aput v4, v1, v3

    goto :goto_a

    :cond_10
    const/4 v1, 0x0

    :goto_a
    return-object v1
.end method

.method private findCornerFromCenter(IIIIIIIII)Lcom/google/zxing/ResultPoint;
    .locals 15
    .param p1, "centerX"    # I
    .param p2, "deltaX"    # I
    .param p3, "left"    # I
    .param p4, "right"    # I
    .param p5, "centerY"    # I
    .param p6, "deltaY"    # I
    .param p7, "top"    # I
    .param p8, "bottom"    # I
    .param p9, "maxWhiteRun"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    move/from16 v0, p1

    move/from16 v1, p5

    .line 109
    const/4 v2, 0x0

    .line 110
    .local v2, "lastRange":[I
    move v3, v1

    .local v3, "y":I
    move v4, v0

    .line 111
    .local v4, "x":I
    move-object v11, v2

    move v2, v4

    .end local v4    # "x":I
    .local v2, "x":I
    .local v11, "lastRange":[I
    :goto_0
    move/from16 v12, p8

    if-ge v3, v12, :cond_a

    move/from16 v13, p7

    if-lt v3, v13, :cond_b

    move/from16 v4, p4

    if-ge v2, v4, :cond_b

    .line 110
    move/from16 v10, p3

    if-lt v2, v10, :cond_b

    .line 114
    if-nez p2, :cond_0

    .line 116
    const/4 v14, 0x1

    move-object v5, p0

    move v6, v3

    move/from16 v7, p9

    move v8, v10

    move v9, v4

    move v10, v14

    invoke-direct/range {v5 .. v10}, Lcom/google/zxing/common/detector/MonochromeRectangleDetector;->blackWhiteRange(IIIIZ)[I

    move-result-object v5

    .line 117
    .local v5, "range":[I
    goto :goto_1

    .line 119
    .end local v5    # "range":[I
    :cond_0
    const/4 v9, 0x0

    move-object v4, p0

    move v5, v2

    move/from16 v6, p9

    move v7, v13

    move v8, v12

    invoke-direct/range {v4 .. v9}, Lcom/google/zxing/common/detector/MonochromeRectangleDetector;->blackWhiteRange(IIIIZ)[I

    move-result-object v5

    .restart local v5    # "range":[I
    :goto_1
    move-object v4, v5

    .line 121
    .end local v5    # "range":[I
    .local v4, "range":[I
    if-nez v4, :cond_9

    .line 122
    if-eqz v11, :cond_8

    .line 126
    const/4 v5, 0x1

    const/4 v6, 0x0

    if-nez p2, :cond_4

    .line 127
    sub-int v7, v3, p6

    .line 128
    .local v7, "lastY":I
    aget v8, v11, v6

    if-ge v8, v0, :cond_3

    .line 129
    aget v8, v11, v5

    if-le v8, v0, :cond_2

    .line 131
    new-instance v8, Lcom/google/zxing/ResultPoint;

    if-lez p6, :cond_1

    aget v5, v11, v6

    goto :goto_2

    :cond_1
    aget v5, v11, v5

    :goto_2
    int-to-float v5, v5

    int-to-float v6, v7

    invoke-direct {v8, v5, v6}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    return-object v8

    .line 133
    :cond_2
    new-instance v5, Lcom/google/zxing/ResultPoint;

    aget v6, v11, v6

    int-to-float v6, v6

    int-to-float v8, v7

    invoke-direct {v5, v6, v8}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    return-object v5

    .line 135
    :cond_3
    new-instance v6, Lcom/google/zxing/ResultPoint;

    aget v5, v11, v5

    int-to-float v5, v5

    int-to-float v8, v7

    invoke-direct {v6, v5, v8}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    return-object v6

    .line 138
    .end local v7    # "lastY":I
    :cond_4
    sub-int v7, v2, p2

    .line 139
    .local v7, "lastX":I
    aget v8, v11, v6

    if-ge v8, v1, :cond_7

    .line 140
    aget v8, v11, v5

    if-le v8, v1, :cond_6

    .line 141
    new-instance v8, Lcom/google/zxing/ResultPoint;

    int-to-float v9, v7

    if-gez p2, :cond_5

    aget v5, v11, v6

    goto :goto_3

    :cond_5
    aget v5, v11, v5

    :goto_3
    int-to-float v5, v5

    invoke-direct {v8, v9, v5}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    return-object v8

    .line 143
    :cond_6
    new-instance v5, Lcom/google/zxing/ResultPoint;

    int-to-float v8, v7

    aget v6, v11, v6

    int-to-float v6, v6

    invoke-direct {v5, v8, v6}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    return-object v5

    .line 145
    :cond_7
    new-instance v6, Lcom/google/zxing/ResultPoint;

    int-to-float v8, v7

    aget v5, v11, v5

    int-to-float v5, v5

    invoke-direct {v6, v8, v5}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    return-object v6

    .line 123
    .end local v7    # "lastX":I
    :cond_8
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v5

    throw v5

    .line 149
    :cond_9
    move-object v11, v4

    .line 112
    .end local v4    # "range":[I
    add-int v3, v3, p6

    add-int v2, v2, p2

    goto/16 :goto_0

    .line 151
    .end local v2    # "x":I
    .end local v3    # "y":I
    :cond_a
    move/from16 v13, p7

    :cond_b
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v2

    throw v2
.end method


# virtual methods
.method public detect()[Lcom/google/zxing/ResultPoint;
    .locals 28
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .line 51
    move-object/from16 v15, p0

    iget-object v0, v15, Lcom/google/zxing/common/detector/MonochromeRectangleDetector;->image:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v0}, Lcom/google/zxing/common/BitMatrix;->getHeight()I

    move-result v14

    .line 52
    .local v14, "height":I
    iget-object v0, v15, Lcom/google/zxing/common/detector/MonochromeRectangleDetector;->image:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v0}, Lcom/google/zxing/common/BitMatrix;->getWidth()I

    move-result v13

    .line 53
    .local v13, "width":I
    div-int/lit8 v19, v14, 0x2

    .line 54
    .local v19, "halfHeight":I
    div-int/lit8 v20, v13, 0x2

    .line 55
    .local v20, "halfWidth":I
    div-int/lit16 v0, v14, 0x100

    const/4 v12, 0x1

    invoke-static {v12, v0}, Ljava/lang/Math;->max(II)I

    move-result v11

    .line 56
    .local v11, "deltaY":I
    div-int/lit16 v0, v13, 0x100

    invoke-static {v12, v0}, Ljava/lang/Math;->max(II)I

    move-result v10

    .line 58
    .local v10, "deltaX":I
    const/16 v16, 0x0

    .line 59
    .local v16, "top":I
    move v8, v14

    .line 60
    .local v8, "bottom":I
    const/16 v21, 0x0

    .line 61
    .local v21, "left":I
    move v4, v13

    .line 62
    .local v4, "right":I
    nop

    .line 63
    neg-int v6, v11

    div-int/lit8 v9, v20, 0x2

    .line 62
    const/4 v2, 0x0

    move-object v0, v15

    move/from16 v1, v20

    move/from16 v3, v21

    move/from16 v5, v19

    move/from16 v7, v16

    invoke-direct/range {v0 .. v9}, Lcom/google/zxing/common/detector/MonochromeRectangleDetector;->findCornerFromCenter(IIIIIIIII)Lcom/google/zxing/ResultPoint;

    move-result-object v7

    .line 64
    .local v7, "pointA":Lcom/google/zxing/ResultPoint;
    invoke-virtual {v7}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v0

    float-to-int v0, v0

    add-int/lit8 v22, v0, -0x1

    .line 65
    .end local v16    # "top":I
    .local v22, "top":I
    neg-int v0, v10

    .line 66
    div-int/lit8 v18, v19, 0x2

    .line 65
    const/4 v1, 0x0

    move-object v9, v15

    move/from16 v23, v10

    move/from16 v10, v20

    .end local v10    # "deltaX":I
    .local v23, "deltaX":I
    move v6, v11

    move v11, v0

    .end local v11    # "deltaY":I
    .local v6, "deltaY":I
    move/from16 v24, v12

    move/from16 v12, v21

    move/from16 v25, v13

    .end local v13    # "width":I
    .local v25, "width":I
    move/from16 v26, v14

    move/from16 v14, v19

    .end local v14    # "height":I
    .local v26, "height":I
    move v15, v1

    move/from16 v16, v22

    move/from16 v17, v8

    invoke-direct/range {v9 .. v18}, Lcom/google/zxing/common/detector/MonochromeRectangleDetector;->findCornerFromCenter(IIIIIIIII)Lcom/google/zxing/ResultPoint;

    move-result-object v5

    .line 67
    .local v5, "pointB":Lcom/google/zxing/ResultPoint;
    invoke-virtual {v5}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v0

    float-to-int v0, v0

    add-int/lit8 v21, v0, -0x1

    .line 68
    nop

    .line 69
    div-int/lit8 v18, v19, 0x2

    .line 68
    const/4 v15, 0x0

    move-object/from16 v9, p0

    move/from16 v11, v23

    move/from16 v12, v21

    invoke-direct/range {v9 .. v18}, Lcom/google/zxing/common/detector/MonochromeRectangleDetector;->findCornerFromCenter(IIIIIIIII)Lcom/google/zxing/ResultPoint;

    move-result-object v3

    .line 70
    .local v3, "pointC":Lcom/google/zxing/ResultPoint;
    invoke-virtual {v3}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v0

    float-to-int v0, v0

    add-int/lit8 v27, v0, 0x1

    .line 71
    .end local v4    # "right":I
    .local v27, "right":I
    nop

    .line 72
    div-int/lit8 v18, v20, 0x2

    .line 71
    const/4 v11, 0x0

    move/from16 v13, v27

    move v15, v6

    invoke-direct/range {v9 .. v18}, Lcom/google/zxing/common/detector/MonochromeRectangleDetector;->findCornerFromCenter(IIIIIIIII)Lcom/google/zxing/ResultPoint;

    move-result-object v10

    .line 73
    .local v10, "pointD":Lcom/google/zxing/ResultPoint;
    invoke-virtual {v10}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v0

    float-to-int v0, v0

    add-int/lit8 v11, v0, 0x1

    .line 76
    .end local v8    # "bottom":I
    .local v11, "bottom":I
    nop

    .line 77
    neg-int v8, v6

    div-int/lit8 v9, v20, 0x4

    .line 76
    move-object/from16 v0, p0

    move/from16 v1, v20

    move-object v12, v3

    move/from16 v3, v21

    .end local v3    # "pointC":Lcom/google/zxing/ResultPoint;
    .local v12, "pointC":Lcom/google/zxing/ResultPoint;
    move/from16 v4, v27

    move-object v13, v5

    move/from16 v5, v19

    .end local v5    # "pointB":Lcom/google/zxing/ResultPoint;
    .local v13, "pointB":Lcom/google/zxing/ResultPoint;
    move v14, v6

    move v6, v8

    .end local v6    # "deltaY":I
    .local v14, "deltaY":I
    move-object v15, v7

    move/from16 v7, v22

    .end local v7    # "pointA":Lcom/google/zxing/ResultPoint;
    .local v15, "pointA":Lcom/google/zxing/ResultPoint;
    move v8, v11

    invoke-direct/range {v0 .. v9}, Lcom/google/zxing/common/detector/MonochromeRectangleDetector;->findCornerFromCenter(IIIIIIIII)Lcom/google/zxing/ResultPoint;

    move-result-object v0

    .line 79
    .end local v15    # "pointA":Lcom/google/zxing/ResultPoint;
    .local v0, "pointA":Lcom/google/zxing/ResultPoint;
    const/4 v1, 0x4

    new-array v1, v1, [Lcom/google/zxing/ResultPoint;

    aput-object v0, v1, v2

    aput-object v13, v1, v24

    const/4 v2, 0x2

    aput-object v12, v1, v2

    const/4 v2, 0x3

    aput-object v10, v1, v2

    return-object v1
.end method
