.class Lcom/android/camera/fragment/bottom/FragmentBottomAction$6;
.super Ljava/lang/Object;
.source "FragmentBottomAction.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/bottom/FragmentBottomAction;->setProgressBarVisible()V
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

    .line 837
    iput-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$6;->this$0:Lcom/android/camera/fragment/bottom/FragmentBottomAction;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 4

    .line 840
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Float;

    .line 841
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$6;->this$0:Lcom/android/camera/fragment/bottom/FragmentBottomAction;

    invoke-static {v0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->access$300(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)Landroid/widget/ProgressBar;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setAlpha(F)V

    .line 842
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$6;->this$0:Lcom/android/camera/fragment/bottom/FragmentBottomAction;

    invoke-static {v0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->access$300(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)Landroid/widget/ProgressBar;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    const v2, 0x3dcccccd    # 0.1f

    mul-float/2addr v1, v2

    const v3, 0x3f666666    # 0.9f

    add-float/2addr v1, v3

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setScaleX(F)V

    .line 843
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$6;->this$0:Lcom/android/camera/fragment/bottom/FragmentBottomAction;

    invoke-static {v0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->access$300(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)Landroid/widget/ProgressBar;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result p1

    mul-float/2addr v2, p1

    add-float/2addr v3, v2

    invoke-virtual {v0, v3}, Landroid/widget/ProgressBar;->setScaleY(F)V

    .line 844
    return-void
.end method
