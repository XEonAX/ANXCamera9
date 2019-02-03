.class Lcom/xiaomi/camera/imagecodec/ImagePool$ImagePoolHolder;
.super Ljava/lang/Object;
.source "ImagePool.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/xiaomi/camera/imagecodec/ImagePool;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "ImagePoolHolder"
.end annotation


# static fields
.field static sInstance:Lcom/xiaomi/camera/imagecodec/ImagePool;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 55
    new-instance v0, Lcom/xiaomi/camera/imagecodec/ImagePool;

    invoke-direct {v0}, Lcom/xiaomi/camera/imagecodec/ImagePool;-><init>()V

    sput-object v0, Lcom/xiaomi/camera/imagecodec/ImagePool$ImagePoolHolder;->sInstance:Lcom/xiaomi/camera/imagecodec/ImagePool;

    .line 58
    sget-object v0, Lcom/xiaomi/camera/imagecodec/ImagePool$ImagePoolHolder;->sInstance:Lcom/xiaomi/camera/imagecodec/ImagePool;

    invoke-static {v0}, Lcom/xiaomi/camera/imagecodec/ImagePool;->access$200(Lcom/xiaomi/camera/imagecodec/ImagePool;)Landroid/os/HandlerThread;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    .line 59
    sget-object v0, Lcom/xiaomi/camera/imagecodec/ImagePool$ImagePoolHolder;->sInstance:Lcom/xiaomi/camera/imagecodec/ImagePool;

    invoke-static {v0}, Lcom/xiaomi/camera/imagecodec/ImagePool;->access$300(Lcom/xiaomi/camera/imagecodec/ImagePool;)Landroid/os/HandlerThread;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    .line 60
    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
