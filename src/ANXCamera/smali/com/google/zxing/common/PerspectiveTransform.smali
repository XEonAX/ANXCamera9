.class public final Lcom/google/zxing/common/PerspectiveTransform;
.super Ljava/lang/Object;
.source "PerspectiveTransform.java"


# instance fields
.field private final a11:F

.field private final a12:F

.field private final a13:F

.field private final a21:F

.field private final a22:F

.field private final a23:F

.field private final a31:F

.field private final a32:F

.field private final a33:F


# direct methods
.method private constructor <init>(FFFFFFFFF)V
    .registers 10
    .param p1, "a11"    # F
    .param p2, "a21"    # F
    .param p3, "a31"    # F
    .param p4, "a12"    # F
    .param p5, "a22"    # F
    .param p6, "a32"    # F
    .param p7, "a13"    # F
    .param p8, "a23"    # F
    .param p9, "a33"    # F

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    iput p1, p0, Lcom/google/zxing/common/PerspectiveTransform;->a11:F

    .line 42
    iput p4, p0, Lcom/google/zxing/common/PerspectiveTransform;->a12:F

    .line 43
    iput p7, p0, Lcom/google/zxing/common/PerspectiveTransform;->a13:F

    .line 44
    iput p2, p0, Lcom/google/zxing/common/PerspectiveTransform;->a21:F

    .line 45
    iput p5, p0, Lcom/google/zxing/common/PerspectiveTransform;->a22:F

    .line 46
    iput p8, p0, Lcom/google/zxing/common/PerspectiveTransform;->a23:F

    .line 47
    iput p3, p0, Lcom/google/zxing/common/PerspectiveTransform;->a31:F

    .line 48
    iput p6, p0, Lcom/google/zxing/common/PerspectiveTransform;->a32:F

    .line 49
    iput p9, p0, Lcom/google/zxing/common/PerspectiveTransform;->a33:F

    .line 50
    return-void
.end method

.method public static quadrilateralToQuadrilateral(FFFFFFFFFFFFFFFF)Lcom/google/zxing/common/PerspectiveTransform;
    .registers 19
    .param p0, "x0"    # F
    .param p1, "y0"    # F
    .param p2, "x1"    # F
    .param p3, "y1"    # F
    .param p4, "x2"    # F
    .param p5, "y2"    # F
    .param p6, "x3"    # F
    .param p7, "y3"    # F
    .param p8, "x0p"    # F
    .param p9, "y0p"    # F
    .param p10, "x1p"    # F
    .param p11, "y1p"    # F
    .param p12, "x2p"    # F
    .param p13, "y2p"    # F
    .param p14, "x3p"    # F
    .param p15, "y3p"    # F

    .line 61
    invoke-static/range {p0 .. p7}, Lcom/google/zxing/common/PerspectiveTransform;->quadrilateralToSquare(FFFFFFFF)Lcom/google/zxing/common/PerspectiveTransform;

    move-result-object v0

    .line 62
    .local v0, "qToS":Lcom/google/zxing/common/PerspectiveTransform;
    invoke-static/range {p8 .. p15}, Lcom/google/zxing/common/PerspectiveTransform;->squareToQuadrilateral(FFFFFFFF)Lcom/google/zxing/common/PerspectiveTransform;

    move-result-object v1

    .line 63
    .local v1, "sToQ":Lcom/google/zxing/common/PerspectiveTransform;
    invoke-virtual {v1, v0}, Lcom/google/zxing/common/PerspectiveTransform;->times(Lcom/google/zxing/common/PerspectiveTransform;)Lcom/google/zxing/common/PerspectiveTransform;

    move-result-object v2

    return-object v2
.end method

.method public static quadrilateralToSquare(FFFFFFFF)Lcom/google/zxing/common/PerspectiveTransform;
    .registers 9
    .param p0, "x0"    # F
    .param p1, "y0"    # F
    .param p2, "x1"    # F
    .param p3, "y1"    # F
    .param p4, "x2"    # F
    .param p5, "y2"    # F
    .param p6, "x3"    # F
    .param p7, "y3"    # F

    .line 127
    invoke-static/range {p0 .. p7}, Lcom/google/zxing/common/PerspectiveTransform;->squareToQuadrilateral(FFFFFFFF)Lcom/google/zxing/common/PerspectiveTransform;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/zxing/common/PerspectiveTransform;->buildAdjoint()Lcom/google/zxing/common/PerspectiveTransform;

    move-result-object v0

    return-object v0
