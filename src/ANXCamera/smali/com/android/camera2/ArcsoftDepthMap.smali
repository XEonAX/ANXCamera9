.class public Lcom/android/camera2/ArcsoftDepthMap;
.super Ljava/lang/Object;
.source "ArcsoftDepthMap.java"


# static fields
.field private static final BLUR_LEVEL_START_ADDR:I = 0x10

.field private static final DAPTH_MAP_START_ADDR:I = 0x98

.field private static final DATA_LENGTH_4:I = 0x4

.field private static final DATA_LENGTH_START_ADDR:I = 0x94

.field private static final HEADER_LENGTH_START_ADDR:I = 0x4

.field private static final HEADER_START_ADDR:I = 0x0

.field private static final POINT_X_START_ADDR:I = 0x8

.field private static final POINT_Y_START_ADDR:I = 0xc

.field private static final TAG:Ljava/lang/String;

.field public static final TAG_DEPTH_MAP_BLUR_LEVEL:I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final TAG_DEPTH_MAP_FOCUS_POINT:I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field


# instance fields
.field private mDepthMapHeader:[B

.field private mDepthMapOriginalData:[B


# direct methods
.method private static synthetic $closeResource(Ljava/lang/Throwable;Ljava/lang/AutoCloseable;)V
    .locals 0

    .line 224
    if-eqz p0, :cond_0

    :try_start_0
    invoke-interface {p1}, Ljava/lang/AutoCloseable;->close()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    invoke-virtual {p0, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_0

    :cond_0
    invoke-interface {p1}, Ljava/lang/AutoCloseable;->close()V

    :goto_0
    return-void
.end method

.method static constructor <clinit>()V
    .locals 2

    .line 42
    const-class v0, Lcom/android/camera2/ArcsoftDepthMap;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera2/ArcsoftDepthMap;->TAG:Ljava/lang/String;

    .line 48
    nop

    .line 49
    const/4 v0, 0x2

    const/16 v1, -0x7770

    invoke-static {v0, v1}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v1

    sput v1, Lcom/android/camera2/ArcsoftDepthMap;->TAG_DEPTH_MAP_FOCUS_POINT:I

    .line 55
    nop

    .line 56
    const/16 v1, -0x776f

    invoke-static {v0, v1}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    sput v0, Lcom/android/camera2/ArcsoftDepthMap;->TAG_DEPTH_MAP_BLUR_LEVEL:I

    .line 55
    return-void
.end method

.method public constructor <init>([B)V
    .locals 3

    .line 71
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 73
    if-eqz p1, :cond_1

    .line 76
    invoke-static {p1}, Lcom/android/camera2/ArcsoftDepthMap;->getHeaderTag([B)I

    move-result v0

    .line 77
    const/16 v1, 0x80

    if-ne v0, v1, :cond_0

    .line 80
    iput-object p1, p0, Lcom/android/camera2/ArcsoftDepthMap;->mDepthMapOriginalData:[B

    .line 81
    invoke-virtual {p0}, Lcom/android/camera2/ArcsoftDepthMap;->getDepthMapHeader()[B

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera2/ArcsoftDepthMap;->mDepthMapHeader:[B

    .line 82
    return-void

    .line 78
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Illegal depth format! 0x80 != "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 74
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Null depth data!"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private static getBytes([BII)[B
    .locals 2

    .line 347
    if-lez p2, :cond_0

    if-ltz p1, :cond_0

    array-length v0, p0

    sub-int/2addr v0, p1

    if-gt p2, v0, :cond_0

    .line 351
    new-array v0, p2, [B

    .line 352
    const/4 v1, 0x0

    invoke-static {p0, p1, v0, v1, p2}, Ljava/lang/System;->arraycopy([BI[BII)V

    .line 353
    return-object v0

    .line 348
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "WRONG ARGUMENT: from ="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, ", length = "

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private static getHeaderTag([B)I
    .locals 2

    .line 325
    const/4 v0, 0x0

    const/4 v1, 0x4

    invoke-static {p0, v0, v1}, Lcom/android/camera2/ArcsoftDepthMap;->getBytes([BII)[B

    move-result-object p0

    invoke-static {p0}, Lcom/android/camera2/ArcsoftDepthMap;->getInteger([B)I

    move-result p0

    return p0
.end method

.method private static getInteger([B)I
    .locals 5

    .line 329
    array-length v0, p0

    const/4 v1, 0x4

    if-ne v0, v1, :cond_1

    .line 333
    nop

    .line 334
    const/4 v0, 0x0

    move v2, v0

    :goto_0
    if-ge v0, v1, :cond_0

    .line 335
    aget-byte v3, p0, v0

    and-int/lit16 v3, v3, 0xff

    mul-int/lit8 v4, v0, 0x8

    shl-int/2addr v3, v4

    add-int/2addr v2, v3

    .line 334
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 337
    :cond_0
    return v2

    .line 330
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "bytes can not covert to a integer value!"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static isDepthMapData([B)Z
    .locals 2

    .line 90
    if-eqz p0, :cond_0

    array-length v0, p0

    const/4 v1, 0x4

    if-le v0, v1, :cond_0

    invoke-static {p0}, Lcom/android/camera2/ArcsoftDepthMap;->getHeaderTag([B)I

    move-result p0

    const/16 v0, 0x80

    if-ne p0, v0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    .line 91
    :goto_0
    if-nez p0, :cond_1

    .line 92
    sget-object v0, Lcom/android/camera2/ArcsoftDepthMap;->TAG:Ljava/lang/String;

    const-string v1, "Illegal depth format"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 94
    :cond_1
    return p0
.end method


# virtual methods
.method public getBlurLevel()I
    .locals 3

    .line 129
    iget-object v0, p0, Lcom/android/camera2/ArcsoftDepthMap;->mDepthMapHeader:[B

    const/16 v1, 0x10

    const/4 v2, 0x4

    invoke-static {v0, v1, v2}, Lcom/android/camera2/ArcsoftDepthMap;->getBytes([BII)[B

    move-result-object v0

    invoke-static {v0}, Lcom/android/camera2/ArcsoftDepthMap;->getInteger([B)I

    move-result v0

    return v0
.end method

.method public getDepthMapData()[B
    .locals 3

    .line 147
    iget-object v0, p0, Lcom/android/camera2/ArcsoftDepthMap;->mDepthMapOriginalData:[B

    invoke-virtual {p0}, Lcom/android/camera2/ArcsoftDepthMap;->getDepthMapLength()I

    move-result v1

    const/16 v2, 0x98

    invoke-static {v0, v2, v1}, Lcom/android/camera2/ArcsoftDepthMap;->getBytes([BII)[B

    move-result-object v0

    return-object v0
.end method

.method public getDepthMapHeader()[B
    .locals 3

    .line 108
    iget-object v0, p0, Lcom/android/camera2/ArcsoftDepthMap;->mDepthMapOriginalData:[B

    const/4 v1, 0x4

    invoke-static {v0, v1, v1}, Lcom/android/camera2/ArcsoftDepthMap;->getBytes([BII)[B

    move-result-object v0

    invoke-static {v0}, Lcom/android/camera2/ArcsoftDepthMap;->getInteger([B)I

    move-result v0

    .line 109
    iget-object v1, p0, Lcom/android/camera2/ArcsoftDepthMap;->mDepthMapOriginalData:[B

    const/4 v2, 0x0

    invoke-static {v1, v2, v0}, Lcom/android/camera2/ArcsoftDepthMap;->getBytes([BII)[B

    move-result-object v0

    return-object v0
.end method

.method public getDepthMapLength()I
    .locals 3

    .line 138
    iget-object v0, p0, Lcom/android/camera2/ArcsoftDepthMap;->mDepthMapHeader:[B

    const/16 v1, 0x94

    const/4 v2, 0x4

    invoke-static {v0, v1, v2}, Lcom/android/camera2/ArcsoftDepthMap;->getBytes([BII)[B

    move-result-object v0

    invoke-static {v0}, Lcom/android/camera2/ArcsoftDepthMap;->getInteger([B)I

    move-result v0

    return v0
.end method

.method public getFocusPoint()Landroid/graphics/Point;
    .locals 4

    .line 118
    iget-object v0, p0, Lcom/android/camera2/ArcsoftDepthMap;->mDepthMapHeader:[B

    const/4 v1, 0x4

    const/16 v2, 0x8

    invoke-static {v0, v2, v1}, Lcom/android/camera2/ArcsoftDepthMap;->getBytes([BII)[B

    move-result-object v0

    invoke-static {v0}, Lcom/android/camera2/ArcsoftDepthMap;->getInteger([B)I

    move-result v0

    .line 119
    iget-object v2, p0, Lcom/android/camera2/ArcsoftDepthMap;->mDepthMapHeader:[B

    const/16 v3, 0xc

    invoke-static {v2, v3, v1}, Lcom/android/camera2/ArcsoftDepthMap;->getBytes([BII)[B

    move-result-object v1

    invoke-static {v1}, Lcom/android/camera2/ArcsoftDepthMap;->getInteger([B)I

    move-result v1

    .line 120
    new-instance v2, Landroid/graphics/Point;

    invoke-direct {v2, v0, v1}, Landroid/graphics/Point;-><init>(II)V

    return-object v2
.end method

.method public writePortraitExif(I[B[B[I[B[IIZZLcom/xiaomi/camera/core/PictureInfo;II)[B
    .locals 18
    .param p4    # [I
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p6    # [I
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    move/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    move-object/from16 v5, p5

    move/from16 v0, p7

    .line 163
    invoke-virtual/range {p0 .. p0}, Lcom/android/camera2/ArcsoftDepthMap;->getFocusPoint()Landroid/graphics/Point;

    move-result-object v9

    .line 165
    invoke-virtual/range {p0 .. p0}, Lcom/android/camera2/ArcsoftDepthMap;->getBlurLevel()I

    move-result v10

    .line 179
    invoke-virtual/range {p10 .. p10}, Lcom/xiaomi/camera/core/PictureInfo;->isFrontCamera()Z

    move-result v11

    .line 180
    const/4 v12, -0x1

    const/16 v13, 0xa

    const/4 v14, 0x5

    if-lez v1, :cond_3

    .line 181
    if-eqz v11, :cond_1

    .line 182
    invoke-virtual/range {p10 .. p10}, Lcom/xiaomi/camera/core/PictureInfo;->isAiEnabled()Z

    move-result v11

    if-eqz v11, :cond_0

    invoke-virtual/range {p10 .. p10}, Lcom/xiaomi/camera/core/PictureInfo;->getAiType()I

    move-result v11

    if-ne v11, v13, :cond_0

    .line 183
    nop

    .line 184
    const/16 v12, 0x46

    goto :goto_0

    .line 186
    :cond_0
    nop

    .line 187
    const/16 v12, 0x28

    goto :goto_0

    .line 190
    :cond_1
    invoke-virtual/range {p10 .. p10}, Lcom/xiaomi/camera/core/PictureInfo;->isAiEnabled()Z

    move-result v11

    if-eqz v11, :cond_2

    invoke-virtual/range {p10 .. p10}, Lcom/xiaomi/camera/core/PictureInfo;->getAiType()I

    move-result v11

    if-ne v11, v13, :cond_2

    .line 191
    nop

    .line 192
    const/16 v12, 0x1e

    goto :goto_0

    .line 194
    :cond_2
    nop

    .line 195
    nop

    .line 204
    move v12, v13

    goto :goto_0

    .line 200
    :cond_3
    nop

    .line 201
    nop

    .line 204
    move v14, v12

    :goto_0
    sget-object v11, Lcom/android/camera2/ArcsoftDepthMap;->TAG:Ljava/lang/String;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "writePortraitExif: focusPoint: "

    invoke-virtual {v13, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v11, v13}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 205
    sget-object v11, Lcom/android/camera2/ArcsoftDepthMap;->TAG:Ljava/lang/String;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "writePortraitExif: blurLevel: "

    invoke-virtual {v13, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v11, v13}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 206
    sget-object v11, Lcom/android/camera2/ArcsoftDepthMap;->TAG:Ljava/lang/String;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "writePortraitExif: shineThreshold: "

    invoke-virtual {v13, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v11, v13}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 207
    sget-object v11, Lcom/android/camera2/ArcsoftDepthMap;->TAG:Ljava/lang/String;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "writePortraitExif: shineLevel: "

    invoke-virtual {v13, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v11, v13}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 208
    sget-object v11, Lcom/android/camera2/ArcsoftDepthMap;->TAG:Ljava/lang/String;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "writePortraitExif: lightingPattern: "

    invoke-virtual {v13, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v11, v13}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 210
    nop

    .line 211
    const/4 v11, 0x0

    :try_start_0
    new-instance v13, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v13}, Ljava/io/ByteArrayOutputStream;-><init>()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2

    .line 212
    :try_start_1
    new-instance v15, Lcom/android/gallery3d/exif/ExifInterface;

    invoke-direct {v15}, Lcom/android/gallery3d/exif/ExifInterface;-><init>()V

    .line 213
    invoke-virtual {v15, v2}, Lcom/android/gallery3d/exif/ExifInterface;->readExif([B)V

    .line 215
    invoke-virtual {v15, v1}, Lcom/android/gallery3d/exif/ExifInterface;->addXiaomiDepthmapVersion(I)Z

    .line 216
    invoke-virtual {v15, v10}, Lcom/android/gallery3d/exif/ExifInterface;->addDepthMapBlurLevel(I)Z

    .line 217
    invoke-virtual {v15, v0}, Lcom/android/gallery3d/exif/ExifInterface;->addPortraitLighting(I)Z

    .line 218
    if-eqz p9, :cond_4

    .line 219
    move/from16 v0, p8

    invoke-virtual {v15, v0}, Lcom/android/gallery3d/exif/ExifInterface;->addFrontMirror(I)Z

    .line 222
    :cond_4
    invoke-virtual {v15, v2, v13}, Lcom/android/gallery3d/exif/ExifInterface;->writeExif([BLjava/io/OutputStream;)V

    .line 223
    invoke-virtual {v13}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v15
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 224
    :try_start_2
    invoke-static {v11, v13}, Lcom/android/camera2/ArcsoftDepthMap;->$closeResource(Ljava/lang/Throwable;Ljava/lang/AutoCloseable;)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 226
    goto :goto_3

    .line 224
    :catch_0
    move-exception v0

    goto :goto_2

    :catchall_0
    move-exception v0

    move-object v15, v11

    goto :goto_1

    .line 211
    :catch_1
    move-exception v0

    move-object v15, v0

    :try_start_3
    throw v15
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 224
    :catchall_1
    move-exception v0

    :goto_1
    :try_start_4
    invoke-static {v15, v13}, Lcom/android/camera2/ArcsoftDepthMap;->$closeResource(Ljava/lang/Throwable;Ljava/lang/AutoCloseable;)V

    throw v0
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2

    :catch_2
    move-exception v0

    move-object v15, v11

    .line 225
    :goto_2
    sget-object v0, Lcom/android/camera2/ArcsoftDepthMap;->TAG:Ljava/lang/String;

    const-string v13, "writePortraitExif(): Failed to write depthmap associated exif metadata"

    invoke-static {v0, v13}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 228
    :goto_3
    if-eqz v15, :cond_e

    array-length v0, v15

    array-length v13, v2

    if-gt v0, v13, :cond_5

    goto/16 :goto_11

    .line 233
    :cond_5
    nop

    .line 235
    :try_start_5
    invoke-static {}, Landroid/util/Xml;->newSerializer()Lorg/xmlpull/v1/XmlSerializer;

    move-result-object v0

    .line 236
    new-instance v13, Ljava/io/StringWriter;

    invoke-direct {v13}, Ljava/io/StringWriter;-><init>()V

    .line 237
    invoke-interface {v0, v13}, Lorg/xmlpull/v1/XmlSerializer;->setOutput(Ljava/io/Writer;)V

    .line 238
    const-string v11, "UTF-8"
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_4

    move-object/from16 v16, v15

    const/4 v15, 0x1

    :try_start_6
    invoke-static {v15}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-interface {v0, v11, v2}, Lorg/xmlpull/v1/XmlSerializer;->startDocument(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 241
    const-string v2, "depthmap"

    const/4 v11, 0x0

    invoke-interface {v0, v11, v2}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 242
    const-string v2, "version"

    invoke-static/range {p1 .. p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v11, v2, v1}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 243
    const-string v1, "focuspoint"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget v11, v9, Landroid/graphics/Point;->x:I

    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v11, ","

    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v9, v9, Landroid/graphics/Point;->y:I

    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v9, 0x0

    invoke-interface {v0, v9, v1, v2}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 244
    const-string v1, "blurlevel"

    invoke-static {v10}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v9, v1, v2}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 245
    const-string v1, "shinethreshold"

    invoke-static {v14}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v9, v1, v2}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 246
    const-string v1, "shinelevel"

    invoke-static {v12}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v9, v1, v2}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 247
    const-string v1, "rawlength"

    invoke-static/range {p11 .. p11}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v9, v1, v2}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 248
    const-string v1, "depthlength"

    invoke-static/range {p12 .. p12}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v9, v1, v2}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 249
    const-string v1, "depthmap"

    invoke-interface {v0, v9, v1}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 252
    const/4 v1, 0x3

    const/4 v2, 0x2

    const/4 v9, 0x0

    if-eqz v3, :cond_7

    array-length v10, v3

    if-lez v10, :cond_7

    .line 253
    const-string v10, "lenswatermark"

    const/4 v11, 0x0

    invoke-interface {v0, v11, v10}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 254
    const-string v10, "offset"

    array-length v11, v3

    .line 256
    if-eqz v5, :cond_6

    array-length v12, v5

    goto :goto_4

    :cond_6
    move v12, v9

    :goto_4
    add-int/2addr v11, v12

    add-int v11, v11, p11

    add-int v11, v11, p12

    .line 255
    invoke-static {v11}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v11

    .line 254
    const/4 v12, 0x0

    invoke-interface {v0, v12, v10, v11}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 258
    const-string v10, "length"

    array-length v11, v3

    invoke-static {v11}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v11

    const/4 v12, 0x0

    invoke-interface {v0, v12, v10, v11}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 259
    const-string v10, "width"

    aget v11, p4, v9

    invoke-static {v11}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v11

    const/4 v12, 0x0

    invoke-interface {v0, v12, v10, v11}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 260
    const-string v10, "height"

    aget v11, p4, v15

    invoke-static {v11}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v11

    const/4 v12, 0x0

    invoke-interface {v0, v12, v10, v11}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 261
    const-string v10, "paddingx"

    aget v11, p4, v2

    invoke-static {v11}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v11

    const/4 v12, 0x0

    invoke-interface {v0, v12, v10, v11}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 262
    const-string v10, "paddingy"

    aget v4, p4, v1

    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    const/4 v11, 0x0

    invoke-interface {v0, v11, v10, v4}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 263
    const-string v4, "lenswatermark"

    invoke-interface {v0, v11, v4}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 267
    :cond_7
    if-eqz v5, :cond_8

    array-length v4, v5

    if-lez v4, :cond_8

    .line 268
    const-string v4, "timewatermark"

    const/4 v10, 0x0

    invoke-interface {v0, v10, v4}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 269
    const-string v4, "offset"

    array-length v10, v5

    add-int v10, v10, p11

    add-int v10, v10, p12

    .line 270
    invoke-static {v10}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v7

    .line 269
    const/4 v8, 0x0

    invoke-interface {v0, v8, v4, v7}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 271
    const-string v4, "length"

    array-length v7, v5

    invoke-static {v7}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v7

    const/4 v8, 0x0

    invoke-interface {v0, v8, v4, v7}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 272
    const-string v4, "width"

    aget v7, p6, v9

    invoke-static {v7}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v7

    const/4 v8, 0x0

    invoke-interface {v0, v8, v4, v7}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 273
    const-string v4, "height"

    aget v7, p6, v15

    invoke-static {v7}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v7

    const/4 v8, 0x0

    invoke-interface {v0, v8, v4, v7}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 274
    const-string v4, "paddingx"

    aget v2, p6, v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    const/4 v7, 0x0

    invoke-interface {v0, v7, v4, v2}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 275
    const-string v2, "paddingy"

    aget v1, p6, v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    const/4 v4, 0x0

    invoke-interface {v0, v4, v2, v1}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 276
    const-string v1, "timewatermark"

    invoke-interface {v0, v4, v1}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 279
    :cond_8
    invoke-interface {v0}, Lorg/xmlpull/v1/XmlSerializer;->endDocument()V

    .line 280
    invoke-virtual {v13}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object v11
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_3

    .line 283
    goto :goto_6

    .line 281
    :catch_3
    move-exception v0

    goto :goto_5

    :catch_4
    move-exception v0

    move-object/from16 v16, v15

    .line 282
    :goto_5
    sget-object v0, Lcom/android/camera2/ArcsoftDepthMap;->TAG:Ljava/lang/String;

    const-string v1, "writePortraitExif(): Failed to generate depthmap associated xmp metadata"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 285
    const/4 v11, 0x0

    :goto_6
    if-nez v11, :cond_9

    .line 286
    sget-object v0, Lcom/android/camera2/ArcsoftDepthMap;->TAG:Ljava/lang/String;

    const-string v1, "writePortraitExif(): #2: return original jpeg"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 287
    move-object/from16 v1, p2

    return-object v1

    .line 290
    :cond_9
    move-object/from16 v1, p2

    .line 291
    :try_start_7
    new-instance v2, Ljava/io/ByteArrayInputStream;
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_c
    .catch Lcom/adobe/xmp/XMPException; {:try_start_7 .. :try_end_7} :catch_c

    move-object/from16 v15, v16

    :try_start_8
    invoke-direct {v2, v15}, Ljava/io/ByteArrayInputStream;-><init>([B)V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_b
    .catch Lcom/adobe/xmp/XMPException; {:try_start_8 .. :try_end_8} :catch_b

    .line 292
    :try_start_9
    new-instance v4, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v4}, Ljava/io/ByteArrayOutputStream;-><init>()V
    :try_end_9
    .catch Ljava/lang/Throwable; {:try_start_9 .. :try_end_9} :catch_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_7

    .line 291
    nop

    .line 293
    :try_start_a
    invoke-static {}, Lcom/android/camera/XmpHelper;->createXMPMeta()Lcom/adobe/xmp/XMPMeta;

    move-result-object v0

    .line 294
    const-string v6, "http://ns.xiaomi.com/photos/1.0/camera/"

    const-string v7, "XMPMeta"

    invoke-interface {v0, v6, v7, v11}, Lcom/adobe/xmp/XMPMeta;->setProperty(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 298
    invoke-static {v2, v4, v0}, Lcom/android/camera/XmpHelper;->writeXMPMeta(Ljava/io/InputStream;Ljava/io/OutputStream;Lcom/adobe/xmp/XMPMeta;)Z
    :try_end_a
    .catch Ljava/lang/Throwable; {:try_start_a .. :try_end_a} :catch_7
    .catchall {:try_start_a .. :try_end_a} :catchall_4

    .line 300
    if-eqz v3, :cond_a

    .line 301
    :try_start_b
    invoke-virtual {v4, v3}, Ljava/io/ByteArrayOutputStream;->write([B)V

    goto :goto_7

    .line 310
    :catchall_2
    move-exception v0

    const/4 v3, 0x0

    const/4 v11, 0x0

    goto :goto_9

    .line 291
    :catch_5
    move-exception v0

    move-object v11, v0

    const/4 v3, 0x0

    goto :goto_8

    .line 304
    :cond_a
    :goto_7
    if-eqz v5, :cond_b

    .line 305
    invoke-virtual {v4, v5}, Ljava/io/ByteArrayOutputStream;->write([B)V
    :try_end_b
    .catch Ljava/lang/Throwable; {:try_start_b .. :try_end_b} :catch_5
    .catchall {:try_start_b .. :try_end_b} :catchall_2

    .line 308
    :cond_b
    :try_start_c
    invoke-virtual {v4}, Ljava/io/ByteArrayOutputStream;->flush()V

    .line 309
    invoke-virtual {v4}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v11
    :try_end_c
    .catch Ljava/lang/Throwable; {:try_start_c .. :try_end_c} :catch_7
    .catchall {:try_start_c .. :try_end_c} :catchall_4

    .line 310
    const/4 v3, 0x0

    :try_start_d
    invoke-static {v3, v4}, Lcom/android/camera2/ArcsoftDepthMap;->$closeResource(Ljava/lang/Throwable;Ljava/lang/AutoCloseable;)V
    :try_end_d
    .catch Ljava/lang/Throwable; {:try_start_d .. :try_end_d} :catch_6
    .catchall {:try_start_d .. :try_end_d} :catchall_3

    :try_start_e
    invoke-static {v3, v2}, Lcom/android/camera2/ArcsoftDepthMap;->$closeResource(Ljava/lang/Throwable;Ljava/lang/AutoCloseable;)V
    :try_end_e
    .catch Ljava/io/IOException; {:try_start_e .. :try_end_e} :catch_a
    .catch Lcom/adobe/xmp/XMPException; {:try_start_e .. :try_end_e} :catch_a

    .line 312
    goto :goto_f

    .line 310
    :catchall_3
    move-exception v0

    goto :goto_c

    .line 291
    :catch_6
    move-exception v0

    move-object v3, v11

    goto :goto_b

    .line 310
    :catchall_4
    move-exception v0

    const/4 v3, 0x0

    move-object v11, v3

    goto :goto_9

    .line 291
    :catch_7
    move-exception v0

    const/4 v3, 0x0

    move-object v11, v0

    :goto_8
    :try_start_f
    throw v11
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_5

    .line 310
    :catchall_5
    move-exception v0

    :goto_9
    :try_start_10
    invoke-static {v11, v4}, Lcom/android/camera2/ArcsoftDepthMap;->$closeResource(Ljava/lang/Throwable;Ljava/lang/AutoCloseable;)V

    throw v0
    :try_end_10
    .catch Ljava/lang/Throwable; {:try_start_10 .. :try_end_10} :catch_8
    .catchall {:try_start_10 .. :try_end_10} :catchall_6

    :catchall_6
    move-exception v0

    goto :goto_a

    .line 291
    :catch_8
    move-exception v0

    goto :goto_b

    .line 310
    :catchall_7
    move-exception v0

    const/4 v3, 0x0

    :goto_a
    move-object v11, v3

    goto :goto_c

    .line 291
    :catch_9
    move-exception v0

    const/4 v3, 0x0

    :goto_b
    move-object v11, v0

    :try_start_11
    throw v11
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_8

    .line 310
    :catchall_8
    move-exception v0

    move-object/from16 v17, v11

    move-object v11, v3

    move-object/from16 v3, v17

    :goto_c
    :try_start_12
    invoke-static {v3, v2}, Lcom/android/camera2/ArcsoftDepthMap;->$closeResource(Ljava/lang/Throwable;Ljava/lang/AutoCloseable;)V

    throw v0
    :try_end_12
    .catch Ljava/io/IOException; {:try_start_12 .. :try_end_12} :catch_a
    .catch Lcom/adobe/xmp/XMPException; {:try_start_12 .. :try_end_12} :catch_a

    :catch_a
    move-exception v0

    goto :goto_e

    :catch_b
    move-exception v0

    goto :goto_d

    :catch_c
    move-exception v0

    move-object/from16 v15, v16

    :goto_d
    const/4 v3, 0x0

    move-object v11, v3

    .line 311
    :goto_e
    sget-object v0, Lcom/android/camera2/ArcsoftDepthMap;->TAG:Ljava/lang/String;

    const-string v2, "writePortraitExif(): Failed to insert depthmap associated xmp metadata"

    invoke-static {v0, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 314
    :goto_f
    if-eqz v11, :cond_d

    array-length v0, v11

    array-length v2, v15

    if-gt v0, v2, :cond_c

    goto :goto_10

    .line 319
    :cond_c
    return-object v11

    .line 315
    :cond_d
    :goto_10
    sget-object v0, Lcom/android/camera2/ArcsoftDepthMap;->TAG:Ljava/lang/String;

    const-string v2, "writePortraitExif(): #3: return original jpeg"

    invoke-static {v0, v2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 316
    return-object v1

    .line 229
    :cond_e
    :goto_11
    move-object v1, v2

    sget-object v0, Lcom/android/camera2/ArcsoftDepthMap;->TAG:Ljava/lang/String;

    const-string v2, "writePortraitExif(): #1: return original jpeg"

    invoke-static {v0, v2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 230
    return-object v1
.end method
