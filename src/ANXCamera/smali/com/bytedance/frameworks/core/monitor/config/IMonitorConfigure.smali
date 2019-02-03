.class public interface abstract Lcom/bytedance/frameworks/core/monitor/config/IMonitorConfigure;
.super Ljava/lang/Object;
.source "IMonitorConfigure.java"


# virtual methods
.method public abstract getMonitorLogMaxSaveCount()J
.end method

.method public abstract getRemoveSwitch()Z
.end method

.method public abstract getReportTypeByUploadType(Ljava/lang/String;)Ljava/lang/String;
.end method

.method public abstract getReportTypeList()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getUploadTypeByReportType(Ljava/lang/String;)Ljava/util/List;
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
.end method

.method public abstract isLogSendSwitch()Z
.end method

.method public abstract reportCount()I
.end method

.method public abstract reportFailRepeatBaseTime()I
.end method

.method public abstract reportFailRepeatCount()I
.end method

.method public abstract reportInterval()I
.end method

.method public abstract reportJsonHeaderInfo()Lorg/json/JSONObject;
.end method

.method public abstract reportUrl(Ljava/lang/String;)Ljava/util/List;
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
.end method

.method public abstract stopMoreChannelInterval()J
.end method
