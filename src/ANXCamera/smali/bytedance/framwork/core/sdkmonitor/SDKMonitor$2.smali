.class Lbytedance/framwork/core/sdkmonitor/SDKMonitor$2;
.super Lcom/bytedance/frameworks/core/thread/TTRunnable;
.source "SDKMonitor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->updateConfigFromNet(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lbytedance/framwork/core/sdkmonitor/SDKMonitor;


# direct methods
.method constructor <init>(Lbytedance/framwork/core/sdkmonitor/SDKMonitor;)V
    .locals 0

    .line 244
    iput-object p1, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor$2;->this$0:Lbytedance/framwork/core/sdkmonitor/SDKMonitor;

    invoke-direct {p0}, Lcom/bytedance/frameworks/core/thread/TTRunnable;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 248
    :try_start_0
    iget-object v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor$2;->this$0:Lbytedance/framwork/core/sdkmonitor/SDKMonitor;

    invoke-static {v0}, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->access$000(Lbytedance/framwork/core/sdkmonitor/SDKMonitor;)Lbytedance/framwork/core/sdkmonitor/SDKMonitor$IGetCommonParams;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 249
    iget-object v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor$2;->this$0:Lbytedance/framwork/core/sdkmonitor/SDKMonitor;

    invoke-static {v0}, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->access$100(Lbytedance/framwork/core/sdkmonitor/SDKMonitor;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 250
    iget-object v2, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor$2;->this$0:Lbytedance/framwork/core/sdkmonitor/SDKMonitor;

    invoke-static {v2, v1}, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->access$200(Lbytedance/framwork/core/sdkmonitor/SDKMonitor;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 251
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "&encrypt=close"

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_1

    .line 253
    const/4 v2, 0x0

    :try_start_1
    iget-object v3, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor$2;->this$0:Lbytedance/framwork/core/sdkmonitor/SDKMonitor;

    invoke-static {v3}, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->access$300(Lbytedance/framwork/core/sdkmonitor/SDKMonitor;)Z

    move-result v3

    invoke-static {v1, v2, v3}, Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil;->getRequest(Ljava/lang/String;Ljava/lang/String;Z)[B

    move-result-object v1

    .line 254
    if-eqz v1, :cond_0

    .line 255
    iget-object v2, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor$2;->this$0:Lbytedance/framwork/core/sdkmonitor/SDKMonitor;

    new-instance v3, Lorg/json/JSONObject;

    new-instance v4, Ljava/lang/String;

    invoke-direct {v4, v1}, Ljava/lang/String;-><init>([B)V

    invoke-direct {v3, v4}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    invoke-static {v2, v3}, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->access$400(Lbytedance/framwork/core/sdkmonitor/SDKMonitor;Lorg/json/JSONObject;)V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0

    .line 257
    :cond_0
    goto :goto_1

    .line 258
    :catch_0
    move-exception v1

    .line 259
    :try_start_2
    invoke-virtual {v1}, Ljava/lang/Throwable;->printStackTrace()V
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_1

    .line 261
    goto :goto_0

    .line 269
    :cond_1
    :goto_1
    goto :goto_2

    .line 263
    :catch_1
    move-exception v0

    .line 264
    iget-object v1, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor$2;->this$0:Lbytedance/framwork/core/sdkmonitor/SDKMonitor;

    invoke-static {v1}, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->access$500(Lbytedance/framwork/core/sdkmonitor/SDKMonitor;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 265
    iget-object v1, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor$2;->this$0:Lbytedance/framwork/core/sdkmonitor/SDKMonitor;

    const/4 v2, 0x1

    invoke-static {v1, v2}, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->access$502(Lbytedance/framwork/core/sdkmonitor/SDKMonitor;Z)Z

    .line 266
    iget-object v1, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor$2;->this$0:Lbytedance/framwork/core/sdkmonitor/SDKMonitor;

    invoke-static {v1}, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->access$600(Lbytedance/framwork/core/sdkmonitor/SDKMonitor;)Lbytedance/framwork/core/sdkmonitor/CacheData;

    move-result-object v1

    iget-object v2, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor$2;->this$0:Lbytedance/framwork/core/sdkmonitor/SDKMonitor;

    invoke-virtual {v1, v2}, Lbytedance/framwork/core/sdkmonitor/CacheData;->handleCacheData(Lbytedance/framwork/core/sdkmonitor/SDKMonitor;)V

    .line 268
    :cond_2
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 270
    :goto_2
    return-void
.end method
