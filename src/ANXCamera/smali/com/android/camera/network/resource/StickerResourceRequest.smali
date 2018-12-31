.class public Lcom/android/camera/network/resource/StickerResourceRequest;
.super Lcom/android/camera/network/net/BaseGalleryRequest;
.source "StickerResourceRequest.java"


# static fields
.field private static final EXPIRE_TIME:J = 0x2241353000L

.field private static final SOFT_EXPIRE_TIME:J = 0x5265c00L

.field private static final STICKER_LIST_DEFAULT:Ljava/lang/String; = "sticker_list_default"

.field private static final STICKER_PARENT_ID:J = 0x1a07bf95260020L


# direct methods
.method public constructor <init>()V
    .locals 4

    .line 30
    const-string v0, "http://micloudweb.preview.n.xiaomi.com/gallery/public/resource/info"

    const/4 v1, 0x0

    invoke-direct {p0, v1, v0}, Lcom/android/camera/network/net/BaseGalleryRequest;-><init>(ILjava/lang/String;)V

    .line 31
    const-string v0, "id"

    const-wide v1, 0x1a07bf95260020L

    invoke-static {v1, v2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/network/resource/StickerResourceRequest;->addParam(Ljava/lang/String;Ljava/lang/String;)Lcom/android/camera/network/net/base/BaseRequest;

    .line 32
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/android/camera/network/resource/StickerResourceRequest;->setUseCache(Z)Lcom/android/camera/network/net/base/BaseRequest;

    .line 33
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    const-wide v2, 0x2241353000L

    add-long/2addr v0, v2

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/network/resource/StickerResourceRequest;->setCacheExpires(J)Lcom/android/camera/network/net/base/BaseRequest;

    .line 34
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    const-wide/32 v2, 0x5265c00

    add-long/2addr v0, v2

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/network/resource/StickerResourceRequest;->setCacheSoftTtl(J)Lcom/android/camera/network/net/base/BaseRequest;

    .line 36
    invoke-static {}, Lcom/android/camera/network/net/HttpManager;->getInstance()Lcom/android/camera/network/net/HttpManager;

    move-result-object v0

    invoke-virtual {p0}, Lcom/android/camera/network/resource/StickerResourceRequest;->getCacheKey()Ljava/lang/String;

    move-result-object v1

    const-string v2, "sticker_list_default"

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/network/net/HttpManager;->putDefaultCache(Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    return-void
.end method


# virtual methods
.method protected onRequestSuccess(Lorg/json/JSONObject;)V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 43
    :try_start_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 44
    const-string v1, "galleryResourceInfoList"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    .line 45
    const-string v2, "expireAt"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    move-result-wide v2

    .line 46
    const-wide/16 v4, 0x0

    cmp-long v4, v2, v4

    if-eqz v4, :cond_0

    .line 47
    invoke-virtual {p0, v2, v3}, Lcom/android/camera/network/resource/StickerResourceRequest;->setCacheSoftTtl(J)Lcom/android/camera/network/net/base/BaseRequest;

    .line 49
    :cond_0
    const/4 v2, 0x0

    if-eqz v1, :cond_1

    .line 50
    move v3, v2

    :goto_0
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v4

    if-ge v3, v4, :cond_1

    .line 51
    invoke-virtual {v1, v3}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v4

    .line 52
    new-instance v5, Lcom/android/camera/sticker/StickerInfo;

    invoke-direct {v5}, Lcom/android/camera/sticker/StickerInfo;-><init>()V

    .line 53
    const-string v6, "id"

    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    move-result-wide v6

    iput-wide v6, v5, Lcom/android/camera/sticker/StickerInfo;->id:J

    .line 54
    const-string v6, "icon"

    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v5, Lcom/android/camera/sticker/StickerInfo;->icon:Ljava/lang/String;

    .line 55
    const-string v6, "extraInfo"

    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v5, Lcom/android/camera/sticker/StickerInfo;->extra:Ljava/lang/String;

    .line 56
    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 50
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 59
    :cond_1
    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    aput-object v0, v1, v2

    invoke-virtual {p0, v1}, Lcom/android/camera/network/resource/StickerResourceRequest;->deliverResponse([Ljava/lang/Object;)V
    :try_end_0
    .catch Lcom/google/gson/JsonParseException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 63
    :catch_0
    move-exception v0

    .line 64
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 65
    sget-object v1, Lcom/android/camera/network/net/base/ErrorCode;->HANDLE_ERROR:Lcom/android/camera/network/net/base/ErrorCode;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v1, v0, p1}, Lcom/android/camera/network/resource/StickerResourceRequest;->deliverError(Lcom/android/camera/network/net/base/ErrorCode;Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_2

    .line 60
    :catch_1
    move-exception v0

    .line 61
    invoke-virtual {v0}, Lcom/google/gson/JsonParseException;->printStackTrace()V

    .line 62
    sget-object v1, Lcom/android/camera/network/net/base/ErrorCode;->PARSE_ERROR:Lcom/android/camera/network/net/base/ErrorCode;

    invoke-virtual {v0}, Lcom/google/gson/JsonParseException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v1, v0, p1}, Lcom/android/camera/network/resource/StickerResourceRequest;->deliverError(Lcom/android/camera/network/net/base/ErrorCode;Ljava/lang/String;Ljava/lang/Object;)V

    .line 66
    :goto_1
    nop

    .line 67
    :goto_2
    return-void
.end method
