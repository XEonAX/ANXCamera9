.class public Lcom/android/camera/storage/ParallelSaveRequest;
.super Ljava/lang/Object;
.source "ParallelSaveRequest.java"

# interfaces
.implements Lcom/android/camera/storage/SaveRequest;


# instance fields
.field private context:Landroid/content/Context;

.field private data:[B

.field private imageHeight:I

.field private imageWidth:I

.field private jpegRotation:I

.field private loc:Landroid/location/Location;

.field private savePath:Ljava/lang/String;

.field private saverCallback:Lcom/android/camera/storage/SaverCallback;

.field private size:I

.field private startTime:J


# direct methods
.method public constructor <init>([BJLandroid/location/Location;ILjava/lang/String;II)V
    .locals 0

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    iput-object p1, p0, Lcom/android/camera/storage/ParallelSaveRequest;->data:[B

    .line 46
    iput-wide p2, p0, Lcom/android/camera/storage/ParallelSaveRequest;->startTime:J

    .line 47
    array-length p1, p1

    iput p1, p0, Lcom/android/camera/storage/ParallelSaveRequest;->size:I

    .line 48
    if-nez p4, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    new-instance p1, Landroid/location/Location;

    invoke-direct {p1, p4}, Landroid/location/Location;-><init>(Landroid/location/Location;)V

    :goto_0
    iput-object p1, p0, Lcom/android/camera/storage/ParallelSaveRequest;->loc:Landroid/location/Location;

    .line 49
    iput p5, p0, Lcom/android/camera/storage/ParallelSaveRequest;->jpegRotation:I

    .line 50
    iput-object p6, p0, Lcom/android/camera/storage/ParallelSaveRequest;->savePath:Ljava/lang/String;

    .line 51
    iput p7, p0, Lcom/android/camera/storage/ParallelSaveRequest;->imageWidth:I

    .line 52
    iput p8, p0, Lcom/android/camera/storage/ParallelSaveRequest;->imageHeight:I

    .line 53
    return-void
.end method


# virtual methods
.method public getSize()I
    .locals 1

    .line 120
    iget v0, p0, Lcom/android/camera/storage/ParallelSaveRequest;->size:I

    return v0
.end method

.method public isFinal()Z
    .locals 1

    .line 125
    const/4 v0, 0x0

    return v0
.end method

.method public onFinish()V
    .locals 2

    .line 130
    iget-object v0, p0, Lcom/android/camera/storage/ParallelSaveRequest;->data:[B

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/xiaomi/camera/base/PerformanceTracker;->trackImageSaver(Ljava/lang/Object;I)V

    .line 131
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera/storage/ParallelSaveRequest;->data:[B

    .line 132
    iget-object v0, p0, Lcom/android/camera/storage/ParallelSaveRequest;->saverCallback:Lcom/android/camera/storage/SaverCallback;

    iget v1, p0, Lcom/android/camera/storage/ParallelSaveRequest;->size:I

    invoke-interface {v0, v1}, Lcom/android/camera/storage/SaverCallback;->onSaveFinish(I)V

    .line 133
    return-void
.end method

.method public run()V
    .locals 0

    .line 137
    invoke-virtual {p0}, Lcom/android/camera/storage/ParallelSaveRequest;->save()V

    .line 138
    invoke-virtual {p0}, Lcom/android/camera/storage/ParallelSaveRequest;->onFinish()V

    .line 139
    return-void
.end method

.method public save()V
    .locals 22

    .line 58
    move-object/from16 v0, p0

    const-string v1, "algo save!!!!:"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, v0, Lcom/android/camera/storage/ParallelSaveRequest;->savePath:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " | "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v3, v0, Lcom/android/camera/storage/ParallelSaveRequest;->startTime:J

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 59
    iget v1, v0, Lcom/android/camera/storage/ParallelSaveRequest;->imageWidth:I

    .line 60
    iget v2, v0, Lcom/android/camera/storage/ParallelSaveRequest;->imageHeight:I

    .line 62
    iget-object v3, v0, Lcom/android/camera/storage/ParallelSaveRequest;->data:[B

    invoke-static {v3}, Lcom/android/camera/Exif;->getOrientation([B)I

    move-result v3

    .line 65
    iget v4, v0, Lcom/android/camera/storage/ParallelSaveRequest;->jpegRotation:I

    add-int/2addr v4, v3

    rem-int/lit16 v4, v4, 0xb4

    if-nez v4, :cond_0

    .line 66
    nop

    .line 67
    goto :goto_0

    .line 69
    :cond_0
    nop

    .line 70
    nop

    .line 72
    move/from16 v21, v2

    move v2, v1

    move/from16 v1, v21

    :goto_0
    invoke-static {}, Lcom/android/camera/db/DbRepository;->dbItemSaveTask()Lcom/android/camera/db/item/DbItemSaveTask;

    move-result-object v4

    iget-object v5, v0, Lcom/android/camera/storage/ParallelSaveRequest;->savePath:Ljava/lang/String;

    invoke-virtual {v4, v5}, Lcom/android/camera/db/item/DbItemSaveTask;->getItemByPath(Ljava/lang/String;)Lcom/android/camera/db/element/SaveTask;

    move-result-object v14

    .line 73
    const/4 v15, 0x0

    if-eqz v14, :cond_2

    invoke-virtual {v14}, Lcom/android/camera/db/element/SaveTask;->isValid()Z

    move-result v4

    if-nez v4, :cond_1

    goto/16 :goto_1

    .line 96
    :cond_1
    iget-object v4, v0, Lcom/android/camera/storage/ParallelSaveRequest;->savePath:Ljava/lang/String;

    invoke-static {v4}, Lcom/android/camera/Util;->getFileTitleFromPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 97
    invoke-virtual {v14}, Lcom/android/camera/db/element/SaveTask;->getMediaStoreId()Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    invoke-static {v4, v5}, Lcom/xiaomi/camera/parallelservice/util/ParallelUtil;->getResultUri(J)Landroid/net/Uri;

    move-result-object v4

    .line 98
    const-string v5, "algo mark:"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "uri :"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, " | "

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14}, Lcom/android/camera/db/element/SaveTask;->getPath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v5, v4}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 101
    const-string v4, "algo mark:"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    iget v6, v0, Lcom/android/camera/storage/ParallelSaveRequest;->jpegRotation:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v6, " | "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v6, " | "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v6, " | "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v6, " | "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 108
    sget-object v4, Landroid/provider/MediaStore$Images$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {v14}, Lcom/android/camera/db/element/SaveTask;->getMediaStoreId()Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    move-result-wide v5

    invoke-static {v4, v5, v6}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v7

    .line 109
    iget-object v4, v0, Lcom/android/camera/storage/ParallelSaveRequest;->context:Landroid/content/Context;

    iget-object v5, v0, Lcom/android/camera/storage/ParallelSaveRequest;->data:[B

    const/4 v6, 0x0

    iget-object v9, v0, Lcom/android/camera/storage/ParallelSaveRequest;->loc:Landroid/location/Location;

    const/4 v13, 0x0

    move v10, v3

    move v11, v1

    move v12, v2

    invoke-static/range {v4 .. v13}, Lcom/android/camera/storage/Storage;->updateImage(Landroid/content/Context;[BLcom/android/gallery3d/exif/ExifInterface;Landroid/net/Uri;Ljava/lang/String;Landroid/location/Location;IIILjava/lang/String;)Z

    .line 112
    iget-object v0, v0, Lcom/android/camera/storage/ParallelSaveRequest;->context:Landroid/content/Context;

    invoke-static {v0, v14, v15}, Lcom/xiaomi/camera/parallelservice/util/ParallelUtil;->markTaskFinish(Landroid/content/Context;Lcom/android/camera/db/element/SaveTask;Z)V

    goto :goto_3

    .line 74
    :cond_2
    :goto_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    .line 75
    invoke-static {v6, v7}, Lcom/android/camera/Util;->createJpegName(J)Ljava/lang/String;

    move-result-object v5

    .line 77
    iget-object v4, v0, Lcom/android/camera/storage/ParallelSaveRequest;->context:Landroid/content/Context;

    iget-object v8, v0, Lcom/android/camera/storage/ParallelSaveRequest;->loc:Landroid/location/Location;

    iget-object v10, v0, Lcom/android/camera/storage/ParallelSaveRequest;->data:[B

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v20, 0x0

    move v9, v3

    move v11, v1

    move v12, v2

    move/from16 v15, v16

    move/from16 v16, v17

    move/from16 v17, v18

    move-object/from16 v18, v19

    move-object/from16 v19, v20

    invoke-static/range {v4 .. v19}, Lcom/android/camera/storage/Storage;->addImage(Landroid/content/Context;Ljava/lang/String;JLandroid/location/Location;I[BIIZZZZZLjava/lang/String;Lcom/xiaomi/camera/core/PictureInfo;)Landroid/net/Uri;

    move-result-object v4

    .line 81
    if-eqz v4, :cond_4

    .line 84
    int-to-double v5, v1

    int-to-double v1, v2

    invoke-static {v5, v6, v1, v2}, Ljava/lang/Math;->max(DD)D

    move-result-wide v1

    const-wide/high16 v5, 0x4080000000000000L    # 512.0

    div-double/2addr v1, v5

    invoke-static {v1, v2}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v1

    double-to-int v1, v1

    .line 85
    invoke-static {v1}, Ljava/lang/Integer;->highestOneBit(I)I

    move-result v1

    .line 86
    iget-object v2, v0, Lcom/android/camera/storage/ParallelSaveRequest;->data:[B

    const/4 v5, 0x0

    invoke-static {v2, v3, v1, v4, v5}, Lcom/android/camera/Thumbnail;->createThumbnail([BIILandroid/net/Uri;Z)Lcom/android/camera/Thumbnail;

    move-result-object v1

    .line 87
    if-eqz v1, :cond_3

    .line 88
    iget-object v2, v0, Lcom/android/camera/storage/ParallelSaveRequest;->saverCallback:Lcom/android/camera/storage/SaverCallback;

    const/4 v3, 0x1

    invoke-interface {v2, v1, v3}, Lcom/android/camera/storage/SaverCallback;->postUpdateThumbnail(Lcom/android/camera/Thumbnail;Z)V

    goto :goto_2

    .line 90
    :cond_3
    iget-object v1, v0, Lcom/android/camera/storage/ParallelSaveRequest;->saverCallback:Lcom/android/camera/storage/SaverCallback;

    invoke-interface {v1}, Lcom/android/camera/storage/SaverCallback;->postHideThumbnailProgressing()V

    .line 92
    :goto_2
    iget-object v1, v0, Lcom/android/camera/storage/ParallelSaveRequest;->saverCallback:Lcom/android/camera/storage/SaverCallback;

    invoke-virtual/range {p0 .. p0}, Lcom/android/camera/storage/ParallelSaveRequest;->isFinal()Z

    move-result v0

    invoke-interface {v1, v4, v0}, Lcom/android/camera/storage/SaverCallback;->notifyNewImage(Landroid/net/Uri;Z)V

    .line 95
    :cond_4
    nop

    .line 116
    :goto_3
    return-void
.end method

.method public setContextAndCallback(Landroid/content/Context;Lcom/android/camera/storage/SaverCallback;)V
    .locals 0

    .line 33
    iput-object p1, p0, Lcom/android/camera/storage/ParallelSaveRequest;->context:Landroid/content/Context;

    .line 34
    iput-object p2, p0, Lcom/android/camera/storage/ParallelSaveRequest;->saverCallback:Lcom/android/camera/storage/SaverCallback;

    .line 35
    return-void
.end method
