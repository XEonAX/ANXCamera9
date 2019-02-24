.class public Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil;
.super Ljava/lang/Object;
.source "MonitorNetUtil.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$IRequestIntercept;,
        Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$NetworkType;,
        Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$CompressType;
    }
.end annotation


# static fields
.field private static final DEBUG_MOBILE:Z = false

.field private static sRequestIntercept:Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$IRequestIntercept;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static excutePost(JLjava/lang/String;[BLbytedance/framwork/core/sdkmonitor/MonitorNetUtil$CompressType;Ljava/lang/String;Z)[B
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 260
    const/4 p0, 0x0

    if-nez p2, :cond_0

    .line 261
    return-object p0

    .line 262
    :cond_0
    const/4 p1, 0x0

    if-nez p3, :cond_1

    .line 263
    new-array p3, p1, [B

    .line 264
    :cond_1
    array-length v0, p3

    .line 265
    nop

    .line 266
    nop

    .line 267
    nop

    .line 268
    sget-object v1, Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$CompressType;->GZIP:Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$CompressType;

    const/16 v2, 0x80

    const/16 v3, 0x2000

    if-ne v1, p4, :cond_2

    if-le v0, v2, :cond_2

    .line 269
    new-instance p1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {p1, v3}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    .line 270
    new-instance p4, Ljava/util/zip/GZIPOutputStream;

    invoke-direct {p4, p1}, Ljava/util/zip/GZIPOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 272
    :try_start_0
    invoke-virtual {p4, p3}, Ljava/util/zip/GZIPOutputStream;->write([B)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 276
    invoke-virtual {p4}, Ljava/util/zip/GZIPOutputStream;->close()V

    .line 277
    nop

    .line 278
    nop

    .line 279
    invoke-virtual {p1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object p3

    .line 280
    const-string p0, "gzip"

    .line 281
    goto :goto_1

    .line 276
    :catchall_0
    move-exception p0

    invoke-virtual {p4}, Ljava/util/zip/GZIPOutputStream;->close()V

    throw p0

    .line 273
    :catch_0
    move-exception p1

    .line 274
    nop

    .line 276
    invoke-virtual {p4}, Ljava/util/zip/GZIPOutputStream;->close()V

    .line 274
    return-object p0

    .line 281
    :cond_2
    sget-object v1, Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$CompressType;->DEFLATER:Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$CompressType;

    if-ne v1, p4, :cond_4

    if-le v0, v2, :cond_4

    .line 282
    new-instance p0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {p0, v3}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    .line 283
    new-instance p4, Ljava/util/zip/Deflater;

    invoke-direct {p4}, Ljava/util/zip/Deflater;-><init>()V

    .line 284
    invoke-virtual {p4, p3}, Ljava/util/zip/Deflater;->setInput([B)V

    .line 285
    invoke-virtual {p4}, Ljava/util/zip/Deflater;->finish()V

    .line 286
    new-array p3, v3, [B

    .line 287
    :goto_0
    invoke-virtual {p4}, Ljava/util/zip/Deflater;->finished()Z

    move-result v0

    if-nez v0, :cond_3

    .line 288
    invoke-virtual {p4, p3}, Ljava/util/zip/Deflater;->deflate([B)I

    move-result v0

    .line 289
    invoke-virtual {p0, p3, p1, v0}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    .line 290
    goto :goto_0

    .line 291
    :cond_3
    invoke-virtual {p4}, Ljava/util/zip/Deflater;->end()V

    .line 292
    nop

    .line 293
    nop

    .line 294
    invoke-virtual {p0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object p3

    .line 295
    const-string p0, "deflate"

    .line 297
    :cond_4
    :goto_1
    move-object v1, p3

    move-object p3, p0

    if-eqz p6, :cond_6

    .line 298
    array-length p0, v1

    invoke-static {v1, p0}, Lcom/bytedance/frameworks/core/encrypt/TTEncryptUtils;->encrypt([BI)[B

    move-result-object p0

    .line 299
    if-eqz p0, :cond_5

    .line 300
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, "&tt_data=a"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 301
    const-string p5, "application/octet-stream;tt-data=a"

    .line 305
    move-object p1, p0

    move-object p0, p2

    move-object p2, p5

    goto :goto_2

    .line 303
    :cond_5
    nop

    .line 305
    move-object p0, p2

    move-object p2, p5

    move-object p1, v1

    :goto_2
    const-string p4, "POST"

    const/4 p5, 0x1

    const/4 p6, 0x1

    invoke-static/range {p0 .. p6}, Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil;->excuteRequest(Ljava/lang/String;[BLjava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZ)[B

    move-result-object p0

    return-object p0

    .line 307
    :cond_6
    const-string v4, "POST"

    const/4 v5, 0x1

    const/4 v6, 0x0

    move-object v0, p2

    move-object v2, p5

    move-object v3, p3

    invoke-static/range {v0 .. v6}, Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil;->excuteRequest(Ljava/lang/String;[BLjava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZ)[B

    move-result-object p0

    return-object p0
.end method

.method public static excuteRequest(Ljava/lang/String;[BLjava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZ)[B
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 177
    :try_start_0
    sget-object v0, Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil;->sRequestIntercept:Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$IRequestIntercept;

    if-eqz v0, :cond_0

    .line 178
    sget-object v0, Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil;->sRequestIntercept:Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$IRequestIntercept;

    invoke-interface {v0, p0, p1}, Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$IRequestIntercept;->addRequestVerifyParams(Ljava/lang/String;[B)Ljava/lang/String;

    move-result-object p0

    .line 181
    :cond_0
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 182
    if-eqz p6, :cond_1

    .line 183
    invoke-static {p0, v0}, Lcom/bytedance/frameworks/core/encrypt/RequestEncryptUtils;->tryEncryptRequest(Ljava/lang/String;Ljava/util/List;)Ljava/lang/String;

    move-result-object p0

    .line 184
    new-instance v1, Ljava/net/URL;

    invoke-direct {v1, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 185
    goto :goto_0

    .line 186
    :cond_1
    new-instance v1, Ljava/net/URL;

    invoke-direct {v1, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 188
    :goto_0
    invoke-virtual {v1}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object p0

    check-cast p0, Ljava/net/HttpURLConnection;

    .line 189
    if-eqz p6, :cond_3

    .line 190
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result p6

    if-nez p6, :cond_3

    .line 191
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p6

    :goto_1
    invoke-interface {p6}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {p6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/util/Pair;

    .line 192
    if-nez v0, :cond_2

    .line 193
    goto :goto_1

    .line 194
    :cond_2
    iget-object v1, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    iget-object v0, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    invoke-virtual {p0, v1, v0}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 195
    goto :goto_1

    .line 199
    :cond_3
    if-eqz p5, :cond_4

    .line 200
    const/4 p5, 0x1

    invoke-virtual {p0, p5}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    goto :goto_2

    .line 202
    :cond_4
    const/4 p5, 0x0

    invoke-virtual {p0, p5}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    .line 203
    :goto_2
    if-eqz p2, :cond_5

    .line 204
    const-string p5, "Content-Type"

    invoke-virtual {p0, p5, p2}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 205
    :cond_5
    if-eqz p3, :cond_6

    .line 206
    const-string p2, "Content-Encoding"

    invoke-virtual {p0, p2, p3}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 207
    :cond_6
    const-string p2, "Accept-Encoding"

    const-string p3, "gzip"

    invoke-virtual {p0, p2, p3}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 208
    if-eqz p4, :cond_b

    .line 210
    invoke-virtual {p0, p4}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 211
    if-eqz p1, :cond_7

    array-length p2, p1

    if-lez p2, :cond_7

    .line 212
    new-instance p2, Ljava/io/DataOutputStream;

    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object p3

    invoke-direct {p2, p3}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 213
    invoke-virtual {p2, p1}, Ljava/io/DataOutputStream;->write([B)V

    .line 214
    invoke-virtual {p2}, Ljava/io/DataOutputStream;->flush()V

    .line 215
    invoke-virtual {p2}, Ljava/io/DataOutputStream;->close()V

    .line 217
    :cond_7
    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result p1

    .line 218
    const/16 p2, 0xc8

    if-ne p1, p2, :cond_a

    .line 219
    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object p1

    .line 221
    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->getContentEncoding()Ljava/lang/String;

    move-result-object p0

    .line 222
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    if-nez p2, :cond_8

    const-string p2, "gzip"

    invoke-virtual {p0, p2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_8

    .line 223
    new-instance p0, Ljava/util/zip/GZIPInputStream;

    invoke-direct {p0, p1}, Ljava/util/zip/GZIPInputStream;-><init>(Ljava/io/InputStream;)V

    .line 224
    invoke-static {p0}, Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil;->toByteArray(Ljava/io/InputStream;)[B

    move-result-object p2

    .line 225
    nop

    .line 226
    invoke-virtual {p0}, Ljava/util/zip/GZIPInputStream;->close()V

    .line 227
    nop

    .line 229
    goto :goto_3

    .line 230
    :cond_8
    invoke-static {p1}, Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil;->toByteArray(Ljava/io/InputStream;)[B

    move-result-object p2

    .line 232
    :goto_3
    if-eqz p1, :cond_9

    .line 233
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V

    .line 234
    nop

    .line 236
    :cond_9
    return-object p2

    .line 238
    :cond_a
    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->getResponseMessage()Ljava/lang/String;

    move-result-object p0

    .line 239
    new-instance p2, Lbytedance/framwork/core/sdkmonitor/HttpResponseException;

    invoke-direct {p2, p1, p0}, Lbytedance/framwork/core/sdkmonitor/HttpResponseException;-><init>(ILjava/lang/String;)V

    throw p2

    .line 209
    :cond_b
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "request method is not null"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 240
    :catch_0
    move-exception p0

    .line 241
    throw p0
.end method

.method public static getNetWorkType(Landroid/content/Context;)Ljava/lang/String;
    .locals 2

    .line 146
    const/4 v0, 0x0

    if-nez p0, :cond_0

    .line 147
    return-object v0

    .line 148
    :cond_0
    :try_start_0
    const-string v1, "connectivity"

    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/net/ConnectivityManager;

    .line 149
    invoke-virtual {p0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object p0

    .line 150
    if-eqz p0, :cond_2

    invoke-virtual {p0}, Landroid/net/NetworkInfo;->isAvailable()Z

    move-result v1

    if-nez v1, :cond_1

    goto :goto_0

    .line 152
    :cond_1
    invoke-virtual {p0}, Landroid/net/NetworkInfo;->getTypeName()Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    .line 151
    :cond_2
    :goto_0
    return-object v0

    .line 153
    :catch_0
    move-exception p0

    .line 156
    return-object v0
.end method

.method public static getNetworkType(Landroid/content/Context;)Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$NetworkType;
    .locals 2

    .line 90
    :try_start_0
    const-string v0, "connectivity"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .line 92
    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v0

    .line 93
    if-eqz v0, :cond_3

    invoke-virtual {v0}, Landroid/net/NetworkInfo;->isAvailable()Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_1

    .line 96
    :cond_0
    invoke-virtual {v0}, Landroid/net/NetworkInfo;->getType()I

    move-result v0

    .line 97
    const/4 v1, 0x1

    if-ne v1, v0, :cond_1

    .line 101
    sget-object p0, Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$NetworkType;->WIFI:Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$NetworkType;

    return-object p0

    .line 103
    :cond_1
    if-nez v0, :cond_2

    .line 104
    const-string v0, "phone"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/telephony/TelephonyManager;

    .line 106
    invoke-virtual {p0}, Landroid/telephony/TelephonyManager;->getNetworkType()I

    move-result p0

    packed-switch p0, :pswitch_data_0

    .line 120
    :pswitch_0
    sget-object p0, Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$NetworkType;->MOBILE:Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$NetworkType;

    goto :goto_0

    .line 118
    :pswitch_1
    sget-object p0, Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$NetworkType;->MOBILE_4G:Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$NetworkType;

    return-object p0

    .line 116
    :pswitch_2
    sget-object p0, Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$NetworkType;->MOBILE_3G:Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$NetworkType;

    return-object p0

    .line 120
    :goto_0
    return-object p0

    .line 123
    :cond_2
    sget-object p0, Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$NetworkType;->MOBILE:Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$NetworkType;

    return-object p0

    .line 94
    :cond_3
    :goto_1
    sget-object p0, Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$NetworkType;->NONE:Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$NetworkType;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    .line 125
    :catch_0
    move-exception p0

    .line 126
    sget-object p0, Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$NetworkType;->MOBILE:Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$NetworkType;

    return-object p0

    :pswitch_data_0
    .packed-switch 0x3
        :pswitch_2
        :pswitch_0
        :pswitch_2
        :pswitch_2
        :pswitch_0
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_0
        :pswitch_2
        :pswitch_1
        :pswitch_2
        :pswitch_2
    .end packed-switch
.end method

.method public static getRequest(Ljava/lang/String;Ljava/lang/String;Z)[B
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 170
    invoke-static {p0}, Landroid/text/TextUtils;->isDigitsOnly(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 171
    const/4 p0, 0x0

    return-object p0

    .line 172
    :cond_0
    const/4 v1, 0x0

    const/4 v3, 0x0

    const-string v4, "GET"

    const/4 v5, 0x0

    move-object v0, p0

    move-object v2, p1

    move v6, p2

    invoke-static/range {v0 .. v6}, Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil;->excuteRequest(Ljava/lang/String;[BLjava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZ)[B

    move-result-object p0

    return-object p0
.end method

.method public static isNetworkAvailable(Landroid/content/Context;)Z
    .locals 2

    .line 131
    const/4 v0, 0x0

    if-nez p0, :cond_0

    .line 132
    return v0

    .line 134
    :cond_0
    :try_start_0
    const-string v1, "connectivity"

    .line 135
    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/net/ConnectivityManager;

    .line 136
    invoke-virtual {p0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object p0

    .line 137
    if-eqz p0, :cond_1

    invoke-virtual {p0}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz p0, :cond_1

    const/4 v0, 0x1

    nop

    :cond_1
    return v0

    .line 138
    :catch_0
    move-exception p0

    .line 139
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    .line 141
    return v0
.end method

.method public static isWifi(Landroid/content/Context;)Z
    .locals 2

    .line 69
    const/4 v0, 0x0

    :try_start_0
    const-string v1, "connectivity"

    .line 70
    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/net/ConnectivityManager;

    .line 71
    invoke-virtual {p0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object p0

    .line 72
    if-eqz p0, :cond_2

    invoke-virtual {p0}, Landroid/net/NetworkInfo;->isAvailable()Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0

    .line 78
    :cond_0
    invoke-virtual {p0}, Landroid/net/NetworkInfo;->getType()I

    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const/4 v1, 0x1

    if-ne v1, p0, :cond_1

    move v0, v1

    nop

    :cond_1
    return v0

    .line 73
    :cond_2
    :goto_0
    return v0

    .line 80
    :catch_0
    move-exception p0

    .line 83
    return v0
.end method

.method public static setRequestIntercept(Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$IRequestIntercept;)V
    .locals 0

    .line 166
    sput-object p0, Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil;->sRequestIntercept:Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$IRequestIntercept;

    .line 167
    return-void
.end method

.method public static toByteArray(Ljava/io/InputStream;)[B
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 246
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 247
    const/16 v1, 0x2000

    new-array v1, v1, [B

    .line 248
    nop

    .line 249
    :goto_0
    const/4 v2, -0x1

    invoke-virtual {p0, v1}, Ljava/io/InputStream;->read([B)I

    move-result v3

    if-eq v2, v3, :cond_0

    .line 250
    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2, v3}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_0

    .line 252
    :cond_0
    if-eqz p0, :cond_1

    .line 253
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V

    .line 254
    nop

    .line 256
    :cond_1
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object p0

    return-object p0
.end method

.method public static uploadFile(Ljava/lang/String;Ljava/io/File;Ljava/util/Map;Ljava/lang/String;Z)Ljava/lang/String;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/io/File;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "Z)",
            "Ljava/lang/String;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 313
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_e

    if-eqz p1, :cond_e

    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_e

    .line 315
    nop

    .line 316
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "tt_file_upload"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 317
    const-string v1, "--"

    const-string v2, "\r\n"

    .line 318
    const-string v3, "multipart/form-data"

    .line 319
    nop

    .line 321
    const/4 v4, 0x0

    :try_start_0
    new-instance v5, Ljava/net/URL;

    invoke-direct {v5, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 322
    invoke-virtual {v5}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object p0

    check-cast p0, Ljava/net/HttpURLConnection;

    .line 323
    const/16 v5, 0x7530

    invoke-virtual {p0, v5}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    .line 324
    invoke-virtual {p0, v5}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 325
    const/4 v5, 0x1

    invoke-virtual {p0, v5}, Ljava/net/HttpURLConnection;->setDoInput(Z)V

    .line 326
    invoke-virtual {p0, v5}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    .line 327
    const/4 v5, 0x0

    invoke-virtual {p0, v5}, Ljava/net/HttpURLConnection;->setUseCaches(Z)V

    .line 328
    const-string v6, "POST"

    invoke-virtual {p0, v6}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 329
    const-string v6, "Charset"

    invoke-virtual {p0, v6, p3}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 330
    const-string v6, "connection"

    const-string v7, "keep-alive"

    invoke-virtual {p0, v6, v7}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 331
    const-string v6, "Content-Type"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ";boundary="

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v6, v3}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 332
    if-eqz p4, :cond_0

    .line 333
    const-string v3, "Content-Encoding"

    const-string v6, "gzip"

    invoke-virtual {p0, v3, v6}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 335
    :cond_0
    if-eqz p2, :cond_3

    invoke-interface {p2}, Ljava/util/Map;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_3

    .line 336
    invoke-interface {p2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p2

    invoke-interface {p2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :cond_1
    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    .line 337
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 338
    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 339
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_1

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 340
    goto :goto_0

    .line 341
    :cond_2
    invoke-virtual {p0, v6, v3}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 342
    goto :goto_0

    .line 344
    :cond_3
    new-instance p2, Ljava/io/DataOutputStream;

    .line 345
    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v3

    invoke-direct {p2, v3}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 347
    if-eqz p1, :cond_c

    .line 349
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    .line 350
    invoke-virtual {v3, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 351
    invoke-virtual {v3, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 352
    invoke-virtual {v3, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 354
    if-eqz p4, :cond_4

    .line 355
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Content-Disposition: form-data; name=\"file\"; filename=\""

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 356
    invoke-virtual {p1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, ".zip\""

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 355
    invoke-virtual {v3, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 357
    :cond_4
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Content-Type: application/octet-stream; charset="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {v3, p3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 359
    invoke-virtual {v3, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 360
    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/String;->getBytes()[B

    move-result-object p3

    invoke-virtual {p2, p3}, Ljava/io/DataOutputStream;->write([B)V

    .line 361
    nop

    .line 362
    if-eqz p4, :cond_6

    .line 363
    new-instance p3, Ljava/io/File;

    new-instance p4, Ljava/lang/StringBuilder;

    invoke-direct {p4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "_tmp.zip"

    invoke-virtual {p4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p4

    invoke-direct {p3, p4}, Ljava/io/File;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 364
    :try_start_1
    invoke-virtual {p3}, Ljava/io/File;->exists()Z

    move-result p4

    if-eqz p4, :cond_5

    .line 365
    invoke-virtual {p3}, Ljava/io/File;->delete()Z

    .line 366
    :cond_5
    invoke-static {p1, p3}, Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil;->zipFile(Ljava/io/File;Ljava/io/File;)V

    .line 367
    new-instance p1, Ljava/io/FileInputStream;

    invoke-direct {p1, p3}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 371
    move-object v4, p3

    goto :goto_1

    .line 415
    :catchall_0
    move-exception p0

    move-object v4, p3

    goto/16 :goto_5

    .line 411
    :catch_0
    move-exception p0

    move-object v4, p3

    goto/16 :goto_4

    .line 369
    :cond_6
    :try_start_2
    new-instance p3, Ljava/io/FileInputStream;

    invoke-direct {p3, p1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 371
    move-object p1, p3

    :goto_1
    const/16 p3, 0x400

    new-array p3, p3, [B

    .line 372
    nop

    .line 373
    :goto_2
    invoke-virtual {p1, p3}, Ljava/io/InputStream;->read([B)I

    move-result p4

    const/4 v3, -0x1

    if-eq p4, v3, :cond_7

    .line 374
    invoke-virtual {p2, p3, v5, p4}, Ljava/io/DataOutputStream;->write([BII)V

    goto :goto_2

    .line 376
    :cond_7
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V

    .line 377
    invoke-virtual {v2}, Ljava/lang/String;->getBytes()[B

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/io/DataOutputStream;->write([B)V

    .line 378
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 379
    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    move-result-object p1

    .line 381
    invoke-virtual {p2, p1}, Ljava/io/DataOutputStream;->write([B)V

    .line 382
    invoke-virtual {p2}, Ljava/io/DataOutputStream;->flush()V

    .line 383
    invoke-virtual {p2}, Ljava/io/DataOutputStream;->close()V

    .line 387
    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result p1

    .line 388
    const/16 p2, 0xc8

    if-ne p1, p2, :cond_b

    .line 389
    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object p1

    .line 391
    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->getContentEncoding()Ljava/lang/String;

    move-result-object p0

    .line 392
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    if-nez p2, :cond_8

    const-string p2, "gzip"

    invoke-virtual {p0, p2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_8

    .line 393
    new-instance p0, Ljava/util/zip/GZIPInputStream;

    invoke-direct {p0, p1}, Ljava/util/zip/GZIPInputStream;-><init>(Ljava/io/InputStream;)V

    .line 394
    invoke-static {p0}, Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil;->toByteArray(Ljava/io/InputStream;)[B

    move-result-object p2

    .line 395
    nop

    .line 396
    invoke-virtual {p0}, Ljava/util/zip/GZIPInputStream;->close()V

    .line 397
    nop

    .line 399
    goto :goto_3

    .line 400
    :cond_8
    invoke-static {p1}, Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil;->toByteArray(Ljava/io/InputStream;)[B

    move-result-object p2

    .line 402
    :goto_3
    if-eqz p1, :cond_9

    .line 403
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V

    .line 404
    nop

    .line 406
    :cond_9
    new-instance p0, Ljava/lang/String;

    invoke-direct {p0, p2}, Ljava/lang/String;-><init>([B)V
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 415
    if-eqz v4, :cond_a

    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result p1

    if-eqz p1, :cond_a

    .line 416
    invoke-virtual {v4}, Ljava/io/File;->delete()Z

    .line 406
    :cond_a
    return-object p0

    .line 408
    :cond_b
    :try_start_3
    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->getResponseMessage()Ljava/lang/String;

    move-result-object p0

    .line 409
    new-instance p2, Lbytedance/framwork/core/sdkmonitor/HttpResponseException;

    invoke-direct {p2, p1, p0}, Lbytedance/framwork/core/sdkmonitor/HttpResponseException;-><init>(ILjava/lang/String;)V

    throw p2
    :try_end_3
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 415
    :cond_c
    nop

    .line 419
    return-object v4

    .line 415
    :catchall_1
    move-exception p0

    goto :goto_5

    .line 411
    :catch_1
    move-exception p0

    .line 412
    :goto_4
    :try_start_4
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 413
    throw p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 415
    :goto_5
    if-eqz v4, :cond_d

    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result p1

    if-eqz p1, :cond_d

    .line 416
    invoke-virtual {v4}, Ljava/io/File;->delete()Z

    :cond_d
    throw p0

    .line 314
    :cond_e
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "url and file not be null "

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static zipFile(Ljava/io/File;Ljava/io/File;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 423
    nop

    .line 424
    nop

    .line 425
    nop

    .line 428
    const/4 v0, 0x0

    :try_start_0
    new-instance v1, Ljava/io/FileInputStream;

    invoke-direct {v1, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_3

    .line 429
    :try_start_1
    new-instance p0, Ljava/io/FileOutputStream;

    invoke-direct {p0, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 430
    :try_start_2
    new-instance p1, Ljava/util/zip/GZIPOutputStream;

    invoke-direct {p1, p0}, Ljava/util/zip/GZIPOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 431
    const/16 v0, 0x400

    :try_start_3
    new-array v0, v0, [B

    .line 433
    :goto_0
    invoke-virtual {v1, v0}, Ljava/io/FileInputStream;->read([B)I

    move-result v2

    const/4 v3, -0x1

    if-eq v2, v3, :cond_0

    .line 434
    const/4 v3, 0x0

    invoke-virtual {p1, v0, v3, v2}, Ljava/util/zip/GZIPOutputStream;->write([BII)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    .line 437
    :cond_0
    nop

    .line 438
    invoke-virtual {p1}, Ljava/util/zip/GZIPOutputStream;->close()V

    .line 439
    nop

    .line 440
    invoke-virtual {p0}, Ljava/io/FileOutputStream;->close()V

    .line 441
    nop

    .line 442
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V

    .line 444
    return-void

    .line 437
    :catchall_0
    move-exception v0

    move-object v4, p1

    move-object p1, p0

    move-object p0, v0

    move-object v0, v4

    goto :goto_1

    :catchall_1
    move-exception p1

    move-object v4, p1

    move-object p1, p0

    move-object p0, v4

    goto :goto_1

    :catchall_2
    move-exception p0

    move-object p1, v0

    goto :goto_1

    :catchall_3
    move-exception p0

    move-object p1, v0

    move-object v1, p1

    :goto_1
    if-eqz v0, :cond_1

    .line 438
    invoke-virtual {v0}, Ljava/util/zip/GZIPOutputStream;->close()V

    .line 439
    :cond_1
    if-eqz p1, :cond_2

    .line 440
    invoke-virtual {p1}, Ljava/io/FileOutputStream;->close()V

    .line 441
    :cond_2
    if-eqz v1, :cond_3

    .line 442
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V

    :cond_3
    throw p0
.end method
