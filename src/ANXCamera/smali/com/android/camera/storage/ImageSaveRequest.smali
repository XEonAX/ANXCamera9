.class public final Lcom/android/camera/storage/ImageSaveRequest;
.super Ljava/lang/Object;
.source "ImageSaveRequest.java"

# interfaces
.implements Lcom/android/camera/storage/SaveRequest;


# static fields
.field private static final TAG:Ljava/lang/String; = "ImageSaveRequest"


# instance fields
.field private algorithmName:Ljava/lang/String;

.field private context:Landroid/content/Context;

.field private data:[B

.field private date:J

.field private exif:Lcom/android/gallery3d/exif/ExifInterface;

.field private finalImage:Z

.field private height:I

.field private info:Lcom/xiaomi/camera/core/PictureInfo;

.field private isHide:Z

.field private isMap:Z

.field private isParallelProcess:Z

.field private loc:Landroid/location/Location;

.field private mirror:Z

.field private needThumbnail:Z

.field public oldTitle:Ljava/lang/String;

.field private orientation:I

.field private previewThumbnailHash:I

.field private saverCallback:Lcom/android/camera/storage/SaverCallback;

.field private size:I

.field public title:Ljava/lang/String;

.field private uri:Landroid/net/Uri;

.field private width:I


# direct methods
.method constructor <init>()V
    .locals 0

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    return-void
.end method

.method constructor <init>([BZLjava/lang/String;Ljava/lang/String;JLandroid/net/Uri;Landroid/location/Location;IILcom/android/gallery3d/exif/ExifInterface;IZZZZZLjava/lang/String;Lcom/xiaomi/camera/core/PictureInfo;I)V
    .locals 5

    move-object v0, p0

    move-object v1, p1

    move-object v2, p8

    .line 73
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 74
    iput-object v1, v0, Lcom/android/camera/storage/ImageSaveRequest;->data:[B

    .line 75
    move v3, p2

    iput-boolean v3, v0, Lcom/android/camera/storage/ImageSaveRequest;->needThumbnail:Z

    .line 76
    move-wide v3, p5

    iput-wide v3, v0, Lcom/android/camera/storage/ImageSaveRequest;->date:J

    .line 77
    move-object v3, p7

    iput-object v3, v0, Lcom/android/camera/storage/ImageSaveRequest;->uri:Landroid/net/Uri;

    .line 78
    move-object v3, p3

    iput-object v3, v0, Lcom/android/camera/storage/ImageSaveRequest;->title:Ljava/lang/String;

    .line 79
    move-object v3, p4

    iput-object v3, v0, Lcom/android/camera/storage/ImageSaveRequest;->oldTitle:Ljava/lang/String;

    .line 80
    if-nez v2, :cond_0

    const/4 v2, 0x0

    goto :goto_0

    :cond_0
    new-instance v3, Landroid/location/Location;

    invoke-direct {v3, v2}, Landroid/location/Location;-><init>(Landroid/location/Location;)V

    move-object v2, v3

    :goto_0
    iput-object v2, v0, Lcom/android/camera/storage/ImageSaveRequest;->loc:Landroid/location/Location;

    .line 81
    move v2, p9

    iput v2, v0, Lcom/android/camera/storage/ImageSaveRequest;->width:I

    .line 82
    move v2, p10

    iput v2, v0, Lcom/android/camera/storage/ImageSaveRequest;->height:I

    .line 83
    move-object/from16 v2, p11

    iput-object v2, v0, Lcom/android/camera/storage/ImageSaveRequest;->exif:Lcom/android/gallery3d/exif/ExifInterface;

    .line 84
    move/from16 v2, p12

    iput v2, v0, Lcom/android/camera/storage/ImageSaveRequest;->orientation:I

    .line 85
    move/from16 v2, p13

    iput-boolean v2, v0, Lcom/android/camera/storage/ImageSaveRequest;->isHide:Z

    .line 86
    move/from16 v2, p14

    iput-boolean v2, v0, Lcom/android/camera/storage/ImageSaveRequest;->isMap:Z

    .line 87
    move/from16 v2, p15

    iput-boolean v2, v0, Lcom/android/camera/storage/ImageSaveRequest;->finalImage:Z

    .line 88
    move/from16 v2, p16

    iput-boolean v2, v0, Lcom/android/camera/storage/ImageSaveRequest;->mirror:Z

    .line 89
    move/from16 v2, p17

    iput-boolean v2, v0, Lcom/android/camera/storage/ImageSaveRequest;->isParallelProcess:Z

    .line 90
    move-object/from16 v2, p18

    iput-object v2, v0, Lcom/android/camera/storage/ImageSaveRequest;->algorithmName:Ljava/lang/String;

    .line 91
    if-nez v1, :cond_1

    const/4 v1, 0x0

    goto :goto_1

    :cond_1
    array-length v1, v1

    :goto_1
    iput v1, v0, Lcom/android/camera/storage/ImageSaveRequest;->size:I

    .line 92
    move-object/from16 v1, p19

    iput-object v1, v0, Lcom/android/camera/storage/ImageSaveRequest;->info:Lcom/xiaomi/camera/core/PictureInfo;

    .line 93
    move/from16 v1, p20

    iput v1, v0, Lcom/android/camera/storage/ImageSaveRequest;->previewThumbnailHash:I

    .line 94
    return-void
.end method


# virtual methods
.method public getSize()I
    .locals 1

    .line 152
    iget v0, p0, Lcom/android/camera/storage/ImageSaveRequest;->size:I

    return v0
.end method

.method public isFinal()Z
    .locals 1

    .line 157
    iget-boolean v0, p0, Lcom/android/camera/storage/ImageSaveRequest;->finalImage:Z

    return v0
.end method

.method public onFinish()V
    .locals 2

    .line 162
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera/storage/ImageSaveRequest;->data:[B

    .line 163
    iget-object v0, p0, Lcom/android/camera/storage/ImageSaveRequest;->saverCallback:Lcom/android/camera/storage/SaverCallback;

    invoke-virtual {p0}, Lcom/android/camera/storage/ImageSaveRequest;->getSize()I

    move-result v1

    invoke-interface {v0, v1}, Lcom/android/camera/storage/SaverCallback;->onSaveFinish(I)V

    .line 164
    return-void
.end method

.method public run()V
    .locals 0

    .line 98
    invoke-virtual {p0}, Lcom/android/camera/storage/ImageSaveRequest;->save()V

    .line 99
    invoke-virtual {p0}, Lcom/android/camera/storage/ImageSaveRequest;->onFinish()V

    .line 100
    return-void
.end method

.method public save()V
    .locals 19

    .line 104
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/android/camera/storage/ImageSaveRequest;->uri:Landroid/net/Uri;

    if-eqz v1, :cond_0

    .line 105
    iget-object v2, v0, Lcom/android/camera/storage/ImageSaveRequest;->context:Landroid/content/Context;

    iget-object v3, v0, Lcom/android/camera/storage/ImageSaveRequest;->data:[B

    iget-object v4, v0, Lcom/android/camera/storage/ImageSaveRequest;->exif:Lcom/android/gallery3d/exif/ExifInterface;

    iget-object v5, v0, Lcom/android/camera/storage/ImageSaveRequest;->uri:Landroid/net/Uri;

    iget-object v6, v0, Lcom/android/camera/storage/ImageSaveRequest;->title:Ljava/lang/String;

    iget-object v7, v0, Lcom/android/camera/storage/ImageSaveRequest;->loc:Landroid/location/Location;

    iget v8, v0, Lcom/android/camera/storage/ImageSaveRequest;->orientation:I

    iget v9, v0, Lcom/android/camera/storage/ImageSaveRequest;->width:I

    iget v10, v0, Lcom/android/camera/storage/ImageSaveRequest;->height:I

    iget-object v11, v0, Lcom/android/camera/storage/ImageSaveRequest;->oldTitle:Ljava/lang/String;

    iget-boolean v12, v0, Lcom/android/camera/storage/ImageSaveRequest;->mirror:Z

    iget-boolean v13, v0, Lcom/android/camera/storage/ImageSaveRequest;->isParallelProcess:Z

    iget-object v14, v0, Lcom/android/camera/storage/ImageSaveRequest;->algorithmName:Ljava/lang/String;

    iget-object v15, v0, Lcom/android/camera/storage/ImageSaveRequest;->info:Lcom/xiaomi/camera/core/PictureInfo;

    invoke-static/range {v2 .. v15}, Lcom/android/camera/storage/Storage;->updateImageWithExtraExif(Landroid/content/Context;[BLcom/android/gallery3d/exif/ExifInterface;Landroid/net/Uri;Ljava/lang/String;Landroid/location/Location;IIILjava/lang/String;ZZLjava/lang/String;Lcom/xiaomi/camera/core/PictureInfo;)Z

    goto :goto_0

    .line 108
    :cond_0
    iget-object v1, v0, Lcom/android/camera/storage/ImageSaveRequest;->data:[B

    if-eqz v1, :cond_1

    .line 109
    iget-object v2, v0, Lcom/android/camera/storage/ImageSaveRequest;->context:Landroid/content/Context;

    iget-object v3, v0, Lcom/android/camera/storage/ImageSaveRequest;->title:Ljava/lang/String;

    iget-wide v4, v0, Lcom/android/camera/storage/ImageSaveRequest;->date:J

    iget-object v6, v0, Lcom/android/camera/storage/ImageSaveRequest;->loc:Landroid/location/Location;

    iget v7, v0, Lcom/android/camera/storage/ImageSaveRequest;->orientation:I

    iget-object v8, v0, Lcom/android/camera/storage/ImageSaveRequest;->data:[B

    iget v9, v0, Lcom/android/camera/storage/ImageSaveRequest;->width:I

    iget v10, v0, Lcom/android/camera/storage/ImageSaveRequest;->height:I

    const/4 v11, 0x0

    iget-boolean v12, v0, Lcom/android/camera/storage/ImageSaveRequest;->isHide:Z

    iget-boolean v13, v0, Lcom/android/camera/storage/ImageSaveRequest;->isMap:Z

    iget-boolean v15, v0, Lcom/android/camera/storage/ImageSaveRequest;->isParallelProcess:Z

    iget-object v1, v0, Lcom/android/camera/storage/ImageSaveRequest;->algorithmName:Ljava/lang/String;

    iget-object v14, v0, Lcom/android/camera/storage/ImageSaveRequest;->info:Lcom/xiaomi/camera/core/PictureInfo;

    move-object/from16 v17, v14

    const/4 v14, 0x0

    move-object/from16 v16, v1

    invoke-static/range {v2 .. v17}, Lcom/android/camera/storage/Storage;->addImage(Landroid/content/Context;Ljava/lang/String;JLandroid/location/Location;I[BIIZZZZZLjava/lang/String;Lcom/xiaomi/camera/core/PictureInfo;)Landroid/net/Uri;

    move-result-object v1

    iput-object v1, v0, Lcom/android/camera/storage/ImageSaveRequest;->uri:Landroid/net/Uri;

    .line 115
    :cond_1
    :goto_0
    invoke-static {}, Lcom/android/camera/storage/Storage;->getAvailableSpace()J

    .line 116
    iget-boolean v1, v0, Lcom/android/camera/storage/ImageSaveRequest;->needThumbnail:Z

    const/4 v2, 0x1

    if-eqz v1, :cond_2

    iget-object v1, v0, Lcom/android/camera/storage/ImageSaveRequest;->saverCallback:Lcom/android/camera/storage/SaverCallback;

    invoke-virtual/range {p0 .. p0}, Lcom/android/camera/storage/ImageSaveRequest;->isFinal()Z

    move-result v3

    invoke-interface {v1, v3}, Lcom/android/camera/storage/SaverCallback;->needThumbnail(Z)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 117
    move v1, v2

    goto :goto_1

    .line 116
    :cond_2
    const/4 v1, 0x0

    .line 117
    :goto_1
    iget-object v3, v0, Lcom/android/camera/storage/ImageSaveRequest;->uri:Landroid/net/Uri;

    if-eqz v3, :cond_6

    .line 118
    if-eqz v1, :cond_5

    .line 121
    iget v1, v0, Lcom/android/camera/storage/ImageSaveRequest;->width:I

    int-to-double v3, v1

    iget v1, v0, Lcom/android/camera/storage/ImageSaveRequest;->height:I

    int-to-double v5, v1

    invoke-static {v3, v4, v5, v6}, Ljava/lang/Math;->max(DD)D

    move-result-wide v3

    const-wide/high16 v5, 0x4080000000000000L    # 512.0

    div-double/2addr v3, v5

    invoke-static {v3, v4}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v3

    double-to-int v1, v3

    .line 122
    invoke-static {v1}, Ljava/lang/Integer;->highestOneBit(I)I

    move-result v1

    .line 123
    const-string v3, "ImageSaveRequest"

    const-string v4, "image save try to create thumbnail"

    invoke-static {v3, v4}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 124
    iget-boolean v3, v0, Lcom/android/camera/storage/ImageSaveRequest;->isMap:Z

    if-eqz v3, :cond_3

    .line 125
    iget-object v1, v0, Lcom/android/camera/storage/ImageSaveRequest;->context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    iget-object v3, v0, Lcom/android/camera/storage/ImageSaveRequest;->uri:Landroid/net/Uri;

    iget-boolean v4, v0, Lcom/android/camera/storage/ImageSaveRequest;->mirror:Z

    invoke-static {v1, v3, v4}, Lcom/android/camera/Thumbnail;->createThumbnailFromUri(Landroid/content/ContentResolver;Landroid/net/Uri;Z)Lcom/android/camera/Thumbnail;

    move-result-object v1

    goto :goto_2

    .line 126
    :cond_3
    iget-object v3, v0, Lcom/android/camera/storage/ImageSaveRequest;->data:[B

    iget v4, v0, Lcom/android/camera/storage/ImageSaveRequest;->orientation:I

    iget-object v5, v0, Lcom/android/camera/storage/ImageSaveRequest;->uri:Landroid/net/Uri;

    iget-boolean v6, v0, Lcom/android/camera/storage/ImageSaveRequest;->mirror:Z

    invoke-static {v3, v4, v1, v5, v6}, Lcom/android/camera/Thumbnail;->createThumbnail([BIILandroid/net/Uri;Z)Lcom/android/camera/Thumbnail;

    move-result-object v1

    .line 127
    :goto_2
    if-eqz v1, :cond_4

    .line 128
    iget-object v3, v0, Lcom/android/camera/storage/ImageSaveRequest;->saverCallback:Lcom/android/camera/storage/SaverCallback;

    invoke-interface {v3, v1, v2}, Lcom/android/camera/storage/SaverCallback;->postUpdateThumbnail(Lcom/android/camera/Thumbnail;Z)V

    goto :goto_3

    .line 130
    :cond_4
    iget-object v1, v0, Lcom/android/camera/storage/ImageSaveRequest;->saverCallback:Lcom/android/camera/storage/SaverCallback;

    invoke-interface {v1}, Lcom/android/camera/storage/SaverCallback;->postHideThumbnailProgressing()V

    .line 132
    :goto_3
    goto :goto_4

    .line 133
    :cond_5
    iget-object v1, v0, Lcom/android/camera/storage/ImageSaveRequest;->saverCallback:Lcom/android/camera/storage/SaverCallback;

    iget v2, v0, Lcom/android/camera/storage/ImageSaveRequest;->previewThumbnailHash:I

    iget-object v3, v0, Lcom/android/camera/storage/ImageSaveRequest;->uri:Landroid/net/Uri;

    invoke-interface {v1, v2, v3}, Lcom/android/camera/storage/SaverCallback;->updatePreviewThumbnailUri(ILandroid/net/Uri;)V

    .line 136
    :goto_4
    iget-object v1, v0, Lcom/android/camera/storage/ImageSaveRequest;->saverCallback:Lcom/android/camera/storage/SaverCallback;

    iget-object v2, v0, Lcom/android/camera/storage/ImageSaveRequest;->uri:Landroid/net/Uri;

    iget-object v0, v0, Lcom/android/camera/storage/ImageSaveRequest;->title:Ljava/lang/String;

    const/16 v3, 0x1f

    invoke-interface {v1, v2, v0, v3}, Lcom/android/camera/storage/SaverCallback;->notifyNewMediaData(Landroid/net/Uri;Ljava/lang/String;I)V

    .line 137
    const-string v0, "ImageSaveRequest"

    const-string v1, "image save finished"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_5

    .line 140
    :cond_6
    const-string v2, "ImageSaveRequest"

    const-string v3, "image save failed"

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 141
    if-eqz v1, :cond_7

    .line 142
    iget-object v0, v0, Lcom/android/camera/storage/ImageSaveRequest;->saverCallback:Lcom/android/camera/storage/SaverCallback;

    invoke-interface {v0}, Lcom/android/camera/storage/SaverCallback;->postHideThumbnailProgressing()V

    goto :goto_5

    .line 144
    :cond_7
    const-string v1, "ImageSaveRequest"

    const-string v2, "set mWaitingForUri is false"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 145
    iget-object v1, v0, Lcom/android/camera/storage/ImageSaveRequest;->saverCallback:Lcom/android/camera/storage/SaverCallback;

    iget v0, v0, Lcom/android/camera/storage/ImageSaveRequest;->previewThumbnailHash:I

    const/4 v2, 0x0

    invoke-interface {v1, v0, v2}, Lcom/android/camera/storage/SaverCallback;->updatePreviewThumbnailUri(ILandroid/net/Uri;)V

    .line 148
    :goto_5
    return-void
.end method

.method public setContextAndCallback(Landroid/content/Context;Lcom/android/camera/storage/SaverCallback;)V
    .locals 0

    .line 41
    iput-object p1, p0, Lcom/android/camera/storage/ImageSaveRequest;->context:Landroid/content/Context;

    .line 42
    iput-object p2, p0, Lcom/android/camera/storage/ImageSaveRequest;->saverCallback:Lcom/android/camera/storage/SaverCallback;

    .line 43
    return-void
.end method
