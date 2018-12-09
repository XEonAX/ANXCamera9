.class Lcom/xiaomi/camera/imagecodec/JpegEncoder$4;
.super Ljava/lang/Object;
.source "JpegEncoder.java"

# interfaces
.implements Landroid/media/ImageReader$OnImageAvailableListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/xiaomi/camera/imagecodec/JpegEncoder;->initReprocessImageReader(II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/xiaomi/camera/imagecodec/JpegEncoder;


# direct methods
.method constructor <init>(Lcom/xiaomi/camera/imagecodec/JpegEncoder;)V
    .locals 0

    .line 527
    iput-object p1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder$4;->this$0:Lcom/xiaomi/camera/imagecodec/JpegEncoder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onImageAvailable(Landroid/media/ImageReader;)V
    .locals 8

    .line 530
    invoke-virtual {p1}, Landroid/media/ImageReader;->acquireNextImage()Landroid/media/Image;

    move-result-object p1

    .line 531
    invoke-static {}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->access$000()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onImageAvailable: received reprocessed image"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 533
    invoke-static {p1}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->access$1100(Landroid/media/Image;)[B

    move-result-object v0

    .line 534
    invoke-virtual {p1}, Landroid/media/Image;->close()V

    .line 535
    iget-object p1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder$4;->this$0:Lcom/xiaomi/camera/imagecodec/JpegEncoder;

    invoke-static {p1}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->access$1200(Lcom/xiaomi/camera/imagecodec/JpegEncoder;)Ljava/lang/Object;

    move-result-object p1

    monitor-enter p1

    .line 537
    :try_start_0
    iget-object v1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder$4;->this$0:Lcom/xiaomi/camera/imagecodec/JpegEncoder;

    invoke-static {v1}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->access$1300(Lcom/xiaomi/camera/imagecodec/JpegEncoder;)Lcom/xiaomi/camera/imagecodec/ReprocessData;

    move-result-object v1

    invoke-virtual {v1}, Lcom/xiaomi/camera/imagecodec/ReprocessData;->getResultListener()Lcom/xiaomi/camera/imagecodec/ReprocessData$OnJpegAvailableListener;

    move-result-object v1

    iget-object v2, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder$4;->this$0:Lcom/xiaomi/camera/imagecodec/JpegEncoder;

    .line 538
    invoke-static {v2}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->access$1300(Lcom/xiaomi/camera/imagecodec/JpegEncoder;)Lcom/xiaomi/camera/imagecodec/ReprocessData;

    move-result-object v2

    invoke-virtual {v2}, Lcom/xiaomi/camera/imagecodec/ReprocessData;->getImageTag()Ljava/lang/String;

    move-result-object v2

    .line 537
    invoke-interface {v1, v0, v2}, Lcom/xiaomi/camera/imagecodec/ReprocessData$OnJpegAvailableListener;->onJpegAvailable([BLjava/lang/String;)V

    .line 539
    invoke-static {}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->access$000()Ljava/lang/String;

    move-result-object v0

    const-string v1, "jpeg return for %s. cost=%d"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-object v4, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder$4;->this$0:Lcom/xiaomi/camera/imagecodec/JpegEncoder;

    .line 540
    invoke-static {v4}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->access$1300(Lcom/xiaomi/camera/imagecodec/JpegEncoder;)Lcom/xiaomi/camera/imagecodec/ReprocessData;

    move-result-object v4

    invoke-virtual {v4}, Lcom/xiaomi/camera/imagecodec/ReprocessData;->getImageTag()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x1

    .line 541
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    iget-object v6, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder$4;->this$0:Lcom/xiaomi/camera/imagecodec/JpegEncoder;

    invoke-static {v6}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->access$1400(Lcom/xiaomi/camera/imagecodec/JpegEncoder;)J

    move-result-wide v6

    sub-long/2addr v4, v6

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    aput-object v4, v2, v3

    .line 539
    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 542
    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder$4;->this$0:Lcom/xiaomi/camera/imagecodec/JpegEncoder;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->access$1302(Lcom/xiaomi/camera/imagecodec/JpegEncoder;Lcom/xiaomi/camera/imagecodec/ReprocessData;)Lcom/xiaomi/camera/imagecodec/ReprocessData;

    .line 543
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 544
    iget-object p1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder$4;->this$0:Lcom/xiaomi/camera/imagecodec/JpegEncoder;

    invoke-static {p1}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->access$700(Lcom/xiaomi/camera/imagecodec/JpegEncoder;)V

    .line 545
    return-void

    .line 543
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method
