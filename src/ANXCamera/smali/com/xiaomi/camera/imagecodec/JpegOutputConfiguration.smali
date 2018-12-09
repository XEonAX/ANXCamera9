.class public Lcom/xiaomi/camera/imagecodec/JpegOutputConfiguration;
.super Ljava/lang/Object;
.source "JpegOutputConfiguration.java"


# instance fields
.field mHeight:I

.field mWidth:I


# direct methods
.method public constructor <init>(II)V
    .locals 0

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    iput p1, p0, Lcom/xiaomi/camera/imagecodec/JpegOutputConfiguration;->mWidth:I

    .line 17
    iput p2, p0, Lcom/xiaomi/camera/imagecodec/JpegOutputConfiguration;->mHeight:I

    .line 18
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    .line 30
    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    .line 31
    return v0

    .line 33
    :cond_0
    instance-of v1, p1, Lcom/xiaomi/camera/imagecodec/JpegOutputConfiguration;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    .line 34
    return v2

    .line 36
    :cond_1
    check-cast p1, Lcom/xiaomi/camera/imagecodec/JpegOutputConfiguration;

    .line 37
    iget v1, p0, Lcom/xiaomi/camera/imagecodec/JpegOutputConfiguration;->mWidth:I

    iget v3, p1, Lcom/xiaomi/camera/imagecodec/JpegOutputConfiguration;->mWidth:I

    if-ne v1, v3, :cond_2

    iget v1, p0, Lcom/xiaomi/camera/imagecodec/JpegOutputConfiguration;->mHeight:I

    iget p1, p1, Lcom/xiaomi/camera/imagecodec/JpegOutputConfiguration;->mHeight:I

    if-ne v1, p1, :cond_2

    goto :goto_0

    :cond_2
    move v0, v2

    :goto_0
    return v0
.end method

.method public getHeight()I
    .locals 1

    .line 25
    iget v0, p0, Lcom/xiaomi/camera/imagecodec/JpegOutputConfiguration;->mHeight:I

    return v0
.end method

.method public getWidth()I
    .locals 1

    .line 21
    iget v0, p0, Lcom/xiaomi/camera/imagecodec/JpegOutputConfiguration;->mWidth:I

    return v0
.end method
