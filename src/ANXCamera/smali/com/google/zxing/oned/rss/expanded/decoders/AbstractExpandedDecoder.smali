.class public abstract Lcom/google/zxing/oned/rss/expanded/decoders/AbstractExpandedDecoder;
.super Ljava/lang/Object;
.source "AbstractExpandedDecoder.java"


# instance fields
.field private final generalDecoder:Lcom/google/zxing/oned/rss/expanded/decoders/GeneralAppIdDecoder;

.field private final information:Lcom/google/zxing/common/BitArray;


# direct methods
.method constructor <init>(Lcom/google/zxing/common/BitArray;)V
    .locals 1
    .param p1, "information"    # Lcom/google/zxing/common/BitArray;

    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    iput-object p1, p0, Lcom/google/zxing/oned/rss/expanded/decoders/AbstractExpandedDecoder;->information:Lcom/google/zxing/common/BitArray;

    .line 44
    new-instance v0, Lcom/google/zxing/oned/rss/expanded/decoders/GeneralAppIdDecoder;

    invoke-direct {v0, p1}, Lcom/google/zxing/oned/rss/expanded/decoders/GeneralAppIdDecoder;-><init>(Lcom/google/zxing/common/BitArray;)V

    iput-object v0, p0, Lcom/google/zxing/oned/rss/expanded/decoders/AbstractExpandedDecoder;->generalDecoder:Lcom/google/zxing/oned/rss/expanded/decoders/GeneralAppIdDecoder;

    .line 45
    return-void
.end method

