.class Lcom/android/camera/fragment/DefaultItemAnimator$5;
.super Lcom/android/camera/fragment/DefaultItemAnimator$VpaListenerAdapter;
.source "DefaultItemAnimator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/DefaultItemAnimator;->animateAddImpl(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/fragment/DefaultItemAnimator;

.field final synthetic val$animation:Landroid/support/v4/view/ViewPropertyAnimatorCompat;

.field final synthetic val$holder:Landroid/support/v7/widget/RecyclerView$ViewHolder;


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/DefaultItemAnimator;Landroid/support/v7/widget/RecyclerView$ViewHolder;Landroid/support/v4/view/ViewPropertyAnimatorCompat;)V
    .locals 0

    .line 213
    iput-object p1, p0, Lcom/android/camera/fragment/DefaultItemAnimator$5;->this$0:Lcom/android/camera/fragment/DefaultItemAnimator;

    iput-object p2, p0, Lcom/android/camera/fragment/DefaultItemAnimator$5;->val$holder:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    iput-object p3, p0, Lcom/android/camera/fragment/DefaultItemAnimator$5;->val$animation:Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lcom/android/camera/fragment/DefaultItemAnimator$VpaListenerAdapter;-><init>(Lcom/android/camera/fragment/DefaultItemAnimator$1;)V

    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/view/View;)V
    .locals 1

    .line 221
    const/4 v0, 0x0

    invoke-static {p1, v0}, Landroid/support/v4/view/ViewCompat;->setTranslationX(Landroid/view/View;F)V

    .line 222
    return-void
.end method

.method public onAnimationEnd(Landroid/view/View;)V
    .locals 1

    .line 226
    iget-object p1, p0, Lcom/android/camera/fragment/DefaultItemAnimator$5;->val$animation:Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setListener(Landroid/support/v4/view/ViewPropertyAnimatorListener;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    .line 227
    iget-object p1, p0, Lcom/android/camera/fragment/DefaultItemAnimator$5;->this$0:Lcom/android/camera/fragment/DefaultItemAnimator;

    iget-object v0, p0, Lcom/android/camera/fragment/DefaultItemAnimator$5;->val$holder:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    invoke-virtual {p1, v0}, Lcom/android/camera/fragment/DefaultItemAnimator;->dispatchAddFinished(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    .line 228
    iget-object p1, p0, Lcom/android/camera/fragment/DefaultItemAnimator$5;->this$0:Lcom/android/camera/fragment/DefaultItemAnimator;

    invoke-static {p1}, Lcom/android/camera/fragment/DefaultItemAnimator;->access$900(Lcom/android/camera/fragment/DefaultItemAnimator;)Ljava/util/ArrayList;

    move-result-object p1

    iget-object v0, p0, Lcom/android/camera/fragment/DefaultItemAnimator$5;->val$holder:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 229
    iget-object p1, p0, Lcom/android/camera/fragment/DefaultItemAnimator$5;->this$0:Lcom/android/camera/fragment/DefaultItemAnimator;

    invoke-static {p1}, Lcom/android/camera/fragment/DefaultItemAnimator;->access$800(Lcom/android/camera/fragment/DefaultItemAnimator;)V

    .line 230
    return-void
.end method

.method public onAnimationStart(Landroid/view/View;)V
    .locals 1

    .line 216
    iget-object p1, p0, Lcom/android/camera/fragment/DefaultItemAnimator$5;->this$0:Lcom/android/camera/fragment/DefaultItemAnimator;

    iget-object v0, p0, Lcom/android/camera/fragment/DefaultItemAnimator$5;->val$holder:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    invoke-virtual {p1, v0}, Lcom/android/camera/fragment/DefaultItemAnimator;->dispatchAddStarting(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    .line 217
    return-void
.end method
