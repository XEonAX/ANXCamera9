.class public final Lcom/google/zxing/qrcode/decoder/QRCodeDecoderMetaData;
.super Ljava/lang/Object;
.source "QRCodeDecoderMetaData.java"


# instance fields
.field private final mirrored:Z


# direct methods
.method constructor <init>(Z)V
    .registers 2
    .param p1, "mirrored"    # Z

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    iput-boolean p1, p0, Lcom/google/zxing/qrcode/decoder/QRCodeDecoderMetaData;->mirrored:Z

    .line 33
    return-void
.end method


# virtual methods
.method public applyMirroredCorrection([Lcom/google/zxing/ResultPoint;)V
    .registers 6
    .param p1, "points"    # [Lcom/google/zxing/ResultPoint;

    .line 48
    iget-boolean v0, p0, Lcom/google/zxing/qrcode/decoder/QRCodeDecoderMetaData;->mirrored:Z

    if-eqz v0, :cond_16

    if-eqz p1, :cond_16

    array-length v0, p1

    const/4 v1, 0x3

    if-ge v0, v1, :cond_b

    goto :goto_16

    .line 51
    :cond_b
    const/4 v0, 0x0

    aget-object v1, p1, v0

    .line 52
    .local v1, "bottomLeft":Lcom/google/zxing/ResultPoint;
    const/4 v2, 0x2

    aget-object v3, p1, v2

    aput-object v3, p1, v0

    .line 53
    aput-object v1, p1, v2

    .line 55
    return-void

    .line 49
    .end local v1    # "bottomLeft":Lcom/google/zxing/ResultPoint;
    :cond_16
    :goto_16
    return-void
.end method

.method public isMirrored()Z
    .registers 2

    .line 39
    iget-boolean v0, p0, Lcom/google/zxing/qrcode/decoder/QRCodeDecoderMetaData;->mirrored:Z

    return v0
.end method
