.class Lcom/bytedance/frameworks/core/monitor/DBHelper;
.super Landroid/database/sqlite/SQLiteOpenHelper;
.source "DBHelper.java"


# static fields
.field public static final COL_CREATE_TIME:Ljava/lang/String; = "create_time"

.field public static final COL_DATA:Ljava/lang/String; = "data"

.field public static final COL_DATA2:Ljava/lang/String; = "data2"

.field public static final COL_DATA3:Ljava/lang/String; = "data3"

.field static final COL_ID:Ljava/lang/String; = "_id"

.field public static final COL_MANIFEST_VERSION_CODE:Ljava/lang/String; = "manifest_version_code"

.field public static final COL_SAMPLED:Ljava/lang/String; = "is_sampled"

.field public static final COL_TYPE:Ljava/lang/String; = "type"

.field public static final COL_TYPE2:Ljava/lang/String; = "type2"

.field public static final COL_UPDATE_VERSION_CODE:Ljava/lang/String; = "update_version_code"

.field public static final COL_VERSION_CODE:Ljava/lang/String; = "version_code"

.field public static final COL_VERSION_ID:Ljava/lang/String; = "version_id"

.field public static final COL_VERSION_NAME:Ljava/lang/String; = "version_name"

.field static final DB_NAME:Ljava/lang/String; = "ss_local_monitor.db"

.field static final DB_VERSION:I = 0x1

.field private static final SQL_CREATE_LOCAL_MONITOR_TABLE:Ljava/lang/String; = "CREATE TABLE local_monitor_log ( _id Integer PRIMARY KEY AUTOINCREMENT, type VARCHAR, type2 VARCHAR, create_time Integer, version_id Integer, is_sampled Integer DEFAULT 0, data TEXT, data2 TEXT, data3 TEXT  )"

.field private static final SQL_CREATE_LOCAL_VERSION_TABLE:Ljava/lang/String; = "CREATE TABLE local_monitor_version ( _id INTEGER PRIMARY KEY AUTOINCREMENT, version_code TEXT, version_name TEXT, manifest_version_code TEXT, update_version_code TEXT  )"

.field private static final TAG:Ljava/lang/String; = "DBHelper"

.field static final T_LOCAL_LOG:Ljava/lang/String; = "local_monitor_log"

.field static final T_LOCAL_VERSION:Ljava/lang/String; = "local_monitor_version"

.field static final T_LOCAL_VIP_LOG:Ljava/lang/String; = "local_monitor_vip_log"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 3

    .line 61
    const-string v0, "ss_local_monitor.db"

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-direct {p0, p1, v0, v1, v2}, Landroid/database/sqlite/SQLiteOpenHelper;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V

    .line 62
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 2

    .line 65
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, "_"

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, "ss_local_monitor.db"

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-direct {p0, p1, p2, v0, v1}, Landroid/database/sqlite/SQLiteOpenHelper;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V

    .line 66
    return-void
.end method


# virtual methods
.method public onCreate(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 3

    .line 71
    :try_start_0
    const-string v0, "CREATE TABLE local_monitor_log ( _id Integer PRIMARY KEY AUTOINCREMENT, type VARCHAR, type2 VARCHAR, create_time Integer, version_id Integer, is_sampled Integer DEFAULT 0, data TEXT, data2 TEXT, data3 TEXT  )"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 72
    const-string v0, "CREATE TABLE local_monitor_version ( _id INTEGER PRIMARY KEY AUTOINCREMENT, version_code TEXT, version_name TEXT, manifest_version_code TEXT, update_version_code TEXT  )"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 75
    goto :goto_0

    .line 73
    :catch_0
    move-exception p1

    .line 74
    const-string v0, "DBHelper"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "monitorDB create failed:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 76
    :goto_0
    return-void
.end method

.method public onUpgrade(Landroid/database/sqlite/SQLiteDatabase;II)V
    .locals 0

    .line 81
    return-void
.end method
