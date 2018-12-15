.class public abstract Landroid/support/v7/widget/RecyclerView$SmoothScroller;
.super Ljava/lang/Object;
.source "RecyclerView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v7/widget/RecyclerView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "SmoothScroller"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;
    }
.end annotation


# instance fields
.field private mLayoutManager:Landroid/support/v7/widget/RecyclerView$LayoutManager;

.field private mPendingInitialRun:Z

.field private mRecyclerView:Landroid/support/v7/widget/RecyclerView;

.field private final mRecyclingAction:Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;

.field private mRunning:Z

.field private mTargetPosition:I

.field private mTargetView:Landroid/view/View;


# direct methods
.method public constructor <init>()V
    .registers 3

    .line 8875
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8861
    const/4 v0, -0x1

    iput v0, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller;->mTargetPosition:I

    .line 8876
    new-instance v0, Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;

    const/4 v1, 0x0

    invoke-direct {v0, v1, v1}, Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;-><init>(II)V

    iput-object v0, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller;->mRecyclingAction:Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;

    .line 8877
    return-void
.end method

.method static synthetic access$2800(Landroid/support/v7/widget/RecyclerView$SmoothScroller;II)V
    .registers 3
    .param p0, "x0"    # Landroid/support/v7/widget/RecyclerView$SmoothScroller;
    .param p1, "x1"    # I
    .param p2, "x2"    # I

    .line 8859
    invoke-direct {p0, p1, p2}, Landroid/support/v7/widget/RecyclerView$SmoothScroller;->onAnimation(II)V

    return-void
.end method

.method private onAnimation(II)V
    .registers 7
    .param p1, "dx"    # I
    .param p2, "dy"    # I

    .line 8971
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    .line 8972
    .local v0, "recyclerView":Landroid/support/v7/widget/RecyclerView;
    iget-boolean v1, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller;->mRunning:Z

    if-eqz v1, :cond_d

    iget v1, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller;->mTargetPosition:I

    const/4 v2, -0x1

    if-eq v1, v2, :cond_d

    if-nez v0, :cond_10

    .line 8973
    :cond_d
    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView$SmoothScroller;->stop()V

    .line 8975
    :cond_10
    const/4 v1, 0x0

    iput-boolean v1, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller;->mPendingInitialRun:Z

    .line 8976
    iget-object v1, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller;->mTargetView:Landroid/view/View;

    if-eqz v1, :cond_3d

    .line 8978
    iget-object v1, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller;->mTargetView:Landroid/view/View;

    invoke-virtual {p0, v1}, Landroid/support/v7/widget/RecyclerView$SmoothScroller;->getChildPosition(Landroid/view/View;)I

    move-result v1

    iget v2, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller;->mTargetPosition:I

    if-ne v1, v2, :cond_33

    .line 8979
    iget-object v1, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller;->mTargetView:Landroid/view/View;

    iget-object v2, v0, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    iget-object v3, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller;->mRecyclingAction:Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;

    invoke-virtual {p0, v1, v2, v3}, Landroid/support/v7/widget/RecyclerView$SmoothScroller;->onTargetFound(Landroid/view/View;Landroid/support/v7/widget/RecyclerView$State;Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;)V

    .line 8980
    iget-object v1, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller;->mRecyclingAction:Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;

    # invokes: Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;->runIfNecessary(Landroid/support/v7/widget/RecyclerView;)V
    invoke-static {v1, v0}, Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;->access$5100(Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;Landroid/support/v7/widget/RecyclerView;)V

    .line 8981
    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView$SmoothScroller;->stop()V

    goto :goto_3d

    .line 8983
    :cond_33
    const-string v1, "RecyclerView"

    const-string v2, "Passed over target position while smooth scrolling."

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 8984
    const/4 v1, 0x0

    iput-object v1, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller;->mTargetView:Landroid/view/View;

    .line 8987
    :cond_3d
    :goto_3d
    iget-boolean v1, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller;->mRunning:Z

    if-eqz v1, :cond_67

    .line 8988
    iget-object v1, v0, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    iget-object v2, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller;->mRecyclingAction:Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;

    invoke-virtual {p0, p1, p2, v1, v2}, Landroid/support/v7/widget/RecyclerView$SmoothScroller;->onSeekTargetStep(IILandroid/support/v7/widget/RecyclerView$State;Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;)V

    .line 8989
    iget-object v1, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller;->mRecyclingAction:Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;

    invoke-virtual {v1}, Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;->hasJumpTarget()Z

    move-result v1

    .line 8990
    .local v1, "hadJumpTarget":Z
    iget-object v2, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller;->mRecyclingAction:Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;

    # invokes: Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;->runIfNecessary(Landroid/support/v7/widget/RecyclerView;)V
    invoke-static {v2, v0}, Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;->access$5100(Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;Landroid/support/v7/widget/RecyclerView;)V

    .line 8991
    if-eqz v1, :cond_67

    .line 8993
    iget-boolean v2, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller;->mRunning:Z

    if-eqz v2, :cond_64

    .line 8994
    const/4 v2, 0x1

    iput-boolean v2, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller;->mPendingInitialRun:Z

    .line 8995
    # getter for: Landroid/support/v7/widget/RecyclerView;->mViewFlinger:Landroid/support/v7/widget/RecyclerView$ViewFlinger;
    invoke-static {v0}, Landroid/support/v7/widget/RecyclerView;->access$4900(Landroid/support/v7/widget/RecyclerView;)Landroid/support/v7/widget/RecyclerView$ViewFlinger;

    move-result-object v2

    invoke-virtual {v2}, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->postOnAnimation()V

    goto :goto_67

    .line 8997
    :cond_64
    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView$SmoothScroller;->stop()V

    .line 9001
    .end local v1    # "hadJumpTarget":Z
    :cond_67
    :goto_67
    return-void
