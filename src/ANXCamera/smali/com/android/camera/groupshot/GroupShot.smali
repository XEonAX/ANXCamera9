.class public Lcom/android/camera/groupshot/GroupShot;
.super Ljava/lang/Object;
.source "GroupShot.java"


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private mHeight:I

.field private mMaxImageNum:I

.field private mNative:J

.field private mStart:Z

.field private mWidth:I


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 12
    const-class v0, Lcom/android/camera/groupshot/GroupShot;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/groupshot/GroupShot;->TAG:Ljava/lang/String;

    .line 16
    :try_start_0
    const-string v0, "morpho_groupshot"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_0 .. :try_end_0} :catch_0

    .line 19
    goto :goto_0

    .line 17
    :catch_0
    move-exception v0

    .line 18
    sget-object v1, Lcom/android/camera/groupshot/GroupShot;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "can\'t loadLibrary, "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/UnsatisfiedLinkError;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 20
    :goto_0
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    return-void
.end method

.method private final native addTargetRect(J[I)I
.end method

.method private final native attach(J[B)I
.end method

.method private final native attachYuv(JLjava/nio/ByteBuffer;Ljava/nio/ByteBuffer;II)I
.end method

.method private final native changeMaxNum(JII)I
.end method

.method private final native clearImages(J)I
.end method

.method private final native createNativeObject()J
.end method

.method private final native deleteNativeObject(J)V
.end method

.method private final native end(J)I
.end method

.method private final native getImage(J[B)I
.end method

.method private final native getImageAndSaveJpeg(JLjava/lang/String;)I
.end method

.method private final native getImageNum(J)I
.end method

.method private final native getJpegData(JI[B)I
.end method

.method private final native getJpegSize(JI)I
.end method

.method private final native getPreviewImage(JIII[B)I
.end method

.method private final native getRawData(JI[B)I
.end method

.method private final native getRecommendedImageIndex(J[II)I
.end method

.method private final native getRecommendedRect(JII[I)I
.end method

.method private final native getScaledImageAndSaveJpeg(JIILjava/lang/String;)I
.end method

.method private final native getScaledOutputImage(JII[B)I
.end method

.method private final native getTargetImage(JIIII[B)I
.end method

.method private final native getTargetNum(J)I
.end method

.method private final native getTargetRects(J[I)I
.end method

.method private final native getYuvImage(JLjava/nio/ByteBuffer;Ljava/nio/ByteBuffer;II)I
.end method

.method private final native initializeNativeObject(JIIIIIII)I
.end method

.method private final native saveInputImages(JLjava/lang/String;)I
.end method

.method private final native selectTarget(JII)I
.end method

.method private final native setBaseImage(JI)I
.end method

.method private final native setBestFace(J)I
.end method

.method private final native start(JI)I
.end method

.method private final native updateTargetRect(JI[I)I
.end method


# virtual methods
.method public addTargetRect([I)I
    .locals 4

    .line 245
    iget-wide v0, p0, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 246
    const/4 p1, -0x1

    return p1

    .line 248
    :cond_0
    iget-wide v0, p0, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    invoke-direct {p0, v0, v1, p1}, Lcom/android/camera/groupshot/GroupShot;->addTargetRect(J[I)I

    move-result p1

    return p1
.end method

.method public attach(Landroid/media/Image;)I
    .locals 13

    .line 145
    sget-object v0, Lcom/android/camera/groupshot/GroupShot;->TAG:Ljava/lang/String;

    const-string v1, "GroupShot attach mNative=%x"

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Object;

    iget-wide v4, p0, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    const/4 v5, 0x0

    aput-object v4, v3, v5

    invoke-static {v1, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 146
    iget-wide v0, p0, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    const-wide/16 v3, 0x0

    cmp-long v0, v0, v3

    const/4 v1, -0x1

    if-nez v0, :cond_0

    .line 147
    return v1

    .line 150
    :cond_0
    const/16 v0, 0x23

    invoke-virtual {p1}, Landroid/media/Image;->getFormat()I

    move-result v3

    if-ne v0, v3, :cond_1

    .line 151
    invoke-virtual {p1}, Landroid/media/Image;->getPlanes()[Landroid/media/Image$Plane;

    move-result-object v0

    .line 152
    sget-object v1, Lcom/android/camera/groupshot/GroupShot;->TAG:Ljava/lang/String;

    sget-object v3, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v4, "attach: size=%dx%d stride=%dx%d"

    const/4 v6, 0x4

    new-array v6, v6, [Ljava/lang/Object;

    .line 153
    invoke-virtual {p1}, Landroid/media/Image;->getWidth()I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v5

    invoke-virtual {p1}, Landroid/media/Image;->getHeight()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v6, v2

    const/4 p1, 0x2

    aget-object v7, v0, v5

    .line 154
    invoke-virtual {v7}, Landroid/media/Image$Plane;->getRowStride()I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, p1

    const/4 p1, 0x3

    aget-object v7, v0, v2

    invoke-virtual {v7}, Landroid/media/Image$Plane;->getRowStride()I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, p1

    .line 152
    invoke-static {v3, v4, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 155
    iget-wide v7, p0, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    aget-object p1, v0, v5

    invoke-virtual {p1}, Landroid/media/Image$Plane;->getBuffer()Ljava/nio/ByteBuffer;

    move-result-object v9

    aget-object p1, v0, v2

    invoke-virtual {p1}, Landroid/media/Image$Plane;->getBuffer()Ljava/nio/ByteBuffer;

    move-result-object v10

    aget-object p1, v0, v5

    .line 156
    invoke-virtual {p1}, Landroid/media/Image$Plane;->getRowStride()I

    move-result v11

    aget-object p1, v0, v2

    invoke-virtual {p1}, Landroid/media/Image$Plane;->getRowStride()I

    move-result v12

    .line 155
    move-object v6, p0

    invoke-direct/range {v6 .. v12}, Lcom/android/camera/groupshot/GroupShot;->attachYuv(JLjava/nio/ByteBuffer;Ljava/nio/ByteBuffer;II)I

    move-result p1

    return p1

    .line 158
    :cond_1
    sget-object v0, Lcom/android/camera/groupshot/GroupShot;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "unexpected image format "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Landroid/media/Image;->getFormat()I

    move-result p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 159
    return v1
.end method

.method public attach([B)I
    .locals 5

    .line 137
    sget-object v0, Lcom/android/camera/groupshot/GroupShot;->TAG:Ljava/lang/String;

    const-string v1, "GroupShot attach mNative=%x"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    iget-wide v3, p0, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 138
    iget-wide v0, p0, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 139
    const/4 p1, -0x1

    return p1

    .line 141
    :cond_0
    iget-wide v0, p0, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    invoke-direct {p0, v0, v1, p1}, Lcom/android/camera/groupshot/GroupShot;->attach(J[B)I

    move-result p1

    return p1
.end method

.method public attach_end()I
    .locals 5

    .line 164
    sget-object v0, Lcom/android/camera/groupshot/GroupShot;->TAG:Ljava/lang/String;

    const-string v1, "GroupShot attach end, mNative=%x"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    iget-wide v3, p0, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 165
    iget-wide v0, p0, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 166
    const/4 v0, -0x1

    return v0

    .line 168
    :cond_0
    iget-wide v0, p0, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    invoke-direct {p0, v0, v1}, Lcom/android/camera/groupshot/GroupShot;->end(J)I

    move-result v0

    return v0
.end method

.method public attach_start(I)I
    .locals 6

    .line 128
    sget-object v0, Lcom/android/camera/groupshot/GroupShot;->TAG:Ljava/lang/String;

    const-string v1, "GroupShot attach start mNative=%x"

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Object;

    iget-wide v4, p0, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    const/4 v5, 0x0

    aput-object v4, v3, v5

    invoke-static {v1, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 129
    iget-wide v0, p0, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    const-wide/16 v3, 0x0

    cmp-long v0, v0, v3

    if-nez v0, :cond_0

    .line 130
    const/4 p1, -0x1

    return p1

    .line 132
    :cond_0
    iput-boolean v2, p0, Lcom/android/camera/groupshot/GroupShot;->mStart:Z

    .line 133
    iget-wide v0, p0, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    invoke-direct {p0, v0, v1, p1}, Lcom/android/camera/groupshot/GroupShot;->start(JI)I

    move-result p1

    return p1
.end method

.method public changeMaxNum(II)I
    .locals 4

    .line 121
    iget-wide v0, p0, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 122
    const/4 p1, -0x1

    return p1

    .line 124
    :cond_0
    iget-wide v0, p0, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    invoke-direct {p0, v0, v1, p1, p2}, Lcom/android/camera/groupshot/GroupShot;->changeMaxNum(JII)I

    move-result p1

    return p1
.end method

.method public clearImages()I
    .locals 5

    .line 113
    sget-object v0, Lcom/android/camera/groupshot/GroupShot;->TAG:Ljava/lang/String;

    const-string v1, "clearImages mNative=%x"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    iget-wide v3, p0, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 114
    iget-wide v0, p0, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 115
    const/4 v0, -0x1

    return v0

    .line 117
    :cond_0
    iget-wide v0, p0, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    invoke-direct {p0, v0, v1}, Lcom/android/camera/groupshot/GroupShot;->clearImages(J)I

    move-result v0

    return v0
.end method

.method public finish()V
    .locals 7

    .line 100
    iget-wide v0, p0, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 101
    return-void

    .line 103
    :cond_0
    sget-object v0, Lcom/android/camera/groupshot/GroupShot;->TAG:Ljava/lang/String;

    const-string v1, "finish mNative=%x"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    iget-wide v5, p0, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    const/4 v6, 0x0

    aput-object v5, v4, v6

    invoke-static {v1, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 104
    iget-wide v0, p0, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    invoke-direct {p0, v0, v1}, Lcom/android/camera/groupshot/GroupShot;->deleteNativeObject(J)V

    .line 105
    iput v6, p0, Lcom/android/camera/groupshot/GroupShot;->mWidth:I

    .line 106
    iput v6, p0, Lcom/android/camera/groupshot/GroupShot;->mHeight:I

    .line 107
    iput v6, p0, Lcom/android/camera/groupshot/GroupShot;->mMaxImageNum:I

    .line 108
    iput-boolean v6, p0, Lcom/android/camera/groupshot/GroupShot;->mStart:Z

    .line 109
    iput-wide v2, p0, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    .line 110
    return-void
.end method

.method public getImageAndSaveJpeg(Ljava/lang/String;)I
    .locals 6

    .line 266
    iget-wide v0, p0, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 267
    const/4 p1, -0x1

    return p1

    .line 269
    :cond_0
    sget-object v0, Lcom/android/camera/groupshot/GroupShot;->TAG:Ljava/lang/String;

    const-string v1, "getImageAndSaveJpeg: mNative=%x filename=%s"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-wide v4, p0, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x1

    aput-object p1, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 270
    iget-wide v0, p0, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    invoke-direct {p0, v0, v1, p1}, Lcom/android/camera/groupshot/GroupShot;->getImageAndSaveJpeg(JLjava/lang/String;)I

    move-result p1

    return p1
.end method

.method public getImageData(I[B)I
    .locals 4

    .line 180
    iget-wide v0, p0, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 181
    const/4 p1, -0x1

    return p1

    .line 183
    :cond_0
    iget-wide v0, p0, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    invoke-direct {p0, v0, v1, p1, p2}, Lcom/android/camera/groupshot/GroupShot;->getRawData(JI[B)I

    move-result p1

    return p1
.end method

.method public getJpegData(I[B)I
    .locals 4

    .line 188
    iget-wide v0, p0, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 189
    const/4 p1, -0x1

    return p1

    .line 191
    :cond_0
    iget-wide v0, p0, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    invoke-direct {p0, v0, v1, p1, p2}, Lcom/android/camera/groupshot/GroupShot;->getJpegData(JI[B)I

    move-result p1

    return p1
.end method

.method public getJpegSize(I)I
    .locals 4

    .line 196
    iget-wide v0, p0, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 197
    const/4 p1, -0x1

    return p1

    .line 199
    :cond_0
    iget-wide v0, p0, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    invoke-direct {p0, v0, v1, p1}, Lcom/android/camera/groupshot/GroupShot;->getJpegSize(JI)I

    move-result p1

    return p1
.end method

.method public getPreviewImage(III[B)I
    .locals 7

    .line 217
    iget-wide v0, p0, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 218
    const/4 p1, -0x1

    return p1

    .line 220
    :cond_0
    iget-wide v1, p0, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    move-object v0, p0

    move v3, p1

    move v4, p2

    move v5, p3

    move-object v6, p4

    invoke-direct/range {v0 .. v6}, Lcom/android/camera/groupshot/GroupShot;->getPreviewImage(JIII[B)I

    move-result p1

    return p1
.end method

.method public getRecommendedImageIndex([II)I
    .locals 4

    .line 302
    iget-wide v0, p0, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 303
    const/4 p1, -0x1

    return p1

    .line 305
    :cond_0
    iget-wide v0, p0, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    invoke-direct {p0, v0, v1, p1, p2}, Lcom/android/camera/groupshot/GroupShot;->getRecommendedImageIndex(J[II)I

    move-result p1

    return p1
.end method

.method public getRecommendedRect(II[I)I
    .locals 6

    .line 238
    iget-wide v0, p0, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 239
    const/4 p1, -0x1

    return p1

    .line 241
    :cond_0
    iget-wide v1, p0, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    move-object v0, p0

    move v3, p1

    move v4, p2

    move-object v5, p3

    invoke-direct/range {v0 .. v5}, Lcom/android/camera/groupshot/GroupShot;->getRecommendedRect(JII[I)I

    move-result p1

    return p1
.end method

.method public getScaledImageAndSaveJpeg(IILjava/lang/String;)I
    .locals 8

    .line 287
    iget-wide v0, p0, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 288
    const/4 p1, -0x1

    return p1

    .line 290
    :cond_0
    sget-object v0, Lcom/android/camera/groupshot/GroupShot;->TAG:Ljava/lang/String;

    const-string v1, "GroupShot getScaledImageAndSaveJpeg, mNative=%x filename=%s"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-wide v4, p0, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x1

    aput-object p3, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 291
    iget-wide v3, p0, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    move-object v2, p0

    move v5, p1

    move v6, p2

    move-object v7, p3

    invoke-direct/range {v2 .. v7}, Lcom/android/camera/groupshot/GroupShot;->getScaledImageAndSaveJpeg(JIILjava/lang/String;)I

    move-result p1

    return p1
.end method

.method public getScaledOutputImage(II[B)I
    .locals 6

    .line 224
    iget-wide v0, p0, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 225
    const/4 p1, -0x1

    return p1

    .line 227
    :cond_0
    iget-wide v1, p0, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    move-object v0, p0

    move v3, p1

    move v4, p2

    move-object v5, p3

    invoke-direct/range {v0 .. v5}, Lcom/android/camera/groupshot/GroupShot;->getScaledOutputImage(JII[B)I

    move-result p1

    return p1
.end method

.method public getTargetImage(IIII[B)I
    .locals 8

    .line 231
    iget-wide v0, p0, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 232
    const/4 p1, -0x1

    return p1

    .line 234
    :cond_0
    iget-wide v1, p0, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    move-object v0, p0

    move v3, p1

    move v4, p2

    move v5, p3

    move v6, p4

    move-object v7, p5

    invoke-direct/range {v0 .. v7}, Lcom/android/camera/groupshot/GroupShot;->getTargetImage(JIIII[B)I

    move-result p1

    return p1
.end method

.method public getTargetNum()I
    .locals 4

    .line 203
    iget-wide v0, p0, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 204
    const/4 v0, -0x1

    return v0

    .line 206
    :cond_0
    iget-wide v0, p0, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    invoke-direct {p0, v0, v1}, Lcom/android/camera/groupshot/GroupShot;->getTargetNum(J)I

    move-result v0

    return v0
.end method

.method public getTargetRects([I)I
    .locals 4

    .line 210
    iget-wide v0, p0, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 211
    const/4 p1, -0x1

    return p1

    .line 213
    :cond_0
    iget-wide v0, p0, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    invoke-direct {p0, v0, v1, p1}, Lcom/android/camera/groupshot/GroupShot;->getTargetRects(J[I)I

    move-result p1

    return p1
.end method

.method public final native getVersion()Ljava/lang/String;
.end method

.method public getYuvImage(Landroid/media/Image;)I
    .locals 7

    .line 274
    if-eqz p1, :cond_1

    const/16 v0, 0x23

    invoke-virtual {p1}, Landroid/media/Image;->getFormat()I

    move-result v1

    if-eq v0, v1, :cond_0

    goto :goto_0

    .line 279
    :cond_0
    invoke-virtual {p1}, Landroid/media/Image;->getPlanes()[Landroid/media/Image$Plane;

    move-result-object p1

    .line 280
    iget-wide v1, p0, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    const/4 v0, 0x0

    aget-object v3, p1, v0

    invoke-virtual {v3}, Landroid/media/Image$Plane;->getBuffer()Ljava/nio/ByteBuffer;

    move-result-object v3

    const/4 v4, 0x1

    aget-object v5, p1, v4

    invoke-virtual {v5}, Landroid/media/Image$Plane;->getBuffer()Ljava/nio/ByteBuffer;

    move-result-object v5

    aget-object v0, p1, v0

    .line 281
    invoke-virtual {v0}, Landroid/media/Image$Plane;->getRowStride()I

    move-result v6

    aget-object p1, p1, v4

    invoke-virtual {p1}, Landroid/media/Image$Plane;->getRowStride()I

    move-result p1

    .line 280
    move-object v0, p0

    move-object v4, v5

    move v5, v6

    move v6, p1

    invoke-direct/range {v0 .. v6}, Lcom/android/camera/groupshot/GroupShot;->getYuvImage(JLjava/nio/ByteBuffer;Ljava/nio/ByteBuffer;II)I

    move-result p1

    .line 282
    sget-object v0, Lcom/android/camera/groupshot/GroupShot;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "getYuvImage: result="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 283
    return p1

    .line 275
    :cond_1
    :goto_0
    sget-object v0, Lcom/android/camera/groupshot/GroupShot;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "getYuvImage: invalid image "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 276
    const/4 p1, -0x1

    return p1
.end method

.method public initialize(IIIIII)I
    .locals 15

    move-object v10, p0

    move/from16 v11, p1

    move/from16 v12, p3

    move/from16 v13, p4

    .line 71
    iget-boolean v0, v10, Lcom/android/camera/groupshot/GroupShot;->mStart:Z

    const/4 v14, 0x0

    if-nez v0, :cond_0

    iget v0, v10, Lcom/android/camera/groupshot/GroupShot;->mWidth:I

    if-ne v0, v12, :cond_0

    iget v0, v10, Lcom/android/camera/groupshot/GroupShot;->mHeight:I

    if-ne v0, v13, :cond_0

    iget v0, v10, Lcom/android/camera/groupshot/GroupShot;->mMaxImageNum:I

    if-ne v0, v11, :cond_0

    .line 72
    return v14

    .line 74
    :cond_0
    iget-boolean v0, v10, Lcom/android/camera/groupshot/GroupShot;->mStart:Z

    if-eqz v0, :cond_2

    iget v0, v10, Lcom/android/camera/groupshot/GroupShot;->mWidth:I

    if-nez v0, :cond_1

    iget v0, v10, Lcom/android/camera/groupshot/GroupShot;->mHeight:I

    if-nez v0, :cond_1

    iget v0, v10, Lcom/android/camera/groupshot/GroupShot;->mMaxImageNum:I

    if-eqz v0, :cond_2

    .line 75
    :cond_1
    invoke-virtual {v10}, Lcom/android/camera/groupshot/GroupShot;->clearImages()I

    .line 76
    invoke-virtual {v10}, Lcom/android/camera/groupshot/GroupShot;->finish()V

    .line 78
    :cond_2
    iget-wide v0, v10, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_3

    .line 79
    invoke-direct {v10}, Lcom/android/camera/groupshot/GroupShot;->createNativeObject()J

    move-result-wide v0

    iput-wide v0, v10, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    .line 80
    iget-wide v0, v10, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    cmp-long v0, v0, v2

    if-nez v0, :cond_3

    .line 81
    const/4 v0, -0x1

    return v0

    .line 84
    :cond_3
    sget-object v0, Lcom/android/camera/groupshot/GroupShot;->TAG:Ljava/lang/String;

    sget-object v1, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v2, "initialize imageNum=%d, width=%d, height=%d, mStart=%b, mWidth=%d, mHeight=%d, mMaxImageNum=%d"

    const/4 v3, 0x7

    new-array v3, v3, [Ljava/lang/Object;

    .line 86
    invoke-static/range {p1 .. p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v14

    const/4 v4, 0x1

    invoke-static/range {p3 .. p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x2

    invoke-static/range {p4 .. p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x3

    iget-boolean v5, v10, Lcom/android/camera/groupshot/GroupShot;->mStart:Z

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x4

    iget v5, v10, Lcom/android/camera/groupshot/GroupShot;->mWidth:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x5

    iget v5, v10, Lcom/android/camera/groupshot/GroupShot;->mHeight:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x6

    iget v5, v10, Lcom/android/camera/groupshot/GroupShot;->mMaxImageNum:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    .line 84
    invoke-static {v1, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 87
    iget-wide v1, v10, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    const/4 v9, 0x0

    move-object v0, v10

    move v3, v11

    move/from16 v4, p2

    move v5, v12

    move v6, v13

    move/from16 v7, p5

    move/from16 v8, p6

    invoke-direct/range {v0 .. v9}, Lcom/android/camera/groupshot/GroupShot;->initializeNativeObject(JIIIIIII)I

    .line 88
    iput v11, v10, Lcom/android/camera/groupshot/GroupShot;->mMaxImageNum:I

    .line 89
    iput v12, v10, Lcom/android/camera/groupshot/GroupShot;->mWidth:I

    .line 90
    iput v13, v10, Lcom/android/camera/groupshot/GroupShot;->mHeight:I

    .line 91
    iput-boolean v14, v10, Lcom/android/camera/groupshot/GroupShot;->mStart:Z

    .line 92
    return v14
.end method

.method public isUsed()Z
    .locals 1

    .line 96
    iget-boolean v0, p0, Lcom/android/camera/groupshot/GroupShot;->mStart:Z

    return v0
.end method

.method public saveInputImages(Ljava/lang/String;)I
    .locals 4

    .line 295
    iget-wide v0, p0, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 296
    const/4 p1, -0x1

    return p1

    .line 298
    :cond_0
    iget-wide v0, p0, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    invoke-direct {p0, v0, v1, p1}, Lcom/android/camera/groupshot/GroupShot;->saveInputImages(JLjava/lang/String;)I

    move-result p1

    return p1
.end method

.method public selectImage(II)I
    .locals 4

    .line 259
    iget-wide v0, p0, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 260
    const/4 p1, -0x1

    return p1

    .line 262
    :cond_0
    iget-wide v0, p0, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    invoke-direct {p0, v0, v1, p1, p2}, Lcom/android/camera/groupshot/GroupShot;->selectTarget(JII)I

    move-result p1

    return p1
.end method

.method public setBaseImage(I)I
    .locals 4

    .line 172
    iget-wide v0, p0, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 173
    const/4 p1, -0x1

    return p1

    .line 175
    :cond_0
    iget-wide v0, p0, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    invoke-direct {p0, v0, v1, p1}, Lcom/android/camera/groupshot/GroupShot;->setBaseImage(JI)I

    move-result p1

    return p1
.end method

.method public setBestFace()I
    .locals 4

    .line 309
    iget-wide v0, p0, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 310
    const/4 v0, -0x1

    return v0

    .line 312
    :cond_0
    iget-wide v0, p0, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    invoke-direct {p0, v0, v1}, Lcom/android/camera/groupshot/GroupShot;->setBestFace(J)I

    move-result v0

    return v0
.end method

.method public updateTargetRect(I[I)I
    .locals 4

    .line 252
    iget-wide v0, p0, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 253
    const/4 p1, -0x1

    return p1

    .line 255
    :cond_0
    iget-wide v0, p0, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    invoke-direct {p0, v0, v1, p1, p2}, Lcom/android/camera/groupshot/GroupShot;->updateTargetRect(JI[I)I

    move-result p1

    return p1
.end method
