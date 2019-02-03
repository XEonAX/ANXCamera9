.class public Lcom/bytedance/frameworks/core/monitor/MonitorLogHandler;
.super Landroid/os/Handler;
.source "MonitorLogHandler.java"


# instance fields
.field private volatile mAid:Ljava/lang/String;

.field private volatile mContext:Landroid/content/Context;

.field private mLogReportManager:Lcom/bytedance/frameworks/core/monitor/LogReportManager;

.field private mLogStoreManager:Lcom/bytedance/frameworks/core/monitor/LogStoreManager;

.field private mLogVersionManager:Lcom/bytedance/frameworks/core/monitor/LogVersionManager;

.field private mMonitorLog:Lcom/bytedance/frameworks/core/monitor/MonitorLog;


# direct methods
.method public constructor <init>(Landroid/os/Looper;Landroid/content/Context;Ljava/lang/String;)V
    .locals 0

    .line 31
    invoke-direct {p0, p1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 32
    iput-object p2, p0, Lcom/bytedance/frameworks/core/monitor/MonitorLogHandler;->mContext:Landroid/content/Context;

    .line 33
    iput-object p3, p0, Lcom/bytedance/frameworks/core/monitor/MonitorLogHandler;->mAid:Ljava/lang/String;

    .line 34
    return-void
.end method

.method private handleCleanExpiredLog(Landroid/os/Message;)V
    .locals 3

    .line 212
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorLogHandler;->mLogStoreManager:Lcom/bytedance/frameworks/core/monitor/LogStoreManager;

    if-eqz v0, :cond_0

    .line 213
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorLogHandler;->mLogStoreManager:Lcom/bytedance/frameworks/core/monitor/LogStoreManager;

    iget p1, p1, Landroid/os/Message;->arg1:I

    int-to-long v1, p1

    invoke-virtual {v0, v1, v2}, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->cleanExpiredLog(J)V

    .line 215
    :cond_0
    return-void
.end method

.method private handleCount(Landroid/os/Message;)V
    .locals 1

    .line 105
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorLogHandler;->mMonitorLog:Lcom/bytedance/frameworks/core/monitor/MonitorLog;

    if-eqz v0, :cond_0

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    if-eqz v0, :cond_0

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    instance-of v0, v0, Lcom/bytedance/frameworks/core/monitor/model/InitialLogInfo;

    if-eqz v0, :cond_0

    .line 106
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorLogHandler;->mMonitorLog:Lcom/bytedance/frameworks/core/monitor/MonitorLog;

    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Lcom/bytedance/frameworks/core/monitor/model/InitialLogInfo;

    invoke-virtual {v0, p1}, Lcom/bytedance/frameworks/core/monitor/MonitorLog;->handleCount(Lcom/bytedance/frameworks/core/monitor/model/InitialLogInfo;)V

    .line 108
    :cond_0
    return-void
.end method

.method private handleDebugReal(Landroid/os/Message;)V
    .locals 1

    .line 129
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorLogHandler;->mMonitorLog:Lcom/bytedance/frameworks/core/monitor/MonitorLog;

    if-eqz v0, :cond_0

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    if-eqz v0, :cond_0

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    instance-of v0, v0, Lcom/bytedance/frameworks/core/monitor/model/DebugRealLog;

    if-eqz v0, :cond_0

    .line 130
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorLogHandler;->mMonitorLog:Lcom/bytedance/frameworks/core/monitor/MonitorLog;

    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Lcom/bytedance/frameworks/core/monitor/model/DebugRealLog;

    invoke-virtual {v0, p1}, Lcom/bytedance/frameworks/core/monitor/MonitorLog;->handleDebug(Lcom/bytedance/frameworks/core/monitor/model/DebugRealLog;)V

    .line 132
    :cond_0
    return-void
.end method

.method private handleDirectCount(Landroid/os/Message;)V
    .locals 1

    .line 117
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorLogHandler;->mMonitorLog:Lcom/bytedance/frameworks/core/monitor/MonitorLog;

    if-eqz v0, :cond_0

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    if-eqz v0, :cond_0

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    instance-of v0, v0, Lcom/bytedance/frameworks/core/monitor/model/InitialLogInfo;

    if-eqz v0, :cond_0

    .line 118
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorLogHandler;->mMonitorLog:Lcom/bytedance/frameworks/core/monitor/MonitorLog;

    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Lcom/bytedance/frameworks/core/monitor/model/InitialLogInfo;

    invoke-virtual {v0, p1}, Lcom/bytedance/frameworks/core/monitor/MonitorLog;->directSendCount(Lcom/bytedance/frameworks/core/monitor/model/InitialLogInfo;)V

    .line 120
    :cond_0
    return-void
.end method

.method private handleDirectTimer(Landroid/os/Message;)V
    .locals 1

    .line 123
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorLogHandler;->mMonitorLog:Lcom/bytedance/frameworks/core/monitor/MonitorLog;

    if-eqz v0, :cond_0

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    if-eqz v0, :cond_0

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    instance-of v0, v0, Lcom/bytedance/frameworks/core/monitor/model/InitialLogInfo;

    if-eqz v0, :cond_0

    .line 124
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorLogHandler;->mMonitorLog:Lcom/bytedance/frameworks/core/monitor/MonitorLog;

    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Lcom/bytedance/frameworks/core/monitor/model/InitialLogInfo;

    invoke-virtual {v0, p1}, Lcom/bytedance/frameworks/core/monitor/MonitorLog;->directSendTimer(Lcom/bytedance/frameworks/core/monitor/model/InitialLogInfo;)V

    .line 126
    :cond_0
    return-void
.end method

.method private handleFlushBuffer()V
    .locals 2

    .line 169
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorLogHandler;->mMonitorLog:Lcom/bytedance/frameworks/core/monitor/MonitorLog;

    if-eqz v0, :cond_0

    .line 170
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorLogHandler;->mMonitorLog:Lcom/bytedance/frameworks/core/monitor/MonitorLog;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/bytedance/frameworks/core/monitor/MonitorLog;->processPendingQueue(Z)Z

    .line 172
    :cond_0
    return-void
.end method

.method private handleLogSend(Landroid/os/Message;)V
    .locals 5

    .line 150
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorLogHandler;->mMonitorLog:Lcom/bytedance/frameworks/core/monitor/MonitorLog;

    if-eqz v0, :cond_1

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    if-eqz v0, :cond_1

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    instance-of v0, v0, Lcom/bytedance/frameworks/core/monitor/model/LocalLog;

    if-eqz v0, :cond_1

    .line 151
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lcom/bytedance/frameworks/core/monitor/model/LocalLog;

    .line 152
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    const-wide/16 v3, 0x3e8

    div-long/2addr v1, v3

    iput-wide v1, v0, Lcom/bytedance/frameworks/core/monitor/model/LocalLog;->createTime:J

    .line 153
    iget-object v1, p0, Lcom/bytedance/frameworks/core/monitor/MonitorLogHandler;->mLogVersionManager:Lcom/bytedance/frameworks/core/monitor/LogVersionManager;

    invoke-virtual {v1}, Lcom/bytedance/frameworks/core/monitor/LogVersionManager;->getCurrentVersionId()J

    move-result-wide v1

    iput-wide v1, v0, Lcom/bytedance/frameworks/core/monitor/model/LocalLog;->versionId:J

    .line 154
    iget p1, p1, Landroid/os/Message;->arg1:I

    const/4 v1, 0x1

    if-ne p1, v1, :cond_0

    .line 155
    iget-object p1, p0, Lcom/bytedance/frameworks/core/monitor/MonitorLogHandler;->mMonitorLog:Lcom/bytedance/frameworks/core/monitor/MonitorLog;

    invoke-virtual {p1, v0}, Lcom/bytedance/frameworks/core/monitor/MonitorLog;->saveDBImmediate(Lcom/bytedance/frameworks/core/monitor/model/LocalLog;)V

    goto :goto_0

    .line 157
    :cond_0
    iget-object p1, p0, Lcom/bytedance/frameworks/core/monitor/MonitorLogHandler;->mMonitorLog:Lcom/bytedance/frameworks/core/monitor/MonitorLog;

    invoke-virtual {p1, v0}, Lcom/bytedance/frameworks/core/monitor/MonitorLog;->enqueue(Lcom/bytedance/frameworks/core/monitor/model/LocalLog;)V

    .line 160
    :cond_1
    :goto_0
    return-void
.end method

.method private handleLogTimedTask()V
    .locals 2

    .line 175
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorLogHandler;->mMonitorLog:Lcom/bytedance/frameworks/core/monitor/MonitorLog;

    if-eqz v0, :cond_0

    .line 176
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorLogHandler;->mMonitorLog:Lcom/bytedance/frameworks/core/monitor/MonitorLog;

    invoke-virtual {v0}, Lcom/bytedance/frameworks/core/monitor/MonitorLog;->handleLogToQueue()V

    .line 177
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorLogHandler;->mMonitorLog:Lcom/bytedance/frameworks/core/monitor/MonitorLog;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/bytedance/frameworks/core/monitor/MonitorLog;->processPendingQueue(Z)Z

    .line 179
    :cond_0
    return-void
.end method

.method private handlePackAndSendLog()V
    .locals 1

    .line 182
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorLogHandler;->mLogReportManager:Lcom/bytedance/frameworks/core/monitor/LogReportManager;

    if-eqz v0, :cond_0

    .line 183
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorLogHandler;->mLogReportManager:Lcom/bytedance/frameworks/core/monitor/LogReportManager;

    invoke-virtual {v0}, Lcom/bytedance/frameworks/core/monitor/LogReportManager;->packAndSendLog()V

    .line 185
    :cond_0
    return-void
.end method

.method private handleReportLogCountDaily(Landroid/os/Message;)V
    .locals 8

    .line 188
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorLogHandler;->mLogStoreManager:Lcom/bytedance/frameworks/core/monitor/LogStoreManager;

    if-eqz v0, :cond_1

    .line 189
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorLogHandler;->mLogStoreManager:Lcom/bytedance/frameworks/core/monitor/LogStoreManager;

    invoke-static {}, Lcom/bytedance/frameworks/core/monitor/util/TimeUtils;->getYesterdayStart()J

    move-result-wide v1

    invoke-static {}, Lcom/bytedance/frameworks/core/monitor/util/TimeUtils;->getYesterdayEnd()J

    move-result-wide v3

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->getLogCountInTime(JJ)J

    move-result-wide v0

    .line 190
    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-lez v2, :cond_1

    .line 192
    :try_start_0
    iget-object v2, p0, Lcom/bytedance/frameworks/core/monitor/MonitorLogHandler;->mLogStoreManager:Lcom/bytedance/frameworks/core/monitor/LogStoreManager;

    invoke-virtual {v2}, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->getDBSizeInMB()I

    move-result v2

    .line 193
    iget-object v3, p0, Lcom/bytedance/frameworks/core/monitor/MonitorLogHandler;->mLogStoreManager:Lcom/bytedance/frameworks/core/monitor/LogStoreManager;

    invoke-virtual {v3}, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->getDBJournalSizeInKB()I

    move-result v3

    .line 194
    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    .line 195
    const-string v5, "log_type"

    const-string v6, "service_monitor"

    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 196
    const-string v5, "service"

    const-string v6, "local_monitor_count_day"

    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 197
    new-instance v5, Lorg/json/JSONObject;

    invoke-direct {v5}, Lorg/json/JSONObject;-><init>()V

    .line 198
    const-string v6, "dayCount"

    invoke-virtual {v5, v6, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 199
    const-string v0, "totalCount"

    iget-object v1, p0, Lcom/bytedance/frameworks/core/monitor/MonitorLogHandler;->mLogStoreManager:Lcom/bytedance/frameworks/core/monitor/LogStoreManager;

    invoke-virtual {v1}, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->getLogTotalCount()J

    move-result-wide v6

    invoke-virtual {v5, v0, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 200
    const-string v0, "dbSize"

    invoke-virtual {v5, v0, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 201
    const-string v0, "dbJournalSize"

    invoke-virtual {v5, v0, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 202
    const-string v0, "value"

    invoke-virtual {v4, v0, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 203
    const-string v0, "timestamp"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-virtual {v4, v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 204
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorLogHandler;->mMonitorLog:Lcom/bytedance/frameworks/core/monitor/MonitorLog;

    const-string v1, "service_monitor"

    const-string v2, "disk"

    invoke-virtual {v4}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v3

    iget p1, p1, Landroid/os/Message;->arg1:I

    const/4 v4, 0x1

    if-ne p1, v4, :cond_0

    goto :goto_0

    :cond_0
    const/4 v4, 0x0

    :goto_0
    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/bytedance/frameworks/core/monitor/MonitorLog;->enqueue(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 206
    goto :goto_1

    .line 205
    :catch_0
    move-exception p1

    .line 209
    :cond_1
    :goto_1
    return-void
.end method

.method private handleTimer(Landroid/os/Message;)V
    .locals 1

    .line 111
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorLogHandler;->mMonitorLog:Lcom/bytedance/frameworks/core/monitor/MonitorLog;

    if-eqz v0, :cond_0

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    if-eqz v0, :cond_0

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    instance-of v0, v0, Lcom/bytedance/frameworks/core/monitor/model/InitialLogInfo;

    if-eqz v0, :cond_0

    .line 112
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorLogHandler;->mMonitorLog:Lcom/bytedance/frameworks/core/monitor/MonitorLog;

    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Lcom/bytedance/frameworks/core/monitor/model/InitialLogInfo;

    invoke-virtual {v0, p1}, Lcom/bytedance/frameworks/core/monitor/MonitorLog;->handleTimer(Lcom/bytedance/frameworks/core/monitor/model/InitialLogInfo;)V

    .line 114
    :cond_0
    return-void
.end method

.method private handleUpdateCollectLogSwitch(Landroid/os/Message;)V
    .locals 1

    .line 144
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorLogHandler;->mLogReportManager:Lcom/bytedance/frameworks/core/monitor/LogReportManager;

    if-eqz v0, :cond_0

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    if-eqz v0, :cond_0

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    instance-of v0, v0, Ljava/lang/Boolean;

    if-eqz v0, :cond_0

    .line 145
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorLogHandler;->mLogReportManager:Lcom/bytedance/frameworks/core/monitor/LogReportManager;

    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    invoke-virtual {v0, p1}, Lcom/bytedance/frameworks/core/monitor/LogReportManager;->setCollectLogSwitch(Z)V

    .line 147
    :cond_0
    return-void
.end method

.method private handleUpdateConfig()V
    .locals 1

    .line 135
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorLogHandler;->mLogReportManager:Lcom/bytedance/frameworks/core/monitor/LogReportManager;

    if-eqz v0, :cond_0

    .line 136
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorLogHandler;->mLogReportManager:Lcom/bytedance/frameworks/core/monitor/LogReportManager;

    invoke-virtual {v0}, Lcom/bytedance/frameworks/core/monitor/LogReportManager;->updateConfig()V

    .line 138
    :cond_0
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorLogHandler;->mLogStoreManager:Lcom/bytedance/frameworks/core/monitor/LogStoreManager;

    if-eqz v0, :cond_1

    .line 139
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorLogHandler;->mLogStoreManager:Lcom/bytedance/frameworks/core/monitor/LogStoreManager;

    invoke-virtual {v0}, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->updateConfig()V

    .line 141
    :cond_1
    return-void
.end method

.method private handleUploadLegacy(Landroid/os/Message;)V
    .locals 1

    .line 163
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorLogHandler;->mLogReportManager:Lcom/bytedance/frameworks/core/monitor/LogReportManager;

    if-eqz v0, :cond_0

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    if-eqz v0, :cond_0

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    instance-of v0, v0, Lcom/bytedance/frameworks/core/monitor/model/UploadLogLegacyCommand;

    if-eqz v0, :cond_0

    .line 164
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorLogHandler;->mLogReportManager:Lcom/bytedance/frameworks/core/monitor/LogReportManager;

    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Lcom/bytedance/frameworks/core/monitor/model/UploadLogLegacyCommand;

    invoke-virtual {v0, p1}, Lcom/bytedance/frameworks/core/monitor/LogReportManager;->uploadLegacyLog(Lcom/bytedance/frameworks/core/monitor/model/UploadLogLegacyCommand;)V

    .line 166
    :cond_0
    return-void
.end method

.method private init()V
    .locals 4

    .line 38
    new-instance v0, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;

    iget-object v1, p0, Lcom/bytedance/frameworks/core/monitor/MonitorLogHandler;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/bytedance/frameworks/core/monitor/MonitorLogHandler;->mAid:Ljava/lang/String;

    invoke-direct {v0, v1, v2}, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorLogHandler;->mLogStoreManager:Lcom/bytedance/frameworks/core/monitor/LogStoreManager;

    .line 39
    new-instance v0, Lcom/bytedance/frameworks/core/monitor/LogVersionManager;

    iget-object v1, p0, Lcom/bytedance/frameworks/core/monitor/MonitorLogHandler;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/bytedance/frameworks/core/monitor/MonitorLogHandler;->mLogStoreManager:Lcom/bytedance/frameworks/core/monitor/LogStoreManager;

    invoke-direct {v0, v1, v2}, Lcom/bytedance/frameworks/core/monitor/LogVersionManager;-><init>(Landroid/content/Context;Lcom/bytedance/frameworks/core/monitor/LogStoreManager;)V

    iput-object v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorLogHandler;->mLogVersionManager:Lcom/bytedance/frameworks/core/monitor/LogVersionManager;

    .line 40
    new-instance v0, Lcom/bytedance/frameworks/core/monitor/LogReportManager;

    iget-object v1, p0, Lcom/bytedance/frameworks/core/monitor/MonitorLogHandler;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/bytedance/frameworks/core/monitor/MonitorLogHandler;->mAid:Ljava/lang/String;

    iget-object v3, p0, Lcom/bytedance/frameworks/core/monitor/MonitorLogHandler;->mLogStoreManager:Lcom/bytedance/frameworks/core/monitor/LogStoreManager;

    invoke-direct {v0, v1, v2, v3}, Lcom/bytedance/frameworks/core/monitor/LogReportManager;-><init>(Landroid/content/Context;Ljava/lang/String;Lcom/bytedance/frameworks/core/monitor/LogStoreManager;)V

    iput-object v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorLogHandler;->mLogReportManager:Lcom/bytedance/frameworks/core/monitor/LogReportManager;

    .line 41
    new-instance v0, Lcom/bytedance/frameworks/core/monitor/MonitorLog;

    iget-object v1, p0, Lcom/bytedance/frameworks/core/monitor/MonitorLogHandler;->mLogStoreManager:Lcom/bytedance/frameworks/core/monitor/LogStoreManager;

    iget-object v2, p0, Lcom/bytedance/frameworks/core/monitor/MonitorLogHandler;->mLogVersionManager:Lcom/bytedance/frameworks/core/monitor/LogVersionManager;

    invoke-direct {v0, v1, v2}, Lcom/bytedance/frameworks/core/monitor/MonitorLog;-><init>(Lcom/bytedance/frameworks/core/monitor/LogStoreManager;Lcom/bytedance/frameworks/core/monitor/LogVersionManager;)V

    iput-object v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorLogHandler;->mMonitorLog:Lcom/bytedance/frameworks/core/monitor/MonitorLog;

    .line 42
    return-void
.end method

.method private initVersionInfo(Landroid/os/Message;)V
    .locals 1

    .line 99
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorLogHandler;->mLogVersionManager:Lcom/bytedance/frameworks/core/monitor/LogVersionManager;

    if-eqz v0, :cond_0

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    if-eqz v0, :cond_0

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    instance-of v0, v0, Lcom/bytedance/frameworks/core/monitor/model/LocalVersionInfo;

    if-eqz v0, :cond_0

    .line 100
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorLogHandler;->mLogVersionManager:Lcom/bytedance/frameworks/core/monitor/LogVersionManager;

    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Lcom/bytedance/frameworks/core/monitor/model/LocalVersionInfo;

    invoke-virtual {v0, p1}, Lcom/bytedance/frameworks/core/monitor/LogVersionManager;->setCurrentVersionInfo(Lcom/bytedance/frameworks/core/monitor/model/LocalVersionInfo;)V

    .line 102
    :cond_0
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 1

    .line 46
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    .line 93
    :pswitch_0
    invoke-direct {p0, p1}, Lcom/bytedance/frameworks/core/monitor/MonitorLogHandler;->handleCleanExpiredLog(Landroid/os/Message;)V

    goto :goto_0

    .line 90
    :pswitch_1
    invoke-direct {p0, p1}, Lcom/bytedance/frameworks/core/monitor/MonitorLogHandler;->handleReportLogCountDaily(Landroid/os/Message;)V

    .line 91
    goto :goto_0

    .line 87
    :pswitch_2
    invoke-direct {p0}, Lcom/bytedance/frameworks/core/monitor/MonitorLogHandler;->handlePackAndSendLog()V

    .line 88
    goto :goto_0

    .line 84
    :pswitch_3
    invoke-direct {p0}, Lcom/bytedance/frameworks/core/monitor/MonitorLogHandler;->handleLogTimedTask()V

    .line 85
    goto :goto_0

    .line 81
    :pswitch_4
    invoke-direct {p0}, Lcom/bytedance/frameworks/core/monitor/MonitorLogHandler;->handleFlushBuffer()V

    .line 82
    goto :goto_0

    .line 75
    :pswitch_5
    invoke-direct {p0, p1}, Lcom/bytedance/frameworks/core/monitor/MonitorLogHandler;->handleUploadLegacy(Landroid/os/Message;)V

    .line 76
    goto :goto_0

    .line 78
    :pswitch_6
    invoke-direct {p0, p1}, Lcom/bytedance/frameworks/core/monitor/MonitorLogHandler;->handleLogSend(Landroid/os/Message;)V

    .line 79
    goto :goto_0

    .line 72
    :pswitch_7
    invoke-direct {p0, p1}, Lcom/bytedance/frameworks/core/monitor/MonitorLogHandler;->handleUpdateCollectLogSwitch(Landroid/os/Message;)V

    .line 73
    goto :goto_0

    .line 69
    :pswitch_8
    invoke-direct {p0}, Lcom/bytedance/frameworks/core/monitor/MonitorLogHandler;->handleUpdateConfig()V

    .line 70
    goto :goto_0

    .line 60
    :pswitch_9
    invoke-direct {p0, p1}, Lcom/bytedance/frameworks/core/monitor/MonitorLogHandler;->handleDirectCount(Landroid/os/Message;)V

    .line 61
    goto :goto_0

    .line 63
    :pswitch_a
    invoke-direct {p0, p1}, Lcom/bytedance/frameworks/core/monitor/MonitorLogHandler;->handleDirectTimer(Landroid/os/Message;)V

    .line 64
    goto :goto_0

    .line 66
    :pswitch_b
    invoke-direct {p0, p1}, Lcom/bytedance/frameworks/core/monitor/MonitorLogHandler;->handleDebugReal(Landroid/os/Message;)V

    .line 67
    goto :goto_0

    .line 57
    :pswitch_c
    invoke-direct {p0, p1}, Lcom/bytedance/frameworks/core/monitor/MonitorLogHandler;->handleTimer(Landroid/os/Message;)V

    .line 58
    goto :goto_0

    .line 54
    :pswitch_d
    invoke-direct {p0, p1}, Lcom/bytedance/frameworks/core/monitor/MonitorLogHandler;->handleCount(Landroid/os/Message;)V

    .line 55
    goto :goto_0

    .line 51
    :pswitch_e
    invoke-direct {p0, p1}, Lcom/bytedance/frameworks/core/monitor/MonitorLogHandler;->initVersionInfo(Landroid/os/Message;)V

    .line 52
    goto :goto_0

    .line 48
    :pswitch_f
    invoke-direct {p0}, Lcom/bytedance/frameworks/core/monitor/MonitorLogHandler;->init()V

    .line 49
    nop

    .line 96
    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
