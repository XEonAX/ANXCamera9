.class final Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState;
.super Ljava/lang/Object;
.source "CurrentParsingState.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState$State;
    }
.end annotation


# instance fields
.field private encoding:Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState$State;

.field private position:I


# direct methods
.method constructor <init>()V
    .registers 2

    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    const/4 v0, 0x0

    iput v0, p0, Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState;->position:I

    .line 45
    sget-object v0, Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState$State;->NUMERIC:Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState$State;

    iput-object v0, p0, Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState;->encoding:Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState$State;

    .line 46
    return-void
.end method


# virtual methods
.method getPosition()I
    .registers 2

    .line 49
    iget v0, p0, Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState;->position:I

    return v0
.end method

.method incrementPosition(I)V
    .registers 3
    .param p1, "delta"    # I

    .line 57
    iget v0, p0, Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState;->position:I

    add-int/2addr v0, p1

    iput v0, p0, Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState;->position:I

    .line 58
    return-void
.end method

.method isAlpha()Z
    .registers 3

    .line 61
    iget-object v0, p0, Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState;->encoding:Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState$State;

    sget-object v1, Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState$State;->ALPHA:Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState$State;

    if-ne v0, v1, :cond_8

    const/4 v0, 0x1

    return v0

    :cond_8
    const/4 v0, 0x0

    return v0
.end method

.method isIsoIec646()Z
    .registers 3

    .line 69
    iget-object v0, p0, Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState;->encoding:Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState$State;

    sget-object v1, Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState$State;->ISO_IEC_646:Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState$State;

    if-ne v0, v1, :cond_8

    const/4 v0, 0x1

    return v0

    :cond_8
    const/4 v0, 0x0

    return v0
.end method

.method isNumeric()Z
    .registers 3

    .line 65
    iget-object v0, p0, Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState;->encoding:Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState$State;

    sget-object v1, Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState$State;->NUMERIC:Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState$State;

    if-ne v0, v1, :cond_8

    const/4 v0, 0x1

    return v0

    :cond_8
    const/4 v0, 0x0

    return v0
.end method

.method setAlpha()V
    .registers 2

    .line 77
    sget-object v0, Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState$State;->ALPHA:Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState$State;

    iput-object v0, p0, Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState;->encoding:Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState$State;

    .line 78
    return-void
.end method

.method setIsoIec646()V
    .registers 2

    .line 81
    sget-object v0, Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState$State;->ISO_IEC_646:Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState$State;

    iput-object v0, p0, Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState;->encoding:Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState$State;

    .line 82
    return-void
.end method

.method setNumeric()V
    .registers 2

    .line 73
    sget-object v0, Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState$State;->NUMERIC:Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState$State;

    iput-object v0, p0, Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState;->encoding:Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState$State;

    .line 74
    return-void
.end method

.method setPosition(I)V
    .registers 2
    .param p1, "position"    # I

    .line 53
    iput p1, p0, Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState;->position:I

    .line 54
    return-void
.end method
