.class final Lcom/google/zxing/qrcode/encoder/BlockPair;
.super Ljava/lang/Object;
.source "BlockPair.java"


# instance fields
.field private final dataBytes:[B

.field private final errorCorrectionBytes:[B


# direct methods
.method constructor <init>([B[B)V
    .registers 3
    .param p1, "data"    # [B
    .param p2, "errorCorrection"    # [B

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    iput-object p1, p0, Lcom/google/zxing/qrcode/encoder/BlockPair;->dataBytes:[B

    .line 26
    iput-object p2, p0, Lcom/google/zxing/qrcode/encoder/BlockPair;->errorCorrectionBytes:[B

    .line 27
    return-void
.end method


# virtual methods
.method public getDataBytes()[B
    .registers 2

    .line 30
    iget-object v0, p0, Lcom/google/zxing/qrcode/encoder/BlockPair;->dataBytes:[B

    return-object v0
.end method

.method public getErrorCorrectionBytes()[B
    .registers 2

    .line 34
    iget-object v0, p0, Lcom/google/zxing/qrcode/encoder/BlockPair;->errorCorrectionBytes:[B

    return-object v0
.end method
