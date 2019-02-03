.class final Lcom/google/zxing/pdf417/encoder/BarcodeRow;
.super Ljava/lang/Object;
.source "BarcodeRow.java"


# instance fields
.field private currentLocation:I

.field private final row:[B


# direct methods
.method constructor <init>(I)V
    .registers 3
    .param p1, "width"    # I

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    new-array v0, p1, [B

    iput-object v0, p0, Lcom/google/zxing/pdf417/encoder/BarcodeRow;->row:[B

    .line 33
    const/4 v0, 0x0

    iput v0, p0, Lcom/google/zxing/pdf417/encoder/BarcodeRow;->currentLocation:I

    .line 34
    return-void
.end method


# virtual methods
.method addBar(ZI)V
    .registers 6
    .param p1, "black"    # Z
    .param p2, "width"    # I

    .line 61
    const/4 v0, 0x0

    .local v0, "ii":I
    :goto_1
    if-lt v0, p2, :cond_4

    .line 64
    .end local v0    # "ii":I
    return-void

    .line 62
    .restart local v0    # "ii":I
    :cond_4
    iget v1, p0, Lcom/google/zxing/pdf417/encoder/BarcodeRow;->currentLocation:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/google/zxing/pdf417/encoder/BarcodeRow;->currentLocation:I

    invoke-virtual {p0, v1, p1}, Lcom/google/zxing/pdf417/encoder/BarcodeRow;->set(IZ)V

    .line 61
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method getScaledRow(I)[B
    .registers 6
    .param p1, "scale"    # I

    .line 79
    iget-object v0, p0, Lcom/google/zxing/pdf417/encoder/BarcodeRow;->row:[B

    array-length v0, v0

    mul-int/2addr v0, p1

    new-array v0, v0, [B

    .line 80
    .local v0, "output":[B
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_7
    array-length v2, v0

    if-lt v1, v2, :cond_b

    .line 83
    .end local v1    # "i":I
    return-object v0

    .line 81
    .restart local v1    # "i":I
    :cond_b
    iget-object v2, p0, Lcom/google/zxing/pdf417/encoder/BarcodeRow;->row:[B

    div-int v3, v1, p1

    aget-byte v2, v2, v3

    aput-byte v2, v0, v1

    .line 80
    add-int/lit8 v1, v1, 0x1

    goto :goto_7
.end method

.method set(IB)V
    .registers 4
    .param p1, "x"    # I
    .param p2, "value"    # B

    .line 43
    iget-object v0, p0, Lcom/google/zxing/pdf417/encoder/BarcodeRow;->row:[B

    aput-byte p2, v0, p1

    .line 44
    return-void
.end method

.method set(IZ)V
    .registers 5
    .param p1, "x"    # I
    .param p2, "black"    # Z

    .line 53
    iget-object v0, p0, Lcom/google/zxing/pdf417/encoder/BarcodeRow;->row:[B

    int-to-byte v1, p2

    aput-byte v1, v0, p1

    .line 54
    return-void
.end method
