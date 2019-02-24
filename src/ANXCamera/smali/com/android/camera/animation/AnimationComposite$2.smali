.class Lcom/android/camera/animation/AnimationComposite$2;
.super Ljava/lang/Object;
.source "AnimationComposite.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/animation/AnimationComposite;->disposeRotation(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/animation/AnimationComposite;

.field final synthetic val$pendingViews:Ljava/util/List;


# direct methods
.method constructor <init>(Lcom/android/camera/animation/AnimationComposite;Ljava/util/List;)V
    .locals 0

    .line 214
    iput-object p1, p0, Lcom/android/camera/animation/AnimationComposite$2;->this$0:Lcom/android/camera/animation/AnimationComposite;

    iput-object p2, p0, Lcom/android/camera/animation/AnimationComposite$2;->val$pendingViews:Ljava/util/List;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 2

    .line 217
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    .line 218
    iget-object v0, p0, Lcom/android/camera/animation/AnimationComposite$2;->this$0:Lcom/android/camera/animation/AnimationComposite;

    invoke-static {v0, p1}, Lcom/android/camera/animation/AnimationComposite;->access$102(Lcom/android/camera/animation/AnimationComposite;I)I

    .line 219
    iget-object p1, p0, Lcom/android/camera/animation/AnimationComposite$2;->val$pendingViews:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    .line 220
    iget-object v1, p0, Lcom/android/camera/animation/AnimationComposite$2;->this$0:Lcom/android/camera/animation/AnimationComposite;

    invoke-static {v1}, Lcom/android/camera/animation/AnimationComposite;->access$100(Lcom/android/camera/animation/AnimationComposite;)I

    move-result v1

    int-to-float v1, v1

    invoke-static {v0, v1}, Landroid/support/v4/view/ViewCompat;->setRotation(Landroid/view/View;F)V

    .line 221
    goto :goto_0

    .line 222
    :cond_0
    return-void
.end method
