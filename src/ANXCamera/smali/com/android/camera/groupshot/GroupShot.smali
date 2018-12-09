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

    .line 8
    const-class v0, Lcom/android/camera/groupshot/GroupShot;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/groupshot/GroupShot;->TAG:Ljava/lang/String;

    .line 12
    :try_start_0
    const-string v0, "morpho_groupshot"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_0 .. :try_end_0} :catch_0

    .line 15
    goto :goto_0

    .line 13
    :catch_0
    move-exception v0

    .line 14
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

    .line 16
    :goto_0
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    return-void
.end method

.method private final native addTargetRect(J[I)I
.end method

.method private final native attach(J[B)I
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

    .line 218
    iget-wide v0, p0, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 219
    const/4 p1, -0x1

    return p1

    .line 221
    :cond_0
    iget-wide v0, p0, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    invoke-direct {p0, v0, v1, p1}, Lcom/android/camera/groupshot/GroupShot;->addTargetRect(J[I)I

    move-result p1

    return p1
.end method

.method public attach([B)I
    .locals 5

    .line 129
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

    .line 130
    iget-wide v0, p0, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 131
    const/4 p1, -0x1

    return p1

    .line 133
    :cond_0
    iget-wide v0, p0, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    invoke-direct {p0, v0, v1, p1}, Lcom/android/camera/groupshot/GroupShot;->attach(J[B)I

    move-result p1

    return p1
.end method

.method public attach_end()I
    .locals 5

    .line 137
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

    .line 138
    iget-wide v0, p0, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 139
    const/4 v0, -0x1

    return v0

    .line 141
    :cond_0
    iget-wide v0, p0, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    invoke-direct {p0, v0, v1}, Lcom/android/camera/groupshot/GroupShot;->end(J)I

    move-result v0

    return v0
.end method

.method public attach_start(I)I
    .locals 6

    .line 120
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

    .line 121
    iget-wide v0, p0, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    const-wide/16 v3, 0x0

    cmp-long v0, v0, v3

    if-nez v0, :cond_0

    .line 122
    const/4 p1, -0x1

    return p1

    .line 124
    :cond_0
    iput-boolean v2, p0, Lcom/android/camera/groupshot/GroupShot;->mStart:Z

    .line 125
    iget-wide v0, p0, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    invoke-direct {p0, v0, v1, p1}, Lcom/android/camera/groupshot/GroupShot;->start(JI)I

    move-result p1

    return p1
.end method

.method public changeMaxNum(II)I
    .locals 4

    .line 113
    iget-wide v0, p0, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 114
    const/4 p1, -0x1

    return p1

    .line 116
    :cond_0
    iget-wide v0, p0, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    invoke-direct {p0, v0, v1, p1, p2}, Lcom/android/camera/groupshot/GroupShot;->changeMaxNum(JII)I

    move-result p1

    return p1
.end method

.method public clearImages()I
    .locals 5

    .line 105
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

    .line 106
    iget-wide v0, p0, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 107
    const/4 v0, -0x1

    return v0

    .line 109
    :cond_0
    iget-wide v0, p0, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    invoke-direct {p0, v0, v1}, Lcom/android/camera/groupshot/GroupShot;->clearImages(J)I

    move-result v0

    return v0
.end method

.method public finish()V
    .locals 7

    .line 92
    iget-wide v0, p0, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 93
    return-void

    .line 95
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

    .line 96
    iget-wide v0, p0, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    invoke-direct {p0, v0, v1}, Lcom/android/camera/groupshot/GroupShot;->deleteNativeObject(J)V

    .line 97
    iput v6, p0, Lcom/android/camera/groupshot/GroupShot;->mWidth:I

    .line 98
    iput v6, p0, Lcom/android/camera/groupshot/GroupShot;->mHeight:I

    .line 99
    iput v6, p0, Lcom/android/camera/groupshot/GroupShot;->mMaxImageNum:I

    .line 100
    iput-boolean v6, p0, Lcom/android/camera/groupshot/GroupShot;->mStart:Z

    .line 101
    iput-wide v2, p0, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    .line 102
    return-void
.end method

.method public getImageAndSaveJpeg(Ljava/lang/String;)I
    .locals 6

    .line 239
    iget-wide v0, p0, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 240
    const/4 p1, -0x1

    return p1

    .line 242
    :cond_0
    sget-object v0, Lcom/android/camera/groupshot/GroupShot;->TAG:Ljava/lang/String;

    const-string v1, "GroupShot getImageAndSaveJpeg, mNative=%x filename=%s"

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

    .line 243
    iget-wide v0, p0, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    invoke-direct {p0, v0, v1, p1}, Lcom/android/camera/groupshot/GroupShot;->getImageAndSaveJpeg(JLjava/lang/String;)I

    move-result p1

    return p1
.end method

.method public getImageData(I[B)I
    .locals 4

    .line 153
    iget-wide v0, p0, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 154
    const/4 p1, -0x1

    return p1

    .line 156
    :cond_0
    iget-wide v0, p0, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    invoke-direct {p0, v0, v1, p1, p2}, Lcom/android/camera/groupshot/GroupShot;->getRawData(JI[B)I

    move-result p1

    return p1
.end method

.method public getJpegData(I[B)I
    .locals 4

    .line 161
    iget-wide v0, p0, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 162
    const/4 p1, -0x1

    return p1

    .line 164
    :cond_0
    iget-wide v0, p0, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    invoke-direct {p0, v0, v1, p1, p2}, Lcom/android/camera/groupshot/GroupShot;->getJpegData(JI[B)I

    move-result p1

    return p1
.end method

.method public getJpegSize(I)I
    .locals 4

    .line 169
    iget-wide v0, p0, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 170
    const/4 p1, -0x1

    return p1

    .line 172
    :cond_0
    iget-wide v0, p0, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    invoke-direct {p0, v0, v1, p1}, Lcom/android/camera/groupshot/GroupShot;->getJpegSize(JI)I

    move-result p1

    return p1
.end method

.method public getPreviewImage(III[B)I
    .locals 7

    .line 190
    iget-wide v0, p0, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 191
    const/4 p1, -0x1

    return p1

    .line 193
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

    .line 262
    iget-wide v0, p0, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 263
    const/4 p1, -0x1

    return p1

    .line 265
    :cond_0
    iget-wide v0, p0, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    invoke-direct {p0, v0, v1, p1, p2}, Lcom/android/camera/groupshot/GroupShot;->getRecommendedImageIndex(J[II)I

    move-result p1

    return p1
.end method

.method public getRecommendedRect(II[I)I
    .locals 6

    .line 211
    iget-wide v0, p0, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 212
    const/4 p1, -0x1

    return p1

    .line 214
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

    .line 247
    iget-wide v0, p0, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 248
    const/4 p1, -0x1

    return p1

    .line 250
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

    .line 251
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

    .line 197
    iget-wide v0, p0, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 198
    const/4 p1, -0x1

    return p1

    .line 200
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

    .line 204
    iget-wide v0, p0, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 205
    const/4 p1, -0x1

    return p1

    .line 207
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

    .line 176
    iget-wide v0, p0, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 177
    const/4 v0, -0x1

    return v0

    .line 179
    :cond_0
    iget-wide v0, p0, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    invoke-direct {p0, v0, v1}, Lcom/android/camera/groupshot/GroupShot;->getTargetNum(J)I

    move-result v0

    return v0
.end method

.method public getTargetRects([I)I
    .locals 4

    .line 183
    iget-wide v0, p0, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 184
    const/4 p1, -0x1

    return p1

    .line 186
    :cond_0
    iget-wide v0, p0, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    invoke-direct {p0, v0, v1, p1}, Lcom/android/camera/groupshot/GroupShot;->getTargetRects(J[I)I

    move-result p1

    return p1
.end method

.method public final native getVersion()Ljava/lang/String;
.end method

.method public initialize(IIIIII)I
    .locals 15

    move-object v10, p0

    move/from16 v11, p1

    move/from16 v12, p3

    move/from16 v13, p4

    .line 64
    iget-boolean v0, v10, Lcom/android/camera/groupshot/GroupShot;->mStart:Z

    const/4 v14, 0x0

    if-nez v0, :cond_0

    iget v0, v10, Lcom/android/camera/groupshot/GroupShot;->mWidth:I

    if-ne v0, v12, :cond_0

    iget v0, v10, Lcom/android/camera/groupshot/GroupShot;->mHeight:I

    if-ne v0, v13, :cond_0

    iget v0, v10, Lcom/android/camera/groupshot/GroupShot;->mMaxImageNum:I

    if-ne v0, v11, :cond_0

    .line 65
    return v14

    .line 66
    :cond_0
    iget-boolean v0, v10, Lcom/android/camera/groupshot/GroupShot;->mStart:Z

    if-eqz v0, :cond_2

    iget v0, v10, Lcom/android/camera/groupshot/GroupShot;->mWidth:I

    if-nez v0, :cond_1

    iget v0, v10, Lcom/android/camera/groupshot/GroupShot;->mHeight:I

    if-nez v0, :cond_1

    iget v0, v10, Lcom/android/camera/groupshot/GroupShot;->mMaxImageNum:I

    if-eqz v0, :cond_2

    .line 67
    :cond_1
    invoke-virtual {v10}, Lcom/android/camera/groupshot/GroupShot;->clearImages()I

    .line 68
    invoke-virtual {v10}, Lcom/android/camera/groupshot/GroupShot;->finish()V

    .line 70
    :cond_2
    iget-wide v0, v10, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_3

    .line 71
    invoke-direct {v10}, Lcom/android/camera/groupshot/GroupShot;->createNativeObject()J

    move-result-wide v0

    iput-wide v0, v10, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    .line 72
    iget-wide v0, v10, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    cmp-long v0, v0, v2

    if-nez v0, :cond_3

    .line 73
    const/4 v0, -0x1

    return v0

    .line 76
    :cond_3
    sget-object v0, Lcom/android/camera/groupshot/GroupShot;->TAG:Ljava/lang/String;

    sget-object v1, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v2, "initialize imageNum=%d, width=%d, height=%d, mStart=%b, mWidth=%d, mHeight=%d, mMaxImageNum=%d"

    const/4 v3, 0x7

    new-array v3, v3, [Ljava/lang/Object;

    .line 78
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

    .line 76
    invoke-static {v1, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 79
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

    .line 80
    iput v11, v10, Lcom/android/camera/groupshot/GroupShot;->mMaxImageNum:I

    .line 81
    iput v12, v10, Lcom/android/camera/groupshot/GroupShot;->mWidth:I

    .line 82
    iput v13, v10, Lcom/android/camera/groupshot/GroupShot;->mHeight:I

    .line 83
    iput-boolean v14, v10, Lcom/android/camera/groupshot/GroupShot;->mStart:Z

    .line 84
    return v14
.end method

.method public isUsed()Z
    .locals 1

    .line 88
    iget-boolean v0, p0, Lcom/android/camera/groupshot/GroupShot;->mStart:Z

    return v0
.end method

.method public saveInputImages(Ljava/lang/String;)I
    .locals 4

    .line 255
    iget-wide v0, p0, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 256
    const/4 p1, -0x1

    return p1

    .line 258
    :cond_0
    iget-wide v0, p0, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    invoke-direct {p0, v0, v1, p1}, Lcom/android/camera/groupshot/GroupShot;->saveInputImages(JLjava/lang/String;)I

    move-result p1

    return p1
.end method

.method public selectImage(II)I
    .locals 4

    .line 232
    iget-wide v0, p0, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 233
    const/4 p1, -0x1

    return p1

    .line 235
    :cond_0
    iget-wide v0, p0, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    invoke-direct {p0, v0, v1, p1, p2}, Lcom/android/camera/groupshot/GroupShot;->selectTarget(JII)I

    move-result p1

    return p1
.end method

.method public setBaseImage(I)I
    .locals 4

    .line 145
    iget-wide v0, p0, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 146
    const/4 p1, -0x1

    return p1

    .line 148
    :cond_0
    iget-wide v0, p0, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    invoke-direct {p0, v0, v1, p1}, Lcom/android/camera/groupshot/GroupShot;->setBaseImage(JI)I

    move-result p1

    return p1
.end method

.method public setBestFace()I
    .locals 4

    .line 269
    iget-wide v0, p0, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 270
    const/4 v0, -0x1

    return v0

    .line 272
    :cond_0
    iget-wide v0, p0, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    invoke-direct {p0, v0, v1}, Lcom/android/camera/groupshot/GroupShot;->setBestFace(J)I

    move-result v0

    return v0
.end method

.method public updateTargetRect(I[I)I
    .locals 4

    .line 225
    iget-wide v0, p0, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 226
    const/4 p1, -0x1

    return p1

    .line 228
    :cond_0
    iget-wide v0, p0, Lcom/android/camera/groupshot/GroupShot;->mNative:J

    invoke-direct {p0, v0, v1, p1, p2}, Lcom/android/camera/groupshot/GroupShot;->updateTargetRect(JI[I)I

    move-result p1

    return p1
.end method
