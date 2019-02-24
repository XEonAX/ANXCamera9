.class public Lcom/android/volley/toolbox/BasicNetwork;
.super Ljava/lang/Object;
.source "BasicNetwork.java"

# interfaces
.implements Lcom/android/volley/Network;


# static fields
.field protected static final DEBUG:Z

.field private static DEFAULT_POOL_SIZE:I

.field private static SLOW_REQUEST_THRESHOLD_MS:I


# instance fields
.field protected final mHttpStack:Lcom/android/volley/toolbox/HttpStack;

.field protected final mPool:Lcom/android/volley/toolbox/ByteArrayPool;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 54
    sget-boolean v0, Lcom/android/volley/VolleyLog;->DEBUG:Z

    sput-boolean v0, Lcom/android/volley/toolbox/BasicNetwork;->DEBUG:Z

    .line 56
    const/16 v0, 0xbb8

    sput v0, Lcom/android/volley/toolbox/BasicNetwork;->SLOW_REQUEST_THRESHOLD_MS:I

    .line 58
    const/16 v0, 0x1000

    sput v0, Lcom/android/volley/toolbox/BasicNetwork;->DEFAULT_POOL_SIZE:I

    return-void
.end method

.method public constructor <init>(Lcom/android/volley/toolbox/HttpStack;)V
    .registers 4
    .param p1, "httpStack"    # Lcom/android/volley/toolbox/HttpStack;

    .line 70
    new-instance v0, Lcom/android/volley/toolbox/ByteArrayPool;

    sget v1, Lcom/android/volley/toolbox/BasicNetwork;->DEFAULT_POOL_SIZE:I

    invoke-direct {v0, v1}, Lcom/android/volley/toolbox/ByteArrayPool;-><init>(I)V

    invoke-direct {p0, p1, v0}, Lcom/android/volley/toolbox/BasicNetwork;-><init>(Lcom/android/volley/toolbox/HttpStack;Lcom/android/volley/toolbox/ByteArrayPool;)V

    .line 71
    return-void
.end method

.method public constructor <init>(Lcom/android/volley/toolbox/HttpStack;Lcom/android/volley/toolbox/ByteArrayPool;)V
    .registers 3
    .param p1, "httpStack"    # Lcom/android/volley/toolbox/HttpStack;
    .param p2, "pool"    # Lcom/android/volley/toolbox/ByteArrayPool;

    .line 77
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 78
    iput-object p1, p0, Lcom/android/volley/toolbox/BasicNetwork;->mHttpStack:Lcom/android/volley/toolbox/HttpStack;

    .line 79
    iput-object p2, p0, Lcom/android/volley/toolbox/BasicNetwork;->mPool:Lcom/android/volley/toolbox/ByteArrayPool;

    .line 80
    return-void
.end method

