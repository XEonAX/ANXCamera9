.class public Lmiui/view/animation/BounceEaseInInterpolator;
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
    .registers 4

    .line 15
    new-instance v0, Lmiui/view/animation/BounceEaseOutInterpolator;

    invoke-direct {v0}, Lmiui/view/animation/BounceEaseOutInterpolator;-><init>()V

    const/high16 v1, 0x3f800000    # 1.0f

    sub-float p1, v1, p1

    invoke-virtual {v0, p1}, Lmiui/view/animation/BounceEaseOutInterpolator;->getInterpolation(F)F

    move-result p1

    sub-float/2addr v1, p1

    return v1
.end method
