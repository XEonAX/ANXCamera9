.class Lcom/android/camera/network/live/BaseRequest$1;
.super Ljava/lang/Object;
.source "BaseRequest.java"

# interfaces
.implements Lokhttp3/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/network/live/BaseRequest;->execute(Lcom/android/camera/network/net/base/ResponseListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/network/live/BaseRequest;

.field final synthetic val$listener:Lcom/android/camera/network/net/base/ResponseListener;


# direct methods
.method constructor <init>(Lcom/android/camera/network/live/BaseRequest;Lcom/android/camera/network/net/base/ResponseListener;)V
    .locals 0

    .line 38
    iput-object p1, p0, Lcom/android/camera/network/live/BaseRequest$1;->this$0:Lcom/android/camera/network/live/BaseRequest;

    iput-object p2, p0, Lcom/android/camera/network/live/BaseRequest$1;->val$listener:Lcom/android/camera/network/net/base/ResponseListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFailure(Lokhttp3/Call;Ljava/io/IOException;)V
    .locals 2

    .line 41
    const-string p1, "BaseRequest"

    const-string v0, "execute failed"

    invoke-static {p1, v0, p2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 42
    iget-object p1, p0, Lcom/android/camera/network/live/BaseRequest$1;->val$listener:Lcom/android/camera/network/net/base/ResponseListener;

    sget-object v0, Lcom/android/camera/network/net/base/ErrorCode;->NET_ERROR:Lcom/android/camera/network/net/base/ErrorCode;

    invoke-virtual {p2}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1, v0, v1, p2}, Lcom/android/camera/network/net/base/ResponseListener;->onResponseError(Lcom/android/camera/network/net/base/ErrorCode;Ljava/lang/String;Ljava/lang/Object;)V

    .line 43
    return-void
.end method

.method public onResponse(Lokhttp3/Call;Lokhttp3/Response;)V
    .locals 3

    .line 47
    invoke-virtual {p2}, Lokhttp3/Response;->isSuccessful()Z

    move-result p1

    if-nez p1, :cond_0

    .line 48
    iget-object p1, p0, Lcom/android/camera/network/live/BaseRequest$1;->val$listener:Lcom/android/camera/network/net/base/ResponseListener;

    sget-object v0, Lcom/android/camera/network/net/base/ErrorCode;->SERVER_ERROR:Lcom/android/camera/network/net/base/ErrorCode;

    invoke-virtual {p2}, Lokhttp3/Response;->message()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1, v0, v1, p2}, Lcom/android/camera/network/net/base/ResponseListener;->onResponseError(Lcom/android/camera/network/net/base/ErrorCode;Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_1

    .line 51
    :cond_0
    :try_start_0
    iget-object p1, p0, Lcom/android/camera/network/live/BaseRequest$1;->this$0:Lcom/android/camera/network/live/BaseRequest;

    invoke-virtual {p2}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object v0

    invoke-virtual {v0}, Lokhttp3/ResponseBody;->string()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/android/camera/network/live/BaseRequest;->process(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    .line 52
    iget-object v0, p0, Lcom/android/camera/network/live/BaseRequest$1;->val$listener:Lcom/android/camera/network/net/base/ResponseListener;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-interface {v0, v1}, Lcom/android/camera/network/net/base/ResponseListener;->onResponse([Ljava/lang/Object;)V
    :try_end_0
    .catch Lcom/android/camera/network/live/BaseRequestException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 56
    :catch_0
    move-exception p1

    .line 57
    const-string v0, "BaseRequest"

    const-string v1, "execute process failed"

    invoke-static {v0, v1, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 58
    iget-object v0, p0, Lcom/android/camera/network/live/BaseRequest$1;->val$listener:Lcom/android/camera/network/net/base/ResponseListener;

    sget-object v1, Lcom/android/camera/network/net/base/ErrorCode;->NET_ERROR:Lcom/android/camera/network/net/base/ErrorCode;

    invoke-virtual {p1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, v1, p1, p2}, Lcom/android/camera/network/net/base/ResponseListener;->onResponseError(Lcom/android/camera/network/net/base/ErrorCode;Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_1

    .line 53
    :catch_1
    move-exception p1

    .line 54
    const-string v0, "BaseRequest"

    const-string v1, "execute process failed"

    invoke-static {v0, v1, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 55
    iget-object v0, p0, Lcom/android/camera/network/live/BaseRequest$1;->val$listener:Lcom/android/camera/network/net/base/ResponseListener;

    invoke-virtual {p1}, Lcom/android/camera/network/live/BaseRequestException;->getErrorCode()Lcom/android/camera/network/net/base/ErrorCode;

    move-result-object v1

    invoke-virtual {p1}, Lcom/android/camera/network/live/BaseRequestException;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, v1, p1, p2}, Lcom/android/camera/network/net/base/ResponseListener;->onResponseError(Lcom/android/camera/network/net/base/ErrorCode;Ljava/lang/String;Ljava/lang/Object;)V

    .line 59
    :goto_0
    nop

    .line 61
    :goto_1
    invoke-virtual {p2}, Lokhttp3/Response;->close()V

    .line 62
    return-void
.end method
