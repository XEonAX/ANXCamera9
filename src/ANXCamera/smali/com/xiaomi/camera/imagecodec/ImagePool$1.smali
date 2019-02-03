.class Lcom/xiaomi/camera/imagecodec/ImagePool$1;
.super Ljava/lang/Object;
.source "ImagePool.java"

# interfaces
.implements Landroid/media/ImageReader$OnImageAvailableListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/xiaomi/camera/imagecodec/ImagePool;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/xiaomi/camera/imagecodec/ImagePool;


# direct methods
.method constructor <init>(Lcom/xiaomi/camera/imagecodec/ImagePool;)V
    .locals 0

    .line 41
    iput-object p1, p0, Lcom/xiaomi/camera/imagecodec/ImagePool$1;->this$0:Lcom/xiaomi/camera/imagecodec/ImagePool;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onImageAvailable(Landroid/media/ImageReader;)V
    .locals 4

    .line 44
    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/ImagePool$1;->this$0:Lcom/xiaomi/camera/imagecodec/ImagePool;

    invoke-static {v0}, Lcom/xiaomi/camera/imagecodec/ImagePool;->access$000(Lcom/xiaomi/camera/imagecodec/ImagePool;)Ljava/lang/Object;

    move-result-object v0

    monitor-enter v0

    .line 45
    :try_start_0
    invoke-virtual {p1}, Landroid/media/ImageReader;->acquireNextImage()Landroid/media/Image;

    move-result-object p1

    .line 46
    invoke-virtual {p1}, Landroid/media/Image;->getTimestamp()J

    move-result-wide v1

    .line 48
    iget-object v3, p0, Lcom/xiaomi/camera/imagecodec/ImagePool$1;->this$0:Lcom/xiaomi/camera/imagecodec/ImagePool;

    invoke-static {v3}, Lcom/xiaomi/camera/imagecodec/ImagePool;->access$100(Lcom/xiaomi/camera/imagecodec/ImagePool;)Landroid/util/LongSparseArray;

    move-result-object v3

    invoke-virtual {v3, v1, v2, p1}, Landroid/util/LongSparseArray;->append(JLjava/lang/Object;)V

    .line 49
    iget-object p1, p0, Lcom/xiaomi/camera/imagecodec/ImagePool$1;->this$0:Lcom/xiaomi/camera/imagecodec/ImagePool;

    invoke-static {p1}, Lcom/xiaomi/camera/imagecodec/ImagePool;->access$000(Lcom/xiaomi/camera/imagecodec/ImagePool;)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->notify()V

    .line 50
    monitor-exit v0

    .line 51
    return-void

    .line 50
    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method
