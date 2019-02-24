.class Landroid/support/v4/view/animation/PathInterpolatorDonut;
.super Ljava/lang/Object;
.source "PathInterpolatorDonut.java"

# interfaces
.implements Landroid/view/animation/Interpolator;


# static fields
.field private static final PRECISION:F = 0.002f


# instance fields
.field private final mX:[F

.field private final mY:[F


# direct methods
.method public constructor <init>(FF)V
    .registers 4
    .param p1, "controlX"    # F
    .param p2, "controlY"    # F

    .line 56
    invoke-static {p1, p2}, Landroid/support/v4/view/animation/PathInterpolatorDonut;->createQuad(FF)Landroid/graphics/Path;

    move-result-object v0

    invoke-direct {p0, v0}, Landroid/support/v4/view/animation/PathInterpolatorDonut;-><init>(Landroid/graphics/Path;)V

    .line 57
    return-void
.end method

.method public constructor <init>(FFFF)V
    .registers 6
    .param p1, "controlX1"    # F
    .param p2, "controlY1"    # F
    .param p3, "controlX2"    # F
    .param p4, "controlY2"    # F

    .line 61
    invoke-static {p1, p2, p3, p4}, Landroid/support/v4/view/animation/PathInterpolatorDonut;->createCubic(FFFF)Landroid/graphics/Path;

    move-result-object v0

    invoke-direct {p0, v0}, Landroid/support/v4/view/animation/PathInterpolatorDonut;-><init>(Landroid/graphics/Path;)V

    .line 62
    return-void
.end method

.method public constructor <init>(Landroid/graphics/Path;)V
    .registers 12
    .param p1, "path"    # Landroid/graphics/Path;

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    new-instance v0, Landroid/graphics/PathMeasure;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Landroid/graphics/PathMeasure;-><init>(Landroid/graphics/Path;Z)V

    .line 39
    .local v0, "pathMeasure":Landroid/graphics/PathMeasure;
    invoke-virtual {v0}, Landroid/graphics/PathMeasure;->getLength()F

    move-result v2

    .line 40
    .local v2, "pathLength":F
    const v3, 0x3b03126f    # 0.002f

    div-float v3, v2, v3

    float-to-int v3, v3

    const/4 v4, 0x1

    add-int/2addr v3, v4

    .line 42
    .local v3, "numPoints":I
    new-array v5, v3, [F

    iput-object v5, p0, Landroid/support/v4/view/animation/PathInterpolatorDonut;->mX:[F

    .line 43
    new-array v5, v3, [F

    iput-object v5, p0, Landroid/support/v4/view/animation/PathInterpolatorDonut;->mY:[F

    .line 45
    const/4 v5, 0x2

    new-array v5, v5, [F

    .line 46
    .local v5, "position":[F
    move v6, v1

    .local v6, "i":I
    :goto_21
    if-ge v6, v3, :cond_3c

    .line 47
    int-to-float v7, v6

    mul-float/2addr v7, v2

    add-int/lit8 v8, v3, -0x1

    int-to-float v8, v8

    div-float/2addr v7, v8

    .line 48
    .local v7, "distance":F
    const/4 v8, 0x0

    invoke-virtual {v0, v7, v5, v8}, Landroid/graphics/PathMeasure;->getPosTan(F[F[F)Z

    .line 50
    iget-object v8, p0, Landroid/support/v4/view/animation/PathInterpolatorDonut;->mX:[F

    aget v9, v5, v1

    aput v9, v8, v6

    .line 51
    iget-object v8, p0, Landroid/support/v4/view/animation/PathInterpolatorDonut;->mY:[F

    aget v9, v5, v4

    aput v9, v8, v6

    .line 46
    .end local v7    # "distance":F
    add-int/lit8 v6, v6, 0x1

    goto :goto_21

    .line 53
    .end local v6    # "i":I
    :cond_3c
    return-void
.end method

.method private static createCubic(FFFF)Landroid/graphics/Path;
    .registers 12
    .param p0, "controlX1"    # F
    .param p1, "controlY1"    # F
    .param p2, "controlX2"    # F
    .param p3, "controlY2"    # F

    .line 107
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    .line 108
    .local v0, "path":Landroid/graphics/Path;
    const/4 v1, 0x0

    invoke-virtual {v0, v1, v1}, Landroid/graphics/Path;->moveTo(FF)V

    .line 109
    const/high16 v6, 0x3f800000    # 1.0f

    const/high16 v7, 0x3f800000    # 1.0f

    move-object v1, v0

    move v2, p0

    move v3, p1

    move v4, p2

    move v5, p3

    invoke-virtual/range {v1 .. v7}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 110
    return-object v0
.end method

.method private static createQuad(FF)Landroid/graphics/Path;
    .registers 4
    .param p0, "controlX"    # F
    .param p1, "controlY"    # F

    .line 99
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    .line 100
    .local v0, "path":Landroid/graphics/Path;
    const/4 v1, 0x0

    invoke-virtual {v0, v1, v1}, Landroid/graphics/Path;->moveTo(FF)V

    .line 101
    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, p0, p1, v1, v1}, Landroid/graphics/Path;->quadTo(FFFF)V

    .line 102
    return-object v0
.end method


# virtual methods
.method public getInterpolation(F)F
    .registers 10
    .param p1, "t"    # F

    .line 66
    const/4 v0, 0x0

    cmpg-float v1, p1, v0

    if-gtz v1, :cond_6

    .line 67
    return v0

    .line 68
    :cond_6
    const/high16 v1, 0x3f800000    # 1.0f

    cmpl-float v2, p1, v1

    if-ltz v2, :cond_d

    .line 69
    return v1

    .line 73
    :cond_d
    const/4 v1, 0x0

    .line 74
    .local v1, "startIndex":I
    iget-object v2, p0, Landroid/support/v4/view/animation/PathInterpolatorDonut;->mX:[F

    array-length v2, v2

    const/4 v3, 0x1

    sub-int/2addr v2, v3

    .line 75
    .local v2, "endIndex":I
    :goto_13
    sub-int v4, v2, v1

    if-le v4, v3, :cond_27

    .line 76
    add-int v4, v1, v2

    div-int/lit8 v4, v4, 0x2

    .line 77
    .local v4, "midIndex":I
    iget-object v5, p0, Landroid/support/v4/view/animation/PathInterpolatorDonut;->mX:[F

    aget v5, v5, v4

    cmpg-float v5, p1, v5

    if-gez v5, :cond_25

    .line 78
    move v2, v4

    goto :goto_26

    .line 80
    :cond_25
    move v1, v4

    .line 82
    .end local v4    # "midIndex":I
    :goto_26
    goto :goto_13

    .line 84
    :cond_27
    iget-object v3, p0, Landroid/support/v4/view/animation/PathInterpolatorDonut;->mX:[F

    aget v3, v3, v2

    iget-object v4, p0, Landroid/support/v4/view/animation/PathInterpolatorDonut;->mX:[F

    aget v4, v4, v1

    sub-float/2addr v3, v4

    .line 85
    .local v3, "xRange":F
    cmpl-float v0, v3, v0

    if-nez v0, :cond_39

    .line 86
    iget-object v0, p0, Landroid/support/v4/view/animation/PathInterpolatorDonut;->mY:[F

    aget v0, v0, v1

    return v0

    .line 89
    :cond_39
    iget-object v0, p0, Landroid/support/v4/view/animation/PathInterpolatorDonut;->mX:[F

    aget v0, v0, v1

    sub-float v0, p1, v0

    .line 90
    .local v0, "tInRange":F
    div-float v4, v0, v3

    .line 92
    .local v4, "fraction":F
    iget-object v5, p0, Landroid/support/v4/view/animation/PathInterpolatorDonut;->mY:[F

    aget v5, v5, v1

    .line 93
    .local v5, "startY":F
    iget-object v6, p0, Landroid/support/v4/view/animation/PathInterpolatorDonut;->mY:[F

    aget v6, v6, v2

    .line 95
    .local v6, "endY":F
    sub-float v7, v6, v5

    mul-float/2addr v7, v4

    add-float/2addr v7, v5

    return v7
.end method
