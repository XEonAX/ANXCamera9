.class Lcom/android/camera/fragment/FragmentBottomPopupTips$6;
.super Landroid/animation/AnimatorListenerAdapter;
.source "FragmentBottomPopupTips.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/FragmentBottomPopupTips;->startLeftImageIntroAnim(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private cancelled:Z

.field final synthetic this$0:Lcom/android/camera/fragment/FragmentBottomPopupTips;


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/FragmentBottomPopupTips;)V
    .locals 0

    .line 1654
    iput-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips$6;->this$0:Lcom/android/camera/fragment/FragmentBottomPopupTips;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 0

    .line 1664
    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips$6;->cancelled:Z

    .line 1665
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 0

    .line 1669
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips$6;->this$0:Lcom/android/camera/fragment/FragmentBottomPopupTips;

    invoke-virtual {p1}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->canProvide()Z

    move-result p1

    if-nez p1, :cond_0

    .line 1670
    return-void

    .line 1672
    :cond_0
    iget-boolean p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips$6;->cancelled:Z

    if-nez p1, :cond_1

    .line 1673
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips$6;->this$0:Lcom/android/camera/fragment/FragmentBottomPopupTips;

    invoke-static {p1}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->access$700(Lcom/android/camera/fragment/FragmentBottomPopupTips;)V

    .line 1674
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips$6;->this$0:Lcom/android/camera/fragment/FragmentBottomPopupTips;

    invoke-virtual {p1}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->updateLeftTipImage()V

    .line 1676
    :cond_1
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 0

    .line 1659
    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips$6;->cancelled:Z

    .line 1660
    return-void
.end method
