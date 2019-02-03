.class final Lcom/bytedance/frameworks/baselib/log/LogSender;
.super Ljava/lang/Thread;
.source "LogSender.java"


# static fields
.field private static final CLEAN_LOG_INTERVAL:J = 0x927c0L

.field private static final DEFAULT_SCAN_LOG_INTERVAL:J = 0x1d4c0L

.field static final KEY_MAGIC_TAG:Ljava/lang/String; = "magic_tag"

.field static final KEY_MESSAGE:Ljava/lang/String; = "message"

.field static final MAGIC_TAG:Ljava/lang/String; = "log_queue"

.field private static final MAX_EXPIRE_TIME:J = 0x337f9800L

.field static final STATUS_OK:Ljava/lang/String; = "success"

.field private static final TAG:Ljava/lang/String; = "LogSender"


# instance fields
.field private final mContext:Landroid/content/Context;

.field private final mDbHelper:Lcom/bytedance/frameworks/baselib/log/LogDBHelper;

.field private mLastCleanTime:J

.field private final mLock:Ljava/lang/Object;

.field private mLogQueue:Lcom/bytedance/frameworks/baselib/log/LogQueue;

.field private mMinLog:J

.field private final mPendingQueue:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Lcom/bytedance/frameworks/baselib/log/LogItem;",
            ">;"
        }
    .end annotation
.end field

.field private mScanLogInterval:J

.field private final mStopFlag:Ljava/util/concurrent/atomic/AtomicBoolean;


