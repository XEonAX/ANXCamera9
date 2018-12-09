.class public Lcom/android/camera/storage/ImageSaveRequest;
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

.field private mEffectProcessor:Lcom/android/camera/effect/renders/SnapshotEffectRender;

.field private mirror:Z

.field private needThumbnail:Z

.field public oldTitle:Ljava/lang/String;

.field private orientation:I

.field private saverCallback:Lcom/android/camera/storage/SaverCallback;

.field private size:I

.field public title:Ljava/lang/String;

.field private uri:Landroid/net/Uri;

.field private width:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    return-void
.end method

.method public constructor <init>([BZLjava/lang/String;Ljava/lang/String;JLandroid/net/Uri;Landroid/location/Location;IILcom/android/gallery3d/exif/ExifInterface;IZZZZZLjava/lang/String;Lcom/xiaomi/camera/core/PictureInfo;)V
    .locals 5

    move-object v0, p0

    move-object v1, p1

    move-object v2, p8

    .line 147
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 148
    iput-object v1, v0, Lcom/android/camera/storage/ImageSaveRequest;->data:[B

    .line 149
    move v3, p2

    iput-boolean v3, v0, Lcom/android/camera/storage/ImageSaveRequest;->needThumbnail:Z

    .line 150
    move-wide v3, p5

    iput-wide v3, v0, Lcom/android/camera/storage/ImageSaveRequest;->date:J

    .line 151
    move-object v3, p7

    iput-object v3, v0, Lcom/android/camera/storage/ImageSaveRequest;->uri:Landroid/net/Uri;

    .line 152
    move-object v3, p3

    iput-object v3, v0, Lcom/android/camera/storage/ImageSaveRequest;->title:Ljava/lang/String;

    .line 153
    move-object v3, p4

    iput-object v3, v0, Lcom/android/camera/storage/ImageSaveRequest;->oldTitle:Ljava/lang/String;

    .line 154
    if-nez v2, :cond_0

    const/4 v2, 0x0

    goto :goto_0

    :cond_0
    new-instance v3, Landroid/location/Location;

    invoke-direct {v3, v2}, Landroid/location/Location;-><init>(Landroid/location/Location;)V

    move-object v2, v3

    :goto_0
    iput-object v2, v0, Lcom/android/camera/storage/ImageSaveRequest;->loc:Landroid/location/Location;

    .line 155
    move v2, p9

    iput v2, v0, Lcom/android/camera/storage/ImageSaveRequest;->width:I

    .line 156
    move v2, p10

    iput v2, v0, Lcom/android/camera/storage/ImageSaveRequest;->height:I

    .line 157
    move-object/from16 v2, p11

    iput-object v2, v0, Lcom/android/camera/storage/ImageSaveRequest;->exif:Lcom/android/gallery3d/exif/ExifInterface;

    .line 158
    move/from16 v2, p12

    iput v2, v0, Lcom/android/camera/storage/ImageSaveRequest;->orientation:I

    .line 159
    move/from16 v2, p13

    iput-boolean v2, v0, Lcom/android/camera/storage/ImageSaveRequest;->isHide:Z

    .line 160
    move/from16 v2, p14

    iput-boolean v2, v0, Lcom/android/camera/storage/ImageSaveRequest;->isMap:Z

    .line 161
    move/from16 v2, p15

    iput-boolean v2, v0, Lcom/android/camera/storage/ImageSaveRequest;->finalImage:Z

    .line 162
    move/from16 v2, p16

    iput-boolean v2, v0, Lcom/android/camera/storage/ImageSaveRequest;->mirror:Z

    .line 163
    move/from16 v2, p17

    iput-boolean v2, v0, Lcom/android/camera/storage/ImageSaveRequest;->isParallelProcess:Z

    .line 164
    move-object/from16 v2, p18

    iput-object v2, v0, Lcom/android/camera/storage/ImageSaveRequest;->algorithmName:Ljava/lang/String;

    .line 165
    if-nez v1, :cond_1

    const/4 v1, 0x0

    goto :goto_1

    :cond_1
    array-length v1, v1

    :goto_1
    iput v1, v0, Lcom/android/camera/storage/ImageSaveRequest;->size:I

    .line 166
    move-object/from16 v1, p19

    iput-object v1, v0, Lcom/android/camera/storage/ImageSaveRequest;->info:Lcom/xiaomi/camera/core/PictureInfo;

    .line 167
    return-void
.end method


# virtual methods
.method public fillCommonParameter()V
    .locals 0

    .line 53
    return-void
.end method

.method public getSize()I
    .locals 1

    .line 109
    iget v0, p0, Lcom/android/camera/storage/ImageSaveRequest;->size:I

    return v0
.end method

.method public isFinal()Z
    .locals 1

    .line 114
    iget-boolean v0, p0, Lcom/android/camera/storage/ImageSaveRequest;->finalImage:Z

    return v0
.end method

.method public onFinish()V
    .locals 2

    .line 119
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera/storage/ImageSaveRequest;->data:[B

    .line 120
    iget-object v0, p0, Lcom/android/camera/storage/ImageSaveRequest;->saverCallback:Lcom/android/camera/storage/SaverCallback;

    invoke-virtual {p0}, Lcom/android/camera/storage/ImageSaveRequest;->getSize()I

    move-result v1

    invoke-interface {v0, v1}, Lcom/android/camera/storage/SaverCallback;->onSaveFinish(I)V

    .line 121
    return-void
.end method

.method public run()V
    .locals 0

    .line 57
    invoke-virtual {p0}, Lcom/android/camera/storage/ImageSaveRequest;->save()V

    .line 58
    invoke-virtual {p0}, Lcom/android/camera/storage/ImageSaveRequest;->onFinish()V

    .line 59
    return-void
.end method

.method public save()V
    .locals 19

    .line 63
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/android/camera/storage/ImageSaveRequest;->uri:Landroid/net/Uri;

    if-eqz v1, :cond_0

    .line 64
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

    .line 67
    :cond_0
    iget-object v1, v0, Lcom/android/camera/storage/ImageSaveRequest;->data:[B

    if-eqz v1, :cond_1

    .line 68
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

    .line 74
    :cond_1
    :goto_0
    invoke-static {}, Lcom/android/camera/storage/Storage;->getAvailableSpace()J

    .line 75
    iget-boolean v1, v0, Lcom/android/camera/storage/ImageSaveRequest;->needThumbnail:Z

    const/4 v2, 0x1

    if-eqz v1, :cond_2

    iget-object v1, v0, Lcom/android/camera/storage/ImageSaveRequest;->saverCallback:Lcom/android/camera/storage/SaverCallback;

    invoke-virtual/range {p0 .. p0}, Lcom/android/camera/storage/ImageSaveRequest;->isFinal()Z

    move-result v3

    invoke-interface {v1, v3}, Lcom/android/camera/storage/SaverCallback;->needThumbnail(Z)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 76
    move v1, v2

    goto :goto_1

    .line 75
    :cond_2
    const/4 v1, 0x0

    .line 76
    :goto_1
    iget-object v3, v0, Lcom/android/camera/storage/ImageSaveRequest;->uri:Landroid/net/Uri;

    if-eqz v3, :cond_6

    .line 77
    if-eqz v1, :cond_5

    .line 80
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

    .line 81
    invoke-static {v1}, Ljava/lang/Integer;->highestOneBit(I)I

    move-result v1

    .line 82
    iget-boolean v3, v0, Lcom/android/camera/storage/ImageSaveRequest;->isMap:Z

    if-eqz v3, :cond_3

    .line 83
    iget-object v1, v0, Lcom/android/camera/storage/ImageSaveRequest;->context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    iget-object v3, v0, Lcom/android/camera/storage/ImageSaveRequest;->uri:Landroid/net/Uri;

    iget-boolean v4, v0, Lcom/android/camera/storage/ImageSaveRequest;->mirror:Z

    invoke-static {v1, v3, v4}, Lcom/android/camera/Thumbnail;->createThumbnailFromUri(Landroid/content/ContentResolver;Landroid/net/Uri;Z)Lcom/android/camera/Thumbnail;

    move-result-object v1

    goto :goto_2

    .line 84
    :cond_3
    iget-object v3, v0, Lcom/android/camera/storage/ImageSaveRequest;->data:[B

    iget v4, v0, Lcom/android/camera/storage/ImageSaveRequest;->orientation:I

    iget-object v5, v0, Lcom/android/camera/storage/ImageSaveRequest;->uri:Landroid/net/Uri;

    iget-boolean v6, v0, Lcom/android/camera/storage/ImageSaveRequest;->mirror:Z

    invoke-static {v3, v4, v1, v5, v6}, Lcom/android/camera/Thumbnail;->createThumbnail([BIILandroid/net/Uri;Z)Lcom/android/camera/Thumbnail;

    move-result-object v1

    .line 85
    :goto_2
    if-eqz v1, :cond_4

    .line 86
    iget-object v3, v0, Lcom/android/camera/storage/ImageSaveRequest;->saverCallback:Lcom/android/camera/storage/SaverCallback;

    invoke-interface {v3, v1, v2}, Lcom/android/camera/storage/SaverCallback;->postUpdateThumbnail(Lcom/android/camera/Thumbnail;Z)V

    goto :goto_3

    .line 88
    :cond_4
    iget-object v1, v0, Lcom/android/camera/storage/ImageSaveRequest;->saverCallback:Lcom/android/camera/storage/SaverCallback;

    invoke-interface {v1}, Lcom/android/camera/storage/SaverCallback;->postHideThumbnailProgressing()V

    .line 90
    :goto_3
    goto :goto_4

    .line 91
    :cond_5
    iget-object v1, v0, Lcom/android/camera/storage/ImageSaveRequest;->saverCallback:Lcom/android/camera/storage/SaverCallback;

    iget-object v2, v0, Lcom/android/camera/storage/ImageSaveRequest;->uri:Landroid/net/Uri;

    invoke-interface {v1, v2}, Lcom/android/camera/storage/SaverCallback;->updatePreviewThumbnailUri(Landroid/net/Uri;)V

    .line 94
    :goto_4
    iget-object v1, v0, Lcom/android/camera/storage/ImageSaveRequest;->saverCallback:Lcom/android/camera/storage/SaverCallback;

    iget-object v2, v0, Lcom/android/camera/storage/ImageSaveRequest;->uri:Landroid/net/Uri;

    invoke-virtual/range {p0 .. p0}, Lcom/android/camera/storage/ImageSaveRequest;->isFinal()Z

    move-result v0

    invoke-interface {v1, v2, v0}, Lcom/android/camera/storage/SaverCallback;->notifyNewImage(Landroid/net/Uri;Z)V

    goto :goto_5

    .line 97
    :cond_6
    const-string v2, "ImageSaveRequest"

    const-string v3, "image save failed"

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 98
    if-eqz v1, :cond_7

    .line 99
    iget-object v0, v0, Lcom/android/camera/storage/ImageSaveRequest;->saverCallback:Lcom/android/camera/storage/SaverCallback;

    invoke-interface {v0}, Lcom/android/camera/storage/SaverCallback;->postHideThumbnailProgressing()V

    goto :goto_5

    .line 101
    :cond_7
    const-string v1, "ImageSaveRequest"

    const-string v2, "set mWaitingForUri is false"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 102
    iget-object v0, v0, Lcom/android/camera/storage/ImageSaveRequest;->saverCallback:Lcom/android/camera/storage/SaverCallback;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Lcom/android/camera/storage/SaverCallback;->updatePreviewThumbnailUri(Landroid/net/Uri;)V

    .line 105
    :goto_5
    return-void
.end method

.method public setContextAndCallback(Landroid/content/Context;Lcom/android/camera/storage/SaverCallback;)V
    .locals 0

    .line 42
    iput-object p1, p0, Lcom/android/camera/storage/ImageSaveRequest;->context:Landroid/content/Context;

    .line 43
    iput-object p2, p0, Lcom/android/camera/storage/ImageSaveRequest;->saverCallback:Lcom/android/camera/storage/SaverCallback;

    .line 44
    return-void
.end method
