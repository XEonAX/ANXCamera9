.class final Lcom/google/zxing/oned/rss/Pair;
.super Lcom/google/zxing/oned/rss/DataCharacter;
.source "Pair.java"


# instance fields
.field private count:I

.field private final finderPattern:Lcom/google/zxing/oned/rss/FinderPattern;


# direct methods
.method constructor <init>(IILcom/google/zxing/oned/rss/FinderPattern;)V
    .registers 4
    .param p1, "value"    # I
    .param p2, "checksumPortion"    # I
    .param p3, "finderPattern"    # Lcom/google/zxing/oned/rss/FinderPattern;

    .line 25
    invoke-direct {p0, p1, p2}, Lcom/google/zxing/oned/rss/DataCharacter;-><init>(II)V

    .line 26
    iput-object p3, p0, Lcom/google/zxing/oned/rss/Pair;->finderPattern:Lcom/google/zxing/oned/rss/FinderPattern;

    .line 27
    return-void
.end method


# virtual methods
.method getCount()I
    .registers 2

    .line 34
    iget v0, p0, Lcom/google/zxing/oned/rss/Pair;->count:I

    return v0
.end method

.method getFinderPattern()Lcom/google/zxing/oned/rss/FinderPattern;
    .registers 2

    .line 30
    iget-object v0, p0, Lcom/google/zxing/oned/rss/Pair;->finderPattern:Lcom/google/zxing/oned/rss/FinderPattern;

    return-object v0
.end method

.method incrementCount()V
    .registers 2

    .line 38
    iget v0, p0, Lcom/google/zxing/oned/rss/Pair;->count:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/google/zxing/oned/rss/Pair;->count:I

    .line 39
    return-void
.end method
