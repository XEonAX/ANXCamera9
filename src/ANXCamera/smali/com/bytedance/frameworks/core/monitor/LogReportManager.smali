.class public Lcom/bytedance/frameworks/core/monitor/LogReportManager;
.super Ljava/lang/Object;
.source "LogReportManager.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "LogReportManager"


# instance fields
.field private mAid:Ljava/lang/String;

.field private volatile mCollectLogSwitch:Z

.field private mHeaderInfo:Lorg/json/JSONObject;

.field private mInterval:I

.field private mLastPackTime:J

.field private mLogStoreManager:Lcom/bytedance/frameworks/core/monitor/LogStoreManager;

.field private mReportCount:I


# direct methods
.method protected constructor <init>(Landroid/content/Context;Ljava/lang/String;Lcom/bytedance/frameworks/core/monitor/LogStoreManager;)V
    .locals 3

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/bytedance/frameworks/core/monitor/LogReportManager;->mCollectLogSwitch:Z

    .line 37
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/bytedance/frameworks/core/monitor/LogReportManager;->mLastPackTime:J

    .line 38
    const/16 v0, 0x78

    iput v0, p0, Lcom/bytedance/frameworks/core/monitor/LogReportManager;->mInterval:I

    .line 39
    const/16 v0, 0x64

    iput v0, p0, Lcom/bytedance/frameworks/core/monitor/LogReportManager;->mReportCount:I

    .line 45
    const-string v0, "monitorlib"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "LogReportManager: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->getAid()Ljava/lang/String;

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

    .line 46
    iput-object p2, p0, Lcom/bytedance/frameworks/core/monitor/LogReportManager;->mAid:Ljava/lang/String;

    .line 47
    iput-object p3, p0, Lcom/bytedance/frameworks/core/monitor/LogReportManager;->mLogStoreManager:Lcom/bytedance/frameworks/core/monitor/LogStoreManager;

    .line 48
    const-string p3, "monitor"

    new-instance v0, Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl;

    const-string v1, "monitor"

    invoke-direct {v0, p1, p2, v1}, Lcom/bytedance/frameworks/core/monitor/net/DefaultLogSendImpl;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {p2, p3, v0}, Lcom/bytedance/frameworks/core/monitor/net/MonitorLogSender;->setImpl(Ljava/lang/String;Ljava/lang/String;Lcom/bytedance/frameworks/core/monitor/net/ILogSendImpl;)V

    .line 49
    return-void
.end method

.method private getLocalStore()Lcom/bytedance/frameworks/core/monitor/LogStoreManager;
    .locals 1

    .line 52
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/LogReportManager;->mLogStoreManager:Lcom/bytedance/frameworks/core/monitor/LogStoreManager;

    return-object v0
.end method

