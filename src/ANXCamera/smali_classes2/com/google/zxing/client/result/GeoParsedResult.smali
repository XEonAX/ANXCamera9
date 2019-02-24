.class public final Lcom/google/zxing/client/result/GeoParsedResult;
.super Lcom/google/zxing/client/result/ParsedResult;
.source "GeoParsedResult.java"


# instance fields
.field private final altitude:D

.field private final latitude:D

.field private final longitude:D

.field private final query:Ljava/lang/String;


# direct methods
.method constructor <init>(DDDLjava/lang/String;)V
    .registers 9
    .param p1, "latitude"    # D
    .param p3, "longitude"    # D
    .param p5, "altitude"    # D
    .param p7, "query"    # Ljava/lang/String;

    .line 30
    sget-object v0, Lcom/google/zxing/client/result/ParsedResultType;->GEO:Lcom/google/zxing/client/result/ParsedResultType;

    invoke-direct {p0, v0}, Lcom/google/zxing/client/result/ParsedResult;-><init>(Lcom/google/zxing/client/result/ParsedResultType;)V

    .line 31
    iput-wide p1, p0, Lcom/google/zxing/client/result/GeoParsedResult;->latitude:D

    .line 32
    iput-wide p3, p0, Lcom/google/zxing/client/result/GeoParsedResult;->longitude:D

    .line 33
    iput-wide p5, p0, Lcom/google/zxing/client/result/GeoParsedResult;->altitude:D

    .line 34
    iput-object p7, p0, Lcom/google/zxing/client/result/GeoParsedResult;->query:Ljava/lang/String;

    .line 35
    return-void
.end method


# virtual methods
.method public getAltitude()D
    .registers 3

    .line 72
    iget-wide v0, p0, Lcom/google/zxing/client/result/GeoParsedResult;->altitude:D

    return-wide v0
.end method

.method public getDisplayResult()Ljava/lang/String;
    .registers 6

    .line 84
    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v1, 0x14

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 85
    .local v0, "result":Ljava/lang/StringBuilder;
    iget-wide v1, p0, Lcom/google/zxing/client/result/GeoParsedResult;->latitude:D

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    .line 86
    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 87
    iget-wide v1, p0, Lcom/google/zxing/client/result/GeoParsedResult;->longitude:D

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    .line 88
    iget-wide v1, p0, Lcom/google/zxing/client/result/GeoParsedResult;->altitude:D

    const-wide/16 v3, 0x0

    cmpl-double v1, v1, v3

    if-lez v1, :cond_2d

    .line 89
    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 90
    iget-wide v1, p0, Lcom/google/zxing/client/result/GeoParsedResult;->altitude:D

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    .line 91
    const/16 v1, 0x6d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 93
    :cond_2d
    iget-object v1, p0, Lcom/google/zxing/client/result/GeoParsedResult;->query:Ljava/lang/String;

    if-eqz v1, :cond_40

    .line 94
    const-string v1, " ("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 95
    iget-object v1, p0, Lcom/google/zxing/client/result/GeoParsedResult;->query:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    const/16 v1, 0x29

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 98
    :cond_40
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public getGeoURI()Ljava/lang/String;
    .registers 7

    .line 38
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 39
    .local v0, "result":Ljava/lang/StringBuilder;
    const-string v1, "geo:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    iget-wide v1, p0, Lcom/google/zxing/client/result/GeoParsedResult;->latitude:D

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    .line 41
    const/16 v1, 0x2c

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 42
    iget-wide v2, p0, Lcom/google/zxing/client/result/GeoParsedResult;->longitude:D

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    .line 43
    iget-wide v2, p0, Lcom/google/zxing/client/result/GeoParsedResult;->altitude:D

    const-wide/16 v4, 0x0

    cmpl-double v2, v2, v4

    if-lez v2, :cond_29

    .line 44
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 45
    iget-wide v1, p0, Lcom/google/zxing/client/result/GeoParsedResult;->altitude:D

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    .line 47
    :cond_29
    iget-object v1, p0, Lcom/google/zxing/client/result/GeoParsedResult;->query:Ljava/lang/String;

    if-eqz v1, :cond_37

    .line 48
    const/16 v1, 0x3f

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 49
    iget-object v1, p0, Lcom/google/zxing/client/result/GeoParsedResult;->query:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    :cond_37
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public getLatitude()D
    .registers 3

    .line 58
    iget-wide v0, p0, Lcom/google/zxing/client/result/GeoParsedResult;->latitude:D

    return-wide v0
.end method

.method public getLongitude()D
    .registers 3

    .line 65
    iget-wide v0, p0, Lcom/google/zxing/client/result/GeoParsedResult;->longitude:D

    return-wide v0
.end method

.method public getQuery()Ljava/lang/String;
    .registers 2

    .line 79
    iget-object v0, p0, Lcom/google/zxing/client/result/GeoParsedResult;->query:Ljava/lang/String;

    return-object v0
.end method
