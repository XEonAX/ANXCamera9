.class Landroid/support/v7/widget/StaggeredGridLayoutManager$2;
.super Landroid/support/v7/widget/LinearSmoothScroller;
.source "StaggeredGridLayoutManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/support/v7/widget/StaggeredGridLayoutManager;->smoothScrollToPosition(Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$State;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroid/support/v7/widget/StaggeredGridLayoutManager;


# direct methods
.method constructor <init>(Landroid/support/v7/widget/StaggeredGridLayoutManager;Landroid/content/Context;)V
    .registers 3
    .param p2, "x0"    # Landroid/content/Context;

    .line 1860
    iput-object p1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$2;->this$0:Landroid/support/v7/widget/StaggeredGridLayoutManager;

    invoke-direct {p0, p2}, Landroid/support/v7/widget/LinearSmoothScroller;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public computeScrollVectorForPosition(I)Landroid/graphics/PointF;
    .registers 6
    .param p1, "targetPosition"    # I

    .line 1863
    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$2;->this$0:Landroid/support/v7/widget/StaggeredGridLayoutManager;

    # invokes: Landroid/support/v7/widget/StaggeredGridLayoutManager;->calculateScrollDirectionForPosition(I)I
    invoke-static {v0, p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->access$400(Landroid/support/v7/widget/StaggeredGridLayoutManager;I)I

    move-result v0

    .line 1864
    .local v0, "direction":I
    if-nez v0, :cond_a

    .line 1865
    const/4 v1, 0x0

    return-object v1

    .line 1867
    :cond_a
    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$2;->this$0:Landroid/support/v7/widget/StaggeredGridLayoutManager;

    # getter for: Landroid/support/v7/widget/StaggeredGridLayoutManager;->mOrientation:I
    invoke-static {v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->access$500(Landroid/support/v7/widget/StaggeredGridLayoutManager;)I

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_1a

    .line 1868
    new-instance v1, Landroid/graphics/PointF;

    int-to-float v3, v0

    invoke-direct {v1, v3, v2}, Landroid/graphics/PointF;-><init>(FF)V

    return-object v1

    .line 1870
    :cond_1a
    new-instance v1, Landroid/graphics/PointF;

    int-to-float v3, v0

    invoke-direct {v1, v2, v3}, Landroid/graphics/PointF;-><init>(FF)V

    return-object v1
.end method
