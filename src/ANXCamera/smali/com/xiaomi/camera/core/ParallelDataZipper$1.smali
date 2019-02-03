.class Lcom/xiaomi/camera/core/ParallelDataZipper$1;
.super Ljava/lang/Object;
.source "ParallelDataZipper.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/xiaomi/camera/core/ParallelDataZipper;->join(Lcom/xiaomi/protocol/ICustomCaptureResult;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/xiaomi/camera/core/ParallelDataZipper;

.field final synthetic val$captureResult:Lcom/xiaomi/protocol/ICustomCaptureResult;

.field final synthetic val$isFirst:Z


# direct methods
.method constructor <init>(Lcom/xiaomi/camera/core/ParallelDataZipper;Lcom/xiaomi/protocol/ICustomCaptureResult;Z)V
    .locals 0

    .line 76
    iput-object p1, p0, Lcom/xiaomi/camera/core/ParallelDataZipper$1;->this$0:Lcom/xiaomi/camera/core/ParallelDataZipper;

    iput-object p2, p0, Lcom/xiaomi/camera/core/ParallelDataZipper$1;->val$captureResult:Lcom/xiaomi/protocol/ICustomCaptureResult;

    iput-boolean p3, p0, Lcom/xiaomi/camera/core/ParallelDataZipper$1;->val$isFirst:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 79
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelDataZipper$1;->val$captureResult:Lcom/xiaomi/protocol/ICustomCaptureResult;

    invoke-virtual {v0}, Lcom/xiaomi/protocol/ICustomCaptureResult;->getTimeStamp()J

    move-result-wide v0

    .line 80
    iget-object v2, p0, Lcom/xiaomi/camera/core/ParallelDataZipper$1;->this$0:Lcom/xiaomi/camera/core/ParallelDataZipper;

    invoke-static {v2}, Lcom/xiaomi/camera/core/ParallelDataZipper;->access$100(Lcom/xiaomi/camera/core/ParallelDataZipper;)Landroid/util/LongSparseArray;

    move-result-object v2

    invoke-virtual {v2, v0, v1}, Landroid/util/LongSparseArray;->get(J)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;

    .line 81
    if-nez v2, :cond_0

    .line 82
    new-instance v2, Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;

    iget-object v3, p0, Lcom/xiaomi/camera/core/ParallelDataZipper$1;->this$0:Lcom/xiaomi/camera/core/ParallelDataZipper;

    invoke-static {v3}, Lcom/xiaomi/camera/core/ParallelDataZipper;->access$200(Lcom/xiaomi/camera/core/ParallelDataZipper;)I

    move-result v3

    invoke-direct {v2, v3}, Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;-><init>(I)V

    .line 83
    iget-object v3, p0, Lcom/xiaomi/camera/core/ParallelDataZipper$1;->this$0:Lcom/xiaomi/camera/core/ParallelDataZipper;

    invoke-static {v3}, Lcom/xiaomi/camera/core/ParallelDataZipper;->access$100(Lcom/xiaomi/camera/core/ParallelDataZipper;)Landroid/util/LongSparseArray;

    move-result-object v3

    invoke-virtual {v3, v0, v1, v2}, Landroid/util/LongSparseArray;->append(JLjava/lang/Object;)V

    goto :goto_0

    .line 84
    :cond_0
    iget-object v3, p0, Lcom/xiaomi/camera/core/ParallelDataZipper$1;->this$0:Lcom/xiaomi/camera/core/ParallelDataZipper;

    invoke-static {v3}, Lcom/xiaomi/camera/core/ParallelDataZipper;->access$200(Lcom/xiaomi/camera/core/ParallelDataZipper;)I

    move-result v3

    invoke-virtual {v2}, Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;->getStreamNum()I

    move-result v4

    if-eq v3, v4, :cond_1

    .line 85
    iget-object v3, p0, Lcom/xiaomi/camera/core/ParallelDataZipper$1;->this$0:Lcom/xiaomi/camera/core/ParallelDataZipper;

    invoke-static {v3}, Lcom/xiaomi/camera/core/ParallelDataZipper;->access$200(Lcom/xiaomi/camera/core/ParallelDataZipper;)I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;->setStreamNum(I)V

    .line 87
    :cond_1
    :goto_0
    iget-object v3, p0, Lcom/xiaomi/camera/core/ParallelDataZipper$1;->val$captureResult:Lcom/xiaomi/protocol/ICustomCaptureResult;

    iget-boolean v4, p0, Lcom/xiaomi/camera/core/ParallelDataZipper$1;->val$isFirst:Z

    invoke-virtual {v2, v3, v4}, Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;->setCaptureResult(Lcom/xiaomi/protocol/ICustomCaptureResult;Z)V

    .line 88
    invoke-virtual {v2}, Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;->isDataReady()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 89
    iget-object v3, p0, Lcom/xiaomi/camera/core/ParallelDataZipper$1;->this$0:Lcom/xiaomi/camera/core/ParallelDataZipper;

    invoke-static {v3}, Lcom/xiaomi/camera/core/ParallelDataZipper;->access$100(Lcom/xiaomi/camera/core/ParallelDataZipper;)Landroid/util/LongSparseArray;

    move-result-object v3

    invoke-virtual {v3, v0, v1}, Landroid/util/LongSparseArray;->remove(J)V

    .line 90
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelDataZipper$1;->this$0:Lcom/xiaomi/camera/core/ParallelDataZipper;

    invoke-static {v0, v2}, Lcom/xiaomi/camera/core/ParallelDataZipper;->access$300(Lcom/xiaomi/camera/core/ParallelDataZipper;Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;)V

    .line 92
    :cond_2
    return-void
.end method
