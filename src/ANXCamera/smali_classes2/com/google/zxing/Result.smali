.class public final Lcom/google/zxing/Result;
.super Ljava/lang/Object;
.source "Result.java"


# instance fields
.field private final format:Lcom/google/zxing/BarcodeFormat;

.field private final rawBytes:[B

.field private resultMetadata:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/google/zxing/ResultMetadataType;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private resultPoints:[Lcom/google/zxing/ResultPoint;

.field private final text:Ljava/lang/String;

.field private final timestamp:J


# direct methods
.method public constructor <init>(Ljava/lang/String;[B[Lcom/google/zxing/ResultPoint;Lcom/google/zxing/BarcodeFormat;)V
    .registers 12
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "rawBytes"    # [B
    .param p3, "resultPoints"    # [Lcom/google/zxing/ResultPoint;
    .param p4, "format"    # Lcom/google/zxing/BarcodeFormat;

    .line 40
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    invoke-direct/range {v0 .. v6}, Lcom/google/zxing/Result;-><init>(Ljava/lang/String;[B[Lcom/google/zxing/ResultPoint;Lcom/google/zxing/BarcodeFormat;J)V

    .line 41
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;[B[Lcom/google/zxing/ResultPoint;Lcom/google/zxing/BarcodeFormat;J)V
    .registers 8
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "rawBytes"    # [B
    .param p3, "resultPoints"    # [Lcom/google/zxing/ResultPoint;
    .param p4, "format"    # Lcom/google/zxing/BarcodeFormat;
    .param p5, "timestamp"    # J

    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    iput-object p1, p0, Lcom/google/zxing/Result;->text:Ljava/lang/String;

    .line 49
    iput-object p2, p0, Lcom/google/zxing/Result;->rawBytes:[B

    .line 50
    iput-object p3, p0, Lcom/google/zxing/Result;->resultPoints:[Lcom/google/zxing/ResultPoint;

    .line 51
    iput-object p4, p0, Lcom/google/zxing/Result;->format:Lcom/google/zxing/BarcodeFormat;

    .line 52
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/zxing/Result;->resultMetadata:Ljava/util/Map;

    .line 53
    iput-wide p5, p0, Lcom/google/zxing/Result;->timestamp:J

    .line 54
    return-void
.end method


# virtual methods
.method public addResultPoints([Lcom/google/zxing/ResultPoint;)V
    .registers 7
    .param p1, "newPoints"    # [Lcom/google/zxing/ResultPoint;

    .line 113
    iget-object v0, p0, Lcom/google/zxing/Result;->resultPoints:[Lcom/google/zxing/ResultPoint;

    .line 114
    .local v0, "oldPoints":[Lcom/google/zxing/ResultPoint;
    if-nez v0, :cond_7

    .line 115
    iput-object p1, p0, Lcom/google/zxing/Result;->resultPoints:[Lcom/google/zxing/ResultPoint;

    .line 116
    goto :goto_1d

    :cond_7
    if-eqz p1, :cond_1d

    array-length v1, p1

    if-lez v1, :cond_1d

    .line 117
    array-length v1, v0

    array-length v2, p1

    add-int/2addr v1, v2

    new-array v1, v1, [Lcom/google/zxing/ResultPoint;

    .line 118
    .local v1, "allPoints":[Lcom/google/zxing/ResultPoint;
    array-length v2, v0

    const/4 v3, 0x0

    invoke-static {v0, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 119
    array-length v2, v0

    array-length v4, p1

    invoke-static {p1, v3, v1, v2, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 120
    iput-object v1, p0, Lcom/google/zxing/Result;->resultPoints:[Lcom/google/zxing/ResultPoint;

    .line 122
    .end local v1    # "allPoints":[Lcom/google/zxing/ResultPoint;
    :cond_1d
    :goto_1d
    return-void
.end method

.method public getBarcodeFormat()Lcom/google/zxing/BarcodeFormat;
    .registers 2

    .line 83
    iget-object v0, p0, Lcom/google/zxing/Result;->format:Lcom/google/zxing/BarcodeFormat;

    return-object v0
.end method

.method public getRawBytes()[B
    .registers 2

    .line 67
    iget-object v0, p0, Lcom/google/zxing/Result;->rawBytes:[B

    return-object v0
.end method

.method public getResultMetadata()Ljava/util/Map;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Lcom/google/zxing/ResultMetadataType;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 92
    iget-object v0, p0, Lcom/google/zxing/Result;->resultMetadata:Ljava/util/Map;

    return-object v0
.end method

.method public getResultPoints()[Lcom/google/zxing/ResultPoint;
    .registers 2

    .line 76
    iget-object v0, p0, Lcom/google/zxing/Result;->resultPoints:[Lcom/google/zxing/ResultPoint;

    return-object v0
.end method

.method public getText()Ljava/lang/String;
    .registers 2

    .line 60
    iget-object v0, p0, Lcom/google/zxing/Result;->text:Ljava/lang/String;

    return-object v0
.end method

.method public getTimestamp()J
    .registers 3

    .line 125
    iget-wide v0, p0, Lcom/google/zxing/Result;->timestamp:J

    return-wide v0
.end method

.method public putAllMetadata(Ljava/util/Map;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Lcom/google/zxing/ResultMetadataType;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 103
    .local p1, "metadata":Ljava/util/Map;, "Ljava/util/Map<Lcom/google/zxing/ResultMetadataType;Ljava/lang/Object;>;"
    if-eqz p1, :cond_e

    .line 104
    iget-object v0, p0, Lcom/google/zxing/Result;->resultMetadata:Ljava/util/Map;

    if-nez v0, :cond_9

    .line 105
    iput-object p1, p0, Lcom/google/zxing/Result;->resultMetadata:Ljava/util/Map;

    .line 106
    goto :goto_e

    .line 107
    :cond_9
    iget-object v0, p0, Lcom/google/zxing/Result;->resultMetadata:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 110
    :cond_e
    :goto_e
    return-void
.end method

.method public putMetadata(Lcom/google/zxing/ResultMetadataType;Ljava/lang/Object;)V
    .registers 5
    .param p1, "type"    # Lcom/google/zxing/ResultMetadataType;
    .param p2, "value"    # Ljava/lang/Object;

    .line 96
    iget-object v0, p0, Lcom/google/zxing/Result;->resultMetadata:Ljava/util/Map;

    if-nez v0, :cond_d

    .line 97
    new-instance v0, Ljava/util/EnumMap;

    const-class v1, Lcom/google/zxing/ResultMetadataType;

    invoke-direct {v0, v1}, Ljava/util/EnumMap;-><init>(Ljava/lang/Class;)V

    iput-object v0, p0, Lcom/google/zxing/Result;->resultMetadata:Ljava/util/Map;

    .line 99
    :cond_d
    iget-object v0, p0, Lcom/google/zxing/Result;->resultMetadata:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 100
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .line 130
    iget-object v0, p0, Lcom/google/zxing/Result;->text:Ljava/lang/String;

    return-object v0
.end method
