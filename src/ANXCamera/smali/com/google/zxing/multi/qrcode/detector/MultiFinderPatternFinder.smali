.class final Lcom/google/zxing/multi/qrcode/detector/MultiFinderPatternFinder;
.super Lcom/google/zxing/qrcode/detector/FinderPatternFinder;
.source "MultiFinderPatternFinder.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/zxing/multi/qrcode/detector/MultiFinderPatternFinder$ModuleSizeComparator;
    }
.end annotation


# static fields
.field private static final DIFF_MODSIZE_CUTOFF:F = 0.5f

.field private static final DIFF_MODSIZE_CUTOFF_PERCENT:F = 0.05f

.field private static final EMPTY_RESULT_ARRAY:[Lcom/google/zxing/qrcode/detector/FinderPatternInfo;

.field private static final MAX_MODULE_COUNT_PER_EDGE:F = 180.0f

.field private static final MIN_MODULE_COUNT_PER_EDGE:F = 9.0f


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 51
    const/4 v0, 0x0

    new-array v0, v0, [Lcom/google/zxing/qrcode/detector/FinderPatternInfo;

    sput-object v0, Lcom/google/zxing/multi/qrcode/detector/MultiFinderPatternFinder;->EMPTY_RESULT_ARRAY:[Lcom/google/zxing/qrcode/detector/FinderPatternInfo;

    .line 73
    return-void
.end method

.method constructor <init>(Lcom/google/zxing/common/BitMatrix;)V
    .registers 2
    .param p1, "image"    # Lcom/google/zxing/common/BitMatrix;

    .line 93
    invoke-direct {p0, p1}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;-><init>(Lcom/google/zxing/common/BitMatrix;)V

    .line 94
    return-void
.end method

.method constructor <init>(Lcom/google/zxing/common/BitMatrix;Lcom/google/zxing/ResultPointCallback;)V
    .registers 3
    .param p1, "image"    # Lcom/google/zxing/common/BitMatrix;
    .param p2, "resultPointCallback"    # Lcom/google/zxing/ResultPointCallback;

    .line 97
    invoke-direct {p0, p1, p2}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;-><init>(Lcom/google/zxing/common/BitMatrix;Lcom/google/zxing/ResultPointCallback;)V

    .line 98
    return-void
.end method

.method private selectMutipleBestPatterns()[[Lcom/google/zxing/qrcode/detector/FinderPattern;
    .registers 29
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .line 107
    invoke-virtual/range {p0 .. p0}, Lcom/google/zxing/multi/qrcode/detector/MultiFinderPatternFinder;->getPossibleCenters()Ljava/util/List;

    move-result-object v0

    .line 108
    .local v0, "possibleCenters":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/qrcode/detector/FinderPattern;>;"
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    .line 110
    .local v1, "size":I
    const/4 v2, 0x3

    if-lt v1, v2, :cond_19e

    .line 118
    const/4 v3, 0x2

    const/4 v4, 0x0

    const/4 v5, 0x1

    if-ne v1, v2, :cond_2f

    .line 119
    new-array v6, v5, [[Lcom/google/zxing/qrcode/detector/FinderPattern;

    .line 120
    new-array v2, v2, [Lcom/google/zxing/qrcode/detector/FinderPattern;

    .line 121
    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/google/zxing/qrcode/detector/FinderPattern;

    aput-object v7, v2, v4

    .line 122
    invoke-interface {v0, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/google/zxing/qrcode/detector/FinderPattern;

    aput-object v7, v2, v5

    .line 123
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/google/zxing/qrcode/detector/FinderPattern;

    aput-object v5, v2, v3

    aput-object v2, v6, v4

    .line 119
    return-object v6

    .line 129
    :cond_2f
    new-instance v6, Lcom/google/zxing/multi/qrcode/detector/MultiFinderPatternFinder$ModuleSizeComparator;

    const/4 v7, 0x0

    invoke-direct {v6, v7}, Lcom/google/zxing/multi/qrcode/detector/MultiFinderPatternFinder$ModuleSizeComparator;-><init>(Lcom/google/zxing/multi/qrcode/detector/MultiFinderPatternFinder$ModuleSizeComparator;)V

    invoke-static {v0, v6}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 146
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 148
    .local v6, "results":Ljava/util/List;, "Ljava/util/List<[Lcom/google/zxing/qrcode/detector/FinderPattern;>;"
    const/4 v7, 0x0

    .local v7, "i1":I
    :goto_3e
    add-int/lit8 v8, v1, -0x2

    if-lt v7, v8, :cond_5a

    .line 223
    .end local v7    # "i1":I
    invoke-interface {v6}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_55

    .line 224
    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v2

    new-array v2, v2, [[Lcom/google/zxing/qrcode/detector/FinderPattern;

    invoke-interface {v6, v2}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [[Lcom/google/zxing/qrcode/detector/FinderPattern;

    return-object v2

    .line 228
    :cond_55
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v2

    throw v2

    .line 149
    .restart local v7    # "i1":I
    :cond_5a
    invoke-interface {v0, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/google/zxing/qrcode/detector/FinderPattern;

    .line 150
    .local v8, "p1":Lcom/google/zxing/qrcode/detector/FinderPattern;
    if-nez v8, :cond_63

    .line 151
    goto :goto_a5

    .line 154
    :cond_63
    add-int/lit8 v9, v7, 0x1

    .local v9, "i2":I
    :goto_65
    add-int/lit8 v10, v1, -0x1

    if-lt v9, v10, :cond_6a

    .end local v8    # "p1":Lcom/google/zxing/qrcode/detector/FinderPattern;
    .end local v9    # "i2":I
    goto :goto_a5

    .line 155
    .restart local v8    # "p1":Lcom/google/zxing/qrcode/detector/FinderPattern;
    .restart local v9    # "i2":I
    :cond_6a
    invoke-interface {v0, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/google/zxing/qrcode/detector/FinderPattern;

    .line 156
    .local v10, "p2":Lcom/google/zxing/qrcode/detector/FinderPattern;
    if-nez v10, :cond_74

    .line 157
    goto/16 :goto_f2

    .line 161
    :cond_74
    invoke-virtual {v8}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getEstimatedModuleSize()F

    move-result v11

    invoke-virtual {v10}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getEstimatedModuleSize()F

    move-result v12

    sub-float/2addr v11, v12

    .line 162
    invoke-virtual {v8}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getEstimatedModuleSize()F

    move-result v12

    invoke-virtual {v10}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getEstimatedModuleSize()F

    move-result v13

    invoke-static {v12, v13}, Ljava/lang/Math;->min(FF)F

    move-result v12

    .line 161
    div-float/2addr v11, v12

    .line 163
    .local v11, "vModSize12":F
    invoke-virtual {v8}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getEstimatedModuleSize()F

    move-result v12

    invoke-virtual {v10}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getEstimatedModuleSize()F

    move-result v13

    sub-float/2addr v12, v13

    invoke-static {v12}, Ljava/lang/Math;->abs(F)F

    move-result v12

    .line 164
    .local v12, "vModSize12A":F
    const/high16 v13, 0x3f000000    # 0.5f

    cmpl-float v14, v12, v13

    const v15, 0x3d4ccccd    # 0.05f

    if-lez v14, :cond_a8

    cmpl-float v14, v11, v15

    if-ltz v14, :cond_a8

    .line 167
    nop

    .line 148
    .end local v8    # "p1":Lcom/google/zxing/qrcode/detector/FinderPattern;
    .end local v9    # "i2":I
    .end local v10    # "p2":Lcom/google/zxing/qrcode/detector/FinderPattern;
    .end local v11    # "vModSize12":F
    .end local v12    # "vModSize12A":F
    :goto_a5
    add-int/lit8 v7, v7, 0x1

    goto :goto_3e

    .line 170
    .restart local v8    # "p1":Lcom/google/zxing/qrcode/detector/FinderPattern;
    .restart local v9    # "i2":I
    .restart local v10    # "p2":Lcom/google/zxing/qrcode/detector/FinderPattern;
    .restart local v11    # "vModSize12":F
    .restart local v12    # "vModSize12A":F
    :cond_a8
    add-int/lit8 v14, v9, 0x1

    .local v14, "i3":I
    :goto_aa
    if-lt v14, v1, :cond_ad

    .end local v10    # "p2":Lcom/google/zxing/qrcode/detector/FinderPattern;
    .end local v11    # "vModSize12":F
    .end local v12    # "vModSize12A":F
    .end local v14    # "i3":I
    goto :goto_f2

    .line 171
    .restart local v10    # "p2":Lcom/google/zxing/qrcode/detector/FinderPattern;
    .restart local v11    # "vModSize12":F
    .restart local v12    # "vModSize12A":F
    .restart local v14    # "i3":I
    :cond_ad
    invoke-interface {v0, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v16

    move-object/from16 v3, v16

    check-cast v3, Lcom/google/zxing/qrcode/detector/FinderPattern;

    .line 172
    .local v3, "p3":Lcom/google/zxing/qrcode/detector/FinderPattern;
    if-nez v3, :cond_c4

    .line 173
    nop

    .line 170
    move-object/from16 v21, v0

    move/from16 v22, v1

    move/from16 v18, v4

    move/from16 v19, v5

    const/16 v17, 0x2

    goto/16 :goto_18a

    .line 177
    :cond_c4
    invoke-virtual {v10}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getEstimatedModuleSize()F

    move-result v16

    invoke-virtual {v3}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getEstimatedModuleSize()F

    move-result v18

    sub-float v16, v16, v18

    .line 178
    invoke-virtual {v10}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getEstimatedModuleSize()F

    move-result v5

    invoke-virtual {v3}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getEstimatedModuleSize()F

    move-result v4

    invoke-static {v5, v4}, Ljava/lang/Math;->min(FF)F

    move-result v4

    .line 177
    div-float v16, v16, v4

    .line 179
    .local v16, "vModSize23":F
    invoke-virtual {v10}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getEstimatedModuleSize()F

    move-result v4

    invoke-virtual {v3}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getEstimatedModuleSize()F

    move-result v5

    sub-float/2addr v4, v5

    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v4

    .line 180
    .local v4, "vModSize23A":F
    cmpl-float v5, v4, v13

    if-lez v5, :cond_f9

    cmpl-float v5, v16, v15

    if-ltz v5, :cond_f9

    .line 183
    nop

    .line 154
    .end local v3    # "p3":Lcom/google/zxing/qrcode/detector/FinderPattern;
    .end local v4    # "vModSize23A":F
    .end local v10    # "p2":Lcom/google/zxing/qrcode/detector/FinderPattern;
    .end local v11    # "vModSize12":F
    .end local v12    # "vModSize12A":F
    .end local v14    # "i3":I
    .end local v16    # "vModSize23":F
    :goto_f2
    add-int/lit8 v9, v9, 0x1

    const/4 v3, 0x2

    const/4 v4, 0x0

    const/4 v5, 0x1

    goto/16 :goto_65

    .line 186
    .restart local v3    # "p3":Lcom/google/zxing/qrcode/detector/FinderPattern;
    .restart local v4    # "vModSize23A":F
    .restart local v10    # "p2":Lcom/google/zxing/qrcode/detector/FinderPattern;
    .restart local v11    # "vModSize12":F
    .restart local v12    # "vModSize12A":F
    .restart local v14    # "i3":I
    .restart local v16    # "vModSize23":F
    :cond_f9
    new-array v5, v2, [Lcom/google/zxing/qrcode/detector/FinderPattern;

    const/16 v18, 0x0

    aput-object v8, v5, v18

    const/16 v19, 0x1

    aput-object v10, v5, v19

    const/16 v17, 0x2

    aput-object v3, v5, v17

    .line 187
    .local v5, "test":[Lcom/google/zxing/qrcode/detector/FinderPattern;
    invoke-static {v5}, Lcom/google/zxing/ResultPoint;->orderBestPatterns([Lcom/google/zxing/ResultPoint;)V

    .line 190
    new-instance v2, Lcom/google/zxing/qrcode/detector/FinderPatternInfo;

    invoke-direct {v2, v5}, Lcom/google/zxing/qrcode/detector/FinderPatternInfo;-><init>([Lcom/google/zxing/qrcode/detector/FinderPattern;)V

    .line 191
    .local v2, "info":Lcom/google/zxing/qrcode/detector/FinderPatternInfo;
    invoke-virtual {v2}, Lcom/google/zxing/qrcode/detector/FinderPatternInfo;->getTopLeft()Lcom/google/zxing/qrcode/detector/FinderPattern;

    move-result-object v13

    invoke-virtual {v2}, Lcom/google/zxing/qrcode/detector/FinderPatternInfo;->getBottomLeft()Lcom/google/zxing/qrcode/detector/FinderPattern;

    move-result-object v15

    invoke-static {v13, v15}, Lcom/google/zxing/ResultPoint;->distance(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)F

    move-result v13

    .line 192
    .local v13, "dA":F
    invoke-virtual {v2}, Lcom/google/zxing/qrcode/detector/FinderPatternInfo;->getTopRight()Lcom/google/zxing/qrcode/detector/FinderPattern;

    move-result-object v15

    move-object/from16 v21, v0

    invoke-virtual {v2}, Lcom/google/zxing/qrcode/detector/FinderPatternInfo;->getBottomLeft()Lcom/google/zxing/qrcode/detector/FinderPattern;

    move-result-object v0

    .end local v0    # "possibleCenters":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/qrcode/detector/FinderPattern;>;"
    .local v21, "possibleCenters":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/qrcode/detector/FinderPattern;>;"
    invoke-static {v15, v0}, Lcom/google/zxing/ResultPoint;->distance(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)F

    move-result v0

    .line 193
    .local v0, "dC":F
    invoke-virtual {v2}, Lcom/google/zxing/qrcode/detector/FinderPatternInfo;->getTopLeft()Lcom/google/zxing/qrcode/detector/FinderPattern;

    move-result-object v15

    move/from16 v22, v1

    invoke-virtual {v2}, Lcom/google/zxing/qrcode/detector/FinderPatternInfo;->getTopRight()Lcom/google/zxing/qrcode/detector/FinderPattern;

    move-result-object v1

    .end local v1    # "size":I
    .local v22, "size":I
    invoke-static {v15, v1}, Lcom/google/zxing/ResultPoint;->distance(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)F

    move-result v1

    .line 196
    .local v1, "dB":F
    add-float v15, v13, v1

    invoke-virtual {v8}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getEstimatedModuleSize()F

    move-result v20

    const/high16 v23, 0x40000000    # 2.0f

    mul-float v20, v20, v23

    div-float v15, v15, v20

    .line 197
    .local v15, "estimatedModuleCount":F
    const/high16 v20, 0x43340000    # 180.0f

    cmpl-float v20, v15, v20

    if-gtz v20, :cond_18a

    .line 198
    const/high16 v20, 0x41100000    # 9.0f

    cmpg-float v20, v15, v20

    if-gez v20, :cond_150

    .line 199
    goto :goto_18a

    .line 203
    :cond_150
    sub-float v20, v13, v1

    invoke-static {v13, v1}, Ljava/lang/Math;->min(FF)F

    move-result v23

    move-object/from16 v24, v2

    div-float v2, v20, v23

    .end local v2    # "info":Lcom/google/zxing/qrcode/detector/FinderPatternInfo;
    .local v24, "info":Lcom/google/zxing/qrcode/detector/FinderPatternInfo;
    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v2

    .line 204
    .local v2, "vABBC":F
    const v20, 0x3dcccccd    # 0.1f

    cmpl-float v23, v2, v20

    if-ltz v23, :cond_166

    .line 205
    goto :goto_18a

    .line 209
    :cond_166
    mul-float v23, v13, v13

    mul-float v25, v1, v1

    move/from16 v26, v1

    add-float v1, v23, v25

    .end local v1    # "dB":F
    .local v26, "dB":F
    move/from16 v27, v2

    float-to-double v1, v1

    .end local v2    # "vABBC":F
    .local v27, "vABBC":F
    invoke-static {v1, v2}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v1

    double-to-float v1, v1

    .line 211
    .local v1, "dCpy":F
    sub-float v2, v0, v1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    move-result v23

    div-float v2, v2, v23

    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v2

    .line 213
    .local v2, "vPyC":F
    cmpl-float v20, v2, v20

    if-ltz v20, :cond_187

    .line 214
    goto :goto_18a

    .line 218
    :cond_187
    invoke-interface {v6, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 170
    .end local v0    # "dC":F
    .end local v1    # "dCpy":F
    .end local v2    # "vPyC":F
    .end local v3    # "p3":Lcom/google/zxing/qrcode/detector/FinderPattern;
    .end local v4    # "vModSize23A":F
    .end local v5    # "test":[Lcom/google/zxing/qrcode/detector/FinderPattern;
    .end local v13    # "dA":F
    .end local v15    # "estimatedModuleCount":F
    .end local v16    # "vModSize23":F
    .end local v24    # "info":Lcom/google/zxing/qrcode/detector/FinderPatternInfo;
    .end local v26    # "dB":F
    .end local v27    # "vABBC":F
    :cond_18a
    :goto_18a
    add-int/lit8 v14, v14, 0x1

    move/from16 v3, v17

    move/from16 v4, v18

    move/from16 v5, v19

    move-object/from16 v0, v21

    move/from16 v1, v22

    const/4 v2, 0x3

    const/high16 v13, 0x3f000000    # 0.5f

    const v15, 0x3d4ccccd    # 0.05f

    goto/16 :goto_aa

    .line 112
    .end local v6    # "results":Ljava/util/List;, "Ljava/util/List<[Lcom/google/zxing/qrcode/detector/FinderPattern;>;"
    .end local v7    # "i1":I
    .end local v8    # "p1":Lcom/google/zxing/qrcode/detector/FinderPattern;
    .end local v9    # "i2":I
    .end local v10    # "p2":Lcom/google/zxing/qrcode/detector/FinderPattern;
    .end local v11    # "vModSize12":F
    .end local v12    # "vModSize12A":F
    .end local v14    # "i3":I
    .end local v21    # "possibleCenters":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/qrcode/detector/FinderPattern;>;"
    .end local v22    # "size":I
    .local v0, "possibleCenters":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/qrcode/detector/FinderPattern;>;"
    .local v1, "size":I
    :cond_19e
    move-object/from16 v21, v0

    move/from16 v22, v1

    .end local v0    # "possibleCenters":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/qrcode/detector/FinderPattern;>;"
    .end local v1    # "size":I
    .restart local v21    # "possibleCenters":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/qrcode/detector/FinderPattern;>;"
    .restart local v22    # "size":I
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v0

    throw v0
.end method


# virtual methods
.method public findMulti(Ljava/util/Map;)[Lcom/google/zxing/qrcode/detector/FinderPatternInfo;
    .registers 21
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Lcom/google/zxing/DecodeHintType;",
            "*>;)[",
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

    .line 232
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

    .line 233
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

    .line 234
    .local v5, "pureBarcode":Z
    :goto_20
    invoke-virtual/range {p0 .. p0}, Lcom/google/zxing/multi/qrcode/detector/MultiFinderPatternFinder;->getImage()Lcom/google/zxing/common/BitMatrix;

    move-result-object v6

    .line 235
    .local v6, "image":Lcom/google/zxing/common/BitMatrix;
    invoke-virtual {v6}, Lcom/google/zxing/common/BitMatrix;->getHeight()I

    move-result v7

    .line 236
    .local v7, "maxI":I
    invoke-virtual {v6}, Lcom/google/zxing/common/BitMatrix;->getWidth()I

    move-result v8

    .line 244
    .local v8, "maxJ":I
    int-to-float v9, v7

    const/high16 v10, 0x43640000    # 228.0f

    div-float/2addr v9, v10

    const/high16 v10, 0x40400000    # 3.0f

    mul-float/2addr v9, v10

    float-to-int v9, v9

    .line 245
    .local v9, "iSkip":I
    const/4 v10, 0x3

    if-lt v9, v10, :cond_39

    if-eqz v4, :cond_3a

    .line 246
    :cond_39
    const/4 v9, 0x3

    .line 249
    :cond_3a
    const/4 v11, 0x5

    new-array v11, v11, [I

    .line 250
    .local v11, "stateCount":[I
    add-int/lit8 v12, v9, -0x1

    .local v12, "i":I
    :goto_3f
    if-lt v12, v7, :cond_74

    .line 297
    .end local v12    # "i":I
    invoke-direct/range {p0 .. p0}, Lcom/google/zxing/multi/qrcode/detector/MultiFinderPatternFinder;->selectMutipleBestPatterns()[[Lcom/google/zxing/qrcode/detector/FinderPattern;

    move-result-object v13

    .line 298
    .local v13, "patternInfo":[[Lcom/google/zxing/qrcode/detector/FinderPattern;
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    move-object v14, v3

    .line 299
    .local v14, "result":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/qrcode/detector/FinderPatternInfo;>;"
    array-length v15, v13

    :goto_4c
    if-lt v2, v15, :cond_64

    .line 304
    invoke-interface {v14}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_57

    .line 305
    sget-object v2, Lcom/google/zxing/multi/qrcode/detector/MultiFinderPatternFinder;->EMPTY_RESULT_ARRAY:[Lcom/google/zxing/qrcode/detector/FinderPatternInfo;

    return-object v2

    .line 307
    :cond_57
    invoke-interface {v14}, Ljava/util/List;->size()I

    move-result v2

    new-array v2, v2, [Lcom/google/zxing/qrcode/detector/FinderPatternInfo;

    invoke-interface {v14, v2}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Lcom/google/zxing/qrcode/detector/FinderPatternInfo;

    return-object v2

    .line 299
    :cond_64
    aget-object v3, v13, v2

    .line 300
    .local v3, "pattern":[Lcom/google/zxing/qrcode/detector/FinderPattern;
    invoke-static {v3}, Lcom/google/zxing/ResultPoint;->orderBestPatterns([Lcom/google/zxing/ResultPoint;)V

    .line 301
    new-instance v10, Lcom/google/zxing/qrcode/detector/FinderPatternInfo;

    invoke-direct {v10, v3}, Lcom/google/zxing/qrcode/detector/FinderPatternInfo;-><init>([Lcom/google/zxing/qrcode/detector/FinderPattern;)V

    invoke-interface {v14, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 299
    .end local v3    # "pattern":[Lcom/google/zxing/qrcode/detector/FinderPattern;
    add-int/lit8 v2, v2, 0x1

    goto :goto_4c

    .line 252
    .end local v13    # "patternInfo":[[Lcom/google/zxing/qrcode/detector/FinderPattern;
    .end local v14    # "result":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/qrcode/detector/FinderPatternInfo;>;"
    .restart local v12    # "i":I
    :cond_74
    aput v2, v11, v2

    .line 253
    aput v2, v11, v3

    .line 254
    const/4 v13, 0x2

    aput v2, v11, v13

    .line 255
    aput v2, v11, v10

    .line 256
    const/4 v14, 0x4

    aput v2, v11, v14

    .line 257
    const/4 v15, 0x0

    .line 258
    .local v15, "currentState":I
    const/16 v16, 0x0

    .local v16, "j":I
    move v10, v15

    move/from16 v15, v16

    .end local v16    # "j":I
    .local v10, "currentState":I
    .local v15, "j":I
    :goto_86
    if-lt v15, v8, :cond_94

    .line 293
    .end local v15    # "j":I
    invoke-static {v11}, Lcom/google/zxing/multi/qrcode/detector/MultiFinderPatternFinder;->foundPatternCross([I)Z

    move-result v13

    if-eqz v13, :cond_91

    .line 294
    invoke-virtual {v0, v11, v12, v8, v5}, Lcom/google/zxing/multi/qrcode/detector/MultiFinderPatternFinder;->handlePossibleCenter([IIIZ)Z

    .line 250
    .end local v10    # "currentState":I
    :cond_91
    add-int/2addr v12, v9

    const/4 v10, 0x3

    goto :goto_3f

    .line 259
    .restart local v10    # "currentState":I
    .restart local v15    # "j":I
    :cond_94
    invoke-virtual {v6, v15, v12}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v16

    if-eqz v16, :cond_aa

    .line 261
    and-int/lit8 v13, v10, 0x1

    if-ne v13, v3, :cond_a0

    .line 262
    add-int/lit8 v10, v10, 0x1

    .line 264
    :cond_a0
    aget v13, v11, v10

    add-int/2addr v13, v3

    aput v13, v11, v10

    .line 265
    nop

    .line 258
    const/4 v13, 0x2

    const/16 v16, 0x3

    goto :goto_f5

    .line 266
    :cond_aa
    and-int/lit8 v13, v10, 0x1

    if-nez v13, :cond_ec

    .line 267
    if-ne v10, v14, :cond_e0

    .line 268
    invoke-static {v11}, Lcom/google/zxing/multi/qrcode/detector/MultiFinderPatternFinder;->foundPatternCross([I)Z

    move-result v13

    if-eqz v13, :cond_cb

    invoke-virtual {v0, v11, v12, v15, v5}, Lcom/google/zxing/multi/qrcode/detector/MultiFinderPatternFinder;->handlePossibleCenter([IIIZ)Z

    move-result v13

    if-eqz v13, :cond_cb

    .line 270
    const/4 v10, 0x0

    .line 271
    aput v2, v11, v2

    .line 272
    aput v2, v11, v3

    .line 273
    const/4 v13, 0x2

    aput v2, v11, v13

    .line 274
    const/16 v16, 0x3

    aput v2, v11, v16

    .line 275
    aput v2, v11, v14

    .line 276
    goto :goto_f5

    .line 277
    :cond_cb
    const/4 v13, 0x2

    const/16 v16, 0x3

    aget v17, v11, v13

    aput v17, v11, v2

    .line 278
    aget v17, v11, v16

    aput v17, v11, v3

    .line 279
    aget v17, v11, v14

    aput v17, v11, v13

    .line 280
    aput v3, v11, v16

    .line 281
    aput v2, v11, v14

    .line 282
    const/4 v10, 0x3

    .line 284
    goto :goto_f5

    .line 285
    :cond_e0
    const/4 v13, 0x2

    const/16 v16, 0x3

    add-int/lit8 v10, v10, 0x1

    aget v17, v11, v10

    add-int/lit8 v17, v17, 0x1

    aput v17, v11, v10

    .line 287
    goto :goto_f5

    .line 288
    :cond_ec
    const/4 v13, 0x2

    const/16 v16, 0x3

    aget v17, v11, v10

    add-int/lit8 v17, v17, 0x1

    aput v17, v11, v10

    .line 258
    :goto_f5
    add-int/lit8 v15, v15, 0x1

    goto :goto_86
.end method
