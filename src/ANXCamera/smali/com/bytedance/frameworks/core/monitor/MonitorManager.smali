.class public Lcom/bytedance/frameworks/core/monitor/MonitorManager;
.super Ljava/lang/Object;
.source "MonitorManager.java"

# interfaces
.implements Lcom/bytedance/frameworks/core/monitor/LogTaskManager$IInactiveMonitor;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bytedance/frameworks/core/monitor/MonitorManager$IHandleOnTimerEvent;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "MonitorManager"


# instance fields
.field private mLogTaskManager:Lcom/bytedance/frameworks/core/monitor/LogTaskManager;

.field private sIHandleOnTimeEvent:Lcom/bytedance/frameworks/core/monitor/MonitorManager$IHandleOnTimerEvent;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/bytedance/frameworks/core/monitor/MonitorManager$IHandleOnTimerEvent;)V
    .locals 1

    .line 34
    const-string v0, "default"

    invoke-direct {p0, p1, p2, v0}, Lcom/bytedance/frameworks/core/monitor/MonitorManager;-><init>(Landroid/content/Context;Lcom/bytedance/frameworks/core/monitor/MonitorManager$IHandleOnTimerEvent;Ljava/lang/String;)V

    .line 35
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/bytedance/frameworks/core/monitor/MonitorManager$IHandleOnTimerEvent;Ljava/lang/String;)V
    .locals 1

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    if-nez p3, :cond_0

    const-string p3, "default"

    .line 39
    :cond_0
    new-instance v0, Lcom/bytedance/frameworks/core/monitor/LogTaskManager;

    invoke-direct {v0, p1, p3}, Lcom/bytedance/frameworks/core/monitor/LogTaskManager;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorManager;->mLogTaskManager:Lcom/bytedance/frameworks/core/monitor/LogTaskManager;

    .line 40
    iput-object p2, p0, Lcom/bytedance/frameworks/core/monitor/MonitorManager;->sIHandleOnTimeEvent:Lcom/bytedance/frameworks/core/monitor/MonitorManager$IHandleOnTimerEvent;

    .line 41
    iget-object p1, p0, Lcom/bytedance/frameworks/core/monitor/MonitorManager;->sIHandleOnTimeEvent:Lcom/bytedance/frameworks/core/monitor/MonitorManager$IHandleOnTimerEvent;

    if-eqz p1, :cond_1

    .line 42
    iget-object p1, p0, Lcom/bytedance/frameworks/core/monitor/MonitorManager;->mLogTaskManager:Lcom/bytedance/frameworks/core/monitor/LogTaskManager;

    invoke-virtual {p1, p0}, Lcom/bytedance/frameworks/core/monitor/LogTaskManager;->registerInactiveMonitor(Lcom/bytedance/frameworks/core/monitor/LogTaskManager$IInactiveMonitor;)V

    .line 44
    :cond_1
    return-void
.end method


# virtual methods
.method public cleanExpiredLog(J)V
    .locals 1

    .line 178
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorManager;->mLogTaskManager:Lcom/bytedance/frameworks/core/monitor/LogTaskManager;

    if-nez v0, :cond_0

    .line 179
    return-void

    .line 181
    :cond_0
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorManager;->mLogTaskManager:Lcom/bytedance/frameworks/core/monitor/LogTaskManager;

    invoke-virtual {v0, p1, p2}, Lcom/bytedance/frameworks/core/monitor/LogTaskManager;->cleanExpiredLog(J)V

    .line 182
    return-void
.end method

.method public directOnCount(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;FZ)V
    .locals 7

    .line 124
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorManager;->mLogTaskManager:Lcom/bytedance/frameworks/core/monitor/LogTaskManager;

    if-eqz v0, :cond_1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 126
    :cond_0
    iget-object v1, p0, Lcom/bytedance/frameworks/core/monitor/MonitorManager;->mLogTaskManager:Lcom/bytedance/frameworks/core/monitor/LogTaskManager;

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move v5, p4

    move v6, p5

    invoke-virtual/range {v1 .. v6}, Lcom/bytedance/frameworks/core/monitor/LogTaskManager;->handleDirectCount(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;FZ)V

    .line 127
    return-void

    .line 125
    :cond_1
    :goto_0
    return-void
.end method

.method public directOnTimer(Ljava/lang/String;Ljava/lang/String;FZ)V
    .locals 1

    .line 137
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorManager;->mLogTaskManager:Lcom/bytedance/frameworks/core/monitor/LogTaskManager;

    if-eqz v0, :cond_1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 139
    :cond_0
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorManager;->mLogTaskManager:Lcom/bytedance/frameworks/core/monitor/LogTaskManager;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/bytedance/frameworks/core/monitor/LogTaskManager;->handleDirectTimer(Ljava/lang/String;Ljava/lang/String;FZ)V

    .line 140
    return-void

    .line 138
    :cond_1
    :goto_0
    return-void
