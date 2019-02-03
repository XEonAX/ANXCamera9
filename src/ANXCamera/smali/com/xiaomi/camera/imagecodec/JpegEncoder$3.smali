.class Lcom/xiaomi/camera/imagecodec/JpegEncoder$3;
.super Landroid/hardware/camera2/CameraCaptureSession$StateCallback;
.source "JpegEncoder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/xiaomi/camera/imagecodec/JpegEncoder;->createReprocessSession(Landroid/hardware/camera2/params/InputConfiguration;Lcom/xiaomi/camera/imagecodec/OutputConfiguration;Lcom/xiaomi/camera/imagecodec/OutputConfiguration;)V
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

    .line 535
    iput-object p1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder$3;->this$0:Lcom/xiaomi/camera/imagecodec/JpegEncoder;

    invoke-direct {p0}, Landroid/hardware/camera2/CameraCaptureSession$StateCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public onConfigureFailed(Landroid/hardware/camera2/CameraCaptureSession;)V
    .locals 2
    .param p1    # Landroid/hardware/camera2/CameraCaptureSession;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 571
    invoke-static {}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->access$100()Ljava/lang/String;

    move-result-object p1

    const-string v0, "onConfigureFailed"

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 572
    iget-object p1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder$3;->this$0:Lcom/xiaomi/camera/imagecodec/JpegEncoder;

    invoke-static {p1}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->access$300(Lcom/xiaomi/camera/imagecodec/JpegEncoder;)Ljava/lang/Object;

    move-result-object p1

    monitor-enter p1

    .line 573
    :try_start_0
    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder$3;->this$0:Lcom/xiaomi/camera/imagecodec/JpegEncoder;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->access$702(Lcom/xiaomi/camera/imagecodec/JpegEncoder;Z)Z

    .line 574
    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder$3;->this$0:Lcom/xiaomi/camera/imagecodec/JpegEncoder;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->access$602(Lcom/xiaomi/camera/imagecodec/JpegEncoder;Landroid/hardware/camera2/CameraCaptureSession;)Landroid/hardware/camera2/CameraCaptureSession;

    .line 575
    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder$3;->this$0:Lcom/xiaomi/camera/imagecodec/JpegEncoder;

    invoke-static {v0, v1}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->access$1102(Lcom/xiaomi/camera/imagecodec/JpegEncoder;Landroid/media/ImageWriter;)Landroid/media/ImageWriter;

    .line 576
    monitor-exit p1

    .line 577
    return-void

    .line 576
    :catchall_0
    move-exception v0

    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public onConfigured(Landroid/hardware/camera2/CameraCaptureSession;)V
    .locals 9
    .param p1    # Landroid/hardware/camera2/CameraCaptureSession;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 539
    invoke-static {}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->access$100()Ljava/lang/String;

    move-result-object v0

    const-string v1, "onConfigured>>"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 540
    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder$3;->this$0:Lcom/xiaomi/camera/imagecodec/JpegEncoder;

    invoke-static {v0}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->access$300(Lcom/xiaomi/camera/imagecodec/JpegEncoder;)Ljava/lang/Object;

    move-result-object v0

    monitor-enter v0

    .line 542
    :try_start_0
    iget-object v1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder$3;->this$0:Lcom/xiaomi/camera/imagecodec/JpegEncoder;

    invoke-static {v1}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->access$400(Lcom/xiaomi/camera/imagecodec/JpegEncoder;)Landroid/hardware/camera2/CameraDevice;

    move-result-object v1

    const/4 v2, 0x0

    if-nez v1, :cond_0

    .line 543
    invoke-static {}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->access$100()Ljava/lang/String;

    move-result-object p1

    const-string v1, "onConfigured: null camera device"

    invoke-static {p1, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 544
    iget-object p1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder$3;->this$0:Lcom/xiaomi/camera/imagecodec/JpegEncoder;

    invoke-static {p1, v2}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->access$702(Lcom/xiaomi/camera/imagecodec/JpegEncoder;Z)Z

    .line 545
    monitor-exit v0

    return-void

    .line 548
    :cond_0
    iget-object v1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder$3;->this$0:Lcom/xiaomi/camera/imagecodec/JpegEncoder;

    invoke-static {v1, p1}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->access$602(Lcom/xiaomi/camera/imagecodec/JpegEncoder;Landroid/hardware/camera2/CameraCaptureSession;)Landroid/hardware/camera2/CameraCaptureSession;

    .line 549
    iget-object v1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder$3;->this$0:Lcom/xiaomi/camera/imagecodec/JpegEncoder;

    invoke-static {v1}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->access$508(Lcom/xiaomi/camera/imagecodec/JpegEncoder;)I

    .line 550
    invoke-static {p1}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->access$1000(Landroid/hardware/camera2/CameraCaptureSession;)I

    move-result v1

    .line 551
    invoke-static {}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->access$100()Ljava/lang/String;

    move-result-object v3

    const-string v4, "sessionId: %d %d"

    const/4 v5, 0x2

    new-array v6, v5, [Ljava/lang/Object;

    iget-object v7, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder$3;->this$0:Lcom/xiaomi/camera/imagecodec/JpegEncoder;

    invoke-static {v7}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->access$500(Lcom/xiaomi/camera/imagecodec/JpegEncoder;)I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v2

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    const/4 v8, 0x1

    aput-object v7, v6, v8

    invoke-static {v4, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 552
    const/4 v3, -0x1

    if-eq v1, v3, :cond_1

    iget-object v3, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder$3;->this$0:Lcom/xiaomi/camera/imagecodec/JpegEncoder;

    invoke-static {v3}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->access$500(Lcom/xiaomi/camera/imagecodec/JpegEncoder;)I

    move-result v3

    if-eq v3, v1, :cond_1

    .line 553
    invoke-static {}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->access$100()Ljava/lang/String;

    move-result-object v3

    const-string v4, "sessionId: %d->%d"

    new-array v6, v5, [Ljava/lang/Object;

    iget-object v7, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder$3;->this$0:Lcom/xiaomi/camera/imagecodec/JpegEncoder;

    invoke-static {v7}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->access$500(Lcom/xiaomi/camera/imagecodec/JpegEncoder;)I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v2

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v8

    invoke-static {v4, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 554
    iget-object v3, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder$3;->this$0:Lcom/xiaomi/camera/imagecodec/JpegEncoder;

    invoke-static {v3, v1}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->access$502(Lcom/xiaomi/camera/imagecodec/JpegEncoder;I)I

    .line 557
    :cond_1
    iget-object v1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder$3;->this$0:Lcom/xiaomi/camera/imagecodec/JpegEncoder;

    invoke-static {v1}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->access$1100(Lcom/xiaomi/camera/imagecodec/JpegEncoder;)Landroid/media/ImageWriter;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 558
    iget-object v1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder$3;->this$0:Lcom/xiaomi/camera/imagecodec/JpegEncoder;

    invoke-static {v1}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->access$1100(Lcom/xiaomi/camera/imagecodec/JpegEncoder;)Landroid/media/ImageWriter;

    move-result-object v1

    invoke-virtual {v1}, Landroid/media/ImageWriter;->close()V

    .line 560
    :cond_2
    invoke-virtual {p1}, Landroid/hardware/camera2/CameraCaptureSession;->getInputSurface()Landroid/view/Surface;

    move-result-object p1

    .line 561
    iget-object v1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder$3;->this$0:Lcom/xiaomi/camera/imagecodec/JpegEncoder;

    invoke-static {p1, v5}, Landroid/media/ImageWriter;->newInstance(Landroid/view/Surface;I)Landroid/media/ImageWriter;

    move-result-object p1

    invoke-static {v1, p1}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->access$1102(Lcom/xiaomi/camera/imagecodec/JpegEncoder;Landroid/media/ImageWriter;)Landroid/media/ImageWriter;

    .line 563
    iget-object p1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder$3;->this$0:Lcom/xiaomi/camera/imagecodec/JpegEncoder;

    invoke-static {p1, v2}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->access$702(Lcom/xiaomi/camera/imagecodec/JpegEncoder;Z)Z

    .line 564
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 565
    iget-object p1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder$3;->this$0:Lcom/xiaomi/camera/imagecodec/JpegEncoder;

    invoke-static {p1}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->access$800(Lcom/xiaomi/camera/imagecodec/JpegEncoder;)V

    .line 566
    invoke-static {}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->access$100()Ljava/lang/String;

    move-result-object p1

    const-string v0, "onConfigured<<"

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 567
    return-void

    .line 564
    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method
