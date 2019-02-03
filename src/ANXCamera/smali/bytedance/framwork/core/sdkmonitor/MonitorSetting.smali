.class public Lbytedance/framwork/core/sdkmonitor/MonitorSetting;
.super Ljava/lang/Object;
.source "MonitorSetting.java"


# instance fields
.field public mAllowLogType:Lorg/json/JSONObject;

.field public mAllowService:Lorg/json/JSONObject;

.field public mFetchSettingInterval:J

.field public mIsEncrypt:Z

.field public mLastFetchSettingTime:J

.field public mLogRemoveSwitch:Z

.field public mLogSendSwitch:I

.field public mMetricType:Lorg/json/JSONObject;

.field public mMonitorMaxRowCount:I

.field public mReportCount:I

.field public mReportFailBaseTime:I

.field public mReportFailRepeatCount:I

.field public mReportInterval:I

.field public mReportUrlList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public mStopMoreChannelInterval:J


# direct methods
.method public constructor <init>(JJIIIILorg/json/JSONObject;Lorg/json/JSONObject;Lorg/json/JSONObject;Ljava/util/List;IJZZI)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JJIIII",
            "Lorg/json/JSONObject;",
            "Lorg/json/JSONObject;",
            "Lorg/json/JSONObject;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;IJZZI)V"
        }
    .end annotation

    move-object v0, p0

    .line 30
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 12
    const-wide/16 v1, 0x0

    iput-wide v1, v0, Lbytedance/framwork/core/sdkmonitor/MonitorSetting;->mLastFetchSettingTime:J

    .line 31
    move-wide v1, p1

    iput-wide v1, v0, Lbytedance/framwork/core/sdkmonitor/MonitorSetting;->mLastFetchSettingTime:J

    .line 32
    move-wide v1, p3

    iput-wide v1, v0, Lbytedance/framwork/core/sdkmonitor/MonitorSetting;->mFetchSettingInterval:J

    .line 33
    move v1, p5

    iput v1, v0, Lbytedance/framwork/core/sdkmonitor/MonitorSetting;->mReportInterval:I

    .line 34
    move v1, p6

    iput v1, v0, Lbytedance/framwork/core/sdkmonitor/MonitorSetting;->mReportCount:I

    .line 35
    move v1, p7

    iput v1, v0, Lbytedance/framwork/core/sdkmonitor/MonitorSetting;->mReportFailRepeatCount:I

    .line 36
    move v1, p8

    iput v1, v0, Lbytedance/framwork/core/sdkmonitor/MonitorSetting;->mReportFailBaseTime:I

    .line 37
    move-object v1, p9

    iput-object v1, v0, Lbytedance/framwork/core/sdkmonitor/MonitorSetting;->mAllowLogType:Lorg/json/JSONObject;

    .line 38
    move-object v1, p10

    iput-object v1, v0, Lbytedance/framwork/core/sdkmonitor/MonitorSetting;->mMetricType:Lorg/json/JSONObject;

    .line 39
    move-object v1, p11

    iput-object v1, v0, Lbytedance/framwork/core/sdkmonitor/MonitorSetting;->mAllowService:Lorg/json/JSONObject;

    .line 40
    move-object v1, p12

    iput-object v1, v0, Lbytedance/framwork/core/sdkmonitor/MonitorSetting;->mReportUrlList:Ljava/util/List;

    .line 41
    move/from16 v1, p13

    iput v1, v0, Lbytedance/framwork/core/sdkmonitor/MonitorSetting;->mLogSendSwitch:I

    .line 42
    move-wide/from16 v1, p14

    iput-wide v1, v0, Lbytedance/framwork/core/sdkmonitor/MonitorSetting;->mStopMoreChannelInterval:J

    .line 43
    move/from16 v1, p16

    iput-boolean v1, v0, Lbytedance/framwork/core/sdkmonitor/MonitorSetting;->mLogRemoveSwitch:Z

    .line 44
    move/from16 v1, p17

    iput-boolean v1, v0, Lbytedance/framwork/core/sdkmonitor/MonitorSetting;->mIsEncrypt:Z

    .line 45
    move/from16 v1, p18

    iput v1, v0, Lbytedance/framwork/core/sdkmonitor/MonitorSetting;->mMonitorMaxRowCount:I

    .line 46
    return-void
.end method
