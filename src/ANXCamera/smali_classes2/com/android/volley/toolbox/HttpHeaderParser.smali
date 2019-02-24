.class public Lcom/android/volley/toolbox/HttpHeaderParser;
.super Ljava/lang/Object;
.source "HttpHeaderParser.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static parseCacheHeaders(Lcom/android/volley/NetworkResponse;)Lcom/android/volley/Cache$Entry;
    .registers 22
    .param p0, "response"    # Lcom/android/volley/NetworkResponse;

    .line 40
    move-object/from16 v1, p0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    .line 42
    .local v2, "now":J
    iget-object v4, v1, Lcom/android/volley/NetworkResponse;->headers:Ljava/util/Map;

    .line 44
    .local v4, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-wide/16 v5, 0x0

    .line 45
    .local v5, "serverDate":J
    const-wide/16 v7, 0x0

    .line 46
    .local v7, "serverExpires":J
    const-wide/16 v9, 0x0

    .line 47
    .local v9, "softExpire":J
    const-wide/16 v11, 0x0

    .line 48
    .local v11, "maxAge":J
    const/4 v0, 0x0

    .line 50
    .local v0, "hasCacheControl":Z
    const/4 v13, 0x0

    .line 53
    .local v13, "serverEtag":Ljava/lang/String;
    const-string v14, "Date"

    invoke-interface {v4, v14}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/lang/String;

    .line 54
    .local v14, "headerValue":Ljava/lang/String;
    if-eqz v14, :cond_20

    .line 55
    invoke-static {v14}, Lcom/android/volley/toolbox/HttpHeaderParser;->parseDateAsEpoch(Ljava/lang/String;)J

    move-result-wide v5

    .line 58
    :cond_20
    const-string v15, "Cache-Control"

    invoke-interface {v4, v15}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v15

    move-object v14, v15

    check-cast v14, Ljava/lang/String;

    .line 59
    if-eqz v14, :cond_82

    .line 60
    const/4 v15, 0x1

    .line 61
    .end local v0    # "hasCacheControl":Z
    .local v15, "hasCacheControl":Z
    const-string v0, ","

    move-wide/from16 v16, v7

    invoke-virtual {v14, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v7

    .line 62
    .local v7, "tokens":[Ljava/lang/String;
    .local v16, "serverExpires":J
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_35
    move v8, v0

    .end local v0    # "i":I
    .local v8, "i":I
    array-length v0, v7

    if-ge v8, v0, :cond_85

    .line 63
    aget-object v0, v7, v8

    move-object/from16 v18, v7

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v7

    .line 64
    .local v7, "token":Ljava/lang/String;
    .local v18, "tokens":[Ljava/lang/String;
    const-string v0, "no-cache"

    invoke-virtual {v7, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_80

    const-string v0, "no-store"

    invoke-virtual {v7, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_52

    goto :goto_80

    .line 66
    :cond_52
    const-string v0, "max-age="

    invoke-virtual {v7, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_69

    .line 68
    const/16 v0, 0x8

    :try_start_5c
    invoke-virtual {v7, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v19
    :try_end_64
    .catch Ljava/lang/Exception; {:try_start_5c .. :try_end_64} :catch_67

    move-wide/from16 v11, v19

    .line 70
    .end local v7    # "token":Ljava/lang/String;
    :goto_66
    goto :goto_7b

    .line 69
    .restart local v7    # "token":Ljava/lang/String;
    :catch_67
    move-exception v0

    goto :goto_66

    .line 71
    :cond_69
    const-string v0, "must-revalidate"

    invoke-virtual {v7, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_79

    const-string v0, "proxy-revalidate"

    invoke-virtual {v7, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7b

    .line 72
    :cond_79
    const-wide/16 v11, 0x0

    .line 62
    .end local v7    # "token":Ljava/lang/String;
    :cond_7b
    :goto_7b
    add-int/lit8 v0, v8, 0x1

    .end local v8    # "i":I
    .restart local v0    # "i":I
    move-object/from16 v7, v18

    goto :goto_35

    .line 65
    .end local v0    # "i":I
    .restart local v7    # "token":Ljava/lang/String;
    .restart local v8    # "i":I
    :cond_80
    :goto_80
    const/4 v0, 0x0

    return-object v0

    .line 77
    .end local v8    # "i":I
    .end local v15    # "hasCacheControl":Z
    .end local v16    # "serverExpires":J
    .end local v18    # "tokens":[Ljava/lang/String;
    .local v0, "hasCacheControl":Z
    .local v7, "serverExpires":J
    :cond_82
    move-wide/from16 v16, v7

    move v15, v0

    .end local v0    # "hasCacheControl":Z
    .end local v7    # "serverExpires":J
    .restart local v15    # "hasCacheControl":Z
    .restart local v16    # "serverExpires":J
    :cond_85
    const-string v0, "Expires"

    invoke-interface {v4, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 78
    .end local v14    # "headerValue":Ljava/lang/String;
    .local v0, "headerValue":Ljava/lang/String;
    if-eqz v0, :cond_95

    .line 79
    invoke-static {v0}, Lcom/android/volley/toolbox/HttpHeaderParser;->parseDateAsEpoch(Ljava/lang/String;)J

    move-result-wide v7

    .line 82
    .end local v16    # "serverExpires":J
    .restart local v7    # "serverExpires":J
    move-wide/from16 v16, v7

    .end local v7    # "serverExpires":J
    .restart local v16    # "serverExpires":J
    :cond_95
    const-string v7, "ETag"

    invoke-interface {v4, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    .line 86
    .end local v13    # "serverEtag":Ljava/lang/String;
    .local v7, "serverEtag":Ljava/lang/String;
    if-eqz v15, :cond_a5

    .line 87
    const-wide/16 v13, 0x3e8

    mul-long/2addr v13, v11

    add-long v9, v2, v13

    goto :goto_b3

    .line 88
    :cond_a5
    const-wide/16 v13, 0x0

    cmp-long v8, v5, v13

    if-lez v8, :cond_b3

    cmp-long v8, v16, v5

    if-ltz v8, :cond_b3

    .line 90
    sub-long v13, v16, v5

    add-long v9, v2, v13

    .line 93
    :cond_b3
    :goto_b3
    new-instance v8, Lcom/android/volley/Cache$Entry;

    invoke-direct {v8}, Lcom/android/volley/Cache$Entry;-><init>()V

    .line 94
    .local v8, "entry":Lcom/android/volley/Cache$Entry;
    iget-object v13, v1, Lcom/android/volley/NetworkResponse;->data:[B

    iput-object v13, v8, Lcom/android/volley/Cache$Entry;->data:[B

    .line 95
    iput-object v7, v8, Lcom/android/volley/Cache$Entry;->etag:Ljava/lang/String;

    .line 96
    iput-wide v9, v8, Lcom/android/volley/Cache$Entry;->softTtl:J

    .line 97
    iget-wide v13, v8, Lcom/android/volley/Cache$Entry;->softTtl:J

    iput-wide v13, v8, Lcom/android/volley/Cache$Entry;->ttl:J

    .line 98
    iput-wide v5, v8, Lcom/android/volley/Cache$Entry;->serverDate:J

    .line 99
    iput-object v4, v8, Lcom/android/volley/Cache$Entry;->responseHeaders:Ljava/util/Map;

    .line 101
    return-object v8
.end method

.method public static parseCharset(Ljava/util/Map;)Ljava/lang/String;
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 122
    .local p0, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v0, "Content-Type"

    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 123
    .local v0, "contentType":Ljava/lang/String;
    if-eqz v0, :cond_36

    .line 124
    const-string v1, ";"

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 125
    .local v1, "params":[Ljava/lang/String;
    const/4 v2, 0x1

    move v3, v2

    .local v3, "i":I
    :goto_12
    array-length v4, v1

    if-ge v3, v4, :cond_36

    .line 126
    aget-object v4, v1, v3

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    const-string v5, "="

    invoke-virtual {v4, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    .line 127
    .local v4, "pair":[Ljava/lang/String;
    array-length v5, v4

    const/4 v6, 0x2

    if-ne v5, v6, :cond_33

    .line 128
    const/4 v5, 0x0

    aget-object v5, v4, v5

    const-string v6, "charset"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_33

    .line 129
    aget-object v2, v4, v2

    return-object v2

    .line 125
    .end local v4    # "pair":[Ljava/lang/String;
    :cond_33
    add-int/lit8 v3, v3, 0x1

    goto :goto_12

    .line 135
    .end local v1    # "params":[Ljava/lang/String;
    .end local v3    # "i":I
    :cond_36
    const-string v1, "ISO-8859-1"

    return-object v1
.end method

.method public static parseDateAsEpoch(Ljava/lang/String;)J
    .registers 4
    .param p0, "dateStr"    # Ljava/lang/String;

    .line 110
    :try_start_0
    invoke-static {p0}, Lorg/apache/http/impl/cookie/DateUtils;->parseDate(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v0
    :try_end_8
    .catch Lorg/apache/http/impl/cookie/DateParseException; {:try_start_0 .. :try_end_8} :catch_9

    return-wide v0

    .line 111
    :catch_9
    move-exception v0

    .line 113
    .local v0, "e":Lorg/apache/http/impl/cookie/DateParseException;
    const-wide/16 v1, 0x0

    return-wide v1
.end method
