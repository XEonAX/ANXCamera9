.class Lcom/android/camera/network/resource/ResourceDownloadManager$2;
.super Ljava/lang/Object;
.source "ResourceDownloadManager.java"

# interfaces
.implements Lcom/android/camera/network/download/GalleryDownloadManager$OnCompleteListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/network/resource/ResourceDownloadManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/network/resource/ResourceDownloadManager;


# direct methods
.method constructor <init>(Lcom/android/camera/network/resource/ResourceDownloadManager;)V
    .locals 0

    .line 114
    iput-object p1, p0, Lcom/android/camera/network/resource/ResourceDownloadManager$2;->this$0:Lcom/android/camera/network/resource/ResourceDownloadManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onRequestComplete(Lcom/android/camera/network/download/Request;I)V
    .locals 3

    .line 117
    const-string v0, "ResourceDownloadManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "download finish "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 118
    invoke-virtual {p1}, Lcom/android/camera/network/download/Request;->getTag()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v0

    .line 119
    iget-object p1, p0, Lcom/android/camera/network/resource/ResourceDownloadManager$2;->this$0:Lcom/android/camera/network/resource/ResourceDownloadManager;

    invoke-static {p1}, Lcom/android/camera/network/resource/ResourceDownloadManager;->access$300(Lcom/android/camera/network/resource/ResourceDownloadManager;)Ljava/lang/Object;

    move-result-object p1

    monitor-enter p1

    .line 120
    :try_start_0
    iget-object v2, p0, Lcom/android/camera/network/resource/ResourceDownloadManager$2;->this$0:Lcom/android/camera/network/resource/ResourceDownloadManager;

    invoke-static {v2}, Lcom/android/camera/network/resource/ResourceDownloadManager;->access$000(Lcom/android/camera/network/resource/ResourceDownloadManager;)Landroid/util/LongSparseArray;

    move-result-object v2

    invoke-virtual {v2, v0, v1}, Landroid/util/LongSparseArray;->remove(J)V

    .line 121
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 122
    if-nez p2, :cond_0

    .line 123
    iget-object p1, p0, Lcom/android/camera/network/resource/ResourceDownloadManager$2;->this$0:Lcom/android/camera/network/resource/ResourceDownloadManager;

    const/4 p2, 0x3

    invoke-static {p1, v0, v1, p2}, Lcom/android/camera/network/resource/ResourceDownloadManager;->access$200(Lcom/android/camera/network/resource/ResourceDownloadManager;JI)V

    goto :goto_0

    .line 125
    :cond_0
    iget-object p1, p0, Lcom/android/camera/network/resource/ResourceDownloadManager$2;->this$0:Lcom/android/camera/network/resource/ResourceDownloadManager;

    const/4 p2, 0x4

    invoke-static {p1, v0, v1, p2}, Lcom/android/camera/network/resource/ResourceDownloadManager;->access$200(Lcom/android/camera/network/resource/ResourceDownloadManager;JI)V

    .line 127
    :goto_0
    return-void

    .line 121
    :catchall_0
    move-exception p2

    :try_start_1
    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p2
.end method
