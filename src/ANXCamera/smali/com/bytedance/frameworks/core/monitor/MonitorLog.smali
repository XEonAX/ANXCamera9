.class public Lcom/bytedance/frameworks/core/monitor/MonitorLog;
.super Ljava/lang/Object;
.source "MonitorLog.java"


# static fields
.field private static final MAX_QUEUE_SIZE:I = 0x7d0

.field private static final TAG:Ljava/lang/String; = "monitorLog"

.field private static sMonLog:Lcom/bytedance/frameworks/core/monitor/MonitorLog;


# instance fields
.field private final WAIT_INSERT_DB_LOG_SIZE:I

.field private final WAIT_INSERT_DB_TIME:I

.field private final mCountInfo:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/bytedance/frameworks/core/monitor/model/CountInfo;",
            ">;"
        }
    .end annotation
.end field

.field private mLastInsertDBTime:J

.field private mLoalStoreManager:Lcom/bytedance/frameworks/core/monitor/LogStoreManager;

.field private mLogVersionManager:Lcom/bytedance/frameworks/core/monitor/LogVersionManager;

.field private final mPendingQueue:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Lcom/bytedance/frameworks/core/monitor/model/LocalLog;",
            ">;"
        }
    .end annotation
.end field

.field private final mTimerInfo:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/bytedance/frameworks/core/monitor/model/TimerInfo;",
            ">;"
        }
    .end annotation
.end field

.field private reportInterval:I


# direct methods
.method public constructor <init>(Lcom/bytedance/frameworks/core/monitor/LogStoreManager;Lcom/bytedance/frameworks/core/monitor/LogVersionManager;)V
    .locals 3

    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorLog;->mCountInfo:Ljava/util/HashMap;

    .line 29
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorLog;->mTimerInfo:Ljava/util/HashMap;

    .line 30
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorLog;->mPendingQueue:Ljava/util/LinkedList;

    .line 33
    const/16 v0, 0x78

    iput v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorLog;->reportInterval:I

    .line 34
    const/4 v0, 0x5

    iput v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorLog;->WAIT_INSERT_DB_LOG_SIZE:I

    .line 35
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorLog;->mLastInsertDBTime:J

    .line 36
    const v0, 0x1d4c0

    iput v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorLog;->WAIT_INSERT_DB_TIME:I

    .line 51
    const-string v0, "monitorlib"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "MonitorLog: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->getAid()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " , threadName: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 52
    iput-object p1, p0, Lcom/bytedance/frameworks/core/monitor/MonitorLog;->mLoalStoreManager:Lcom/bytedance/frameworks/core/monitor/LogStoreManager;

    .line 53
    iput-object p2, p0, Lcom/bytedance/frameworks/core/monitor/MonitorLog;->mLogVersionManager:Lcom/bytedance/frameworks/core/monitor/LogVersionManager;

    .line 54
    return-void
.end method

