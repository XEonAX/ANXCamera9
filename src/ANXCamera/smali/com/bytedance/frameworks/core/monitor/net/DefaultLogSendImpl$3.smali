.class Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl$3;
.super Lcom/bytedance/frameworks/baselib/log/LogHandler;
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


# direct methods
.method constructor <init>(Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl;Landroid/content/Context;Lcom/bytedance/frameworks/baselib/log/LogHandler$IConfig;Lcom/bytedance/frameworks/baselib/log/LogHandler$IResponseConfig;Ljava/lang/String;)V
    .locals 0

    .line 78
    iput-object p1, p0, Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl$3;->this$0:Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl;

    iput-object p5, p0, Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl$3;->val$aid:Ljava/lang/String;

    invoke-direct {p0, p2, p3, p4}, Lcom/bytedance/frameworks/baselib/log/LogHandler;-><init>(Landroid/content/Context;Lcom/bytedance/frameworks/baselib/log/LogHandler$IConfig;Lcom/bytedance/frameworks/baselib/log/LogHandler$IResponseConfig;)V

    return-void
.end method


# virtual methods
.method protected send(Ljava/lang/String;[B)Z
    .locals 9

    .line 81
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl$3;->val$aid:Ljava/lang/String;

    invoke-static {v0}, Lcom/bytedance/frameworks/core/monitor/net/MonitorLogSender;->getISendLog(Ljava/lang/String;)Lcom/bytedance/frameworks/core/monitor/net/ISendLog;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_6

    .line 82
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl$3;->val$aid:Ljava/lang/String;

    invoke-static {v0}, Lcom/bytedance/frameworks/core/monitor/net/MonitorLogSender;->getISendLog(Ljava/lang/String;)Lcom/bytedance/frameworks/core/monitor/net/ISendLog;

    move-result-object v2

    const-wide/32 v3, 0x2000000

    const/4 v7, 0x1

    const-string v8, "application/json; charset=utf-8"

    move-object v5, p1

    move-object v6, p2

    invoke-interface/range {v2 .. v8}, Lcom/bytedance/frameworks/core/monitor/net/ISendLog;->sendLog(JLjava/lang/String;[BILjava/lang/String;)Lcom/bytedance/frameworks/core/monitor/net/NetResponse;

    move-result-object p1

    .line 83
    const/4 p2, 0x1

    if-eqz p1, :cond_5

    iget v0, p1, Lcom/bytedance/frameworks/core/monitor/net/NetResponse;->stateCode:I

    if-lez v0, :cond_5

    .line 84
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl$3;->this$0:Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl;

    iput-boolean v1, v0, Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl;->mMoreChannelSwitch:Z

    .line 85
    iget v0, p1, Lcom/bytedance/frameworks/core/monitor/net/NetResponse;->stateCode:I

    const/16 v2, 0xc8

    const-wide/32 v3, 0x1b7740

    if-ne v0, v2, :cond_1

    iget-object v0, p1, Lcom/bytedance/frameworks/core/monitor/net/NetResponse;->responseMsg:Lorg/json/JSONObject;

    if-eqz v0, :cond_1

    .line 86
    iget-object v0, p1, Lcom/bytedance/frameworks/core/monitor/net/NetResponse;->responseMsg:Lorg/json/JSONObject;

    const-string v2, "is_crash"

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v0

    if-ne v0, p2, :cond_0

    .line 87
    iget-object p1, p0, Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl$3;->this$0:Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl;

    iput-wide v3, p1, Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl;->mStopInterval:J

    .line 88
    iget-object p1, p0, Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl$3;->this$0:Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl;

    const/4 p2, 0x3

    iput p2, p1, Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl;->mNetFailCount:I

    .line 89
    return v1

    .line 91
    :cond_0
    iget-object v0, p1, Lcom/bytedance/frameworks/core/monitor/net/NetResponse;->responseMsg:Lorg/json/JSONObject;

    const-string v2, "message"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    const-string v2, "success"

    invoke-virtual {v0, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 92
    iget-object p1, p0, Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl$3;->this$0:Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl;

    iput v1, p1, Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl;->mNetFailCount:I

    .line 93
    iget-object p1, p0, Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl$3;->this$0:Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl;

    const-wide/16 v0, 0x0

    iput-wide v0, p1, Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl;->mStopInterval:J

    .line 94
    return p2

    .line 97
    :cond_1
    const/16 v0, 0x1f4

    iget v2, p1, Lcom/bytedance/frameworks/core/monitor/net/NetResponse;->stateCode:I

    if-gt v0, v2, :cond_6

    iget p1, p1, Lcom/bytedance/frameworks/core/monitor/net/NetResponse;->stateCode:I

    const/16 v0, 0x258

    if-gt p1, v0, :cond_6

    .line 98
    iget-object p1, p0, Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl$3;->this$0:Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl;

    iget p1, p1, Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl;->mNetFailCount:I

    if-nez p1, :cond_2

    .line 99
    iget-object p1, p0, Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl$3;->this$0:Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl;

    const-wide/32 v2, 0x493e0

    iput-wide v2, p1, Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl;->mStopInterval:J

    .line 100
    iget-object p1, p0, Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl$3;->this$0:Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl;

    iget v0, p1, Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl;->mNetFailCount:I

    add-int/2addr v0, p2

    iput v0, p1, Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl;->mNetFailCount:I

    goto :goto_0

    .line 101
    :cond_2
    iget-object p1, p0, Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl$3;->this$0:Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl;

    iget p1, p1, Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl;->mNetFailCount:I

    if-ne p1, p2, :cond_3

    .line 102
    iget-object p1, p0, Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl$3;->this$0:Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl;

    const-wide/32 v2, 0xdbba0

    iput-wide v2, p1, Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl;->mStopInterval:J

    .line 103
    iget-object p1, p0, Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl$3;->this$0:Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl;

    iget v0, p1, Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl;->mNetFailCount:I

    add-int/2addr v0, p2

    iput v0, p1, Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl;->mNetFailCount:I

    goto :goto_0

    .line 104
    :cond_3
    iget-object p1, p0, Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl$3;->this$0:Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl;

    iget p1, p1, Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl;->mNetFailCount:I

    const/4 v0, 0x2

    if-ne p1, v0, :cond_4

    .line 105
    iget-object p1, p0, Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl$3;->this$0:Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl;

    iput-wide v3, p1, Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl;->mStopInterval:J

    .line 106
    iget-object p1, p0, Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl$3;->this$0:Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl;

    iget v0, p1, Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl;->mNetFailCount:I

    add-int/2addr v0, p2

    iput v0, p1, Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl;->mNetFailCount:I

    goto :goto_0

    .line 108
    :cond_4
    iget-object p1, p0, Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl$3;->this$0:Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl;

    iput-wide v3, p1, Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl;->mStopInterval:J

    .line 109
    iget-object p1, p0, Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl$3;->this$0:Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl;

    iget v0, p1, Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl;->mNetFailCount:I

    add-int/2addr v0, p2

    iput v0, p1, Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl;->mNetFailCount:I

    .line 111
    :goto_0
    return v1

    .line 114
    :cond_5
    iget-object p1, p0, Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl$3;->this$0:Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl;

    iput-boolean p2, p1, Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl;->mMoreChannelSwitch:Z

    .line 117
    :cond_6
    return v1
.end method
