.class Lcom/android/camera/fragment/bottom/FragmentBottomAction$7;
.super Ljava/lang/Object;
.source "FragmentBottomAction.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/bottom/FragmentBottomAction;->setProgressBarGone()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/fragment/bottom/FragmentBottomAction;


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)V
    .locals 0

    .line 856
    iput-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$7;->this$0:Lcom/android/camera/fragment/bottom/FragmentBottomAction;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 859
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Float;

    .line 860
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$7;->this$0:Lcom/android/camera/fragment/bottom/FragmentBottomAction;

    invoke-static {v0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->access$300(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)Landroid/widget/ProgressBar;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result p1

    invoke-virtual {v0, p1}, Landroid/widget/ProgressBar;->setAlpha(F)V

    .line 861
    return-void
.end method
