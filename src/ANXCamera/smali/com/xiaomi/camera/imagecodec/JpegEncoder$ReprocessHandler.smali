.class Lcom/xiaomi/camera/imagecodec/JpegEncoder$ReprocessHandler;
.super Landroid/os/Handler;
.source "JpegEncoder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/xiaomi/camera/imagecodec/JpegEncoder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ReprocessHandler"
.end annotation


# static fields
.field private static final MSG_CLOSE_VT_CAMERA:I = 0x2

.field private static final MSG_REPROCESS_IMG:I = 0x1


# instance fields
.field final synthetic this$0:Lcom/xiaomi/camera/imagecodec/JpegEncoder;


# direct methods
.method constructor <init>(Lcom/xiaomi/camera/imagecodec/JpegEncoder;Landroid/os/Looper;)V
    .locals 0

    .line 695
    iput-object p1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder$ReprocessHandler;->this$0:Lcom/xiaomi/camera/imagecodec/JpegEncoder;

    .line 696
    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 697
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 3

    .line 701
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    .line 719
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    goto :goto_0

    .line 709
    :pswitch_0
    invoke-static {}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->access$100()Ljava/lang/String;

    move-result-object p1

    const-string v0, "recv MSG_CLOSE_VT_CAMERA"

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 710
    iget-object p1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder$ReprocessHandler;->this$0:Lcom/xiaomi/camera/imagecodec/JpegEncoder;

    invoke-static {p1}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->access$300(Lcom/xiaomi/camera/imagecodec/JpegEncoder;)Ljava/lang/Object;

    move-result-object p1

    monitor-enter p1

    .line 711
    :try_start_0
    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder$ReprocessHandler;->this$0:Lcom/xiaomi/camera/imagecodec/JpegEncoder;

    invoke-static {v0}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->access$400(Lcom/xiaomi/camera/imagecodec/JpegEncoder;)Landroid/hardware/camera2/CameraDevice;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 712
    invoke-static {}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->access$100()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "close current VtCamera: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder$ReprocessHandler;->this$0:Lcom/xiaomi/camera/imagecodec/JpegEncoder;

    invoke-static {v2}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->access$400(Lcom/xiaomi/camera/imagecodec/JpegEncoder;)Landroid/hardware/camera2/CameraDevice;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 713
    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder$ReprocessHandler;->this$0:Lcom/xiaomi/camera/imagecodec/JpegEncoder;

    invoke-static {v0}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->access$400(Lcom/xiaomi/camera/imagecodec/JpegEncoder;)Landroid/hardware/camera2/CameraDevice;

    move-result-object v0

    invoke-virtual {v0}, Landroid/hardware/camera2/CameraDevice;->close()V

    .line 714
    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder$ReprocessHandler;->this$0:Lcom/xiaomi/camera/imagecodec/JpegEncoder;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->access$402(Lcom/xiaomi/camera/imagecodec/JpegEncoder;Landroid/hardware/camera2/CameraDevice;)Landroid/hardware/camera2/CameraDevice;

    .line 716
    :cond_0
    monitor-exit p1

    .line 717
    goto :goto_0

    .line 716
    :catchall_0
    move-exception v0

    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    .line 703
    :pswitch_1
    invoke-static {}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->access$100()Ljava/lang/String;

    move-result-object p1

    const-string v0, "recv MSG_REPROCESS_IMG"

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 704
    iget-object p1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder$ReprocessHandler;->this$0:Lcom/xiaomi/camera/imagecodec/JpegEncoder;

    invoke-static {p1}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->access$1600(Lcom/xiaomi/camera/imagecodec/JpegEncoder;)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 705
    iget-object p1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder$ReprocessHandler;->this$0:Lcom/xiaomi/camera/imagecodec/JpegEncoder;

    invoke-static {p1}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->access$1700(Lcom/xiaomi/camera/imagecodec/JpegEncoder;)V

    .line 721
    :cond_1
    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
