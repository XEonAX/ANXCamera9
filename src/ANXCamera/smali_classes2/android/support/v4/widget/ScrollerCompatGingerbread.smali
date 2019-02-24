.class Landroid/support/v4/widget/ScrollerCompatGingerbread;
.super Ljava/lang/Object;
.source "ScrollerCompatGingerbread.java"


# direct methods
.method constructor <init>()V
    .registers 1

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static abortAnimation(Ljava/lang/Object;)V
    .registers 2
    .param p0, "scroller"    # Ljava/lang/Object;

    .line 67
    move-object v0, p0

    check-cast v0, Landroid/widget/OverScroller;

    invoke-virtual {v0}, Landroid/widget/OverScroller;->abortAnimation()V

    .line 68
    return-void
.end method

.method public static computeScrollOffset(Ljava/lang/Object;)Z
    .registers 2
    .param p0, "scroller"    # Ljava/lang/Object;

    .line 43
    move-object v0, p0

    check-cast v0, Landroid/widget/OverScroller;

    invoke-virtual {v0}, Landroid/widget/OverScroller;->computeScrollOffset()Z

    move-result v0

    return v0
.end method

.method public static createScroller(Landroid/content/Context;Landroid/view/animation/Interpolator;)Ljava/lang/Object;
    .registers 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "interpolator"    # Landroid/view/animation/Interpolator;

    .line 26
    if-eqz p1, :cond_8

    new-instance v0, Landroid/widget/OverScroller;

    invoke-direct {v0, p0, p1}, Landroid/widget/OverScroller;-><init>(Landroid/content/Context;Landroid/view/animation/Interpolator;)V

    goto :goto_d

    :cond_8
    new-instance v0, Landroid/widget/OverScroller;

    invoke-direct {v0, p0}, Landroid/widget/OverScroller;-><init>(Landroid/content/Context;)V

    :goto_d
    return-object v0
.end method

.method public static fling(Ljava/lang/Object;IIIIIIII)V
    .registers 18
    .param p0, "scroller"    # Ljava/lang/Object;
    .param p1, "startX"    # I
    .param p2, "startY"    # I
    .param p3, "velX"    # I
    .param p4, "velY"    # I
    .param p5, "minX"    # I
    .param p6, "maxX"    # I
    .param p7, "minY"    # I
    .param p8, "maxY"    # I

    .line 57
    move-object v0, p0

    check-cast v0, Landroid/widget/OverScroller;

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    move v6, p6

    move/from16 v7, p7

    move/from16 v8, p8

    invoke-virtual/range {v0 .. v8}, Landroid/widget/OverScroller;->fling(IIIIIIII)V

    .line 58
    return-void
.end method

.method public static fling(Ljava/lang/Object;IIIIIIIIII)V
    .registers 22
    .param p0, "scroller"    # Ljava/lang/Object;
    .param p1, "startX"    # I
    .param p2, "startY"    # I
    .param p3, "velX"    # I
    .param p4, "velY"    # I
    .param p5, "minX"    # I
    .param p6, "maxX"    # I
    .param p7, "minY"    # I
    .param p8, "maxY"    # I
    .param p9, "overX"    # I
    .param p10, "overY"    # I

    .line 62
    move-object v0, p0

    check-cast v0, Landroid/widget/OverScroller;

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move/from16 v5, p5

    move/from16 v6, p6

    move/from16 v7, p7

    move/from16 v8, p8

    move/from16 v9, p9

    move/from16 v10, p10

    invoke-virtual/range {v0 .. v10}, Landroid/widget/OverScroller;->fling(IIIIIIIIII)V

    .line 64
    return-void
.end method

.method public static getCurrX(Ljava/lang/Object;)I
    .registers 2
    .param p0, "scroller"    # Ljava/lang/Object;

    .line 35
    move-object v0, p0

    check-cast v0, Landroid/widget/OverScroller;

    invoke-virtual {v0}, Landroid/widget/OverScroller;->getCurrX()I

    move-result v0

    return v0
.end method

