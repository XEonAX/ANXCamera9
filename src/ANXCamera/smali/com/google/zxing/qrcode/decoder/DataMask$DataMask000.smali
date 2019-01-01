.class final Lcom/google/zxing/qrcode/decoder/DataMask$DataMask000;
.super Lcom/google/zxing/qrcode/decoder/DataMask;
.source "DataMask.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/zxing/qrcode/decoder/DataMask;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "DataMask000"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 85
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/google/zxing/qrcode/decoder/DataMask;-><init>(Lcom/google/zxing/qrcode/decoder/DataMask;)V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/zxing/qrcode/decoder/DataMask$DataMask000;)V
    .locals 0

    .line 85
    invoke-direct {p0}, Lcom/google/zxing/qrcode/decoder/DataMask$DataMask000;-><init>()V

    return-void
.end method


# virtual methods
.method isMasked(II)Z
    .locals 2
    .param p1, "i"    # I
    .param p2, "j"    # I

    .line 88
    add-int v0, p1, p2

    const/4 v1, 0x1

    and-int/2addr v0, v1

    if-nez v0, :cond_0

    return v1

    :cond_0
    const/4 v0, 0x0

    return v0
.end method
