.class Lcom/android/camera/ActivityBase$7$1;
.super Ljava/lang/Object;
.source "ActivityBase.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/ActivityBase$7;->onFrameAvailable(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/android/camera/ActivityBase$7;


# direct methods
.method constructor <init>(Lcom/android/camera/ActivityBase$7;)V
    .locals 0

    .line 639
    iput-object p1, p0, Lcom/android/camera/ActivityBase$7$1;->this$1:Lcom/android/camera/ActivityBase$7;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 642
    iget-object v0, p0, Lcom/android/camera/ActivityBase$7$1;->this$1:Lcom/android/camera/ActivityBase$7;

    iget-object v0, v0, Lcom/android/camera/ActivityBase$7;->this$0:Lcom/android/camera/ActivityBase;

    iget-object v0, v0, Lcom/android/camera/ActivityBase;->mGLCoverView:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    new-instance v1, Lcom/android/camera/ActivityBase$7$1$1;

    invoke-direct {v1, p0}, Lcom/android/camera/ActivityBase$7$1$1;-><init>(Lcom/android/camera/ActivityBase$7$1;)V

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    .line 647
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 648
    return-void
.end method
