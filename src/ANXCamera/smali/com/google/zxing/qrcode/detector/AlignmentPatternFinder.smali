.class final Lcom/google/zxing/qrcode/detector/AlignmentPatternFinder;
.super Ljava/lang/Object;
.source "AlignmentPatternFinder.java"


# instance fields
.field private final crossCheckStateCount:[I

.field private final height:I

.field private final image:Lcom/google/zxing/common/BitMatrix;

.field private final moduleSize:F

.field private final possibleCenters:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/google/zxing/qrcode/detector/AlignmentPattern;",
            ">;"
        }
    .end annotation
.end field

.field private final resultPointCallback:Lcom/google/zxing/ResultPointCallback;

.field private final startX:I

.field private final startY:I

.field private final width:I


# direct methods
.method constructor <init>(Lcom/google/zxing/common/BitMatrix;IIIIFLcom/google/zxing/ResultPointCallback;)V
    .locals 2
    .param p1, "image"    # Lcom/google/zxing/common/BitMatrix;
    .param p2, "startX"    # I
    .param p3, "startY"    # I
    .param p4, "width"    # I
    .param p5, "height"    # I
    .param p6, "moduleSize"    # F
    .param p7, "resultPointCallback"    # Lcom/google/zxing/ResultPointCallback;

    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 69
    iput-object p1, p0, Lcom/google/zxing/qrcode/detector/AlignmentPatternFinder;->image:Lcom/google/zxing/common/BitMatrix;

    .line 70
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/google/zxing/qrcode/detector/AlignmentPatternFinder;->possibleCenters:Ljava/util/List;

    .line 71
    iput p2, p0, Lcom/google/zxing/qrcode/detector/AlignmentPatternFinder;->startX:I

    .line 72
    iput p3, p0, Lcom/google/zxing/qrcode/detector/AlignmentPatternFinder;->startY:I

    .line 73
    iput p4, p0, Lcom/google/zxing/qrcode/detector/AlignmentPatternFinder;->width:I

    .line 74
    iput p5, p0, Lcom/google/zxing/qrcode/detector/AlignmentPatternFinder;->height:I

    .line 75
    iput p6, p0, Lcom/google/zxing/qrcode/detector/AlignmentPatternFinder;->moduleSize:F

    .line 76
    const/4 v0, 0x3

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/google/zxing/qrcode/detector/AlignmentPatternFinder;->crossCheckStateCount:[I

    .line 77
    iput-object p7, p0, Lcom/google/zxing/qrcode/detector/AlignmentPatternFinder;->resultPointCallback:Lcom/google/zxing/ResultPointCallback;

    .line 78
    return-void
.end method

.method private static centerFromEnd([II)F
    .locals 3
    .param p0, "stateCount"    # [I
    .param p1, "end"    # I

    .line 161
    const/4 v0, 0x2

    aget v0, p0, v0

    sub-int v0, p1, v0

    int-to-float v0, v0

    const/4 v1, 0x1

    aget v1, p0, v1

    int-to-float v1, v1

    const/high16 v2, 0x40000000    # 2.0f

    div-float/2addr v1, v2

    sub-float/2addr v0, v1

    return v0
.end method

.method private crossCheckVertical(IIII)F
    .locals 9
    .param p1, "startI"    # I
    .param p2, "centerJ"    # I
    .param p3, "maxCount"    # I
    .param p4, "originalStateCountTotal"    # I

    .line 193
    iget-object v0, p0, Lcom/google/zxing/qrcode/detector/AlignmentPatternFinder;->image:Lcom/google/zxing/common/BitMatrix;

    .line 195
    .local v0, "image":Lcom/google/zxing/common/BitMatrix;
    invoke-virtual {v0}, Lcom/google/zxing/common/BitMatrix;->getHeight()I

    move-result v1

    .line 196
    .local v1, "maxI":I
    iget-object v2, p0, Lcom/google/zxing/qrcode/detector/AlignmentPatternFinder;->crossCheckStateCount:[I

    .line 197
    .local v2, "stateCount":[I
    const/4 v3, 0x0

    aput v3, v2, v3

    .line 198
    const/4 v4, 0x1

    aput v3, v2, v4

    .line 199
    const/4 v5, 0x2

    aput v3, v2, v5

    .line 202
    move v6, p1

    .line 203
    .local v6, "i":I
    :goto_0
    if-ltz v6, :cond_1

    invoke-virtual {v0, p2, v6}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v7

    if-eqz v7, :cond_1

    aget v7, v2, v4

    if-le v7, p3, :cond_0

    goto :goto_1

    .line 204
    :cond_0
    aget v7, v2, v4

    add-int/2addr v7, v4

    aput v7, v2, v4

    .line 205
    add-int/lit8 v6, v6, -0x1

    goto :goto_0

    .line 208
    :cond_1
    :goto_1
    const/high16 v7, 0x7fc00000    # NaNf

    if-ltz v6, :cond_f

    aget v8, v2, v4

    if-le v8, p3, :cond_2

    goto/16 :goto_9

    .line 211
    :cond_2
    :goto_2
    if-ltz v6, :cond_4

    invoke-virtual {v0, p2, v6}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v8

    if-nez v8, :cond_4

    aget v8, v2, v3

    if-le v8, p3, :cond_3

    goto :goto_3

    .line 212
    :cond_3
    aget v8, v2, v3

    add-int/2addr v8, v4

    aput v8, v2, v3

    .line 213
    add-int/lit8 v6, v6, -0x1

    goto :goto_2

    .line 215
    :cond_4
    :goto_3
    aget v8, v2, v3

    if-le v8, p3, :cond_5

    .line 216
    return v7

    .line 220
    :cond_5
    add-int/lit8 v6, p1, 0x1

    .line 221
    :goto_4
    if-ge v6, v1, :cond_7

    invoke-virtual {v0, p2, v6}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v8

    if-eqz v8, :cond_7

    aget v8, v2, v4

    if-le v8, p3, :cond_6

    goto :goto_5

    .line 222
    :cond_6
    aget v8, v2, v4

    add-int/2addr v8, v4

    aput v8, v2, v4

    .line 223
    add-int/lit8 v6, v6, 0x1

    goto :goto_4

    .line 225
    :cond_7
    :goto_5
    if-eq v6, v1, :cond_e

    aget v8, v2, v4

    if-le v8, p3, :cond_8

    goto :goto_8

    .line 228
    :cond_8
    :goto_6
    if-ge v6, v1, :cond_a

    invoke-virtual {v0, p2, v6}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v8

    if-nez v8, :cond_a

    aget v8, v2, v5

    if-le v8, p3, :cond_9

    goto :goto_7

    .line 229
    :cond_9
    aget v8, v2, v5

    add-int/2addr v8, v4

    aput v8, v2, v5

    .line 230
    add-int/lit8 v6, v6, 0x1

    goto :goto_6

    .line 232
    :cond_a
    :goto_7
    aget v8, v2, v5

    if-le v8, p3, :cond_b

    .line 233
    return v7

    .line 236
    :cond_b
    aget v3, v2, v3

    aget v4, v2, v4

    add-int/2addr v3, v4

    aget v4, v2, v5

    add-int/2addr v3, v4

    .line 237
    .local v3, "stateCountTotal":I
    const/4 v4, 0x5

    sub-int v8, v3, p4

    invoke-static {v8}, Ljava/lang/Math;->abs(I)I

    move-result v8

    mul-int/2addr v4, v8

    mul-int/2addr v5, p4

    if-lt v4, v5, :cond_c

    .line 238
    return v7

    .line 241
    :cond_c
    invoke-direct {p0, v2}, Lcom/google/zxing/qrcode/detector/AlignmentPatternFinder;->foundPatternCross([I)Z

    move-result v4

    if-eqz v4, :cond_d

    invoke-static {v2, v6}, Lcom/google/zxing/qrcode/detector/AlignmentPatternFinder;->centerFromEnd([II)F

    move-result v7

    nop

    :cond_d
    return v7

    .line 226
    .end local v3    # "stateCountTotal":I
    :cond_e
    :goto_8
    return v7

    .line 209
    :cond_f
    :goto_9
    return v7
.end method

.method private foundPatternCross([I)Z
    .locals 4
    .param p1, "stateCount"    # [I

    .line 170
    iget v0, p0, Lcom/google/zxing/qrcode/detector/AlignmentPatternFinder;->moduleSize:F

    .line 171
    .local v0, "moduleSize":F
    const/high16 v1, 0x40000000    # 2.0f

    div-float v1, v0, v1

    .line 172
    .local v1, "maxVariance":F
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    const/4 v3, 0x3

    if-lt v2, v3, :cond_0

    .line 177
    .end local v2    # "i":I
    const/4 v2, 0x1

    return v2

    .line 173
    .restart local v2    # "i":I
    :cond_0
    aget v3, p1, v2

    int-to-float v3, v3

    sub-float v3, v0, v3

    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v3

    cmpl-float v3, v3, v1

    if-ltz v3, :cond_1

    .line 174
    const/4 v3, 0x0

    return v3

    .line 172
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method private handlePossibleCenter([III)Lcom/google/zxing/qrcode/detector/AlignmentPattern;
    .locals 7
    .param p1, "stateCount"    # [I
    .param p2, "i"    # I
    .param p3, "j"    # I

    .line 256
    const/4 v0, 0x0

    aget v1, p1, v0

    const/4 v2, 0x1

    aget v3, p1, v2

    add-int/2addr v1, v3

    const/4 v3, 0x2

    aget v4, p1, v3

    add-int/2addr v1, v4

    .line 257
    .local v1, "stateCountTotal":I
    invoke-static {p1, p3}, Lcom/google/zxing/qrcode/detector/AlignmentPatternFinder;->centerFromEnd([II)F

    move-result v4

    .line 258
    .local v4, "centerJ":F
    float-to-int v5, v4

    aget v6, p1, v2

    mul-int/2addr v6, v3

    invoke-direct {p0, p2, v5, v6, v1}, Lcom/google/zxing/qrcode/detector/AlignmentPatternFinder;->crossCheckVertical(IIII)F

    move-result v5

    .line 259
    .local v5, "centerI":F
    invoke-static {v5}, Ljava/lang/Float;->isNaN(F)Z

    move-result v6

    if-nez v6, :cond_2

    .line 260
    aget v0, p1, v0

    aget v2, p1, v2

    add-int/2addr v0, v2

    aget v2, p1, v3

    add-int/2addr v0, v2

    int-to-float v0, v0

    const/high16 v2, 0x40400000    # 3.0f

    div-float/2addr v0, v2

    .line 261
    .local v0, "estimatedModuleSize":F
    iget-object v2, p0, Lcom/google/zxing/qrcode/detector/AlignmentPatternFinder;->possibleCenters:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_1

    .line 268
    new-instance v2, Lcom/google/zxing/qrcode/detector/AlignmentPattern;

    invoke-direct {v2, v4, v5, v0}, Lcom/google/zxing/qrcode/detector/AlignmentPattern;-><init>(FFF)V

    .line 269
    .local v2, "point":Lcom/google/zxing/qrcode/detector/AlignmentPattern;
    iget-object v3, p0, Lcom/google/zxing/qrcode/detector/AlignmentPatternFinder;->possibleCenters:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 270
    iget-object v3, p0, Lcom/google/zxing/qrcode/detector/AlignmentPatternFinder;->resultPointCallback:Lcom/google/zxing/ResultPointCallback;

    if-eqz v3, :cond_2

    .line 271
    iget-object v3, p0, Lcom/google/zxing/qrcode/detector/AlignmentPatternFinder;->resultPointCallback:Lcom/google/zxing/ResultPointCallback;

    invoke-interface {v3, v2}, Lcom/google/zxing/ResultPointCallback;->foundPossibleResultPoint(Lcom/google/zxing/ResultPoint;)V

    .end local v0    # "estimatedModuleSize":F
    .end local v2    # "point":Lcom/google/zxing/qrcode/detector/AlignmentPattern;
    goto :goto_0

    .line 261
    .restart local v0    # "estimatedModuleSize":F
    :cond_1
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/zxing/qrcode/detector/AlignmentPattern;

    .line 263
    .local v3, "center":Lcom/google/zxing/qrcode/detector/AlignmentPattern;
    invoke-virtual {v3, v0, v5, v4}, Lcom/google/zxing/qrcode/detector/AlignmentPattern;->aboutEquals(FFF)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 264
    invoke-virtual {v3, v5, v4, v0}, Lcom/google/zxing/qrcode/detector/AlignmentPattern;->combineEstimate(FFF)Lcom/google/zxing/qrcode/detector/AlignmentPattern;

    move-result-object v2

    return-object v2

    .line 274
    .end local v0    # "estimatedModuleSize":F
    .end local v3    # "center":Lcom/google/zxing/qrcode/detector/AlignmentPattern;
    :cond_2
    :goto_0
    const/4 v0, 0x0

    return-object v0
.end method


# virtual methods
.method find()Lcom/google/zxing/qrcode/detector/AlignmentPattern;
    .locals 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .line 88
    iget v0, p0, Lcom/google/zxing/qrcode/detector/AlignmentPatternFinder;->startX:I

    .line 89
    .local v0, "startX":I
    iget v1, p0, Lcom/google/zxing/qrcode/detector/AlignmentPatternFinder;->height:I

    .line 90
    .local v1, "height":I
    iget v2, p0, Lcom/google/zxing/qrcode/detector/AlignmentPatternFinder;->width:I

    add-int/2addr v2, v0

    .line 91
    .local v2, "maxJ":I
    iget v3, p0, Lcom/google/zxing/qrcode/detector/AlignmentPatternFinder;->startY:I

    div-int/lit8 v4, v1, 0x2

    add-int/2addr v3, v4

    .line 94
    .local v3, "middleI":I
    const/4 v4, 0x3

    new-array v4, v4, [I

    .line 95
    .local v4, "stateCount":[I
    const/4 v5, 0x0

    .local v5, "iGen":I
    :goto_0
    const/4 v6, 0x0

    if-lt v5, v1, :cond_1

    .line 149
    .end local v5    # "iGen":I
    iget-object v5, p0, Lcom/google/zxing/qrcode/detector/AlignmentPatternFinder;->possibleCenters:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_0

    .line 150
    iget-object v5, p0, Lcom/google/zxing/qrcode/detector/AlignmentPatternFinder;->possibleCenters:Ljava/util/List;

    invoke-interface {v5, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/google/zxing/qrcode/detector/AlignmentPattern;

    return-object v5

    .line 153
    :cond_0
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v5

    throw v5

    .line 97
    .restart local v5    # "iGen":I
    :cond_1
    and-int/lit8 v7, v5, 0x1

    const/4 v8, 0x2

    if-nez v7, :cond_2

    add-int/lit8 v7, v5, 0x1

    div-int/2addr v7, v8

    goto :goto_1

    :cond_2
    add-int/lit8 v7, v5, 0x1

    div-int/2addr v7, v8

    neg-int v7, v7

    :goto_1
    add-int/2addr v7, v3

    .line 98
    .local v7, "i":I
    aput v6, v4, v6

    .line 99
    const/4 v9, 0x1

    aput v6, v4, v9

    .line 100
    aput v6, v4, v8

    .line 101
    move v10, v0

    .line 105
    .local v10, "j":I
    :goto_2
    if-ge v10, v2, :cond_4

    iget-object v11, p0, Lcom/google/zxing/qrcode/detector/AlignmentPatternFinder;->image:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v11, v10, v7}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v11

    if-eqz v11, :cond_3

    goto :goto_3

    .line 106
    :cond_3
    add-int/lit8 v10, v10, 0x1

    goto :goto_2

    .line 108
    :cond_4
    :goto_3
    const/4 v11, 0x0

    .line 109
    .local v11, "currentState":I
    :goto_4
    if-lt v10, v2, :cond_6

    .line 138
    invoke-direct {p0, v4}, Lcom/google/zxing/qrcode/detector/AlignmentPatternFinder;->foundPatternCross([I)Z

    move-result v6

    if-eqz v6, :cond_5

    .line 139
    invoke-direct {p0, v4, v7, v2}, Lcom/google/zxing/qrcode/detector/AlignmentPatternFinder;->handlePossibleCenter([III)Lcom/google/zxing/qrcode/detector/AlignmentPattern;

    move-result-object v6

    .line 140
    .local v6, "confirmed":Lcom/google/zxing/qrcode/detector/AlignmentPattern;
    if-eqz v6, :cond_5

    .line 141
    return-object v6

    .line 95
    .end local v6    # "confirmed":Lcom/google/zxing/qrcode/detector/AlignmentPattern;
    .end local v7    # "i":I
    .end local v10    # "j":I
    .end local v11    # "currentState":I
    :cond_5
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 110
    .restart local v7    # "i":I
    .restart local v10    # "j":I
    .restart local v11    # "currentState":I
    :cond_6
    iget-object v12, p0, Lcom/google/zxing/qrcode/detector/AlignmentPatternFinder;->image:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v12, v10, v7}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v12

    if-eqz v12, :cond_a

    .line 112
    if-ne v11, v9, :cond_7

    .line 113
    aget v12, v4, v11

    add-int/2addr v12, v9

    aput v12, v4, v11

    .line 114
    goto :goto_5

    .line 115
    :cond_7
    if-ne v11, v8, :cond_9

    .line 116
    invoke-direct {p0, v4}, Lcom/google/zxing/qrcode/detector/AlignmentPatternFinder;->foundPatternCross([I)Z

    move-result v12

    if-eqz v12, :cond_8

    .line 117
    invoke-direct {p0, v4, v7, v10}, Lcom/google/zxing/qrcode/detector/AlignmentPatternFinder;->handlePossibleCenter([III)Lcom/google/zxing/qrcode/detector/AlignmentPattern;

    move-result-object v12

    .line 118
    .local v12, "confirmed":Lcom/google/zxing/qrcode/detector/AlignmentPattern;
    if-eqz v12, :cond_8

    .line 119
    return-object v12

    .line 122
    .end local v12    # "confirmed":Lcom/google/zxing/qrcode/detector/AlignmentPattern;
    :cond_8
    aget v12, v4, v8

    aput v12, v4, v6

    .line 123
    aput v9, v4, v9

    .line 124
    aput v6, v4, v8

    .line 125
    const/4 v11, 0x1

    .line 126
    goto :goto_5

    .line 127
    :cond_9
    add-int/lit8 v11, v11, 0x1

    aget v12, v4, v11

    add-int/2addr v12, v9

    aput v12, v4, v11

    .line 130
    goto :goto_5

    .line 131
    :cond_a
    if-ne v11, v9, :cond_b

    .line 132
    add-int/lit8 v11, v11, 0x1

    .line 134
    :cond_b
    aget v12, v4, v11

    add-int/2addr v12, v9

    aput v12, v4, v11

    .line 136
    :goto_5
    add-int/lit8 v10, v10, 0x1

    goto :goto_4
.end method
