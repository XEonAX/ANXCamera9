.class public Lcom/ss/android/ttve/monitor/BaseMonitor;
.super Ljava/lang/Object;
.source "BaseMonitor.java"


# static fields
.field private static final TAG:Ljava/lang/String;

.field public static sMonitor:Lcom/ss/android/ttve/monitor/IMonitor;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 21
    const-class v0, Lcom/ss/android/ttve/monitor/BaseMonitor;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/ss/android/ttve/monitor/BaseMonitor;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static monitorVELog(Lcom/ss/android/ttve/monitor/IMonitor;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)Z
    .locals 5

    .line 57
    const/4 v0, 0x0

    if-nez p0, :cond_0

    .line 58
    sget-object p0, Lcom/ss/android/ttve/monitor/BaseMonitor;->TAG:Ljava/lang/String;

    const-string p1, "No monitor callback, return"

    invoke-static {p0, p1}, Lcom/ss/android/ttve/common/TELogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 59
    return v0

    .line 62
    :cond_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 64
    :try_start_0
    invoke-interface {p3}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    .line 65
    check-cast v3, Ljava/lang/String;

    .line 66
    invoke-interface {p3, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 67
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 68
    const-string v3, "service"

    invoke-virtual {v1, v3, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 70
    :cond_1
    goto :goto_0

    .line 74
    :cond_2
    nop

    .line 75
    if-eqz p0, :cond_3

    .line 76
    invoke-interface {p0, p1, v1}, Lcom/ss/android/ttve/monitor/IMonitor;->monitorLog(Ljava/lang/String;Lorg/json/JSONObject;)V

    .line 78
    :cond_3
    const/4 p0, 0x1

    return p0

    .line 71
    :catch_0
    move-exception p0

    .line 72
    sget-object p0, Lcom/ss/android/ttve/monitor/BaseMonitor;->TAG:Ljava/lang/String;

    const-string p1, "No monitor callback, skip"

    invoke-static {p0, p1}, Lcom/ss/android/ttve/common/TELogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 73
    return v0
.end method

.method public static monitorVELog(Ljava/lang/String;Ljava/lang/String;F)Z
    .locals 0

    .line 43
    invoke-static {p2}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    move-result-object p2

    invoke-static {p0, p1, p2}, Lcom/ss/android/ttve/monitor/BaseMonitor;->monitorVELog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method public static monitorVELog(Ljava/lang/String;Ljava/lang/String;J)Z
    .locals 0

    .line 39
    invoke-static {p2, p3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p2

    invoke-static {p0, p1, p2}, Lcom/ss/android/ttve/monitor/BaseMonitor;->monitorVELog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method public static monitorVELog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1

    .line 47
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 48
    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 49
    invoke-static {p0, p1, v0}, Lcom/ss/android/ttve/monitor/BaseMonitor;->monitorVELog(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)Z

    move-result p0

    return p0
.end method

.method public static monitorVELog(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)Z
    .locals 1

    .line 53
    sget-object v0, Lcom/ss/android/ttve/monitor/BaseMonitor;->sMonitor:Lcom/ss/android/ttve/monitor/IMonitor;

    invoke-static {v0, p0, p1, p2}, Lcom/ss/android/ttve/monitor/BaseMonitor;->monitorVELog(Lcom/ss/android/ttve/monitor/IMonitor;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)Z

    move-result p0

    return p0
.end method

.method public static register(Lcom/ss/android/ttve/monitor/IMonitor;)V
    .locals 0

    .line 25
    sput-object p0, Lcom/ss/android/ttve/monitor/BaseMonitor;->sMonitor:Lcom/ss/android/ttve/monitor/IMonitor;

    .line 26
    return-void
.end method

.method public static unRegister()V
    .locals 1

    .line 29
    const/4 v0, 0x0

    sput-object v0, Lcom/ss/android/ttve/monitor/BaseMonitor;->sMonitor:Lcom/ss/android/ttve/monitor/IMonitor;

    .line 30
    return-void
.end method