.end method

.method public static squareToQuadrilateral(FFFFFFFF)Lcom/google/zxing/common/PerspectiveTransform;
    .registers 28
    .param p0, "x0"    # F
    .param p1, "y0"    # F
    .param p2, "x1"    # F
    .param p3, "y1"    # F
    .param p4, "x2"    # F
    .param p5, "y2"    # F
    .param p6, "x3"    # F
    .param p7, "y3"    # F

    .line 101
    sub-float v0, p0, p2

    add-float v0, v0, p4

    sub-float v10, v0, p6

    .line 102
    .local v10, "dx3":F
    sub-float v0, p1, p3

    add-float v0, v0, p5

    sub-float v11, v0, p7

    .line 103
    .local v11, "dy3":F
    const/4 v0, 0x0

    cmpl-float v1, v10, v0

    if-nez v1, :cond_2c

    cmpl-float v0, v11, v0

    if-nez v0, :cond_2c

    .line 105
    new-instance v12, Lcom/google/zxing/common/PerspectiveTransform;

    sub-float v1, p2, p0

    sub-float v2, p4, p2

    .line 106
    sub-float v4, p3, p1

    sub-float v5, p5, p3

    .line 107
    const/4 v7, 0x0

    const/4 v8, 0x0

    const/high16 v9, 0x3f800000    # 1.0f

    .line 105
    move-object v0, v12

    move/from16 v3, p0

    move/from16 v6, p1

    invoke-direct/range {v0 .. v9}, Lcom/google/zxing/common/PerspectiveTransform;-><init>(FFFFFFFFF)V

    return-object v12

    .line 109
    :cond_2c
    sub-float v12, p2, p4

    .line 110
    .local v12, "dx1":F
    sub-float v13, p6, p4

    .line 111
    .local v13, "dx2":F
    sub-float v14, p3, p5

    .line 112
    .local v14, "dy1":F
    sub-float v15, p7, p5

    .line 113
    .local v15, "dy2":F
    mul-float v0, v12, v15

    mul-float v1, v13, v14

    sub-float v16, v0, v1

    .line 114
    .local v16, "denominator":F
    mul-float v0, v10, v15

    mul-float v1, v13, v11

    sub-float/2addr v0, v1

    div-float v17, v0, v16

    .line 115
    .local v17, "a13":F
    mul-float v0, v12, v11

    mul-float v1, v10, v14

    sub-float/2addr v0, v1

    div-float v18, v0, v16

    .line 116
    .local v18, "a23":F
    new-instance v19, Lcom/google/zxing/common/PerspectiveTransform;

    sub-float v0, p2, p0

    mul-float v1, v17, p2

    add-float/2addr v1, v0

    sub-float v0, p6, p0

    mul-float v2, v18, p6

    add-float/2addr v2, v0

    .line 117
    sub-float v0, p3, p1

    mul-float v3, v17, p3

    add-float v4, v0, v3

    sub-float v0, p7, p1

    mul-float v3, v18, p7

    add-float v5, v0, v3

    .line 118
    const/high16 v9, 0x3f800000    # 1.0f

    .line 116
    move-object/from16 v0, v19

    move/from16 v3, p0

    move/from16 v6, p1

    move/from16 v7, v17

    move/from16 v8, v18

    invoke-direct/range {v0 .. v9}, Lcom/google/zxing/common/PerspectiveTransform;-><init>(FFFFFFFFF)V

    return-object v19
.end method


