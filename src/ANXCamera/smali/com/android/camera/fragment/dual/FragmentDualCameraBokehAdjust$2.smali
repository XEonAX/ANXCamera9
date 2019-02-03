.class Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust$2;
.super Ljava/lang/Object;
.source "FragmentDualCameraBokehAdjust.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private mAnimated:Z

.field final synthetic this$0:Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;)V
    .locals 0

    .line 106
    iput-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust$2;->this$0:Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 107
    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust$2;->mAnimated:Z

    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 3

    .line 111
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result p1

    const/4 v0, 0x0

    const/4 v1, 0x1

    const/4 v2, 0x2

    if-ne p1, v2, :cond_0

    .line 112
    iget-boolean p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust$2;->mAnimated:Z

    if-nez p1, :cond_2

    .line 113
    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust$2;->this$0:Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;

    invoke-static {p1}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->access$000(Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;)Landroid/animation/AnimatorSet;

    move-result-object p1

    invoke-virtual {p1}, Landroid/animation/AnimatorSet;->start()V

    .line 114
    iput-boolean v1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust$2;->mAnimated:Z

    goto :goto_0

    .line 116
    :cond_0
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result p1

    if-eq p1, v1, :cond_1

    .line 117
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result p1

    const/4 p2, 0x3

    if-ne p1, p2, :cond_2

    .line 118
    :cond_1
    iget-boolean p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust$2;->mAnimated:Z

    if-eqz p1, :cond_2

    .line 119
    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust$2;->this$0:Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;

    invoke-static {p1}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->access$100(Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;)Landroid/animation/AnimatorSet;

    move-result-object p1

    invoke-virtual {p1}, Landroid/animation/AnimatorSet;->start()V

    .line 120
    iput-boolean v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust$2;->mAnimated:Z

    .line 123
    :cond_2
    :goto_0
    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust$2;->this$0:Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;

    invoke-static {p1}, Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;->access$200(Lcom/android/camera/fragment/dual/FragmentDualCameraBokehAdjust;)V

    .line 124
    return v0
.end method
