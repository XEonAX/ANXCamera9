.class Lcom/android/camera/fragment/music/OkHttpUtils$1;
.super Ljava/lang/Object;
.source "OkHttpUtils.java"

# interfaces
.implements Lokhttp3/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/music/OkHttpUtils;->downloadMp3Async(Ljava/lang/String;Ljava/lang/String;Lcom/android/camera/fragment/music/FragmentLiveMusic$Mp3DownloadCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$callback:Lcom/android/camera/fragment/music/FragmentLiveMusic$Mp3DownloadCallback;

.field final synthetic val$savePath:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/music/FragmentLiveMusic$Mp3DownloadCallback;Ljava/lang/String;)V
    .locals 0

    .line 55
    iput-object p1, p0, Lcom/android/camera/fragment/music/OkHttpUtils$1;->val$callback:Lcom/android/camera/fragment/music/FragmentLiveMusic$Mp3DownloadCallback;

    iput-object p2, p0, Lcom/android/camera/fragment/music/OkHttpUtils$1;->val$savePath:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFailure(Lokhttp3/Call;Ljava/io/IOException;)V
    .locals 2

    .line 58
    invoke-static {}, Lcom/android/camera/fragment/music/OkHttpUtils;->access$000()Ljava/lang/String;

    move-result-object p1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "download mp3 async failed with exception "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 59
    iget-object p1, p0, Lcom/android/camera/fragment/music/OkHttpUtils$1;->val$callback:Lcom/android/camera/fragment/music/FragmentLiveMusic$Mp3DownloadCallback;

    invoke-interface {p1}, Lcom/android/camera/fragment/music/FragmentLiveMusic$Mp3DownloadCallback;->onFailed()V

    .line 60
    return-void
.end method

.method public onResponse(Lokhttp3/Call;Lokhttp3/Response;)V
    .locals 2

    .line 64
    invoke-static {}, Lcom/android/camera/fragment/music/OkHttpUtils;->access$000()Ljava/lang/String;

    move-result-object p1

    const-string v0, "onResponse"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 66
    :try_start_0
    invoke-virtual {p2}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object p1

    invoke-virtual {p1}, Lokhttp3/ResponseBody;->bytes()[B

    move-result-object p1

    .line 67
    new-instance p2, Ljava/io/PrintStream;

    iget-object v0, p0, Lcom/android/camera/fragment/music/OkHttpUtils$1;->val$savePath:Ljava/lang/String;

    invoke-direct {p2, v0}, Ljava/io/PrintStream;-><init>(Ljava/lang/String;)V

    .line 68
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p2, p1, v0, v1}, Ljava/io/PrintStream;->write([BII)V

    .line 69
    invoke-virtual {p2}, Ljava/io/PrintStream;->close()V

    .line 70
    iget-object p1, p0, Lcom/android/camera/fragment/music/OkHttpUtils$1;->val$callback:Lcom/android/camera/fragment/music/FragmentLiveMusic$Mp3DownloadCallback;

    invoke-interface {p1}, Lcom/android/camera/fragment/music/FragmentLiveMusic$Mp3DownloadCallback;->onCompleted()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 78
    goto :goto_0

    .line 71
    :catch_0
    move-exception p1

    .line 72
    invoke-static {}, Lcom/android/camera/fragment/music/OkHttpUtils;->access$000()Ljava/lang/String;

    move-result-object p2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "download mp3 async failed with exception "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p2, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 73
    new-instance p1, Ljava/io/File;

    iget-object p2, p0, Lcom/android/camera/fragment/music/OkHttpUtils$1;->val$savePath:Ljava/lang/String;

    invoke-direct {p1, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 74
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result p2

    if-eqz p2, :cond_0

    .line 75
    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    .line 77
    :cond_0
    iget-object p1, p0, Lcom/android/camera/fragment/music/OkHttpUtils$1;->val$callback:Lcom/android/camera/fragment/music/FragmentLiveMusic$Mp3DownloadCallback;

    invoke-interface {p1}, Lcom/android/camera/fragment/music/FragmentLiveMusic$Mp3DownloadCallback;->onFailed()V

    .line 79
    :goto_0
    return-void
.end method
