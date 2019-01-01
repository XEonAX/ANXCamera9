.class final Lcom/google/zxing/oned/rss/expanded/decoders/DecodedInformation;
.super Lcom/google/zxing/oned/rss/expanded/decoders/DecodedObject;
.source "DecodedInformation.java"


# instance fields
.field private final newString:Ljava/lang/String;

.field private final remaining:Z

.field private final remainingValue:I


# direct methods
.method constructor <init>(ILjava/lang/String;)V
    .locals 1
    .param p1, "newPosition"    # I
    .param p2, "newString"    # Ljava/lang/String;

    .line 40
    invoke-direct {p0, p1}, Lcom/google/zxing/oned/rss/expanded/decoders/DecodedObject;-><init>(I)V

    .line 41
    iput-object p2, p0, Lcom/google/zxing/oned/rss/expanded/decoders/DecodedInformation;->newString:Ljava/lang/String;

    .line 42
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/zxing/oned/rss/expanded/decoders/DecodedInformation;->remaining:Z

    .line 43
    iput v0, p0, Lcom/google/zxing/oned/rss/expanded/decoders/DecodedInformation;->remainingValue:I

    .line 44
    return-void
.end method

.method constructor <init>(ILjava/lang/String;I)V
    .locals 1
    .param p1, "newPosition"    # I
    .param p2, "newString"    # Ljava/lang/String;
    .param p3, "remainingValue"    # I

    .line 47
    invoke-direct {p0, p1}, Lcom/google/zxing/oned/rss/expanded/decoders/DecodedObject;-><init>(I)V

    .line 48
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/zxing/oned/rss/expanded/decoders/DecodedInformation;->remaining:Z

    .line 49
    iput p3, p0, Lcom/google/zxing/oned/rss/expanded/decoders/DecodedInformation;->remainingValue:I

    .line 50
    iput-object p2, p0, Lcom/google/zxing/oned/rss/expanded/decoders/DecodedInformation;->newString:Ljava/lang/String;

    .line 51
    return-void
.end method


# virtual methods
.method getNewString()Ljava/lang/String;
    .locals 1

    .line 54
    iget-object v0, p0, Lcom/google/zxing/oned/rss/expanded/decoders/DecodedInformation;->newString:Ljava/lang/String;

    return-object v0
.end method

.method getRemainingValue()I
    .locals 1

    .line 62
    iget v0, p0, Lcom/google/zxing/oned/rss/expanded/decoders/DecodedInformation;->remainingValue:I

    return v0
.end method

.method isRemaining()Z
    .locals 1

    .line 58
    iget-boolean v0, p0, Lcom/google/zxing/oned/rss/expanded/decoders/DecodedInformation;->remaining:Z

    return v0
.end method
