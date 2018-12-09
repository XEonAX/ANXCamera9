.class Lcom/android/camera/fragment/bottom/FragmentBottomAction$4;
.super Ljava/lang/Object;
.source "FragmentBottomAction.java"

# interfaces
.implements Landroid/support/v4/view/ViewPropertyAnimatorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/bottom/FragmentBottomAction;->startExtraLayoutExchangeAnimation(Landroid/view/View;)V
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

    .line 505
    iput-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$4;->this$0:Lcom/android/camera/fragment/bottom/FragmentBottomAction;

    iput-object p2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$4;->val$layout:Landroid/view/View;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/view/View;)V
    .locals 0

    .line 519
    return-void
.end method

.method public onAnimationEnd(Landroid/view/View;)V
    .locals 1

    .line 513
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$4;->val$layout:Landroid/view/View;

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 514
    return-void
.end method

.method public onAnimationStart(Landroid/view/View;)V
    .locals 0

    .line 509
    return-void
.end method
