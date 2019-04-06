.class Lcom/android/camera/fragment/FragmentWideSelfie$StillPreviewRender$1;
.super Ljava/lang/Object;
.source "FragmentWideSelfie.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/FragmentWideSelfie$StillPreviewRender;->onDrawFrame(Ljavax/microedition/khronos/opengles/GL10;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/android/camera/fragment/FragmentWideSelfie$StillPreviewRender;


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/FragmentWideSelfie$StillPreviewRender;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/fragment/FragmentWideSelfie$StillPreviewRender$1;->this$1:Lcom/android/camera/fragment/FragmentWideSelfie$StillPreviewRender;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentWideSelfie$StillPreviewRender$1;->this$1:Lcom/android/camera/fragment/FragmentWideSelfie$StillPreviewRender;

    iget-object v0, v0, Lcom/android/camera/fragment/FragmentWideSelfie$StillPreviewRender;->this$0:Lcom/android/camera/fragment/FragmentWideSelfie;

    invoke-static {v0}, Lcom/android/camera/fragment/FragmentWideSelfie;->access$100(Lcom/android/camera/fragment/FragmentWideSelfie;)Lcom/android/camera/ui/GLTextureView;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/ui/GLTextureView;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    return-void
.end method
