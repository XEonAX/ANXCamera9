.class Lcom/bytedance/frameworks/baselib/log/LogDBHelper;
.super Ljava/lang/Object;
.source "LogDBHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bytedance/frameworks/baselib/log/LogDBHelper$OpenHelper;
    }
.end annotation


# static fields
.field static final COL_ID:Ljava/lang/String; = "_id"

.field static final COL_RETRY_COUNT:Ljava/lang/String; = "retry_count"

.field static final COL_RETRY_TIME:Ljava/lang/String; = "retry_time"

.field static final COL_TIMESTAMP:Ljava/lang/String; = "timestamp"

.field static final COL_TYPE:Ljava/lang/String; = "type"

.field static final COL_VALUE:Ljava/lang/String; = "value"

.field static final DB_NAME:Ljava/lang/String; = "lib_log_queue.db"

.field static final DB_VERSION:I = 0x1

.field static final QUEUE_COLS:[Ljava/lang/String;

.field static final TABLE_QUEUE:Ljava/lang/String; = "queue"

.field static final createTableQueue:Ljava/lang/String; = "CREATE TABLE queue ( _id INTEGER PRIMARY KEY AUTOINCREMENT, value BLOB, type TEXT, timestamp INTEGER, retry_count INTEGER, retry_time INTEGER )"

.field private static sInstance:Lcom/bytedance/frameworks/baselib/log/LogDBHelper; = null

.field private static final whereId:Ljava/lang/String; = "_id = ?"


# instance fields
.field private mDb:Landroid/database/sqlite/SQLiteDatabase;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .line 36
    const-string v0, "_id"

    const-string v1, "value"

    const-string v2, "type"

    const-string v3, "timestamp"

    const-string v4, "retry_count"

    const-string v5, "retry_time"

    filled-new-array/range {v0 .. v5}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/bytedance/frameworks/baselib/log/LogDBHelper;->QUEUE_COLS:[Ljava/lang/String;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    if-nez p1, :cond_0

    .line 58
    return-void

    .line 60
    :cond_0
    :try_start_0
    new-instance v0, Lcom/bytedance/frameworks/baselib/log/LogDBHelper$OpenHelper;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    invoke-direct {v0, p1}, Lcom/bytedance/frameworks/baselib/log/LogDBHelper$OpenHelper;-><init>(Landroid/content/Context;)V

    .line 61
    invoke-virtual {v0}, Lcom/bytedance/frameworks/baselib/log/LogDBHelper$OpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object p1

    iput-object p1, p0, Lcom/bytedance/frameworks/baselib/log/LogDBHelper;->mDb:Landroid/database/sqlite/SQLiteDatabase;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 64
    goto :goto_0

    .line 62
    :catch_0
    move-exception p1

    .line 65
    :goto_0
    return-void
.end method

.method static getInstance(Landroid/content/Context;)Lcom/bytedance/frameworks/baselib/log/LogDBHelper;
    .locals 2

    .line 45
    sget-object v0, Lcom/bytedance/frameworks/baselib/log/LogDBHelper;->sInstance:Lcom/bytedance/frameworks/baselib/log/LogDBHelper;

    if-nez v0, :cond_1

    .line 46
    const-class v0, Lcom/bytedance/frameworks/baselib/log/LogDBHelper;

    monitor-enter v0

    .line 47
    :try_start_0
    sget-object v1, Lcom/bytedance/frameworks/baselib/log/LogDBHelper;->sInstance:Lcom/bytedance/frameworks/baselib/log/LogDBHelper;

    if-nez v1, :cond_0

    .line 48
    new-instance v1, Lcom/bytedance/frameworks/baselib/log/LogDBHelper;

    invoke-direct {v1, p0}, Lcom/bytedance/frameworks/baselib/log/LogDBHelper;-><init>(Landroid/content/Context;)V

    sput-object v1, Lcom/bytedance/frameworks/baselib/log/LogDBHelper;->sInstance:Lcom/bytedance/frameworks/baselib/log/LogDBHelper;

    .line 50
    :cond_0
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    .line 52
    :cond_1
    :goto_0
    sget-object p0, Lcom/bytedance/frameworks/baselib/log/LogDBHelper;->sInstance:Lcom/bytedance/frameworks/baselib/log/LogDBHelper;

    return-object p0
.end method

.method static safeCloseCursor(Landroid/database/Cursor;)V
    .locals 1

    .line 261
    if-eqz p0, :cond_0

    :try_start_0
    invoke-interface {p0}, Landroid/database/Cursor;->isClosed()Z

    move-result v0

    if-nez v0, :cond_0

    .line 262
    invoke-interface {p0}, Landroid/database/Cursor;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 264
    :catch_0
    move-exception p0

    goto :goto_1

    .line 265
    :cond_0
    :goto_0
    nop

    .line 266
    :goto_1
    return-void
.end method


# virtual methods
.method declared-synchronized cleanExpireLog(Ljava/lang/String;IJ)V
    .locals 4

    monitor-enter p0

    .line 149
    :try_start_0
    invoke-virtual {p0}, Lcom/bytedance/frameworks/baselib/log/LogDBHelper;->isOpen()Z

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    .line 150
    monitor-exit p0

    return-void

    .line 154
    :cond_0
    :try_start_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    sub-long/2addr v0, p3

    .line 155
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p3

    const/4 p4, 0x0

    const/4 v2, 0x1

    if-eqz p3, :cond_1

    .line 156
    const-string p1, "timestamp <= ? "

    .line 157
    new-array p2, v2, [Ljava/lang/String;

    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p3

    aput-object p3, p2, p4

    goto :goto_0

    .line 159
    :cond_1
    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "(timestamp <= ? OR retry_count > "

    invoke-virtual {p3, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p2, ") and "

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, "type"

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, " = ?"

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 161
    const/4 p3, 0x2

    new-array p3, p3, [Ljava/lang/String;

    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    aput-object v0, p3, p4

    aput-object p1, p3, v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 164
    move-object p1, p2

    move-object p2, p3

    :goto_0
    :try_start_2
    iget-object p3, p0, Lcom/bytedance/frameworks/baselib/log/LogDBHelper;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    const-string p4, "queue"

    invoke-virtual {p3, p4, p1, p2}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 167
    goto :goto_1

    .line 165
    :catch_0
    move-exception p1

    .line 166
    :try_start_3
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "delete expire log error:"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/bytedance/frameworks/baselib/log/LogQueue;->log(Ljava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 168
    :goto_1
    monitor-exit p0

    return-void

    .line 148
    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method declared-synchronized closeDatabase()V
    .locals 3

    monitor-enter p0

    .line 97
    :try_start_0
    invoke-virtual {p0}, Lcom/bytedance/frameworks/baselib/log/LogDBHelper;->isOpen()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 98
    iget-object v0, p0, Lcom/bytedance/frameworks/baselib/log/LogDBHelper;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    .line 99
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/bytedance/frameworks/baselib/log/LogDBHelper;->mDb:Landroid/database/sqlite/SQLiteDatabase;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 103
    :cond_0
    goto :goto_0

    .line 96
    :catchall_0
    move-exception v0

    goto :goto_1

    .line 101
    :catch_0
    move-exception v0

    .line 102
    :try_start_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "closeDatabase error: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/bytedance/frameworks/baselib/log/LogQueue;->log(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 104
    :goto_0
    monitor-exit p0

    return-void

    .line 96
    :goto_1
    monitor-exit p0

    throw v0
.end method

.method declared-synchronized getEventCount(Ljava/lang/String;)J
    .locals 6

    monitor-enter p0

    .line 76
    :try_start_0
    invoke-virtual {p0}, Lcom/bytedance/frameworks/baselib/log/LogDBHelper;->isOpen()Z

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    const-wide/16 v1, 0x0

    if-nez v0, :cond_0

    .line 77
    monitor-exit p0

    return-wide v1

    .line 78
    :cond_0
    nop

    .line 79
    nop

    .line 81
    const/4 v0, 0x0

    :try_start_1
    const-string v3, "select count(*) from queue"

    .line 82
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 83
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " "

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 85
    :cond_1
    iget-object p1, p0, Lcom/bytedance/frameworks/baselib/log/LogDBHelper;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {p1, v3, v0}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p1
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 86
    :try_start_2
    invoke-interface {p1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 87
    const/4 v0, 0x0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v3
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 91
    move-wide v1, v3

    :cond_2
    :try_start_3
    invoke-static {p1}, Lcom/bytedance/frameworks/baselib/log/LogDBHelper;->safeCloseCursor(Landroid/database/Cursor;)V

    goto :goto_2

    :catchall_0
    move-exception v0

    move-object v5, v0

    move-object v0, p1

    move-object p1, v5

    goto :goto_0

    .line 89
    :catch_0
    move-exception v0

    move-object v0, p1

    goto :goto_1

    .line 91
    :catchall_1
    move-exception p1

    :goto_0
    invoke-static {v0}, Lcom/bytedance/frameworks/baselib/log/LogDBHelper;->safeCloseCursor(Landroid/database/Cursor;)V

    throw p1

    .line 89
    :catch_1
    move-exception p1

    .line 91
    :goto_1
    invoke-static {v0}, Lcom/bytedance/frameworks/baselib/log/LogDBHelper;->safeCloseCursor(Landroid/database/Cursor;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 92
    :goto_2
    nop

    .line 93
    monitor-exit p0

    return-wide v1

    .line 75
    :catchall_2
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method declared-synchronized getLog(J)Lcom/bytedance/frameworks/baselib/log/LogItem;
    .locals 11

    monitor-enter p0

    .line 178
    :try_start_0
    invoke-virtual {p0}, Lcom/bytedance/frameworks/baselib/log/LogDBHelper;->isOpen()Z

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 179
    monitor-exit p0

    return-object v1

    .line 180
    :cond_0
    nop

    .line 181
    nop

    .line 183
    :try_start_1
    const-string v9, "_id ASC"

    .line 184
    const-string v10, "1"

    .line 185
    const-string v5, "_id > ?"

    .line 186
    const/4 v0, 0x1

    new-array v6, v0, [Ljava/lang/String;

    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p1

    const/4 p2, 0x0

    aput-object p1, v6, p2

    .line 187
    iget-object v2, p0, Lcom/bytedance/frameworks/baselib/log/LogDBHelper;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    const-string v3, "queue"

    sget-object v4, Lcom/bytedance/frameworks/baselib/log/LogDBHelper;->QUEUE_COLS:[Ljava/lang/String;

    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-virtual/range {v2 .. v10}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 189
    :try_start_2
    invoke-interface {p1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 190
    new-instance v2, Lcom/bytedance/frameworks/baselib/log/LogItem;

    invoke-direct {v2}, Lcom/bytedance/frameworks/baselib/log/LogItem;-><init>()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 191
    :try_start_3
    invoke-interface {p1, p2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v3

    iput-wide v3, v2, Lcom/bytedance/frameworks/baselib/log/LogItem;->id:J

    .line 192
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object p2

    iput-object p2, v2, Lcom/bytedance/frameworks/baselib/log/LogItem;->value:[B

    .line 193
    const/4 p2, 0x2

    invoke-interface {p1, p2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p2

    iput-object p2, v2, Lcom/bytedance/frameworks/baselib/log/LogItem;->type:Ljava/lang/String;

    .line 194
    const/4 p2, 0x3

    invoke-interface {p1, p2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    iput-wide v0, v2, Lcom/bytedance/frameworks/baselib/log/LogItem;->timestamp:J

    .line 195
    const/4 p2, 0x4

    invoke-interface {p1, p2}, Landroid/database/Cursor;->getInt(I)I

    move-result p2

    iput p2, v2, Lcom/bytedance/frameworks/baselib/log/LogItem;->retry_count:I

    .line 196
    const/4 p2, 0x5

    invoke-interface {p1, p2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    iput-wide v0, v2, Lcom/bytedance/frameworks/baselib/log/LogItem;->retry_time:J
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 201
    move-object v1, v2

    goto :goto_0

    .line 198
    :catch_0
    move-exception p2

    goto :goto_1

    .line 201
    :cond_1
    :goto_0
    :try_start_4
    invoke-static {p1}, Lcom/bytedance/frameworks/baselib/log/LogDBHelper;->safeCloseCursor(Landroid/database/Cursor;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 202
    goto :goto_3

    .line 201
    :catchall_0
    move-exception p2

    move-object v1, p1

    goto :goto_4

    .line 198
    :catch_1
    move-exception p2

    move-object v2, v1

    :goto_1
    move-object v1, p1

    goto :goto_2

    .line 201
    :catchall_1
    move-exception p2

    goto :goto_4

    .line 198
    :catch_2
    move-exception p2

    move-object v2, v1

    .line 199
    :goto_2
    :try_start_5
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "getLog exception "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/bytedance/frameworks/baselib/log/LogQueue;->log(Ljava/lang/String;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 201
    :try_start_6
    invoke-static {v1}, Lcom/bytedance/frameworks/baselib/log/LogDBHelper;->safeCloseCursor(Landroid/database/Cursor;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 202
    nop

    .line 203
    move-object v1, v2

    :goto_3
    monitor-exit p0

    return-object v1

    .line 201
    :goto_4
    :try_start_7
    invoke-static {v1}, Lcom/bytedance/frameworks/baselib/log/LogDBHelper;->safeCloseCursor(Landroid/database/Cursor;)V

    throw p2
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    .line 177
    :catchall_2
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method declared-synchronized insertLog(Ljava/lang/String;[B)J
    .locals 3

    monitor-enter p0

    .line 114
    :try_start_0
    invoke-virtual {p0}, Lcom/bytedance/frameworks/baselib/log/LogDBHelper;->isOpen()Z

    move-result v0

    if-eqz v0, :cond_1

    if-eqz p2, :cond_1

    array-length v0, p2

    if-gtz v0, :cond_0

    goto :goto_0

    .line 117
    :cond_0
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 118
    const-string v1, "value"

    invoke-virtual {v0, v1, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;[B)V

    .line 119
    const-string p2, "type"

    invoke-virtual {v0, p2, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 120
    const-string p1, "timestamp"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p2

    invoke-virtual {v0, p1, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 121
    const-string p1, "retry_count"

    const/4 p2, 0x0

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-virtual {v0, p1, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 122
    const-string p1, "retry_time"

    const-wide/16 v1, 0x0

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p2

    invoke-virtual {v0, p1, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 123
    iget-object p1, p0, Lcom/bytedance/frameworks/baselib/log/LogDBHelper;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    const-string p2, "queue"

    const/4 v1, 0x0

    invoke-virtual {p1, p2, v1, v0}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-wide p1

    .line 115
    :cond_1
    :goto_0
    const-wide/16 p1, -0x1

    monitor-exit p0

    return-wide p1

    .line 113
    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method declared-synchronized isOpen()Z
    .locals 1

    monitor-enter p0

    .line 68
    :try_start_0
    iget-object v0, p0, Lcom/bytedance/frameworks/baselib/log/LogDBHelper;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/bytedance/frameworks/baselib/log/LogDBHelper;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->isOpen()Z

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    goto :goto_0

    .line 72
    :cond_0
    const/4 v0, 0x1

    monitor-exit p0

    return v0

    .line 69
    :cond_1
    :goto_0
    :try_start_1
    const-string v0, "db not establish and open"

    invoke-static {v0}, Lcom/bytedance/frameworks/baselib/log/LogQueue;->log(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 70
    const/4 v0, 0x0

    monitor-exit p0

    return v0

    .line 67
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized onLogSent(JZJI)Z
    .locals 15

    move-object v1, p0

    move-wide/from16 v2, p1

    monitor-enter p0

    .line 216
    :try_start_0
    invoke-virtual {v1}, Lcom/bytedance/frameworks/baselib/log/LogDBHelper;->isOpen()Z

    move-result v0

    const/4 v4, 0x0

    if-eqz v0, :cond_5

    const-wide/16 v5, 0x0

    cmp-long v0, v2, v5

    if-gtz v0, :cond_0

    goto/16 :goto_5

    .line 218
    :cond_0
    const/4 v0, 0x1

    new-array v13, v0, [Ljava/lang/String;

    invoke-static/range {p1 .. p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v13, v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 219
    nop

    .line 220
    if-nez p3, :cond_3

    .line 221
    const/4 v14, 0x0

    .line 223
    :try_start_1
    const-string v5, "timestamp"

    const-string v6, "retry_count"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v7

    .line 224
    iget-object v5, v1, Lcom/bytedance/frameworks/baselib/log/LogDBHelper;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    const-string v6, "queue"

    const-string v8, "_id = ?"

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    move-object v9, v13

    invoke-virtual/range {v5 .. v12}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v5
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 225
    :try_start_2
    invoke-interface {v5}, Landroid/database/Cursor;->moveToNext()Z

    move-result v6
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    if-nez v6, :cond_1

    .line 226
    nop

    .line 242
    :try_start_3
    invoke-static {v5}, Lcom/bytedance/frameworks/baselib/log/LogDBHelper;->safeCloseCursor(Landroid/database/Cursor;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    monitor-exit p0

    return v4

    .line 227
    :cond_1
    :try_start_4
    invoke-interface {v5, v4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v6

    .line 228
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v8

    .line 229
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v9

    .line 230
    sub-long v6, v9, v6

    cmp-long v6, v6, p4

    if-gez v6, :cond_2

    move/from16 v6, p6

    if-ge v8, v6, :cond_2

    .line 231
    new-instance v6, Landroid/content/ContentValues;

    invoke-direct {v6}, Landroid/content/ContentValues;-><init>()V

    .line 232
    const-string v7, "retry_count"

    add-int/2addr v8, v0

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 233
    const-string v7, "retry_time"

    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 234
    iget-object v7, v1, Lcom/bytedance/frameworks/baselib/log/LogDBHelper;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    const-string v8, "queue"

    const-string v9, "_id = ?"

    invoke-virtual {v7, v8, v6, v9, v13}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 235
    nop

    .line 242
    :try_start_5
    invoke-static {v5}, Lcom/bytedance/frameworks/baselib/log/LogDBHelper;->safeCloseCursor(Landroid/database/Cursor;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    monitor-exit p0

    return v0

    .line 237
    :cond_2
    nop

    .line 242
    :try_start_6
    invoke-static {v5}, Lcom/bytedance/frameworks/baselib/log/LogDBHelper;->safeCloseCursor(Landroid/database/Cursor;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 243
    goto :goto_1

    .line 242
    :catchall_0
    move-exception v0

    goto :goto_2

    .line 239
    :catch_0
    move-exception v0

    move-object v14, v5

    goto :goto_0

    .line 242
    :catchall_1
    move-exception v0

    move-object v5, v14

    goto :goto_2

    .line 239
    :catch_1
    move-exception v0

    .line 240
    :goto_0
    :try_start_7
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "onLogSent exception: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/bytedance/frameworks/baselib/log/LogQueue;->log(Ljava/lang/String;)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    .line 242
    :try_start_8
    invoke-static {v14}, Lcom/bytedance/frameworks/baselib/log/LogDBHelper;->safeCloseCursor(Landroid/database/Cursor;)V

    .line 243
    nop

    .line 244
    move v0, v4

    :goto_1
    goto :goto_3

    .line 242
    :goto_2
    invoke-static {v5}, Lcom/bytedance/frameworks/baselib/log/LogDBHelper;->safeCloseCursor(Landroid/database/Cursor;)V

    throw v0
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    .line 245
    :cond_3
    nop

    .line 247
    :goto_3
    if-eqz v0, :cond_4

    .line 249
    :try_start_9
    iget-object v0, v1, Lcom/bytedance/frameworks/baselib/log/LogDBHelper;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    const-string v5, "queue"

    const-string v6, "_id = ?"

    invoke-virtual {v0, v5, v6, v13}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_9
    .catch Ljava/lang/Throwable; {:try_start_9 .. :try_end_9} :catch_2
    .catchall {:try_start_9 .. :try_end_9} :catchall_2

    .line 252
    goto :goto_4

    .line 250
    :catch_2
    move-exception v0

    .line 253
    :goto_4
    :try_start_a
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "delete app_log: "

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/bytedance/frameworks/baselib/log/LogQueue;->log(Ljava/lang/String;)V
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_2

    .line 254
    monitor-exit p0

    return v4

    .line 256
    :cond_4
    monitor-exit p0

    return v4

    .line 217
    :cond_5
    :goto_5
    monitor-exit p0

    return v4

    .line 215
    :catchall_2
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized recreateTableQueue()V
    .locals 3

    monitor-enter p0

    .line 130
    :try_start_0
    invoke-virtual {p0}, Lcom/bytedance/frameworks/baselib/log/LogDBHelper;->isOpen()Z

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    .line 131
    monitor-exit p0

    return-void

    .line 134
    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/bytedance/frameworks/baselib/log/LogDBHelper;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    const-string v1, "DROP TABLE IF EXISTS queue"

    invoke-virtual {v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 135
    iget-object v0, p0, Lcom/bytedance/frameworks/baselib/log/LogDBHelper;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    const-string v1, "CREATE TABLE queue ( _id INTEGER PRIMARY KEY AUTOINCREMENT, value BLOB, type TEXT, timestamp INTEGER, retry_count INTEGER, retry_time INTEGER )"

    invoke-virtual {v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 138
    goto :goto_0

    .line 136
    :catch_0
    move-exception v0

    .line 137
    :try_start_2
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "recreateTableQueue db exception "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/bytedance/frameworks/baselib/log/LogQueue;->log(Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 139
    :goto_0
    monitor-exit p0

    return-void

    .line 129
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
