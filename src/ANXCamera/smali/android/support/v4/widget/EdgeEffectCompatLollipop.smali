.class Landroid/support/v4/widget/EdgeEffectCompatLollipop;
.super Ljava/lang/Object;
.source "EdgeEffectCompatLollipop.java"


# direct methods
.method constructor <init>()V
    .registers 1

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static onPull(Ljava/lang/Object;FF)Z
    .registers 4
    .param p0, "edgeEffect"    # Ljava/lang/Object;
    .param p1, "deltaDistance"    # F
    .param p2, "displacement"    # F

    .line 24
    move-object v0, p0

    check-cast v0, Landroid/widget/EdgeEffect;

    invoke-virtual {v0, p1, p2}, Landroid/widget/EdgeEffect;->onPull(FF)V

    .line 25
    const/4 v0, 0x1

    return v0
.end method
