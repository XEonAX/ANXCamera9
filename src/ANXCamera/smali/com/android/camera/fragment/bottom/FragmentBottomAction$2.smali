.class Lcom/android/camera/fragment/bottom/FragmentBottomAction$2;
.super Ljava/lang/Object;
.source "FragmentBottomAction.java"

# interfaces
.implements Landroid/support/v4/view/ViewPropertyAnimatorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/bottom/FragmentBottomAction;->startExtraLayoutAnimation(Landroid/view/View;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/fragment/bottom/FragmentBottomAction;

.field final synthetic val$layout:Landroid/view/View;


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/bottom/FragmentBottomAction;Landroid/view/View;)V
    .locals 0

    .line 466
    iput-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$2;->this$0:Lcom/android/camera/fragment/bottom/FragmentBottomAction;

    iput-object p2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$2;->val$layout:Landroid/view/View;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/view/View;)V
    .locals 0

    .line 480
    return-void
.end method

.method public onAnimationEnd(Landroid/view/View;)V
    .locals 1

    .line 474
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$2;->this$0:Lcom/android/camera/fragment/bottom/FragmentBottomAction;

    invoke-static {p1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->access$100(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)Lcom/android/camera/ui/ModeSelectView;

    move-result-object p1

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Lcom/android/camera/ui/ModeSelectView;->setVisibility(I)V

    .line 475
    return-void
.end method

.method public onAnimationStart(Landroid/view/View;)V
    .locals 1

    .line 469
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$2;->val$layout:Landroid/view/View;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 470
    return-void
.end method
