.class Lcom/android/camera/fragment/music/OkHttpUtils$1;
.super Ljava/lang/Object;
.source "OkHttpUtils.java"

# interfaces
.implements Lokhttp3/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/music/OkHttpUtils;->downloadMp3Async(Ljava/lang/String;Ljava/lang/String;Lcom/android/camera/fragment/live/FragmentLiveMusic$Mp3DownloadCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$callback:Lcom/android/camera/fragment/live/FragmentLiveMusic$Mp3DownloadCallback;

.field final synthetic val$savePath:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/live/FragmentLiveMusic$Mp3DownloadCallback;Ljava/lang/String;)V
    .locals 0

    .line 50
    iput-object p1, p0, Lcom/android/camera/fragment/music/OkHttpUtils$1;->val$callback:Lcom/android/camera/fragment/live/FragmentLiveMusic$Mp3DownloadCallback;

    iput-object p2, p0, Lcom/android/camera/fragment/music/OkHttpUtils$1;->val$savePath:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFailure(Lokhttp3/Call;Ljava/io/IOException;)V
    .locals 2

    .line 53
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

    .line 54
    iget-object p1, p0, Lcom/android/camera/fragment/music/OkHttpUtils$1;->val$callback:Lcom/android/camera/fragment/live/FragmentLiveMusic$Mp3DownloadCallback;

    invoke-interface {p1}, Lcom/android/camera/fragment/live/FragmentLiveMusic$Mp3DownloadCallback;->onFailed()V

    .line 55
    return-void
.end method

.method public onResponse(Lokhttp3/Call;Lokhttp3/Response;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 59
    new-instance p1, Ljava/io/PrintStream;

    iget-object v0, p0, Lcom/android/camera/fragment/music/OkHttpUtils$1;->val$savePath:Ljava/lang/String;

    invoke-direct {p1, v0}, Ljava/io/PrintStream;-><init>(Ljava/lang/String;)V

    .line 60
    invoke-virtual {p2}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object p2

    invoke-virtual {p2}, Lokhttp3/ResponseBody;->bytes()[B

    move-result-object p2

    .line 61
    array-length v0, p2

    const/4 v1, 0x0

    invoke-virtual {p1, p2, v1, v0}, Ljava/io/PrintStream;->write([BII)V

    .line 62
    invoke-virtual {p1}, Ljava/io/PrintStream;->close()V

    .line 63
    iget-object p1, p0, Lcom/android/camera/fragment/music/OkHttpUtils$1;->val$callback:Lcom/android/camera/fragment/live/FragmentLiveMusic$Mp3DownloadCallback;

    invoke-interface {p1}, Lcom/android/camera/fragment/live/FragmentLiveMusic$Mp3DownloadCallback;->onCompleted()V

    .line 64
    return-void
.end method
