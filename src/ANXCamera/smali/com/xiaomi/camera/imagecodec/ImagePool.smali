.class public Lcom/xiaomi/camera/imagecodec/ImagePool;
.super Ljava/lang/Object;
.source "ImagePool.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/xiaomi/camera/imagecodec/ImagePool$ImageFormat;,
        Lcom/xiaomi/camera/imagecodec/ImagePool$ImagePoolHolder;
    }
.end annotation


# static fields
.field public static final MAX_IMAGES:I = 0x1e

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private mHoldImages:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/media/Image;",
            "Lcom/xiaomi/camera/imagecodec/ImagePool$ImageFormat;",
            ">;"
        }
    .end annotation
.end field

.field private mImageAvailableListener:Landroid/media/ImageReader$OnImageAvailableListener;

.field private final mImageLock:Ljava/lang/Object;

.field private mImageLongSparseArray:Landroid/util/LongSparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/LongSparseArray<",
            "Landroid/media/Image;",
            ">;"
        }
    .end annotation
.end field

.field private mImageQueueSizeMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/xiaomi/camera/imagecodec/ImagePool$ImageFormat;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private mImageReaderHandlerThread:Landroid/os/HandlerThread;

.field private mImageReaderMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/xiaomi/camera/imagecodec/ImagePool$ImageFormat;",
            "Landroid/media/ImageReader;",
            ">;"
        }
    .end annotation
.end field

.field private mImageWriterHandlerThread:Landroid/os/HandlerThread;

.field private mImageWriterMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/xiaomi/camera/imagecodec/ImagePool$ImageFormat;",
            "Landroid/media/ImageWriter;",
            ">;"
        }
    .end annotation
.end field

.field private final mQueueSizeLock:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 26
    const-class v0, Lcom/xiaomi/camera/imagecodec/ImagePool;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/xiaomi/camera/imagecodec/ImagePool;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    new-instance v0, Landroid/util/LongSparseArray;

    invoke-direct {v0}, Landroid/util/LongSparseArray;-><init>()V

    iput-object v0, p0, Lcom/xiaomi/camera/imagecodec/ImagePool;->mImageLongSparseArray:Landroid/util/LongSparseArray;

    .line 30
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/xiaomi/camera/imagecodec/ImagePool;->mImageWriterMap:Ljava/util/Map;

    .line 31
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/xiaomi/camera/imagecodec/ImagePool;->mImageReaderMap:Ljava/util/Map;

    .line 32
    new-instance v0, Landroid/os/HandlerThread;

    const-string v1, "ImageWriterHandlerThread"

    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/xiaomi/camera/imagecodec/ImagePool;->mImageWriterHandlerThread:Landroid/os/HandlerThread;

    .line 33
    new-instance v0, Landroid/os/HandlerThread;

    const-string v1, "ImageReaderHandlerThread"

    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/xiaomi/camera/imagecodec/ImagePool;->mImageReaderHandlerThread:Landroid/os/HandlerThread;

    .line 35
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/xiaomi/camera/imagecodec/ImagePool;->mHoldImages:Ljava/util/Map;

    .line 36
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/xiaomi/camera/imagecodec/ImagePool;->mImageQueueSizeMap:Ljava/util/Map;

    .line 37
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/xiaomi/camera/imagecodec/ImagePool;->mQueueSizeLock:Ljava/lang/Object;

    .line 39
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/xiaomi/camera/imagecodec/ImagePool;->mImageLock:Ljava/lang/Object;

    .line 41
    new-instance v0, Lcom/xiaomi/camera/imagecodec/ImagePool$1;

    invoke-direct {v0, p0}, Lcom/xiaomi/camera/imagecodec/ImagePool$1;-><init>(Lcom/xiaomi/camera/imagecodec/ImagePool;)V

    iput-object v0, p0, Lcom/xiaomi/camera/imagecodec/ImagePool;->mImageAvailableListener:Landroid/media/ImageReader$OnImageAvailableListener;

    return-void
