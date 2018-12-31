.class public Lcom/android/camera/network/net/HttpManager;
.super Ljava/lang/Object;
.source "HttpManager.java"


# static fields
.field private static final CACHE_DISK_USAGE_BYTES:I = 0x500000

.field private static final NETWORK_THREAD_POOL_SIZE:I = 0x2

.field private static instance:Lcom/android/camera/network/net/HttpManager;


# instance fields
.field private mContext:Landroid/content/Context;

.field private mRequestCache:Lcom/android/camera/network/net/GalleryCache;

.field private mRequestQueue:Lcom/android/volley/RequestQueue;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static declared-synchronized getInstance()Lcom/android/camera/network/net/HttpManager;
    .locals 2

    const-class v0, Lcom/android/camera/network/net/HttpManager;

    monitor-enter v0

    .line 30
    :try_start_0
    sget-object v1, Lcom/android/camera/network/net/HttpManager;->instance:Lcom/android/camera/network/net/HttpManager;

    if-nez v1, :cond_0

    .line 31
    new-instance v1, Lcom/android/camera/network/net/HttpManager;

    invoke-direct {v1}, Lcom/android/camera/network/net/HttpManager;-><init>()V

    sput-object v1, Lcom/android/camera/network/net/HttpManager;->instance:Lcom/android/camera/network/net/HttpManager;

    .line 33
    :cond_0
    sget-object v1, Lcom/android/camera/network/net/HttpManager;->instance:Lcom/android/camera/network/net/HttpManager;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object v1

    .line 29
    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method


# virtual methods
.method public addToRequestQueue(Lcom/android/volley/Request;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/android/volley/Request<",
            "TT;>;)V"
        }
    .end annotation

    .line 66
    iget-object v0, p0, Lcom/android/camera/network/net/HttpManager;->mRequestQueue:Lcom/android/volley/RequestQueue;

    invoke-virtual {v0, p1}, Lcom/android/volley/RequestQueue;->add(Lcom/android/volley/Request;)Lcom/android/volley/Request;

    .line 67
    return-void
.end method

.method public cancelAll(Ljava/lang/String;)V
    .locals 1

    .line 70
    iget-object v0, p0, Lcom/android/camera/network/net/HttpManager;->mRequestQueue:Lcom/android/volley/RequestQueue;

    invoke-virtual {v0, p1}, Lcom/android/volley/RequestQueue;->cancelAll(Ljava/lang/Object;)V

    .line 71
    return-void
.end method

.method public initRequestQueue(Landroid/content/Context;)V
    .locals 4

    .line 37
    iput-object p1, p0, Lcom/android/camera/network/net/HttpManager;->mContext:Landroid/content/Context;

    .line 38
    new-instance v0, Lcom/android/camera/network/net/GalleryCache;

    invoke-static {p1}, Lcom/android/camera/network/NetworkDependencies;->getRequestCache(Landroid/content/Context;)Ljava/io/File;

    move-result-object p1

    const/high16 v1, 0x500000

    invoke-direct {v0, p1, v1}, Lcom/android/camera/network/net/GalleryCache;-><init>(Ljava/io/File;I)V

    iput-object v0, p0, Lcom/android/camera/network/net/HttpManager;->mRequestCache:Lcom/android/camera/network/net/GalleryCache;

    .line 39
    new-instance p1, Lcom/android/volley/RequestQueue;

    iget-object v0, p0, Lcom/android/camera/network/net/HttpManager;->mRequestCache:Lcom/android/camera/network/net/GalleryCache;

    new-instance v1, Lcom/android/volley/toolbox/BasicNetwork;

    new-instance v2, Lcom/android/volley/toolbox/HurlStack;

    invoke-direct {v2}, Lcom/android/volley/toolbox/HurlStack;-><init>()V

    invoke-direct {v1, v2}, Lcom/android/volley/toolbox/BasicNetwork;-><init>(Lcom/android/volley/toolbox/BaseHttpStack;)V

    new-instance v2, Lcom/android/volley/ExecutorDelivery;

    .line 43
    invoke-static {}, Lcom/android/camera/network/threadpool/ThreadManager;->getRequestThreadHandler()Landroid/os/Handler;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/android/volley/ExecutorDelivery;-><init>(Landroid/os/Handler;)V

    const/4 v3, 0x2

    invoke-direct {p1, v0, v1, v3, v2}, Lcom/android/volley/RequestQueue;-><init>(Lcom/android/volley/Cache;Lcom/android/volley/Network;ILcom/android/volley/ResponseDelivery;)V

    iput-object p1, p0, Lcom/android/camera/network/net/HttpManager;->mRequestQueue:Lcom/android/volley/RequestQueue;

    .line 44
    iget-object p1, p0, Lcom/android/camera/network/net/HttpManager;->mRequestQueue:Lcom/android/volley/RequestQueue;

    invoke-virtual {p1}, Lcom/android/volley/RequestQueue;->start()V

    .line 45
    return-void
.end method

.method public putDefaultCache(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 58
    iget-object v0, p0, Lcom/android/camera/network/net/HttpManager;->mRequestCache:Lcom/android/camera/network/net/GalleryCache;

    invoke-virtual {v0, p1}, Lcom/android/camera/network/net/GalleryCache;->isCacheValid(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 59
    iget-object v0, p0, Lcom/android/camera/network/net/HttpManager;->mRequestCache:Lcom/android/camera/network/net/GalleryCache;

    invoke-virtual {v0, p1}, Lcom/android/camera/network/net/GalleryCache;->getFileForKey(Ljava/lang/String;)Ljava/io/File;

    move-result-object p1

    .line 60
    iget-object v0, p0, Lcom/android/camera/network/net/HttpManager;->mContext:Landroid/content/Context;

    invoke-static {v0, p1, p2}, Lcom/android/camera/sticker/FileUtils;->copyFileIfNeed(Landroid/content/Context;Ljava/io/File;Ljava/lang/String;)Z

    .line 61
    iget-object p1, p0, Lcom/android/camera/network/net/HttpManager;->mRequestCache:Lcom/android/camera/network/net/GalleryCache;

    invoke-virtual {p1}, Lcom/android/camera/network/net/GalleryCache;->initialize()V

    .line 63
    :cond_0
    return-void
.end method

.method public putToCache(Ljava/lang/String;[BJJ)V
    .locals 7

    .line 48
    iget-object v0, p0, Lcom/android/camera/network/net/HttpManager;->mRequestCache:Lcom/android/camera/network/net/GalleryCache;

    move-object v1, p1

    move-object v2, p2

    move-wide v3, p3

    move-wide v5, p5

    invoke-virtual/range {v0 .. v6}, Lcom/android/camera/network/net/GalleryCache;->put(Ljava/lang/String;[BJJ)V

    .line 49
    return-void
.end method
