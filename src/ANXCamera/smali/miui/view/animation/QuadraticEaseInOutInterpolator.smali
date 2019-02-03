.class public Lmiui/view/animation/QuadraticEaseInOutInterpolator;
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
    .registers 5

    .line 15
    const/high16 v0, 0x40000000    # 2.0f

    mul-float/2addr p1, v0

    .line 16
    const/high16 v1, 0x3f800000    # 1.0f

    cmpg-float v2, p1, v1

    if-gez v2, :cond_e

    .line 17
    const/high16 v0, 0x3f000000    # 0.5f

    mul-float/2addr v0, p1

    mul-float/2addr v0, p1

    return v0

    .line 19
    :cond_e
    sub-float/2addr p1, v1

    .line 20
    const/high16 v2, -0x41000000    # -0.5f

    sub-float v0, p1, v0

    mul-float/2addr p1, v0

    sub-float/2addr p1, v1

    mul-float/2addr v2, p1

    return v2
.end method
