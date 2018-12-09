.class public Lcom/android/camera/network/net/BaseGalleryRequest;
.super Lcom/android/camera/network/net/json/BaseJsonRequest;
.source "BaseGalleryRequest.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/android/camera/network/net/json/BaseJsonRequest<",
        "Lcom/android/camera/network/net/GalleryResponse;",
        ">;"
    }
.end annotation


# static fields
.field private static final RESPONSE_CODE_TAG:Ljava/lang/String; = "code"

.field private static final RESPONSE_DATA_TAG:Ljava/lang/String; = "data"

.field private static final RESPONSE_DESCRIPTION_TAG:Ljava/lang/String; = "description"

.field private static final RESPONSE_LAST_PAGE_TAG:Ljava/lang/String; = "lastPage"

.field private static final RESPONSE_SYNC_TAG:Ljava/lang/String; = "syncTag"

.field private static final RESPONSE_SYNC_TOKEN_TAG:Ljava/lang/String; = "syncToken"

.field private static final TAG:Ljava/lang/String; = "BaseGalleryRequest"


# direct methods
.method public constructor <init>(I)V
    .locals 1

    .line 29
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/android/camera/network/net/BaseGalleryRequest;-><init>(ILjava/lang/String;)V

    .line 30
    return-void
.end method

.method public constructor <init>(ILjava/lang/String;)V
    .locals 0

    .line 39
    invoke-direct {p0, p1, p2}, Lcom/android/camera/network/net/json/BaseJsonRequest;-><init>(ILjava/lang/String;)V

    .line 40
    return-void
.end method

.method private checkExecuteCondition()Z
    .locals 4

    .line 115
    invoke-static {}, Lcom/android/camera/fragment/CtaNoticeFragment$CTA;->canConnectNetwork()Z

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    if-nez v0, :cond_0

    .line 116
    sget-object v0, Lcom/android/camera/network/net/base/ErrorCode;->NETWORK_NOT_CONNECTED:Lcom/android/camera/network/net/base/ErrorCode;

    const-string v3, "CTA not confirmed."

    invoke-virtual {p0, v0, v3, v2}, Lcom/android/camera/network/net/BaseGalleryRequest;->handleError(Lcom/android/camera/network/net/base/ErrorCode;Ljava/lang/String;Ljava/lang/Object;)V

    .line 117
    return v1

    .line 120
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/network/net/BaseGalleryRequest;->isUseCache()Z

    move-result v0

    const/4 v3, 0x1

    if-eqz v0, :cond_1

    .line 121
    return v3

    .line 124
    :cond_1
    invoke-static {}, Lcom/android/camera/network/util/NetworkUtils;->isNetworkConnected()Z

    move-result v0

    if-nez v0, :cond_2

    .line 125
    sget-object v0, Lcom/android/camera/network/net/base/ErrorCode;->NETWORK_NOT_CONNECTED:Lcom/android/camera/network/net/base/ErrorCode;

    const-string v3, "Network not connected."

    invoke-virtual {p0, v0, v3, v2}, Lcom/android/camera/network/net/BaseGalleryRequest;->handleError(Lcom/android/camera/network/net/base/ErrorCode;Ljava/lang/String;Ljava/lang/Object;)V

    .line 126
    return v1

    .line 129
    :cond_2
    return v3
.end method


# virtual methods
.method public final execute()V
    .locals 1

    .line 100
    invoke-direct {p0}, Lcom/android/camera/network/net/BaseGalleryRequest;->checkExecuteCondition()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 101
    invoke-super {p0}, Lcom/android/camera/network/net/json/BaseJsonRequest;->execute()V

    .line 103
    :cond_0
    return-void
.end method

