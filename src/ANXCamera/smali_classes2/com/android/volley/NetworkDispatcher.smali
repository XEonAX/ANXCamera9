.class public Lcom/android/volley/NetworkDispatcher;
.super Ljava/lang/Thread;
.source "NetworkDispatcher.java"


# instance fields
.field private final mCache:Lcom/android/volley/Cache;

.field private final mDelivery:Lcom/android/volley/ResponseDelivery;

.field private final mNetwork:Lcom/android/volley/Network;

.field private final mQueue:Ljava/util/concurrent/BlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/BlockingQueue<",
            "Lcom/android/volley/Request<",
            "*>;>;"
        }
    .end annotation
.end field

.field private volatile mQuit:Z


# direct methods
.method public constructor <init>(Ljava/util/concurrent/BlockingQueue;Lcom/android/volley/Network;Lcom/android/volley/Cache;Lcom/android/volley/ResponseDelivery;)V
    .registers 6
    .param p2, "network"    # Lcom/android/volley/Network;
    .param p3, "cache"    # Lcom/android/volley/Cache;
    .param p4, "delivery"    # Lcom/android/volley/ResponseDelivery;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/BlockingQueue<",
            "Lcom/android/volley/Request<",
            "*>;>;",
            "Lcom/android/volley/Network;",
            "Lcom/android/volley/Cache;",
            "Lcom/android/volley/ResponseDelivery;",
            ")V"
        }
    .end annotation

    .line 57
    .local p1, "queue":Ljava/util/concurrent/BlockingQueue;, "Ljava/util/concurrent/BlockingQueue<Lcom/android/volley/Request<*>;>;"
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 44
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/volley/NetworkDispatcher;->mQuit:Z

    .line 58
    iput-object p1, p0, Lcom/android/volley/NetworkDispatcher;->mQueue:Ljava/util/concurrent/BlockingQueue;

    .line 59
    iput-object p2, p0, Lcom/android/volley/NetworkDispatcher;->mNetwork:Lcom/android/volley/Network;

    .line 60
    iput-object p3, p0, Lcom/android/volley/NetworkDispatcher;->mCache:Lcom/android/volley/Cache;

    .line 61
    iput-object p4, p0, Lcom/android/volley/NetworkDispatcher;->mDelivery:Lcom/android/volley/ResponseDelivery;

    .line 62
    return-void
.end method

.method private addTrafficStatsTag(Lcom/android/volley/Request;)V
    .registers 4
    .annotation build Landroid/annotation/TargetApi;
        value = 0xe
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/volley/Request<",
            "*>;)V"
        }
    .end annotation

    .line 76
    .local p1, "request":Lcom/android/volley/Request;, "Lcom/android/volley/Request<*>;"
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xe

    if-lt v0, v1, :cond_d

    .line 77
    invoke-virtual {p1}, Lcom/android/volley/Request;->getTrafficStatsTag()I

    move-result v0

    invoke-static {v0}, Landroid/net/TrafficStats;->setThreadStatsTag(I)V

    .line 79
    :cond_d
    return-void
.end method

.method private parseAndDeliverNetworkError(Lcom/android/volley/Request;Lcom/android/volley/VolleyError;)V
    .registers 4
    .param p2, "error"    # Lcom/android/volley/VolleyError;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/volley/Request<",
            "*>;",
            "Lcom/android/volley/VolleyError;",
            ")V"
        }
    .end annotation

    .line 144
    .local p1, "request":Lcom/android/volley/Request;, "Lcom/android/volley/Request<*>;"
    invoke-virtual {p1, p2}, Lcom/android/volley/Request;->parseNetworkError(Lcom/android/volley/VolleyError;)Lcom/android/volley/VolleyError;

    move-result-object p2

    .line 145
    iget-object v0, p0, Lcom/android/volley/NetworkDispatcher;->mDelivery:Lcom/android/volley/ResponseDelivery;

    invoke-interface {v0, p1, p2}, Lcom/android/volley/ResponseDelivery;->postError(Lcom/android/volley/Request;Lcom/android/volley/VolleyError;)V

    .line 146
    return-void
.end method


# virtual methods
.method public quit()V
    .registers 2

    .line 69
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/volley/NetworkDispatcher;->mQuit:Z

    .line 70
    invoke-virtual {p0}, Lcom/android/volley/NetworkDispatcher;->interrupt()V

    .line 71
    return-void
.end method

