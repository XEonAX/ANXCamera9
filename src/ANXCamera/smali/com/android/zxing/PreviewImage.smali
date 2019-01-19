.class public Lcom/android/zxing/PreviewImage;
.super Ljava/lang/Object;
.source "PreviewImage.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "PreviewImage"


# instance fields
.field private mData:[B

.field private mFormat:I

.field private mHeight:I

.field private mOrientation:I

.field private mTimestamp:J

.field private mWidth:I


# direct methods
.method public constructor <init>(Landroid/media/Image;III)V
    .locals 4

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 23
    invoke-virtual {p1}, Landroid/media/Image;->getTimestamp()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/android/zxing/PreviewImage;->mTimestamp:J

    .line 24
    invoke-virtual {p1}, Landroid/media/Image;->getWidth()I

    move-result v2

    iput v2, p0, Lcom/android/zxing/PreviewImage;->mWidth:I

    .line 25
    invoke-virtual {p1}, Landroid/media/Image;->getHeight()I

    move-result v2

    iput v2, p0, Lcom/android/zxing/PreviewImage;->mHeight:I

    .line 26
    invoke-virtual {p1}, Landroid/media/Image;->getFormat()I

    move-result v2

    iput v2, p0, Lcom/android/zxing/PreviewImage;->mFormat:I

    .line 27
    invoke-static {p1, p2, p3}, Lcom/android/zxing/PreviewImage;->convertYUV420ToNV21(Landroid/media/Image;II)[B

    move-result-object p1

    iput-object p1, p0, Lcom/android/zxing/PreviewImage;->mData:[B

    .line 28
    iput p4, p0, Lcom/android/zxing/PreviewImage;->mOrientation:I

    .line 29
    const-string p1, "PreviewImage"

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "PreviewDecodeManager convertYUV420ToNV21: cost = "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p3

    sub-long/2addr p3, v0

    invoke-virtual {p2, p3, p4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string p3, "ms"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 30
    return-void
.end method

.method private static convertYUV420ToNV21(Landroid/media/Image;II)[B
    .locals 11

    .line 68
    const/4 v0, 0x0

    if-nez p0, :cond_0

    .line 69
    return-object v0

    .line 71
    :cond_0
    invoke-virtual {p0}, Landroid/media/Image;->getFormat()I

    move-result v1

    const/16 v2, 0x23

    if-eq v1, v2, :cond_1

    .line 72
    return-object v0

    .line 75
    :cond_1
    invoke-virtual {p0}, Landroid/media/Image;->getPlanes()[Landroid/media/Image$Plane;

    move-result-object v0

    const/4 v1, 0x0

    aget-object v0, v0, v1

    invoke-virtual {v0}, Landroid/media/Image$Plane;->getBuffer()Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 76
    invoke-virtual {p0}, Landroid/media/Image;->getPlanes()[Landroid/media/Image$Plane;

    move-result-object v2

    const/4 v3, 0x2

    aget-object v2, v2, v3

    invoke-virtual {v2}, Landroid/media/Image$Plane;->getBuffer()Ljava/nio/ByteBuffer;

    move-result-object v2

    .line 77
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->limit()I

    move-result v4

    .line 78
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->limit()I

    move-result v5

    .line 79
    const-string v6, "PreviewImage"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "convertYUV420888ToNV21: size = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Landroid/media/Image;->getWidth()I

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v8, "x"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Landroid/media/Image;->getHeight()I

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v8, ", yStride = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    invoke-virtual {p0}, Landroid/media/Image;->getPlanes()[Landroid/media/Image$Plane;

    move-result-object v8

    aget-object v8, v8, v1

    invoke-virtual {v8}, Landroid/media/Image$Plane;->getRowStride()I

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v8, ", uvStride = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    invoke-virtual {p0}, Landroid/media/Image;->getPlanes()[Landroid/media/Image$Plane;

    move-result-object v8

    aget-object v8, v8, v3

    invoke-virtual {v8}, Landroid/media/Image$Plane;->getRowStride()I

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 79
    invoke-static {v6, v7}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 82
    add-int v6, v4, v5

    new-array v6, v6, [B

    .line 83
    invoke-virtual {v0, v6, v1, v4}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 84
    invoke-virtual {v2, v6, v4, v5}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 85
    array-length v0, v6

    int-to-double v4, v0

    mul-int v0, p1, p2

    int-to-double v7, v0

    const-wide/high16 v9, 0x3ff8000000000000L    # 1.5

    mul-double/2addr v7, v9

    cmpg-double v0, v4, v7

    if-gtz v0, :cond_2

    .line 86
    return-object v6

    .line 89
    :cond_2
    invoke-virtual {p0}, Landroid/media/Image;->getPlanes()[Landroid/media/Image$Plane;

    move-result-object v0

    aget-object v0, v0, v1

    invoke-virtual {v0}, Landroid/media/Image$Plane;->getRowStride()I

    move-result v0

    .line 90
    invoke-virtual {p0}, Landroid/media/Image;->getPlanes()[Landroid/media/Image$Plane;

    move-result-object p0

    aget-object p0, p0, v3

    invoke-virtual {p0}, Landroid/media/Image$Plane;->getRowStride()I

    move-result p0

    .line 92
    double-to-int v2, v7

    .line 93
    nop

    .line 94
    nop

    .line 95
    new-array v2, v2, [B

    .line 97
    move v4, v1

    move v5, v4

    move v7, v5

    :goto_0
    if-ge v4, p2, :cond_4

    .line 98
    invoke-static {v6, v5, v2, v7, p1}, Ljava/lang/System;->arraycopy([BI[BII)V

    .line 99
    add-int/lit8 v8, p2, -0x1

    if-ne v4, v8, :cond_3

    .line 100
    add-int/2addr v5, p1

    goto :goto_1

    .line 102
    :cond_3
    add-int/2addr v5, v0

    .line 104
    :goto_1
    add-int/2addr v7, p1

    .line 97
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 107
    :cond_4
    :goto_2
    div-int/lit8 v0, p2, 0x2

    if-ge v1, v0, :cond_6

    .line 108
    add-int/lit8 v0, v0, -0x1

    if-ne v1, v0, :cond_5

    .line 110
    add-int/lit8 v0, p1, -0x1

    invoke-static {v6, v5, v2, v7, v0}, Ljava/lang/System;->arraycopy([BI[BII)V

    goto :goto_3

    .line 112
    :cond_5
    invoke-static {v6, v5, v2, v7, p1}, Ljava/lang/System;->arraycopy([BI[BII)V

    .line 114
    :goto_3
    add-int/2addr v5, p0

    .line 115
    add-int/2addr v7, p1

    .line 107
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 117
    :cond_6
    return-object v2
.end method


# virtual methods
.method public getData()[B
    .locals 1

    .line 33
    iget-object v0, p0, Lcom/android/zxing/PreviewImage;->mData:[B

    return-object v0
.end method

.method public getFormat()I
    .locals 1

    .line 49
    iget v0, p0, Lcom/android/zxing/PreviewImage;->mFormat:I

    return v0
.end method

.method public getHeight()I
    .locals 1

    .line 45
    iget v0, p0, Lcom/android/zxing/PreviewImage;->mHeight:I

    return v0
.end method

.method public getOrientation()I
    .locals 1

    .line 53
    iget v0, p0, Lcom/android/zxing/PreviewImage;->mOrientation:I

    return v0
.end method

.method public getTimestamp()J
    .locals 2

    .line 37
    iget-wide v0, p0, Lcom/android/zxing/PreviewImage;->mTimestamp:J

    return-wide v0
.end method

.method public getWidth()I
    .locals 1

    .line 41
    iget v0, p0, Lcom/android/zxing/PreviewImage;->mWidth:I

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 58
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "PreviewImage{mData="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/android/zxing/PreviewImage;->mData:[B

    .line 59
    invoke-static {v1}, Ljava/util/Arrays;->toString([B)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", mTimestamp="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lcom/android/zxing/PreviewImage;->mTimestamp:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, ", mWidth="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/android/zxing/PreviewImage;->mWidth:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", mHeight="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/android/zxing/PreviewImage;->mHeight:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", mFormat="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/android/zxing/PreviewImage;->mFormat:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 58
    return-object v0
.end method
