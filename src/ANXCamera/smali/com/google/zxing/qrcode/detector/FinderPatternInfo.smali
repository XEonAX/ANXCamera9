.class public final Lcom/google/zxing/qrcode/detector/FinderPatternInfo;
.super Ljava/lang/Object;
.source "FinderPatternInfo.java"


# instance fields
.field private final bottomLeft:Lcom/google/zxing/qrcode/detector/FinderPattern;

.field private final topLeft:Lcom/google/zxing/qrcode/detector/FinderPattern;

.field private final topRight:Lcom/google/zxing/qrcode/detector/FinderPattern;


# direct methods
.method public constructor <init>([Lcom/google/zxing/qrcode/detector/FinderPattern;)V
    .registers 3
    .param p1, "patternCenters"    # [Lcom/google/zxing/qrcode/detector/FinderPattern;

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    const/4 v0, 0x0

    aget-object v0, p1, v0

    iput-object v0, p0, Lcom/google/zxing/qrcode/detector/FinderPatternInfo;->bottomLeft:Lcom/google/zxing/qrcode/detector/FinderPattern;

    .line 33
    const/4 v0, 0x1

    aget-object v0, p1, v0

    iput-object v0, p0, Lcom/google/zxing/qrcode/detector/FinderPatternInfo;->topLeft:Lcom/google/zxing/qrcode/detector/FinderPattern;

    .line 34
    const/4 v0, 0x2

    aget-object v0, p1, v0

    iput-object v0, p0, Lcom/google/zxing/qrcode/detector/FinderPatternInfo;->topRight:Lcom/google/zxing/qrcode/detector/FinderPattern;

    .line 35
    return-void
.end method


# virtual methods
.method public getBottomLeft()Lcom/google/zxing/qrcode/detector/FinderPattern;
    .registers 2

    .line 38
    iget-object v0, p0, Lcom/google/zxing/qrcode/detector/FinderPatternInfo;->bottomLeft:Lcom/google/zxing/qrcode/detector/FinderPattern;

    return-object v0
.end method

.method public getTopLeft()Lcom/google/zxing/qrcode/detector/FinderPattern;
    .registers 2

    .line 42
    iget-object v0, p0, Lcom/google/zxing/qrcode/detector/FinderPatternInfo;->topLeft:Lcom/google/zxing/qrcode/detector/FinderPattern;

    return-object v0
.end method

.method public getTopRight()Lcom/google/zxing/qrcode/detector/FinderPattern;
    .registers 2

    .line 46
    iget-object v0, p0, Lcom/google/zxing/qrcode/detector/FinderPatternInfo;->topRight:Lcom/google/zxing/qrcode/detector/FinderPattern;

    return-object v0
.end method
