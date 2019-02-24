.class final Lcom/google/zxing/qrcode/decoder/DataMask$DataMask011;
.super Lcom/google/zxing/qrcode/decoder/DataMask;
.source "DataMask.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/zxing/qrcode/decoder/DataMask;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "DataMask011"
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 2

    .line 115
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/google/zxing/qrcode/decoder/DataMask;-><init>(Lcom/google/zxing/qrcode/decoder/DataMask;)V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/zxing/qrcode/decoder/DataMask$DataMask011;)V
    .registers 2

    .line 115
    invoke-direct {p0}, Lcom/google/zxing/qrcode/decoder/DataMask$DataMask011;-><init>()V

    return-void
.end method


# virtual methods
.method isMasked(II)Z
    .registers 4
    .param p1, "i"    # I
    .param p2, "j"    # I

    .line 118
    add-int v0, p1, p2

    rem-int/lit8 v0, v0, 0x3

    if-nez v0, :cond_8

    const/4 v0, 0x1

    return v0

    :cond_8
    const/4 v0, 0x0

    return v0
.end method