.end method

.method public flushBuffer2DB()V
    .locals 1

    .line 209
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorManager;->mLogTaskManager:Lcom/bytedance/frameworks/core/monitor/LogTaskManager;

    if-nez v0, :cond_0

    .line 210
    return-void

    .line 212
    :cond_0
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorManager;->mLogTaskManager:Lcom/bytedance/frameworks/core/monitor/LogTaskManager;

    invoke-virtual {v0}, Lcom/bytedance/frameworks/core/monitor/LogTaskManager;->flushBuffer2DB()V

    .line 213
    return-void
.end method

.method public handleEvent()V
    .locals 1

    .line 21
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorManager;->sIHandleOnTimeEvent:Lcom/bytedance/frameworks/core/monitor/MonitorManager$IHandleOnTimerEvent;

    if-nez v0, :cond_0

    .line 22
    return-void

    .line 23
    :cond_0
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorManager;->sIHandleOnTimeEvent:Lcom/bytedance/frameworks/core/monitor/MonitorManager$IHandleOnTimerEvent;

    invoke-interface {v0}, Lcom/bytedance/frameworks/core/monitor/MonitorManager$IHandleOnTimerEvent;->handleEvent()V

    .line 24
    return-void
.end method

.method public logSend(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 6

    .line 153
    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    invoke-virtual/range {v0 .. v5}, Lcom/bytedance/frameworks/core/monitor/MonitorManager;->logSend(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZ)V

    .line 154
    return-void
.end method

.method public logSend(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZ)V
    .locals 7

    .line 157
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorManager;->mLogTaskManager:Lcom/bytedance/frameworks/core/monitor/LogTaskManager;

    if-eqz v0, :cond_1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 160
    :cond_0
    iget-object v1, p0, Lcom/bytedance/frameworks/core/monitor/MonitorManager;->mLogTaskManager:Lcom/bytedance/frameworks/core/monitor/LogTaskManager;

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move v5, p4

    move v6, p5

    invoke-virtual/range {v1 .. v6}, Lcom/bytedance/frameworks/core/monitor/LogTaskManager;->logSend(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZ)V

    .line 161
    return-void

    .line 158
    :cond_1
    :goto_0
    return-void
.end method

.method public logSend(Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 0

    .line 149
    invoke-virtual {p0, p1, p1, p2, p3}, Lcom/bytedance/frameworks/core/monitor/MonitorManager;->logSend(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 150
    return-void
.end method

.method public onCount(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;FZ)V
    .locals 7

    .line 76
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorManager;->mLogTaskManager:Lcom/bytedance/frameworks/core/monitor/LogTaskManager;

    if-eqz v0, :cond_1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 78
    :cond_0
    iget-object v1, p0, Lcom/bytedance/frameworks/core/monitor/MonitorManager;->mLogTaskManager:Lcom/bytedance/frameworks/core/monitor/LogTaskManager;

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move v5, p4

    move v6, p5

    invoke-virtual/range {v1 .. v6}, Lcom/bytedance/frameworks/core/monitor/LogTaskManager;->handleCount(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;FZ)V

    .line 79
    return-void

    .line 77
    :cond_1
    :goto_0
    return-void
.end method

.method public onCount(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 6

    .line 65
    const/high16 v4, 0x3f800000    # 1.0f

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v5, p4

    invoke-virtual/range {v0 .. v5}, Lcom/bytedance/frameworks/core/monitor/MonitorManager;->onCount(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;FZ)V

    .line 66
    return-void
.end method

.method public onDebug(Ljava/lang/String;)V
    .locals 1

    .line 100
    const-string v0, ""

    invoke-virtual {p0, p1, v0}, Lcom/bytedance/frameworks/core/monitor/MonitorManager;->onDebug(Ljava/lang/String;Ljava/lang/String;)V

    .line 101
    return-void
.end method

.method public onDebug(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 110
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorManager;->mLogTaskManager:Lcom/bytedance/frameworks/core/monitor/LogTaskManager;

    if-eqz v0, :cond_1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 112
    :cond_0
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorManager;->mLogTaskManager:Lcom/bytedance/frameworks/core/monitor/LogTaskManager;

    invoke-virtual {v0, p1, p2}, Lcom/bytedance/frameworks/core/monitor/LogTaskManager;->handleDebug(Ljava/lang/String;Ljava/lang/String;)V

    .line 113
    return-void

    .line 111
    :cond_1
    :goto_0
    return-void
.end method

.method public onTimer(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;FZ)V
    .locals 7

    .line 89
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorManager;->mLogTaskManager:Lcom/bytedance/frameworks/core/monitor/LogTaskManager;

    if-eqz v0, :cond_1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 91
    :cond_0
    iget-object v1, p0, Lcom/bytedance/frameworks/core/monitor/MonitorManager;->mLogTaskManager:Lcom/bytedance/frameworks/core/monitor/LogTaskManager;

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move v5, p4

    move v6, p5

    invoke-virtual/range {v1 .. v6}, Lcom/bytedance/frameworks/core/monitor/LogTaskManager;->handleTimer(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;FZ)V

    .line 92
    return-void

    .line 90
    :cond_1
    :goto_0
    return-void
.end method

.method public reportLogCountDaily(Z)V
    .locals 1

    .line 171
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorManager;->mLogTaskManager:Lcom/bytedance/frameworks/core/monitor/LogTaskManager;

    if-nez v0, :cond_0

    .line 172
    return-void

    .line 174
    :cond_0
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorManager;->mLogTaskManager:Lcom/bytedance/frameworks/core/monitor/LogTaskManager;

    invoke-virtual {v0, p1}, Lcom/bytedance/frameworks/core/monitor/LogTaskManager;->reportLogCountDaily(Z)V

    .line 175
    return-void
.end method

.method public setCurrentVersionInfo(Lcom/bytedance/frameworks/core/monitor/model/LocalVersionInfo;)V
    .locals 1

    .line 52
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorManager;->mLogTaskManager:Lcom/bytedance/frameworks/core/monitor/LogTaskManager;

    if-nez v0, :cond_0

    .line 53
    return-void

    .line 55
    :cond_0
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorManager;->mLogTaskManager:Lcom/bytedance/frameworks/core/monitor/LogTaskManager;

    invoke-virtual {v0, p1}, Lcom/bytedance/frameworks/core/monitor/LogTaskManager;->initCurrentVersionInfo(Lcom/bytedance/frameworks/core/monitor/model/LocalVersionInfo;)V

    .line 56
    return-void
.end method

.method public setReportLogSwitch(Z)V
    .locals 1

    .line 202
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorManager;->mLogTaskManager:Lcom/bytedance/frameworks/core/monitor/LogTaskManager;

    if-nez v0, :cond_0

    .line 203
    return-void

    .line 205
    :cond_0
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorManager;->mLogTaskManager:Lcom/bytedance/frameworks/core/monitor/LogTaskManager;

    invoke-virtual {v0, p1}, Lcom/bytedance/frameworks/core/monitor/LogTaskManager;->setReportLogSwitch(Z)V

    .line 206
    return-void
.end method

.method public stopMonitor()V
    .locals 1

    .line 195
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorManager;->mLogTaskManager:Lcom/bytedance/frameworks/core/monitor/LogTaskManager;

    if-nez v0, :cond_0

    .line 196
    return-void

    .line 198
    :cond_0
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorManager;->mLogTaskManager:Lcom/bytedance/frameworks/core/monitor/LogTaskManager;

    invoke-virtual {v0}, Lcom/bytedance/frameworks/core/monitor/LogTaskManager;->quit()V

    .line 199
    return-void
.end method

.method public updateConfig()V
    .locals 1

    .line 188
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorManager;->mLogTaskManager:Lcom/bytedance/frameworks/core/monitor/LogTaskManager;

    if-nez v0, :cond_0

    .line 189
    return-void

    .line 191
    :cond_0
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorManager;->mLogTaskManager:Lcom/bytedance/frameworks/core/monitor/LogTaskManager;

    invoke-virtual {v0}, Lcom/bytedance/frameworks/core/monitor/LogTaskManager;->handleUpdateConfig()V

    .line 192
    return-void
.end method

.method public uploadLegacyLog(Lcom/bytedance/frameworks/core/monitor/model/UploadLogLegacyCommand;)V
    .locals 1

    .line 164
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorManager;->mLogTaskManager:Lcom/bytedance/frameworks/core/monitor/LogTaskManager;

    if-nez v0, :cond_0

    .line 165
    return-void

    .line 167
    :cond_0
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/MonitorManager;->mLogTaskManager:Lcom/bytedance/frameworks/core/monitor/LogTaskManager;

    invoke-virtual {v0, p1}, Lcom/bytedance/frameworks/core/monitor/LogTaskManager;->uploadLogLegacy(Lcom/bytedance/frameworks/core/monitor/model/UploadLogLegacyCommand;)V

    .line 168
    return-void
.end method
