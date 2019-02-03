.class public Lcom/bytedance/frameworks/core/monitor/MonitorCommonConstants;
.super Ljava/lang/Object;
.source "MonitorCommonConstants.java"


# static fields
.field public static final COUNT_TYPE:Ljava/lang/String; = "count"

.field public static final DATA_TYPE:Ljava/lang/String; = "data"

.field public static final DEBUG_REAL_TYPE:Ljava/lang/String; = "debug_real"

.field public static final DEFAULT_AID:Ljava/lang/String; = "default"

.field public static final IS_LOG_SEND_SWITCH:Z = true

.field public static final LAST_STOP_INTERVAL:J = 0x1b7740L

.field public static final LOG_REPORT_TYPE_DEFAULT:Ljava/lang/String; = "monitor"

.field public static final MAX_COUNT_UPLOAD_SINGLE_TIME:I = 0x190

.field public static final MAX_MONITOR_LOG_SAVE_COUNT:I = 0x9c40

.field public static final MSG_CLEAN_EXPIRED_LOG:I = 0x10

.field public static final MSG_FLUSH_BUFFER:I = 0xc

.field public static final MSG_HANDLE_COUNT:I = 0x3

.field public static final MSG_HANDLE_DEBUG_REAL:I = 0x5

.field public static final MSG_HANDLE_DIRECT_COUNT:I = 0x7

.field public static final MSG_HANDLE_DIRECT_TIMER:I = 0x6

.field public static final MSG_HANDLE_LOG_TIMED_TASK:I = 0xd

.field public static final MSG_HANDLE_PACK_AND_SEND_LOG:I = 0xe

.field public static final MSG_HANDLE_TIMER:I = 0x4

.field public static final MSG_HANDLE_UPDATE_CONFIG:I = 0x8

.field public static final MSG_INIT:I = 0x1

.field public static final MSG_INIT_CURRENT_VERSION_INFO:I = 0x2

.field public static final MSG_LOG_SEND:I = 0xa

.field public static final MSG_REPORT_LOG_COUNT_DAILY:I = 0xf

.field public static final MSG_UPDATE_COLLECT_LOG_SWITCH:I = 0x9

.field public static final MSG_UPLOAD_LEGACY:I = 0xb

.field public static final REMOVE_LOG_SWITCH:Z = false

.field public static final REPORT_COUNT:I = 0x64

.field public static final REPORT_FAIL_BASE_TIME:I = 0xf

.field public static final REPORT_FAIL_REPEAT_COUNT:I = 0x4

.field public static final REPORT_INTERVAL:I = 0x78

.field public static final SECOND_STOP_INTERVAL:J = 0x493e0L

.field public static final STOP_MORE_CHANNEL_INTERVAL:J = 0x927c0L

.field public static final THIRD_STOP_INTERVAL:J = 0xdbba0L

.field public static final TIMER_TYPE:Ljava/lang/String; = "timer"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