.method private sendLog(Ljava/lang/String;Lorg/json/JSONArray;Lorg/json/JSONArray;Lorg/json/JSONArray;JZ)Z
    .locals 2

    .line 153
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 154
    invoke-static {p2}, Lcom/bytedance/frameworks/core/monitor/util/JsonUtil;->hasData(Lorg/json/JSONArray;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 155
    const-string v1, "data"

    invoke-virtual {v0, v1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 157
    :cond_0
    invoke-static {p3}, Lcom/bytedance/frameworks/core/monitor/util/JsonUtil;->hasData(Lorg/json/JSONArray;)Z

    move-result p2

    if-eqz p2, :cond_1

    .line 158
    const-string p2, "count"

    invoke-virtual {v0, p2, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 160
    :cond_1
    invoke-static {p4}, Lcom/bytedance/frameworks/core/monitor/util/JsonUtil;->hasData(Lorg/json/JSONArray;)Z

    move-result p2

    if-eqz p2, :cond_2

    .line 161
    const-string p2, "timer"

    invoke-virtual {v0, p2, p4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 163
    :cond_2
    invoke-static {v0}, Lcom/bytedance/frameworks/core/monitor/util/JsonUtil;->hasData(Lorg/json/JSONObject;)Z

    move-result p2

    if-eqz p2, :cond_7

    .line 164
    iget-object p2, p0, Lcom/bytedance/frameworks/core/monitor/LogReportManager;->mHeaderInfo:Lorg/json/JSONObject;

    if-eqz p2, :cond_7

    .line 165
    new-instance p2, Lorg/json/JSONObject;

    iget-object p3, p0, Lcom/bytedance/frameworks/core/monitor/LogReportManager;->mHeaderInfo:Lorg/json/JSONObject;

    invoke-virtual {p3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-direct {p2, p3}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 166
    invoke-direct {p0}, Lcom/bytedance/frameworks/core/monitor/LogReportManager;->getLocalStore()Lcom/bytedance/frameworks/core/monitor/LogStoreManager;

    move-result-object p3

    invoke-virtual {p3, p5, p6}, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->getLocalVersionById(J)Lcom/bytedance/frameworks/core/monitor/model/LocalVersionInfo;

    move-result-object p3

    .line 167
    if-eqz p3, :cond_6

    .line 168
    iget-object p4, p3, Lcom/bytedance/frameworks/core/monitor/model/LocalVersionInfo;->versionCode:Ljava/lang/String;

    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p4

    if-nez p4, :cond_3

    .line 169
    const-string p4, "version_code"

    iget-object p5, p3, Lcom/bytedance/frameworks/core/monitor/model/LocalVersionInfo;->versionCode:Ljava/lang/String;

    invoke-virtual {p2, p4, p5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 171
    :cond_3
    iget-object p4, p3, Lcom/bytedance/frameworks/core/monitor/model/LocalVersionInfo;->versionName:Ljava/lang/String;

    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p4

    if-nez p4, :cond_4

    .line 172
    const-string p4, "version_name"

    iget-object p5, p3, Lcom/bytedance/frameworks/core/monitor/model/LocalVersionInfo;->versionName:Ljava/lang/String;

    invoke-virtual {p2, p4, p5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 174
    :cond_4
    iget-object p4, p3, Lcom/bytedance/frameworks/core/monitor/model/LocalVersionInfo;->manifestVersionCode:Ljava/lang/String;

    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p4

    if-nez p4, :cond_5

    .line 175
    const-string p4, "manifest_version_code"

    iget-object p5, p3, Lcom/bytedance/frameworks/core/monitor/model/LocalVersionInfo;->manifestVersionCode:Ljava/lang/String;

    invoke-virtual {p2, p4, p5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 177
    :cond_5
    iget-object p4, p3, Lcom/bytedance/frameworks/core/monitor/model/LocalVersionInfo;->updateVersionCode:Ljava/lang/String;

    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p4

    if-nez p4, :cond_6

    .line 178
    const-string p4, "update_version_code"

    iget-object p3, p3, Lcom/bytedance/frameworks/core/monitor/model/LocalVersionInfo;->updateVersionCode:Ljava/lang/String;

    invoke-virtual {p2, p4, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 183
    :cond_6
    const-string p3, "debug_fetch"

    invoke-virtual {p2, p3, p7}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 184
    const-string p3, "header"

    invoke-virtual {v0, p3, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 185
    iget-object p2, p0, Lcom/bytedance/frameworks/core/monitor/LogReportManager;->mAid:Ljava/lang/String;

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-static {p2, p1, p3}, Lcom/bytedance/frameworks/core/monitor/net/MonitorLogSender;->send(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result p1
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    return p1

    .line 188
    :cond_7
    const/4 p1, 0x1

    return p1

    .line 189
    :catch_0
    move-exception p1

    .line 192
    const/4 p1, 0x0

    return p1
.end method

.method private setHeaderInfo(Lorg/json/JSONObject;)V
    .locals 0

    .line 332
    iput-object p1, p0, Lcom/bytedance/frameworks/core/monitor/LogReportManager;->mHeaderInfo:Lorg/json/JSONObject;

    .line 333
    return-void
.end method

.method private setReportCount(I)V
    .locals 0

    .line 326
    if-gtz p1, :cond_0

    .line 327
    return-void

    .line 328
    :cond_0
    iput p1, p0, Lcom/bytedance/frameworks/core/monitor/LogReportManager;->mReportCount:I

    .line 329
    return-void
.end method

.method private setReportInterval(I)V
    .locals 0

    .line 315
    if-gtz p1, :cond_0

    .line 316
    return-void

    .line 317
    :cond_0
    iput p1, p0, Lcom/bytedance/frameworks/core/monitor/LogReportManager;->mInterval:I

    .line 318
    return-void
.end method


# virtual methods
.method protected packAndSendLog()V
    .locals 6

    .line 56
    iget-boolean v0, p0, Lcom/bytedance/frameworks/core/monitor/LogReportManager;->mCollectLogSwitch:Z

    if-nez v0, :cond_0

    .line 57
    return-void

    .line 59
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 60
    invoke-direct {p0}, Lcom/bytedance/frameworks/core/monitor/LogReportManager;->getLocalStore()Lcom/bytedance/frameworks/core/monitor/LogStoreManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->getLogSampledCount()J

    move-result-wide v2

    .line 61
    iget v4, p0, Lcom/bytedance/frameworks/core/monitor/LogReportManager;->mReportCount:I

    int-to-long v4, v4

    cmp-long v2, v2, v4

    if-gtz v2, :cond_1

    iget-wide v2, p0, Lcom/bytedance/frameworks/core/monitor/LogReportManager;->mLastPackTime:J

    sub-long v2, v0, v2

    const-wide/16 v4, 0x3e8

    div-long/2addr v2, v4

    iget v4, p0, Lcom/bytedance/frameworks/core/monitor/LogReportManager;->mInterval:I

    int-to-long v4, v4

    cmp-long v2, v2, v4

    if-lez v2, :cond_2

    .line 62
    :cond_1
    iput-wide v0, p0, Lcom/bytedance/frameworks/core/monitor/LogReportManager;->mLastPackTime:J

    .line 63
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/LogReportManager;->mAid:Ljava/lang/String;

    invoke-static {v0}, Lcom/bytedance/frameworks/core/monitor/config/MonitorConfigure;->getReportTypeList(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    .line 64
    if-eqz v0, :cond_2

    .line 65
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 66
    iget-object v2, p0, Lcom/bytedance/frameworks/core/monitor/LogReportManager;->mAid:Ljava/lang/String;

    invoke-static {v2, v1}, Lcom/bytedance/frameworks/core/monitor/config/MonitorConfigure;->getUploadTypeByReportType(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object v2

    const/16 v3, 0x64

    invoke-virtual {p0, v1, v2, v3}, Lcom/bytedance/frameworks/core/monitor/LogReportManager;->packOneReportType(Ljava/lang/String;Ljava/util/List;I)V

    .line 67
    goto :goto_0

    .line 70
    :cond_2
    return-void
.end method

.method public packOneReportType(Ljava/lang/String;Ljava/util/List;I)V
    .locals 19
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;I)V"
        }
    .end annotation

    .line 80
    invoke-direct/range {p0 .. p0}, Lcom/bytedance/frameworks/core/monitor/LogReportManager;->getLocalStore()Lcom/bytedance/frameworks/core/monitor/LogStoreManager;

    move-result-object v0

    move-object/from16 v1, p2

    move/from16 v2, p3

    invoke-virtual {v0, v1, v2}, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->getLogSampled(Ljava/util/List;I)Ljava/util/List;

    move-result-object v0

    .line 81
    if-eqz v0, :cond_a

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    if-lez v1, :cond_a

    .line 82
    nop

    .line 83
    nop

    .line 84
    nop

    .line 86
    :try_start_0
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    .line 87
    new-instance v2, Lorg/json/JSONArray;

    invoke-direct {v2}, Lorg/json/JSONArray;-><init>()V

    .line 88
    new-instance v3, Lorg/json/JSONArray;

    invoke-direct {v3}, Lorg/json/JSONArray;-><init>()V

    .line 89
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 90
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .line 91
    const-wide/16 v6, -0x1

    const/4 v8, 0x0

    const/4 v9, 0x1

    move-object v12, v1

    move-object v13, v2

    move-object v14, v3

    move-wide v15, v6

    move v1, v8

    move v0, v9

    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_7

    .line 92
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/bytedance/frameworks/core/monitor/model/LocalLog;

    .line 93
    cmp-long v3, v15, v6

    if-nez v3, :cond_0

    .line 94
    iget-wide v10, v2, Lcom/bytedance/frameworks/core/monitor/model/LocalLog;->versionId:J

    .line 102
    move v3, v0

    move-wide v15, v10

    goto :goto_2

    .line 95
    :cond_0
    iget-wide v10, v2, Lcom/bytedance/frameworks/core/monitor/model/LocalLog;->versionId:J

    cmp-long v3, v10, v15

    if-eqz v3, :cond_2

    .line 96
    const/16 v17, 0x0

    move-object/from16 v10, p0

    move-object/from16 v11, p1

    invoke-direct/range {v10 .. v17}, Lcom/bytedance/frameworks/core/monitor/LogReportManager;->sendLog(Ljava/lang/String;Lorg/json/JSONArray;Lorg/json/JSONArray;Lorg/json/JSONArray;JZ)Z

    move-result v3

    if-eqz v3, :cond_1

    if-eqz v0, :cond_1

    .line 97
    move v0, v9

    goto :goto_1

    .line 96
    :cond_1
    nop

    .line 97
    move v0, v8

    :goto_1
    iget-wide v10, v2, Lcom/bytedance/frameworks/core/monitor/model/LocalLog;->versionId:J

    .line 98
    new-instance v3, Lorg/json/JSONArray;

    invoke-direct {v3}, Lorg/json/JSONArray;-><init>()V

    .line 99
    new-instance v12, Lorg/json/JSONArray;

    invoke-direct {v12}, Lorg/json/JSONArray;-><init>()V

    .line 100
    new-instance v13, Lorg/json/JSONArray;

    invoke-direct {v13}, Lorg/json/JSONArray;-><init>()V

    .line 102
    move-wide v15, v10

    move-object v14, v13

    move-object v13, v12

    move-object v12, v3

    :cond_2
    move v3, v0

    :goto_2
    iget-wide v10, v2, Lcom/bytedance/frameworks/core/monitor/model/LocalLog;->id:J

    .line 103
    iget-object v0, v2, Lcom/bytedance/frameworks/core/monitor/model/LocalLog;->type:Ljava/lang/String;

    .line 104
    iget-object v2, v2, Lcom/bytedance/frameworks/core/monitor/model/LocalLog;->data:Ljava/lang/String;

    .line 105
    if-nez v1, :cond_3

    .line 106
    invoke-virtual {v4, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    goto :goto_3

    .line 108
    :cond_3
    const-string v6, ","

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 109
    invoke-virtual {v4, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 112
    :goto_3
    :try_start_1
    new-instance v6, Lorg/json/JSONObject;

    invoke-direct {v6, v2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 113
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v7

    const v2, 0x5a7510f

    if-eq v7, v2, :cond_5

    const v2, 0x6940745

    if-eq v7, v2, :cond_4

    goto :goto_4

    :cond_4
    const-string v2, "timer"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    move/from16 v18, v9

    goto :goto_5

    :cond_5
    const-string v2, "count"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    move/from16 v18, v8

    goto :goto_5

    :cond_6
    :goto_4
    const/16 v18, -0x1

    :goto_5
    packed-switch v18, :pswitch_data_0

    .line 121
    const-string v0, "log_id"

    goto :goto_6

    .line 118
    :pswitch_0
    invoke-virtual {v14, v6}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 119
    goto :goto_7

    .line 115
    :pswitch_1
    invoke-virtual {v13, v6}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 116
    goto :goto_7

    .line 121
    :goto_6
    invoke-virtual {v6, v0, v10, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 122
    invoke-virtual {v12, v6}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 126
    :goto_7
    goto :goto_8

    .line 125
    :catch_0
    move-exception v0

    .line 127
    :goto_8
    add-int/lit8 v1, v1, 0x1

    .line 128
    nop

    .line 91
    move v0, v3

    const-wide/16 v6, -0x1

    goto/16 :goto_0

    .line 129
    :cond_7
    const/16 v17, 0x0

    move-object/from16 v10, p0

    move-object/from16 v11, p1

    :try_start_2
    invoke-direct/range {v10 .. v17}, Lcom/bytedance/frameworks/core/monitor/LogReportManager;->sendLog(Ljava/lang/String;Lorg/json/JSONArray;Lorg/json/JSONArray;Lorg/json/JSONArray;JZ)Z

    move-result v1

    if-eqz v1, :cond_8

    if-eqz v0, :cond_8

    .line 130
    move v8, v9

    goto :goto_9

    .line 129
    :cond_8
    nop

    .line 130
    :goto_9
    if-eqz v8, :cond_9

    .line 131
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 132
    invoke-direct/range {p0 .. p0}, Lcom/bytedance/frameworks/core/monitor/LogReportManager;->getLocalStore()Lcom/bytedance/frameworks/core/monitor/LogStoreManager;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->deleteLocalLogByIds(Ljava/lang/String;)I
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 137
    :cond_9
    goto :goto_a

    .line 135
    :catch_1
    move-exception v0

    .line 136
    const-string v1, "LogReportManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "json resolve failed:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 139
    :cond_a
    :goto_a
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public setCollectLogSwitch(Z)V
    .locals 0

    .line 336
    iput-boolean p1, p0, Lcom/bytedance/frameworks/core/monitor/LogReportManager;->mCollectLogSwitch:Z

    .line 337
    return-void
.end method

.method protected updateConfig()V
    .locals 1

    .line 304
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/LogReportManager;->mAid:Ljava/lang/String;

    invoke-static {v0}, Lcom/bytedance/frameworks/core/monitor/config/MonitorConfigure;->getReportInterval(Ljava/lang/String;)I

    move-result v0

    invoke-direct {p0, v0}, Lcom/bytedance/frameworks/core/monitor/LogReportManager;->setReportInterval(I)V

    .line 305
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/LogReportManager;->mAid:Ljava/lang/String;

    invoke-static {v0}, Lcom/bytedance/frameworks/core/monitor/config/MonitorConfigure;->getReportCount(Ljava/lang/String;)I

    move-result v0

    invoke-direct {p0, v0}, Lcom/bytedance/frameworks/core/monitor/LogReportManager;->setReportCount(I)V

    .line 306
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/LogReportManager;->mAid:Ljava/lang/String;

    invoke-static {v0}, Lcom/bytedance/frameworks/core/monitor/config/MonitorConfigure;->getReportJsonHeaderInfo(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/bytedance/frameworks/core/monitor/LogReportManager;->setHeaderInfo(Lorg/json/JSONObject;)V

    .line 307
    return-void
.end method

.method public uploadLegacyLog(Lcom/bytedance/frameworks/core/monitor/model/UploadLogLegacyCommand;)V
    .locals 32

    move-object/from16 v9, p0

    .line 200
    move-object/from16 v0, p1

    .line 202
    nop

    .line 203
    nop

    .line 204
    nop

    .line 205
    :try_start_0
    iget-wide v10, v0, Lcom/bytedance/frameworks/core/monitor/model/UploadLogLegacyCommand;->startTime:J

    .line 206
    iget-wide v12, v0, Lcom/bytedance/frameworks/core/monitor/model/UploadLogLegacyCommand;->endTime:J

    .line 207
    invoke-virtual/range {p1 .. p1}, Lcom/bytedance/frameworks/core/monitor/model/UploadLogLegacyCommand;->getUploadTypeList()Ljava/util/List;

    move-result-object v0

    .line 209
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 210
    if-eqz v0, :cond_3

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    if-nez v2, :cond_0

    goto :goto_2

    .line 219
    :cond_0
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_6

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 220
    iget-object v3, v9, Lcom/bytedance/frameworks/core/monitor/LogReportManager;->mAid:Ljava/lang/String;

    invoke-static {v3, v2}, Lcom/bytedance/frameworks/core/monitor/config/MonitorConfigure;->getReportTypeByUploadType(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 221
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 222
    goto :goto_0

    .line 224
    :cond_1
    invoke-virtual {v1, v3}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 225
    invoke-virtual {v1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    .line 226
    invoke-interface {v4, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 227
    invoke-virtual {v1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 228
    goto :goto_1

    .line 229
    :cond_2
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 230
    invoke-interface {v4, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 231
    invoke-virtual {v1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 233
    :goto_1
    goto :goto_0

    .line 211
    :cond_3
    :goto_2
    iget-object v0, v9, Lcom/bytedance/frameworks/core/monitor/LogReportManager;->mAid:Ljava/lang/String;

    invoke-static {v0}, Lcom/bytedance/frameworks/core/monitor/config/MonitorConfigure;->getReportTypeList(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    .line 212
    if-nez v0, :cond_4

    .line 213
    return-void

    .line 215
    :cond_4
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_3
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_5

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 216
    iget-object v3, v9, Lcom/bytedance/frameworks/core/monitor/LogReportManager;->mAid:Ljava/lang/String;

    invoke-static {v3, v2}, Lcom/bytedance/frameworks/core/monitor/config/MonitorConfigure;->getUploadTypeByReportType(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 217
    goto :goto_3

    .line 218
    :cond_5
    nop

    .line 235
    :cond_6
    invoke-virtual {v1}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    .line 236
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v14

    .line 237
    const/16 v16, 0x1

    move/from16 v2, v16

    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_4
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_12

    .line 238
    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    .line 239
    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    move-object/from16 v17, v4

    check-cast v17, Ljava/util/List;

    .line 240
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    move-object/from16 v18, v3

    check-cast v18, Ljava/lang/String;

    .line 243
    move v8, v0

    move/from16 v19, v1

    move v7, v2

    :goto_5
    invoke-direct/range {p0 .. p0}, Lcom/bytedance/frameworks/core/monitor/LogReportManager;->getLocalStore()Lcom/bytedance/frameworks/core/monitor/LogStoreManager;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v6, 0x190

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    move-wide v1, v10

    move-wide v3, v12

    move-object/from16 v5, v17

    move v15, v6

    move-object/from16 v6, v20

    invoke-virtual/range {v0 .. v6}, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->getLocalLog(JJLjava/util/List;Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    .line 244
    nop

    .line 245
    if-eqz v0, :cond_10

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    if-lez v1, :cond_10

    .line 246
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v20

    .line 247
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    .line 248
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .line 249
    nop

    .line 250
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 251
    nop

    .line 252
    const-wide/16 v21, -0x1

    move-object/from16 v23, v1

    move/from16 v26, v7

    move-wide/from16 v24, v21

    const/16 v27, 0x0

    :goto_6
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v0
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_5

    if-eqz v0, :cond_b

    .line 254
    :try_start_1
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/bytedance/frameworks/core/monitor/model/LocalLog;

    .line 255
    cmp-long v1, v24, v21

    if-nez v1, :cond_7

    .line 256
    iget-wide v1, v0, Lcom/bytedance/frameworks/core/monitor/model/LocalLog;->versionId:J

    .line 262
    move-wide/from16 v24, v1

    move-object v15, v5

    move-object/from16 v29, v6

    move-wide/from16 v30, v10

    move-object/from16 v4, v23

    move v10, v8

    goto :goto_8

    .line 257
    :cond_7
    iget-wide v1, v0, Lcom/bytedance/frameworks/core/monitor/model/LocalLog;->versionId:J
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_4
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_5

    cmp-long v1, v1, v24

    if-eqz v1, :cond_9

    .line 258
    const/4 v4, 0x0

    const/4 v7, 0x0

    const/16 v28, 0x1

    move-object v1, v9

    move-object/from16 v2, v18

    move-object/from16 v3, v23

    move-object v15, v5

    move-object v5, v7

    move-object/from16 v29, v6

    move-wide/from16 v6, v24

    move-wide/from16 v30, v10

    move v10, v8

    move/from16 v8, v28

    :try_start_2
    invoke-direct/range {v1 .. v8}, Lcom/bytedance/frameworks/core/monitor/LogReportManager;->sendLog(Ljava/lang/String;Lorg/json/JSONArray;Lorg/json/JSONArray;Lorg/json/JSONArray;JZ)Z

    move-result v1
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_5

    if-eqz v1, :cond_8

    if-eqz v26, :cond_8

    .line 259
    move/from16 v1, v16

    goto :goto_7

    .line 258
    :cond_8
    nop

    .line 259
    const/4 v1, 0x0

    :goto_7
    :try_start_3
    iget-wide v2, v0, Lcom/bytedance/frameworks/core/monitor/model/LocalLog;->versionId:J
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_5

    .line 260
    :try_start_4
    new-instance v4, Lorg/json/JSONArray;

    invoke-direct {v4}, Lorg/json/JSONArray;-><init>()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_5

    .line 262
    move/from16 v26, v1

    move-wide/from16 v24, v2

    goto :goto_8

    .line 272
    :catch_0
    move-exception v0

    move/from16 v26, v1

    move-wide/from16 v24, v2

    goto :goto_a

    :catch_1
    move-exception v0

    move/from16 v26, v1

    goto :goto_a

    :catch_2
    move-exception v0

    goto :goto_a

    .line 262
    :cond_9
    move-object v15, v5

    move-object/from16 v29, v6

    move-wide/from16 v30, v10

    move v10, v8

    move-object/from16 v4, v23

    :goto_8
    :try_start_5
    iget-wide v1, v0, Lcom/bytedance/frameworks/core/monitor/model/LocalLog;->id:J

    .line 263
    if-nez v27, :cond_a

    .line 264
    invoke-virtual {v15, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    goto :goto_9

    .line 266
    :cond_a
    const-string v3, ","

    invoke-virtual {v15, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 267
    invoke-virtual {v15, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 269
    :goto_9
    add-int/lit8 v27, v27, 0x1

    .line 270
    new-instance v1, Lorg/json/JSONObject;

    iget-object v0, v0, Lcom/bytedance/frameworks/core/monitor/model/LocalLog;->data:Ljava/lang/String;

    invoke-direct {v1, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 271
    invoke-virtual {v4, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_3
    .catch Ljava/lang/Throwable; {:try_start_5 .. :try_end_5} :catch_5

    .line 274
    nop

    .line 252
    move-object/from16 v23, v4

    goto :goto_b

    .line 272
    :catch_3
    move-exception v0

    move-object/from16 v23, v4

    goto :goto_a

    :catch_4
    move-exception v0

    move-object v15, v5

    move-object/from16 v29, v6

    move-wide/from16 v30, v10

    move v10, v8

    .line 274
    :goto_a
    nop

    .line 252
    :goto_b
    move v8, v10

    move-object v5, v15

    move-object/from16 v6, v29

    move-wide/from16 v10, v30

    const/16 v15, 0x190

    goto/16 :goto_6

    .line 277
    :cond_b
    move-object v15, v5

    move-wide/from16 v30, v10

    move v10, v8

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v8, 0x1

    move-object v1, v9

    move-object/from16 v2, v18

    move-object/from16 v3, v23

    move-wide/from16 v6, v24

    :try_start_6
    invoke-direct/range {v1 .. v8}, Lcom/bytedance/frameworks/core/monitor/LogReportManager;->sendLog(Ljava/lang/String;Lorg/json/JSONArray;Lorg/json/JSONArray;Lorg/json/JSONArray;JZ)Z

    move-result v0

    if-eqz v0, :cond_c

    if-eqz v26, :cond_c

    .line 278
    move/from16 v0, v16

    goto :goto_c

    .line 277
    :cond_c
    nop

    .line 278
    const/4 v0, 0x0

    :goto_c
    if-eqz v0, :cond_e

    .line 279
    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 280
    invoke-direct/range {p0 .. p0}, Lcom/bytedance/frameworks/core/monitor/LogReportManager;->getLocalStore()Lcom/bytedance/frameworks/core/monitor/LogStoreManager;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->deleteLocalLogByIds(Ljava/lang/String;)I

    move-result v1
    :try_end_6
    .catch Ljava/lang/Throwable; {:try_start_6 .. :try_end_6} :catch_5

    .line 281
    if-gtz v1, :cond_d

    .line 282
    nop

    .line 284
    move/from16 v19, v16

    :cond_d
    goto :goto_d

    .line 285
    :cond_e
    nop

    .line 287
    move/from16 v19, v16

    :goto_d
    if-eqz v19, :cond_f

    .line 288
    add-int/lit16 v8, v10, 0x190

    .line 292
    move v7, v0

    goto :goto_e

    :cond_f
    move v7, v0

    move v8, v10

    :goto_e
    move/from16 v0, v20

    goto :goto_f

    :cond_10
    move-wide/from16 v30, v10

    move v10, v8

    move v8, v10

    const/4 v0, 0x0

    :goto_f
    const/16 v1, 0x190

    if-eq v0, v1, :cond_11

    .line 293
    nop

    .line 237
    move v2, v7

    move v0, v8

    move/from16 v1, v19

    move-wide/from16 v10, v30

    goto/16 :goto_4

    .line 243
    :cond_11
    move-wide/from16 v10, v30

    goto/16 :goto_5

    .line 297
    :cond_12
    goto :goto_10

    .line 295
    :catch_5
    move-exception v0

    .line 296
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 298
    :goto_10
    return-void
.end method
