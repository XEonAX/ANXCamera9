.class public abstract Lcom/facebook/rebound/ui/Util;
.super Ljava/lang/Object;
.source "Util.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static final createLayoutParams(II)Landroid/widget/FrameLayout$LayoutParams;
    .locals 1

    .line 22
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v0, p0, p1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    return-object v0
.end method

.method public static final createMatchParams()Landroid/widget/FrameLayout$LayoutParams;
    .locals 1

    .line 26
    const/4 v0, -0x1

    invoke-static {v0, v0}, Lcom/facebook/rebound/ui/Util;->createLayoutParams(II)Landroid/widget/FrameLayout$LayoutParams;

    move-result-object v0

    return-object v0
.end method

.method public static final createMatchWrapParams()Landroid/widget/FrameLayout$LayoutParams;
    .locals 2

    .line 44
    const/4 v0, -0x1

    const/4 v1, -0x2

    invoke-static {v0, v1}, Lcom/facebook/rebound/ui/Util;->createLayoutParams(II)Landroid/widget/FrameLayout$LayoutParams;

    move-result-object v0

    return-object v0
.end method

.method public static final createWrapMatchParams()Landroid/widget/FrameLayout$LayoutParams;
    .locals 2

    .line 38
    const/4 v0, -0x2

    const/4 v1, -0x1

    invoke-static {v0, v1}, Lcom/facebook/rebound/ui/Util;->createLayoutParams(II)Landroid/widget/FrameLayout$LayoutParams;

    move-result-object v0

    return-object v0
.end method

.method public static final createWrapParams()Landroid/widget/FrameLayout$LayoutParams;
    .locals 1

    .line 32
    const/4 v0, -0x2

    invoke-static {v0, v0}, Lcom/facebook/rebound/ui/Util;->createLayoutParams(II)Landroid/widget/FrameLayout$LayoutParams;

    move-result-object v0

    return-object v0
.end method

.method public static final dpToPx(FLandroid/content/res/Resources;)I
    .locals 1

    .line 15
    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p1

    const/4 v0, 0x1

    invoke-static {v0, p0, p1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result p0

    float-to-int p0, p0

    return p0
.end method
