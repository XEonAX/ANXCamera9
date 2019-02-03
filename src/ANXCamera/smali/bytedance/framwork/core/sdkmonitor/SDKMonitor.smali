.class public Lbytedance/framwork/core/sdkmonitor/SDKMonitor;
.super Ljava/lang/Object;
.source "SDKMonitor.java"

# interfaces
.implements Lcom/bytedance/frameworks/core/monitor/MonitorManager$IHandleOnTimerEvent;
.implements Lcom/bytedance/frameworks/core/monitor/config/IMonitorConfigure;
.implements Lcom/bytedance/frameworks/core/monitor/net/ISendLog;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lbytedance/framwork/core/sdkmonitor/SDKMonitor$IGetCommonParams;
    }
.end annotation


# static fields
.field private static final SDK_VERSION:I = 0x190


# instance fields
.field private mAid:Ljava/lang/String;

.field private volatile mAllowService:Lorg/json/JSONObject;

.field private mCacheData:Lbytedance/framwork/core/sdkmonitor/CacheData;

.field private mCommonParams:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private volatile mConfigExit:Z

.field private mConfigUrls:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mContext:Landroid/content/Context;

.field private volatile mFetchSettingInterval:J

.field private mGetCommonParams:Lbytedance/framwork/core/sdkmonitor/SDKMonitor$IGetCommonParams;

.field private volatile mHasInit:Z

.field private mHeaderInfo:Lorg/json/JSONObject;

.field private volatile mIsEncrypt:Z

.field private volatile mLastFetchSettingTime:J

.field private volatile mLogRemoveNet:Z

.field private volatile mLogRemoveSwitch:Z

.field private volatile mLogSendSwitch:I

.field private mMonitorManager:Lcom/bytedance/frameworks/core/monitor/MonitorManager;

.field private volatile mMonitorMaxRowCount:J

.field private volatile mReportCount:I

.field private volatile mReportFailBaseTime:I

.field private volatile mReportFailRepeatCount:I

.field private volatile mReportInterval:I

.field private mReportTypeList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private volatile mReportUrlList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private volatile mStopCollectInterval:J

.field private volatile mStopCollectLogTime:J

.field private volatile mStopIntervalTimes:I

.field private volatile mStopMoreChannelInterval:J

.field private mUploadTypeListInDefaultReportType:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method protected constructor <init>(Landroid/content/Context;Ljava/lang/String;Lorg/json/JSONObject;Lbytedance/framwork/core/sdkmonitor/SDKMonitor$IGetCommonParams;)V
    .locals 6

    .line 120
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 61
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mLastFetchSettingTime:J

    .line 70
    const/4 v2, 0x1

    iput v2, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mLogSendSwitch:I

    .line 77
    new-instance v3, Ljava/util/ArrayList;

    const-string v4, "http://mon.snssdk.com/monitor/appmonitor/v2/settings"

    const-string v5, "http://monsetting.toutiao.com/monitor/appmonitor/v2/settings"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v3, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mConfigUrls:Ljava/util/List;

    .line 80
    iput-wide v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mStopCollectLogTime:J

    .line 81
    iput-wide v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mStopCollectInterval:J

    .line 82
    const/4 v0, 0x0

    iput v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mStopIntervalTimes:I

    .line 88
    iput-boolean v2, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mIsEncrypt:Z

    .line 121
    iput-object p2, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mAid:Ljava/lang/String;

    .line 122
    iput-boolean v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mConfigExit:Z

    .line 123
    new-instance p2, Lbytedance/framwork/core/sdkmonitor/CacheData;

    invoke-direct {p2}, Lbytedance/framwork/core/sdkmonitor/CacheData;-><init>()V

    iput-object p2, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mCacheData:Lbytedance/framwork/core/sdkmonitor/CacheData;

    .line 124
    invoke-virtual {p0, p1, p3, p4}, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->init(Landroid/content/Context;Lorg/json/JSONObject;Lbytedance/framwork/core/sdkmonitor/SDKMonitor$IGetCommonParams;)Z

    .line 125
    return-void
.end method

.method static synthetic access$000(Lbytedance/framwork/core/sdkmonitor/SDKMonitor;)Lbytedance/framwork/core/sdkmonitor/SDKMonitor$IGetCommonParams;
    .locals 0

    .line 56
    iget-object p0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mGetCommonParams:Lbytedance/framwork/core/sdkmonitor/SDKMonitor$IGetCommonParams;

    return-object p0
.end method

.method static synthetic access$100(Lbytedance/framwork/core/sdkmonitor/SDKMonitor;)Ljava/util/List;
    .locals 0

    .line 56
    iget-object p0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mConfigUrls:Ljava/util/List;

    return-object p0
.end method

