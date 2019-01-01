.class public final Lcom/google/zxing/qrcode/detector/AlignmentPattern;
.super Lcom/google/zxing/ResultPoint;
.source "AlignmentPattern.java"


# instance fields
.field private final estimatedModuleSize:F


# direct methods
.method constructor <init>(FFF)V
    .locals 0
    .param p1, "posX"    # F
    .param p2, "posY"    # F
    .param p3, "estimatedModuleSize"    # F

    .line 32
    invoke-direct {p0, p1, p2}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    .line 33
    iput p3, p0, Lcom/google/zxing/qrcode/detector/AlignmentPattern;->estimatedModuleSize:F

    .line 34
    return-void
.end method


# virtual methods
.method aboutEquals(FFF)Z
    .locals 3
    .param p1, "moduleSize"    # F
    .param p2, "i"    # F
    .param p3, "j"    # F

    .line 41
    invoke-virtual {p0}, Lcom/google/zxing/qrcode/detector/AlignmentPattern;->getY()F

    move-result v0

    sub-float v0, p2, v0

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    cmpg-float v0, v0, p1

    const/4 v1, 0x0

    if-gtz v0, :cond_1

    invoke-virtual {p0}, Lcom/google/zxing/qrcode/detector/AlignmentPattern;->getX()F

    move-result v0

    sub-float v0, p3, v0

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    cmpg-float v0, v0, p1

    if-gtz v0, :cond_1

    .line 42
    iget v0, p0, Lcom/google/zxing/qrcode/detector/AlignmentPattern;->estimatedModuleSize:F

    sub-float v0, p1, v0

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    .line 43
    .local v0, "moduleSizeDiff":F
    const/high16 v2, 0x3f800000    # 1.0f

    cmpg-float v2, v0, v2

    if-lez v2, :cond_0

    iget v2, p0, Lcom/google/zxing/qrcode/detector/AlignmentPattern;->estimatedModuleSize:F

    cmpg-float v2, v0, v2

    if-lez v2, :cond_0

    return v1

    :cond_0
    const/4 v1, 0x1

    return v1

    .line 45
    .end local v0    # "moduleSizeDiff":F
    :cond_1
    return v1
.end method

.method combineEstimate(FFF)Lcom/google/zxing/qrcode/detector/AlignmentPattern;
    .locals 4
    .param p1, "i"    # F
    .param p2, "j"    # F
    .param p3, "newModuleSize"    # F

    .line 53
    invoke-virtual {p0}, Lcom/google/zxing/qrcode/detector/AlignmentPattern;->getX()F

    move-result v0

    add-float/2addr v0, p2

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr v0, v1

    .line 54
    .local v0, "combinedX":F
    invoke-virtual {p0}, Lcom/google/zxing/qrcode/detector/AlignmentPattern;->getY()F

    move-result v2

    add-float/2addr v2, p1

    div-float/2addr v2, v1

    .line 55
    .local v2, "combinedY":F
    iget v3, p0, Lcom/google/zxing/qrcode/detector/AlignmentPattern;->estimatedModuleSize:F

    add-float/2addr v3, p3

    div-float/2addr v3, v1

    .line 56
    .local v3, "combinedModuleSize":F
    new-instance v1, Lcom/google/zxing/qrcode/detector/AlignmentPattern;

    invoke-direct {v1, v0, v2, v3}, Lcom/google/zxing/qrcode/detector/AlignmentPattern;-><init>(FFF)V

    return-object v1
.end method
