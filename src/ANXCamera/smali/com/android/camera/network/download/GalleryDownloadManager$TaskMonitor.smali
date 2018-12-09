.class Lcom/android/camera/network/download/GalleryDownloadManager$TaskMonitor;
.super Ljava/lang/Object;
.source "GalleryDownloadManager.java"

# interfaces
.implements Lcom/android/camera/network/download/DownloadTask$OnCompleteListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/network/download/GalleryDownloadManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "TaskMonitor"
.end annotation


# instance fields
.field private mWrapped:Lcom/android/camera/network/download/DownloadTask$OnCompleteListener;

.field final synthetic this$0:Lcom/android/camera/network/download/GalleryDownloadManager;


# direct methods
.method constructor <init>(Lcom/android/camera/network/download/GalleryDownloadManager;Lcom/android/camera/network/download/DownloadTask$OnCompleteListener;)V
    .locals 0

    .line 99
    iput-object p1, p0, Lcom/android/camera/network/download/GalleryDownloadManager$TaskMonitor;->this$0:Lcom/android/camera/network/download/GalleryDownloadManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 100
    iput-object p2, p0, Lcom/android/camera/network/download/GalleryDownloadManager$TaskMonitor;->mWrapped:Lcom/android/camera/network/download/DownloadTask$OnCompleteListener;

    .line 101
    return-void
.end method


# virtual methods
.method public onRequestComplete(Lcom/android/camera/network/download/Request;I)V
    .locals 2

    .line 105
    iget-object v0, p0, Lcom/android/camera/network/download/GalleryDownloadManager$TaskMonitor;->this$0:Lcom/android/camera/network/download/GalleryDownloadManager;

    invoke-static {v0}, Lcom/android/camera/network/download/GalleryDownloadManager;->access$000(Lcom/android/camera/network/download/GalleryDownloadManager;)Ljava/util/Map;

    move-result-object v0

    invoke-virtual {p1}, Lcom/android/camera/network/download/Request;->getTag()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera/network/download/DownloadTask;

    .line 106
    if-eqz v0, :cond_0

    .line 107
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/camera/network/download/DownloadTask;->setOnProgressListener(Lcom/android/camera/network/download/DownloadTask$OnProgressListener;)V

    .line 109
    :cond_0
    iget-object v0, p0, Lcom/android/camera/network/download/GalleryDownloadManager$TaskMonitor;->mWrapped:Lcom/android/camera/network/download/DownloadTask$OnCompleteListener;

    invoke-interface {v0, p1, p2}, Lcom/android/camera/network/download/DownloadTask$OnCompleteListener;->onRequestComplete(Lcom/android/camera/network/download/Request;I)V

    .line 110
    return-void
.end method