.end method


# virtual methods
.method public findViewByPosition(I)Landroid/view/View;
    .registers 3
    .param p1, "position"    # I

    .line 9021
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    # getter for: Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;
    invoke-static {v0}, Landroid/support/v7/widget/RecyclerView;->access$1300(Landroid/support/v7/widget/RecyclerView;)Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->findViewByPosition(I)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public getChildCount()I
    .registers 2

    .line 9014
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    # getter for: Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;
    invoke-static {v0}, Landroid/support/v7/widget/RecyclerView;->access$1300(Landroid/support/v7/widget/RecyclerView;)Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->getChildCount()I

    move-result v0

    return v0
.end method

.method public getChildPosition(Landroid/view/View;)I
    .registers 3
    .param p1, "view"    # Landroid/view/View;

    .line 9007
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/RecyclerView;->getChildLayoutPosition(Landroid/view/View;)I

    move-result v0

    return v0
.end method

.method public getLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;
    .registers 2
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .line 8915
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller;->mLayoutManager:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    return-object v0
.end method

.method public getTargetPosition()I
    .registers 2

    .line 8967
    iget v0, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller;->mTargetPosition:I

    return v0
.end method

.method public instantScrollToPosition(I)V
    .registers 3
    .param p1, "position"    # I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 9030
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/RecyclerView;->scrollToPosition(I)V

    .line 9031
    return-void
.end method

.method public isPendingInitialRun()Z
    .registers 2

    .line 8949
    iget-boolean v0, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller;->mPendingInitialRun:Z

    return v0
.end method

.method public isRunning()Z
    .registers 2

    .line 8957
    iget-boolean v0, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller;->mRunning:Z

    return v0
.end method

.method protected normalize(Landroid/graphics/PointF;)V
    .registers 6
    .param p1, "scrollVector"    # Landroid/graphics/PointF;

    .line 9047
    iget v0, p1, Landroid/graphics/PointF;->x:F

    iget v1, p1, Landroid/graphics/PointF;->x:F

    mul-float/2addr v0, v1

    iget v1, p1, Landroid/graphics/PointF;->y:F

    iget v2, p1, Landroid/graphics/PointF;->y:F

    mul-float/2addr v1, v2

    add-float/2addr v0, v1

    float-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    .line 9049
    .local v0, "magnitute":D
    iget v2, p1, Landroid/graphics/PointF;->x:F

    float-to-double v2, v2

    div-double/2addr v2, v0

    double-to-float v2, v2

    iput v2, p1, Landroid/graphics/PointF;->x:F

    .line 9050
    iget v2, p1, Landroid/graphics/PointF;->y:F

    float-to-double v2, v2

    div-double/2addr v2, v0

    double-to-float v2, v2

    iput v2, p1, Landroid/graphics/PointF;->y:F

    .line 9051
    return-void
.end method