.method public final executeSync()[Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/camera/network/net/base/RequestError;
        }
    .end annotation

    .line 107
    invoke-direct {p0}, Lcom/android/camera/network/net/BaseGalleryRequest;->checkExecuteCondition()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 108
    invoke-super {p0}, Lcom/android/camera/network/net/json/BaseJsonRequest;->executeSync()[Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 110
    :cond_0
    iget-object v0, p0, Lcom/android/camera/network/net/BaseGalleryRequest;->mRequestError:Lcom/android/camera/network/net/base/RequestError;

    throw v0
.end method

.method protected bridge synthetic handleResponse(Ljava/lang/Object;)V
    .locals 0

    .line 13
    check-cast p1, Lorg/json/JSONObject;

    invoke-virtual {p0, p1}, Lcom/android/camera/network/net/BaseGalleryRequest;->handleResponse(Lorg/json/JSONObject;)V

    return-void
.end method

.method protected final handleResponse(Lorg/json/JSONObject;)V
    .locals 3

    .line 45
    const/4 v0, 0x0

    if-eqz p1, :cond_2

    :try_start_0
    const-string v1, "code"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 46
    const-string v1, "code"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v1

    .line 47
    sget-object v2, Lcom/android/camera/network/net/base/ErrorCode;->SUCCESS:Lcom/android/camera/network/net/base/ErrorCode;

    iget v2, v2, Lcom/android/camera/network/net/base/ErrorCode;->CODE:I

    if-ne v1, v2, :cond_1

    .line 48
    const-string v1, "data"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 49
    sget-object v0, Lcom/android/camera/network/net/base/ErrorCode;->BODY_EMPTY:Lcom/android/camera/network/net/base/ErrorCode;

    const-string v1, "response empty data"

    invoke-virtual {p0, v0, v1, p1}, Lcom/android/camera/network/net/BaseGalleryRequest;->handleError(Lcom/android/camera/network/net/base/ErrorCode;Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0

    .line 51
    :cond_0
    new-instance v1, Lcom/android/camera/network/net/GalleryResponse;

    invoke-direct {v1}, Lcom/android/camera/network/net/GalleryResponse;-><init>()V

    .line 52
    const-string v2, "data"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    iput-object v2, v1, Lcom/android/camera/network/net/GalleryResponse;->data:Lorg/json/JSONObject;

    .line 53
    const-string v2, "syncTag"

    invoke-virtual {p1, v2, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/android/camera/network/net/GalleryResponse;->syncTag:Ljava/lang/String;

    .line 54
    const-string v2, "syncToken"

    invoke-virtual {p1, v2, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v1, Lcom/android/camera/network/net/GalleryResponse;->syncToken:Ljava/lang/String;

    .line 55
    const-string v0, "lastPage"

    const/4 v2, 0x1

    invoke-virtual {p1, v0, v2}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result p1

    iput-boolean p1, v1, Lcom/android/camera/network/net/GalleryResponse;->isLastPage:Z

    .line 56
    invoke-virtual {p0, v1}, Lcom/android/camera/network/net/BaseGalleryRequest;->onRequestSuccess(Lcom/android/camera/network/net/GalleryResponse;)V

    .line 57
    goto :goto_0

    .line 59
    :cond_1
    const-string v0, "description"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 60
    sget-object v1, Lcom/android/camera/network/net/base/ErrorCode;->SERVER_ERROR:Lcom/android/camera/network/net/base/ErrorCode;

    invoke-virtual {p0, v1, v0, p1}, Lcom/android/camera/network/net/BaseGalleryRequest;->handleError(Lcom/android/camera/network/net/base/ErrorCode;Ljava/lang/String;Ljava/lang/Object;)V

    .line 62
    :goto_0
    goto :goto_1

    .line 65
    :catch_0
    move-exception p1

    goto :goto_2

    .line 63
    :cond_2
    sget-object p1, Lcom/android/camera/network/net/base/ErrorCode;->PARSE_ERROR:Lcom/android/camera/network/net/base/ErrorCode;

    const-string v1, "response has no code"

    invoke-virtual {p0, p1, v1, v0}, Lcom/android/camera/network/net/BaseGalleryRequest;->handleError(Lcom/android/camera/network/net/base/ErrorCode;Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 67
    :goto_1
    goto :goto_3

    .line 65
    :goto_2
    nop

    .line 66
    sget-object v0, Lcom/android/camera/network/net/base/ErrorCode;->HANDLE_ERROR:Lcom/android/camera/network/net/base/ErrorCode;

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1, p1}, Lcom/android/camera/network/net/BaseGalleryRequest;->handleError(Lcom/android/camera/network/net/base/ErrorCode;Ljava/lang/String;Ljava/lang/Object;)V

    .line 68
    :goto_3
    return-void
.end method

.method public onRequestError(Lcom/android/camera/network/net/base/ErrorCode;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 5

    .line 141
    invoke-virtual {p0, p1, p2, p3}, Lcom/android/camera/network/net/BaseGalleryRequest;->deliverError(Lcom/android/camera/network/net/base/ErrorCode;Ljava/lang/String;Ljava/lang/Object;)V

    .line 142
    const-string v0, "BaseGalleryRequest"

    const-string v1, "%s onRequestError:%s | %s "

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    const/4 v3, 0x1

    aput-object p1, v2, v3

    const/4 p1, 0x2

    aput-object p2, v2, p1

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 143
    instance-of p1, p3, Ljava/lang/Throwable;

    if-eqz p1, :cond_0

    .line 144
    const-string p1, "BaseGalleryRequest"

    check-cast p3, Ljava/lang/Throwable;

    invoke-static {p1, p3}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 145
    :cond_0
    if-eqz p3, :cond_1

    .line 146
    const-string p1, "BaseGalleryRequest"

    invoke-virtual {p3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 148
    :cond_1
    :goto_0
    return-void
.end method

.method protected onRequestSuccess(Lcom/android/camera/network/net/GalleryResponse;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 82
    iget-object p1, p1, Lcom/android/camera/network/net/GalleryResponse;->data:Lorg/json/JSONObject;

    invoke-virtual {p0, p1}, Lcom/android/camera/network/net/BaseGalleryRequest;->onRequestSuccess(Lorg/json/JSONObject;)V

    .line 83
    return-void
.end method

.method protected bridge synthetic onRequestSuccess(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 13
    check-cast p1, Lcom/android/camera/network/net/GalleryResponse;

    invoke-virtual {p0, p1}, Lcom/android/camera/network/net/BaseGalleryRequest;->onRequestSuccess(Lcom/android/camera/network/net/GalleryResponse;)V

    return-void
.end method

.method protected onRequestSuccess(Lorg/json/JSONObject;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 95
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    invoke-virtual {p0, v0}, Lcom/android/camera/network/net/BaseGalleryRequest;->deliverResponse([Ljava/lang/Object;)V

    .line 96
    return-void
.end method
