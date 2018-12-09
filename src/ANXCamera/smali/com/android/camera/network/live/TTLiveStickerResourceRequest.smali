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
.field private static final ACCESS_KEY:Ljava/lang/String; = "f5c61e00bf9a11e79515bdb2ca03e788"

.field private static final APP_VERSION:Ljava/lang/String; = "7.5.0"

.field private static final BASE_URL:Ljava/lang/String; = "https://effect.snssdk.com/effect/api/v3/effects"

.field private static final DEVICE_ID:Ljava/lang/String; = "123456"

.field private static final DEVICE_TYPE:Ljava/lang/String; = "Xiaomi"

.field private static final PLATFORM:Ljava/lang/String; = "android"

.field private static final SDK_VERSION:Ljava/lang/String; = "3.0.1"


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 24
    const-string v0, "https://effect.snssdk.com/effect/api/v3/effects"

    invoke-direct {p0, v0}, Lcom/android/camera/network/live/BaseJsonRequest;-><init>(Ljava/lang/String;)V

    .line 26
    const-string v0, "app_version"

    const-string v1, "7.5.0"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/network/live/TTLiveStickerResourceRequest;->addParam(Ljava/lang/String;Ljava/lang/String;)V

    .line 27
    const-string v0, "device_id"

    const-string v1, "123456"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/network/live/TTLiveStickerResourceRequest;->addParam(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    const-string v0, "access_key"

    const-string v1, "f5c61e00bf9a11e79515bdb2ca03e788"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/network/live/TTLiveStickerResourceRequest;->addParam(Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    const-string v0, "sdk_version"

    const-string v1, "3.0.1"

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/network/live/TTLiveStickerResourceRequest;->addParam(Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    const-string v0, "channel"

    invoke-virtual {p0, v0, p1}, Lcom/android/camera/network/live/TTLiveStickerResourceRequest;->addParam(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    const-string p1, "device_platform"

    const-string v0, "android"

    invoke-virtual {p0, p1, v0}, Lcom/android/camera/network/live/TTLiveStickerResourceRequest;->addParam(Ljava/lang/String;Ljava/lang/String;)V

    .line 32
    const-string p1, "device_type"

    const-string v0, "Xiaomi"

    invoke-virtual {p0, p1, v0}, Lcom/android/camera/network/live/TTLiveStickerResourceRequest;->addParam(Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    const-string p1, "panel"

    invoke-virtual {p0, p1, p2}, Lcom/android/camera/network/live/TTLiveStickerResourceRequest;->addParam(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    return-void
.end method


# virtual methods
.method protected bridge synthetic processJson(Lorg/json/JSONObject;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/camera/network/live/BaseRequestException;,
            Lorg/json/JSONException;
        }
    .end annotation

    .line 13
    invoke-virtual {p0, p1}, Lcom/android/camera/network/live/TTLiveStickerResourceRequest;->processJson(Lorg/json/JSONObject;)Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method protected processJson(Lorg/json/JSONObject;)Ljava/util/List;
    .locals 7
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

    .line 38
    if-eqz p1, :cond_3

    const-string v0, "status_code"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 41
    const-string v0, "status_code"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v0

    .line 42
    if-nez v0, :cond_2

    .line 46
    const-string v0, "data"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 49
    const-string v0, "data"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    .line 51
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 52
    const-string v1, "effects"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p1

    .line 53
    if-eqz p1, :cond_0

    .line 54
    const/4 v1, 0x0

    move v2, v1

    :goto_0
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-ge v2, v3, :cond_0

    .line 55
    invoke-virtual {p1, v2}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    .line 56
    new-instance v4, Lcom/android/camera/sticker/LiveStickerInfo;

    invoke-direct {v4}, Lcom/android/camera/sticker/LiveStickerInfo;-><init>()V

    .line 57
    const-string v5, "id"

    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, v4, Lcom/android/camera/sticker/LiveStickerInfo;->id:Ljava/lang/String;

    .line 58
    const-string v5, "name"

    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, v4, Lcom/android/camera/sticker/LiveStickerInfo;->name:Ljava/lang/String;

    .line 59
    const-string v5, "icon_url"

    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v5

    const-string v6, "url_list"

    invoke-virtual {v5, v6}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v5

    invoke-virtual {v5, v1}, Lorg/json/JSONArray;->optString(I)Ljava/lang/String;

    move-result-object v5

    iput-object v5, v4, Lcom/android/camera/sticker/LiveStickerInfo;->icon:Ljava/lang/String;

    .line 60
    const-string v5, "file_url"

    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v5

    const-string v6, "url_list"

    invoke-virtual {v5, v6}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v5

    invoke-virtual {v5, v1}, Lorg/json/JSONArray;->optString(I)Ljava/lang/String;

    move-result-object v5

    iput-object v5, v4, Lcom/android/camera/sticker/LiveStickerInfo;->url:Ljava/lang/String;

    .line 61
    const-string v5, "file_url"

    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    const-string v5, "uri"

    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v4, Lcom/android/camera/sticker/LiveStickerInfo;->hash:Ljava/lang/String;

    .line 62
    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 54
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 65
    :cond_0
    return-object v0

    .line 47
    :cond_1
    new-instance p1, Lcom/android/camera/network/live/BaseRequestException;

    sget-object v0, Lcom/android/camera/network/net/base/ErrorCode;->BODY_EMPTY:Lcom/android/camera/network/net/base/ErrorCode;

    const-string v1, "response empty data"

    invoke-direct {p1, v0, v1}, Lcom/android/camera/network/live/BaseRequestException;-><init>(Lcom/android/camera/network/net/base/ErrorCode;Ljava/lang/String;)V

    throw p1

    .line 43
    :cond_2
    const-string v0, "message"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 44
    new-instance v0, Lcom/android/camera/network/live/BaseRequestException;

    sget-object v1, Lcom/android/camera/network/net/base/ErrorCode;->SERVER_ERROR:Lcom/android/camera/network/net/base/ErrorCode;

    invoke-direct {v0, v1, p1}, Lcom/android/camera/network/live/BaseRequestException;-><init>(Lcom/android/camera/network/net/base/ErrorCode;Ljava/lang/String;)V

    throw v0

    .line 39
    :cond_3
    new-instance p1, Lcom/android/camera/network/live/BaseRequestException;

    sget-object v0, Lcom/android/camera/network/net/base/ErrorCode;->PARSE_ERROR:Lcom/android/camera/network/net/base/ErrorCode;

    const-string v1, "response has no status_code"

    invoke-direct {p1, v0, v1}, Lcom/android/camera/network/live/BaseRequestException;-><init>(Lcom/android/camera/network/net/base/ErrorCode;Ljava/lang/String;)V

    throw p1
.end method
