.class public Lmiui/view/animation/ElasticEaseInOutInterpolator;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/animation/Interpolator;


# instance fields
.field private final NT:F

.field private final NV:F


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 21
    const/4 v0, 0x0

    invoke-direct {p0, v0, v0}, Lmiui/view/animation/ElasticEaseInOutInterpolator;-><init>(FF)V

    .line 22
    return-void
.end method

.method public constructor <init>(FF)V
    .registers 3

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    iput p1, p0, Lmiui/view/animation/ElasticEaseInOutInterpolator;->NT:F

    .line 30
    iput p2, p0, Lmiui/view/animation/ElasticEaseInOutInterpolator;->NV:F

    .line 31
    return-void
.end method


# virtual methods
.method public getInterpolation(F)F
    .registers 15

    .line 35
    iget v0, p0, Lmiui/view/animation/ElasticEaseInOutInterpolator;->NV:F

    .line 36
    iget v1, p0, Lmiui/view/animation/ElasticEaseInOutInterpolator;->NT:F

    .line 39
    const/4 v2, 0x0

    cmpl-float v3, p1, v2

    if-nez v3, :cond_a

    .line 40
    return v2

    .line 43
    :cond_a
    const/high16 v3, 0x3f000000    # 0.5f

    div-float/2addr p1, v3

    .line 44
    const/high16 v3, 0x40000000    # 2.0f

    cmpl-float v3, p1, v3

    const/high16 v4, 0x3f800000    # 1.0f

    if-nez v3, :cond_16

    .line 45
    return v4

    .line 47
    :cond_16
    cmpl-float v3, v0, v2

    if-nez v3, :cond_1d

    .line 48
    const v0, 0x3ee66667    # 0.45000002f

    .line 50
    :cond_1d
    cmpl-float v2, v1, v2

    const-wide v5, 0x401921fb54442d18L    # 6.283185307179586

    if-eqz v2, :cond_37

    cmpg-float v2, v1, v4

    if-gez v2, :cond_2b

    goto :goto_37

    .line 54
    :cond_2b
    float-to-double v2, v0

    div-double/2addr v2, v5

    div-float v7, v4, v1

    float-to-double v7, v7

    invoke-static {v7, v8}, Ljava/lang/Math;->asin(D)D

    move-result-wide v7

    mul-double/2addr v2, v7

    double-to-float v2, v2

    goto :goto_3d

    .line 51
    :cond_37
    :goto_37
    nop

    .line 52
    const/high16 v1, 0x40800000    # 4.0f

    div-float v2, v0, v1

    .line 56
    move v1, v4

    :goto_3d
    cmpg-float v3, p1, v4

    const-wide/high16 v7, 0x4000000000000000L    # 2.0

    if-gez v3, :cond_5d

    .line 57
    sub-float/2addr p1, v4

    .line 58
    const/high16 v3, -0x41000000    # -0.5f

    float-to-double v9, v1

    const/high16 v1, 0x41200000    # 10.0f

    mul-float/2addr v1, p1

    float-to-double v11, v1

    invoke-static {v7, v8, v11, v12}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v7

    mul-double/2addr v9, v7

    sub-float/2addr p1, v2

    float-to-double v1, p1

    mul-double/2addr v1, v5

    float-to-double v4, v0

    div-double/2addr v1, v4

    invoke-static {v1, v2}, Ljava/lang/Math;->sin(D)D

    move-result-wide v0

    mul-double/2addr v9, v0

    double-to-float p1, v9

    mul-float/2addr v3, p1

    return v3

    .line 62
    :cond_5d
    sub-float/2addr p1, v4

    .line 63
    float-to-double v3, v1

    const/high16 v1, -0x3ee00000    # -10.0f

    mul-float/2addr v1, p1

    float-to-double v9, v1

    invoke-static {v7, v8, v9, v10}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v7

    mul-double/2addr v3, v7

    sub-float/2addr p1, v2

    float-to-double v1, p1

    mul-double/2addr v1, v5

    float-to-double v5, v0

    div-double/2addr v1, v5

    invoke-static {v1, v2}, Ljava/lang/Math;->sin(D)D

    move-result-wide v0

    mul-double/2addr v3, v0

    const-wide/high16 v0, 0x3fe0000000000000L    # 0.5

    mul-double/2addr v3, v0

    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    add-double/2addr v3, v0

    double-to-float p1, v3

    return p1
.end method