.method private addCacheHeaders(Ljava/util/Map;Lcom/android/volley/Cache$Entry;)V
    .registers 7
    .param p2, "entry"    # Lcom/android/volley/Cache$Entry;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Lcom/android/volley/Cache$Entry;",
            ")V"
        }
    .end annotation

    .line 190
    .local p1, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    if-nez p2, :cond_3

    .line 191
    return-void

    .line 194
    :cond_3
    iget-object v0, p2, Lcom/android/volley/Cache$Entry;->etag:Ljava/lang/String;

    if-eqz v0, :cond_e

    .line 195
    const-string v0, "If-None-Match"

    iget-object v1, p2, Lcom/android/volley/Cache$Entry;->etag:Ljava/lang/String;

    invoke-interface {p1, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 198
    :cond_e
    iget-wide v0, p2, Lcom/android/volley/Cache$Entry;->serverDate:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-lez v0, :cond_26

    .line 199
    new-instance v0, Ljava/util/Date;

    iget-wide v1, p2, Lcom/android/volley/Cache$Entry;->serverDate:J

    invoke-direct {v0, v1, v2}, Ljava/util/Date;-><init>(J)V

    .line 200
    .local v0, "refTime":Ljava/util/Date;
    const-string v1, "If-Modified-Since"

    invoke-static {v0}, Lorg/apache/http/impl/cookie/DateUtils;->formatDate(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {p1, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 202
    .end local v0    # "refTime":Ljava/util/Date;
    :cond_26
    return-void
.end method

.method private static attemptRetryOnException(Ljava/lang/String;Lcom/android/volley/Request;Lcom/android/volley/VolleyError;)V
    .registers 9
    .param p0, "logPrefix"    # Ljava/lang/String;
    .param p2, "exception"    # Lcom/android/volley/VolleyError;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/android/volley/Request<",
            "*>;",
            "Lcom/android/volley/VolleyError;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/volley/VolleyError;
        }
    .end annotation

    .line 175
    .local p1, "request":Lcom/android/volley/Request;, "Lcom/android/volley/Request<*>;"
    invoke-virtual {p1}, Lcom/android/volley/Request;->getRetryPolicy()Lcom/android/volley/RetryPolicy;

    move-result-object v0

    .line 176
    .local v0, "retryPolicy":Lcom/android/volley/RetryPolicy;
    invoke-virtual {p1}, Lcom/android/volley/Request;->getTimeoutMs()I

    move-result v1

    .line 179
    .local v1, "oldTimeout":I
    const/4 v2, 0x1

    const/4 v3, 0x0

    const/4 v4, 0x2

    :try_start_b
    invoke-interface {v0, p2}, Lcom/android/volley/RetryPolicy;->retry(Lcom/android/volley/VolleyError;)V
    :try_end_e
    .catch Lcom/android/volley/VolleyError; {:try_start_b .. :try_end_e} :catch_23

    .line 184
    nop

    .line 185
    const-string v5, "%s-retry [timeout=%s]"

    new-array v4, v4, [Ljava/lang/Object;

    aput-object p0, v4, v3

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v4, v2

    invoke-static {v5, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Lcom/android/volley/Request;->addMarker(Ljava/lang/String;)V

    .line 186
    return-void

    .line 180
    :catch_23
    move-exception v5

    .line 181
    .local v5, "e":Lcom/android/volley/VolleyError;
    new-array v4, v4, [Ljava/lang/Object;

    aput-object p0, v4, v3

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v4, v2

    const-string v2, "%s-timeout-giveup [timeout=%s]"

    invoke-static {v2, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Lcom/android/volley/Request;->addMarker(Ljava/lang/String;)V

    .line 183
    throw v5
.end method

.method private static convertHeaders([Lorg/apache/http/Header;)Ljava/util/Map;
    .registers 5
    .param p0, "headers"    # [Lorg/apache/http/Header;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lorg/apache/http/Header;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 243
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 244
    .local v0, "result":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_6
    array-length v2, p0

    if-ge v1, v2, :cond_1b

    .line 245
    aget-object v2, p0, v1

    invoke-interface {v2}, Lorg/apache/http/Header;->getName()Ljava/lang/String;

    move-result-object v2

    aget-object v3, p0, v1

    invoke-interface {v3}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 244
    add-int/lit8 v1, v1, 0x1

    goto :goto_6

    .line 247
    .end local v1    # "i":I
    :cond_1b
    return-object v0
.end method

.method private entityToBytes(Lorg/apache/http/HttpEntity;)[B
    .registers 10
    .param p1, "entity"    # Lorg/apache/http/HttpEntity;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/android/volley/ServerError;
        }
    .end annotation

    .line 211
    new-instance v0, Lcom/android/volley/toolbox/PoolingByteArrayOutputStream;

    iget-object v1, p0, Lcom/android/volley/toolbox/BasicNetwork;->mPool:Lcom/android/volley/toolbox/ByteArrayPool;

    invoke-interface {p1}, Lorg/apache/http/HttpEntity;->getContentLength()J

    move-result-wide v2

    long-to-int v2, v2

    invoke-direct {v0, v1, v2}, Lcom/android/volley/toolbox/PoolingByteArrayOutputStream;-><init>(Lcom/android/volley/toolbox/ByteArrayPool;I)V

    .line 213
    .local v0, "bytes":Lcom/android/volley/toolbox/PoolingByteArrayOutputStream;
    const/4 v1, 0x0

    .line 215
    .local v1, "buffer":[B
    const/4 v2, 0x0

    :try_start_e
    invoke-interface {p1}, Lorg/apache/http/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v3

    .line 216
    .local v3, "in":Ljava/io/InputStream;
    if-eqz v3, :cond_42

    .line 219
    iget-object v4, p0, Lcom/android/volley/toolbox/BasicNetwork;->mPool:Lcom/android/volley/toolbox/ByteArrayPool;

    const/16 v5, 0x400

    invoke-virtual {v4, v5}, Lcom/android/volley/toolbox/ByteArrayPool;->getBuf(I)[B

    move-result-object v4

    move-object v1, v4

    .line 221
    :goto_1d
    invoke-virtual {v3, v1}, Ljava/io/InputStream;->read([B)I

    move-result v4

    move v5, v4

    .local v5, "count":I
    const/4 v6, -0x1

    if-eq v4, v6, :cond_29

    .line 222
    invoke-virtual {v0, v1, v2, v5}, Lcom/android/volley/toolbox/PoolingByteArrayOutputStream;->write([BII)V

    goto :goto_1d

    .line 224
    :cond_29
    invoke-virtual {v0}, Lcom/android/volley/toolbox/PoolingByteArrayOutputStream;->toByteArray()[B

    move-result-object v4
    :try_end_2d
    .catchall {:try_start_e .. :try_end_2d} :catchall_48

    .line 228
    :try_start_2d
    invoke-interface {p1}, Lorg/apache/http/HttpEntity;->consumeContent()V
    :try_end_30
    .catch Ljava/io/IOException; {:try_start_2d .. :try_end_30} :catch_31

    .line 233
    goto :goto_39

    .line 229
    :catch_31
    move-exception v6

    .line 232
    .local v6, "e":Ljava/io/IOException;
    const-string v7, "Error occured when calling consumingContent"

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v7, v2}, Lcom/android/volley/VolleyLog;->v(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 234
    .end local v6    # "e":Ljava/io/IOException;
    :goto_39
    iget-object v2, p0, Lcom/android/volley/toolbox/BasicNetwork;->mPool:Lcom/android/volley/toolbox/ByteArrayPool;

    invoke-virtual {v2, v1}, Lcom/android/volley/toolbox/ByteArrayPool;->returnBuf([B)V

    .line 235
    invoke-virtual {v0}, Lcom/android/volley/toolbox/PoolingByteArrayOutputStream;->close()V

    return-object v4

    .line 217
    .end local v5    # "count":I
    :cond_42
    :try_start_42
    new-instance v4, Lcom/android/volley/ServerError;

    invoke-direct {v4}, Lcom/android/volley/ServerError;-><init>()V

    throw v4
    :try_end_48
    .catchall {:try_start_42 .. :try_end_48} :catchall_48

    .line 226
    .end local v3    # "in":Ljava/io/InputStream;
    :catchall_48
    move-exception v3

    .line 228
    :try_start_49
    invoke-interface {p1}, Lorg/apache/http/HttpEntity;->consumeContent()V
    :try_end_4c
    .catch Ljava/io/IOException; {:try_start_49 .. :try_end_4c} :catch_4d

    .line 233
    goto :goto_55

    .line 229
    :catch_4d
    move-exception v4

    .line 232
    .local v4, "e":Ljava/io/IOException;
    new-array v2, v2, [Ljava/lang/Object;

    const-string v5, "Error occured when calling consumingContent"

    invoke-static {v5, v2}, Lcom/android/volley/VolleyLog;->v(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 234
    .end local v4    # "e":Ljava/io/IOException;
    :goto_55
    iget-object v2, p0, Lcom/android/volley/toolbox/BasicNetwork;->mPool:Lcom/android/volley/toolbox/ByteArrayPool;

    invoke-virtual {v2, v1}, Lcom/android/volley/toolbox/ByteArrayPool;->returnBuf([B)V

    .line 235
    invoke-virtual {v0}, Lcom/android/volley/toolbox/PoolingByteArrayOutputStream;->close()V

    throw v3
.end method

.method private logSlowRequests(JLcom/android/volley/Request;[BLorg/apache/http/StatusLine;)V
    .registers 10
    .param p1, "requestLifetime"    # J
    .param p4, "responseContents"    # [B
    .param p5, "statusLine"    # Lorg/apache/http/StatusLine;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Lcom/android/volley/Request<",
            "*>;[B",
            "Lorg/apache/http/StatusLine;",
            ")V"
        }
    .end annotation

    .line 160
    .local p3, "request":Lcom/android/volley/Request;, "Lcom/android/volley/Request<*>;"
    sget-boolean v0, Lcom/android/volley/toolbox/BasicNetwork;->DEBUG:Z

    if-nez v0, :cond_b

    sget v0, Lcom/android/volley/toolbox/BasicNetwork;->SLOW_REQUEST_THRESHOLD_MS:I

    int-to-long v0, v0

    cmp-long v0, p1, v0

    if-lez v0, :cond_44

    .line 161
    :cond_b
    const-string v0, "HTTP response for request=<%s> [lifetime=%d], [size=%s], [rc=%d], [retryCount=%s]"

    const/4 v1, 0x5

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p3, v1, v2

    const/4 v2, 0x1

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x2

    if-eqz p4, :cond_23

    array-length v3, p4

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    goto :goto_25

    :cond_23
    const-string v3, "null"

    :goto_25
    aput-object v3, v1, v2

    const/4 v2, 0x3

    invoke-interface {p5}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x4

    invoke-virtual {p3}, Lcom/android/volley/Request;->getRetryPolicy()Lcom/android/volley/RetryPolicy;

    move-result-object v3

    invoke-interface {v3}, Lcom/android/volley/RetryPolicy;->getCurrentRetryCount()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Lcom/android/volley/VolleyLog;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 166
    :cond_44
    return-void
.end method


# virtual methods
.method protected logError(Ljava/lang/String;Ljava/lang/String;J)V
    .registers 11
    .param p1, "what"    # Ljava/lang/String;
    .param p2, "url"    # Ljava/lang/String;
    .param p3, "start"    # J

    .line 205
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    .line 206
    .local v0, "now":J
    const-string v2, "HTTP ERROR(%s) %d ms to fetch %s"

    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    sub-long v4, v0, p3

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    const/4 v5, 0x1

    aput-object v4, v3, v5

    const/4 v4, 0x2

    aput-object p2, v3, v4

    invoke-static {v2, v3}, Lcom/android/volley/VolleyLog;->v(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 207
    return-void
.end method

.method public performRequest(Lcom/android/volley/Request;)Lcom/android/volley/NetworkResponse;
    .registers 22
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/volley/Request<",
            "*>;)",
            "Lcom/android/volley/NetworkResponse;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/volley/VolleyError;
        }
    .end annotation

    .local p1, "request":Lcom/android/volley/Request;, "Lcom/android/volley/Request<*>;"
    move-object/from16 v7, p0

    .line 84
    move-object/from16 v8, p1

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    .local v0, "requestStart":J
    :goto_8
    move-wide v9, v0

    .line 86
    .end local v0    # "requestStart":J
    .local v9, "requestStart":J
    const/4 v1, 0x0

    .line 87
    .local v1, "httpResponse":Lorg/apache/http/HttpResponse;
    const/4 v2, 0x0

    .line 88
    .local v2, "responseContents":[B
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    move-object v3, v0

    .line 91
    .local v3, "responseHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const/4 v11, 0x1

    const/4 v12, 0x0

    :try_start_13
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 92
    .local v0, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-virtual/range {p1 .. p1}, Lcom/android/volley/Request;->getCacheEntry()Lcom/android/volley/Cache$Entry;

    move-result-object v4

    invoke-direct {v7, v0, v4}, Lcom/android/volley/toolbox/BasicNetwork;->addCacheHeaders(Ljava/util/Map;Lcom/android/volley/Cache$Entry;)V

    .line 93
    iget-object v4, v7, Lcom/android/volley/toolbox/BasicNetwork;->mHttpStack:Lcom/android/volley/toolbox/HttpStack;

    invoke-interface {v4, v8, v0}, Lcom/android/volley/toolbox/HttpStack;->performRequest(Lcom/android/volley/Request;Ljava/util/Map;)Lorg/apache/http/HttpResponse;

    move-result-object v4
    :try_end_25
    .catch Ljava/net/SocketTimeoutException; {:try_start_13 .. :try_end_25} :catch_173
    .catch Lorg/apache/http/conn/ConnectTimeoutException; {:try_start_13 .. :try_end_25} :catch_166
    .catch Ljava/net/MalformedURLException; {:try_start_13 .. :try_end_25} :catch_149
    .catch Ljava/io/IOException; {:try_start_13 .. :try_end_25} :catch_f8

    move-object v13, v4

    .line 94
    .end local v1    # "httpResponse":Lorg/apache/http/HttpResponse;
    .local v13, "httpResponse":Lorg/apache/http/HttpResponse;
    :try_start_26
    invoke-interface {v13}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v1

    move-object v14, v1

    .line 95
    .local v14, "statusLine":Lorg/apache/http/StatusLine;
    invoke-interface {v14}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v1

    move v15, v1

    .line 97
    .local v15, "statusCode":I
    invoke-interface {v13}, Lorg/apache/http/HttpResponse;->getAllHeaders()[Lorg/apache/http/Header;

    move-result-object v1

    invoke-static {v1}, Lcom/android/volley/toolbox/BasicNetwork;->convertHeaders([Lorg/apache/http/Header;)Ljava/util/Map;

    move-result-object v1
    :try_end_38
    .catch Ljava/net/SocketTimeoutException; {:try_start_26 .. :try_end_38} :catch_f5
    .catch Lorg/apache/http/conn/ConnectTimeoutException; {:try_start_26 .. :try_end_38} :catch_f2
    .catch Ljava/net/MalformedURLException; {:try_start_26 .. :try_end_38} :catch_f0
    .catch Ljava/io/IOException; {:try_start_26 .. :try_end_38} :catch_ee

    move-object v6, v1

    .line 99
    .end local v3    # "responseHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .local v6, "responseHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const/16 v1, 0x130

    if-ne v15, v1, :cond_61

    .line 100
    :try_start_3d
    new-instance v3, Lcom/android/volley/NetworkResponse;

    invoke-virtual/range {p1 .. p1}, Lcom/android/volley/Request;->getCacheEntry()Lcom/android/volley/Cache$Entry;

    move-result-object v4

    if-nez v4, :cond_47

    const/4 v4, 0x0

    goto :goto_4d

    :cond_47
    invoke-virtual/range {p1 .. p1}, Lcom/android/volley/Request;->getCacheEntry()Lcom/android/volley/Cache$Entry;

    move-result-object v4

    iget-object v4, v4, Lcom/android/volley/Cache$Entry;->data:[B

    :goto_4d
    invoke-direct {v3, v1, v4, v6, v11}, Lcom/android/volley/NetworkResponse;-><init>(I[BLjava/util/Map;Z)V
    :try_end_50
    .catch Ljava/net/SocketTimeoutException; {:try_start_3d .. :try_end_50} :catch_5d
    .catch Lorg/apache/http/conn/ConnectTimeoutException; {:try_start_3d .. :try_end_50} :catch_59
    .catch Ljava/net/MalformedURLException; {:try_start_3d .. :try_end_50} :catch_55
    .catch Ljava/io/IOException; {:try_start_3d .. :try_end_50} :catch_51

    return-object v3

    .line 128
    .end local v0    # "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v14    # "statusLine":Lorg/apache/http/StatusLine;
    .end local v15    # "statusCode":I
    :catch_51
    move-exception v0

    move-object v3, v6

    goto/16 :goto_fa

    .line 126
    :catch_55
    move-exception v0

    move-object v3, v6

    goto/16 :goto_14b

    .line 124
    :catch_59
    move-exception v0

    move-object v3, v6

    goto/16 :goto_168

    .line 122
    :catch_5d
    move-exception v0

    move-object v3, v6

    goto/16 :goto_175

    .line 106
    .restart local v0    # "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v14    # "statusLine":Lorg/apache/http/StatusLine;
    .restart local v15    # "statusCode":I
    :cond_61
    :try_start_61
    invoke-interface {v13}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v1
    :try_end_65
    .catch Ljava/net/SocketTimeoutException; {:try_start_61 .. :try_end_65} :catch_e9
    .catch Lorg/apache/http/conn/ConnectTimeoutException; {:try_start_61 .. :try_end_65} :catch_e4
    .catch Ljava/net/MalformedURLException; {:try_start_61 .. :try_end_65} :catch_df
    .catch Ljava/io/IOException; {:try_start_61 .. :try_end_65} :catch_db

    if-eqz v1, :cond_70

    .line 107
    :try_start_67
    invoke-interface {v13}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v1

    invoke-direct {v7, v1}, Lcom/android/volley/toolbox/BasicNetwork;->entityToBytes(Lorg/apache/http/HttpEntity;)[B

    move-result-object v1
    :try_end_6f
    .catch Ljava/net/SocketTimeoutException; {:try_start_67 .. :try_end_6f} :catch_5d
    .catch Lorg/apache/http/conn/ConnectTimeoutException; {:try_start_67 .. :try_end_6f} :catch_59
    .catch Ljava/net/MalformedURLException; {:try_start_67 .. :try_end_6f} :catch_55
    .catch Ljava/io/IOException; {:try_start_67 .. :try_end_6f} :catch_51

    goto :goto_72

    .line 111
    :cond_70
    :try_start_70
    new-array v1, v12, [B
    :try_end_72
    .catch Ljava/net/SocketTimeoutException; {:try_start_70 .. :try_end_72} :catch_e9
    .catch Lorg/apache/http/conn/ConnectTimeoutException; {:try_start_70 .. :try_end_72} :catch_e4
    .catch Ljava/net/MalformedURLException; {:try_start_70 .. :try_end_72} :catch_df
    .catch Ljava/io/IOException; {:try_start_70 .. :try_end_72} :catch_db

    .line 115
    .end local v2    # "responseContents":[B
    .local v1, "responseContents":[B
    .local v5, "responseContents":[B
    :goto_72
    move-object v5, v1

    .end local v1    # "responseContents":[B
    :try_start_73
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v1
    :try_end_77
    .catch Ljava/net/SocketTimeoutException; {:try_start_73 .. :try_end_77} :catch_d5
    .catch Lorg/apache/http/conn/ConnectTimeoutException; {:try_start_73 .. :try_end_77} :catch_cf
    .catch Ljava/net/MalformedURLException; {:try_start_73 .. :try_end_77} :catch_c9
    .catch Ljava/io/IOException; {:try_start_73 .. :try_end_77} :catch_c4

    sub-long v16, v1, v9

    .line 116
    .local v16, "requestLifetime":J
    move-object v1, v7

    move-wide/from16 v2, v16

    move-object v4, v8

    move-object/from16 v18, v5

    .end local v5    # "responseContents":[B
    .local v18, "responseContents":[B
    move-object v11, v6

    move-object v6, v14

    .end local v6    # "responseHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .local v11, "responseHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :try_start_81
    invoke-direct/range {v1 .. v6}, Lcom/android/volley/toolbox/BasicNetwork;->logSlowRequests(JLcom/android/volley/Request;[BLorg/apache/http/StatusLine;)V

    .line 118
    const/16 v1, 0xc8

    if-lt v15, v1, :cond_94

    const/16 v1, 0x12b

    if-gt v15, v1, :cond_94

    .line 121
    new-instance v1, Lcom/android/volley/NetworkResponse;
    :try_end_8e
    .catch Ljava/net/SocketTimeoutException; {:try_start_81 .. :try_end_8e} :catch_be
    .catch Lorg/apache/http/conn/ConnectTimeoutException; {:try_start_81 .. :try_end_8e} :catch_b8
    .catch Ljava/net/MalformedURLException; {:try_start_81 .. :try_end_8e} :catch_b2
    .catch Ljava/io/IOException; {:try_start_81 .. :try_end_8e} :catch_ac

    move-object/from16 v2, v18

    :try_start_90
    invoke-direct {v1, v15, v2, v11, v12}, Lcom/android/volley/NetworkResponse;-><init>(I[BLjava/util/Map;Z)V

    .end local v18    # "responseContents":[B
    .restart local v2    # "responseContents":[B
    return-object v1

    .line 119
    .end local v2    # "responseContents":[B
    .restart local v18    # "responseContents":[B
    :cond_94
    move-object/from16 v2, v18

    .end local v18    # "responseContents":[B
    .restart local v2    # "responseContents":[B
    new-instance v1, Ljava/io/IOException;

    invoke-direct {v1}, Ljava/io/IOException;-><init>()V

    throw v1
    :try_end_9c
    .catch Ljava/net/SocketTimeoutException; {:try_start_90 .. :try_end_9c} :catch_a8
    .catch Lorg/apache/http/conn/ConnectTimeoutException; {:try_start_90 .. :try_end_9c} :catch_a4
    .catch Ljava/net/MalformedURLException; {:try_start_90 .. :try_end_9c} :catch_a0
    .catch Ljava/io/IOException; {:try_start_90 .. :try_end_9c} :catch_9c

    .line 128
    .end local v0    # "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v14    # "statusLine":Lorg/apache/http/StatusLine;
    .end local v15    # "statusCode":I
    .end local v16    # "requestLifetime":J
    :catch_9c
    move-exception v0

    move-object v3, v11

    goto/16 :goto_fa

    .line 126
    :catch_a0
    move-exception v0

    move-object v3, v11

    goto/16 :goto_14b

    .line 124
    :catch_a4
    move-exception v0

    move-object v3, v11

    goto/16 :goto_168

    .line 122
    :catch_a8
    move-exception v0

    move-object v3, v11

    goto/16 :goto_175

    .line 128
    .end local v2    # "responseContents":[B
    .restart local v18    # "responseContents":[B
    :catch_ac
    move-exception v0

    move-object/from16 v2, v18

    move-object v3, v11

    .end local v18    # "responseContents":[B
    .restart local v2    # "responseContents":[B
    goto/16 :goto_fa

    .line 126
    .end local v2    # "responseContents":[B
    .restart local v18    # "responseContents":[B
    :catch_b2
    move-exception v0

    move-object/from16 v2, v18

    move-object v3, v11

    .end local v18    # "responseContents":[B
    .restart local v2    # "responseContents":[B
    goto/16 :goto_14b

    .line 124
    .end local v2    # "responseContents":[B
    .restart local v18    # "responseContents":[B
    :catch_b8
    move-exception v0

    move-object/from16 v2, v18

    move-object v3, v11

    .end local v18    # "responseContents":[B
    .restart local v2    # "responseContents":[B
    goto/16 :goto_168

    .line 122
    .end local v2    # "responseContents":[B
    .restart local v18    # "responseContents":[B
    :catch_be
    move-exception v0

    move-object/from16 v2, v18

    move-object v3, v11

    .end local v18    # "responseContents":[B
    .restart local v2    # "responseContents":[B
    goto/16 :goto_175

    .line 128
    .end local v2    # "responseContents":[B
    .end local v11    # "responseHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v5    # "responseContents":[B
    .restart local v6    # "responseHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :catch_c4
    move-exception v0

    move-object v2, v5

    move-object v11, v6

    move-object v3, v11

    .end local v5    # "responseContents":[B
    .end local v6    # "responseHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v2    # "responseContents":[B
    .restart local v11    # "responseHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    goto :goto_fa

    .line 126
    .end local v2    # "responseContents":[B
    .end local v11    # "responseHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v5    # "responseContents":[B
    .restart local v6    # "responseHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :catch_c9
    move-exception v0

    move-object v2, v5

    move-object v11, v6

    move-object v3, v11

    .end local v5    # "responseContents":[B
    .end local v6    # "responseHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v2    # "responseContents":[B
    .restart local v11    # "responseHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    goto/16 :goto_14b

    .line 124
    .end local v2    # "responseContents":[B
    .end local v11    # "responseHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v5    # "responseContents":[B
    .restart local v6    # "responseHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :catch_cf
    move-exception v0

    move-object v2, v5

    move-object v11, v6

    move-object v3, v11

    .end local v5    # "responseContents":[B
    .end local v6    # "responseHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v2    # "responseContents":[B
    .restart local v11    # "responseHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    goto/16 :goto_168

    .line 122
    .end local v2    # "responseContents":[B
    .end local v11    # "responseHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v5    # "responseContents":[B
    .restart local v6    # "responseHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :catch_d5
    move-exception v0

    move-object v2, v5

    move-object v11, v6

    move-object v3, v11

    .end local v5    # "responseContents":[B
    .end local v6    # "responseHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v2    # "responseContents":[B
    .restart local v11    # "responseHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    goto/16 :goto_175

    .line 128
    .end local v11    # "responseHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v6    # "responseHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :catch_db
    move-exception v0

    move-object v11, v6

    move-object v3, v11

    .end local v6    # "responseHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v11    # "responseHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    goto :goto_fa

    .line 126
    .end local v11    # "responseHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v6    # "responseHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :catch_df
    move-exception v0

    move-object v11, v6

    move-object v3, v11

    .end local v6    # "responseHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v11    # "responseHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    goto/16 :goto_14b

    .line 124
    .end local v11    # "responseHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v6    # "responseHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :catch_e4
    move-exception v0

    move-object v11, v6

    move-object v3, v11

    .end local v6    # "responseHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v11    # "responseHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    goto/16 :goto_168

    .line 122
    .end local v11    # "responseHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v6    # "responseHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :catch_e9
    move-exception v0

    move-object v11, v6

    move-object v3, v11

    .end local v6    # "responseHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v11    # "responseHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    goto/16 :goto_175

    .line 128
    .end local v11    # "responseHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v3    # "responseHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :catch_ee
    move-exception v0

    goto :goto_fa

    .line 126
    :catch_f0
    move-exception v0

    goto :goto_14b

    .line 124
    :catch_f2
    move-exception v0

    goto/16 :goto_168

    .line 122
    :catch_f5
    move-exception v0

    goto/16 :goto_175

    .line 128
    .end local v13    # "httpResponse":Lorg/apache/http/HttpResponse;
    .local v1, "httpResponse":Lorg/apache/http/HttpResponse;
    :catch_f8
    move-exception v0

    move-object v13, v1

    .line 129
    .end local v1    # "httpResponse":Lorg/apache/http/HttpResponse;
    .local v0, "e":Ljava/io/IOException;
    .restart local v13    # "httpResponse":Lorg/apache/http/HttpResponse;
    :goto_fa
    const/4 v1, 0x0

    .line 130
    .local v1, "statusCode":I
    const/4 v4, 0x0

    .line 131
    .local v4, "networkResponse":Lcom/android/volley/NetworkResponse;
    if-eqz v13, :cond_143

    .line 132
    invoke-interface {v13}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v5

    invoke-interface {v5}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v1

    .line 136
    const-string v5, "Unexpected response code %d for %s"

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v6, v12

    invoke-virtual/range {p1 .. p1}, Lcom/android/volley/Request;->getUrl()Ljava/lang/String;

    move-result-object v11

    const/4 v14, 0x1

    aput-object v11, v6, v14

    invoke-static {v5, v6}, Lcom/android/volley/VolleyLog;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 137
    if-eqz v2, :cond_13d

    .line 138
    new-instance v5, Lcom/android/volley/NetworkResponse;

    invoke-direct {v5, v1, v2, v3, v12}, Lcom/android/volley/NetworkResponse;-><init>(I[BLjava/util/Map;Z)V

    move-object v4, v5

    .line 140
    const/16 v5, 0x191

    if-eq v1, v5, :cond_132

    const/16 v5, 0x193

    if-ne v1, v5, :cond_12c

    goto :goto_132

    .line 146
    :cond_12c
    new-instance v5, Lcom/android/volley/ServerError;

    invoke-direct {v5, v4}, Lcom/android/volley/ServerError;-><init>(Lcom/android/volley/NetworkResponse;)V

    throw v5

    .line 142
    :cond_132
    :goto_132
    const-string v5, "auth"

    new-instance v6, Lcom/android/volley/AuthFailureError;

    invoke-direct {v6, v4}, Lcom/android/volley/AuthFailureError;-><init>(Lcom/android/volley/NetworkResponse;)V

    invoke-static {v5, v8, v6}, Lcom/android/volley/toolbox/BasicNetwork;->attemptRetryOnException(Ljava/lang/String;Lcom/android/volley/Request;Lcom/android/volley/VolleyError;)V

    goto :goto_180

    .line 149
    :cond_13d
    new-instance v5, Lcom/android/volley/NetworkError;

    invoke-direct {v5, v4}, Lcom/android/volley/NetworkError;-><init>(Lcom/android/volley/NetworkResponse;)V

    throw v5

    .line 134
    :cond_143
    new-instance v5, Lcom/android/volley/NoConnectionError;

    invoke-direct {v5, v0}, Lcom/android/volley/NoConnectionError;-><init>(Ljava/lang/Throwable;)V

    throw v5

    .line 126
    .end local v0    # "e":Ljava/io/IOException;
    .end local v4    # "networkResponse":Lcom/android/volley/NetworkResponse;
    .end local v13    # "httpResponse":Lorg/apache/http/HttpResponse;
    .local v1, "httpResponse":Lorg/apache/http/HttpResponse;
    :catch_149
    move-exception v0

    move-object v13, v1

    .line 127
    .end local v1    # "httpResponse":Lorg/apache/http/HttpResponse;
    .local v0, "e":Ljava/net/MalformedURLException;
    .restart local v13    # "httpResponse":Lorg/apache/http/HttpResponse;
    :goto_14b
    new-instance v1, Ljava/lang/RuntimeException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Bad URL "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual/range {p1 .. p1}, Lcom/android/volley/Request;->getUrl()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v1, v4, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 124
    .end local v0    # "e":Ljava/net/MalformedURLException;
    .end local v13    # "httpResponse":Lorg/apache/http/HttpResponse;
    .restart local v1    # "httpResponse":Lorg/apache/http/HttpResponse;
    :catch_166
    move-exception v0

    move-object v13, v1

    .line 125
    .end local v1    # "httpResponse":Lorg/apache/http/HttpResponse;
    .local v0, "e":Lorg/apache/http/conn/ConnectTimeoutException;
    .restart local v13    # "httpResponse":Lorg/apache/http/HttpResponse;
    :goto_168
    const-string v1, "connection"

    new-instance v4, Lcom/android/volley/TimeoutError;

    invoke-direct {v4}, Lcom/android/volley/TimeoutError;-><init>()V

    invoke-static {v1, v8, v4}, Lcom/android/volley/toolbox/BasicNetwork;->attemptRetryOnException(Ljava/lang/String;Lcom/android/volley/Request;Lcom/android/volley/VolleyError;)V

    .end local v0    # "e":Lorg/apache/http/conn/ConnectTimeoutException;
    goto :goto_17f

    .line 122
    .end local v13    # "httpResponse":Lorg/apache/http/HttpResponse;
    .restart local v1    # "httpResponse":Lorg/apache/http/HttpResponse;
    :catch_173
    move-exception v0

    move-object v13, v1

    .line 123
    .end local v1    # "httpResponse":Lorg/apache/http/HttpResponse;
    .local v0, "e":Ljava/net/SocketTimeoutException;
    .restart local v13    # "httpResponse":Lorg/apache/http/HttpResponse;
    :goto_175
    const-string v1, "socket"

    new-instance v4, Lcom/android/volley/TimeoutError;

    invoke-direct {v4}, Lcom/android/volley/TimeoutError;-><init>()V

    invoke-static {v1, v8, v4}, Lcom/android/volley/toolbox/BasicNetwork;->attemptRetryOnException(Ljava/lang/String;Lcom/android/volley/Request;Lcom/android/volley/VolleyError;)V

    .line 151
    .end local v0    # "e":Ljava/net/SocketTimeoutException;
    .end local v2    # "responseContents":[B
    .end local v3    # "responseHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v13    # "httpResponse":Lorg/apache/http/HttpResponse;
    :goto_17f
    nop

    .line 152
    :goto_180
    nop

    .line 84
    move-wide v0, v9

    goto/16 :goto_8
.end method
