.class public final Lcom/google/zxing/common/DefaultGridSampler;
.super Lcom/google/zxing/common/GridSampler;
.source "DefaultGridSampler.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 24
    invoke-direct {p0}, Lcom/google/zxing/common/GridSampler;-><init>()V

    return-void
.end method


# virtual methods
.method public sampleGrid(Lcom/google/zxing/common/BitMatrix;IIFFFFFFFFFFFFFFFF)Lcom/google/zxing/common/BitMatrix;
    .locals 6
    .param p1, "image"    # Lcom/google/zxing/common/BitMatrix;
    .param p2, "dimensionX"    # I
    .param p3, "dimensionY"    # I
    .param p4, "p1ToX"    # F
    .param p5, "p1ToY"    # F
    .param p6, "p2ToX"    # F
    .param p7, "p2ToY"    # F
    .param p8, "p3ToX"    # F
    .param p9, "p3ToY"    # F
    .param p10, "p4ToX"    # F
    .param p11, "p4ToY"    # F
    .param p12, "p1FromX"    # F
    .param p13, "p1FromY"    # F
    .param p14, "p2FromX"    # F
    .param p15, "p2FromY"    # F
    .param p16, "p3FromX"    # F
    .param p17, "p3FromY"    # F
    .param p18, "p4FromX"    # F
    .param p19, "p4FromY"    # F
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .line 40
    nop

    .line 41
    nop

    .line 39
    invoke-static/range {p4 .. p19}, Lcom/google/zxing/common/PerspectiveTransform;->quadrilateralToQuadrilateral(FFFFFFFFFFFFFFFF)Lcom/google/zxing/common/PerspectiveTransform;

    move-result-object v0

    .line 43
    .local v0, "transform":Lcom/google/zxing/common/PerspectiveTransform;
    move-object v1, p0

    move-object v2, p1

    move v3, p2

    move v4, p3

    invoke-virtual {v1, v2, v3, v4, v0}, Lcom/google/zxing/common/DefaultGridSampler;->sampleGrid(Lcom/google/zxing/common/BitMatrix;IILcom/google/zxing/common/PerspectiveTransform;)Lcom/google/zxing/common/BitMatrix;

    move-result-object v5

    return-object v5
.end method

.method public sampleGrid(Lcom/google/zxing/common/BitMatrix;IILcom/google/zxing/common/PerspectiveTransform;)Lcom/google/zxing/common/BitMatrix;
    .locals 8
    .param p1, "image"    # Lcom/google/zxing/common/BitMatrix;
    .param p2, "dimensionX"    # I
    .param p3, "dimensionY"    # I
    .param p4, "transform"    # Lcom/google/zxing/common/PerspectiveTransform;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .line 51
    if-lez p2, :cond_4

    if-lez p3, :cond_4

    .line 54
    new-instance v0, Lcom/google/zxing/common/BitMatrix;

    invoke-direct {v0, p2, p3}, Lcom/google/zxing/common/BitMatrix;-><init>(II)V

    .line 55
    .local v0, "bits":Lcom/google/zxing/common/BitMatrix;
    const/4 v1, 0x2

    mul-int/2addr v1, p2

    new-array v1, v1, [F

    .line 56
    .local v1, "points":[F
    const/4 v2, 0x0

    .local v2, "y":I
    :goto_0
    if-lt v2, p3, :cond_0

    .line 85
    .end local v2    # "y":I
    return-object v0

    .line 57
    .restart local v2    # "y":I
    :cond_0
    array-length v3, v1

    .line 58
    .local v3, "max":I
    int-to-float v4, v2

    const/high16 v5, 0x3f000000    # 0.5f

    add-float/2addr v4, v5

    .line 59
    .local v4, "iValue":F
    const/4 v6, 0x0

    .local v6, "x":I
    :goto_1
    if-lt v6, v3, :cond_3

    .line 63
    .end local v6    # "x":I
    invoke-virtual {p4, v1}, Lcom/google/zxing/common/PerspectiveTransform;->transformPoints([F)V

    .line 66
    invoke-static {p1, v1}, Lcom/google/zxing/common/DefaultGridSampler;->checkAndNudgePoints(Lcom/google/zxing/common/BitMatrix;[F)V

    .line 68
    const/4 v5, 0x0

    .local v5, "x":I
    :goto_2
    if-lt v5, v3, :cond_1

    .line 74
    .end local v5    # "x":I
    nop

    .line 56
    .end local v3    # "max":I
    .end local v4    # "iValue":F
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 69
    .restart local v3    # "max":I
    .restart local v4    # "iValue":F
    .restart local v5    # "x":I
    :cond_1
    :try_start_0
    aget v6, v1, v5

    float-to-int v6, v6

    add-int/lit8 v7, v5, 0x1

    aget v7, v1, v7

    float-to-int v7, v7

    invoke-virtual {p1, v6, v7}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 71
    div-int/lit8 v6, v5, 0x2

    invoke-virtual {v0, v6, v2}, Lcom/google/zxing/common/BitMatrix;->set(II)V
    :try_end_0
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    .line 68
    :cond_2
    add-int/lit8 v5, v5, 0x2

    goto :goto_2

    .line 74
    .end local v5    # "x":I
    :catch_0
    move-exception v5

    .line 82
    .local v5, "aioobe":Ljava/lang/ArrayIndexOutOfBoundsException;
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v6

    throw v6

    .line 60
    .end local v5    # "aioobe":Ljava/lang/ArrayIndexOutOfBoundsException;
    .restart local v6    # "x":I
    :cond_3
    div-int/lit8 v7, v6, 0x2

    int-to-float v7, v7

    add-float/2addr v7, v5

    aput v7, v1, v6

    .line 61
    add-int/lit8 v7, v6, 0x1

    aput v4, v1, v7

    .line 59
    add-int/lit8 v6, v6, 0x2

    goto :goto_1

    .line 52
    .end local v0    # "bits":Lcom/google/zxing/common/BitMatrix;
    .end local v1    # "points":[F
    .end local v2    # "y":I
    .end local v3    # "max":I
    .end local v4    # "iValue":F
    .end local v6    # "x":I
    :cond_4
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v0

    throw v0
.end method