# virtual methods
.method buildAdjoint()Lcom/google/zxing/common/PerspectiveTransform;
    .registers 13

    .line 132
    new-instance v10, Lcom/google/zxing/common/PerspectiveTransform;

    iget v0, p0, Lcom/google/zxing/common/PerspectiveTransform;->a22:F

    iget v1, p0, Lcom/google/zxing/common/PerspectiveTransform;->a33:F

    mul-float/2addr v0, v1

    iget v1, p0, Lcom/google/zxing/common/PerspectiveTransform;->a23:F

    iget v2, p0, Lcom/google/zxing/common/PerspectiveTransform;->a32:F

    mul-float/2addr v1, v2

    sub-float v1, v0, v1

    .line 133
    iget v0, p0, Lcom/google/zxing/common/PerspectiveTransform;->a23:F

    iget v2, p0, Lcom/google/zxing/common/PerspectiveTransform;->a31:F

    mul-float/2addr v0, v2

    iget v2, p0, Lcom/google/zxing/common/PerspectiveTransform;->a21:F

    iget v3, p0, Lcom/google/zxing/common/PerspectiveTransform;->a33:F

    mul-float/2addr v2, v3

    sub-float v2, v0, v2

    .line 134
    iget v0, p0, Lcom/google/zxing/common/PerspectiveTransform;->a21:F

    iget v3, p0, Lcom/google/zxing/common/PerspectiveTransform;->a32:F

    mul-float/2addr v0, v3

    iget v3, p0, Lcom/google/zxing/common/PerspectiveTransform;->a22:F

    iget v4, p0, Lcom/google/zxing/common/PerspectiveTransform;->a31:F

    mul-float/2addr v3, v4

    sub-float v3, v0, v3

    .line 135
    iget v0, p0, Lcom/google/zxing/common/PerspectiveTransform;->a13:F

    iget v4, p0, Lcom/google/zxing/common/PerspectiveTransform;->a32:F

    mul-float/2addr v0, v4

    iget v4, p0, Lcom/google/zxing/common/PerspectiveTransform;->a12:F

    iget v5, p0, Lcom/google/zxing/common/PerspectiveTransform;->a33:F

    mul-float/2addr v4, v5

    sub-float v4, v0, v4

    .line 136
    iget v0, p0, Lcom/google/zxing/common/PerspectiveTransform;->a11:F

    iget v5, p0, Lcom/google/zxing/common/PerspectiveTransform;->a33:F

    mul-float/2addr v0, v5

    iget v5, p0, Lcom/google/zxing/common/PerspectiveTransform;->a13:F

    iget v6, p0, Lcom/google/zxing/common/PerspectiveTransform;->a31:F

    mul-float/2addr v5, v6

    sub-float v5, v0, v5

    .line 137
    iget v0, p0, Lcom/google/zxing/common/PerspectiveTransform;->a12:F

    iget v6, p0, Lcom/google/zxing/common/PerspectiveTransform;->a31:F

    mul-float/2addr v0, v6

    iget v6, p0, Lcom/google/zxing/common/PerspectiveTransform;->a11:F

    iget v7, p0, Lcom/google/zxing/common/PerspectiveTransform;->a32:F

    mul-float/2addr v6, v7

    sub-float v6, v0, v6

    .line 138
    iget v0, p0, Lcom/google/zxing/common/PerspectiveTransform;->a12:F

    iget v7, p0, Lcom/google/zxing/common/PerspectiveTransform;->a23:F

    mul-float/2addr v0, v7

    iget v7, p0, Lcom/google/zxing/common/PerspectiveTransform;->a13:F

    iget v8, p0, Lcom/google/zxing/common/PerspectiveTransform;->a22:F

    mul-float/2addr v7, v8

    sub-float v7, v0, v7

    .line 139
    iget v0, p0, Lcom/google/zxing/common/PerspectiveTransform;->a13:F

    iget v8, p0, Lcom/google/zxing/common/PerspectiveTransform;->a21:F

    mul-float/2addr v0, v8

    iget v8, p0, Lcom/google/zxing/common/PerspectiveTransform;->a11:F

    iget v9, p0, Lcom/google/zxing/common/PerspectiveTransform;->a23:F

    mul-float/2addr v8, v9

    sub-float v8, v0, v8

    .line 140
    iget v0, p0, Lcom/google/zxing/common/PerspectiveTransform;->a11:F

    iget v9, p0, Lcom/google/zxing/common/PerspectiveTransform;->a22:F

    mul-float/2addr v0, v9

    iget v9, p0, Lcom/google/zxing/common/PerspectiveTransform;->a12:F

    iget v11, p0, Lcom/google/zxing/common/PerspectiveTransform;->a21:F

    mul-float/2addr v9, v11

    sub-float v9, v0, v9

    .line 132
    move-object v0, v10

    invoke-direct/range {v0 .. v9}, Lcom/google/zxing/common/PerspectiveTransform;-><init>(FFFFFFFFF)V

    return-object v10
