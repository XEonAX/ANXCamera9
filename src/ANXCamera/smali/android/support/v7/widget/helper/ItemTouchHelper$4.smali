.class Landroid/support/v7/widget/helper/ItemTouchHelper$4;
.super Ljava/lang/Object;
.source "ItemTouchHelper.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/support/v7/widget/helper/ItemTouchHelper;->postDispatchSwipe(Landroid/support/v7/widget/helper/ItemTouchHelper$RecoverAnimation;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroid/support/v7/widget/helper/ItemTouchHelper;

.field final synthetic val$anim:Landroid/support/v7/widget/helper/ItemTouchHelper$RecoverAnimation;

.field final synthetic val$swipeDir:I


# direct methods
.method constructor <init>(Landroid/support/v7/widget/helper/ItemTouchHelper;Landroid/support/v7/widget/helper/ItemTouchHelper$RecoverAnimation;I)V
    .registers 4

    .line 657
    iput-object p1, p0, Landroid/support/v7/widget/helper/ItemTouchHelper$4;->this$0:Landroid/support/v7/widget/helper/ItemTouchHelper;

    iput-object p2, p0, Landroid/support/v7/widget/helper/ItemTouchHelper$4;->val$anim:Landroid/support/v7/widget/helper/ItemTouchHelper$RecoverAnimation;

    iput p3, p0, Landroid/support/v7/widget/helper/ItemTouchHelper$4;->val$swipeDir:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 5

    .line 660
    iget-object v0, p0, Landroid/support/v7/widget/helper/ItemTouchHelper$4;->this$0:Landroid/support/v7/widget/helper/ItemTouchHelper;

    # getter for: Landroid/support/v7/widget/helper/ItemTouchHelper;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;
    invoke-static {v0}, Landroid/support/v7/widget/helper/ItemTouchHelper;->access$300(Landroid/support/v7/widget/helper/ItemTouchHelper;)Landroid/support/v7/widget/RecyclerView;

    move-result-object v0

    if-eqz v0, :cond_57

    iget-object v0, p0, Landroid/support/v7/widget/helper/ItemTouchHelper$4;->this$0:Landroid/support/v7/widget/helper/ItemTouchHelper;

    # getter for: Landroid/support/v7/widget/helper/ItemTouchHelper;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;
    invoke-static {v0}, Landroid/support/v7/widget/helper/ItemTouchHelper;->access$300(Landroid/support/v7/widget/helper/ItemTouchHelper;)Landroid/support/v7/widget/RecyclerView;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView;->isAttachedToWindow()Z

    move-result v0

    if-eqz v0, :cond_57

    iget-object v0, p0, Landroid/support/v7/widget/helper/ItemTouchHelper$4;->val$anim:Landroid/support/v7/widget/helper/ItemTouchHelper$RecoverAnimation;

    iget-boolean v0, v0, Landroid/support/v7/widget/helper/ItemTouchHelper$RecoverAnimation;->mOverridden:Z

    if-nez v0, :cond_57

    iget-object v0, p0, Landroid/support/v7/widget/helper/ItemTouchHelper$4;->val$anim:Landroid/support/v7/widget/helper/ItemTouchHelper$RecoverAnimation;

    iget-object v0, v0, Landroid/support/v7/widget/helper/ItemTouchHelper$RecoverAnimation;->mViewHolder:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->getAdapterPosition()I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_57

    .line 663
    iget-object v0, p0, Landroid/support/v7/widget/helper/ItemTouchHelper$4;->this$0:Landroid/support/v7/widget/helper/ItemTouchHelper;

    # getter for: Landroid/support/v7/widget/helper/ItemTouchHelper;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;
    invoke-static {v0}, Landroid/support/v7/widget/helper/ItemTouchHelper;->access$300(Landroid/support/v7/widget/helper/ItemTouchHelper;)Landroid/support/v7/widget/RecyclerView;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView;->getItemAnimator()Landroid/support/v7/widget/RecyclerView$ItemAnimator;

    move-result-object v0

    .line 667
    .local v0, "animator":Landroid/support/v7/widget/RecyclerView$ItemAnimator;
    if-eqz v0, :cond_38

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->isRunning(Landroid/support/v7/widget/RecyclerView$ItemAnimator$ItemAnimatorFinishedListener;)Z

    move-result v1

    if-nez v1, :cond_4e

    :cond_38
    iget-object v1, p0, Landroid/support/v7/widget/helper/ItemTouchHelper$4;->this$0:Landroid/support/v7/widget/helper/ItemTouchHelper;

    # invokes: Landroid/support/v7/widget/helper/ItemTouchHelper;->hasRunningRecoverAnim()Z
    invoke-static {v1}, Landroid/support/v7/widget/helper/ItemTouchHelper;->access$1800(Landroid/support/v7/widget/helper/ItemTouchHelper;)Z

    move-result v1

    if-nez v1, :cond_4e

    .line 669
    iget-object v1, p0, Landroid/support/v7/widget/helper/ItemTouchHelper$4;->this$0:Landroid/support/v7/widget/helper/ItemTouchHelper;

    iget-object v1, v1, Landroid/support/v7/widget/helper/ItemTouchHelper;->mCallback:Landroid/support/v7/widget/helper/ItemTouchHelper$Callback;

    iget-object v2, p0, Landroid/support/v7/widget/helper/ItemTouchHelper$4;->val$anim:Landroid/support/v7/widget/helper/ItemTouchHelper$RecoverAnimation;

    iget-object v2, v2, Landroid/support/v7/widget/helper/ItemTouchHelper$RecoverAnimation;->mViewHolder:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    iget v3, p0, Landroid/support/v7/widget/helper/ItemTouchHelper$4;->val$swipeDir:I

    invoke-virtual {v1, v2, v3}, Landroid/support/v7/widget/helper/ItemTouchHelper$Callback;->onSwiped(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V

    goto :goto_57

    .line 671
    :cond_4e
    iget-object v1, p0, Landroid/support/v7/widget/helper/ItemTouchHelper$4;->this$0:Landroid/support/v7/widget/helper/ItemTouchHelper;

    # getter for: Landroid/support/v7/widget/helper/ItemTouchHelper;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;
    invoke-static {v1}, Landroid/support/v7/widget/helper/ItemTouchHelper;->access$300(Landroid/support/v7/widget/helper/ItemTouchHelper;)Landroid/support/v7/widget/RecyclerView;

    move-result-object v1

    invoke-virtual {v1, p0}, Landroid/support/v7/widget/RecyclerView;->post(Ljava/lang/Runnable;)Z

    .line 674
    .end local v0    # "animator":Landroid/support/v7/widget/RecyclerView$ItemAnimator;
    :cond_57
    :goto_57
    return-void
.end method
