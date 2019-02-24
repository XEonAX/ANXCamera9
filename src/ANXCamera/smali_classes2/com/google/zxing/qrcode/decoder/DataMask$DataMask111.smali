.class final Lcom/google/zxing/qrcode/decoder/DataMask$DataMask111;
.super Lcom/google/zxing/qrcode/decoder/DataMask;
.source "DataMask.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/zxing/qrcode/decoder/DataMask;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "DataMask111"
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 2

    .line 157
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/google/zxing/qrcode/decoder/DataMask;-><init>(Lcom/google/zxing/qrcode/decoder/DataMask;)V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/zxing/qrcode/decoder/DataMask$DataMask111;)V
    .registers 2

    .line 157
    invoke-direct {p0}, Lcom/google/zxing/qrcode/decoder/DataMask$DataMask111;-><init>()V

    return-void
.end method


# virtual methods
.method isMasked(II)Z
    .registers 6
    .param p1, "i"    # I
    .param p2, "j"    # I

    .line 160
    add-int v0, p1, p2

    const/4 v1, 0x1

    and-int/2addr v0, v1

    mul-int v2, p1, p2

    rem-int/lit8 v2, v2, 0x3

    add-int/2addr v0, v2

    and-int/2addr v0, v1

    if-nez v0, :cond_d

    return v1

    :cond_d
    const/4 v0, 0x0

    return v0
.end method
