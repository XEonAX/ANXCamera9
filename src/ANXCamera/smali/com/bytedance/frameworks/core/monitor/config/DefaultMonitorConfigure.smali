.class public Lcom/bytedance/frameworks/core/monitor/config/DefaultMonitorConfigure;
.super Ljava/lang/Object;
.source "DefaultMonitorConfigure.java"

# interfaces
.implements Lcom/bytedance/frameworks/core/monitor/config/IMonitorConfigure;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getMonitorLogMaxSaveCount()J
    .locals 2

    .line 77
    const-wide/32 v0, 0x9c40

    return-wide v0
.end method

.method public getRemoveSwitch()Z
    .locals 1

    .line 51
    const/4 v0, 0x0

    return v0
.end method

.method public getReportTypeByUploadType(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 72
    const/4 p1, 0x0

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

    .line 62
    const/4 v0, 0x0

    return-object v0
.end method

.method public getUploadTypeByReportType(Ljava/lang/String;)Ljava/util/List;
    .locals 0
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

    .line 67
    const/4 p1, 0x0

    return-object p1
.end method

.method public isLogSendSwitch()Z
    .locals 1

    .line 56
    const/4 v0, 0x1

    return v0
.end method

.method public reportCount()I
    .locals 1

    .line 21
    const/16 v0, 0x64

    return v0
.end method

.method public reportFailRepeatBaseTime()I
    .locals 1

    .line 41
    const/16 v0, 0xf

    return v0
.end method

.method public reportFailRepeatCount()I
    .locals 1

    .line 36
    const/4 v0, 0x4

    return v0
.end method

.method public reportInterval()I
    .locals 1

    .line 16
    const/16 v0, 0x78

    return v0
.end method

.method public reportJsonHeaderInfo()Lorg/json/JSONObject;
    .locals 1

    .line 31
    const/4 v0, 0x0

    return-object v0
.end method

.method public reportUrl(Ljava/lang/String;)Ljava/util/List;
    .locals 0
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

    .line 26
    const/4 p1, 0x0

    return-object p1
.end method

.method public stopMoreChannelInterval()J
    .locals 2

    .line 46
    const-wide/32 v0, 0x927c0

    return-wide v0
.end method
