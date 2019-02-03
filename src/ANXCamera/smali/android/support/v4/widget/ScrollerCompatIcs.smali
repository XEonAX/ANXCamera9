.class Landroid/support/v4/widget/ScrollerCompatIcs;
.super Ljava/lang/Object;
.source "ScrollerCompatIcs.java"


# direct methods
.method constructor <init>()V
    .registers 1

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getCurrVelocity(Ljava/lang/Object;)F
    .registers 2
    .param p0, "scroller"    # Ljava/lang/Object;

    .line 26
    move-object v0, p0

    check-cast v0, Landroid/widget/OverScroller;

    invoke-virtual {v0}, Landroid/widget/OverScroller;->getCurrVelocity()F

    move-result v0

    return v0
.end method
