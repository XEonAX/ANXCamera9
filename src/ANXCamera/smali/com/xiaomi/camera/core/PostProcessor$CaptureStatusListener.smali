.class public Lcom/xiaomi/camera/core/PostProcessor$CaptureStatusListener;
.super Ljava/lang/Object;
.source "PostProcessor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/xiaomi/camera/core/PostProcessor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "CaptureStatusListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/xiaomi/camera/core/PostProcessor;


# direct methods
.method public constructor <init>(Lcom/xiaomi/camera/core/PostProcessor;)V
    .locals 0

    .line 100
    iput-object p1, p0, Lcom/xiaomi/camera/core/PostProcessor$CaptureStatusListener;->this$0:Lcom/xiaomi/camera/core/PostProcessor;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCaptureCompleted(Lcom/xiaomi/protocol/ICustomCaptureResult;Z)V
    .locals 4

    .line 114
    invoke-static {}, Lcom/xiaomi/camera/core/PostProcessor;->access$000()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[0] onCaptureCompleted: timestamp = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/xiaomi/protocol/ICustomCaptureResult;->getTimeStamp()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 115
    invoke-static {}, Lcom/xiaomi/camera/core/ParallelDataZipper;->getInstance()Lcom/xiaomi/camera/core/ParallelDataZipper;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/xiaomi/camera/core/ParallelDataZipper;->join(Lcom/xiaomi/protocol/ICustomCaptureResult;Z)V

    .line 116
    return-void
.end method

.method public onCaptureFailed(JI)V
    .locals 3

    .line 119
    invoke-static {}, Lcom/xiaomi/camera/core/PostProcessor;->access$000()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[0] onCaptureFailed: reason = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-static {v0, p3}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 120
    iget-object p3, p0, Lcom/xiaomi/camera/core/PostProcessor$CaptureStatusListener;->this$0:Lcom/xiaomi/camera/core/PostProcessor;

    invoke-static {p3}, Lcom/xiaomi/camera/core/PostProcessor;->access$100(Lcom/xiaomi/camera/core/PostProcessor;)Ljava/util/concurrent/ConcurrentHashMap;

    move-result-object p3

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-virtual {p3, p1}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 121
    return-void
.end method

.method public onCaptureStarted(Lcom/xiaomi/camera/core/ParallelTaskData;)V
    .locals 5
    .param p1    # Lcom/xiaomi/camera/core/ParallelTaskData;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 102
    invoke-virtual {p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getTimestamp()J

    move-result-wide v0

    .line 103
    invoke-static {}, Lcom/xiaomi/camera/core/PostProcessor;->access$000()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "[0] onCaptureStarted: timestamp = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 104
    iget-object v2, p0, Lcom/xiaomi/camera/core/PostProcessor$CaptureStatusListener;->this$0:Lcom/xiaomi/camera/core/PostProcessor;

    invoke-static {v2}, Lcom/xiaomi/camera/core/PostProcessor;->access$100(Lcom/xiaomi/camera/core/PostProcessor;)Ljava/util/concurrent/ConcurrentHashMap;

    move-result-object v2

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v2, v0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 106
    invoke-virtual {p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getAlgoType()I

    move-result v0

    .line 107
    iget-object v1, p0, Lcom/xiaomi/camera/core/PostProcessor$CaptureStatusListener;->this$0:Lcom/xiaomi/camera/core/PostProcessor;

    invoke-static {v1}, Lcom/xiaomi/camera/core/PostProcessor;->access$200(Lcom/xiaomi/camera/core/PostProcessor;)Lcom/xiaomi/camera/core/ImageProcessor;

    move-result-object v1

    instance-of v1, v1, Lcom/xiaomi/camera/core/DualCameraProcessor;

    if-eqz v1, :cond_0

    const/4 v1, 0x2

    goto :goto_0

    :cond_0
    const/4 v1, 0x1

    .line 108
    :goto_0
    invoke-virtual {p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getBurstNum()I

    move-result p1

    .line 109
    iget-object v2, p0, Lcom/xiaomi/camera/core/PostProcessor$CaptureStatusListener;->this$0:Lcom/xiaomi/camera/core/PostProcessor;

    invoke-static {v2, v0}, Lcom/xiaomi/camera/core/PostProcessor;->access$302(Lcom/xiaomi/camera/core/PostProcessor;I)I

    .line 110
    invoke-static {}, Lcom/xiaomi/camera/core/ParallelDataZipper;->getInstance()Lcom/xiaomi/camera/core/ParallelDataZipper;

    move-result-object v2

    iget-object v3, p0, Lcom/xiaomi/camera/core/PostProcessor$CaptureStatusListener;->this$0:Lcom/xiaomi/camera/core/PostProcessor;

    invoke-static {v3}, Lcom/xiaomi/camera/core/PostProcessor;->access$400(Lcom/xiaomi/camera/core/PostProcessor;)Lcom/xiaomi/camera/core/ParallelDataZipper$DataListener;

    move-result-object v3

    invoke-virtual {v2, v0, v1, p1, v3}, Lcom/xiaomi/camera/core/ParallelDataZipper;->prepare(IIILcom/xiaomi/camera/core/ParallelDataZipper$DataListener;)V

    .line 111
    return-void
.end method
