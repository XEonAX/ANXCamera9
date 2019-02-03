.class Landroid/support/v4/view/ViewParentCompat$ViewParentCompatLollipopImpl;
.super Landroid/support/v4/view/ViewParentCompat$ViewParentCompatKitKatImpl;
.source "ViewParentCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/view/ViewParentCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "ViewParentCompatLollipopImpl"
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .line 154
    invoke-direct {p0}, Landroid/support/v4/view/ViewParentCompat$ViewParentCompatKitKatImpl;-><init>()V

    return-void
.end method


# virtual methods
.method public onNestedFling(Landroid/view/ViewParent;Landroid/view/View;FFZ)Z
    .registers 7
    .param p1, "parent"    # Landroid/view/ViewParent;
    .param p2, "target"    # Landroid/view/View;
    .param p3, "velocityX"    # F
    .param p4, "velocityY"    # F
    .param p5, "consumed"    # Z

    .line 190
    invoke-static {p1, p2, p3, p4, p5}, Landroid/support/v4/view/ViewParentCompatLollipop;->onNestedFling(Landroid/view/ViewParent;Landroid/view/View;FFZ)Z

    move-result v0

    return v0
.end method

.method public onNestedPreFling(Landroid/view/ViewParent;Landroid/view/View;FF)Z
    .registers 6
    .param p1, "parent"    # Landroid/view/ViewParent;
    .param p2, "target"    # Landroid/view/View;
    .param p3, "velocityX"    # F
    .param p4, "velocityY"    # F

    .line 197
    invoke-static {p1, p2, p3, p4}, Landroid/support/v4/view/ViewParentCompatLollipop;->onNestedPreFling(Landroid/view/ViewParent;Landroid/view/View;FF)Z

    move-result v0

    return v0
.end method

.method public onNestedPreScroll(Landroid/view/ViewParent;Landroid/view/View;II[I)V
    .registers 6
    .param p1, "parent"    # Landroid/view/ViewParent;
    .param p2, "target"    # Landroid/view/View;
    .param p3, "dx"    # I
    .param p4, "dy"    # I
    .param p5, "consumed"    # [I

    .line 184
    invoke-static {p1, p2, p3, p4, p5}, Landroid/support/v4/view/ViewParentCompatLollipop;->onNestedPreScroll(Landroid/view/ViewParent;Landroid/view/View;II[I)V

    .line 185
    return-void
.end method

.method public onNestedScroll(Landroid/view/ViewParent;Landroid/view/View;IIII)V
    .registers 7
    .param p1, "parent"    # Landroid/view/ViewParent;
    .param p2, "target"    # Landroid/view/View;
    .param p3, "dxConsumed"    # I
    .param p4, "dyConsumed"    # I
    .param p5, "dxUnconsumed"    # I
    .param p6, "dyUnconsumed"    # I

    .line 177
    invoke-static/range {p1 .. p6}, Landroid/support/v4/view/ViewParentCompatLollipop;->onNestedScroll(Landroid/view/ViewParent;Landroid/view/View;IIII)V

    .line 179
    return-void
.end method

.method public onNestedScrollAccepted(Landroid/view/ViewParent;Landroid/view/View;Landroid/view/View;I)V
    .registers 5
    .param p1, "parent"    # Landroid/view/ViewParent;
    .param p2, "child"    # Landroid/view/View;
    .param p3, "target"    # Landroid/view/View;
    .param p4, "nestedScrollAxes"    # I

    .line 165
    invoke-static {p1, p2, p3, p4}, Landroid/support/v4/view/ViewParentCompatLollipop;->onNestedScrollAccepted(Landroid/view/ViewParent;Landroid/view/View;Landroid/view/View;I)V

    .line 167
    return-void
.end method

.method public onStartNestedScroll(Landroid/view/ViewParent;Landroid/view/View;Landroid/view/View;I)Z
    .registers 6
    .param p1, "parent"    # Landroid/view/ViewParent;
    .param p2, "child"    # Landroid/view/View;
    .param p3, "target"    # Landroid/view/View;
    .param p4, "nestedScrollAxes"    # I

    .line 158
    invoke-static {p1, p2, p3, p4}, Landroid/support/v4/view/ViewParentCompatLollipop;->onStartNestedScroll(Landroid/view/ViewParent;Landroid/view/View;Landroid/view/View;I)Z

    move-result v0

    return v0
.end method

.method public onStopNestedScroll(Landroid/view/ViewParent;Landroid/view/View;)V
    .registers 3
    .param p1, "parent"    # Landroid/view/ViewParent;
    .param p2, "target"    # Landroid/view/View;

    .line 171
    invoke-static {p1, p2}, Landroid/support/v4/view/ViewParentCompatLollipop;->onStopNestedScroll(Landroid/view/ViewParent;Landroid/view/View;)V

    .line 172
    return-void
.end method
