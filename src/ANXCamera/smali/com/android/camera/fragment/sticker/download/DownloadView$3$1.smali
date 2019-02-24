.class Lcom/android/camera/fragment/sticker/download/DownloadView$3$1;
.super Lcom/android/camera/fragment/sticker/download/DownloadView$MyAnimalListener;
.source "DownloadView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/sticker/download/DownloadView$3;->onAnimationEnd(Landroid/animation/Animator;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/android/camera/fragment/sticker/download/DownloadView$3;


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/sticker/download/DownloadView$3;)V
    .locals 1

    .line 87
    iput-object p1, p0, Lcom/android/camera/fragment/sticker/download/DownloadView$3$1;->this$1:Lcom/android/camera/fragment/sticker/download/DownloadView$3;

    iget-object p1, p1, Lcom/android/camera/fragment/sticker/download/DownloadView$3;->this$0:Lcom/android/camera/fragment/sticker/download/DownloadView;

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/android/camera/fragment/sticker/download/DownloadView$MyAnimalListener;-><init>(Lcom/android/camera/fragment/sticker/download/DownloadView;Lcom/android/camera/fragment/sticker/download/DownloadView$1;)V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 2

    .line 90
    iget-object p1, p0, Lcom/android/camera/fragment/sticker/download/DownloadView$3$1;->this$1:Lcom/android/camera/fragment/sticker/download/DownloadView$3;

    iget-object p1, p1, Lcom/android/camera/fragment/sticker/download/DownloadView$3;->this$0:Lcom/android/camera/fragment/sticker/download/DownloadView;

    iget-object v0, p0, Lcom/android/camera/fragment/sticker/download/DownloadView$3$1;->this$1:Lcom/android/camera/fragment/sticker/download/DownloadView$3;

    iget-object v0, v0, Lcom/android/camera/fragment/sticker/download/DownloadView$3;->this$0:Lcom/android/camera/fragment/sticker/download/DownloadView;

    new-instance v1, Lcom/android/camera/fragment/sticker/download/DownloadView$3$1$1;

    invoke-direct {v1, p0}, Lcom/android/camera/fragment/sticker/download/DownloadView$3$1$1;-><init>(Lcom/android/camera/fragment/sticker/download/DownloadView$3$1;)V

    invoke-static {p1, v0, v1}, Lcom/android/camera/fragment/sticker/download/DownloadView;->access$500(Lcom/android/camera/fragment/sticker/download/DownloadView;Landroid/view/View;Landroid/animation/Animator$AnimatorListener;)V

    .line 98
    return-void
.end method
