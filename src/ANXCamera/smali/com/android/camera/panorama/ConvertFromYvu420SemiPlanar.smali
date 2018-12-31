.class public Lcom/android/camera/panorama/ConvertFromYvu420SemiPlanar;
.super Ljava/lang/Object;
.source "ConvertFromYvu420SemiPlanar.java"

# interfaces
.implements Lcom/android/camera/panorama/IImage2BytesConverter;


# static fields
.field private static final PIXEL_STRIDE:I = 0x2


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public image2bytes(Landroid/media/Image;)[B
    .locals 13

    .line 12
    invoke-virtual {p1}, Landroid/media/Image;->getWidth()I

    move-result v0

    .line 13
    invoke-virtual {p1}, Landroid/media/Image;->getHeight()I

    move-result v1

    .line 15
    invoke-virtual {p1}, Landroid/media/Image;->getPlanes()[Landroid/media/Image$Plane;

    move-result-object v2

    const/4 v3, 0x0

    aget-object v2, v2, v3

    invoke-virtual {v2}, Landroid/media/Image$Plane;->getBuffer()Ljava/nio/ByteBuffer;

    move-result-object v2

    .line 16
    invoke-virtual {p1}, Landroid/media/Image;->getPlanes()[Landroid/media/Image$Plane;

    move-result-object v4

    const/4 v5, 0x1

    aget-object v4, v4, v5

    invoke-virtual {v4}, Landroid/media/Image$Plane;->getBuffer()Ljava/nio/ByteBuffer;

    move-result-object v4

    .line 17
    invoke-virtual {p1}, Landroid/media/Image;->getPlanes()[Landroid/media/Image$Plane;

    move-result-object v6

    const/4 v7, 0x2

    aget-object v6, v6, v7

    invoke-virtual {v6}, Landroid/media/Image$Plane;->getBuffer()Ljava/nio/ByteBuffer;

    move-result-object v6

    .line 18
    invoke-virtual {p1}, Landroid/media/Image;->getPlanes()[Landroid/media/Image$Plane;

    move-result-object v8

    aget-object v8, v8, v3

    invoke-virtual {v8}, Landroid/media/Image$Plane;->getRowStride()I

    move-result v8

    .line 19
    invoke-virtual {p1}, Landroid/media/Image;->getPlanes()[Landroid/media/Image$Plane;

    move-result-object p1

    aget-object p1, p1, v7

    invoke-virtual {p1}, Landroid/media/Image$Plane;->getRowStride()I

    move-result p1

    .line 21
    mul-int v9, v0, v1

    mul-int/lit8 v10, v9, 0x3

    div-int/2addr v10, v7

    new-array v10, v10, [B

    .line 23
    if-ge v0, v8, :cond_0

    .line 24
    move v11, v3

    :goto_0
    if-ge v11, v1, :cond_1

    .line 25
    mul-int v12, v11, v8

    invoke-virtual {v2, v12}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 26
    mul-int v12, v11, v0

    invoke-virtual {v2, v10, v12, v0}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 24
    add-int/lit8 v11, v11, 0x1

    goto :goto_0

    .line 29
    :cond_0
    invoke-virtual {v2, v10, v3, v9}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 33
    :cond_1
    nop

    .line 34
    if-ge v0, p1, :cond_3

    .line 36
    :goto_1
    div-int/lit8 v8, v1, 0x2

    sub-int/2addr v8, v5

    if-ge v3, v8, :cond_2

    .line 37
    mul-int v8, v3, p1

    invoke-virtual {v6, v8}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 38
    invoke-virtual {v6, v10, v9, v0}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 39
    add-int/2addr v9, v0

    .line 36
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 42
    :cond_2
    sub-int/2addr v0, v5

    invoke-virtual {v6, v10, v9, v0}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 43
    add-int/2addr v9, v0

    .line 44
    goto :goto_2

    .line 45
    :cond_3
    invoke-virtual {v6}, Ljava/nio/ByteBuffer;->remaining()I

    move-result p1

    .line 46
    invoke-virtual {v6, v10, v9, p1}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 47
    add-int/2addr v9, p1

    .line 49
    :goto_2
    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->remaining()I

    move-result p1

    sub-int/2addr p1, v5

    invoke-virtual {v4, p1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 50
    invoke-virtual {v4, v10, v9, v5}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 52
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 53
    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 54
    invoke-virtual {v6}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 55
    return-object v10
.end method