.method protected onChildAttachedToWindow(Landroid/view/View;)V
    .registers 4
    .param p1, "child"    # Landroid/view/View;

    .line 9034
    invoke-virtual {p0, p1}, Landroid/support/v7/widget/RecyclerView$SmoothScroller;->getChildPosition(Landroid/view/View;)I

    move-result v0

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView$SmoothScroller;->getTargetPosition()I

    move-result v1

    if-ne v0, v1, :cond_c

    .line 9035
    iput-object p1, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller;->mTargetView:Landroid/view/View;

    .line 9040
    :cond_c
    return-void
.end method

.method protected abstract onSeekTargetStep(IILandroid/support/v7/widget/RecyclerView$State;Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;)V
.end method

.method protected abstract onStart()V
.end method

.method protected abstract onStop()V
.end method

.method protected abstract onTargetFound(Landroid/view/View;Landroid/support/v7/widget/RecyclerView$State;Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;)V
.end method

.method public setTargetPosition(I)V
    .registers 2
    .param p1, "targetPosition"    # I

    .line 8906
    iput p1, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller;->mTargetPosition:I

    .line 8907
    return-void
.end method

.method start(Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$LayoutManager;)V
    .registers 5
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;
    .param p2, "layoutManager"    # Landroid/support/v7/widget/RecyclerView$LayoutManager;

    .line 8892
    iput-object p1, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    .line 8893
    iput-object p2, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller;->mLayoutManager:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    .line 8894
    iget v0, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller;->mTargetPosition:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_2e

    .line 8897
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    iget-object v0, v0, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    iget v1, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller;->mTargetPosition:I

    # setter for: Landroid/support/v7/widget/RecyclerView$State;->mTargetPosition:I
    invoke-static {v0, v1}, Landroid/support/v7/widget/RecyclerView$State;->access$4802(Landroid/support/v7/widget/RecyclerView$State;I)I

    .line 8898
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller;->mRunning:Z

    .line 8899
    iput-boolean v0, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller;->mPendingInitialRun:Z

    .line 8900
    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView$SmoothScroller;->getTargetPosition()I

    move-result v0

    invoke-virtual {p0, v0}, Landroid/support/v7/widget/RecyclerView$SmoothScroller;->findViewByPosition(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller;->mTargetView:Landroid/view/View;

    .line 8901
    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView$SmoothScroller;->onStart()V

    .line 8902
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    # getter for: Landroid/support/v7/widget/RecyclerView;->mViewFlinger:Landroid/support/v7/widget/RecyclerView$ViewFlinger;
    invoke-static {v0}, Landroid/support/v7/widget/RecyclerView;->access$4900(Landroid/support/v7/widget/RecyclerView;)Landroid/support/v7/widget/RecyclerView$ViewFlinger;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->postOnAnimation()V

    .line 8903
    return-void

    .line 8895
    :cond_2e
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Invalid target position"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected final stop()V
    .registers 3

    .line 8925
    iget-boolean v0, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller;->mRunning:Z

    if-nez v0, :cond_5

    .line 8926
    return-void

    .line 8928
    :cond_5
    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView$SmoothScroller;->onStop()V

    .line 8929
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    iget-object v0, v0, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    const/4 v1, -0x1

    # setter for: Landroid/support/v7/widget/RecyclerView$State;->mTargetPosition:I
    invoke-static {v0, v1}, Landroid/support/v7/widget/RecyclerView$State;->access$4802(Landroid/support/v7/widget/RecyclerView$State;I)I

    .line 8930
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller;->mTargetView:Landroid/view/View;

    .line 8931
    iput v1, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller;->mTargetPosition:I

    .line 8932
    const/4 v1, 0x0

    iput-boolean v1, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller;->mPendingInitialRun:Z

    .line 8933
    iput-boolean v1, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller;->mRunning:Z

    .line 8935
    iget-object v1, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller;->mLayoutManager:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    # invokes: Landroid/support/v7/widget/RecyclerView$LayoutManager;->onSmoothScrollerStopped(Landroid/support/v7/widget/RecyclerView$SmoothScroller;)V
    invoke-static {v1, p0}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->access$5000(Landroid/support/v7/widget/RecyclerView$LayoutManager;Landroid/support/v7/widget/RecyclerView$SmoothScroller;)V

    .line 8937
    iput-object v0, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller;->mLayoutManager:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    .line 8938
    iput-object v0, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    .line 8939
    return-void
.end method
