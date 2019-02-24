.class public interface abstract Lcom/bytedance/frameworks/baselib/log/LogHandler$IConfig;
.super Ljava/lang/Object;
.source "LogHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bytedance/frameworks/baselib/log/LogHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "IConfig"
.end annotation


# virtual methods
.method public abstract getChannels()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getLogExpireTime()J
.end method

.method public abstract getLogType()Ljava/lang/String;
.end method

.method public abstract getMaxRetryCount()I
.end method

.method public abstract getRetryInterval()J
.end method
