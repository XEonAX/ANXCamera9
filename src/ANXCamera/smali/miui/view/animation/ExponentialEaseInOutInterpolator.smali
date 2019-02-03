.class public Lmiui/view/animation/ExponentialEaseInOutInterpolator;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/animation/Interpolator;


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getInterpolation(F)F
    .registers 7

    .line 15
    const/4 v0, 0x0

    cmpl-float v1, p1, v0

    if-nez v1, :cond_6

    .line 16
    return v0

    .line 18
    :cond_6
    const/high16 v0, 0x3f800000    # 1.0f

    cmpl-float v1, p1, v0

    if-nez v1, :cond_d

    .line 19
    return v0

    .line 22
    :cond_d
    const/high16 v1, 0x40000000    # 2.0f

    mul-float/2addr p1, v1

    .line 23
    cmpg-float v1, p1, v0

    const/high16 v2, 0x3f000000    # 0.5f

    const-wide/high16 v3, 0x4000000000000000L    # 2.0

    if-gez v1, :cond_24

    .line 24
    const/high16 v1, 0x41200000    # 10.0f

    sub-float/2addr p1, v0

    mul-float/2addr v1, p1

    float-to-double v0, v1

    invoke-static {v3, v4, v0, v1}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v0

    double-to-float p1, v0

    mul-float/2addr v2, p1

    return v2

    .line 27
    :cond_24
    sub-float/2addr p1, v0

    .line 28
    const/high16 v0, -0x3ee00000    # -10.0f

    mul-float/2addr v0, p1

    float-to-double v0, v0

    invoke-static {v3, v4, v0, v1}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v0

    neg-double v0, v0

    add-double/2addr v0, v3

    double-to-float p1, v0

    mul-float/2addr v2, p1

    return v2
.end method
