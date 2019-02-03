.class public Lcom/android/camera/network/live/TTLiveStickerResourceRequest;
.super Lcom/android/camera/network/live/BaseJsonRequest;
.source "TTLiveStickerResourceRequest.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/android/camera/network/live/BaseJsonRequest<",
        "Ljava/util/List<",
        "Lcom/android/camera/sticker/LiveStickerInfo;",
        ">;>;"
    }
.end annotation


# static fields
.field private static final ACCESS_KEY:Ljava/lang/String; = "d4cd3080e95111e89708f1366a45264e"

.field private static final APP_VERSION:Ljava/lang/String; = "7.5.0"

.field private static final BASE_URL:Ljava/lang/String; = "https://effect.snssdk.com/effect/api/v3/effects"

.field private static final DEVICE_ID:Ljava/lang/String; = "123456"

.field private static final DEVICE_TYPE:Ljava/lang/String; = "Xiaomi"

.field private static final MAX_CACHE_TIME:J = 0x5265c00L

.field private static final PLATFORM:Ljava/lang/String; = "android"

.field private static final SDK_VERSION:Ljava/lang/String; = "3.4.0"


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 29
    const-string v0, "https://effect.snssdk.com/effect/api/v3/effects"

    invoke-direct {p0, v0}, Lcom/android/camera/network/live/BaseJsonRequest;-><init>(Ljava/lang/String;)V

    .line 31
    const-string v0, "app_version"

    const-string v1, "7.5.0"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/network/live/TTLiveStickerResourceRequest;->addParam(Ljava/lang/String;Ljava/lang/String;)V

    .line 32
    const-string v0, "device_id"

    const-string v1, "123456"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/network/live/TTLiveStickerResourceRequest;->addParam(Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    const-string v0, "access_key"

    const-string v1, "d4cd3080e95111e89708f1366a45264e"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/network/live/TTLiveStickerResourceRequest;->addParam(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    const-string v0, "sdk_version"

    const-string v1, "3.4.0"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/network/live/TTLiveStickerResourceRequest;->addParam(Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    const-string v0, "channel"

    invoke-virtual {p0, v0, p1}, Lcom/android/camera/network/live/TTLiveStickerResourceRequest;->addParam(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    const-string p1, "device_platform"

    const-string v0, "android"

    invoke-virtual {p0, p1, v0}, Lcom/android/camera/network/live/TTLiveStickerResourceRequest;->addParam(Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    const-string p1, "device_type"

    const-string v0, "Xiaomi"

    invoke-virtual {p0, p1, v0}, Lcom/android/camera/network/live/TTLiveStickerResourceRequest;->addParam(Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    const-string p1, "panel"

    invoke-virtual {p0, p1, p2}, Lcom/android/camera/network/live/TTLiveStickerResourceRequest;->addParam(Ljava/lang/String;Ljava/lang/String;)V

    .line 39
    return-void
.end method

.method static synthetic access$000(Lcom/android/camera/network/live/TTLiveStickerResourceRequest;)Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/camera/network/live/BaseRequestException;
        }
    .end annotation

    .line 16
    invoke-direct {p0}, Lcom/android/camera/network/live/TTLiveStickerResourceRequest;->loadFromCache()Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method private loadFromCache()Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/android/camera/sticker/LiveStickerInfo;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/camera/network/live/BaseRequestException;
        }
    .end annotation

    .line 42
    invoke-static {}, Lcom/android/camera/CameraSettings;->getTTLiveStickerJsonCache()Ljava/lang/String;

    move-result-object v0

    .line 44
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 45
    invoke-virtual {p0, v1}, Lcom/android/camera/network/live/TTLiveStickerResourceRequest;->processJson(Lorg/json/JSONObject;)Ljava/util/List;

    move-result-object v0
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 46
    :catch_0
    move-exception v0

    .line 47
    new-instance v1, Lcom/android/camera/network/live/BaseRequestException;

    sget-object v2, Lcom/android/camera/network/net/base/ErrorCode;->PARSE_ERROR:Lcom/android/camera/network/net/base/ErrorCode;

    invoke-virtual {v0}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3, v0}, Lcom/android/camera/network/live/BaseRequestException;-><init>(Lcom/android/camera/network/net/base/ErrorCode;Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method


# virtual methods
.method public execute(Lcom/android/camera/network/net/base/ResponseListener;)V
    .locals 1

    .line 53
    const/4 v0, 0x1

    invoke-virtual {p0, v0, p1}, Lcom/android/camera/network/live/TTLiveStickerResourceRequest;->execute(ZLcom/android/camera/network/net/base/ResponseListener;)V

    .line 54
    return-void
.end method

.method public execute(ZLcom/android/camera/network/net/base/ResponseListener;)V
    .locals 7

    .line 57
    new-instance v0, Lcom/android/camera/network/live/TTLiveStickerResourceRequest$1;

    invoke-direct {v0, p0, p1, p2}, Lcom/android/camera/network/live/TTLiveStickerResourceRequest$1;-><init>(Lcom/android/camera/network/live/TTLiveStickerResourceRequest;ZLcom/android/camera/network/net/base/ResponseListener;)V

    .line 81
    const-wide/16 v1, 0x0

    if-nez p1, :cond_0

    .line 82
    invoke-static {v1, v2}, Lcom/android/camera/CameraSettings;->setLiveStickerLastCacheTime(J)V

    .line 84
    :cond_0
    invoke-static {}, Lcom/android/camera/CameraSettings;->getLiveStickerLastCacheTime()J

    move-result-wide v3

    .line 85
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    .line 86
    cmp-long p1, v3, v1

    if-lez p1, :cond_2

    sub-long/2addr v5, v3

    const-wide/32 v1, 0x5265c00

    cmp-long p1, v5, v1

    if-lez p1, :cond_1

    goto :goto_0

    .line 91
    :cond_1
    :try_start_0
    const-string p1, "BaseRequest"

    const-string v0, "TT sticker load from cache"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 92
    const/4 p1, 0x1

    new-array p1, p1, [Ljava/lang/Object;

    const/4 v0, 0x0

    invoke-direct {p0}, Lcom/android/camera/network/live/TTLiveStickerResourceRequest;->loadFromCache()Ljava/util/List;

    move-result-object v1

    aput-object v1, p1, v0

    invoke-interface {p2, p1}, Lcom/android/camera/network/net/base/ResponseListener;->onResponse([Ljava/lang/Object;)V
    :try_end_0
    .catch Lcom/android/camera/network/live/BaseRequestException; {:try_start_0 .. :try_end_0} :catch_0

    .line 95
    goto :goto_1

    .line 93
    :catch_0
    move-exception p1

    .line 94
    invoke-virtual {p1}, Lcom/android/camera/network/live/BaseRequestException;->getErrorCode()Lcom/android/camera/network/net/base/ErrorCode;

    move-result-object v0

    invoke-virtual {p1}, Lcom/android/camera/network/live/BaseRequestException;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p2, v0, v1, p1}, Lcom/android/camera/network/net/base/ResponseListener;->onResponseError(Lcom/android/camera/network/net/base/ErrorCode;Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_1

    .line 87
    :cond_2
    :goto_0
    const-string p1, "BaseRequest"

    const-string p2, "TT sticker directly request"

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 88
    invoke-super {p0, v0}, Lcom/android/camera/network/live/BaseJsonRequest;->execute(Lcom/android/camera/network/net/base/ResponseListener;)V

    .line 97
    :goto_1
    return-void
.end method

.method protected bridge synthetic processJson(Lorg/json/JSONObject;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/camera/network/live/BaseRequestException;,
            Lorg/json/JSONException;
        }
    .end annotation

    .line 16
    invoke-virtual {p0, p1}, Lcom/android/camera/network/live/TTLiveStickerResourceRequest;->processJson(Lorg/json/JSONObject;)Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method protected processJson(Lorg/json/JSONObject;)Ljava/util/List;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONObject;",
            ")",
            "Ljava/util/List<",
            "Lcom/android/camera/sticker/LiveStickerInfo;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/camera/network/live/BaseRequestException;,
            Lorg/json/JSONException;
        }
    .end annotation

    .line 101
    if-eqz p1, :cond_3

    const-string v0, "status_code"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 104
    const-string v0, "status_code"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v0

    .line 105
    if-nez v0, :cond_2

    .line 109
    const-string v0, "data"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 112
    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    .line 113
    const-string v1, "data"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    .line 115
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 116
    const-string v2, "effects"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p1

    .line 117
    if-eqz p1, :cond_0

    .line 118
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->ensureCapacity(I)V

    .line 119
    const/4 v2, 0x0

    move v3, v2

    :goto_0
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v4

    if-ge v3, v4, :cond_0

    .line 120
    invoke-virtual {p1, v3}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v4

    .line 121
    new-instance v5, Lcom/android/camera/sticker/LiveStickerInfo;

    invoke-direct {v5}, Lcom/android/camera/sticker/LiveStickerInfo;-><init>()V

    .line 122
    const-string v6, "id"

    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v5, Lcom/android/camera/sticker/LiveStickerInfo;->id:Ljava/lang/String;

    .line 123
    const-string v6, "name"

    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v5, Lcom/android/camera/sticker/LiveStickerInfo;->name:Ljava/lang/String;

    .line 124
    const-string v6, "icon_url"

    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v6

    const-string v7, "url_list"

    invoke-virtual {v6, v7}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v6

    invoke-virtual {v6, v2}, Lorg/json/JSONArray;->optString(I)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v5, Lcom/android/camera/sticker/LiveStickerInfo;->icon:Ljava/lang/String;

    .line 125
    const-string v6, "file_url"

    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v6

    const-string v7, "url_list"

    invoke-virtual {v6, v7}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v6

    invoke-virtual {v6, v2}, Lorg/json/JSONArray;->optString(I)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v5, Lcom/android/camera/sticker/LiveStickerInfo;->url:Ljava/lang/String;

    .line 126
    const-string v6, "file_url"

    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v6

    const-string v7, "uri"

    invoke-virtual {v6, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v5, Lcom/android/camera/sticker/LiveStickerInfo;->hash:Ljava/lang/String;

    .line 127
    const-string v6, "hint"

    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v5, Lcom/android/camera/sticker/LiveStickerInfo;->hint:Ljava/lang/String;

    .line 128
    const-string v6, "hint_icon"

    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    const-string v6, "url_list"

    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v4

    invoke-virtual {v4, v2}, Lorg/json/JSONArray;->optString(I)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v5, Lcom/android/camera/sticker/LiveStickerInfo;->hintIcon:Ljava/lang/String;

    .line 129
    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 119
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 133
    :cond_0
    invoke-static {v0}, Lcom/android/camera/CameraSettings;->setTTLiveStickerJsonCache(Ljava/lang/String;)V

    .line 134
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-static {v2, v3}, Lcom/android/camera/CameraSettings;->setLiveStickerLastCacheTime(J)V

    .line 135
    return-object v1

    .line 110
    :cond_1
    new-instance p1, Lcom/android/camera/network/live/BaseRequestException;

    sget-object v0, Lcom/android/camera/network/net/base/ErrorCode;->BODY_EMPTY:Lcom/android/camera/network/net/base/ErrorCode;

    const-string v1, "response empty data"

    invoke-direct {p1, v0, v1}, Lcom/android/camera/network/live/BaseRequestException;-><init>(Lcom/android/camera/network/net/base/ErrorCode;Ljava/lang/String;)V

    throw p1

    .line 106
    :cond_2
    const-string v0, "message"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 107
    new-instance v0, Lcom/android/camera/network/live/BaseRequestException;

    sget-object v1, Lcom/android/camera/network/net/base/ErrorCode;->SERVER_ERROR:Lcom/android/camera/network/net/base/ErrorCode;

    invoke-direct {v0, v1, p1}, Lcom/android/camera/network/live/BaseRequestException;-><init>(Lcom/android/camera/network/net/base/ErrorCode;Ljava/lang/String;)V

    throw v0

    .line 102
    :cond_3
    new-instance p1, Lcom/android/camera/network/live/BaseRequestException;

    sget-object v0, Lcom/android/camera/network/net/base/ErrorCode;->PARSE_ERROR:Lcom/android/camera/network/net/base/ErrorCode;

    const-string v1, "response has no status_code"

    invoke-direct {p1, v0, v1}, Lcom/android/camera/network/live/BaseRequestException;-><init>(Lcom/android/camera/network/net/base/ErrorCode;Ljava/lang/String;)V

    throw p1
.end method
