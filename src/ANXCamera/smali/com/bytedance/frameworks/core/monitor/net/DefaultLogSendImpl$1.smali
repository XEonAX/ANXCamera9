.class Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl$1;
.super Lcom/bytedance/frameworks/baselib/log/LogHandler$BaseConfig;
.source "DefaultLogSendImpl.java"


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

.field final synthetic val$reportType:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 29
    iput-object p1, p0, Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl$1;->this$0:Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl;

    iput-object p2, p0, Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl$1;->val$aid:Ljava/lang/String;

    iput-object p3, p0, Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl$1;->val$reportType:Ljava/lang/String;

    invoke-direct {p0}, Lcom/bytedance/frameworks/baselib/log/LogHandler$BaseConfig;-><init>()V

    return-void
.end method


# virtual methods
.method public getChannels()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 37
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl$1;->val$aid:Ljava/lang/String;

    iget-object v1, p0, Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl$1;->val$reportType:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/bytedance/frameworks/core/monitor/config/MonitorConfigure;->getReportUrl(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getLogType()Ljava/lang/String;
    .locals 2

    .line 32
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl$1;->val$aid:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl$1;->val$reportType:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getMaxRetryCount()I
    .locals 1

    .line 42
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl$1;->val$aid:Ljava/lang/String;

    invoke-static {v0}, Lcom/bytedance/frameworks/core/monitor/config/MonitorConfigure;->getReportFailRepeatCount(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public getRetryInterval()J
    .locals 2

    .line 47
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl$1;->val$aid:Ljava/lang/String;

    invoke-static {v0}, Lcom/bytedance/frameworks/core/monitor/config/MonitorConfigure;->getReportFailBaseTime(Ljava/lang/String;)I

    move-result v0

    int-to-long v0, v0

    return-wide v0
.end method
