.class Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust$6;
.super Ljava/lang/Object;
.source "FragmentDualCameraAdjust.java"

# interfaces
.implements Lio/reactivex/functions/Action;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->alphaOutZoomButtonAndSlideView()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;)V
    .locals 0

    .line 707
    iput-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust$6;->this$0:Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 710
    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust$6;->this$0:Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->access$1302(Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;Z)Z

    .line 711
    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust$6;->this$0:Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;

    invoke-static {v0}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->access$1400(Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;)Landroid/view/ViewGroup;

    move-result-object v0

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 712
    return-void
.end method