.end method

.method static synthetic access$000(Lcom/xiaomi/camera/imagecodec/ImagePool;)Ljava/lang/Object;
    .locals 0

    .line 25
    iget-object p0, p0, Lcom/xiaomi/camera/imagecodec/ImagePool;->mImageLock:Ljava/lang/Object;

    return-object p0
.end method

.method static synthetic access$100(Lcom/xiaomi/camera/imagecodec/ImagePool;)Landroid/util/LongSparseArray;
    .locals 0

    .line 25
    iget-object p0, p0, Lcom/xiaomi/camera/imagecodec/ImagePool;->mImageLongSparseArray:Landroid/util/LongSparseArray;

    return-object p0
.end method

.method static synthetic access$200(Lcom/xiaomi/camera/imagecodec/ImagePool;)Landroid/os/HandlerThread;
    .locals 0

    .line 25
    iget-object p0, p0, Lcom/xiaomi/camera/imagecodec/ImagePool;->mImageReaderHandlerThread:Landroid/os/HandlerThread;

    return-object p0
.end method

.method static synthetic access$300(Lcom/xiaomi/camera/imagecodec/ImagePool;)Landroid/os/HandlerThread;
    .locals 0

    .line 25
    iget-object p0, p0, Lcom/xiaomi/camera/imagecodec/ImagePool;->mImageWriterHandlerThread:Landroid/os/HandlerThread;

    return-object p0
.end method

.method private changeImageQueueSizeLocked(Lcom/xiaomi/camera/imagecodec/ImagePool$ImageFormat;I)I
    .locals 2

    .line 208
    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/ImagePool;->mImageQueueSizeMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 209
    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 210
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 212
    :cond_0
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    add-int/2addr v0, p2

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    .line 213
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-gez v0, :cond_1

    .line 214
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    .line 216
    :cond_1
    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/ImagePool;->mImageQueueSizeMap:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 217
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p1

    return p1
.end method

