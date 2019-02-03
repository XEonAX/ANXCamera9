.class Lbytedance/framwork/core/sdkmonitor/CacheData$1;
.super Ljava/lang/Thread;
.source "CacheData.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lbytedance/framwork/core/sdkmonitor/CacheData;->handleCacheData(Lbytedance/framwork/core/sdkmonitor/SDKMonitor;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lbytedance/framwork/core/sdkmonitor/CacheData;

.field final synthetic val$sdkMonitor:Lbytedance/framwork/core/sdkmonitor/SDKMonitor;


# direct methods
.method constructor <init>(Lbytedance/framwork/core/sdkmonitor/CacheData;Ljava/lang/String;Lbytedance/framwork/core/sdkmonitor/SDKMonitor;)V
    .locals 0

    .line 52
    iput-object p1, p0, Lbytedance/framwork/core/sdkmonitor/CacheData$1;->this$0:Lbytedance/framwork/core/sdkmonitor/CacheData;

    iput-object p3, p0, Lbytedance/framwork/core/sdkmonitor/CacheData$1;->val$sdkMonitor:Lbytedance/framwork/core/sdkmonitor/SDKMonitor;

    invoke-direct {p0, p2}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 56
    nop

    .line 57
    :try_start_0
    iget-object v0, p0, Lbytedance/framwork/core/sdkmonitor/CacheData$1;->this$0:Lbytedance/framwork/core/sdkmonitor/CacheData;

    invoke-static {v0}, Lbytedance/framwork/core/sdkmonitor/CacheData;->access$000(Lbytedance/framwork/core/sdkmonitor/CacheData;)Ljava/util/LinkedList;

    move-result-object v0

    monitor-enter v0
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 58
    :try_start_1
    new-instance v1, Ljava/util/LinkedList;

    iget-object v2, p0, Lbytedance/framwork/core/sdkmonitor/CacheData$1;->this$0:Lbytedance/framwork/core/sdkmonitor/CacheData;

    invoke-static {v2}, Lbytedance/framwork/core/sdkmonitor/CacheData;->access$000(Lbytedance/framwork/core/sdkmonitor/CacheData;)Ljava/util/LinkedList;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/util/LinkedList;-><init>(Ljava/util/Collection;)V

    .line 59
    iget-object v2, p0, Lbytedance/framwork/core/sdkmonitor/CacheData$1;->this$0:Lbytedance/framwork/core/sdkmonitor/CacheData;

    invoke-static {v2}, Lbytedance/framwork/core/sdkmonitor/CacheData;->access$000(Lbytedance/framwork/core/sdkmonitor/CacheData;)Ljava/util/LinkedList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/LinkedList;->clear()V

    .line 60
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 61
    :try_start_2
    invoke-virtual {v1}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lbytedance/framwork/core/sdkmonitor/CacheData$SerViceMonitorData;

    .line 62
    iget-object v2, p0, Lbytedance/framwork/core/sdkmonitor/CacheData$1;->this$0:Lbytedance/framwork/core/sdkmonitor/CacheData;

    iget-object v3, p0, Lbytedance/framwork/core/sdkmonitor/CacheData$1;->val$sdkMonitor:Lbytedance/framwork/core/sdkmonitor/SDKMonitor;

    invoke-static {v2, v3, v1}, Lbytedance/framwork/core/sdkmonitor/CacheData;->access$100(Lbytedance/framwork/core/sdkmonitor/CacheData;Lbytedance/framwork/core/sdkmonitor/SDKMonitor;Lbytedance/framwork/core/sdkmonitor/CacheData$SerViceMonitorData;)V
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_0

    .line 63
    goto :goto_0

    .line 66
    :cond_0
    goto :goto_1

    .line 60
    :catchall_0
    move-exception v1

    :try_start_3
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    throw v1
    :try_end_4
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_0

    .line 64
    :catch_0
    move-exception v0

    .line 68
    :goto_1
    return-void
.end method
