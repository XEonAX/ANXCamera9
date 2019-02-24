.class public abstract Lcom/bytedance/frameworks/baselib/log/LogHandler;
.super Ljava/lang/Object;
.source "LogHandler.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bytedance/frameworks/baselib/log/LogHandler$BaseConfig;,
        Lcom/bytedance/frameworks/baselib/log/LogHandler$IResponseConfig;,
        Lcom/bytedance/frameworks/baselib/log/LogHandler$IConfig;
    }
.end annotation


# instance fields
.field protected mConfig:Lcom/bytedance/frameworks/baselib/log/LogHandler$IConfig;

.field private mLastStopTime:J

.field private mLastSuccessChannel:Ljava/lang/String;

.field protected mLogQueue:Lcom/bytedance/frameworks/baselib/log/LogQueue;

.field private mResponseConfig:Lcom/bytedance/frameworks/baselib/log/LogHandler$IResponseConfig;

.field private mStopMoreChannelInterval:J

.field protected mType:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/bytedance/frameworks/baselib/log/LogHandler$IConfig;)V
    .locals 1

    .line 105
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 106
    iput-object p2, p0, Lcom/bytedance/frameworks/baselib/log/LogHandler;->mConfig:Lcom/bytedance/frameworks/baselib/log/LogHandler$IConfig;

    .line 107
    iget-object v0, p0, Lcom/bytedance/frameworks/baselib/log/LogHandler;->mConfig:Lcom/bytedance/frameworks/baselib/log/LogHandler$IConfig;

    if-eqz v0, :cond_1

    .line 110
    invoke-interface {p2}, Lcom/bytedance/frameworks/baselib/log/LogHandler$IConfig;->getLogType()Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lcom/bytedance/frameworks/baselib/log/LogHandler;->mType:Ljava/lang/String;

    .line 111
    iget-object p2, p0, Lcom/bytedance/frameworks/baselib/log/LogHandler;->mType:Ljava/lang/String;

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    if-nez p2, :cond_0

    .line 114
    invoke-static {p1}, Lcom/bytedance/frameworks/baselib/log/LogQueue;->getInstance(Landroid/content/Context;)Lcom/bytedance/frameworks/baselib/log/LogQueue;

    move-result-object p1

    iput-object p1, p0, Lcom/bytedance/frameworks/baselib/log/LogHandler;->mLogQueue:Lcom/bytedance/frameworks/baselib/log/LogQueue;

    .line 115
    iget-object p1, p0, Lcom/bytedance/frameworks/baselib/log/LogHandler;->mLogQueue:Lcom/bytedance/frameworks/baselib/log/LogQueue;

    iget-object p2, p0, Lcom/bytedance/frameworks/baselib/log/LogHandler;->mType:Ljava/lang/String;

    invoke-virtual {p1, p2, p0}, Lcom/bytedance/frameworks/baselib/log/LogQueue;->registerLogHandler(Ljava/lang/String;Lcom/bytedance/frameworks/baselib/log/LogHandler;)V

    .line 116
    return-void

    .line 112
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "type is empty."

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 108
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "config is null."

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/bytedance/frameworks/baselib/log/LogHandler$IConfig;Lcom/bytedance/frameworks/baselib/log/LogHandler$IResponseConfig;)V
    .locals 0

    .line 118
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 119
    iput-object p2, p0, Lcom/bytedance/frameworks/baselib/log/LogHandler;->mConfig:Lcom/bytedance/frameworks/baselib/log/LogHandler$IConfig;

    .line 120
    iput-object p3, p0, Lcom/bytedance/frameworks/baselib/log/LogHandler;->mResponseConfig:Lcom/bytedance/frameworks/baselib/log/LogHandler$IResponseConfig;

    .line 121
    iget-object p3, p0, Lcom/bytedance/frameworks/baselib/log/LogHandler;->mConfig:Lcom/bytedance/frameworks/baselib/log/LogHandler$IConfig;

    if-eqz p3, :cond_2

    .line 124
    iget-object p3, p0, Lcom/bytedance/frameworks/baselib/log/LogHandler;->mResponseConfig:Lcom/bytedance/frameworks/baselib/log/LogHandler$IResponseConfig;

    if-eqz p3, :cond_1

    .line 127
    invoke-interface {p2}, Lcom/bytedance/frameworks/baselib/log/LogHandler$IConfig;->getLogType()Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lcom/bytedance/frameworks/baselib/log/LogHandler;->mType:Ljava/lang/String;

    .line 128
    iget-object p2, p0, Lcom/bytedance/frameworks/baselib/log/LogHandler;->mType:Ljava/lang/String;

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    if-nez p2, :cond_0

    .line 131
    invoke-static {p1}, Lcom/bytedance/frameworks/baselib/log/LogQueue;->getInstance(Landroid/content/Context;)Lcom/bytedance/frameworks/baselib/log/LogQueue;

    move-result-object p1

    iput-object p1, p0, Lcom/bytedance/frameworks/baselib/log/LogHandler;->mLogQueue:Lcom/bytedance/frameworks/baselib/log/LogQueue;

    .line 132
    iget-object p1, p0, Lcom/bytedance/frameworks/baselib/log/LogHandler;->mLogQueue:Lcom/bytedance/frameworks/baselib/log/LogQueue;

    iget-object p2, p0, Lcom/bytedance/frameworks/baselib/log/LogHandler;->mType:Ljava/lang/String;

    invoke-virtual {p1, p2, p0}, Lcom/bytedance/frameworks/baselib/log/LogQueue;->registerLogHandler(Ljava/lang/String;Lcom/bytedance/frameworks/baselib/log/LogHandler;)V

    .line 133
    return-void

    .line 129
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "type is empty."

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 125
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "responseConfig is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 122
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "config is null."

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public enqueue(Ljava/lang/String;)Z
    .locals 0

    .line 141
    invoke-static {p1}, Lcom/bytedance/frameworks/baselib/log/LogLib;->safeGetBytes(Ljava/lang/String;)[B

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/bytedance/frameworks/baselib/log/LogHandler;->enqueue([B)Z

    move-result p1

    return p1
.end method

.method public enqueue([B)Z
    .locals 2

    .line 151
    iget-object v0, p0, Lcom/bytedance/frameworks/baselib/log/LogHandler;->mLogQueue:Lcom/bytedance/frameworks/baselib/log/LogQueue;

    iget-object v1, p0, Lcom/bytedance/frameworks/baselib/log/LogHandler;->mType:Ljava/lang/String;

    invoke-virtual {v0, v1, p1}, Lcom/bytedance/frameworks/baselib/log/LogQueue;->enqueue(Ljava/lang/String;[B)Z

    move-result p1

    return p1
.end method

.method getConfig()Lcom/bytedance/frameworks/baselib/log/LogHandler$IConfig;
    .locals 1

    .line 188
    iget-object v0, p0, Lcom/bytedance/frameworks/baselib/log/LogHandler;->mConfig:Lcom/bytedance/frameworks/baselib/log/LogHandler$IConfig;

    return-object v0
.end method

.method public getLastStopTime()J
    .locals 2

    .line 87
    iget-wide v0, p0, Lcom/bytedance/frameworks/baselib/log/LogHandler;->mLastStopTime:J

    return-wide v0
.end method

.method getLastSuccessChannel()Ljava/lang/String;
    .locals 1

    .line 195
    iget-object v0, p0, Lcom/bytedance/frameworks/baselib/log/LogHandler;->mLastSuccessChannel:Ljava/lang/String;

    return-object v0
.end method

.method getResponseConfig()Lcom/bytedance/frameworks/baselib/log/LogHandler$IResponseConfig;
    .locals 1

    .line 192
    iget-object v0, p0, Lcom/bytedance/frameworks/baselib/log/LogHandler;->mResponseConfig:Lcom/bytedance/frameworks/baselib/log/LogHandler$IResponseConfig;

    return-object v0
.end method

.method public getStopMoreChannelInterval()J
    .locals 2

    .line 95
    iget-wide v0, p0, Lcom/bytedance/frameworks/baselib/log/LogHandler;->mStopMoreChannelInterval:J

    return-wide v0
.end method

.method getType()Ljava/lang/String;
    .locals 1

    .line 179
    iget-object v0, p0, Lcom/bytedance/frameworks/baselib/log/LogHandler;->mType:Ljava/lang/String;

    return-object v0
.end method

.method protected onLogSent([BZ)V
    .locals 0

    .line 174
    return-void
.end method

.method protected abstract send(Ljava/lang/String;[B)Z
.end method

.method public setLastStopTime(J)V
    .locals 0

    .line 91
    iput-wide p1, p0, Lcom/bytedance/frameworks/baselib/log/LogHandler;->mLastStopTime:J

    .line 92
    return-void
.end method

.method setLastSuccessChannel(Ljava/lang/String;)V
    .locals 0

    .line 199
    iput-object p1, p0, Lcom/bytedance/frameworks/baselib/log/LogHandler;->mLastSuccessChannel:Ljava/lang/String;

    .line 200
    return-void
.end method

.method public setStopMoreChannelInterval(J)V
    .locals 0

    .line 99
    iput-wide p1, p0, Lcom/bytedance/frameworks/baselib/log/LogHandler;->mStopMoreChannelInterval:J

    .line 100
    return-void
.end method

.method public updateConfig(Lcom/bytedance/frameworks/baselib/log/LogHandler$IConfig;)V
    .locals 0

    .line 160
    if-nez p1, :cond_0

    .line 161
    return-void

    .line 163
    :cond_0
    iput-object p1, p0, Lcom/bytedance/frameworks/baselib/log/LogHandler;->mConfig:Lcom/bytedance/frameworks/baselib/log/LogHandler$IConfig;

    .line 164
    return-void
.end method
