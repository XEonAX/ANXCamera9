.class Lcom/android/camera/network/resource/ResourceDownloadManager$1;
.super Ljava/lang/Object;
.source "ResourceDownloadManager.java"

# interfaces
.implements Lcom/android/camera/network/net/base/ResponseListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/network/resource/ResourceDownloadManager;->download(Lcom/android/camera/network/resource/Resource;Lcom/android/camera/network/resource/DownloadHelper;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/network/resource/ResourceDownloadManager;

.field final synthetic val$file:Ljava/io/File;

.field final synthetic val$id:J


# direct methods
.method constructor <init>(Lcom/android/camera/network/resource/ResourceDownloadManager;JLjava/io/File;)V
    .locals 0

    .line 64
    iput-object p1, p0, Lcom/android/camera/network/resource/ResourceDownloadManager$1;->this$0:Lcom/android/camera/network/resource/ResourceDownloadManager;

    iput-wide p2, p0, Lcom/android/camera/network/resource/ResourceDownloadManager$1;->val$id:J

    iput-object p4, p0, Lcom/android/camera/network/resource/ResourceDownloadManager$1;->val$file:Ljava/io/File;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public varargs onResponse([Ljava/lang/Object;)V
    .locals 6

    .line 70
    const/4 v0, 0x0

    :try_start_0
    aget-object p1, p1, v0

    check-cast p1, Lorg/json/JSONObject;

    .line 71
    const-string v1, "url"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 72
    const-string v2, "sha1Base16"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 73
    const-string v2, "ResourceDownloadManager"

    const-string v3, "download %s, %s"

    const/4 v4, 0x2

    new-array v5, v4, [Ljava/lang/Object;

    aput-object v1, v5, v0

    const/4 v0, 0x1

    aput-object p1, v5, v0

    invoke-static {v3, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 74
    new-instance v0, Lcom/android/camera/network/download/Request;

    iget-wide v2, p0, Lcom/android/camera/network/resource/ResourceDownloadManager$1;->val$id:J

    invoke-static {v2, v3}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    iget-object v3, p0, Lcom/android/camera/network/resource/ResourceDownloadManager$1;->val$file:Ljava/io/File;

    invoke-direct {v0, v2, v1, v3}, Lcom/android/camera/network/download/Request;-><init>(Ljava/lang/String;Landroid/net/Uri;Ljava/io/File;)V

    .line 75
    new-instance v1, Lcom/android/camera/network/download/Verifier$Sha1;

    invoke-direct {v1, p1}, Lcom/android/camera/network/download/Verifier$Sha1;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/android/camera/network/download/Request;->setVerifier(Lcom/android/camera/network/download/Verifier;)V

    .line 76
    monitor-enter p0
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 77
    :try_start_1
    iget-object p1, p0, Lcom/android/camera/network/resource/ResourceDownloadManager$1;->this$0:Lcom/android/camera/network/resource/ResourceDownloadManager;

    invoke-static {p1}, Lcom/android/camera/network/resource/ResourceDownloadManager;->access$000(Lcom/android/camera/network/resource/ResourceDownloadManager;)Landroid/util/LongSparseArray;

    move-result-object p1

    iget-wide v1, p0, Lcom/android/camera/network/resource/ResourceDownloadManager$1;->val$id:J

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {p1, v1, v2, v3}, Landroid/util/LongSparseArray;->put(JLjava/lang/Object;)V

    .line 78
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 79
    :try_start_2
    sget-object p1, Lcom/android/camera/network/download/GalleryDownloadManager;->INSTANCE:Lcom/android/camera/network/download/GalleryDownloadManager;

    iget-object v1, p0, Lcom/android/camera/network/resource/ResourceDownloadManager$1;->this$0:Lcom/android/camera/network/resource/ResourceDownloadManager;

    invoke-static {v1}, Lcom/android/camera/network/resource/ResourceDownloadManager;->access$100(Lcom/android/camera/network/resource/ResourceDownloadManager;)Lcom/android/camera/network/download/GalleryDownloadManager$OnCompleteListener;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lcom/android/camera/network/download/GalleryDownloadManager;->enqueue(Lcom/android/camera/network/download/Request;Lcom/android/camera/network/download/GalleryDownloadManager$OnCompleteListener;)V
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_0

    .line 84
    goto :goto_0

    .line 78
    :catchall_0
    move-exception p1

    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    throw p1
    :try_end_4
    .catch Lorg/json/JSONException; {:try_start_4 .. :try_end_4} :catch_0

    .line 81
    :catch_0
    move-exception p1

    .line 82
    const-string v0, "ResourceDownloadManager"

    invoke-static {v0, p1}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 83
    iget-object p1, p0, Lcom/android/camera/network/resource/ResourceDownloadManager$1;->this$0:Lcom/android/camera/network/resource/ResourceDownloadManager;

    iget-wide v0, p0, Lcom/android/camera/network/resource/ResourceDownloadManager$1;->val$id:J

    const/4 v2, 0x4

    invoke-static {p1, v0, v1, v2}, Lcom/android/camera/network/resource/ResourceDownloadManager;->access$200(Lcom/android/camera/network/resource/ResourceDownloadManager;JI)V

    .line 85
    :goto_0
    return-void
.end method

.method public onResponseError(Lcom/android/camera/network/net/base/ErrorCode;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 1

    .line 89
    iget-object p1, p0, Lcom/android/camera/network/resource/ResourceDownloadManager$1;->this$0:Lcom/android/camera/network/resource/ResourceDownloadManager;

    iget-wide p2, p0, Lcom/android/camera/network/resource/ResourceDownloadManager$1;->val$id:J

    const/4 v0, 0x4

    invoke-static {p1, p2, p3, v0}, Lcom/android/camera/network/resource/ResourceDownloadManager;->access$200(Lcom/android/camera/network/resource/ResourceDownloadManager;JI)V

    .line 90
    return-void
.end method
