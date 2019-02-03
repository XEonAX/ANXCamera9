.class final Lcom/google/zxing/pdf417/decoder/BarcodeMetadata;
.super Ljava/lang/Object;
.source "BarcodeMetadata.java"


# instance fields
.field private final columnCount:I

.field private final errorCorrectionLevel:I

.field private final rowCount:I

.field private final rowCountLowerPart:I

.field private final rowCountUpperPart:I


# direct methods
.method constructor <init>(IIII)V
    .registers 6
    .param p1, "columnCount"    # I
    .param p2, "rowCountUpperPart"    # I
    .param p3, "rowCountLowerPart"    # I
    .param p4, "errorCorrectionLevel"    # I

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    iput p1, p0, Lcom/google/zxing/pdf417/decoder/BarcodeMetadata;->columnCount:I

    .line 32
    iput p4, p0, Lcom/google/zxing/pdf417/decoder/BarcodeMetadata;->errorCorrectionLevel:I

    .line 33
    iput p2, p0, Lcom/google/zxing/pdf417/decoder/BarcodeMetadata;->rowCountUpperPart:I

    .line 34
    iput p3, p0, Lcom/google/zxing/pdf417/decoder/BarcodeMetadata;->rowCountLowerPart:I

    .line 35
    add-int v0, p2, p3

    iput v0, p0, Lcom/google/zxing/pdf417/decoder/BarcodeMetadata;->rowCount:I

    .line 36
    return-void
.end method


# virtual methods
.method getColumnCount()I
    .registers 2

    .line 39
    iget v0, p0, Lcom/google/zxing/pdf417/decoder/BarcodeMetadata;->columnCount:I

    return v0
.end method

.method getErrorCorrectionLevel()I
    .registers 2

    .line 43
    iget v0, p0, Lcom/google/zxing/pdf417/decoder/BarcodeMetadata;->errorCorrectionLevel:I

    return v0
.end method

.method getRowCount()I
    .registers 2

    .line 47
    iget v0, p0, Lcom/google/zxing/pdf417/decoder/BarcodeMetadata;->rowCount:I

    return v0
.end method

.method getRowCountLowerPart()I
    .registers 2

    .line 55
    iget v0, p0, Lcom/google/zxing/pdf417/decoder/BarcodeMetadata;->rowCountLowerPart:I

    return v0
.end method

.method getRowCountUpperPart()I
    .registers 2

    .line 51
    iget v0, p0, Lcom/google/zxing/pdf417/decoder/BarcodeMetadata;->rowCountUpperPart:I

    return v0
.end method
