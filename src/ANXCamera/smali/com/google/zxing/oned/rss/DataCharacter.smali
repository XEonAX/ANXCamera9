.class public Lcom/google/zxing/oned/rss/DataCharacter;
.super Ljava/lang/Object;
.source "DataCharacter.java"


# instance fields
.field private final checksumPortion:I

.field private final value:I


# direct methods
.method public constructor <init>(II)V
    .registers 3
    .param p1, "value"    # I
    .param p2, "checksumPortion"    # I

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    iput p1, p0, Lcom/google/zxing/oned/rss/DataCharacter;->value:I

    .line 26
    iput p2, p0, Lcom/google/zxing/oned/rss/DataCharacter;->checksumPortion:I

    .line 27
    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 6
    .param p1, "o"    # Ljava/lang/Object;

    .line 44
    instance-of v0, p1, Lcom/google/zxing/oned/rss/DataCharacter;

    const/4 v1, 0x0

    if-nez v0, :cond_6

    .line 45
    return v1

    .line 47
    :cond_6
    move-object v0, p1

    check-cast v0, Lcom/google/zxing/oned/rss/DataCharacter;

    .line 48
    .local v0, "that":Lcom/google/zxing/oned/rss/DataCharacter;
    iget v2, p0, Lcom/google/zxing/oned/rss/DataCharacter;->value:I

    iget v3, v0, Lcom/google/zxing/oned/rss/DataCharacter;->value:I

    if-ne v2, v3, :cond_16

    iget v2, p0, Lcom/google/zxing/oned/rss/DataCharacter;->checksumPortion:I

    iget v3, v0, Lcom/google/zxing/oned/rss/DataCharacter;->checksumPortion:I

    if-ne v2, v3, :cond_16

    const/4 v1, 0x1

    :cond_16
    return v1
.end method

.method public final getChecksumPortion()I
    .registers 2

    .line 34
    iget v0, p0, Lcom/google/zxing/oned/rss/DataCharacter;->checksumPortion:I

    return v0
.end method

.method public final getValue()I
    .registers 2

    .line 30
    iget v0, p0, Lcom/google/zxing/oned/rss/DataCharacter;->value:I

    return v0
.end method

.method public final hashCode()I
    .registers 3

    .line 53
    iget v0, p0, Lcom/google/zxing/oned/rss/DataCharacter;->value:I

    iget v1, p0, Lcom/google/zxing/oned/rss/DataCharacter;->checksumPortion:I

    xor-int/2addr v0, v1

    return v0
.end method

.method public final toString()Ljava/lang/String;
    .registers 3

    .line 39
    new-instance v0, Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/google/zxing/oned/rss/DataCharacter;->value:I

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, "("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/google/zxing/oned/rss/DataCharacter;->checksumPortion:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const/16 v1, 0x29

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
