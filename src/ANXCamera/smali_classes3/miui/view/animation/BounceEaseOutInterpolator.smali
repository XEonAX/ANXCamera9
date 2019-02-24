.class public Lmiui/view/animation/BounceEaseOutInterpolator;
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
    .registers 8

    .line 15
    float-to-double v0, p1

    const-wide v2, 0x3fd745d1745d1746L    # 0.36363636363636365

    cmpg-double v2, v0, v2

    const/high16 v3, 0x40f20000    # 7.5625f

    if-gez v2, :cond_f

    .line 16
    mul-float/2addr v3, p1

    mul-float/2addr v3, p1

    return v3

    .line 17
    :cond_f
    const-wide v4, 0x3fe745d1745d1746L    # 0.7272727272727273

    cmpg-double p1, v0, v4

    if-gez p1, :cond_25

    .line 18
    const-wide v4, 0x3fe1745d1745d174L    # 0.5454545454545454

    sub-double/2addr v0, v4

    double-to-float p1, v0

    .line 19
    mul-float/2addr v3, p1

    mul-float/2addr v3, p1

    const/high16 p1, 0x3f400000    # 0.75f

    add-float/2addr v3, p1

    return v3

    .line 20
    :cond_25
    const-wide v4, 0x3fed1745d1745d17L    # 0.9090909090909091

    cmpg-double p1, v0, v4

    if-gez p1, :cond_3b

    .line 21
    const-wide v4, 0x3fea2e8ba2e8ba2fL    # 0.8181818181818182

    sub-double/2addr v0, v4

    double-to-float p1, v0

    .line 22
    mul-float/2addr v3, p1

    mul-float/2addr v3, p1

    const/high16 p1, 0x3f700000    # 0.9375f

    add-float/2addr v3, p1

    return v3

    .line 24
    :cond_3b
    const-wide v4, 0x3fee8ba2e8ba2e8cL    # 0.9545454545454546

    sub-double/2addr v0, v4

    double-to-float p1, v0

    .line 25
    mul-float/2addr v3, p1

    mul-float/2addr v3, p1

    const/high16 p1, 0x3f7c0000    # 0.984375f

    add-float/2addr v3, p1

    return v3
.end method