.method public static createDecoder(Lcom/google/zxing/common/BitArray;)Lcom/google/zxing/oned/rss/expanded/decoders/AbstractExpandedDecoder;
    .locals 6
    .param p0, "information"    # Lcom/google/zxing/common/BitArray;

    .line 58
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/google/zxing/common/BitArray;->get(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 59
    new-instance v0, Lcom/google/zxing/oned/rss/expanded/decoders/AI01AndOtherAIs;

    invoke-direct {v0, p0}, Lcom/google/zxing/oned/rss/expanded/decoders/AI01AndOtherAIs;-><init>(Lcom/google/zxing/common/BitArray;)V

    return-object v0

    .line 61
    :cond_0
    const/4 v1, 0x2

    invoke-virtual {p0, v1}, Lcom/google/zxing/common/BitArray;->get(I)Z

    move-result v1

    if-nez v1, :cond_1

    .line 62
    new-instance v0, Lcom/google/zxing/oned/rss/expanded/decoders/AnyAIDecoder;

    invoke-direct {v0, p0}, Lcom/google/zxing/oned/rss/expanded/decoders/AnyAIDecoder;-><init>(Lcom/google/zxing/common/BitArray;)V

    return-object v0

    .line 65
    :cond_1
    const/4 v1, 0x4

    invoke-static {p0, v0, v1}, Lcom/google/zxing/oned/rss/expanded/decoders/GeneralAppIdDecoder;->extractNumericValueFromBitArray(Lcom/google/zxing/common/BitArray;II)I

    move-result v1

    .line 67
    .local v1, "fourBitEncodationMethod":I
    packed-switch v1, :pswitch_data_0

    .line 72
    const/4 v2, 0x5

    invoke-static {p0, v0, v2}, Lcom/google/zxing/oned/rss/expanded/decoders/GeneralAppIdDecoder;->extractNumericValueFromBitArray(Lcom/google/zxing/common/BitArray;II)I

    move-result v2

    .line 73
    .local v2, "fiveBitEncodationMethod":I
    packed-switch v2, :pswitch_data_1

    .line 78
    const/4 v3, 0x7

    invoke-static {p0, v0, v3}, Lcom/google/zxing/oned/rss/expanded/decoders/GeneralAppIdDecoder;->extractNumericValueFromBitArray(Lcom/google/zxing/common/BitArray;II)I

    move-result v0

    .line 79
    .local v0, "sevenBitEncodationMethod":I
    packed-switch v0, :pswitch_data_2

    .line 90
    new-instance v3, Ljava/lang/IllegalStateException;

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "unknown decoder: "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 69
    .end local v0    # "sevenBitEncodationMethod":I
    .end local v2    # "fiveBitEncodationMethod":I
    :pswitch_0
    new-instance v0, Lcom/google/zxing/oned/rss/expanded/decoders/AI01320xDecoder;

    invoke-direct {v0, p0}, Lcom/google/zxing/oned/rss/expanded/decoders/AI01320xDecoder;-><init>(Lcom/google/zxing/common/BitArray;)V

    return-object v0

    .line 68
    :pswitch_1
    new-instance v0, Lcom/google/zxing/oned/rss/expanded/decoders/AI013103decoder;

    invoke-direct {v0, p0}, Lcom/google/zxing/oned/rss/expanded/decoders/AI013103decoder;-><init>(Lcom/google/zxing/common/BitArray;)V

    return-object v0

    .line 75
    .restart local v2    # "fiveBitEncodationMethod":I
    :pswitch_2
    new-instance v0, Lcom/google/zxing/oned/rss/expanded/decoders/AI01393xDecoder;

    invoke-direct {v0, p0}, Lcom/google/zxing/oned/rss/expanded/decoders/AI01393xDecoder;-><init>(Lcom/google/zxing/common/BitArray;)V

    return-object v0

    .line 74
    :pswitch_3
    new-instance v0, Lcom/google/zxing/oned/rss/expanded/decoders/AI01392xDecoder;

    invoke-direct {v0, p0}, Lcom/google/zxing/oned/rss/expanded/decoders/AI01392xDecoder;-><init>(Lcom/google/zxing/common/BitArray;)V

    return-object v0

    .line 87
    .restart local v0    # "sevenBitEncodationMethod":I
    :pswitch_4
    new-instance v3, Lcom/google/zxing/oned/rss/expanded/decoders/AI013x0x1xDecoder;

    const-string v4, "320"

    const-string v5, "17"

    invoke-direct {v3, p0, v4, v5}, Lcom/google/zxing/oned/rss/expanded/decoders/AI013x0x1xDecoder;-><init>(Lcom/google/zxing/common/BitArray;Ljava/lang/String;Ljava/lang/String;)V

    return-object v3

    .line 86
    :pswitch_5
    new-instance v3, Lcom/google/zxing/oned/rss/expanded/decoders/AI013x0x1xDecoder;

    const-string v4, "310"

    const-string v5, "17"

    invoke-direct {v3, p0, v4, v5}, Lcom/google/zxing/oned/rss/expanded/decoders/AI013x0x1xDecoder;-><init>(Lcom/google/zxing/common/BitArray;Ljava/lang/String;Ljava/lang/String;)V

    return-object v3

    .line 85
    :pswitch_6
    new-instance v3, Lcom/google/zxing/oned/rss/expanded/decoders/AI013x0x1xDecoder;

    const-string v4, "320"

    const-string v5, "15"

    invoke-direct {v3, p0, v4, v5}, Lcom/google/zxing/oned/rss/expanded/decoders/AI013x0x1xDecoder;-><init>(Lcom/google/zxing/common/BitArray;Ljava/lang/String;Ljava/lang/String;)V

    return-object v3

    .line 84
    :pswitch_7
    new-instance v3, Lcom/google/zxing/oned/rss/expanded/decoders/AI013x0x1xDecoder;

    const-string v4, "310"

    const-string v5, "15"

    invoke-direct {v3, p0, v4, v5}, Lcom/google/zxing/oned/rss/expanded/decoders/AI013x0x1xDecoder;-><init>(Lcom/google/zxing/common/BitArray;Ljava/lang/String;Ljava/lang/String;)V

    return-object v3

    .line 83
    :pswitch_8
    new-instance v3, Lcom/google/zxing/oned/rss/expanded/decoders/AI013x0x1xDecoder;

    const-string v4, "320"

    const-string v5, "13"

    invoke-direct {v3, p0, v4, v5}, Lcom/google/zxing/oned/rss/expanded/decoders/AI013x0x1xDecoder;-><init>(Lcom/google/zxing/common/BitArray;Ljava/lang/String;Ljava/lang/String;)V

    return-object v3

    .line 82
    :pswitch_9
    new-instance v3, Lcom/google/zxing/oned/rss/expanded/decoders/AI013x0x1xDecoder;

    const-string v4, "310"

    const-string v5, "13"

    invoke-direct {v3, p0, v4, v5}, Lcom/google/zxing/oned/rss/expanded/decoders/AI013x0x1xDecoder;-><init>(Lcom/google/zxing/common/BitArray;Ljava/lang/String;Ljava/lang/String;)V

    return-object v3

    .line 81
    :pswitch_a
    new-instance v3, Lcom/google/zxing/oned/rss/expanded/decoders/AI013x0x1xDecoder;

    const-string v4, "320"

    const-string v5, "11"

    invoke-direct {v3, p0, v4, v5}, Lcom/google/zxing/oned/rss/expanded/decoders/AI013x0x1xDecoder;-><init>(Lcom/google/zxing/common/BitArray;Ljava/lang/String;Ljava/lang/String;)V

    return-object v3

    .line 80
    :pswitch_b
    new-instance v3, Lcom/google/zxing/oned/rss/expanded/decoders/AI013x0x1xDecoder;

    const-string v4, "310"

    const-string v5, "11"

    invoke-direct {v3, p0, v4, v5}, Lcom/google/zxing/oned/rss/expanded/decoders/AI013x0x1xDecoder;-><init>(Lcom/google/zxing/common/BitArray;Ljava/lang/String;Ljava/lang/String;)V

    return-object v3

    :pswitch_data_0
    .packed-switch 0x4
        :pswitch_1
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0xc
        :pswitch_3
        :pswitch_2
    .end packed-switch

    :pswitch_data_2
    .packed-switch 0x38
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
    .end packed-switch
.end method


# virtual methods
.method protected final getGeneralDecoder()Lcom/google/zxing/oned/rss/expanded/decoders/GeneralAppIdDecoder;
    .locals 1

    .line 52
    iget-object v0, p0, Lcom/google/zxing/oned/rss/expanded/decoders/AbstractExpandedDecoder;->generalDecoder:Lcom/google/zxing/oned/rss/expanded/decoders/GeneralAppIdDecoder;

    return-object v0
.end method

.method protected final getInformation()Lcom/google/zxing/common/BitArray;
    .locals 1

    .line 48
    iget-object v0, p0, Lcom/google/zxing/oned/rss/expanded/decoders/AbstractExpandedDecoder;->information:Lcom/google/zxing/common/BitArray;

    return-object v0
.end method

.method public abstract parseInformation()Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;,
            Lcom/google/zxing/FormatException;
        }
    .end annotation
.end method
