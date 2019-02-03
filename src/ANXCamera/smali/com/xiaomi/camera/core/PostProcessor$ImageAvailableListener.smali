.class Lcom/xiaomi/camera/core/PostProcessor$ImageAvailableListener;
.super Ljava/lang/Object;
.source "PostProcessor.java"

# interfaces
.implements Landroid/media/ImageReader$OnImageAvailableListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/xiaomi/camera/core/PostProcessor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ImageAvailableListener"
.end annotation


# instance fields
.field private mImageFlag:I

.field final synthetic this$0:Lcom/xiaomi/camera/core/PostProcessor;


# direct methods
.method constructor <init>(Lcom/xiaomi/camera/core/PostProcessor;I)V
    .locals 0

    .line 131
    iput-object p1, p0, Lcom/xiaomi/camera/core/PostProcessor$ImageAvailableListener;->this$0:Lcom/xiaomi/camera/core/PostProcessor;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 132
    iput p2, p0, Lcom/xiaomi/camera/core/PostProcessor$ImageAvailableListener;->mImageFlag:I

    .line 133
    return-void
.end method


# virtual methods
.method public onImageAvailable(Landroid/media/ImageReader;)V
    .locals 4

    .line 137
    if-nez p1, :cond_0

    .line 138
    invoke-static {}, Lcom/xiaomi/camera/core/PostProcessor;->access$000()Ljava/lang/String;

    move-result-object p1

    const-string v0, "[0] onImageAvailable: null imageReader!"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 139
    return-void

    .line 141
    :cond_0
    iget-object v0, p0, Lcom/xiaomi/camera/core/PostProcessor$ImageAvailableListener;->this$0:Lcom/xiaomi/camera/core/PostProcessor;

    invoke-static {v0}, Lcom/xiaomi/camera/core/PostProcessor;->access$500(Lcom/xiaomi/camera/core/PostProcessor;)Lcom/xiaomi/camera/core/ImageMemoryManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/xiaomi/camera/core/ImageMemoryManager;->waitImageCloseIfNeeded()V

    .line 142
    invoke-virtual {p1}, Landroid/media/ImageReader;->acquireNextImage()Landroid/media/Image;

    move-result-object p1

    .line 143
    invoke-static {}, Lcom/xiaomi/camera/core/PostProcessor;->access$000()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[0] onImageAvailable: timestamp = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Landroid/media/Image;->getTimestamp()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 144
    iget-object v0, p0, Lcom/xiaomi/camera/core/PostProcessor$ImageAvailableListener;->this$0:Lcom/xiaomi/camera/core/PostProcessor;

    invoke-static {v0}, Lcom/xiaomi/camera/core/PostProcessor;->access$500(Lcom/xiaomi/camera/core/PostProcessor;)Lcom/xiaomi/camera/core/ImageMemoryManager;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/xiaomi/camera/core/ImageMemoryManager;->holdAnImage(Landroid/media/Image;)V

    .line 145
    invoke-static {}, Lcom/xiaomi/camera/core/ParallelDataZipper;->getInstance()Lcom/xiaomi/camera/core/ParallelDataZipper;

    move-result-object v0

    iget v1, p0, Lcom/xiaomi/camera/core/PostProcessor$ImageAvailableListener;->mImageFlag:I

    invoke-virtual {v0, p1, v1}, Lcom/xiaomi/camera/core/ParallelDataZipper;->join(Landroid/media/Image;I)V

    .line 147
    return-void
.end method
