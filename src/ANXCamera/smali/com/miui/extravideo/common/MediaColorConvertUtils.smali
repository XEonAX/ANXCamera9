.class public Lcom/miui/extravideo/common/MediaColorConvertUtils;
.super Ljava/lang/Object;
.source "MediaColorConvertUtils.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static convertDecodeColorToEncode([B[BLcom/miui/extravideo/common/MediaParamsHolder;)V
    .locals 9

    .line 5
    iget v0, p2, Lcom/miui/extravideo/common/MediaParamsHolder;->videoWidth:I

    iget v1, p2, Lcom/miui/extravideo/common/MediaParamsHolder;->videoHeight:I

    iget v4, p2, Lcom/miui/extravideo/common/MediaParamsHolder;->intervalPaddingSize:I

    iget v5, p2, Lcom/miui/extravideo/common/MediaParamsHolder;->topPaddingSize:I

    iget v6, p2, Lcom/miui/extravideo/common/MediaParamsHolder;->leftPaddingSize:I

    iget v7, p2, Lcom/miui/extravideo/common/MediaParamsHolder;->stride:I

    const/4 v8, 0x0

    move-object v2, p0

    move-object v3, p1

    invoke-static/range {v0 .. v8}, Lcom/miui/extravideo/common/ColorConverterJNI;->convertYuv420spToYvu420sp(II[B[BIIIIZ)I

    .line 6
    return-void
.end method

.method public static toggleYUV([BII)V
    .locals 2

    .line 9
    mul-int/2addr p1, p2

    .line 10
    :goto_0
    array-length p2, p0

    if-ge p1, p2, :cond_0

    .line 11
    aget-byte p2, p0, p1

    .line 12
    add-int/lit8 v0, p1, 0x1

    aget-byte v1, p0, v0

    .line 13
    aput-byte v1, p0, p1

    .line 14
    aput-byte p2, p0, v0

    .line 15
    add-int/lit8 p1, p1, 0x2

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    return-void
.end method
