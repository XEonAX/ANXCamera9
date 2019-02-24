.class public Lcom/bytedance/frameworks/core/monitor/net/MonitorLogSender;
.super Ljava/lang/Object;
.source "MonitorLogSender.java"


# static fields
.field private static mapAidSendLog:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap<",
            "Ljava/lang/String;",
            "Lcom/bytedance/frameworks/core/monitor/net/ISendLog;",
            ">;"
        }
    .end annotation
.end field

.field private static mapTypeLogSendImpl:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap<",
            "Ljava/lang/String;",
            "Lcom/bytedance/frameworks/core/monitor/net/ILogSendImpl;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 18
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    sput-object v0, Lcom/bytedance/frameworks/core/monitor/net/MonitorLogSender;->mapTypeLogSendImpl:Ljava/util/concurrent/ConcurrentHashMap;

    .line 19
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    sput-object v0, Lcom/bytedance/frameworks/core/monitor/net/MonitorLogSender;->mapAidSendLog:Ljava/util/concurrent/ConcurrentHashMap;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getISendLog(Ljava/lang/String;)Lcom/bytedance/frameworks/core/monitor/net/ISendLog;
    .locals 1

    .line 30
    sget-object v0, Lcom/bytedance/frameworks/core/monitor/net/MonitorLogSender;->mapAidSendLog:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0, p0}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/bytedance/frameworks/core/monitor/net/ISendLog;

    return-object p0
.end method

.method public static send(Ljava/lang/String;)Z
    .locals 2

    .line 78
    const-string v0, "default"

    const-string v1, "monitor"

    invoke-static {v0, v1, p0}, Lcom/bytedance/frameworks/core/monitor/net/MonitorLogSender;->send(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method public static send(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1

    .line 74
    const-string v0, "default"

    invoke-static {v0, p0, p1}, Lcom/bytedance/frameworks/core/monitor/net/MonitorLogSender;->send(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method public static send(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 3

    .line 58
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_2

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 61
    :cond_0
    sget-object v0, Lcom/bytedance/frameworks/core/monitor/net/MonitorLogSender;->mapTypeLogSendImpl:Ljava/util/concurrent/ConcurrentHashMap;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/bytedance/frameworks/core/monitor/net/ILogSendImpl;

    .line 62
    invoke-interface {p0}, Lcom/bytedance/frameworks/core/monitor/net/ILogSendImpl;->logStopCollectSwitch()Z

    move-result p1

    if-eqz p1, :cond_1

    .line 63
    return v1

    .line 65
    :cond_1
    invoke-interface {p0, p2}, Lcom/bytedance/frameworks/core/monitor/net/ILogSendImpl;->send(Ljava/lang/String;)Z

    move-result p0

    return p0

    .line 59
    :cond_2
    :goto_0
    return v1
.end method

.method public static setISendLog(Lcom/bytedance/frameworks/core/monitor/net/ISendLog;)V
    .locals 1

    .line 22
    const-string v0, "default"

    invoke-static {v0, p0}, Lcom/bytedance/frameworks/core/monitor/net/MonitorLogSender;->setISendLog(Ljava/lang/String;Lcom/bytedance/frameworks/core/monitor/net/ISendLog;)V

    .line 23
    return-void
.end method

.method public static setISendLog(Ljava/lang/String;Lcom/bytedance/frameworks/core/monitor/net/ISendLog;)V
    .locals 1

    .line 26
    sget-object v0, Lcom/bytedance/frameworks/core/monitor/net/MonitorLogSender;->mapAidSendLog:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0, p0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 27
    return-void
.end method

.method public static setImpl(Ljava/lang/String;Lcom/bytedance/frameworks/core/monitor/net/ILogSendImpl;)V
    .locals 1

    .line 47
    const-string v0, "default"

    invoke-static {v0, p0, p1}, Lcom/bytedance/frameworks/core/monitor/net/MonitorLogSender;->setImpl(Ljava/lang/String;Ljava/lang/String;Lcom/bytedance/frameworks/core/monitor/net/ILogSendImpl;)V

    .line 48
    return-void
.end method

.method public static setImpl(Ljava/lang/String;Ljava/lang/String;Lcom/bytedance/frameworks/core/monitor/net/ILogSendImpl;)V
    .locals 2

    .line 40
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    if-nez p2, :cond_0

    goto :goto_0

    .line 43
    :cond_0
    sget-object v0, Lcom/bytedance/frameworks/core/monitor/net/MonitorLogSender;->mapTypeLogSendImpl:Ljava/util/concurrent/ConcurrentHashMap;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0, p2}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 44
    return-void

    .line 41
    :cond_1
    :goto_0
    return-void
.end method