.method private packStatEntry(Ljava/lang/String;Lcom/bytedance/frameworks/core/monitor/model/CountInfo;Lcom/bytedance/frameworks/core/monitor/model/TimerInfo;)Lorg/json/JSONObject;
    .locals 3

    .line 222
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 223
    const-string v1, "count"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    .line 225
    :try_start_0
    const-string p1, "type"

    iget-object p3, p2, Lcom/bytedance/frameworks/core/monitor/model/CountInfo;->type:Ljava/lang/String;

    invoke-virtual {v0, p1, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 226
    const-string p1, "key"

    iget-object p3, p2, Lcom/bytedance/frameworks/core/monitor/model/CountInfo;->key:Ljava/lang/String;

    invoke-virtual {v0, p1, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 227
    const-string p1, "value"

    iget p2, p2, Lcom/bytedance/frameworks/core/monitor/model/CountInfo;->count:F

    float-to-double p2, p2

    invoke-virtual {v0, p1, p2, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 228
    return-object v0

    .line 229
    :catch_0
    move-exception p1

    .line 230
    return-object v2

    .line 232
    :cond_0
    const-string p2, "timer"

    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 234
    :try_start_1
    const-string p1, "type"

    iget-object p2, p3, Lcom/bytedance/frameworks/core/monitor/model/TimerInfo;->type:Ljava/lang/String;

    invoke-virtual {v0, p1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 235
    const-string p1, "key"

    iget-object p2, p3, Lcom/bytedance/frameworks/core/monitor/model/TimerInfo;->key:Ljava/lang/String;

    invoke-virtual {v0, p1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 236
    const-string p1, "value"

    iget p2, p3, Lcom/bytedance/frameworks/core/monitor/model/TimerInfo;->value:F

    iget p3, p3, Lcom/bytedance/frameworks/core/monitor/model/TimerInfo;->times:I

    int-to-float p3, p3

    div-float/2addr p2, p3

    float-to-double p2, p2

    invoke-virtual {v0, p1, p2, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 237
    return-object v0

    .line 238
    :catch_1
    move-exception p1

    .line 239
    const-string p2, "monitorLog"

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "packStatEntry json failed"

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 240
    return-object v2

    .line 243
    :cond_1
    return-object v2
.end method


# virtual methods
.method protected directSendCount(Lcom/bytedance/frameworks/core/monitor/model/InitialLogInfo;)V
    .locals 4

    .line 147
    if-nez p1, :cond_0

    .line 148
    return-void

    .line 150
    :cond_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 152
    :try_start_0
    const-string v1, "type"

    iget-object v2, p1, Lcom/bytedance/frameworks/core/monitor/model/InitialLogInfo;->type:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 153
    const-string v1, "key"

    iget-object v2, p1, Lcom/bytedance/frameworks/core/monitor/model/InitialLogInfo;->key:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 154
    const-string v1, "value"

    iget v2, p1, Lcom/bytedance/frameworks/core/monitor/model/InitialLogInfo;->value:F

    float-to-double v2, v2

    invoke-virtual {v0, v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    .line 155
    const-string v1, "count"

    iget-object v2, p1, Lcom/bytedance/frameworks/core/monitor/model/InitialLogInfo;->type2:Ljava/lang/String;

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    iget-boolean p1, p1, Lcom/bytedance/frameworks/core/monitor/model/InitialLogInfo;->isSampled:Z

    invoke-virtual {p0, v1, v2, v0, p1}, Lcom/bytedance/frameworks/core/monitor/MonitorLog;->enqueue(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 158
    goto :goto_0

    .line 156
    :catch_0
    move-exception p1

    .line 157
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    .line 159
    :goto_0
    return-void
.end method

.method protected directSendTimer(Lcom/bytedance/frameworks/core/monitor/model/InitialLogInfo;)V
    .locals 4

    .line 162
    if-nez p1, :cond_0

    .line 163
    return-void

    .line 165
    :cond_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 167
    :try_start_0
    const-string v1, "type"

    iget-object v2, p1, Lcom/bytedance/frameworks/core/monitor/model/InitialLogInfo;->type:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 168
    const-string v1, "key"

    iget-object v2, p1, Lcom/bytedance/frameworks/core/monitor/model/InitialLogInfo;->key:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 169
    const-string v1, "value"

    iget v2, p1, Lcom/bytedance/frameworks/core/monitor/model/InitialLogInfo;->value:F

    float-to-double v2, v2

    invoke-virtual {v0, v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    .line 170
    const-string v1, "timer"

    const-string v2, ""

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    iget-boolean p1, p1, Lcom/bytedance/frameworks/core/monitor/model/InitialLogInfo;->isSampled:Z

    invoke-virtual {p0, v1, v2, v0, p1}, Lcom/bytedance/frameworks/core/monitor/MonitorLog;->enqueue(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 173
    goto :goto_0

    .line 171
    :catch_0
    move-exception p1

    .line 172
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    .line 174
    :goto_0
    return-void
.end method

.method protected enqueue(Lcom/bytedance/frameworks/core/monitor/model/LocalLog;)V
    .locals 2

    .line 108
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorLog;->mPendingQueue:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    move-result v0

    const/16 v1, 0x7d0

    if-lt v0, v1, :cond_0

    .line 109
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorLog;->mPendingQueue:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->poll()Ljava/lang/Object;

    .line 111
    :cond_0
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorLog;->mPendingQueue:Ljava/util/LinkedList;

    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 112
    return-void
.end method

.method protected enqueue(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 2

    .line 124
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 127
    :cond_0
    new-instance v0, Lcom/bytedance/frameworks/core/monitor/model/LocalLog;

    invoke-direct {v0}, Lcom/bytedance/frameworks/core/monitor/model/LocalLog;-><init>()V

    invoke-virtual {v0, p1}, Lcom/bytedance/frameworks/core/monitor/model/LocalLog;->setType(Ljava/lang/String;)Lcom/bytedance/frameworks/core/monitor/model/LocalLog;

    move-result-object p1

    invoke-virtual {p1, p2}, Lcom/bytedance/frameworks/core/monitor/model/LocalLog;->setType2(Ljava/lang/String;)Lcom/bytedance/frameworks/core/monitor/model/LocalLog;

    move-result-object p1

    invoke-virtual {p1, p3}, Lcom/bytedance/frameworks/core/monitor/model/LocalLog;->setData(Ljava/lang/String;)Lcom/bytedance/frameworks/core/monitor/model/LocalLog;

    move-result-object p1

    invoke-virtual {p1, p4}, Lcom/bytedance/frameworks/core/monitor/model/LocalLog;->setIsSampled(Z)Lcom/bytedance/frameworks/core/monitor/model/LocalLog;

    move-result-object p1

    .line 128
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p2

    const-wide/16 v0, 0x3e8

    div-long/2addr p2, v0

    invoke-virtual {p1, p2, p3}, Lcom/bytedance/frameworks/core/monitor/model/LocalLog;->setTimestamp(J)Lcom/bytedance/frameworks/core/monitor/model/LocalLog;

    move-result-object p1

    iget-object p2, p0, Lcom/bytedance/frameworks/core/monitor/MonitorLog;->mLogVersionManager:Lcom/bytedance/frameworks/core/monitor/LogVersionManager;

    invoke-virtual {p2}, Lcom/bytedance/frameworks/core/monitor/LogVersionManager;->getCurrentVersionId()J

    move-result-wide p2

    invoke-virtual {p1, p2, p3}, Lcom/bytedance/frameworks/core/monitor/model/LocalLog;->setVersionId(J)Lcom/bytedance/frameworks/core/monitor/model/LocalLog;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/bytedance/frameworks/core/monitor/MonitorLog;->enqueue(Lcom/bytedance/frameworks/core/monitor/model/LocalLog;)V

    .line 129
    return-void

    .line 125
    :cond_1
    :goto_0
    return-void
.end method

.method protected enqueue(Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 1

    .line 104
    const-string v0, ""

    invoke-virtual {p0, p1, v0, p2, p3}, Lcom/bytedance/frameworks/core/monitor/MonitorLog;->enqueue(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 105
    return-void
.end method

.method public handleCount(Lcom/bytedance/frameworks/core/monitor/model/InitialLogInfo;)V
    .locals 11

    .line 62
    if-nez p1, :cond_0

    .line 63
    return-void

    .line 65
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p1, Lcom/bytedance/frameworks/core/monitor/model/InitialLogInfo;->key:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p1, Lcom/bytedance/frameworks/core/monitor/model/InitialLogInfo;->type:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p1, Lcom/bytedance/frameworks/core/monitor/model/InitialLogInfo;->type2:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 66
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    const-wide/16 v3, 0x3e8

    div-long v9, v1, v3

    .line 67
    iget-object v1, p0, Lcom/bytedance/frameworks/core/monitor/MonitorLog;->mCountInfo:Ljava/util/HashMap;

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/bytedance/frameworks/core/monitor/model/CountInfo;

    .line 68
    if-nez v1, :cond_1

    .line 69
    new-instance v1, Lcom/bytedance/frameworks/core/monitor/model/CountInfo;

    iget-object v6, p1, Lcom/bytedance/frameworks/core/monitor/model/InitialLogInfo;->key:Ljava/lang/String;

    iget-object v7, p1, Lcom/bytedance/frameworks/core/monitor/model/InitialLogInfo;->type:Ljava/lang/String;

    const/4 v8, 0x0

    move-object v5, v1

    invoke-direct/range {v5 .. v10}, Lcom/bytedance/frameworks/core/monitor/model/CountInfo;-><init>(Ljava/lang/String;Ljava/lang/String;FJ)V

    iget-object v2, p1, Lcom/bytedance/frameworks/core/monitor/model/InitialLogInfo;->type2:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/bytedance/frameworks/core/monitor/model/CountInfo;->setType2(Ljava/lang/String;)Lcom/bytedance/frameworks/core/monitor/model/CountInfo;

    move-result-object v1

    .line 70
    iget-object v2, p0, Lcom/bytedance/frameworks/core/monitor/MonitorLog;->mCountInfo:Ljava/util/HashMap;

    invoke-virtual {v2, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 72
    :cond_1
    iget-boolean v0, v1, Lcom/bytedance/frameworks/core/monitor/model/CountInfo;->isSampled:Z

    if-nez v0, :cond_3

    iget-boolean v0, p1, Lcom/bytedance/frameworks/core/monitor/model/InitialLogInfo;->isSampled:Z

    if-eqz v0, :cond_2

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    goto :goto_1

    :cond_3
    :goto_0
    const/4 v0, 0x1

    :goto_1
    iput-boolean v0, v1, Lcom/bytedance/frameworks/core/monitor/model/CountInfo;->isSampled:Z

    .line 73
    iget v0, v1, Lcom/bytedance/frameworks/core/monitor/model/CountInfo;->count:F

    iget p1, p1, Lcom/bytedance/frameworks/core/monitor/model/InitialLogInfo;->value:F

    add-float/2addr v0, p1

    iput v0, v1, Lcom/bytedance/frameworks/core/monitor/model/CountInfo;->count:F

    .line 74
    return-void
.end method

.method protected handleDebug(Lcom/bytedance/frameworks/core/monitor/model/DebugRealLog;)V
    .locals 3

    .line 132
    if-nez p1, :cond_0

    .line 133
    return-void

    .line 135
    :cond_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 137
    :try_start_0
    const-string v1, "log_type"

    const-string v2, "debug_real"

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 138
    const-string v1, "value"

    iget-object v2, p1, Lcom/bytedance/frameworks/core/monitor/model/DebugRealLog;->value:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 139
    const-string v1, "trace_code"

    iget-object p1, p1, Lcom/bytedance/frameworks/core/monitor/model/DebugRealLog;->traceCode:Ljava/lang/String;

    invoke-virtual {v0, v1, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 140
    const-string p1, "debug_real"

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {p0, p1, v0, v1}, Lcom/bytedance/frameworks/core/monitor/MonitorLog;->enqueue(Ljava/lang/String;Ljava/lang/String;Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 143
    goto :goto_0

    .line 141
    :catch_0
    move-exception p1

    .line 144
    :goto_0
    return-void
.end method

.method protected handleLogToQueue()V
    .locals 9

    .line 181
    :try_start_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    const-wide/16 v2, 0x3e8

    div-long/2addr v0, v2

    .line 182
    iget-object v2, p0, Lcom/bytedance/frameworks/core/monitor/MonitorLog;->mCountInfo:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->isEmpty()Z

    move-result v2

    const/4 v3, 0x0

    if-nez v2, :cond_1

    .line 183
    iget-object v2, p0, Lcom/bytedance/frameworks/core/monitor/MonitorLog;->mCountInfo:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 184
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 185
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map$Entry;

    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/bytedance/frameworks/core/monitor/model/CountInfo;

    .line 186
    iget-wide v5, v4, Lcom/bytedance/frameworks/core/monitor/model/CountInfo;->firstTime:J

    sub-long v5, v0, v5

    iget v7, p0, Lcom/bytedance/frameworks/core/monitor/MonitorLog;->reportInterval:I

    int-to-long v7, v7

    cmp-long v5, v5, v7

    if-lez v5, :cond_0

    .line 187
    invoke-interface {v2}, Ljava/util/Iterator;->remove()V

    .line 188
    const-string v5, "count"

    invoke-direct {p0, v5, v4, v3}, Lcom/bytedance/frameworks/core/monitor/MonitorLog;->packStatEntry(Ljava/lang/String;Lcom/bytedance/frameworks/core/monitor/model/CountInfo;Lcom/bytedance/frameworks/core/monitor/model/TimerInfo;)Lorg/json/JSONObject;

    move-result-object v5

    .line 189
    if-eqz v5, :cond_0

    .line 190
    const-string v6, "count"

    iget-object v7, v4, Lcom/bytedance/frameworks/core/monitor/model/CountInfo;->type2:Ljava/lang/String;

    invoke-virtual {v5}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v5

    iget-boolean v4, v4, Lcom/bytedance/frameworks/core/monitor/model/CountInfo;->isSampled:Z

    invoke-virtual {p0, v6, v7, v5, v4}, Lcom/bytedance/frameworks/core/monitor/MonitorLog;->enqueue(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 193
    :cond_0
    goto :goto_0

    .line 195
    :cond_1
    iget-object v2, p0, Lcom/bytedance/frameworks/core/monitor/MonitorLog;->mTimerInfo:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_3

    .line 196
    iget-object v2, p0, Lcom/bytedance/frameworks/core/monitor/MonitorLog;->mTimerInfo:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 197
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3

    .line 198
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map$Entry;

    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/bytedance/frameworks/core/monitor/model/TimerInfo;

    .line 199
    iget-wide v5, v4, Lcom/bytedance/frameworks/core/monitor/model/TimerInfo;->firstTime:J

    sub-long v5, v0, v5

    iget v7, p0, Lcom/bytedance/frameworks/core/monitor/MonitorLog;->reportInterval:I

    int-to-long v7, v7

    cmp-long v5, v5, v7

    if-lez v5, :cond_2

    .line 200
    invoke-interface {v2}, Ljava/util/Iterator;->remove()V

    .line 201
    const-string v5, "timer"

    invoke-direct {p0, v5, v3, v4}, Lcom/bytedance/frameworks/core/monitor/MonitorLog;->packStatEntry(Ljava/lang/String;Lcom/bytedance/frameworks/core/monitor/model/CountInfo;Lcom/bytedance/frameworks/core/monitor/model/TimerInfo;)Lorg/json/JSONObject;

    move-result-object v5

    .line 202
    if-eqz v5, :cond_2

    .line 203
    const-string v6, "timer"

    iget-object v7, v4, Lcom/bytedance/frameworks/core/monitor/model/TimerInfo;->type2:Ljava/lang/String;

    invoke-virtual {v5}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v5

    iget-boolean v4, v4, Lcom/bytedance/frameworks/core/monitor/model/TimerInfo;->isSampled:Z

    invoke-virtual {p0, v6, v7, v5, v4}, Lcom/bytedance/frameworks/core/monitor/MonitorLog;->enqueue(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 206
    :cond_2
    goto :goto_1

    .line 210
    :cond_3
    goto :goto_2

    .line 208
    :catch_0
    move-exception v0

    .line 209
    const-string v1, "monitorLog"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "handleLogToQueue function failed :"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 211
    :goto_2
    return-void
.end method

.method protected handleTimer(Lcom/bytedance/frameworks/core/monitor/model/InitialLogInfo;)V
    .locals 12

    .line 82
    if-nez p1, :cond_0

    .line 83
    return-void

    .line 85
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p1, Lcom/bytedance/frameworks/core/monitor/model/InitialLogInfo;->key:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p1, Lcom/bytedance/frameworks/core/monitor/model/InitialLogInfo;->type:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p1, Lcom/bytedance/frameworks/core/monitor/model/InitialLogInfo;->type2:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 86
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    const-wide/16 v3, 0x3e8

    div-long v10, v1, v3

    .line 87
    iget-object v1, p0, Lcom/bytedance/frameworks/core/monitor/MonitorLog;->mTimerInfo:Ljava/util/HashMap;

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/bytedance/frameworks/core/monitor/model/TimerInfo;

    .line 88
    if-nez v1, :cond_1

    .line 89
    new-instance v1, Lcom/bytedance/frameworks/core/monitor/model/TimerInfo;

    iget-object v6, p1, Lcom/bytedance/frameworks/core/monitor/model/InitialLogInfo;->key:Ljava/lang/String;

    iget-object v7, p1, Lcom/bytedance/frameworks/core/monitor/model/InitialLogInfo;->type:Ljava/lang/String;

    const/4 v8, 0x0

    const/4 v9, 0x0

    move-object v5, v1

    invoke-direct/range {v5 .. v11}, Lcom/bytedance/frameworks/core/monitor/model/TimerInfo;-><init>(Ljava/lang/String;Ljava/lang/String;IFJ)V

    iget-object v2, p1, Lcom/bytedance/frameworks/core/monitor/model/InitialLogInfo;->type2:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/bytedance/frameworks/core/monitor/model/TimerInfo;->setType2(Ljava/lang/String;)Lcom/bytedance/frameworks/core/monitor/model/TimerInfo;

    move-result-object v1

    .line 90
    iget-object v2, p0, Lcom/bytedance/frameworks/core/monitor/MonitorLog;->mTimerInfo:Ljava/util/HashMap;

    invoke-virtual {v2, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 92
    :cond_1
    iget-boolean v0, v1, Lcom/bytedance/frameworks/core/monitor/model/TimerInfo;->isSampled:Z

    const/4 v2, 0x1

    if-nez v0, :cond_3

    iget-boolean v0, p1, Lcom/bytedance/frameworks/core/monitor/model/InitialLogInfo;->isSampled:Z

    if-eqz v0, :cond_2

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    goto :goto_1

    :cond_3
    :goto_0
    move v0, v2

    :goto_1
    iput-boolean v0, v1, Lcom/bytedance/frameworks/core/monitor/model/TimerInfo;->isSampled:Z

    .line 93
    iget v0, v1, Lcom/bytedance/frameworks/core/monitor/model/TimerInfo;->value:F

    iget p1, p1, Lcom/bytedance/frameworks/core/monitor/model/InitialLogInfo;->value:F

    add-float/2addr v0, p1

    iput v0, v1, Lcom/bytedance/frameworks/core/monitor/model/TimerInfo;->value:F

    .line 94
    iget p1, v1, Lcom/bytedance/frameworks/core/monitor/model/TimerInfo;->times:I

    add-int/2addr p1, v2

    iput p1, v1, Lcom/bytedance/frameworks/core/monitor/model/TimerInfo;->times:I

    .line 95
    return-void
.end method

.method public processPendingQueue(Z)Z
    .locals 6

    .line 273
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 274
    iget-object v2, p0, Lcom/bytedance/frameworks/core/monitor/MonitorLog;->mPendingQueue:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->size()I

    move-result v2

    .line 275
    if-lez v2, :cond_1

    if-nez p1, :cond_0

    const/4 p1, 0x5

    if-ge v2, p1, :cond_0

    iget-wide v2, p0, Lcom/bytedance/frameworks/core/monitor/MonitorLog;->mLastInsertDBTime:J

    sub-long v2, v0, v2

    const-wide/32 v4, 0x1d4c0

    cmp-long p1, v2, v4

    if-lez p1, :cond_1

    .line 276
    :cond_0
    iput-wide v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorLog;->mLastInsertDBTime:J

    .line 277
    new-instance p1, Ljava/util/LinkedList;

    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorLog;->mPendingQueue:Ljava/util/LinkedList;

    invoke-direct {p1, v0}, Ljava/util/LinkedList;-><init>(Ljava/util/Collection;)V

    .line 278
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorLog;->mPendingQueue:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->clear()V

    .line 280
    :try_start_0
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorLog;->mLoalStoreManager:Lcom/bytedance/frameworks/core/monitor/LogStoreManager;

    invoke-virtual {v0, p1}, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->insertLocalLogBatch(Ljava/util/List;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 282
    goto :goto_0

    .line 281
    :catch_0
    move-exception p1

    .line 283
    :goto_0
    const/4 p1, 0x1

    return p1

    .line 285
    :cond_1
    const/4 p1, 0x0

    return p1
.end method

.method protected quit()V
    .locals 2

    .line 250
    const-class v0, Lcom/bytedance/frameworks/core/monitor/MonitorLog;

    monitor-enter v0

    .line 251
    :try_start_0
    sget-object v1, Lcom/bytedance/frameworks/core/monitor/MonitorLog;->sMonLog:Lcom/bytedance/frameworks/core/monitor/MonitorLog;

    if-nez v1, :cond_0

    .line 252
    monitor-exit v0

    return-void

    .line 254
    :cond_0
    sget-object v1, Lcom/bytedance/frameworks/core/monitor/MonitorLog;->sMonLog:Lcom/bytedance/frameworks/core/monitor/MonitorLog;

    invoke-virtual {v1}, Lcom/bytedance/frameworks/core/monitor/MonitorLog;->stop()V

    .line 255
    const/4 v1, 0x0

    sput-object v1, Lcom/bytedance/frameworks/core/monitor/MonitorLog;->sMonLog:Lcom/bytedance/frameworks/core/monitor/MonitorLog;

    .line 256
    monitor-exit v0

    .line 257
    return-void

    .line 256
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method protected saveDBImmediate(Lcom/bytedance/frameworks/core/monitor/model/LocalLog;)V
    .locals 1

    .line 115
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorLog;->mLoalStoreManager:Lcom/bytedance/frameworks/core/monitor/LogStoreManager;

    if-eqz v0, :cond_0

    .line 117
    :try_start_0
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorLog;->mLoalStoreManager:Lcom/bytedance/frameworks/core/monitor/LogStoreManager;

    invoke-virtual {v0, p1}, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->insertLocalLog(Lcom/bytedance/frameworks/core/monitor/model/LocalLog;)J
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 119
    goto :goto_0

    .line 118
    :catch_0
    move-exception p1

    .line 121
    :cond_0
    :goto_0
    return-void
.end method

.method public stop()V
    .locals 1

    .line 260
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorLog;->mPendingQueue:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->clear()V

    .line 261
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorLog;->mPendingQueue:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 262
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorLog;->mLoalStoreManager:Lcom/bytedance/frameworks/core/monitor/LogStoreManager;

    if-nez v0, :cond_0

    .line 263
    return-void

    .line 265
    :cond_0
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorLog;->mLoalStoreManager:Lcom/bytedance/frameworks/core/monitor/LogStoreManager;

    invoke-virtual {v0}, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->closeDB()V

    .line 266
    return-void
.end method
