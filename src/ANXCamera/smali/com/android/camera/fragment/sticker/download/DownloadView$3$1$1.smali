.class Lcom/android/camera/fragment/sticker/download/DownloadView$3$1$1;
.super Lcom/android/camera/fragment/sticker/download/DownloadView$MyAnimalListener;
.source "DownloadView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/sticker/download/DownloadView$3$1;->onAnimationEnd(Landroid/animation/Animator;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lcom/android/camera/fragment/sticker/download/DownloadView$3$1;


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/sticker/download/DownloadView$3$1;)V
    .locals 1

    .line 87
    iput-object p1, p0, Lcom/android/camera/fragment/sticker/download/DownloadView$3$1$1;->this$2:Lcom/android/camera/fragment/sticker/download/DownloadView$3$1;

    iget-object p1, p1, Lcom/android/camera/fragment/sticker/download/DownloadView$3$1;->this$1:Lcom/android/camera/fragment/sticker/download/DownloadView$3;

    iget-object p1, p1, Lcom/android/camera/fragment/sticker/download/DownloadView$3;->this$0:Lcom/android/camera/fragment/sticker/download/DownloadView;

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/android/camera/fragment/sticker/download/DownloadView$MyAnimalListener;-><init>(Lcom/android/camera/fragment/sticker/download/DownloadView;Lcom/android/camera/fragment/sticker/download/DownloadView$1;)V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1

    .line 90
    iget-object p1, p0, Lcom/android/camera/fragment/sticker/download/DownloadView$3$1$1;->this$2:Lcom/android/camera/fragment/sticker/download/DownloadView$3$1;

    iget-object p1, p1, Lcom/android/camera/fragment/sticker/download/DownloadView$3$1;->this$1:Lcom/android/camera/fragment/sticker/download/DownloadView$3;

    iget-object p1, p1, Lcom/android/camera/fragment/sticker/download/DownloadView$3;->this$0:Lcom/android/camera/fragment/sticker/download/DownloadView;

    invoke-static {p1}, Lcom/android/camera/fragment/sticker/download/DownloadView;->access$400(Lcom/android/camera/fragment/sticker/download/DownloadView;)Lcom/android/camera/fragment/sticker/download/DownloadView$OnDownloadSuccessListener;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 91
    iget-object p1, p0, Lcom/android/camera/fragment/sticker/download/DownloadView$3$1$1;->this$2:Lcom/android/camera/fragment/sticker/download/DownloadView$3$1;

    iget-object p1, p1, Lcom/android/camera/fragment/sticker/download/DownloadView$3$1;->this$1:Lcom/android/camera/fragment/sticker/download/DownloadView$3;

    iget-object p1, p1, Lcom/android/camera/fragment/sticker/download/DownloadView$3;->this$0:Lcom/android/camera/fragment/sticker/download/DownloadView;

    invoke-static {p1}, Lcom/android/camera/fragment/sticker/download/DownloadView;->access$400(Lcom/android/camera/fragment/sticker/download/DownloadView;)Lcom/android/camera/fragment/sticker/download/DownloadView$OnDownloadSuccessListener;

    move-result-object p1

    iget-object v0, p0, Lcom/android/camera/fragment/sticker/download/DownloadView$3$1$1;->this$2:Lcom/android/camera/fragment/sticker/download/DownloadView$3$1;

    iget-object v0, v0, Lcom/android/camera/fragment/sticker/download/DownloadView$3$1;->this$1:Lcom/android/camera/fragment/sticker/download/DownloadView$3;

    iget-object v0, v0, Lcom/android/camera/fragment/sticker/download/DownloadView$3;->this$0:Lcom/android/camera/fragment/sticker/download/DownloadView;

    invoke-interface {p1, v0}, Lcom/android/camera/fragment/sticker/download/DownloadView$OnDownloadSuccessListener;->onDownloadSuccess(Lcom/android/camera/fragment/sticker/download/DownloadView;)V

    .line 93
    :cond_0
    return-void
.end method
