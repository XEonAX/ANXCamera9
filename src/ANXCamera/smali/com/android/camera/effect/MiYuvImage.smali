.class public Lcom/android/camera/effect/MiYuvImage;
.super Ljava/lang/Object;
.source "MiYuvImage.java"


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field public mData:[B

.field public mFormat:I

.field public mHeight:I

.field public mWidth:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 9
    const-class v0, Lcom/android/camera/effect/MiYuvImage;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/effect/MiYuvImage;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>([BIII)V
    .locals 0

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    iput-object p1, p0, Lcom/android/camera/effect/MiYuvImage;->mData:[B

    .line 17
    iput p2, p0, Lcom/android/camera/effect/MiYuvImage;->mWidth:I

    .line 18
    iput p3, p0, Lcom/android/camera/effect/MiYuvImage;->mHeight:I

    .line 19
    iput p4, p0, Lcom/android/camera/effect/MiYuvImage;->mFormat:I

    .line 20
    return-void
.end method


# virtual methods
.method public getUVBuffer()Ljava/nio/ByteBuffer;
    .locals 6

    .line 47
    iget-object v0, p0, Lcom/android/camera/effect/MiYuvImage;->mData:[B

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 48
    sget-object v0, Lcom/android/camera/effect/MiYuvImage;->TAG:Ljava/lang/String;

    const-string v2, "data is null when getUVBuffer"

    invoke-static {v0, v2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 49
    return-object v1

    .line 51
    :cond_0
    iget v0, p0, Lcom/android/camera/effect/MiYuvImage;->mFormat:I

    const/16 v2, 0x23

    if-ne v0, v2, :cond_1

    .line 52
    iget v0, p0, Lcom/android/camera/effect/MiYuvImage;->mWidth:I

    iget v1, p0, Lcom/android/camera/effect/MiYuvImage;->mHeight:I

    mul-int/2addr v0, v1

    div-int/lit8 v0, v0, 0x2

    new-array v0, v0, [B

    .line 53
    iget-object v1, p0, Lcom/android/camera/effect/MiYuvImage;->mData:[B

    iget v2, p0, Lcom/android/camera/effect/MiYuvImage;->mWidth:I

    iget v3, p0, Lcom/android/camera/effect/MiYuvImage;->mHeight:I

    mul-int/2addr v2, v3

    const/4 v3, 0x0

    iget v4, p0, Lcom/android/camera/effect/MiYuvImage;->mWidth:I

    iget v5, p0, Lcom/android/camera/effect/MiYuvImage;->mHeight:I

    mul-int/2addr v4, v5

    div-int/lit8 v4, v4, 0x2

    invoke-static {v1, v2, v0, v3, v4}, Ljava/lang/System;->arraycopy([BI[BII)V

    .line 54
    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 55
    return-object v0

    .line 57
    :cond_1
    sget-object v0, Lcom/android/camera/effect/MiYuvImage;->TAG:Ljava/lang/String;

    const-string v2, "Not supprot this format"

    invoke-static {v0, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 58
    return-object v1
.end method

.method public getVUBuffer()Ljava/nio/ByteBuffer;
    .locals 6

    .line 62
    iget-object v0, p0, Lcom/android/camera/effect/MiYuvImage;->mData:[B

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 63
    sget-object v0, Lcom/android/camera/effect/MiYuvImage;->TAG:Ljava/lang/String;

    const-string v2, "data is null when getUVBuffer"

    invoke-static {v0, v2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 64
    return-object v1

    .line 66
    :cond_0
    iget v0, p0, Lcom/android/camera/effect/MiYuvImage;->mFormat:I

    const/16 v2, 0x23

    if-ne v0, v2, :cond_1

    .line 67
    iget v0, p0, Lcom/android/camera/effect/MiYuvImage;->mWidth:I

    iget v1, p0, Lcom/android/camera/effect/MiYuvImage;->mHeight:I

    mul-int/2addr v0, v1

    div-int/lit8 v0, v0, 0x2

    new-array v0, v0, [B

    .line 68
    iget-object v1, p0, Lcom/android/camera/effect/MiYuvImage;->mData:[B

    iget v2, p0, Lcom/android/camera/effect/MiYuvImage;->mWidth:I

    iget v3, p0, Lcom/android/camera/effect/MiYuvImage;->mHeight:I

    mul-int/2addr v2, v3

    add-int/lit8 v2, v2, 0x1

    const/4 v3, 0x0

    iget v4, p0, Lcom/android/camera/effect/MiYuvImage;->mWidth:I

    iget v5, p0, Lcom/android/camera/effect/MiYuvImage;->mHeight:I

    mul-int/2addr v4, v5

    div-int/lit8 v4, v4, 0x2

    add-int/lit8 v4, v4, -0x1

    invoke-static {v1, v2, v0, v3, v4}, Ljava/lang/System;->arraycopy([BI[BII)V

    .line 69
    array-length v1, v0

    add-int/lit8 v1, v1, -0x1

    array-length v2, v0

    add-int/lit8 v2, v2, -0x3

    aget-byte v2, v0, v2

    aput-byte v2, v0, v1

    .line 70
    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 71
    return-object v0

    .line 73
    :cond_1
    sget-object v0, Lcom/android/camera/effect/MiYuvImage;->TAG:Ljava/lang/String;

    const-string v2, "Not supprot this format"

    invoke-static {v0, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 74
    return-object v1
.end method

.method public getYBuffer()Ljava/nio/ByteBuffer;
    .locals 4

    .line 32
    iget-object v0, p0, Lcom/android/camera/effect/MiYuvImage;->mData:[B

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 33
    sget-object v0, Lcom/android/camera/effect/MiYuvImage;->TAG:Ljava/lang/String;

    const-string v2, "data is null when getYBuffer"

    invoke-static {v0, v2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 34
    return-object v1

    .line 36
    :cond_0
    iget v0, p0, Lcom/android/camera/effect/MiYuvImage;->mFormat:I

    const/16 v2, 0x23

    if-ne v0, v2, :cond_1

    .line 37
    iget v0, p0, Lcom/android/camera/effect/MiYuvImage;->mWidth:I

    iget v1, p0, Lcom/android/camera/effect/MiYuvImage;->mHeight:I

    mul-int/2addr v0, v1

    new-array v0, v0, [B

    .line 38
    iget-object v1, p0, Lcom/android/camera/effect/MiYuvImage;->mData:[B

    iget v2, p0, Lcom/android/camera/effect/MiYuvImage;->mWidth:I

    iget v3, p0, Lcom/android/camera/effect/MiYuvImage;->mHeight:I

    mul-int/2addr v2, v3

    const/4 v3, 0x0

    invoke-static {v1, v3, v0, v3, v2}, Ljava/lang/System;->arraycopy([BI[BII)V

    .line 39
    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 40
    return-object v0

    .line 42
    :cond_1
    sget-object v0, Lcom/android/camera/effect/MiYuvImage;->TAG:Ljava/lang/String;

    const-string v2, "Not supprot this format"

    invoke-static {v0, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 43
    return-object v1
.end method

.method public getYuvBuffer()Ljava/nio/ByteBuffer;
    .locals 2

    .line 23
    iget-object v0, p0, Lcom/android/camera/effect/MiYuvImage;->mData:[B

    if-nez v0, :cond_0

    .line 24
    sget-object v0, Lcom/android/camera/effect/MiYuvImage;->TAG:Ljava/lang/String;

    const-string v1, "data is null when getYuvBuffer"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 25
    const/4 v0, 0x0

    return-object v0

    .line 27
    :cond_0
    iget-object v0, p0, Lcom/android/camera/effect/MiYuvImage;->mData:[B

    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 28
    return-object v0
.end method
