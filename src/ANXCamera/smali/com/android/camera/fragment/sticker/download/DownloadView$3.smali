.class Lcom/android/camera/fragment/sticker/download/DownloadView$3;
.super Lcom/android/camera/fragment/sticker/download/DownloadView$MyAnimalListener;
.source "DownloadView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/sticker/download/DownloadView;->endDownloading()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/fragment/sticker/download/DownloadView;


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/sticker/download/DownloadView;)V
    .locals 1

    .line 76
    iput-object p1, p0, Lcom/android/camera/fragment/sticker/download/DownloadView$3;->this$0:Lcom/android/camera/fragment/sticker/download/DownloadView;

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/android/camera/fragment/sticker/download/DownloadView$MyAnimalListener;-><init>(Lcom/android/camera/fragment/sticker/download/DownloadView;Lcom/android/camera/fragment/sticker/download/DownloadView$1;)V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 2

    .line 79
    iget-object p1, p0, Lcom/android/camera/fragment/sticker/download/DownloadView$3;->this$0:Lcom/android/camera/fragment/sticker/download/DownloadView;

    invoke-static {p1}, Lcom/android/camera/fragment/sticker/download/DownloadView;->access$300(Lcom/android/camera/fragment/sticker/download/DownloadView;)Landroid/widget/ImageView;

    move-result-object p1

    iget-object v0, p0, Lcom/android/camera/fragment/sticker/download/DownloadView$3;->this$0:Lcom/android/camera/fragment/sticker/download/DownloadView;

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Lcom/android/camera/fragment/sticker/download/DownloadView;->getStateImageResource(I)I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 80
    iget-object p1, p0, Lcom/android/camera/fragment/sticker/download/DownloadView$3;->this$0:Lcom/android/camera/fragment/sticker/download/DownloadView;

    iget-object v0, p0, Lcom/android/camera/fragment/sticker/download/DownloadView$3;->this$0:Lcom/android/camera/fragment/sticker/download/DownloadView;

    invoke-static {v0}, Lcom/android/camera/fragment/sticker/download/DownloadView;->access$300(Lcom/android/camera/fragment/sticker/download/DownloadView;)Landroid/widget/ImageView;

    move-result-object v0

    new-instance v1, Lcom/android/camera/fragment/sticker/download/DownloadView$3$1;

    invoke-direct {v1, p0}, Lcom/android/camera/fragment/sticker/download/DownloadView$3$1;-><init>(Lcom/android/camera/fragment/sticker/download/DownloadView$3;)V

    invoke-static {p1, v0, v1}, Lcom/android/camera/fragment/sticker/download/DownloadView;->access$500(Lcom/android/camera/fragment/sticker/download/DownloadView;Landroid/view/View;Landroid/animation/Animator$AnimatorListener;)V

    .line 86
    return-void
.end method