# direct methods
.method constructor <init>(Landroid/content/Context;Lcom/bytedance/frameworks/baselib/log/LogQueue;Ljava/util/LinkedList;Ljava/util/concurrent/atomic/AtomicBoolean;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/bytedance/frameworks/baselib/log/LogQueue;",
            "Ljava/util/LinkedList<",
            "Lcom/bytedance/frameworks/baselib/log/LogItem;",
            ">;",
            "Ljava/util/concurrent/atomic/AtomicBoolean;",
            ")V"
        }
    .end annotation

    .line 47
    const-string v0, "LogSender"

    invoke-direct {p0, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    .line 34
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/bytedance/frameworks/baselib/log/LogSender;->mLock:Ljava/lang/Object;

    .line 37
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/bytedance/frameworks/baselib/log/LogSender;->mMinLog:J

    .line 38
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/bytedance/frameworks/baselib/log/LogSender;->mLastCleanTime:J

    .line 39
    const-wide/32 v0, 0x1d4c0

    iput-wide v0, p0, Lcom/bytedance/frameworks/baselib/log/LogSender;->mScanLogInterval:J

    .line 48
    iput-object p2, p0, Lcom/bytedance/frameworks/baselib/log/LogSender;->mLogQueue:Lcom/bytedance/frameworks/baselib/log/LogQueue;

    .line 49
    iput-object p1, p0, Lcom/bytedance/frameworks/baselib/log/LogSender;->mContext:Landroid/content/Context;

    .line 50
    iput-object p3, p0, Lcom/bytedance/frameworks/baselib/log/LogSender;->mPendingQueue:Ljava/util/LinkedList;

    .line 51
    iput-object p4, p0, Lcom/bytedance/frameworks/baselib/log/LogSender;->mStopFlag:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 52
    iget-object p1, p0, Lcom/bytedance/frameworks/baselib/log/LogSender;->mContext:Landroid/content/Context;

    invoke-static {p1}, Lcom/bytedance/frameworks/baselib/log/LogDBHelper;->getInstance(Landroid/content/Context;)Lcom/bytedance/frameworks/baselib/log/LogDBHelper;

    move-result-object p1

    iput-object p1, p0, Lcom/bytedance/frameworks/baselib/log/LogSender;->mDbHelper:Lcom/bytedance/frameworks/baselib/log/LogDBHelper;

    .line 53
    return-void
.end method

.method private cleanLog()V
    .locals 8

    .line 59
    invoke-direct {p0}, Lcom/bytedance/frameworks/baselib/log/LogSender;->isStop()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 60
    return-void

    .line 64
    :cond_0
    iget-object v0, p0, Lcom/bytedance/frameworks/baselib/log/LogSender;->mLogQueue:Lcom/bytedance/frameworks/baselib/log/LogQueue;

    invoke-virtual {v0}, Lcom/bytedance/frameworks/baselib/log/LogQueue;->getAllLogHandler()Ljava/util/Map;

    move-result-object v0

    .line 65
    if-eqz v0, :cond_4

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_4

    .line 66
    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 67
    invoke-direct {p0}, Lcom/bytedance/frameworks/baselib/log/LogSender;->isStop()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 68
    goto :goto_1

    .line 70
    :cond_1
    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/bytedance/frameworks/baselib/log/LogHandler;

    .line 71
    if-nez v3, :cond_2

    .line 72
    goto :goto_0

    .line 74
    :cond_2
    invoke-virtual {v3}, Lcom/bytedance/frameworks/baselib/log/LogHandler;->getConfig()Lcom/bytedance/frameworks/baselib/log/LogHandler$IConfig;

    move-result-object v3

    .line 75
    if-nez v3, :cond_3

    .line 76
    goto :goto_0

    .line 78
    :cond_3
    iget-object v4, p0, Lcom/bytedance/frameworks/baselib/log/LogSender;->mDbHelper:Lcom/bytedance/frameworks/baselib/log/LogDBHelper;

    invoke-interface {v3}, Lcom/bytedance/frameworks/baselib/log/LogHandler$IConfig;->getMaxRetryCount()I

    move-result v5

    invoke-interface {v3}, Lcom/bytedance/frameworks/baselib/log/LogHandler$IConfig;->getLogExpireTime()J

    move-result-wide v6

    invoke-virtual {v4, v2, v5, v6, v7}, Lcom/bytedance/frameworks/baselib/log/LogDBHelper;->cleanExpireLog(Ljava/lang/String;IJ)V

    .line 79
    goto :goto_0

    .line 82
    :cond_4
    :goto_1
    iget-object v0, p0, Lcom/bytedance/frameworks/baselib/log/LogSender;->mDbHelper:Lcom/bytedance/frameworks/baselib/log/LogDBHelper;

    const/4 v1, 0x0

    const/4 v2, -0x1

    const-wide/32 v3, 0x337f9800

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/bytedance/frameworks/baselib/log/LogDBHelper;->cleanExpireLog(Ljava/lang/String;IJ)V

    .line 83
    return-void
.end method

.method private isStop()Z
    .locals 1

    .line 405
    iget-object v0, p0, Lcom/bytedance/frameworks/baselib/log/LogSender;->mStopFlag:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    return v0
.end method

.method private processPendingQueue()Z
    .locals 6

    .line 91
    invoke-direct {p0}, Lcom/bytedance/frameworks/baselib/log/LogSender;->isStop()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 92
    return v1

    .line 96
    :cond_0
    const/4 v0, 0x0

    .line 98
    iget-object v2, p0, Lcom/bytedance/frameworks/baselib/log/LogSender;->mPendingQueue:Ljava/util/LinkedList;

    monitor-enter v2

    .line 99
    :try_start_0
    invoke-direct {p0}, Lcom/bytedance/frameworks/baselib/log/LogSender;->isStop()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 100
    monitor-exit v2

    return v1

    .line 101
    :cond_1
    iget-object v1, p0, Lcom/bytedance/frameworks/baselib/log/LogSender;->mPendingQueue:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_2

    .line 102
    iget-object v0, p0, Lcom/bytedance/frameworks/baselib/log/LogSender;->mPendingQueue:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->poll()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/bytedance/frameworks/baselib/log/LogItem;

    .line 103
    :cond_2
    iget-object v1, p0, Lcom/bytedance/frameworks/baselib/log/LogSender;->mPendingQueue:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v1

    .line 104
    xor-int/lit8 v1, v1, 0x1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 105
    if-eqz v0, :cond_4

    .line 107
    :try_start_1
    iget-object v2, p0, Lcom/bytedance/frameworks/baselib/log/LogSender;->mDbHelper:Lcom/bytedance/frameworks/baselib/log/LogDBHelper;

    iget-object v3, v0, Lcom/bytedance/frameworks/baselib/log/LogItem;->type:Ljava/lang/String;

    iget-object v0, v0, Lcom/bytedance/frameworks/baselib/log/LogItem;->value:[B

    invoke-virtual {v2, v3, v0}, Lcom/bytedance/frameworks/baselib/log/LogDBHelper;->insertLog(Ljava/lang/String;[B)J

    move-result-wide v2

    .line 112
    const-wide v4, 0x7fffffffffffffffL

    cmp-long v0, v2, v4

    if-ltz v0, :cond_3

    .line 116
    iget-object v0, p0, Lcom/bytedance/frameworks/baselib/log/LogSender;->mDbHelper:Lcom/bytedance/frameworks/baselib/log/LogDBHelper;

    invoke-virtual {v0}, Lcom/bytedance/frameworks/baselib/log/LogDBHelper;->recreateTableQueue()V
    :try_end_1
    .catch Landroid/database/sqlite/SQLiteFullException; {:try_start_1 .. :try_end_1} :catch_0

    .line 123
    :cond_3
    goto :goto_0

    .line 118
    :catch_0
    move-exception v0

    .line 122
    iget-object v0, p0, Lcom/bytedance/frameworks/baselib/log/LogSender;->mDbHelper:Lcom/bytedance/frameworks/baselib/log/LogDBHelper;

    invoke-virtual {v0}, Lcom/bytedance/frameworks/baselib/log/LogDBHelper;->recreateTableQueue()V

    .line 125
    :cond_4
    :goto_0
    return v1

    .line 104
    :catchall_0
    move-exception v0

    :try_start_2
    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0
.end method

.method private scanAndSendLog()Z
    .locals 24

    .line 134
    move-object/from16 v1, p0

    invoke-direct/range {p0 .. p0}, Lcom/bytedance/frameworks/baselib/log/LogSender;->isStop()Z

    move-result v0

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    .line 135
    return v2

    .line 140
    :cond_0
    iget-wide v3, v1, Lcom/bytedance/frameworks/baselib/log/LogSender;->mMinLog:J

    const-wide/16 v5, 0x0

    cmp-long v0, v3, v5

    if-gez v0, :cond_1

    .line 141
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    iget-wide v7, v1, Lcom/bytedance/frameworks/baselib/log/LogSender;->mLastCleanTime:J

    sub-long/2addr v3, v7

    const-wide/32 v7, 0x927c0

    cmp-long v0, v3, v7

    if-lez v0, :cond_1

    .line 142
    iput-wide v5, v1, Lcom/bytedance/frameworks/baselib/log/LogSender;->mMinLog:J

    .line 143
    invoke-direct/range {p0 .. p0}, Lcom/bytedance/frameworks/baselib/log/LogSender;->cleanLog()V

    .line 144
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    iput-wide v3, v1, Lcom/bytedance/frameworks/baselib/log/LogSender;->mLastCleanTime:J

    .line 148
    :cond_1
    iget-object v0, v1, Lcom/bytedance/frameworks/baselib/log/LogSender;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/bytedance/frameworks/baselib/log/LogLib;->isNetworkAvailable(Landroid/content/Context;)Z

    move-result v0

    const-wide/32 v3, 0x1d4c0

    if-nez v0, :cond_2

    .line 152
    iput-wide v3, v1, Lcom/bytedance/frameworks/baselib/log/LogSender;->mScanLogInterval:J

    .line 153
    return v2

    .line 155
    :cond_2
    iget-object v0, v1, Lcom/bytedance/frameworks/baselib/log/LogSender;->mDbHelper:Lcom/bytedance/frameworks/baselib/log/LogDBHelper;

    iget-wide v7, v1, Lcom/bytedance/frameworks/baselib/log/LogSender;->mMinLog:J

    invoke-virtual {v0, v7, v8}, Lcom/bytedance/frameworks/baselib/log/LogDBHelper;->getLog(J)Lcom/bytedance/frameworks/baselib/log/LogItem;

    move-result-object v7

    .line 156
    const/4 v0, 0x0

    if-nez v7, :cond_5

    .line 157
    iget-wide v7, v1, Lcom/bytedance/frameworks/baselib/log/LogSender;->mMinLog:J

    cmp-long v7, v7, v5

    if-nez v7, :cond_3

    iget-object v7, v1, Lcom/bytedance/frameworks/baselib/log/LogSender;->mDbHelper:Lcom/bytedance/frameworks/baselib/log/LogDBHelper;

    invoke-virtual {v7, v0}, Lcom/bytedance/frameworks/baselib/log/LogDBHelper;->getEventCount(Ljava/lang/String;)J

    move-result-wide v7

    cmp-long v0, v7, v5

    if-nez v0, :cond_3

    .line 158
    iput-wide v5, v1, Lcom/bytedance/frameworks/baselib/log/LogSender;->mScanLogInterval:J

    .line 159
    return v2

    .line 162
    :cond_3
    iget-wide v5, v1, Lcom/bytedance/frameworks/baselib/log/LogSender;->mMinLog:J

    const-wide/16 v7, -0x1

    cmp-long v0, v5, v7

    if-nez v0, :cond_4

    .line 163
    iput-wide v3, v1, Lcom/bytedance/frameworks/baselib/log/LogSender;->mScanLogInterval:J

    .line 165
    :cond_4
    iput-wide v7, v1, Lcom/bytedance/frameworks/baselib/log/LogSender;->mMinLog:J

    .line 169
    return v2

    .line 171
    :cond_5
    iget-wide v8, v1, Lcom/bytedance/frameworks/baselib/log/LogSender;->mMinLog:J

    iget-wide v10, v7, Lcom/bytedance/frameworks/baselib/log/LogItem;->id:J

    cmp-long v8, v8, v10

    if-gez v8, :cond_6

    .line 172
    iget-wide v8, v7, Lcom/bytedance/frameworks/baselib/log/LogItem;->id:J

    iput-wide v8, v1, Lcom/bytedance/frameworks/baselib/log/LogSender;->mMinLog:J

    goto :goto_0

    .line 174
    :cond_6
    iget-wide v8, v1, Lcom/bytedance/frameworks/baselib/log/LogSender;->mMinLog:J

    const-wide/16 v10, 0x1

    add-long/2addr v8, v10

    iput-wide v8, v1, Lcom/bytedance/frameworks/baselib/log/LogSender;->mMinLog:J

    .line 178
    :goto_0
    nop

    .line 179
    nop

    .line 180
    nop

    .line 181
    nop

    .line 182
    nop

    .line 183
    nop

    .line 186
    iget-object v8, v7, Lcom/bytedance/frameworks/baselib/log/LogItem;->value:[B

    const/4 v9, 0x1

    if-eqz v8, :cond_21

    iget-object v8, v7, Lcom/bytedance/frameworks/baselib/log/LogItem;->value:[B

    array-length v8, v8

    if-gtz v8, :cond_7

    goto/16 :goto_e

    .line 192
    :cond_7
    iget-object v8, v1, Lcom/bytedance/frameworks/baselib/log/LogSender;->mLogQueue:Lcom/bytedance/frameworks/baselib/log/LogQueue;

    iget-object v10, v7, Lcom/bytedance/frameworks/baselib/log/LogItem;->type:Ljava/lang/String;

    invoke-virtual {v8, v10}, Lcom/bytedance/frameworks/baselib/log/LogQueue;->getLogHandler(Ljava/lang/String;)Lcom/bytedance/frameworks/baselib/log/LogHandler;

    move-result-object v8

    .line 195
    if-nez v8, :cond_8

    .line 199
    return v9

    .line 201
    :cond_8
    invoke-virtual {v8}, Lcom/bytedance/frameworks/baselib/log/LogHandler;->getConfig()Lcom/bytedance/frameworks/baselib/log/LogHandler$IConfig;

    move-result-object v10

    .line 202
    invoke-virtual {v8}, Lcom/bytedance/frameworks/baselib/log/LogHandler;->getResponseConfig()Lcom/bytedance/frameworks/baselib/log/LogHandler$IResponseConfig;

    move-result-object v11

    .line 203
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v12

    .line 204
    invoke-interface {v10}, Lcom/bytedance/frameworks/baselib/log/LogHandler$IConfig;->getRetryInterval()J

    move-result-wide v14

    .line 205
    if-eqz v11, :cond_18

    .line 206
    invoke-interface {v11}, Lcom/bytedance/frameworks/baselib/log/LogHandler$IResponseConfig;->getRemoveSwitch()Z

    move-result v16

    if-eqz v16, :cond_9

    .line 207
    nop

    .line 310
    move/from16 v22, v2

    move v2, v9

    move-object v3, v10

    goto/16 :goto_f

    .line 209
    :cond_9
    invoke-interface {v11}, Lcom/bytedance/frameworks/baselib/log/LogHandler$IResponseConfig;->getStopInterval()J

    move-result-wide v16

    .line 210
    invoke-virtual {v8}, Lcom/bytedance/frameworks/baselib/log/LogHandler;->getStopMoreChannelInterval()J

    move-result-wide v18

    .line 211
    cmp-long v0, v16, v5

    if-lez v0, :cond_a

    invoke-virtual {v8}, Lcom/bytedance/frameworks/baselib/log/LogHandler;->getLastStopTime()J

    move-result-wide v20

    sub-long v20, v12, v20

    cmp-long v0, v20, v16

    if-ltz v0, :cond_b

    :cond_a
    cmp-long v0, v18, v5

    if-lez v0, :cond_c

    .line 212
    invoke-virtual {v8}, Lcom/bytedance/frameworks/baselib/log/LogHandler;->getLastStopTime()J

    move-result-wide v16

    sub-long v16, v12, v16

    cmp-long v0, v16, v18

    if-gez v0, :cond_c

    .line 213
    :cond_b
    return v9

    .line 215
    :cond_c
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-virtual {v8, v2, v3}, Lcom/bytedance/frameworks/baselib/log/LogHandler;->setLastStopTime(J)V

    .line 217
    cmp-long v0, v14, v5

    if-lez v0, :cond_d

    iget v0, v7, Lcom/bytedance/frameworks/baselib/log/LogItem;->retry_count:I

    if-lez v0, :cond_d

    iget-wide v2, v7, Lcom/bytedance/frameworks/baselib/log/LogItem;->retry_time:J

    sub-long/2addr v12, v2

    iget v0, v7, Lcom/bytedance/frameworks/baselib/log/LogItem;->retry_count:I

    int-to-long v2, v0

    mul-long/2addr v14, v2

    cmp-long v0, v12, v14

    if-gez v0, :cond_d

    .line 218
    return v9

    .line 222
    :cond_d
    invoke-virtual {v8}, Lcom/bytedance/frameworks/baselib/log/LogHandler;->getLastSuccessChannel()Ljava/lang/String;

    move-result-object v2

    .line 223
    invoke-interface {v10}, Lcom/bytedance/frameworks/baselib/log/LogHandler$IConfig;->getChannels()Ljava/util/List;

    move-result-object v0

    .line 224
    if-nez v0, :cond_e

    .line 225
    return v9

    .line 228
    :cond_e
    nop

    .line 232
    :try_start_0
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_f

    .line 233
    iget-object v3, v7, Lcom/bytedance/frameworks/baselib/log/LogItem;->value:[B

    invoke-direct {v1, v8, v2, v3}, Lcom/bytedance/frameworks/baselib/log/LogSender;->sendLog(Lcom/bytedance/frameworks/baselib/log/LogHandler;Ljava/lang/String;[B)Z

    move-result v3
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_2

    .line 234
    nop

    .line 236
    move v4, v9

    goto :goto_1

    :cond_f
    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_1
    if-nez v3, :cond_17

    .line 237
    nop

    .line 238
    :try_start_1
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v12
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    move v13, v3

    const/4 v3, 0x0

    :goto_2
    :try_start_2
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_15

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/lang/String;

    .line 239
    invoke-interface {v11}, Lcom/bytedance/frameworks/baselib/log/LogHandler$IResponseConfig;->getMoreChannelSwitch()Z

    move-result v15

    if-nez v15, :cond_10

    if-eqz v4, :cond_10

    .line 240
    goto :goto_4

    .line 242
    :cond_10
    invoke-direct/range {p0 .. p0}, Lcom/bytedance/frameworks/baselib/log/LogSender;->isStop()Z

    move-result v15

    if-eqz v15, :cond_11

    .line 243
    return v9

    .line 244
    :cond_11
    invoke-static {v14}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v15

    if-nez v15, :cond_14

    invoke-virtual {v14, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_12

    goto :goto_3

    .line 248
    :cond_12
    iget-object v4, v7, Lcom/bytedance/frameworks/baselib/log/LogItem;->value:[B

    invoke-direct {v1, v8, v14, v4}, Lcom/bytedance/frameworks/baselib/log/LogSender;->sendLog(Lcom/bytedance/frameworks/baselib/log/LogHandler;Ljava/lang/String;[B)Z

    move-result v4

    .line 249
    nop

    .line 250
    if-eqz v4, :cond_13

    .line 251
    nop

    .line 252
    nop

    .line 256
    move v13, v4

    move-object v2, v14

    goto :goto_4

    .line 254
    :cond_13
    add-int/lit8 v3, v3, 0x1

    .line 255
    nop

    .line 238
    move v13, v4

    move v4, v9

    goto :goto_2

    .line 245
    :cond_14
    :goto_3
    add-int/lit8 v3, v3, 0x1

    .line 246
    goto :goto_2

    .line 256
    :cond_15
    :goto_4
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v4

    if-ne v3, v4, :cond_16

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-le v0, v9, :cond_16

    .line 257
    invoke-interface {v11}, Lcom/bytedance/frameworks/baselib/log/LogHandler$IResponseConfig;->getStopMoreChannelInterval()J

    move-result-wide v3

    invoke-virtual {v8, v3, v4}, Lcom/bytedance/frameworks/baselib/log/LogHandler;->setStopMoreChannelInterval(J)V

    goto :goto_5

    .line 259
    :cond_16
    invoke-virtual {v8, v5, v6}, Lcom/bytedance/frameworks/baselib/log/LogHandler;->setStopMoreChannelInterval(J)V
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_0

    .line 261
    :goto_5
    goto :goto_6

    .line 264
    :catch_0
    move-exception v0

    goto :goto_7

    :catch_1
    move-exception v0

    move v13, v3

    goto :goto_7

    .line 262
    :cond_17
    :try_start_3
    invoke-virtual {v8, v5, v6}, Lcom/bytedance/frameworks/baselib/log/LogHandler;->setStopMoreChannelInterval(J)V
    :try_end_3
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_1

    .line 266
    move v13, v3

    :goto_6
    goto :goto_8

    .line 264
    :catch_2
    move-exception v0

    const/4 v13, 0x0

    .line 265
    :goto_7
    const-string v3, "LogSender"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "send log exception: "

    invoke-virtual {v4, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Lcom/bytedance/frameworks/baselib/log/LogQueue;->log(Ljava/lang/String;Ljava/lang/String;)V

    .line 267
    :goto_8
    move-object v0, v2

    move v2, v13

    goto/16 :goto_d

    .line 273
    :cond_18
    cmp-long v0, v14, v5

    if-lez v0, :cond_19

    iget v0, v7, Lcom/bytedance/frameworks/baselib/log/LogItem;->retry_count:I

    if-lez v0, :cond_19

    iget-wide v2, v7, Lcom/bytedance/frameworks/baselib/log/LogItem;->retry_time:J

    sub-long/2addr v12, v2

    iget v0, v7, Lcom/bytedance/frameworks/baselib/log/LogItem;->retry_count:I

    int-to-long v2, v0

    mul-long/2addr v14, v2

    cmp-long v0, v12, v14

    if-gez v0, :cond_19

    .line 274
    return v9

    .line 278
    :cond_19
    invoke-virtual {v8}, Lcom/bytedance/frameworks/baselib/log/LogHandler;->getLastSuccessChannel()Ljava/lang/String;

    move-result-object v2

    .line 279
    invoke-interface {v10}, Lcom/bytedance/frameworks/baselib/log/LogHandler$IConfig;->getChannels()Ljava/util/List;

    move-result-object v0

    .line 280
    if-nez v0, :cond_1a

    .line 281
    return v9

    .line 287
    :cond_1a
    :try_start_4
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_1b

    .line 288
    iget-object v3, v7, Lcom/bytedance/frameworks/baselib/log/LogItem;->value:[B

    invoke-direct {v1, v8, v2, v3}, Lcom/bytedance/frameworks/baselib/log/LogSender;->sendLog(Lcom/bytedance/frameworks/baselib/log/LogHandler;Ljava/lang/String;[B)Z

    move-result v3
    :try_end_4
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_4

    goto :goto_9

    .line 290
    :cond_1b
    const/4 v3, 0x0

    :goto_9
    if-nez v3, :cond_20

    .line 291
    :try_start_5
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1c
    :goto_a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_20

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 292
    invoke-direct/range {p0 .. p0}, Lcom/bytedance/frameworks/baselib/log/LogSender;->isStop()Z

    move-result v11

    if-eqz v11, :cond_1d

    .line 293
    return v9

    .line 294
    :cond_1d
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v11

    if-nez v11, :cond_1c

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_1e

    .line 295
    goto :goto_a

    .line 297
    :cond_1e
    iget-object v11, v7, Lcom/bytedance/frameworks/baselib/log/LogItem;->value:[B

    invoke-direct {v1, v8, v4, v11}, Lcom/bytedance/frameworks/baselib/log/LogSender;->sendLog(Lcom/bytedance/frameworks/baselib/log/LogHandler;Ljava/lang/String;[B)Z

    move-result v11
    :try_end_5
    .catch Ljava/lang/Throwable; {:try_start_5 .. :try_end_5} :catch_3

    .line 298
    if-eqz v11, :cond_1f

    .line 299
    nop

    .line 300
    nop

    .line 306
    move-object v0, v4

    move v2, v11

    goto :goto_b

    .line 302
    :cond_1f
    nop

    .line 291
    move v3, v11

    goto :goto_a

    .line 304
    :catch_3
    move-exception v0

    goto :goto_c

    .line 306
    :cond_20
    move-object v0, v2

    move v2, v3

    :goto_b
    goto :goto_d

    .line 304
    :catch_4
    move-exception v0

    const/4 v3, 0x0

    .line 305
    :goto_c
    const-string v4, "LogSender"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "send log exception: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v4, v0}, Lcom/bytedance/frameworks/baselib/log/LogQueue;->log(Ljava/lang/String;Ljava/lang/String;)V

    .line 310
    move-object v0, v2

    move v2, v3

    :goto_d
    move-object v3, v10

    const/16 v22, 0x0

    goto :goto_f

    .line 187
    :cond_21
    :goto_e
    nop

    .line 188
    nop

    .line 310
    move-object v3, v0

    move-object v8, v3

    move/from16 v22, v9

    const/4 v2, 0x0

    :goto_f
    invoke-direct/range {p0 .. p0}, Lcom/bytedance/frameworks/baselib/log/LogSender;->isStop()Z

    move-result v4

    if-eqz v4, :cond_22

    .line 311
    return v9

    .line 312
    :cond_22
    if-eqz v22, :cond_23

    .line 313
    iget-object v10, v1, Lcom/bytedance/frameworks/baselib/log/LogSender;->mDbHelper:Lcom/bytedance/frameworks/baselib/log/LogDBHelper;

    iget-wide v11, v7, Lcom/bytedance/frameworks/baselib/log/LogItem;->id:J

    const/4 v13, 0x1

    const-wide/16 v14, 0x0

    const/16 v16, 0x0

    invoke-virtual/range {v10 .. v16}, Lcom/bytedance/frameworks/baselib/log/LogDBHelper;->onLogSent(JZJI)Z

    goto :goto_11

    .line 315
    :cond_23
    if-eqz v2, :cond_24

    .line 316
    invoke-virtual {v8, v0}, Lcom/bytedance/frameworks/baselib/log/LogHandler;->setLastSuccessChannel(Ljava/lang/String;)V

    .line 318
    :cond_24
    iget-object v10, v1, Lcom/bytedance/frameworks/baselib/log/LogSender;->mDbHelper:Lcom/bytedance/frameworks/baselib/log/LogDBHelper;

    iget-wide v11, v7, Lcom/bytedance/frameworks/baselib/log/LogItem;->id:J

    invoke-interface {v3}, Lcom/bytedance/frameworks/baselib/log/LogHandler$IConfig;->getLogExpireTime()J

    move-result-wide v14

    invoke-interface {v3}, Lcom/bytedance/frameworks/baselib/log/LogHandler$IConfig;->getMaxRetryCount()I

    move-result v16

    move v13, v2

    invoke-virtual/range {v10 .. v16}, Lcom/bytedance/frameworks/baselib/log/LogDBHelper;->onLogSent(JZJI)Z

    move-result v0

    .line 319
    if-eqz v0, :cond_26

    .line 320
    invoke-interface {v3}, Lcom/bytedance/frameworks/baselib/log/LogHandler$IConfig;->getRetryInterval()J

    move-result-wide v3

    iget v0, v7, Lcom/bytedance/frameworks/baselib/log/LogItem;->retry_count:I

    add-int/2addr v0, v9

    int-to-long v10, v0

    mul-long/2addr v3, v10

    .line 321
    cmp-long v0, v3, v5

    if-lez v0, :cond_25

    .line 322
    iput-wide v3, v1, Lcom/bytedance/frameworks/baselib/log/LogSender;->mScanLogInterval:J

    .line 324
    :cond_25
    iget-wide v3, v1, Lcom/bytedance/frameworks/baselib/log/LogSender;->mScanLogInterval:J

    const-wide/32 v5, 0x1d4c0

    invoke-static {v5, v6, v3, v4}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v3

    iput-wide v3, v1, Lcom/bytedance/frameworks/baselib/log/LogSender;->mScanLogInterval:J

    .line 325
    goto :goto_10

    .line 326
    :cond_26
    const-wide/32 v5, 0x1d4c0

    iput-wide v5, v1, Lcom/bytedance/frameworks/baselib/log/LogSender;->mScanLogInterval:J

    .line 328
    :goto_10
    iget-object v0, v7, Lcom/bytedance/frameworks/baselib/log/LogItem;->value:[B

    invoke-virtual {v8, v0, v2}, Lcom/bytedance/frameworks/baselib/log/LogHandler;->onLogSent([BZ)V

    .line 333
    :goto_11
    return v9
.end method

.method private sendLog(Lcom/bytedance/frameworks/baselib/log/LogHandler;Ljava/lang/String;[B)Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 345
    if-eqz p3, :cond_1

    array-length v0, p3

    if-lez v0, :cond_1

    if-eqz p1, :cond_1

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 350
    :cond_0
    invoke-virtual {p1, p2, p3}, Lcom/bytedance/frameworks/baselib/log/LogHandler;->send(Ljava/lang/String;[B)Z

    move-result p1

    return p1

    .line 346
    :cond_1
    :goto_0
    const/4 p1, 0x0

    return p1
.end method


# virtual methods
.method awaken()V
    .locals 2

    .line 412
    iget-object v0, p0, Lcom/bytedance/frameworks/baselib/log/LogSender;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 413
    :try_start_0
    iget-object v1, p0, Lcom/bytedance/frameworks/baselib/log/LogSender;->mLock:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->notify()V

    .line 414
    monitor-exit v0

    .line 418
    return-void

    .line 414
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method quit()V
    .locals 1

    .line 421
    invoke-virtual {p0}, Lcom/bytedance/frameworks/baselib/log/LogSender;->awaken()V

    .line 422
    iget-object v0, p0, Lcom/bytedance/frameworks/baselib/log/LogSender;->mDbHelper:Lcom/bytedance/frameworks/baselib/log/LogDBHelper;

    invoke-virtual {v0}, Lcom/bytedance/frameworks/baselib/log/LogDBHelper;->closeDatabase()V

    .line 423
    return-void
.end method

.method public run()V
    .locals 5

    .line 368
    const-string v0, "LogSender"

    const-string v1, "LogSender start"

    invoke-static {v0, v1}, Lcom/bytedance/frameworks/baselib/log/LogQueue;->log(Ljava/lang/String;Ljava/lang/String;)V

    .line 370
    :goto_0
    invoke-direct {p0}, Lcom/bytedance/frameworks/baselib/log/LogSender;->isStop()Z

    move-result v0

    if-nez v0, :cond_6

    .line 374
    invoke-direct {p0}, Lcom/bytedance/frameworks/baselib/log/LogSender;->processPendingQueue()Z

    move-result v0

    .line 376
    invoke-direct {p0}, Lcom/bytedance/frameworks/baselib/log/LogSender;->isStop()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 377
    goto :goto_6

    .line 379
    :cond_0
    invoke-direct {p0}, Lcom/bytedance/frameworks/baselib/log/LogSender;->scanAndSendLog()Z

    move-result v1

    if-nez v1, :cond_2

    if-eqz v0, :cond_1

    goto :goto_1

    :cond_1
    const/4 v0, 0x0

    goto :goto_2

    :cond_2
    :goto_1
    const/4 v0, 0x1

    .line 381
    :goto_2
    invoke-direct {p0}, Lcom/bytedance/frameworks/baselib/log/LogSender;->isStop()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 382
    goto :goto_6

    .line 384
    :cond_3
    if-eqz v0, :cond_4

    .line 385
    goto :goto_0

    .line 388
    :cond_4
    iget-object v0, p0, Lcom/bytedance/frameworks/baselib/log/LogSender;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 391
    :try_start_0
    iget-wide v1, p0, Lcom/bytedance/frameworks/baselib/log/LogSender;->mScanLogInterval:J

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-nez v1, :cond_5

    .line 392
    iget-object v1, p0, Lcom/bytedance/frameworks/baselib/log/LogSender;->mLock:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->wait()V

    goto :goto_3

    .line 394
    :cond_5
    iget-object v1, p0, Lcom/bytedance/frameworks/baselib/log/LogSender;->mLock:Ljava/lang/Object;

    iget-wide v2, p0, Lcom/bytedance/frameworks/baselib/log/LogSender;->mScanLogInterval:J

    invoke-virtual {v1, v2, v3}, Ljava/lang/Object;->wait(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 398
    :goto_3
    goto :goto_4

    .line 399
    :catchall_0
    move-exception v1

    goto :goto_5

    .line 396
    :catch_0
    move-exception v1

    .line 399
    :goto_4
    :try_start_1
    monitor-exit v0

    goto :goto_0

    :goto_5
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1

    .line 401
    :cond_6
    :goto_6
    const-string v0, "LogSender"

    const-string v1, "LogSender quit"

    invoke-static {v0, v1}, Lcom/bytedance/frameworks/baselib/log/LogQueue;->log(Ljava/lang/String;Ljava/lang/String;)V

    .line 402
    return-void
.end method
