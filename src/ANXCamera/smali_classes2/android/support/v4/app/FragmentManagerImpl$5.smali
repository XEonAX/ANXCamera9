.class Landroid/support/v4/app/FragmentManagerImpl$5;
.super Landroid/support/v4/app/FragmentManagerImpl$AnimateOnHWLayerIfNeededListener;
.source "FragmentManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/support/v4/app/FragmentManagerImpl;->moveToState(Landroid/support/v4/app/Fragment;IIIZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroid/support/v4/app/FragmentManagerImpl;

.field final synthetic val$fragment:Landroid/support/v4/app/Fragment;


# direct methods
.method constructor <init>(Landroid/support/v4/app/FragmentManagerImpl;Landroid/view/View;Landroid/view/animation/Animation;Landroid/support/v4/app/Fragment;)V
    .registers 5
    .param p2, "x0"    # Landroid/view/View;
    .param p3, "x1"    # Landroid/view/animation/Animation;

    .line 1105
    iput-object p1, p0, Landroid/support/v4/app/FragmentManagerImpl$5;->this$0:Landroid/support/v4/app/FragmentManagerImpl;

    iput-object p4, p0, Landroid/support/v4/app/FragmentManagerImpl$5;->val$fragment:Landroid/support/v4/app/Fragment;

    invoke-direct {p0, p2, p3}, Landroid/support/v4/app/FragmentManagerImpl$AnimateOnHWLayerIfNeededListener;-><init>(Landroid/view/View;Landroid/view/animation/Animation;)V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/view/animation/Animation;)V
    .registers 10
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .line 1108
    invoke-super {p0, p1}, Landroid/support/v4/app/FragmentManagerImpl$AnimateOnHWLayerIfNeededListener;->onAnimationEnd(Landroid/view/animation/Animation;)V

    .line 1109
    iget-object v0, p0, Landroid/support/v4/app/FragmentManagerImpl$5;->val$fragment:Landroid/support/v4/app/Fragment;

    iget-object v0, v0, Landroid/support/v4/app/Fragment;->mAnimatingAway:Landroid/view/View;

    if-eqz v0, :cond_1c

    .line 1110
    iget-object v0, p0, Landroid/support/v4/app/FragmentManagerImpl$5;->val$fragment:Landroid/support/v4/app/Fragment;

    const/4 v1, 0x0

    iput-object v1, v0, Landroid/support/v4/app/Fragment;->mAnimatingAway:Landroid/view/View;

    .line 1111
    iget-object v2, p0, Landroid/support/v4/app/FragmentManagerImpl$5;->this$0:Landroid/support/v4/app/FragmentManagerImpl;

    iget-object v3, p0, Landroid/support/v4/app/FragmentManagerImpl$5;->val$fragment:Landroid/support/v4/app/Fragment;

    iget-object v0, p0, Landroid/support/v4/app/FragmentManagerImpl$5;->val$fragment:Landroid/support/v4/app/Fragment;

    iget v4, v0, Landroid/support/v4/app/Fragment;->mStateAfterAnimating:I

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual/range {v2 .. v7}, Landroid/support/v4/app/FragmentManagerImpl;->moveToState(Landroid/support/v4/app/Fragment;IIIZ)V

    .line 1114
    :cond_1c
    return-void
.end method
