.class Lcom/android/zxing/QRCodeManager$1;
.super Ljava/lang/Object;
.source "QRCodeManager.java"

# interfaces
.implements Lcom/android/camera2/Camera2Proxy$PreviewCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/zxing/QRCodeManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private mLastDecodeTime:J

.field final synthetic this$0:Lcom/android/zxing/QRCodeManager;


# direct methods
.method constructor <init>(Lcom/android/zxing/QRCodeManager;)V
    .locals 0

    .line 68
    iput-object p1, p0, Lcom/android/zxing/QRCodeManager$1;->this$0:Lcom/android/zxing/QRCodeManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPreviewFrame(Landroid/media/Image;Lcom/android/camera2/Camera2Proxy;)V
    .locals 6

    .line 73
    iget-object p2, p0, Lcom/android/zxing/QRCodeManager$1;->this$0:Lcom/android/zxing/QRCodeManager;

    invoke-static {p2}, Lcom/android/zxing/QRCodeManager;->access$000(Lcom/android/zxing/QRCodeManager;)Z

    move-result p2

    if-nez p2, :cond_0

    .line 74
    return-void

    .line 76
    :cond_0
    iget-object p2, p0, Lcom/android/zxing/QRCodeManager$1;->this$0:Lcom/android/zxing/QRCodeManager;

    invoke-static {p2}, Lcom/android/zxing/QRCodeManager;->access$100(Lcom/android/zxing/QRCodeManager;)Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object p2

    invoke-virtual {p2}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result p2

    const/16 v0, 0xf

    if-lt p2, v0, :cond_1

    .line 77
    return-void

    .line 79
    :cond_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 80
    iget-wide v2, p0, Lcom/android/zxing/QRCodeManager$1;->mLastDecodeTime:J

    sub-long v2, v0, v2

    const-wide/16 v4, 0x3e8

    cmp-long p2, v2, v4

    if-gez p2, :cond_2

    .line 81
    return-void

    .line 83
    :cond_2
    iput-wide v0, p0, Lcom/android/zxing/QRCodeManager$1;->mLastDecodeTime:J

    .line 84
    iget-object p2, p0, Lcom/android/zxing/QRCodeManager$1;->this$0:Lcom/android/zxing/QRCodeManager;

    invoke-static {p2}, Lcom/android/zxing/QRCodeManager;->access$100(Lcom/android/zxing/QRCodeManager;)Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object p2

    invoke-virtual {p2}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    .line 85
    const-string p2, "QRCodeManager"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "preview frame buffer received... mDecodingCount = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/android/zxing/QRCodeManager$1;->this$0:Lcom/android/zxing/QRCodeManager;

    invoke-static {v1}, Lcom/android/zxing/QRCodeManager;->access$100(Lcom/android/zxing/QRCodeManager;)Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p2, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 86
    iget-object p2, p0, Lcom/android/zxing/QRCodeManager$1;->this$0:Lcom/android/zxing/QRCodeManager;

    invoke-static {p2}, Lcom/android/zxing/QRCodeManager;->access$200(Lcom/android/zxing/QRCodeManager;)Lio/reactivex/FlowableEmitter;

    move-result-object p2

    if-eqz p2, :cond_3

    .line 87
    iget-object p2, p0, Lcom/android/zxing/QRCodeManager$1;->this$0:Lcom/android/zxing/QRCodeManager;

    invoke-static {p2}, Lcom/android/zxing/QRCodeManager;->access$200(Lcom/android/zxing/QRCodeManager;)Lio/reactivex/FlowableEmitter;

    move-result-object p2

    new-instance v0, Lcom/android/zxing/PreviewImage;

    iget-object v1, p0, Lcom/android/zxing/QRCodeManager$1;->this$0:Lcom/android/zxing/QRCodeManager;

    invoke-static {v1}, Lcom/android/zxing/QRCodeManager;->access$300(Lcom/android/zxing/QRCodeManager;)I

    move-result v1

    iget-object v2, p0, Lcom/android/zxing/QRCodeManager$1;->this$0:Lcom/android/zxing/QRCodeManager;

    invoke-static {v2}, Lcom/android/zxing/QRCodeManager;->access$400(Lcom/android/zxing/QRCodeManager;)I

    move-result v2

    invoke-direct {v0, p1, v1, v2}, Lcom/android/zxing/PreviewImage;-><init>(Landroid/media/Image;II)V

    invoke-interface {p2, v0}, Lio/reactivex/FlowableEmitter;->onNext(Ljava/lang/Object;)V

    .line 89
    :cond_3
    return-void
.end method
