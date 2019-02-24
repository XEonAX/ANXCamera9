.class Lcom/android/camera/network/live/TTLiveStickerResourceRequest$1;
.super Ljava/lang/Object;
.source "TTLiveStickerResourceRequest.java"

# interfaces
.implements Lcom/android/camera/network/net/base/ResponseListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/network/live/TTLiveStickerResourceRequest;->execute(ZLcom/android/camera/network/net/base/ResponseListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/network/live/TTLiveStickerResourceRequest;

.field final synthetic val$cacheEnabled:Z

.field final synthetic val$listener:Lcom/android/camera/network/net/base/ResponseListener;


# direct methods
.method constructor <init>(Lcom/android/camera/network/live/TTLiveStickerResourceRequest;ZLcom/android/camera/network/net/base/ResponseListener;)V
    .locals 0

    .line 69
    iput-object p1, p0, Lcom/android/camera/network/live/TTLiveStickerResourceRequest$1;->this$0:Lcom/android/camera/network/live/TTLiveStickerResourceRequest;

    iput-boolean p2, p0, Lcom/android/camera/network/live/TTLiveStickerResourceRequest$1;->val$cacheEnabled:Z

    iput-object p3, p0, Lcom/android/camera/network/live/TTLiveStickerResourceRequest$1;->val$listener:Lcom/android/camera/network/net/base/ResponseListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public varargs onResponse([Ljava/lang/Object;)V
    .locals 2

    .line 72
    iget-boolean v0, p0, Lcom/android/camera/network/live/TTLiveStickerResourceRequest$1;->val$cacheEnabled:Z

    if-nez v0, :cond_0

    .line 73
    const-wide/16 v0, 0x0

    invoke-static {v0, v1}, Lcom/android/camera/CameraSettings;->setLiveStickerLastCacheTime(J)V

    .line 75
    :cond_0
    iget-object v0, p0, Lcom/android/camera/network/live/TTLiveStickerResourceRequest$1;->val$listener:Lcom/android/camera/network/net/base/ResponseListener;

    invoke-interface {v0, p1}, Lcom/android/camera/network/net/base/ResponseListener;->onResponse([Ljava/lang/Object;)V

    .line 76
    return-void
.end method

.method public onResponseError(Lcom/android/camera/network/net/base/ErrorCode;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 4

    .line 80
    sget-object v0, Lcom/android/camera/network/net/base/ErrorCode;->NETWORK_NOT_CONNECTED:Lcom/android/camera/network/net/base/ErrorCode;

    if-ne p1, v0, :cond_0

    .line 81
    iget-object v0, p0, Lcom/android/camera/network/live/TTLiveStickerResourceRequest$1;->val$listener:Lcom/android/camera/network/net/base/ResponseListener;

    invoke-interface {v0, p1, p2, p3}, Lcom/android/camera/network/net/base/ResponseListener;->onResponseError(Lcom/android/camera/network/net/base/ErrorCode;Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0

    .line 84
    :cond_0
    :try_start_0
    const-string v0, "BaseRequest"

    const-string v1, "Network error, TT sticker load from cache"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 85
    iget-object v0, p0, Lcom/android/camera/network/live/TTLiveStickerResourceRequest$1;->val$listener:Lcom/android/camera/network/net/base/ResponseListener;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/android/camera/network/live/TTLiveStickerResourceRequest$1;->this$0:Lcom/android/camera/network/live/TTLiveStickerResourceRequest;

    invoke-static {v3}, Lcom/android/camera/network/live/TTLiveStickerResourceRequest;->access$000(Lcom/android/camera/network/live/TTLiveStickerResourceRequest;)Ljava/util/List;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-interface {v0, v1}, Lcom/android/camera/network/net/base/ResponseListener;->onResponse([Ljava/lang/Object;)V
    :try_end_0
    .catch Lcom/android/camera/network/live/BaseRequestException; {:try_start_0 .. :try_end_0} :catch_0

    .line 88
    goto :goto_0

    .line 86
    :catch_0
    move-exception v0

    .line 87
    iget-object v0, p0, Lcom/android/camera/network/live/TTLiveStickerResourceRequest$1;->val$listener:Lcom/android/camera/network/net/base/ResponseListener;

    invoke-interface {v0, p1, p2, p3}, Lcom/android/camera/network/net/base/ResponseListener;->onResponseError(Lcom/android/camera/network/net/base/ErrorCode;Ljava/lang/String;Ljava/lang/Object;)V

    .line 90
    :goto_0
    return-void
.end method