.method public static getCurrY(Ljava/lang/Object;)I
    .registers 2
    .param p0, "scroller"    # Ljava/lang/Object;

    .line 39
    move-object v0, p0

    check-cast v0, Landroid/widget/OverScroller;

    invoke-virtual {v0}, Landroid/widget/OverScroller;->getCurrY()I

    move-result v0

    return v0
.end method

.method public static getFinalX(Ljava/lang/Object;)I
    .registers 2
    .param p0, "scroller"    # Ljava/lang/Object;

    .line 84
    move-object v0, p0

    check-cast v0, Landroid/widget/OverScroller;

    invoke-virtual {v0}, Landroid/widget/OverScroller;->getFinalX()I

    move-result v0

    return v0
.end method

.method public static getFinalY(Ljava/lang/Object;)I
    .registers 2
    .param p0, "scroller"    # Ljava/lang/Object;

    .line 88
    move-object v0, p0

    check-cast v0, Landroid/widget/OverScroller;

    invoke-virtual {v0}, Landroid/widget/OverScroller;->getFinalY()I

    move-result v0

    return v0
.end method

.method public static isFinished(Ljava/lang/Object;)Z
    .registers 2
    .param p0, "scroller"    # Ljava/lang/Object;

    .line 31
    move-object v0, p0

    check-cast v0, Landroid/widget/OverScroller;

    invoke-virtual {v0}, Landroid/widget/OverScroller;->isFinished()Z

    move-result v0

    return v0
.end method

.method public static isOverScrolled(Ljava/lang/Object;)Z
    .registers 2
    .param p0, "scroller"    # Ljava/lang/Object;

    .line 80
    move-object v0, p0

    check-cast v0, Landroid/widget/OverScroller;

    invoke-virtual {v0}, Landroid/widget/OverScroller;->isOverScrolled()Z

    move-result v0

    return v0
.end method

.method public static notifyHorizontalEdgeReached(Ljava/lang/Object;III)V
    .registers 5
    .param p0, "scroller"    # Ljava/lang/Object;
    .param p1, "startX"    # I
    .param p2, "finalX"    # I
    .param p3, "overX"    # I

    .line 72
    move-object v0, p0

    check-cast v0, Landroid/widget/OverScroller;

    invoke-virtual {v0, p1, p2, p3}, Landroid/widget/OverScroller;->notifyHorizontalEdgeReached(III)V

    .line 73
    return-void
.end method

.method public static notifyVerticalEdgeReached(Ljava/lang/Object;III)V
    .registers 5
    .param p0, "scroller"    # Ljava/lang/Object;
    .param p1, "startY"    # I
    .param p2, "finalY"    # I
    .param p3, "overY"    # I

    .line 76
    move-object v0, p0

    check-cast v0, Landroid/widget/OverScroller;

    invoke-virtual {v0, p1, p2, p3}, Landroid/widget/OverScroller;->notifyVerticalEdgeReached(III)V

    .line 77
    return-void
.end method

.method public static startScroll(Ljava/lang/Object;IIII)V
    .registers 6
    .param p0, "scroller"    # Ljava/lang/Object;
    .param p1, "startX"    # I
    .param p2, "startY"    # I
    .param p3, "dx"    # I
    .param p4, "dy"    # I

    .line 47
    move-object v0, p0

    check-cast v0, Landroid/widget/OverScroller;

    invoke-virtual {v0, p1, p2, p3, p4}, Landroid/widget/OverScroller;->startScroll(IIII)V

    .line 48
    return-void
.end method

.method public static startScroll(Ljava/lang/Object;IIIII)V
    .registers 12
    .param p0, "scroller"    # Ljava/lang/Object;
    .param p1, "startX"    # I
    .param p2, "startY"    # I
    .param p3, "dx"    # I
    .param p4, "dy"    # I
    .param p5, "duration"    # I

    .line 52
    move-object v0, p0

    check-cast v0, Landroid/widget/OverScroller;

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    invoke-virtual/range {v0 .. v5}, Landroid/widget/OverScroller;->startScroll(IIIII)V

    .line 53
    return-void
.end method
