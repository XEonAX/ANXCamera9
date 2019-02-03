.class public final Lcom/google/zxing/aztec/AztecDetectorResult;
.super Lcom/google/zxing/common/DetectorResult;
.source "AztecDetectorResult.java"


# instance fields
.field private final compact:Z

.field private final nbDatablocks:I

.field private final nbLayers:I


# direct methods
.method public constructor <init>(Lcom/google/zxing/common/BitMatrix;[Lcom/google/zxing/ResultPoint;ZII)V
    .registers 6
    .param p1, "bits"    # Lcom/google/zxing/common/BitMatrix;
    .param p2, "points"    # [Lcom/google/zxing/ResultPoint;
    .param p3, "compact"    # Z
    .param p4, "nbDatablocks"    # I
    .param p5, "nbLayers"    # I

    .line 34
    invoke-direct {p0, p1, p2}, Lcom/google/zxing/common/DetectorResult;-><init>(Lcom/google/zxing/common/BitMatrix;[Lcom/google/zxing/ResultPoint;)V

    .line 35
    iput-boolean p3, p0, Lcom/google/zxing/aztec/AztecDetectorResult;->compact:Z

    .line 36
    iput p4, p0, Lcom/google/zxing/aztec/AztecDetectorResult;->nbDatablocks:I

    .line 37
    iput p5, p0, Lcom/google/zxing/aztec/AztecDetectorResult;->nbLayers:I

    .line 38
    return-void
.end method


# virtual methods
.method public getNbDatablocks()I
    .registers 2

    .line 45
    iget v0, p0, Lcom/google/zxing/aztec/AztecDetectorResult;->nbDatablocks:I

    return v0
.end method

.method public getNbLayers()I
    .registers 2

    .line 41
    iget v0, p0, Lcom/google/zxing/aztec/AztecDetectorResult;->nbLayers:I

    return v0
.end method

.method public isCompact()Z
    .registers 2

    .line 49
    iget-boolean v0, p0, Lcom/google/zxing/aztec/AztecDetectorResult;->compact:Z

    return v0
.end method
