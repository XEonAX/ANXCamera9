.class public final Lcom/google/zxing/oned/rss/FinderPattern;
.super Ljava/lang/Object;
.source "FinderPattern.java"


# instance fields
.field private final resultPoints:[Lcom/google/zxing/ResultPoint;

.field private final startEnd:[I

.field private final value:I


# direct methods
.method public constructor <init>(I[IIII)V
    .locals 4
    .param p1, "value"    # I
    .param p2, "startEnd"    # [I
    .param p3, "start"    # I
    .param p4, "end"    # I
    .param p5, "rowNumber"    # I

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    iput p1, p0, Lcom/google/zxing/oned/rss/FinderPattern;->value:I

    .line 29
    iput-object p2, p0, Lcom/google/zxing/oned/rss/FinderPattern;->startEnd:[I

    .line 30
    const/4 v0, 0x2

    new-array v0, v0, [Lcom/google/zxing/ResultPoint;

    .line 31
    new-instance v1, Lcom/google/zxing/ResultPoint;

    int-to-float v2, p3

    int-to-float v3, p5

    invoke-direct {v1, v2, v3}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    const/4 v2, 0x0

    aput-object v1, v0, v2

    .line 32
    new-instance v1, Lcom/google/zxing/ResultPoint;

    int-to-float v2, p4

    int-to-float v3, p5

    invoke-direct {v1, v2, v3}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    const/4 v2, 0x1

    aput-object v1, v0, v2

    .line 30
    iput-object v0, p0, Lcom/google/zxing/oned/rss/FinderPattern;->resultPoints:[Lcom/google/zxing/ResultPoint;

    .line 34
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4
    .param p1, "o"    # Ljava/lang/Object;

    .line 50
    instance-of v0, p1, Lcom/google/zxing/oned/rss/FinderPattern;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 51
    return v1

    .line 53
    :cond_0
    move-object v0, p1

    check-cast v0, Lcom/google/zxing/oned/rss/FinderPattern;

    .line 54
    .local v0, "that":Lcom/google/zxing/oned/rss/FinderPattern;
    iget v2, p0, Lcom/google/zxing/oned/rss/FinderPattern;->value:I

    iget v3, v0, Lcom/google/zxing/oned/rss/FinderPattern;->value:I

    if-ne v2, v3, :cond_1

    const/4 v1, 0x1

    :cond_1
    return v1
.end method

.method public getResultPoints()[Lcom/google/zxing/ResultPoint;
    .locals 1

    .line 45
    iget-object v0, p0, Lcom/google/zxing/oned/rss/FinderPattern;->resultPoints:[Lcom/google/zxing/ResultPoint;

    return-object v0
.end method

.method public getStartEnd()[I
    .locals 1

    .line 41
    iget-object v0, p0, Lcom/google/zxing/oned/rss/FinderPattern;->startEnd:[I

    return-object v0
.end method

.method public getValue()I
    .locals 1

    .line 37
    iget v0, p0, Lcom/google/zxing/oned/rss/FinderPattern;->value:I

    return v0
.end method

.method public hashCode()I
    .locals 1

    .line 59
    iget v0, p0, Lcom/google/zxing/oned/rss/FinderPattern;->value:I

    return v0
.end method
