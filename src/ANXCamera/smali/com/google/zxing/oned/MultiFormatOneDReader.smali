.class public final Lcom/google/zxing/oned/MultiFormatOneDReader;
.super Lcom/google/zxing/oned/OneDReader;
.source "MultiFormatOneDReader.java"


# instance fields
.field private final readers:[Lcom/google/zxing/oned/OneDReader;


# direct methods
.method public constructor <init>(Ljava/util/Map;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Lcom/google/zxing/DecodeHintType;",
            "*>;)V"
        }
    .end annotation

    .line 41
    .local p1, "hints":Ljava/util/Map;, "Ljava/util/Map<Lcom/google/zxing/DecodeHintType;*>;"
    invoke-direct {p0}, Lcom/google/zxing/oned/OneDReader;-><init>()V

    .line 43
    if-nez p1, :cond_7

    const/4 v0, 0x0

    goto :goto_f

    .line 44
    :cond_7
    sget-object v0, Lcom/google/zxing/DecodeHintType;->POSSIBLE_FORMATS:Lcom/google/zxing/DecodeHintType;

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Collection;

    .line 43
    :goto_f
    nop

    .line 45
    .local v0, "possibleFormats":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/google/zxing/BarcodeFormat;>;"
    if-eqz p1, :cond_1c

    .line 46
    sget-object v1, Lcom/google/zxing/DecodeHintType;->ASSUME_CODE_39_CHECK_DIGIT:Lcom/google/zxing/DecodeHintType;

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_1c

    .line 45
    const/4 v1, 0x1

    goto :goto_1d

    :cond_1c
    const/4 v1, 0x0

    .line 47
    .local v1, "useCode39CheckDigit":Z
    :goto_1d
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 48
    .local v2, "readers":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/google/zxing/oned/OneDReader;>;"
    if-eqz v0, :cond_bc

    .line 49
    sget-object v3, Lcom/google/zxing/BarcodeFormat;->EAN_13:Lcom/google/zxing/BarcodeFormat;

    invoke-interface {v0, v3}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_44

    .line 50
    sget-object v3, Lcom/google/zxing/BarcodeFormat;->UPC_A:Lcom/google/zxing/BarcodeFormat;

    invoke-interface {v0, v3}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_44

    .line 51
    sget-object v3, Lcom/google/zxing/BarcodeFormat;->EAN_8:Lcom/google/zxing/BarcodeFormat;

    invoke-interface {v0, v3}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_44

    .line 52
    sget-object v3, Lcom/google/zxing/BarcodeFormat;->UPC_E:Lcom/google/zxing/BarcodeFormat;

    invoke-interface {v0, v3}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4c

    .line 53
    :cond_44
    new-instance v3, Lcom/google/zxing/oned/MultiFormatUPCEANReader;

    invoke-direct {v3, p1}, Lcom/google/zxing/oned/MultiFormatUPCEANReader;-><init>(Ljava/util/Map;)V

    invoke-interface {v2, v3}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 55
    :cond_4c
    sget-object v3, Lcom/google/zxing/BarcodeFormat;->CODE_39:Lcom/google/zxing/BarcodeFormat;

    invoke-interface {v0, v3}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5c

    .line 56
    new-instance v3, Lcom/google/zxing/oned/Code39Reader;

    invoke-direct {v3, v1}, Lcom/google/zxing/oned/Code39Reader;-><init>(Z)V

    invoke-interface {v2, v3}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 58
    :cond_5c
    sget-object v3, Lcom/google/zxing/BarcodeFormat;->CODE_93:Lcom/google/zxing/BarcodeFormat;

    invoke-interface {v0, v3}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_6c

    .line 59
    new-instance v3, Lcom/google/zxing/oned/Code93Reader;

    invoke-direct {v3}, Lcom/google/zxing/oned/Code93Reader;-><init>()V

    invoke-interface {v2, v3}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 61
    :cond_6c
    sget-object v3, Lcom/google/zxing/BarcodeFormat;->CODE_128:Lcom/google/zxing/BarcodeFormat;

    invoke-interface {v0, v3}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_7c

    .line 62
    new-instance v3, Lcom/google/zxing/oned/Code128Reader;

    invoke-direct {v3}, Lcom/google/zxing/oned/Code128Reader;-><init>()V

    invoke-interface {v2, v3}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 64
    :cond_7c
    sget-object v3, Lcom/google/zxing/BarcodeFormat;->ITF:Lcom/google/zxing/BarcodeFormat;

    invoke-interface {v0, v3}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_8c

    .line 65
    new-instance v3, Lcom/google/zxing/oned/ITFReader;

    invoke-direct {v3}, Lcom/google/zxing/oned/ITFReader;-><init>()V

    invoke-interface {v2, v3}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 67
    :cond_8c
    sget-object v3, Lcom/google/zxing/BarcodeFormat;->CODABAR:Lcom/google/zxing/BarcodeFormat;

    invoke-interface {v0, v3}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_9c

    .line 68
    new-instance v3, Lcom/google/zxing/oned/CodaBarReader;

    invoke-direct {v3}, Lcom/google/zxing/oned/CodaBarReader;-><init>()V

    invoke-interface {v2, v3}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 70
    :cond_9c
    sget-object v3, Lcom/google/zxing/BarcodeFormat;->RSS_14:Lcom/google/zxing/BarcodeFormat;

    invoke-interface {v0, v3}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_ac

    .line 71
    new-instance v3, Lcom/google/zxing/oned/rss/RSS14Reader;

    invoke-direct {v3}, Lcom/google/zxing/oned/rss/RSS14Reader;-><init>()V

    invoke-interface {v2, v3}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 73
    :cond_ac
    sget-object v3, Lcom/google/zxing/BarcodeFormat;->RSS_EXPANDED:Lcom/google/zxing/BarcodeFormat;

    invoke-interface {v0, v3}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_bc

    .line 74
    new-instance v3, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;

    invoke-direct {v3}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;-><init>()V

    invoke-interface {v2, v3}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 77
    :cond_bc
    invoke-interface {v2}, Ljava/util/Collection;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_102

    .line 78
    new-instance v3, Lcom/google/zxing/oned/MultiFormatUPCEANReader;

    invoke-direct {v3, p1}, Lcom/google/zxing/oned/MultiFormatUPCEANReader;-><init>(Ljava/util/Map;)V

    invoke-interface {v2, v3}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 79
    new-instance v3, Lcom/google/zxing/oned/Code39Reader;

    invoke-direct {v3}, Lcom/google/zxing/oned/Code39Reader;-><init>()V

    invoke-interface {v2, v3}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 80
    new-instance v3, Lcom/google/zxing/oned/CodaBarReader;

    invoke-direct {v3}, Lcom/google/zxing/oned/CodaBarReader;-><init>()V

    invoke-interface {v2, v3}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 81
    new-instance v3, Lcom/google/zxing/oned/Code93Reader;

    invoke-direct {v3}, Lcom/google/zxing/oned/Code93Reader;-><init>()V

    invoke-interface {v2, v3}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 82
    new-instance v3, Lcom/google/zxing/oned/Code128Reader;

    invoke-direct {v3}, Lcom/google/zxing/oned/Code128Reader;-><init>()V

    invoke-interface {v2, v3}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 83
    new-instance v3, Lcom/google/zxing/oned/ITFReader;

    invoke-direct {v3}, Lcom/google/zxing/oned/ITFReader;-><init>()V

    invoke-interface {v2, v3}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 84
    new-instance v3, Lcom/google/zxing/oned/rss/RSS14Reader;

    invoke-direct {v3}, Lcom/google/zxing/oned/rss/RSS14Reader;-><init>()V

    invoke-interface {v2, v3}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 85
    new-instance v3, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;

    invoke-direct {v3}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;-><init>()V

    invoke-interface {v2, v3}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 87
    :cond_102
    invoke-interface {v2}, Ljava/util/Collection;->size()I

    move-result v3

    new-array v3, v3, [Lcom/google/zxing/oned/OneDReader;

    invoke-interface {v2, v3}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Lcom/google/zxing/oned/OneDReader;

    iput-object v3, p0, Lcom/google/zxing/oned/MultiFormatOneDReader;->readers:[Lcom/google/zxing/oned/OneDReader;

    .line 88
    return-void
.end method


# virtual methods
.method public decodeRow(ILcom/google/zxing/common/BitArray;Ljava/util/Map;)Lcom/google/zxing/Result;
    .registers 9
    .param p1, "rowNumber"    # I
    .param p2, "row"    # Lcom/google/zxing/common/BitArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lcom/google/zxing/common/BitArray;",
            "Ljava/util/Map<",
            "Lcom/google/zxing/DecodeHintType;",
            "*>;)",
            "Lcom/google/zxing/Result;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .line 94
    .local p3, "hints":Ljava/util/Map;, "Ljava/util/Map<Lcom/google/zxing/DecodeHintType;*>;"
    iget-object v0, p0, Lcom/google/zxing/oned/MultiFormatOneDReader;->readers:[Lcom/google/zxing/oned/OneDReader;

    array-length v1, v0

    const/4 v2, 0x0

    :goto_4
    if-ge v2, v1, :cond_11

    aget-object v3, v0, v2

    .line 96
    .local v3, "reader":Lcom/google/zxing/oned/OneDReader;
    :try_start_8
    invoke-virtual {v3, p1, p2, p3}, Lcom/google/zxing/oned/OneDReader;->decodeRow(ILcom/google/zxing/common/BitArray;Ljava/util/Map;)Lcom/google/zxing/Result;

    move-result-object v4
    :try_end_c
    .catch Lcom/google/zxing/ReaderException; {:try_start_8 .. :try_end_c} :catch_d

    return-object v4

    .line 97
    :catch_d
    move-exception v4

    .line 94
    .end local v3    # "reader":Lcom/google/zxing/oned/OneDReader;
    add-int/lit8 v2, v2, 0x1

    goto :goto_4

    .line 102
    :cond_11
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v0

    throw v0
.end method

.method public reset()V
    .registers 5

    .line 107
    iget-object v0, p0, Lcom/google/zxing/oned/MultiFormatOneDReader;->readers:[Lcom/google/zxing/oned/OneDReader;

    array-length v1, v0

    const/4 v2, 0x0

    :goto_4
    if-lt v2, v1, :cond_7

    .line 110
    return-void

    .line 107
    :cond_7
    aget-object v3, v0, v2

    .line 108
    .local v3, "reader":Lcom/google/zxing/Reader;
    invoke-interface {v3}, Lcom/google/zxing/Reader;->reset()V

    .line 107
    .end local v3    # "reader":Lcom/google/zxing/Reader;
    add-int/lit8 v2, v2, 0x1

    goto :goto_4
.end method