.method static synthetic access$200(Lbytedance/framwork/core/sdkmonitor/SDKMonitor;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 56
    invoke-direct {p0, p1}, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->addParamsToURL(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$300(Lbytedance/framwork/core/sdkmonitor/SDKMonitor;)Z
    .locals 0

    .line 56
    iget-boolean p0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mIsEncrypt:Z

    return p0
.end method

.method static synthetic access$400(Lbytedance/framwork/core/sdkmonitor/SDKMonitor;Lorg/json/JSONObject;)V
    .locals 0

    .line 56
    invoke-direct {p0, p1}, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->updateToSP(Lorg/json/JSONObject;)V

    return-void
.end method

.method static synthetic access$500(Lbytedance/framwork/core/sdkmonitor/SDKMonitor;)Z
    .locals 0

    .line 56
    iget-boolean p0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mConfigExit:Z

    return p0
.end method

.method static synthetic access$502(Lbytedance/framwork/core/sdkmonitor/SDKMonitor;Z)Z
    .locals 0

    .line 56
    iput-boolean p1, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mConfigExit:Z

    return p1
.end method

.method static synthetic access$600(Lbytedance/framwork/core/sdkmonitor/SDKMonitor;)Lbytedance/framwork/core/sdkmonitor/CacheData;
    .locals 0

    .line 56
    iget-object p0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mCacheData:Lbytedance/framwork/core/sdkmonitor/CacheData;

    return-object p0
.end method

.method private addParamsToURL(Ljava/lang/String;)Ljava/lang/String;
    .locals 5

    .line 586
    invoke-static {p1}, Landroid/text/TextUtils;->isDigitsOnly(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_6

    iget-object v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mCommonParams:Ljava/util/HashMap;

    if-nez v0, :cond_0

    goto/16 :goto_3

    .line 588
    :cond_0
    const-string v0, "?"

    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    if-gez v0, :cond_1

    .line 589
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "?"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 590
    :cond_1
    const-string v0, "?"

    invoke-virtual {p1, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    const/16 v1, 0x190

    if-eqz v0, :cond_2

    .line 591
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "sdk_version"

    const-string v2, "UTF-8"

    invoke-static {p1, v2}, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "="

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p1

    const-string v1, "UTF-8"

    invoke-static {p1, v1}, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    .line 593
    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "&"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "sdk_version"

    const-string v2, "UTF-8"

    invoke-static {p1, v2}, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "="

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p1

    const-string v1, "UTF-8"

    invoke-static {p1, v1}, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 595
    :goto_0
    iget-object v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mCommonParams:Ljava/util/HashMap;

    .line 596
    if-eqz v0, :cond_5

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v1

    if-lez v1, :cond_5

    .line 597
    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 598
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_5

    .line 599
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 600
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_4

    .line 601
    const-string v3, "?"

    invoke-virtual {p1, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 602
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v4, "UTF-8"

    invoke-static {p1, v4}, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "="

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v2, "UTF-8"

    invoke-static {p1, v2}, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_2

    .line 604
    :cond_3
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "&"

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v4, "UTF-8"

    invoke-static {p1, v4}, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "="

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v2, "UTF-8"

    invoke-static {p1, v2}, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 607
    :cond_4
    :goto_2
    goto/16 :goto_1

    .line 609
    :cond_5
    return-object p1

    .line 587
    :cond_6
    :goto_3
    return-object p1
.end method

.method private static encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 614
    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    :try_start_0
    const-string p1, "UTF-8"

    :goto_0
    invoke-static {p0, p1}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    .line 616
    :catch_0
    move-exception p0

    .line 617
    new-instance p1, Ljava/lang/IllegalArgumentException;

    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/Throwable;)V

    throw p1
.end method

.method private getSessionId()Ljava/lang/String;
    .locals 1

    .line 631
    iget-object v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mGetCommonParams:Lbytedance/framwork/core/sdkmonitor/SDKMonitor$IGetCommonParams;

    if-eqz v0, :cond_0

    .line 632
    iget-object v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mGetCommonParams:Lbytedance/framwork/core/sdkmonitor/SDKMonitor$IGetCommonParams;

    invoke-interface {v0}, Lbytedance/framwork/core/sdkmonitor/SDKMonitor$IGetCommonParams;->getSessionId()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 634
    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method private handleResponseResult(Lorg/json/JSONObject;)V
    .locals 0

    .line 583
    return-void
.end method

.method private initConfig()V
    .locals 6

    .line 218
    iget-object v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mContext:Landroid/content/Context;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "monitor_config"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mAid:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 220
    const-string v1, "monitor_net_config"

    const/4 v3, 0x0

    invoke-interface {v0, v1, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 221
    const-string v3, "monitor_configure_refresh_time"

    const-wide/16 v4, 0x0

    invoke-interface {v0, v3, v4, v5}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v3

    iput-wide v3, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mLastFetchSettingTime:J

    .line 222
    if-eqz v1, :cond_0

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 224
    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mConfigExit:Z

    .line 225
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 226
    invoke-virtual {p0, v0}, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->updateConfig(Lorg/json/JSONObject;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 229
    goto :goto_0

    .line 227
    :catch_0
    move-exception v0

    .line 228
    const-string v0, "monitor_config"

    const-string v1, "\u914d\u7f6e\u4fe1\u606f\u8bfb\u53d6\u5931\u8d25"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 231
    :cond_0
    :goto_0
    invoke-virtual {p0, v2}, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->updateConfigFromNet(Z)V

    .line 232
    return-void
.end method

.method private initLocalMonitorLog()V
    .locals 6

    .line 352
    iget-object v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mMonitorManager:Lcom/bytedance/frameworks/core/monitor/MonitorManager;

    if-nez v0, :cond_0

    .line 353
    return-void

    .line 356
    :cond_0
    :try_start_0
    new-instance v0, Lcom/bytedance/frameworks/core/monitor/model/LocalVersionInfo;

    iget-object v1, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mHeaderInfo:Lorg/json/JSONObject;

    const-string v2, "version_code"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mHeaderInfo:Lorg/json/JSONObject;

    const-string v3, "version_name"

    .line 357
    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mHeaderInfo:Lorg/json/JSONObject;

    const-string v4, "manifest_version_code"

    .line 358
    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mHeaderInfo:Lorg/json/JSONObject;

    const-string v5, "update_version_code"

    .line 359
    invoke-virtual {v4, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/bytedance/frameworks/core/monitor/model/LocalVersionInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 360
    iget-object v1, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mMonitorManager:Lcom/bytedance/frameworks/core/monitor/MonitorManager;

    invoke-virtual {v1, v0}, Lcom/bytedance/frameworks/core/monitor/MonitorManager;->setCurrentVersionInfo(Lcom/bytedance/frameworks/core/monitor/model/LocalVersionInfo;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 363
    goto :goto_0

    .line 361
    :catch_0
    move-exception v0

    .line 364
    :goto_0
    return-void
.end method

.method private initLogLib()V
    .locals 1

    .line 622
    new-instance v0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor$3;

    invoke-direct {v0, p0}, Lbytedance/framwork/core/sdkmonitor/SDKMonitor$3;-><init>(Lbytedance/framwork/core/sdkmonitor/SDKMonitor;)V

    invoke-static {v0}, Lcom/bytedance/frameworks/baselib/log/LogLib;->init(Lcom/bytedance/frameworks/baselib/log/LogLib$ILogDelegate;)V

    .line 628
    return-void
.end method

.method private initMonitor(Landroid/content/Context;Lorg/json/JSONObject;Lbytedance/framwork/core/sdkmonitor/SDKMonitor$IGetCommonParams;)V
    .locals 3

    .line 160
    const/4 v0, 0x1

    iput-boolean v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mHasInit:Z

    .line 161
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    iput-object v1, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mContext:Landroid/content/Context;

    .line 162
    iput-object p2, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mHeaderInfo:Lorg/json/JSONObject;

    .line 163
    iget-object p2, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mHeaderInfo:Lorg/json/JSONObject;

    const-string v1, "package_name"

    invoke-virtual {p2, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    if-eqz p2, :cond_0

    .line 165
    :try_start_0
    iget-object p2, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mHeaderInfo:Lorg/json/JSONObject;

    const-string v1, "package_name"

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p2, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 167
    goto :goto_0

    .line 166
    :catch_0
    move-exception p2

    .line 170
    :cond_0
    :goto_0
    :try_start_1
    iget-object p2, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mHeaderInfo:Lorg/json/JSONObject;

    const-string v1, "aid"

    iget-object v2, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mAid:Ljava/lang/String;

    invoke-virtual {p2, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 171
    iget-object p2, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mHeaderInfo:Lorg/json/JSONObject;

    const-string v1, "os"

    const-string v2, "Android"

    invoke-virtual {p2, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 172
    iget-object p2, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mHeaderInfo:Lorg/json/JSONObject;

    const-string v1, "device_platform"

    const-string v2, "android"

    invoke-virtual {p2, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 173
    iget-object p2, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mHeaderInfo:Lorg/json/JSONObject;

    const-string v1, "os_version"

    sget-object v2, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    invoke-virtual {p2, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 174
    iget-object p2, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mHeaderInfo:Lorg/json/JSONObject;

    const-string v1, "os_api"

    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    invoke-virtual {p2, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 175
    iget-object p2, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mHeaderInfo:Lorg/json/JSONObject;

    const-string v1, "device_model"

    sget-object v2, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual {p2, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 176
    iget-object p2, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mHeaderInfo:Lorg/json/JSONObject;

    const-string v1, "device_brand"

    sget-object v2, Landroid/os/Build;->BRAND:Ljava/lang/String;

    invoke-virtual {p2, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 177
    iget-object p2, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mHeaderInfo:Lorg/json/JSONObject;

    const-string v1, "device_manufacturer"

    sget-object v2, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    invoke-virtual {p2, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 178
    const/4 p2, 0x0

    .line 179
    iget-object v1, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mHeaderInfo:Lorg/json/JSONObject;

    const-string v2, "version_name"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 180
    iget-object p2, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mContext:Landroid/content/Context;

    invoke-virtual {p2}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p2

    iget-object v1, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1, v0}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object p2

    .line 181
    iget-object v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mHeaderInfo:Lorg/json/JSONObject;

    const-string v1, "version_name"

    iget-object v2, p2, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 183
    :cond_1
    iget-object v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mHeaderInfo:Lorg/json/JSONObject;

    const-string v1, "version_code"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 184
    iget-object v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mHeaderInfo:Lorg/json/JSONObject;

    const-string v1, "version_code"

    iget p2, p2, Landroid/content/pm/PackageInfo;->versionCode:I

    invoke-virtual {v0, v1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 186
    :cond_2
    iput-object p3, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mGetCommonParams:Lbytedance/framwork/core/sdkmonitor/SDKMonitor$IGetCommonParams;

    .line 187
    iget-object p2, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mGetCommonParams:Lbytedance/framwork/core/sdkmonitor/SDKMonitor$IGetCommonParams;

    if-nez p2, :cond_3

    .line 188
    new-instance p2, Lbytedance/framwork/core/sdkmonitor/SDKMonitor$1;

    invoke-direct {p2, p0}, Lbytedance/framwork/core/sdkmonitor/SDKMonitor$1;-><init>(Lbytedance/framwork/core/sdkmonitor/SDKMonitor;)V

    iput-object p2, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mGetCommonParams:Lbytedance/framwork/core/sdkmonitor/SDKMonitor$IGetCommonParams;

    .line 195
    :cond_3
    iget-object p2, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mCommonParams:Ljava/util/HashMap;

    if-nez p2, :cond_4

    .line 196
    new-instance p2, Ljava/util/HashMap;

    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    iput-object p2, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mCommonParams:Ljava/util/HashMap;

    .line 198
    :cond_4
    iget-object p2, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mCommonParams:Ljava/util/HashMap;

    const-string p3, "aid"

    iget-object v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mAid:Ljava/lang/String;

    invoke-virtual {p2, p3, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 199
    iget-object p2, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mCommonParams:Ljava/util/HashMap;

    const-string p3, "device_id"

    iget-object v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mHeaderInfo:Lorg/json/JSONObject;

    const-string v1, "device_id"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, p3, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 200
    iget-object p2, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mCommonParams:Ljava/util/HashMap;

    const-string p3, "device_platform"

    const-string v0, "android"

    invoke-virtual {p2, p3, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 201
    iget-object p2, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mCommonParams:Ljava/util/HashMap;

    const-string p3, "package_name"

    iget-object v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mHeaderInfo:Lorg/json/JSONObject;

    const-string v1, "package_name"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, p3, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 202
    iget-object p2, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mCommonParams:Ljava/util/HashMap;

    const-string p3, "channel"

    iget-object v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mHeaderInfo:Lorg/json/JSONObject;

    const-string v1, "channel"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, p3, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 203
    iget-object p2, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mCommonParams:Ljava/util/HashMap;

    const-string p3, "app_version"

    iget-object v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mHeaderInfo:Lorg/json/JSONObject;

    const-string v1, "app_version"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, p3, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 205
    iget-object p2, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mAid:Ljava/lang/String;

    invoke-static {p2, p0}, Lcom/bytedance/frameworks/core/monitor/config/MonitorConfigure;->setCommonConfig(Ljava/lang/String;Lcom/bytedance/frameworks/core/monitor/config/IMonitorConfigure;)V

    .line 206
    iget-object p2, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mAid:Ljava/lang/String;

    invoke-static {p2, p0}, Lcom/bytedance/frameworks/core/monitor/net/MonitorLogSender;->setISendLog(Ljava/lang/String;Lcom/bytedance/frameworks/core/monitor/net/ISendLog;)V

    .line 207
    invoke-direct {p0}, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->initLogLib()V

    .line 208
    new-instance p2, Lcom/bytedance/frameworks/core/monitor/MonitorManager;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iget-object p3, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mAid:Ljava/lang/String;

    invoke-direct {p2, p1, p0, p3}, Lcom/bytedance/frameworks/core/monitor/MonitorManager;-><init>(Landroid/content/Context;Lcom/bytedance/frameworks/core/monitor/MonitorManager$IHandleOnTimerEvent;Ljava/lang/String;)V

    iput-object p2, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mMonitorManager:Lcom/bytedance/frameworks/core/monitor/MonitorManager;

    .line 209
    invoke-direct {p0}, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->initConfig()V

    .line 210
    invoke-direct {p0}, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->initLocalMonitorLog()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 211
    goto :goto_1

    :catch_1
    move-exception p1

    .line 212
    :goto_1
    return-void
.end method

.method private monitorService(Ljava/lang/String;ILorg/json/JSONObject;Lorg/json/JSONObject;)V
    .locals 2

    .line 681
    if-nez p4, :cond_0

    .line 682
    :try_start_0
    new-instance p4, Lorg/json/JSONObject;

    invoke-direct {p4}, Lorg/json/JSONObject;-><init>()V

    goto :goto_0

    .line 695
    :catch_0
    move-exception p1

    goto :goto_1

    .line 683
    :cond_0
    :goto_0
    const-string v0, "log_type"

    const-string v1, "service_monitor"

    invoke-virtual {p4, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 684
    const-string v0, "service"

    invoke-virtual {p4, v0, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 685
    const-string v0, "status"

    invoke-virtual {p4, v0, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 686
    const-string p2, "network_type"

    invoke-virtual {p0}, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->getNetWorkType()I

    move-result v0

    invoke-virtual {p4, p2, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 687
    const-string p2, "value"

    invoke-virtual {p4, p2, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 688
    const-string p2, "timestamp"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-virtual {p4, p2, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 689
    invoke-direct {p0}, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->getSessionId()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    if-nez p2, :cond_1

    .line 690
    const-string p2, "session_id"

    invoke-direct {p0}, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->getSessionId()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p4, p2, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 692
    :cond_1
    invoke-virtual {p0}, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->getMonitorManager()Lcom/bytedance/frameworks/core/monitor/MonitorManager;

    move-result-object p2

    if-eqz p2, :cond_2

    invoke-virtual {p0, p1}, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->getServiceSwitch(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_2

    .line 693
    invoke-virtual {p0}, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->getMonitorManager()Lcom/bytedance/frameworks/core/monitor/MonitorManager;

    move-result-object p1

    const-string p2, "service_monitor"

    invoke-virtual {p4}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p3

    const/4 p4, 0x1

    invoke-virtual {p1, p2, p3, p4}, Lcom/bytedance/frameworks/core/monitor/MonitorManager;->logSend(Ljava/lang/String;Ljava/lang/String;Z)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 697
    :cond_2
    goto :goto_2

    .line 695
    :goto_1
    nop

    .line 698
    :goto_2
    return-void
.end method

.method private needUpdateConfigFromNet()Z
    .locals 4

    .line 279
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mLastFetchSettingTime:J

    sub-long/2addr v0, v2

    const-wide/16 v2, 0x3e8

    div-long/2addr v0, v2

    iget-wide v2, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mFetchSettingInterval:J

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private updateToSP(Lorg/json/JSONObject;)V
    .locals 4

    .line 283
    if-eqz p1, :cond_1

    invoke-virtual {p1}, Lorg/json/JSONObject;->length()I

    move-result v0

    if-lez v0, :cond_1

    .line 285
    :try_start_0
    const-string v0, "data"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    invoke-virtual {p0, v0}, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->updateConfig(Lorg/json/JSONObject;)V

    .line 286
    iget-object v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mContext:Landroid/content/Context;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "monitor_config"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mAid:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 288
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 289
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    .line 290
    const-string v3, "monitor_configure_refresh_time"

    invoke-interface {v0, v3, v1, v2}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 291
    const-string v1, "monitor_net_config"

    const-string v2, "data"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 292
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 293
    iget-boolean p1, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mConfigExit:Z

    if-nez p1, :cond_0

    .line 294
    const/4 p1, 0x1

    iput-boolean p1, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mConfigExit:Z

    .line 295
    iget-object p1, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mCacheData:Lbytedance/framwork/core/sdkmonitor/CacheData;

    invoke-virtual {p1, p0}, Lbytedance/framwork/core/sdkmonitor/CacheData;->handleCacheData(Lbytedance/framwork/core/sdkmonitor/SDKMonitor;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 299
    :cond_0
    goto :goto_0

    .line 297
    :catch_0
    move-exception p1

    .line 301
    :cond_1
    :goto_0
    return-void
.end method


# virtual methods
.method getLogSendSwitch()Z
    .locals 2

    .line 385
    iget v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mLogSendSwitch:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method public getMonitorLogMaxSaveCount()J
    .locals 2

    .line 480
    iget-wide v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mMonitorMaxRowCount:J

    return-wide v0
.end method

.method public getMonitorManager()Lcom/bytedance/frameworks/core/monitor/MonitorManager;
    .locals 1

    .line 373
    iget-object v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mMonitorManager:Lcom/bytedance/frameworks/core/monitor/MonitorManager;

    return-object v0
.end method

.method public getNetWorkType()I
    .locals 1

    .line 389
    iget-object v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil;->getNetworkType(Landroid/content/Context;)Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$NetworkType;

    move-result-object v0

    invoke-virtual {v0}, Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$NetworkType;->getValue()I

    move-result v0

    return v0
.end method

.method public getRemoveSwitch()Z
    .locals 1

    .line 529
    iget-boolean v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mLogRemoveNet:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mLogRemoveNet:Z

    goto :goto_0

    :cond_0
    iget-boolean v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mLogRemoveSwitch:Z

    :goto_0
    return v0
.end method

.method public getReportTypeByUploadType(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 475
    const-string p1, "monitor"

    return-object p1
.end method

.method public getReportTypeList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 456
    iget-object v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mReportTypeList:Ljava/util/List;

    if-nez v0, :cond_0

    .line 457
    const-string v0, "monitor"

    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mReportTypeList:Ljava/util/List;

    .line 459
    :cond_0
    iget-object v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mReportTypeList:Ljava/util/List;

    return-object v0
.end method

.method getServiceSwitch(Ljava/lang/String;)Z
    .locals 2

    .line 378
    iget-object v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mAllowService:Lorg/json/JSONObject;

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 381
    :cond_0
    iget-object v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mAllowService:Lorg/json/JSONObject;

    invoke-virtual {v0, p1}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    if-eqz p1, :cond_1

    const/4 v1, 0x1

    nop

    :cond_1
    return v1

    .line 379
    :cond_2
    :goto_0
    return v1
.end method

.method public getUploadTypeByReportType(Ljava/lang/String;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 464
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "monitor"

    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    .line 470
    :cond_0
    const/4 p1, 0x0

    return-object p1

    .line 465
    :cond_1
    :goto_0
    iget-object p1, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mUploadTypeListInDefaultReportType:Ljava/util/List;

    if-nez p1, :cond_2

    .line 466
    const-string p1, "service_monitor"

    filled-new-array {p1}, [Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mUploadTypeListInDefaultReportType:Ljava/util/List;

    .line 468
    :cond_2
    iget-object p1, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mUploadTypeListInDefaultReportType:Ljava/util/List;

    return-object p1
.end method

.method public handleEvent()V
    .locals 6

    .line 394
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mStopCollectLogTime:J

    sub-long/2addr v0, v2

    iget-wide v2, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mStopCollectInterval:J

    cmp-long v0, v0, v2

    const/4 v1, 0x0

    if-lez v0, :cond_0

    .line 395
    iput-boolean v1, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mLogRemoveNet:Z

    .line 396
    iget-object v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mMonitorManager:Lcom/bytedance/frameworks/core/monitor/MonitorManager;

    if-eqz v0, :cond_0

    .line 397
    iget-object v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mMonitorManager:Lcom/bytedance/frameworks/core/monitor/MonitorManager;

    invoke-virtual {p0}, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->getLogSendSwitch()Z

    move-result v2

    invoke-virtual {v0, v2}, Lcom/bytedance/frameworks/core/monitor/MonitorManager;->setReportLogSwitch(Z)V

    .line 400
    :cond_0
    iget-wide v2, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mFetchSettingInterval:J

    const-wide/16 v4, 0x0

    cmp-long v0, v2, v4

    if-gtz v0, :cond_1

    .line 401
    return-void

    .line 403
    :cond_1
    invoke-virtual {p0, v1}, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->updateConfigFromNet(Z)V

    .line 404
    return-void
.end method

.method public init(Landroid/content/Context;Lorg/json/JSONObject;Lbytedance/framwork/core/sdkmonitor/SDKMonitor$IGetCommonParams;)Z
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lorg/json/JSONObject;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Lbytedance/framwork/core/sdkmonitor/SDKMonitor$IGetCommonParams;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 136
    if-eqz p2, :cond_2

    invoke-virtual {p2}, Lorg/json/JSONObject;->length()I

    move-result v0

    if-gtz v0, :cond_0

    goto :goto_0

    .line 139
    :cond_0
    invoke-direct {p0, p1, p2, p3}, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->initMonitor(Landroid/content/Context;Lorg/json/JSONObject;Lbytedance/framwork/core/sdkmonitor/SDKMonitor$IGetCommonParams;)V

    .line 140
    iget-boolean p1, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mConfigExit:Z

    if-eqz p1, :cond_1

    .line 141
    iget-object p1, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mCacheData:Lbytedance/framwork/core/sdkmonitor/CacheData;

    invoke-virtual {p1, p0}, Lbytedance/framwork/core/sdkmonitor/CacheData;->handleCacheData(Lbytedance/framwork/core/sdkmonitor/SDKMonitor;)V

    .line 143
    :cond_1
    const/4 p1, 0x1

    return p1

    .line 137
    :cond_2
    :goto_0
    const/4 p1, 0x0

    return p1
.end method

.method public isLogSendSwitch()Z
    .locals 2

    .line 409
    iget v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mLogSendSwitch:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method public monitorDuration(Ljava/lang/String;Lorg/json/JSONObject;Lorg/json/JSONObject;)V
    .locals 1

    .line 676
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0, p2, p3}, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->monitorStatusAndDuration(Ljava/lang/String;ILorg/json/JSONObject;Lorg/json/JSONObject;)V

    .line 677
    return-void
.end method

.method public monitorStatusAndDuration(Ljava/lang/String;ILorg/json/JSONObject;Lorg/json/JSONObject;)V
    .locals 2

    .line 647
    :try_start_0
    iget-boolean v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mConfigExit:Z

    if-nez v0, :cond_0

    .line 648
    iget-object v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mCacheData:Lbytedance/framwork/core/sdkmonitor/CacheData;

    new-instance v1, Lbytedance/framwork/core/sdkmonitor/CacheData$SerViceMonitorData;

    invoke-direct {v1, p1, p2, p3, p4}, Lbytedance/framwork/core/sdkmonitor/CacheData$SerViceMonitorData;-><init>(Ljava/lang/String;ILorg/json/JSONObject;Lorg/json/JSONObject;)V

    invoke-virtual {v0, v1}, Lbytedance/framwork/core/sdkmonitor/CacheData;->insertServiceMonitorData(Lbytedance/framwork/core/sdkmonitor/CacheData$SerViceMonitorData;)V

    goto :goto_0

    .line 650
    :cond_0
    invoke-direct {p0, p1, p2, p3, p4}, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->monitorService(Ljava/lang/String;ILorg/json/JSONObject;Lorg/json/JSONObject;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 654
    :goto_0
    goto :goto_1

    .line 652
    :catch_0
    move-exception p1

    .line 655
    :goto_1
    return-void
.end method

.method public monitorStatusRate(Ljava/lang/String;ILorg/json/JSONObject;)V
    .locals 1

    .line 665
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0, p3}, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->monitorStatusAndDuration(Ljava/lang/String;ILorg/json/JSONObject;Lorg/json/JSONObject;)V

    .line 666
    return-void
.end method

.method public reportCount()I
    .locals 1

    .line 432
    iget v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mReportCount:I

    if-gtz v0, :cond_0

    .line 433
    const/16 v0, 0x64

    return v0

    .line 435
    :cond_0
    iget v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mReportCount:I

    return v0
.end method

.method public reportFailRepeatBaseTime()I
    .locals 1

    .line 513
    iget v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mReportFailBaseTime:I

    if-gtz v0, :cond_0

    .line 514
    const/16 v0, 0xf

    return v0

    .line 516
    :cond_0
    iget v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mReportFailBaseTime:I

    return v0
.end method

.method public reportFailRepeatCount()I
    .locals 1

    .line 500
    iget v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mReportFailRepeatCount:I

    if-gtz v0, :cond_0

    .line 501
    const/4 v0, 0x4

    return v0

    .line 503
    :cond_0
    iget v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mReportFailRepeatCount:I

    return v0
.end method

.method public reportInterval()I
    .locals 1

    .line 419
    iget v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mReportInterval:I

    if-gtz v0, :cond_0

    .line 420
    const/16 v0, 0x78

    return v0

    .line 422
    :cond_0
    iget v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mReportInterval:I

    return v0
.end method

.method public reportJsonHeaderInfo()Lorg/json/JSONObject;
    .locals 1

    .line 490
    iget-object v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mHeaderInfo:Lorg/json/JSONObject;

    return-object v0
.end method

.method public reportUrl(Ljava/lang/String;)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 445
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "monitor"

    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    .line 451
    :cond_0
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object p1

    return-object p1

    .line 446
    :cond_1
    :goto_0
    iget-object p1, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mReportUrlList:Ljava/util/List;

    if-eqz p1, :cond_2

    iget-object p1, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mReportUrlList:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_3

    .line 447
    :cond_2
    const-string p1, "http://mon.snssdk.com/monitor/collect/"

    const-string v0, "http://mon.toutiao.com/monitor/collect/"

    const-string v1, "http://mon.toutiaocloud.com/monitor/collect/"

    const-string v2, "http://mon.toutiaocloud.net/monitor/collect/"

    filled-new-array {p1, v0, v1, v2}, [Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mReportUrlList:Ljava/util/List;

    .line 449
    :cond_3
    iget-object p1, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mReportUrlList:Ljava/util/List;

    return-object p1
.end method

.method public sendLog(JLjava/lang/String;[BILjava/lang/String;)Lcom/bytedance/frameworks/core/monitor/net/NetResponse;
    .locals 12

    move-object v1, p0

    .line 535
    new-instance v2, Lcom/bytedance/frameworks/core/monitor/net/NetResponse;

    invoke-direct {v2}, Lcom/bytedance/frameworks/core/monitor/net/NetResponse;-><init>()V

    .line 537
    const/4 v3, 0x0

    const/4 v4, 0x1

    move-object v0, p3

    :try_start_0
    invoke-direct {v1, v0}, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->addParamsToURL(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 539
    move/from16 v0, p5

    if-ne v0, v4, :cond_0

    .line 540
    sget-object v9, Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$CompressType;->GZIP:Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$CompressType;

    iget-boolean v11, v1, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mIsEncrypt:Z

    move-wide v5, p1

    move-object/from16 v8, p4

    move-object/from16 v10, p6

    invoke-static/range {v5 .. v11}, Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil;->excutePost(JLjava/lang/String;[BLbytedance/framwork/core/sdkmonitor/MonitorNetUtil$CompressType;Ljava/lang/String;Z)[B

    move-result-object v0

    goto :goto_0

    .line 542
    :cond_0
    sget-object v9, Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$CompressType;->NONE:Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil$CompressType;

    iget-boolean v11, v1, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mIsEncrypt:Z

    move-wide v5, p1

    move-object/from16 v8, p4

    move-object/from16 v10, p6

    invoke-static/range {v5 .. v11}, Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil;->excutePost(JLjava/lang/String;[BLbytedance/framwork/core/sdkmonitor/MonitorNetUtil$CompressType;Ljava/lang/String;Z)[B

    move-result-object v0

    .line 544
    :goto_0
    iput v3, v1, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mStopIntervalTimes:I

    .line 545
    const-wide/16 v5, 0x0

    iput-wide v5, v1, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mStopCollectInterval:J

    .line 546
    const/16 v5, 0xc8

    iput v5, v2, Lcom/bytedance/frameworks/core/monitor/net/NetResponse;->stateCode:I

    .line 547
    new-instance v5, Lorg/json/JSONObject;

    new-instance v6, Ljava/lang/String;

    invoke-direct {v6, v0}, Ljava/lang/String;-><init>([B)V

    invoke-direct {v5, v6}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_1

    .line 549
    :try_start_1
    invoke-direct {v1, v5}, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->handleResponseResult(Lorg/json/JSONObject;)V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0

    .line 552
    goto :goto_1

    .line 550
    :catch_0
    move-exception v0

    .line 551
    move-object v6, v0

    :try_start_2
    invoke-virtual {v6}, Ljava/lang/Throwable;->printStackTrace()V

    .line 553
    :goto_1
    iput-object v5, v2, Lcom/bytedance/frameworks/core/monitor/net/NetResponse;->responseMsg:Lorg/json/JSONObject;
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_1

    .line 554
    return-object v2

    .line 555
    :catch_1
    move-exception v0

    .line 556
    instance-of v5, v0, Lbytedance/framwork/core/sdkmonitor/HttpResponseException;

    if-eqz v5, :cond_1

    .line 557
    check-cast v0, Lbytedance/framwork/core/sdkmonitor/HttpResponseException;

    invoke-virtual {v0}, Lbytedance/framwork/core/sdkmonitor/HttpResponseException;->getStatusCode()I

    move-result v0

    iput v0, v2, Lcom/bytedance/frameworks/core/monitor/net/NetResponse;->stateCode:I

    goto :goto_2

    .line 559
    :cond_1
    const/4 v0, -0x1

    iput v0, v2, Lcom/bytedance/frameworks/core/monitor/net/NetResponse;->stateCode:I

    .line 561
    :goto_2
    iget v0, v2, Lcom/bytedance/frameworks/core/monitor/net/NetResponse;->stateCode:I

    const/16 v5, 0x1f7

    if-eq v0, v5, :cond_2

    iget v0, v2, Lcom/bytedance/frameworks/core/monitor/net/NetResponse;->stateCode:I

    const/16 v5, 0x1fd

    if-ne v0, v5, :cond_6

    .line 562
    :cond_2
    const-string v0, "monitor_response_code"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "response code "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v6, v2, Lcom/bytedance/frameworks/core/monitor/net/NetResponse;->stateCode:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v0, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 563
    iput-boolean v4, v1, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mLogRemoveNet:Z

    .line 564
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    iput-wide v5, v1, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mStopCollectLogTime:J

    .line 565
    iget-object v0, v1, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mMonitorManager:Lcom/bytedance/frameworks/core/monitor/MonitorManager;

    if-eqz v0, :cond_3

    .line 566
    iget-object v0, v1, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mMonitorManager:Lcom/bytedance/frameworks/core/monitor/MonitorManager;

    invoke-virtual {v0, v3}, Lcom/bytedance/frameworks/core/monitor/MonitorManager;->setReportLogSwitch(Z)V

    .line 568
    :cond_3
    iget v0, v1, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mStopIntervalTimes:I

    if-nez v0, :cond_4

    .line 569
    const-wide/32 v5, 0x493e0

    iput-wide v5, v1, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mStopCollectInterval:J

    goto :goto_3

    .line 570
    :cond_4
    iget v0, v1, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mStopIntervalTimes:I

    if-ne v0, v4, :cond_5

    .line 571
    const-wide/32 v5, 0xdbba0

    iput-wide v5, v1, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mStopCollectInterval:J

    goto :goto_3

    .line 573
    :cond_5
    const-wide/32 v5, 0x1b7740

    iput-wide v5, v1, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mStopCollectInterval:J

    .line 575
    :goto_3
    iget v0, v1, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mStopIntervalTimes:I

    add-int/2addr v0, v4

    iput v0, v1, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mStopIntervalTimes:I

    .line 577
    :cond_6
    return-object v2
.end method

.method public setConfigUrl(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 106
    :try_start_0
    iget-boolean v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mHasInit:Z

    if-eqz v0, :cond_0

    .line 107
    return-void

    .line 109
    :cond_0
    if-eqz p1, :cond_1

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_1

    .line 110
    iget-object v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mConfigUrls:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 111
    iget-object v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mConfigUrls:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 115
    :cond_1
    goto :goto_0

    .line 113
    :catch_0
    move-exception p1

    .line 114
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 116
    :goto_0
    return-void
.end method

.method public stopMoreChannelInterval()J
    .locals 4

    .line 521
    iget-wide v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mStopMoreChannelInterval:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 522
    const-wide/32 v0, 0x1b7740

    return-wide v0

    .line 524
    :cond_0
    iget-wide v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mStopMoreChannelInterval:J

    const-wide/16 v2, 0x3e8

    mul-long/2addr v0, v2

    return-wide v0
.end method

.method declared-synchronized updateConfig(Lorg/json/JSONObject;)V
    .locals 8

    monitor-enter p0

    .line 304
    const/4 v0, 0x0

    if-eqz p1, :cond_5

    :try_start_0
    invoke-virtual {p1}, Lorg/json/JSONObject;->length()I

    move-result v1

    if-gtz v1, :cond_0

    goto/16 :goto_3

    .line 308
    :cond_0
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 310
    const/4 v2, 0x0

    :try_start_1
    const-string v3, "report_host_new"

    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v3

    .line 311
    if-eqz v3, :cond_2

    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v4

    if-lez v4, :cond_2

    .line 312
    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v4

    .line 313
    move v5, v2

    :goto_0
    if-ge v5, v4, :cond_2

    .line 314
    invoke-virtual {v3, v5}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 315
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_1

    const/16 v7, 0x2e

    invoke-virtual {v6, v7}, Ljava/lang/String;->indexOf(I)I

    move-result v7

    if-lez v7, :cond_1

    .line 316
    invoke-interface {v1, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 313
    :cond_1
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 321
    :cond_2
    goto :goto_1

    .line 320
    :catch_0
    move-exception v3

    .line 322
    :goto_1
    :try_start_2
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_3

    .line 323
    iput-object v1, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mReportUrlList:Ljava/util/List;

    goto :goto_2

    .line 325
    :cond_3
    iput-object v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mReportUrlList:Ljava/util/List;

    .line 327
    :goto_2
    const-string v0, "fetch_setting_interval"

    const-wide/16 v3, 0x4b0

    invoke-virtual {p1, v0, v3, v4}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v0

    iput-wide v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mFetchSettingInterval:J

    .line 328
    const-string v0, "polling_interval"

    const/16 v1, 0x78

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mReportInterval:I

    .line 329
    const-string v0, "once_max_count"

    const/16 v1, 0x64

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mReportCount:I

    .line 330
    const-string v0, "max_retry_count"

    const/4 v1, 0x4

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mReportFailRepeatCount:I

    .line 331
    const-string v0, "report_fail_base_time"

    const/16 v1, 0xf

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mReportFailBaseTime:I

    .line 333
    const-string v0, "log_send_switch"

    const/4 v1, 0x1

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mLogSendSwitch:I

    .line 334
    const-string v0, "more_channel_stop_interval"

    const-wide/16 v3, 0x708

    invoke-virtual {p1, v0, v3, v4}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v3

    iput-wide v3, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mStopMoreChannelInterval:J

    .line 335
    const-string v0, "log_remvove_switch"

    invoke-virtual {p1, v0, v2}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mLogRemoveSwitch:Z

    .line 338
    const-string v0, "allow_service_name"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    iput-object v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mAllowService:Lorg/json/JSONObject;

    .line 340
    const-string v0, "monitor_encrypt_switch"

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mIsEncrypt:Z

    .line 341
    const-string v0, "monitor_log_max_save_count"

    const-wide/32 v1, 0x9c40

    invoke-virtual {p1, v0, v1, v2}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v0

    iput-wide v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mMonitorMaxRowCount:J

    .line 343
    iget-object p1, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mMonitorManager:Lcom/bytedance/frameworks/core/monitor/MonitorManager;

    if-eqz p1, :cond_4

    .line 344
    iget-object p1, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mMonitorManager:Lcom/bytedance/frameworks/core/monitor/MonitorManager;

    invoke-virtual {p1}, Lcom/bytedance/frameworks/core/monitor/MonitorManager;->updateConfig()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 346
    :cond_4
    monitor-exit p0

    return-void

    .line 303
    :catchall_0
    move-exception p1

    goto :goto_4

    .line 305
    :cond_5
    :goto_3
    :try_start_3
    iput-object v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mReportUrlList:Ljava/util/List;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 306
    monitor-exit p0

    return-void

    .line 303
    :goto_4
    monitor-exit p0

    throw p1
.end method

.method updateConfigFromNet(Z)V
    .locals 4
    .annotation build Landroid/support/annotation/VisibleForTesting;
    .end annotation

    .line 236
    iget-wide v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mFetchSettingInterval:J

    const-wide/16 v2, 0x258

    cmp-long v0, v0, v2

    if-gez v0, :cond_0

    .line 237
    iput-wide v2, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mFetchSettingInterval:J

    .line 239
    :cond_0
    if-nez p1, :cond_1

    invoke-direct {p0}, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->needUpdateConfigFromNet()Z

    move-result p1

    if-eqz p1, :cond_2

    :cond_1
    iget-object p1, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mContext:Landroid/content/Context;

    invoke-static {p1}, Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil;->isNetworkAvailable(Landroid/content/Context;)Z

    move-result p1

    if-eqz p1, :cond_2

    .line 240
    const-class p1, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;

    monitor-enter p1

    .line 241
    :try_start_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->mLastFetchSettingTime:J

    .line 242
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 244
    :try_start_1
    invoke-static {}, Lcom/bytedance/frameworks/core/thread/TTExecutor;->getTTExecutor()Lcom/bytedance/frameworks/core/thread/TTExecutor;

    move-result-object p1

    new-instance v0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor$2;

    invoke-direct {v0, p0}, Lbytedance/framwork/core/sdkmonitor/SDKMonitor$2;-><init>(Lbytedance/framwork/core/sdkmonitor/SDKMonitor;)V

    invoke-virtual {p1, v0}, Lcom/bytedance/frameworks/core/thread/TTExecutor;->executeApiTask(Lcom/bytedance/frameworks/core/thread/TTRunnable;)V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0

    .line 274
    goto :goto_0

    .line 272
    :catch_0
    move-exception p1

    goto :goto_0

    .line 242
    :catchall_0
    move-exception v0

    :try_start_2
    monitor-exit p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0

    .line 276
    :cond_2
    :goto_0
    return-void
.end method