.end method

.method times(Lcom/google/zxing/common/PerspectiveTransform;)Lcom/google/zxing/common/PerspectiveTransform;
    .registers 14
    .param p1, "other"    # Lcom/google/zxing/common/PerspectiveTransform;

    .line 144
    new-instance v10, Lcom/google/zxing/common/PerspectiveTransform;

    iget v0, p0, Lcom/google/zxing/common/PerspectiveTransform;->a11:F

    iget v1, p1, Lcom/google/zxing/common/PerspectiveTransform;->a11:F

    mul-float/2addr v0, v1

    iget v1, p0, Lcom/google/zxing/common/PerspectiveTransform;->a21:F

    iget v2, p1, Lcom/google/zxing/common/PerspectiveTransform;->a12:F

    mul-float/2addr v1, v2

    add-float/2addr v0, v1

    iget v1, p0, Lcom/google/zxing/common/PerspectiveTransform;->a31:F

    iget v2, p1, Lcom/google/zxing/common/PerspectiveTransform;->a13:F

    mul-float/2addr v1, v2

    add-float/2addr v1, v0

    .line 145
    iget v0, p0, Lcom/google/zxing/common/PerspectiveTransform;->a11:F

    iget v2, p1, Lcom/google/zxing/common/PerspectiveTransform;->a21:F

    mul-float/2addr v0, v2

    iget v2, p0, Lcom/google/zxing/common/PerspectiveTransform;->a21:F

    iget v3, p1, Lcom/google/zxing/common/PerspectiveTransform;->a22:F

    mul-float/2addr v2, v3

    add-float/2addr v0, v2

    iget v2, p0, Lcom/google/zxing/common/PerspectiveTransform;->a31:F

    iget v3, p1, Lcom/google/zxing/common/PerspectiveTransform;->a23:F

    mul-float/2addr v2, v3

    add-float/2addr v2, v0

    .line 146
    iget v0, p0, Lcom/google/zxing/common/PerspectiveTransform;->a11:F

    iget v3, p1, Lcom/google/zxing/common/PerspectiveTransform;->a31:F

    mul-float/2addr v0, v3

    iget v3, p0, Lcom/google/zxing/common/PerspectiveTransform;->a21:F

    iget v4, p1, Lcom/google/zxing/common/PerspectiveTransform;->a32:F

    mul-float/2addr v3, v4

    add-float/2addr v0, v3

    iget v3, p0, Lcom/google/zxing/common/PerspectiveTransform;->a31:F

    iget v4, p1, Lcom/google/zxing/common/PerspectiveTransform;->a33:F

    mul-float/2addr v3, v4

    add-float/2addr v3, v0

    .line 147
    iget v0, p0, Lcom/google/zxing/common/PerspectiveTransform;->a12:F

    iget v4, p1, Lcom/google/zxing/common/PerspectiveTransform;->a11:F

    mul-float/2addr v0, v4

    iget v4, p0, Lcom/google/zxing/common/PerspectiveTransform;->a22:F

    iget v5, p1, Lcom/google/zxing/common/PerspectiveTransform;->a12:F

    mul-float/2addr v4, v5

    add-float/2addr v0, v4

    iget v4, p0, Lcom/google/zxing/common/PerspectiveTransform;->a32:F

    iget v5, p1, Lcom/google/zxing/common/PerspectiveTransform;->a13:F

    mul-float/2addr v4, v5

    add-float/2addr v4, v0

    .line 148
    iget v0, p0, Lcom/google/zxing/common/PerspectiveTransform;->a12:F

    iget v5, p1, Lcom/google/zxing/common/PerspectiveTransform;->a21:F

    mul-float/2addr v0, v5

    iget v5, p0, Lcom/google/zxing/common/PerspectiveTransform;->a22:F

    iget v6, p1, Lcom/google/zxing/common/PerspectiveTransform;->a22:F

    mul-float/2addr v5, v6

    add-float/2addr v0, v5

    iget v5, p0, Lcom/google/zxing/common/PerspectiveTransform;->a32:F

    iget v6, p1, Lcom/google/zxing/common/PerspectiveTransform;->a23:F

    mul-float/2addr v5, v6

    add-float/2addr v5, v0

    .line 149
    iget v0, p0, Lcom/google/zxing/common/PerspectiveTransform;->a12:F

    iget v6, p1, Lcom/google/zxing/common/PerspectiveTransform;->a31:F

    mul-float/2addr v0, v6

    iget v6, p0, Lcom/google/zxing/common/PerspectiveTransform;->a22:F

    iget v7, p1, Lcom/google/zxing/common/PerspectiveTransform;->a32:F

    mul-float/2addr v6, v7

    add-float/2addr v0, v6

    iget v6, p0, Lcom/google/zxing/common/PerspectiveTransform;->a32:F

    iget v7, p1, Lcom/google/zxing/common/PerspectiveTransform;->a33:F

    mul-float/2addr v6, v7

    add-float/2addr v6, v0

    .line 150
    iget v0, p0, Lcom/google/zxing/common/PerspectiveTransform;->a13:F

    iget v7, p1, Lcom/google/zxing/common/PerspectiveTransform;->a11:F

    mul-float/2addr v0, v7

    iget v7, p0, Lcom/google/zxing/common/PerspectiveTransform;->a23:F

    iget v8, p1, Lcom/google/zxing/common/PerspectiveTransform;->a12:F

    mul-float/2addr v7, v8

    add-float/2addr v0, v7

    iget v7, p0, Lcom/google/zxing/common/PerspectiveTransform;->a33:F

    iget v8, p1, Lcom/google/zxing/common/PerspectiveTransform;->a13:F

    mul-float/2addr v7, v8

    add-float/2addr v7, v0

    .line 151
    iget v0, p0, Lcom/google/zxing/common/PerspectiveTransform;->a13:F

    iget v8, p1, Lcom/google/zxing/common/PerspectiveTransform;->a21:F

    mul-float/2addr v0, v8

    iget v8, p0, Lcom/google/zxing/common/PerspectiveTransform;->a23:F

    iget v9, p1, Lcom/google/zxing/common/PerspectiveTransform;->a22:F

    mul-float/2addr v8, v9

    add-float/2addr v0, v8

    iget v8, p0, Lcom/google/zxing/common/PerspectiveTransform;->a33:F

    iget v9, p1, Lcom/google/zxing/common/PerspectiveTransform;->a23:F

    mul-float/2addr v8, v9

    add-float/2addr v8, v0

    .line 152
    iget v0, p0, Lcom/google/zxing/common/PerspectiveTransform;->a13:F

    iget v9, p1, Lcom/google/zxing/common/PerspectiveTransform;->a31:F

    mul-float/2addr v0, v9

    iget v9, p0, Lcom/google/zxing/common/PerspectiveTransform;->a23:F

    iget v11, p1, Lcom/google/zxing/common/PerspectiveTransform;->a32:F

    mul-float/2addr v9, v11

    add-float/2addr v0, v9

    iget v9, p0, Lcom/google/zxing/common/PerspectiveTransform;->a33:F

    iget v11, p1, Lcom/google/zxing/common/PerspectiveTransform;->a33:F

    mul-float/2addr v9, v11

    add-float/2addr v9, v0

    .line 144
    move-object v0, v10

    invoke-direct/range {v0 .. v9}, Lcom/google/zxing/common/PerspectiveTransform;-><init>(FFFFFFFFF)V

    return-object v10
