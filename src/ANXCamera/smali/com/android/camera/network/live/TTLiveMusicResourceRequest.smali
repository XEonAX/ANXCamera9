.class public Lcom/android/camera/network/live/TTLiveMusicResourceRequest;
.super Lcom/android/camera/network/live/BaseJsonRequest;
.source "TTLiveMusicResourceRequest.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/android/camera/network/live/BaseJsonRequest<",
        "Ljava/util/List<",
        "Lcom/android/camera/fragment/music/LiveMusicInfo;",
        ">;>;"
    }
.end annotation


# static fields
.field private static final APP_KEY:Ljava/lang/String; = "eGlhb21pX3RoaXJkX3BhcnR5"

.field private static final BASE_URL:Ljava/lang/String; = "https://third-api.amemv.com/aweme/v1/third/hot/music/"


# direct methods
.method public constructor <init>()V
    .locals 6

    .line 23
    const-string v0, "https://third-api.amemv.com/aweme/v1/third/hot/music/"

    invoke-direct {p0, v0}, Lcom/android/camera/network/live/BaseJsonRequest;-><init>(Ljava/lang/String;)V

    .line 25
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 26
    new-instance v2, Ljava/util/Random;

    invoke-direct {v2}, Ljava/util/Random;-><init>()V

    .line 27
    const/16 v3, 0x64

    invoke-virtual {v2, v3}, Ljava/util/Random;->nextInt(I)I

    move-result v2

    .line 28
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v0, v1}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "eGlhb21pX3RoaXJkX3BhcnR5"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/android/camera/Util;->md5(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 29
    const-string v4, "aid"

    const-string v5, "2"

    invoke-virtual {p0, v4, v5}, Lcom/android/camera/network/live/TTLiveMusicResourceRequest;->addParam(Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    const-string v4, "randnum"

    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v4, v2}, Lcom/android/camera/network/live/TTLiveMusicResourceRequest;->addParam(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    const-string v2, "time"

    invoke-static {v0, v1}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v2, v0}, Lcom/android/camera/network/live/TTLiveMusicResourceRequest;->addParam(Ljava/lang/String;Ljava/lang/String;)V

    .line 32
    const-string v0, "generate"

    invoke-virtual {p0, v0, v3}, Lcom/android/camera/network/live/TTLiveMusicResourceRequest;->addParam(Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    return-void
.end method


# virtual methods
.method public loadFromCache()Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/android/camera/fragment/music/LiveMusicInfo;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/camera/network/live/BaseRequestException;
        }
    .end annotation

    .line 36
    invoke-static {}, Lcom/android/camera/CameraSettings;->getTTLiveMusicJsonCache()Ljava/lang/String;

    move-result-object v0

    .line 37
    const-string v1, "BaseRequest"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "loadFromCache = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 39
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 40
    invoke-virtual {p0, v1}, Lcom/android/camera/network/live/TTLiveMusicResourceRequest;->processJson(Lorg/json/JSONObject;)Ljava/util/List;

    move-result-object v0
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 41
    :catch_0
    move-exception v0

    .line 42
    new-instance v1, Lcom/android/camera/network/live/BaseRequestException;

    sget-object v2, Lcom/android/camera/network/net/base/ErrorCode;->PARSE_ERROR:Lcom/android/camera/network/net/base/ErrorCode;

    invoke-virtual {v0}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3, v0}, Lcom/android/camera/network/live/BaseRequestException;-><init>(Lcom/android/camera/network/net/base/ErrorCode;Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public bridge synthetic processJson(Lorg/json/JSONObject;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/camera/network/live/BaseRequestException;,
            Lorg/json/JSONException;
        }
    .end annotation

    .line 17
    invoke-virtual {p0, p1}, Lcom/android/camera/network/live/TTLiveMusicResourceRequest;->processJson(Lorg/json/JSONObject;)Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method public processJson(Lorg/json/JSONObject;)Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONObject;",
            ")",
            "Ljava/util/List<",
            "Lcom/android/camera/fragment/music/LiveMusicInfo;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/camera/network/live/BaseRequestException;,
            Lorg/json/JSONException;
        }
    .end annotation

    .line 48
    if-eqz p1, :cond_3

    const-string v0, "status_code"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 51
    const-string v0, "status_code"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v0

    .line 52
    if-nez v0, :cond_2

    .line 56
    const-string v0, "music_list"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 59
    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/android/camera/CameraSettings;->setTTLiveMusicJsonCache(Ljava/lang/String;)V

    .line 60
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 61
    const-string v1, "music_list"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 62
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1, p1}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 63
    const/4 p1, 0x0

    :goto_0
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-ge p1, v2, :cond_0

    .line 64
    new-instance v2, Lcom/android/camera/fragment/music/LiveMusicInfo;

    invoke-direct {v2}, Lcom/android/camera/fragment/music/LiveMusicInfo;-><init>()V

    .line 65
    invoke-virtual {v1, p1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    .line 66
    const-string v4, "duration"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v2, Lcom/android/camera/fragment/music/LiveMusicInfo;->mDuration:Ljava/lang/String;

    .line 67
    const-string v4, "play_url"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    .line 68
    const-string v5, "uri"

    invoke-virtual {v4, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v2, Lcom/android/camera/fragment/music/LiveMusicInfo;->mPlayUrl:Ljava/lang/String;

    .line 69
    const-string v4, "cover_thumb"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    .line 70
    const-string v5, "uri"

    invoke-virtual {v4, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v2, Lcom/android/camera/fragment/music/LiveMusicInfo;->mThumbnailUrl:Ljava/lang/String;

    .line 71
    const-string v4, "author"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v2, Lcom/android/camera/fragment/music/LiveMusicInfo;->mAuthor:Ljava/lang/String;

    .line 72
    const-string v4, "title"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/android/camera/fragment/music/LiveMusicInfo;->mTitle:Ljava/lang/String;

    .line 74
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 63
    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    .line 76
    :cond_0
    return-object v0

    .line 57
    :cond_1
    new-instance p1, Lcom/android/camera/network/live/BaseRequestException;

    sget-object v0, Lcom/android/camera/network/net/base/ErrorCode;->BODY_EMPTY:Lcom/android/camera/network/net/base/ErrorCode;

    const-string v1, "response empty data"

    invoke-direct {p1, v0, v1}, Lcom/android/camera/network/live/BaseRequestException;-><init>(Lcom/android/camera/network/net/base/ErrorCode;Ljava/lang/String;)V

    throw p1

    .line 53
    :cond_2
    const-string v0, "msg"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 54
    new-instance v0, Lcom/android/camera/network/live/BaseRequestException;

    sget-object v1, Lcom/android/camera/network/net/base/ErrorCode;->SERVER_ERROR:Lcom/android/camera/network/net/base/ErrorCode;

    invoke-direct {v0, v1, p1}, Lcom/android/camera/network/live/BaseRequestException;-><init>(Lcom/android/camera/network/net/base/ErrorCode;Ljava/lang/String;)V

    throw v0

    .line 49
    :cond_3
    new-instance p1, Lcom/android/camera/network/live/BaseRequestException;

    sget-object v0, Lcom/android/camera/network/net/base/ErrorCode;->PARSE_ERROR:Lcom/android/camera/network/net/base/ErrorCode;

    const-string v1, "response has no status_code"

    invoke-direct {p1, v0, v1}, Lcom/android/camera/network/live/BaseRequestException;-><init>(Lcom/android/camera/network/net/base/ErrorCode;Ljava/lang/String;)V

    throw p1
.end method
