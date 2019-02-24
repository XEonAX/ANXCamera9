.class public final Lcom/google/zxing/multi/ByQuadrantReader;
.super Ljava/lang/Object;
.source "ByQuadrantReader.java"

# interfaces
.implements Lcom/google/zxing/Reader;


# instance fields
.field private final delegate:Lcom/google/zxing/Reader;


# direct methods
.method public constructor <init>(Lcom/google/zxing/Reader;)V
    .registers 2
    .param p1, "delegate"    # Lcom/google/zxing/Reader;

    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    iput-object p1, p0, Lcom/google/zxing/multi/ByQuadrantReader;->delegate:Lcom/google/zxing/Reader;

    .line 44
    return-void
.end method


# virtual methods
.method public decode(Lcom/google/zxing/BinaryBitmap;)Lcom/google/zxing/Result;
    .registers 3
    .param p1, "image"    # Lcom/google/zxing/BinaryBitmap;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;,
            Lcom/google/zxing/ChecksumException;,
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    .line 49
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/google/zxing/multi/ByQuadrantReader;->decode(Lcom/google/zxing/BinaryBitmap;Ljava/util/Map;)Lcom/google/zxing/Result;

    move-result-object v0

    return-object v0
.end method

.method public decode(Lcom/google/zxing/BinaryBitmap;Ljava/util/Map;)Lcom/google/zxing/Result;
    .registers 15
    .param p1, "image"    # Lcom/google/zxing/BinaryBitmap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/zxing/BinaryBitmap;",
            "Ljava/util/Map<",
            "Lcom/google/zxing/DecodeHintType;",
            "*>;)",
            "Lcom/google/zxing/Result;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;,
            Lcom/google/zxing/ChecksumException;,
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    .line 56
    .local p2, "hints":Ljava/util/Map;, "Ljava/util/Map<Lcom/google/zxing/DecodeHintType;*>;"
    invoke-virtual {p1}, Lcom/google/zxing/BinaryBitmap;->getWidth()I

    move-result v0

    .line 57
    .local v0, "width":I
    invoke-virtual {p1}, Lcom/google/zxing/BinaryBitmap;->getHeight()I

    move-result v1

    .line 58
    .local v1, "height":I
    div-int/lit8 v2, v0, 0x2

    .line 59
    .local v2, "halfWidth":I
    div-int/lit8 v3, v1, 0x2

    .line 61
    .local v3, "halfHeight":I
    const/4 v4, 0x0

    invoke-virtual {p1, v4, v4, v2, v3}, Lcom/google/zxing/BinaryBitmap;->crop(IIII)Lcom/google/zxing/BinaryBitmap;

    move-result-object v5

    .line 63
    .local v5, "topLeft":Lcom/google/zxing/BinaryBitmap;
    :try_start_11
    iget-object v6, p0, Lcom/google/zxing/multi/ByQuadrantReader;->delegate:Lcom/google/zxing/Reader;

    invoke-interface {v6, v5, p2}, Lcom/google/zxing/Reader;->decode(Lcom/google/zxing/BinaryBitmap;Ljava/util/Map;)Lcom/google/zxing/Result;

    move-result-object v6
    :try_end_17
    .catch Lcom/google/zxing/NotFoundException; {:try_start_11 .. :try_end_17} :catch_18

    return-object v6

    .line 64
    :catch_18
    move-exception v6

    .line 68
    invoke-virtual {p1, v2, v4, v2, v3}, Lcom/google/zxing/BinaryBitmap;->crop(IIII)Lcom/google/zxing/BinaryBitmap;

    move-result-object v6

    .line 70
    .local v6, "topRight":Lcom/google/zxing/BinaryBitmap;
    :try_start_1d
    iget-object v7, p0, Lcom/google/zxing/multi/ByQuadrantReader;->delegate:Lcom/google/zxing/Reader;

    invoke-interface {v7, v6, p2}, Lcom/google/zxing/Reader;->decode(Lcom/google/zxing/BinaryBitmap;Ljava/util/Map;)Lcom/google/zxing/Result;

    move-result-object v7
    :try_end_23
    .catch Lcom/google/zxing/NotFoundException; {:try_start_1d .. :try_end_23} :catch_24

    return-object v7

    .line 71
    :catch_24
    move-exception v7

    .line 75
    invoke-virtual {p1, v4, v3, v2, v3}, Lcom/google/zxing/BinaryBitmap;->crop(IIII)Lcom/google/zxing/BinaryBitmap;

    move-result-object v4

    .line 77
    .local v4, "bottomLeft":Lcom/google/zxing/BinaryBitmap;
    :try_start_29
    iget-object v7, p0, Lcom/google/zxing/multi/ByQuadrantReader;->delegate:Lcom/google/zxing/Reader;

    invoke-interface {v7, v4, p2}, Lcom/google/zxing/Reader;->decode(Lcom/google/zxing/BinaryBitmap;Ljava/util/Map;)Lcom/google/zxing/Result;

    move-result-object v7
    :try_end_2f
    .catch Lcom/google/zxing/NotFoundException; {:try_start_29 .. :try_end_2f} :catch_30

    return-object v7

    .line 78
    :catch_30
    move-exception v7

    .line 82
    invoke-virtual {p1, v2, v3, v2, v3}, Lcom/google/zxing/BinaryBitmap;->crop(IIII)Lcom/google/zxing/BinaryBitmap;

    move-result-object v7

    .line 84
    .local v7, "bottomRight":Lcom/google/zxing/BinaryBitmap;
    :try_start_35
    iget-object v8, p0, Lcom/google/zxing/multi/ByQuadrantReader;->delegate:Lcom/google/zxing/Reader;

    invoke-interface {v8, v7, p2}, Lcom/google/zxing/Reader;->decode(Lcom/google/zxing/BinaryBitmap;Ljava/util/Map;)Lcom/google/zxing/Result;

    move-result-object v8
    :try_end_3b
    .catch Lcom/google/zxing/NotFoundException; {:try_start_35 .. :try_end_3b} :catch_3c

    return-object v8

    .line 85
    :catch_3c
    move-exception v8

    .line 89
    div-int/lit8 v8, v2, 0x2

    .line 90
    .local v8, "quarterWidth":I
    div-int/lit8 v9, v3, 0x2

    .line 91
    .local v9, "quarterHeight":I
    invoke-virtual {p1, v8, v9, v2, v3}, Lcom/google/zxing/BinaryBitmap;->crop(IIII)Lcom/google/zxing/BinaryBitmap;

    move-result-object v10

    .line 92
    .local v10, "center":Lcom/google/zxing/BinaryBitmap;
    iget-object v11, p0, Lcom/google/zxing/multi/ByQuadrantReader;->delegate:Lcom/google/zxing/Reader;

    invoke-interface {v11, v10, p2}, Lcom/google/zxing/Reader;->decode(Lcom/google/zxing/BinaryBitmap;Ljava/util/Map;)Lcom/google/zxing/Result;

    move-result-object v11

    return-object v11
.end method

.method public reset()V
    .registers 2

    .line 97
    iget-object v0, p0, Lcom/google/zxing/multi/ByQuadrantReader;->delegate:Lcom/google/zxing/Reader;

    invoke-interface {v0}, Lcom/google/zxing/Reader;->reset()V

    .line 98
    return-void
.end method