.method public run()V
    .registers 7

    .line 83
    const/16 v0, 0xa

    invoke-static {v0}, Landroid/os/Process;->setThreadPriority(I)V

    .line 88
    const/4 v0, 0x0

    .local v0, "request":Lcom/android/volley/Request;, "Lcom/android/volley/Request<*>;"
    :goto_6
    :try_start_6
    iget-object v1, p0, Lcom/android/volley/NetworkDispatcher;->mQueue:Ljava/util/concurrent/BlockingQueue;

    invoke-interface {v1}, Ljava/util/concurrent/BlockingQueue;->take()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/volley/Request;
    :try_end_e
    .catch Ljava/lang/InterruptedException; {:try_start_6 .. :try_end_e} :catch_8c

    .end local v0    # "request":Lcom/android/volley/Request;, "Lcom/android/volley/Request<*>;"
    move-object v0, v1

    .line 95
    .restart local v0    # "request":Lcom/android/volley/Request;, "Lcom/android/volley/Request<*>;"
    nop

    .line 98
    :try_start_10
    const-string v1, "network-queue-take"

    invoke-virtual {v0, v1}, Lcom/android/volley/Request;->addMarker(Ljava/lang/String;)V

    .line 102
    invoke-virtual {v0}, Lcom/android/volley/Request;->isCanceled()Z

    move-result v1

    if-eqz v1, :cond_21

    .line 103
    const-string v1, "network-discard-cancelled"

    invoke-virtual {v0, v1}, Lcom/android/volley/Request;->finish(Ljava/lang/String;)V

    .line 104
    goto :goto_6

    .line 107
    :cond_21
    invoke-direct {p0, v0}, Lcom/android/volley/NetworkDispatcher;->addTrafficStatsTag(Lcom/android/volley/Request;)V

    .line 110
    iget-object v1, p0, Lcom/android/volley/NetworkDispatcher;->mNetwork:Lcom/android/volley/Network;

    invoke-interface {v1, v0}, Lcom/android/volley/Network;->performRequest(Lcom/android/volley/Request;)Lcom/android/volley/NetworkResponse;

    move-result-object v1

    .line 111
    .local v1, "networkResponse":Lcom/android/volley/NetworkResponse;
    const-string v2, "network-http-complete"

    invoke-virtual {v0, v2}, Lcom/android/volley/Request;->addMarker(Ljava/lang/String;)V

    .line 115
    iget-boolean v2, v1, Lcom/android/volley/NetworkResponse;->notModified:Z

    if-eqz v2, :cond_3f

    invoke-virtual {v0}, Lcom/android/volley/Request;->hasHadResponseDelivered()Z

    move-result v2

    if-eqz v2, :cond_3f

    .line 116
    const-string v2, "not-modified"

    invoke-virtual {v0, v2}, Lcom/android/volley/Request;->finish(Ljava/lang/String;)V

    .line 117
    goto :goto_6

    .line 121
    :cond_3f
    invoke-virtual {v0, v1}, Lcom/android/volley/Request;->parseNetworkResponse(Lcom/android/volley/NetworkResponse;)Lcom/android/volley/Response;

    move-result-object v2

    .line 122
    .local v2, "response":Lcom/android/volley/Response;, "Lcom/android/volley/Response<*>;"
    const-string v3, "network-parse-complete"

    invoke-virtual {v0, v3}, Lcom/android/volley/Request;->addMarker(Ljava/lang/String;)V

    .line 126
    invoke-virtual {v0}, Lcom/android/volley/Request;->shouldCache()Z

    move-result v3

    if-eqz v3, :cond_62

    iget-object v3, v2, Lcom/android/volley/Response;->cacheEntry:Lcom/android/volley/Cache$Entry;

    if-eqz v3, :cond_62

    .line 127
    iget-object v3, p0, Lcom/android/volley/NetworkDispatcher;->mCache:Lcom/android/volley/Cache;

    invoke-virtual {v0}, Lcom/android/volley/Request;->getCacheKey()Ljava/lang/String;

    move-result-object v4

    iget-object v5, v2, Lcom/android/volley/Response;->cacheEntry:Lcom/android/volley/Cache$Entry;

    invoke-interface {v3, v4, v5}, Lcom/android/volley/Cache;->put(Ljava/lang/String;Lcom/android/volley/Cache$Entry;)V

    .line 128
    const-string v3, "network-cache-written"

    invoke-virtual {v0, v3}, Lcom/android/volley/Request;->addMarker(Ljava/lang/String;)V

    .line 132
    :cond_62
    invoke-virtual {v0}, Lcom/android/volley/Request;->markDelivered()V

    .line 133
    iget-object v3, p0, Lcom/android/volley/NetworkDispatcher;->mDelivery:Lcom/android/volley/ResponseDelivery;

    invoke-interface {v3, v0, v2}, Lcom/android/volley/ResponseDelivery;->postResponse(Lcom/android/volley/Request;Lcom/android/volley/Response;)V
    :try_end_6a
    .catch Lcom/android/volley/VolleyError; {:try_start_10 .. :try_end_6a} :catch_86
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_6a} :catch_6b

    .end local v1    # "networkResponse":Lcom/android/volley/NetworkResponse;
    .end local v2    # "response":Lcom/android/volley/Response;, "Lcom/android/volley/Response<*>;"
    goto :goto_8a

    .line 136
    :catch_6b
    move-exception v1

    .line 137
    .local v1, "e":Ljava/lang/Exception;
    const-string v2, "Unhandled exception %s"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-virtual {v1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v1, v2, v3}, Lcom/android/volley/VolleyLog;->e(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 138
    iget-object v2, p0, Lcom/android/volley/NetworkDispatcher;->mDelivery:Lcom/android/volley/ResponseDelivery;

    new-instance v3, Lcom/android/volley/VolleyError;

    invoke-direct {v3, v1}, Lcom/android/volley/VolleyError;-><init>(Ljava/lang/Throwable;)V

    invoke-interface {v2, v0, v3}, Lcom/android/volley/ResponseDelivery;->postError(Lcom/android/volley/Request;Lcom/android/volley/VolleyError;)V

    .end local v1    # "e":Ljava/lang/Exception;
    goto :goto_8a

    .line 134
    :catch_86
    move-exception v1

    .line 135
    .local v1, "volleyError":Lcom/android/volley/VolleyError;
    invoke-direct {p0, v0, v1}, Lcom/android/volley/NetworkDispatcher;->parseAndDeliverNetworkError(Lcom/android/volley/Request;Lcom/android/volley/VolleyError;)V

    .line 139
    .end local v1    # "volleyError":Lcom/android/volley/VolleyError;
    :goto_8a
    goto/16 :goto_6

    .line 89
    :catch_8c
    move-exception v1

    .line 91
    .local v1, "e":Ljava/lang/InterruptedException;
    iget-boolean v2, p0, Lcom/android/volley/NetworkDispatcher;->mQuit:Z

    if-eqz v2, :cond_92

    .line 92
    return-void

    .line 94
    :cond_92
    goto/16 :goto_6
.end method
