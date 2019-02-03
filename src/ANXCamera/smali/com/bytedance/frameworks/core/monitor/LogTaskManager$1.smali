.class Lcom/bytedance/frameworks/core/monitor/LogTaskManager$1;
.super Ljava/lang/Object;
.source "LogTaskManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bytedance/frameworks/core/monitor/LogTaskManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bytedance/frameworks/core/monitor/LogTaskManager;


# direct methods
.method constructor <init>(Lcom/bytedance/frameworks/core/monitor/LogTaskManager;)V
    .locals 0

    .line 61
    iput-object p1, p0, Lcom/bytedance/frameworks/core/monitor/LogTaskManager$1;->this$0:Lcom/bytedance/frameworks/core/monitor/LogTaskManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 66
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/LogTaskManager$1;->this$0:Lcom/bytedance/frameworks/core/monitor/LogTaskManager;

    invoke-static {v0}, Lcom/bytedance/frameworks/core/monitor/LogTaskManager;->access$000(Lcom/bytedance/frameworks/core/monitor/LogTaskManager;)Landroid/os/Handler;

    move-result-object v0

    const/16 v1, 0xd

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 68
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/LogTaskManager$1;->this$0:Lcom/bytedance/frameworks/core/monitor/LogTaskManager;

    invoke-static {v0}, Lcom/bytedance/frameworks/core/monitor/LogTaskManager;->access$000(Lcom/bytedance/frameworks/core/monitor/LogTaskManager;)Landroid/os/Handler;

    move-result-object v0

    const/16 v1, 0xe

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 70
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/LogTaskManager$1;->this$0:Lcom/bytedance/frameworks/core/monitor/LogTaskManager;

    invoke-static {v0}, Lcom/bytedance/frameworks/core/monitor/LogTaskManager;->access$100(Lcom/bytedance/frameworks/core/monitor/LogTaskManager;)Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/LogTaskManager$1;->this$0:Lcom/bytedance/frameworks/core/monitor/LogTaskManager;

    invoke-static {v0}, Lcom/bytedance/frameworks/core/monitor/LogTaskManager;->access$100(Lcom/bytedance/frameworks/core/monitor/LogTaskManager;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 71
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/LogTaskManager$1;->this$0:Lcom/bytedance/frameworks/core/monitor/LogTaskManager;

    invoke-static {v0}, Lcom/bytedance/frameworks/core/monitor/LogTaskManager;->access$100(Lcom/bytedance/frameworks/core/monitor/LogTaskManager;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/bytedance/frameworks/core/monitor/LogTaskManager$IInactiveMonitor;

    .line 72
    invoke-interface {v1}, Lcom/bytedance/frameworks/core/monitor/LogTaskManager$IInactiveMonitor;->handleEvent()V

    goto :goto_0

    .line 75
    :cond_0
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/LogTaskManager$1;->this$0:Lcom/bytedance/frameworks/core/monitor/LogTaskManager;

    invoke-static {v0}, Lcom/bytedance/frameworks/core/monitor/LogTaskManager;->access$000(Lcom/bytedance/frameworks/core/monitor/LogTaskManager;)Landroid/os/Handler;

    move-result-object v0

    const-wide/16 v1, 0x3a98

    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 76
    return-void
.end method