.method private getImageQueueSizeLocked(Lcom/xiaomi/camera/imagecodec/ImagePool$ImageFormat;)I
    .locals 1

    .line 197
    if-eqz p1, :cond_0

    .line 198
    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/ImagePool;->mImageQueueSizeMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    .line 199
    if-eqz p1, :cond_0

    .line 200
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    return p1

    .line 204
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method private getImageWriter(Lcom/xiaomi/camera/imagecodec/ImagePool$ImageFormat;)Landroid/media/ImageWriter;
    .locals 5
    .param p1    # Lcom/xiaomi/camera/imagecodec/ImagePool$ImageFormat;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 246
    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/ImagePool;->mImageWriterMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 247
    nop

    .line 248
    invoke-virtual {p1}, Lcom/xiaomi/camera/imagecodec/ImagePool$ImageFormat;->getWidth()I

    move-result v0

    invoke-virtual {p1}, Lcom/xiaomi/camera/imagecodec/ImagePool$ImageFormat;->getHeight()I

    move-result v1

    .line 249
    invoke-virtual {p1}, Lcom/xiaomi/camera/imagecodec/ImagePool$ImageFormat;->getFormat()I

    move-result v2

    .line 247
    const/16 v3, 0x1e

    invoke-static {v0, v1, v2, v3}, Landroid/media/ImageReader;->newInstance(IIII)Landroid/media/ImageReader;

    move-result-object v0

    .line 250
    iget-object v1, p0, Lcom/xiaomi/camera/imagecodec/ImagePool;->mImageAvailableListener:Landroid/media/ImageReader$OnImageAvailableListener;

    new-instance v2, Landroid/os/Handler;

    iget-object v4, p0, Lcom/xiaomi/camera/imagecodec/ImagePool;->mImageReaderHandlerThread:Landroid/os/HandlerThread;

    .line 251
    invoke-virtual {v4}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v4

    invoke-direct {v2, v4}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 250
    invoke-virtual {v0, v1, v2}, Landroid/media/ImageReader;->setOnImageAvailableListener(Landroid/media/ImageReader$OnImageAvailableListener;Landroid/os/Handler;)V

    .line 253
    invoke-virtual {v0}, Landroid/media/ImageReader;->getSurface()Landroid/view/Surface;

    move-result-object v1

    invoke-static {v1, v3}, Landroid/media/ImageWriter;->newInstance(Landroid/view/Surface;I)Landroid/media/ImageWriter;

    move-result-object v1

    .line 254
    const/4 v2, 0x0

    new-instance v3, Landroid/os/Handler;

    iget-object v4, p0, Lcom/xiaomi/camera/imagecodec/ImagePool;->mImageWriterHandlerThread:Landroid/os/HandlerThread;

    .line 255
    invoke-virtual {v4}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v4

    invoke-direct {v3, v4}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 254
    invoke-virtual {v1, v2, v3}, Landroid/media/ImageWriter;->setOnImageReleasedListener(Landroid/media/ImageWriter$OnImageReleasedListener;Landroid/os/Handler;)V

    .line 256
    iget-object v2, p0, Lcom/xiaomi/camera/imagecodec/ImagePool;->mImageReaderMap:Ljava/util/Map;

    invoke-interface {v2, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 257
    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/ImagePool;->mImageWriterMap:Ljava/util/Map;

    invoke-interface {v0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 258
    sget-object p1, Lcom/xiaomi/camera/imagecodec/ImagePool;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "getImageWriter: mImageWriterMap.size = "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/xiaomi/camera/imagecodec/ImagePool;->mImageWriterMap:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->size()I

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 259
    iget-object p1, p0, Lcom/xiaomi/camera/imagecodec/ImagePool;->mImageReaderMap:Ljava/util/Map;

    invoke-interface {p1}, Ljava/util/Map;->size()I

    move-result p1

    const/16 v0, 0xa

    if-le p1, v0, :cond_0

    .line 260
    sget-object p1, Lcom/xiaomi/camera/imagecodec/ImagePool;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "getImageWriter: there are too much ImageWriter and ImageReader instance in map, size is : "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/xiaomi/camera/imagecodec/ImagePool;->mImageReaderMap:Ljava/util/Map;

    .line 261
    invoke-interface {v2}, Ljava/util/Map;->size()I

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 260
    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 263
    :cond_0
    return-object v1

    .line 265
    :cond_1
    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/ImagePool;->mImageWriterMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/media/ImageWriter;

    return-object p1
.end method

.method public static getInstance()Lcom/xiaomi/camera/imagecodec/ImagePool;
    .locals 1

    .line 64
    sget-object v0, Lcom/xiaomi/camera/imagecodec/ImagePool$ImagePoolHolder;->sInstance:Lcom/xiaomi/camera/imagecodec/ImagePool;

    return-object v0
.end method


# virtual methods
.method public clear()V
    .locals 3

    .line 230
    const/4 v0, 0x0

    :goto_0
    :try_start_0
    iget-object v1, p0, Lcom/xiaomi/camera/imagecodec/ImagePool;->mImageLongSparseArray:Landroid/util/LongSparseArray;

    invoke-virtual {v1}, Landroid/util/LongSparseArray;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 231
    iget-object v1, p0, Lcom/xiaomi/camera/imagecodec/ImagePool;->mImageLongSparseArray:Landroid/util/LongSparseArray;

    invoke-virtual {v1, v0}, Landroid/util/LongSparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/media/Image;

    invoke-virtual {v1}, Landroid/media/Image;->close()V

    .line 230
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 233
    :cond_0
    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/ImagePool;->mImageReaderMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/media/ImageReader;

    .line 234
    invoke-virtual {v1}, Landroid/media/ImageReader;->close()V

    .line 235
    goto :goto_1

    .line 236
    :cond_1
    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/ImagePool;->mImageWriterMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/media/ImageWriter;

    .line 237
    invoke-virtual {v1}, Landroid/media/ImageWriter;->close()V

    .line 238
    goto :goto_2

    .line 239
    :cond_2
    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/ImagePool;->mImageQueueSizeMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 242
    goto :goto_3

    .line 240
    :catch_0
    move-exception v0

    .line 241
    sget-object v1, Lcom/xiaomi/camera/imagecodec/ImagePool;->TAG:Ljava/lang/String;

    const-string v2, "Clear ImagePool cause error: "

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 243
    :goto_3
    return-void
.end method

.method public getAnEmptyImage(Lcom/xiaomi/camera/imagecodec/ImagePool$ImageFormat;)Landroid/media/Image;
    .locals 2
    .param p1    # Lcom/xiaomi/camera/imagecodec/ImagePool$ImageFormat;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 117
    invoke-direct {p0, p1}, Lcom/xiaomi/camera/imagecodec/ImagePool;->getImageWriter(Lcom/xiaomi/camera/imagecodec/ImagePool$ImageFormat;)Landroid/media/ImageWriter;

    move-result-object p1

    .line 118
    invoke-virtual {p1}, Landroid/media/ImageWriter;->dequeueInputImage()Landroid/media/Image;

    move-result-object p1

    .line 119
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-virtual {p1, v0, v1}, Landroid/media/Image;->setTimestamp(J)V

    .line 121
    return-object p1
.end method

.method public getImage(J)Landroid/media/Image;
    .locals 2

    .line 102
    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/ImagePool;->mImageLongSparseArray:Landroid/util/LongSparseArray;

    invoke-virtual {v0, p1, p2}, Landroid/util/LongSparseArray;->get(J)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/Image;

    .line 103
    iget-object v1, p0, Lcom/xiaomi/camera/imagecodec/ImagePool;->mImageLongSparseArray:Landroid/util/LongSparseArray;

    invoke-virtual {v1, p1, p2}, Landroid/util/LongSparseArray;->remove(J)V

    .line 104
    return-object v0
.end method

.method public holdImage(Landroid/media/Image;)V
    .locals 6

    .line 125
    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/ImagePool;->mQueueSizeLock:Ljava/lang/Object;

    monitor-enter v0

    .line 126
    if-eqz p1, :cond_0

    .line 127
    :try_start_0
    invoke-virtual {p0, p1}, Lcom/xiaomi/camera/imagecodec/ImagePool;->toImageQueueKey(Landroid/media/Image;)Lcom/xiaomi/camera/imagecodec/ImagePool$ImageFormat;

    move-result-object v1

    .line 128
    iget-object v2, p0, Lcom/xiaomi/camera/imagecodec/ImagePool;->mHoldImages:Ljava/util/Map;

    invoke-interface {v2, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 129
    const/4 v2, 0x1

    invoke-direct {p0, v1, v2}, Lcom/xiaomi/camera/imagecodec/ImagePool;->changeImageQueueSizeLocked(Lcom/xiaomi/camera/imagecodec/ImagePool$ImageFormat;I)I

    move-result v1

    .line 131
    sget-object v2, Lcom/xiaomi/camera/imagecodec/ImagePool;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "holdImage: image: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v4, " | "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Landroid/media/Image;->getTimestamp()J

    move-result-wide v4

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string p1, " qSize: "

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v2, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 132
    iget-object p1, p0, Lcom/xiaomi/camera/imagecodec/ImagePool;->mQueueSizeLock:Ljava/lang/Object;

    invoke-virtual {p1}, Ljava/lang/Object;->notifyAll()V

    goto :goto_0

    .line 134
    :catchall_0
    move-exception p1

    goto :goto_1

    :cond_0
    :goto_0
    monitor-exit v0

    .line 135
    return-void

    .line 134
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public isImageQueueFull(Lcom/xiaomi/camera/imagecodec/ImagePool$ImageFormat;I)Z
    .locals 2

    .line 163
    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/ImagePool;->mQueueSizeLock:Ljava/lang/Object;

    monitor-enter v0

    .line 164
    rsub-int/lit8 p2, p2, 0x1e

    const/4 v1, 0x0

    :try_start_0
    invoke-static {v1, p2}, Ljava/lang/Math;->max(II)I

    move-result p2

    .line 165
    invoke-direct {p0, p1}, Lcom/xiaomi/camera/imagecodec/ImagePool;->getImageQueueSizeLocked(Lcom/xiaomi/camera/imagecodec/ImagePool$ImageFormat;)I

    move-result p1

    .line 166
    if-lt p1, p2, :cond_0

    const/4 v1, 0x1

    nop

    :cond_0
    monitor-exit v0

    return v1

    .line 167
    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public queueImage(Landroid/media/Image;)V
    .locals 6

    .line 76
    invoke-virtual {p1}, Landroid/media/Image;->getTimestamp()J

    move-result-wide v0

    .line 77
    iget-object v2, p0, Lcom/xiaomi/camera/imagecodec/ImagePool;->mImageLongSparseArray:Landroid/util/LongSparseArray;

    invoke-virtual {v2, v0, v1}, Landroid/util/LongSparseArray;->get(J)Ljava/lang/Object;

    move-result-object v2

    if-nez v2, :cond_0

    .line 81
    iget-object v2, p0, Lcom/xiaomi/camera/imagecodec/ImagePool;->mImageLock:Ljava/lang/Object;

    monitor-enter v2

    .line 82
    :try_start_0
    invoke-virtual {p0, p1}, Lcom/xiaomi/camera/imagecodec/ImagePool;->toImageQueueKey(Landroid/media/Image;)Lcom/xiaomi/camera/imagecodec/ImagePool$ImageFormat;

    move-result-object v0

    .line 83
    invoke-direct {p0, v0}, Lcom/xiaomi/camera/imagecodec/ImagePool;->getImageWriter(Lcom/xiaomi/camera/imagecodec/ImagePool$ImageFormat;)Landroid/media/ImageWriter;

    move-result-object v0

    .line 84
    sget-object v1, Lcom/xiaomi/camera/imagecodec/ImagePool;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "queueImage: start. image: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v4, " | "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Landroid/media/Image;->getTimestamp()J

    move-result-wide v4

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 85
    invoke-virtual {v0, p1}, Landroid/media/ImageWriter;->queueInputImage(Landroid/media/Image;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 88
    :try_start_1
    iget-object p1, p0, Lcom/xiaomi/camera/imagecodec/ImagePool;->mImageLock:Ljava/lang/Object;

    invoke-virtual {p1}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 91
    goto :goto_0

    .line 89
    :catch_0
    move-exception p1

    .line 90
    :try_start_2
    invoke-virtual {p1}, Ljava/lang/InterruptedException;->printStackTrace()V

    .line 92
    :goto_0
    sget-object p1, Lcom/xiaomi/camera/imagecodec/ImagePool;->TAG:Ljava/lang/String;

    const-string v0, "queueImage: end"

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 93
    monitor-exit v2

    .line 94
    return-void

    .line 93
    :catchall_0
    move-exception p1

    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p1

    .line 78
    :cond_0
    new-instance p1, Ljava/lang/RuntimeException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Image has exist: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public releaseImage(Landroid/media/Image;)V
    .locals 5

    .line 138
    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/ImagePool;->mQueueSizeLock:Ljava/lang/Object;

    monitor-enter v0

    .line 139
    if-eqz p1, :cond_1

    .line 140
    :try_start_0
    iget-object v1, p0, Lcom/xiaomi/camera/imagecodec/ImagePool;->mHoldImages:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/xiaomi/camera/imagecodec/ImagePool$ImageFormat;

    .line 141
    if-eqz v1, :cond_0

    .line 142
    iget-object v2, p0, Lcom/xiaomi/camera/imagecodec/ImagePool;->mHoldImages:Ljava/util/Map;

    invoke-interface {v2, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 143
    const/4 v2, -0x1

    invoke-direct {p0, v1, v2}, Lcom/xiaomi/camera/imagecodec/ImagePool;->changeImageQueueSizeLocked(Lcom/xiaomi/camera/imagecodec/ImagePool$ImageFormat;I)I

    move-result v1

    .line 145
    sget-object v2, Lcom/xiaomi/camera/imagecodec/ImagePool;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "releaseImage: image: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, " qSize: "

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v2, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 146
    iget-object p1, p0, Lcom/xiaomi/camera/imagecodec/ImagePool;->mQueueSizeLock:Ljava/lang/Object;

    invoke-virtual {p1}, Ljava/lang/Object;->notifyAll()V

    .line 147
    goto :goto_0

    .line 148
    :cond_0
    sget-object v1, Lcom/xiaomi/camera/imagecodec/ImagePool;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "releaseImage: not hold image "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 151
    :catchall_0
    move-exception p1

    goto :goto_1

    :cond_1
    :goto_0
    monitor-exit v0

    .line 152
    return-void

    .line 151
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public toImageQueueKey(Landroid/media/Image;)Lcom/xiaomi/camera/imagecodec/ImagePool$ImageFormat;
    .locals 3

    .line 221
    if-eqz p1, :cond_0

    .line 222
    new-instance v0, Lcom/xiaomi/camera/imagecodec/ImagePool$ImageFormat;

    invoke-virtual {p1}, Landroid/media/Image;->getWidth()I

    move-result v1

    invoke-virtual {p1}, Landroid/media/Image;->getHeight()I

    move-result v2

    invoke-virtual {p1}, Landroid/media/Image;->getFormat()I

    move-result p1

    invoke-direct {v0, v1, v2, p1}, Lcom/xiaomi/camera/imagecodec/ImagePool$ImageFormat;-><init>(III)V

    return-object v0

    .line 224
    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public waitIfImageQueueFull(Lcom/xiaomi/camera/imagecodec/ImagePool$ImageFormat;II)V
    .locals 4

    .line 180
    rsub-int/lit8 p2, p2, 0x1e

    const/4 v0, 0x0

    invoke-static {v0, p2}, Ljava/lang/Math;->max(II)I

    move-result p2

    .line 181
    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/ImagePool;->mQueueSizeLock:Ljava/lang/Object;

    monitor-enter v0

    .line 182
    :goto_0
    :try_start_0
    invoke-direct {p0, p1}, Lcom/xiaomi/camera/imagecodec/ImagePool;->getImageQueueSizeLocked(Lcom/xiaomi/camera/imagecodec/ImagePool$ImageFormat;)I

    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-lt v1, p2, :cond_1

    .line 184
    if-lez p3, :cond_0

    .line 185
    :try_start_1
    iget-object v1, p0, Lcom/xiaomi/camera/imagecodec/ImagePool;->mQueueSizeLock:Ljava/lang/Object;

    int-to-long v2, p3

    invoke-virtual {v1, v2, v3}, Ljava/lang/Object;->wait(J)V

    goto :goto_1

    .line 189
    :catch_0
    move-exception v1

    goto :goto_2

    .line 187
    :cond_0
    iget-object v1, p0, Lcom/xiaomi/camera/imagecodec/ImagePool;->mQueueSizeLock:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 191
    :goto_1
    goto :goto_0

    .line 189
    :goto_2
    nop

    .line 190
    :try_start_2
    sget-object v2, Lcom/xiaomi/camera/imagecodec/ImagePool;->TAG:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/InterruptedException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1

    .line 193
    :cond_1
    monitor-exit v0

    .line 194
    return-void

    .line 193
    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p1
.end method