.end method

.method public transformPoints([F)V
    .registers 21
    .param p1, "points"    # [F

    move-object/from16 v0, p0

    .line 67
    move-object/from16 v1, p1

    array-length v2, v1

    .line 68
    .local v2, "max":I
    iget v3, v0, Lcom/google/zxing/common/PerspectiveTransform;->a11:F

    .line 69
    .local v3, "a11":F
    iget v4, v0, Lcom/google/zxing/common/PerspectiveTransform;->a12:F

    .line 70
    .local v4, "a12":F
    iget v5, v0, Lcom/google/zxing/common/PerspectiveTransform;->a13:F

    .line 71
    .local v5, "a13":F
    iget v6, v0, Lcom/google/zxing/common/PerspectiveTransform;->a21:F

    .line 72
    .local v6, "a21":F
    iget v7, v0, Lcom/google/zxing/common/PerspectiveTransform;->a22:F

    .line 73
    .local v7, "a22":F
    iget v8, v0, Lcom/google/zxing/common/PerspectiveTransform;->a23:F

    .line 74
    .local v8, "a23":F
    iget v9, v0, Lcom/google/zxing/common/PerspectiveTransform;->a31:F

    .line 75
    .local v9, "a31":F
    iget v10, v0, Lcom/google/zxing/common/PerspectiveTransform;->a32:F

    .line 76
    .local v10, "a32":F
    iget v11, v0, Lcom/google/zxing/common/PerspectiveTransform;->a33:F

    .line 77
    .local v11, "a33":F
    const/4 v12, 0x0

    .local v12, "i":I
    :goto_18
    if-lt v12, v2, :cond_1b

    .line 84
    .end local v12    # "i":I
    return-void

    .line 78
    .restart local v12    # "i":I
    :cond_1b
    aget v13, v1, v12

    .line 79
    .local v13, "x":F
    add-int/lit8 v14, v12, 0x1

    aget v14, v1, v14

    .line 80
    .local v14, "y":F
    mul-float v15, v5, v13

    mul-float v16, v8, v14

    add-float v15, v15, v16

    add-float/2addr v15, v11

    .line 81
    .local v15, "denominator":F
    mul-float v16, v3, v13

    mul-float v17, v6, v14

    add-float v16, v16, v17

    add-float v16, v16, v9

    div-float v16, v16, v15

    aput v16, v1, v12

    .line 82
    add-int/lit8 v16, v12, 0x1

    mul-float v17, v4, v13

    mul-float v18, v7, v14

    add-float v17, v17, v18

    add-float v17, v17, v10

    div-float v17, v17, v15

    aput v17, v1, v16

    .line 77
    .end local v13    # "x":F
    .end local v14    # "y":F
    .end local v15    # "denominator":F
    add-int/lit8 v12, v12, 0x2

    goto :goto_18
.end method

.method public transformPoints([F[F)V
    .registers 10
    .param p1, "xValues"    # [F
    .param p2, "yValues"    # [F

    .line 87
    array-length v0, p1

    .line 88
    .local v0, "n":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_2
    if-lt v1, v0, :cond_5

    .line 95
    .end local v1    # "i":I
    return-void

    .line 89
    .restart local v1    # "i":I
    :cond_5
    aget v2, p1, v1

    .line 90
    .local v2, "x":F
    aget v3, p2, v1

    .line 91
    .local v3, "y":F
    iget v4, p0, Lcom/google/zxing/common/PerspectiveTransform;->a13:F

    mul-float/2addr v4, v2

    iget v5, p0, Lcom/google/zxing/common/PerspectiveTransform;->a23:F

    mul-float/2addr v5, v3

    add-float/2addr v4, v5

    iget v5, p0, Lcom/google/zxing/common/PerspectiveTransform;->a33:F

    add-float/2addr v4, v5

    .line 92
    .local v4, "denominator":F
    iget v5, p0, Lcom/google/zxing/common/PerspectiveTransform;->a11:F

    mul-float/2addr v5, v2

    iget v6, p0, Lcom/google/zxing/common/PerspectiveTransform;->a21:F

    mul-float/2addr v6, v3

    add-float/2addr v5, v6

    iget v6, p0, Lcom/google/zxing/common/PerspectiveTransform;->a31:F

    add-float/2addr v5, v6

    div-float/2addr v5, v4

    aput v5, p1, v1

    .line 93
    iget v5, p0, Lcom/google/zxing/common/PerspectiveTransform;->a12:F

    mul-float/2addr v5, v2

    iget v6, p0, Lcom/google/zxing/common/PerspectiveTransform;->a22:F

    mul-float/2addr v6, v3

    add-float/2addr v5, v6

    iget v6, p0, Lcom/google/zxing/common/PerspectiveTransform;->a32:F

    add-float/2addr v5, v6

    div-float/2addr v5, v4

    aput v5, p2, v1

    .line 88
    .end local v2    # "x":F
    .end local v3    # "y":F
    .end local v4    # "denominator":F
    add-int/lit8 v1, v1, 0x1

    goto :goto_2
.end method
