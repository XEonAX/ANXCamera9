.class Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl$2;
.super Ljava/lang/Object;
.source "DefaultLogSendImpl.java"

# interfaces
.implements Lcom/bytedance/frameworks/baselib/log/LogHandler$IResponseConfig;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl;

.field final synthetic val$aid:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl;Ljava/lang/String;)V
    .locals 0

    .line 51
    iput-object p1, p0, Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl$2;->this$0:Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl;

    iput-object p2, p0, Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl$2;->val$aid:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getMoreChannelSwitch()Z
    .locals 1

    .line 69
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl$2;->this$0:Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl;

    iget-boolean v0, v0, Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl;->mMoreChannelSwitch:Z

    return v0
.end method

.method public getRemoveSwitch()Z
    .locals 1

    .line 54
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl$2;->val$aid:Ljava/lang/String;

    invoke-static {v0}, Lcom/bytedance/frameworks/core/monitor/config/MonitorConfigure;->getLogRemoveSwitch(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public getStatusCode()I
    .locals 1

    .line 59
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl$2;->this$0:Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl;

    iget v0, v0, Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl;->mStatusCode:I

    return v0
.end method

.method public getStopInterval()J
    .locals 2

    .line 64
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl$2;->this$0:Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl;

    iget-wide v0, v0, Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl;->mStopInterval:J

    return-wide v0
.end method

.method public getStopMoreChannelInterval()J
    .locals 2

    .line 74
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl$2;->val$aid:Ljava/lang/String;

    invoke-static {v0}, Lcom/bytedance/frameworks/core/monitor/config/MonitorConfigure;->getStopMoreChannelInterval(Ljava/lang/String;)J

    move-result-wide v0

    return-wide v0
.end method
