.class public final Lcom/google/zxing/qrcode/detector/FinderPattern;
.super Lcom/google/zxing/ResultPoint;
.source "FinderPattern.java"


# instance fields
.field private final count:I

.field private final estimatedModuleSize:F


# direct methods
.method constructor <init>(FFF)V
    .locals 1
    .param p1, "posX"    # F
    .param p2, "posY"    # F
    .param p3, "estimatedModuleSize"    # F

    .line 34
    const/4 v0, 0x1

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/google/zxing/qrcode/detector/FinderPattern;-><init>(FFFI)V

    .line 35
    return-void
.end method

.method private constructor <init>(FFFI)V
    .locals 0
    .param p1, "posX"    # F
    .param p2, "posY"    # F
    .param p3, "estimatedModuleSize"    # F
    .param p4, "count"    # I

    .line 38
    invoke-direct {p0, p1, p2}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    .line 39
    iput p3, p0, Lcom/google/zxing/qrcode/detector/FinderPattern;->estimatedModuleSize:F

    .line 40
    iput p4, p0, Lcom/google/zxing/qrcode/detector/FinderPattern;->count:I

    .line 41
    return-void
.end method


# virtual methods
.method aboutEquals(FFF)Z
    .locals 3
    .param p1, "moduleSize"    # F
    .param p2, "i"    # F
    .param p3, "j"    # F

    .line 62
    invoke-virtual {p0}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getY()F

    move-result v0

    sub-float v0, p2, v0

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    cmpg-float v0, v0, p1

    const/4 v1, 0x0

    if-gtz v0, :cond_1

    invoke-virtual {p0}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getX()F

    move-result v0

    sub-float v0, p3, v0

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    cmpg-float v0, v0, p1

    if-gtz v0, :cond_1

    .line 63
    iget v0, p0, Lcom/google/zxing/qrcode/detector/FinderPattern;->estimatedModuleSize:F

    sub-float v0, p1, v0

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    .line 64
    .local v0, "moduleSizeDiff":F
    const/high16 v2, 0x3f800000    # 1.0f

    cmpg-float v2, v0, v2

    if-lez v2, :cond_0

    iget v2, p0, Lcom/google/zxing/qrcode/detector/FinderPattern;->estimatedModuleSize:F

    cmpg-float v2, v0, v2

    if-lez v2, :cond_0

    return v1

    :cond_0
    const/4 v1, 0x1

    return v1

    .line 66
    .end local v0    # "moduleSizeDiff":F
    :cond_1
    return v1
.end method

.method combineEstimate(FFF)Lcom/google/zxing/qrcode/detector/FinderPattern;
    .locals 5
    .param p1, "i"    # F
    .param p2, "j"    # F
    .param p3, "newModuleSize"    # F

    .line 75
    iget v0, p0, Lcom/google/zxing/qrcode/detector/FinderPattern;->count:I

    add-int/lit8 v0, v0, 0x1

    .line 76
    .local v0, "combinedCount":I
    iget v1, p0, Lcom/google/zxing/qrcode/detector/FinderPattern;->count:I

    int-to-float v1, v1

    invoke-virtual {p0}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getX()F

    move-result v2

    mul-float/2addr v1, v2

    add-float/2addr v1, p2

    int-to-float v2, v0

    div-float/2addr v1, v2

    .line 77
    .local v1, "combinedX":F
    iget v2, p0, Lcom/google/zxing/qrcode/detector/FinderPattern;->count:I

    int-to-float v2, v2

    invoke-virtual {p0}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getY()F

    move-result v3

    mul-float/2addr v2, v3

    add-float/2addr v2, p1

    int-to-float v3, v0

    div-float/2addr v2, v3

    .line 78
    .local v2, "combinedY":F
    iget v3, p0, Lcom/google/zxing/qrcode/detector/FinderPattern;->count:I

    int-to-float v3, v3

    iget v4, p0, Lcom/google/zxing/qrcode/detector/FinderPattern;->estimatedModuleSize:F

    mul-float/2addr v3, v4

    add-float/2addr v3, p3

    int-to-float v4, v0

    div-float/2addr v3, v4

    .line 79
    .local v3, "combinedModuleSize":F
    new-instance v4, Lcom/google/zxing/qrcode/detector/FinderPattern;

    invoke-direct {v4, v1, v2, v3, v0}, Lcom/google/zxing/qrcode/detector/FinderPattern;-><init>(FFFI)V

    return-object v4
.end method

.method getCount()I
    .locals 1

    .line 48
    iget v0, p0, Lcom/google/zxing/qrcode/detector/FinderPattern;->count:I

    return v0
.end method

.method public getEstimatedModuleSize()F
    .locals 1

    .line 44
    iget v0, p0, Lcom/google/zxing/qrcode/detector/FinderPattern;->estimatedModuleSize:F

    return v0
.end method
