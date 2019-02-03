.class public Lcom/ss/android/medialib/log/VEMonitor;
.super Ljava/lang/Object;
.source "VEMonitor.java"


# static fields
.field public static MONITOR_ACTION_CANCEL:I = 0x0

.field private static final TAG:Ljava/lang/String; = "VEMonitor"

.field private static sMonitor:Lcom/ss/android/medialib/log/IMonitor;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 15
    const/4 v0, 0x0

    sput v0, Lcom/ss/android/medialib/log/VEMonitor;->MONITOR_ACTION_CANCEL:I

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static clear()V
    .locals 0

    .line 41
    invoke-static {}, Lcom/ss/android/medialib/log/VEMonitorInvoker;->nativeReset()V

    .line 42
    return-void
.end method

.method public static getMap()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 76
    invoke-static {}, Lcom/ss/android/medialib/log/VEMonitorInvoker;->nativeGetMap()Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method private static monitorVELog(Lcom/ss/android/medialib/log/IMonitor;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)Z
    .locals 7

    .line 120
    const/4 v0, 0x0

    if-nez p0, :cond_0

    .line 121
    const-string p0, "VEMonitor"

    const-string p1, "No monitor callback, return"

    invoke-static {p0, p1}, Lcom/ss/android/medialib/common/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 122
    return v0

    .line 125
    :cond_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 127
    :try_start_0
    invoke-interface {p3}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_4

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    .line 128
    check-cast v3, Ljava/lang/String;

    .line 129
    invoke-static {v3}, Lcom/ss/android/medialib/log/VEMonitorKeys;->getType(Ljava/lang/String;)I

    move-result v4

    .line 130
    sget v5, Lcom/ss/android/medialib/log/VEMonitorKeys;->TYPE_INT:I
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_2

    if-ne v4, v5, :cond_1

    .line 132
    :try_start_1
    invoke-interface {p3, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    .line 133
    invoke-virtual {v1, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_2

    .line 136
    :goto_1
    goto :goto_3

    .line 134
    :catch_0
    move-exception v4

    .line 135
    :try_start_2
    const-string v4, "VEMonitor"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Parse int error:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {p3, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v4, v3}, Lcom/ss/android/medialib/common/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 138
    :cond_1
    sget v5, Lcom/ss/android/medialib/log/VEMonitorKeys;->TYPE_DOUBLE:I
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_2

    if-ne v4, v5, :cond_2

    .line 140
    :try_start_3
    invoke-interface {p3, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-static {v4}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v4

    .line 141
    float-to-double v4, v4

    invoke-virtual {v1, v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_2

    .line 144
    :goto_2
    goto :goto_3

    .line 142
    :catch_1
    move-exception v3

    .line 143
    :try_start_4
    const-string v3, "VEMonitor"

    const-string v4, "Parse float error"

    invoke-static {v3, v4}, Lcom/ss/android/medialib/common/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    .line 147
    :cond_2
    invoke-interface {p3, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 150
    :goto_3
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_3

    .line 151
    const-string v3, "service"

    invoke-virtual {v1, v3, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_4
    .catch Lorg/json/JSONException; {:try_start_4 .. :try_end_4} :catch_2

    .line 153
    :cond_3
    goto :goto_0

    .line 157
    :cond_4
    nop

    .line 158
    if-eqz p0, :cond_5

    .line 159
    invoke-interface {p0, p1, v1}, Lcom/ss/android/medialib/log/IMonitor;->monitorLog(Ljava/lang/String;Lorg/json/JSONObject;)V

    .line 161
    :cond_5
    const/4 p0, 0x1

    return p0

    .line 154
    :catch_2
    move-exception p0

    .line 155
    const-string p0, "VEMonitor"

    const-string p1, "No monitor callback, skip"

    invoke-static {p0, p1}, Lcom/ss/android/medialib/common/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 156
    return v0
.end method

.method public static monitorVELog(Ljava/lang/String;Ljava/lang/String;F)Z
    .locals 1

    .line 86
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 87
    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p2

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 88
    invoke-static {p0, p1, v0}, Lcom/ss/android/medialib/log/VEMonitor;->monitorVELog(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)Z

    move-result p0

    return p0
.end method

.method public static monitorVELog(Ljava/lang/String;Ljava/lang/String;J)Z
    .locals 1

    .line 80
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 81
    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p2

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 82
    invoke-static {p0, p1, v0}, Lcom/ss/android/medialib/log/VEMonitor;->monitorVELog(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)Z

    move-result p0

    return p0
.end method

.method public static monitorVELog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1

    .line 92
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 93
    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 94
    invoke-static {p0, p1, v0}, Lcom/ss/android/medialib/log/VEMonitor;->monitorVELog(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)Z

    move-result p0

    return p0
.end method

.method public static monitorVELog(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)Z
    .locals 1

    .line 98
    sget-object v0, Lcom/ss/android/medialib/log/VEMonitor;->sMonitor:Lcom/ss/android/medialib/log/IMonitor;

    invoke-static {v0, p0, p1, p2}, Lcom/ss/android/medialib/log/VEMonitor;->monitorVELog(Lcom/ss/android/medialib/log/IMonitor;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)Z

    move-result p0

    return p0
.end method

.method public static monitorVELogJson(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 102
    sget-object v0, Lcom/ss/android/medialib/log/VEMonitor;->sMonitor:Lcom/ss/android/medialib/log/IMonitor;

    if-nez v0, :cond_0

    .line 103
    const-string p0, "VEMonitor"

    const-string p1, "No monitor callback, return"

    invoke-static {p0, p1}, Lcom/ss/android/medialib/common/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 104
    return-void

    .line 106
    :cond_0
    const/4 v0, 0x0

    .line 108
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_1

    .line 109
    :try_start_1
    const-string p2, "service"

    invoke-virtual {v1, p2, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    .line 112
    goto :goto_1

    .line 110
    :catch_0
    move-exception p1

    goto :goto_0

    :catch_1
    move-exception p1

    move-object v1, v0

    .line 111
    :goto_0
    invoke-virtual {p1}, Lorg/json/JSONException;->printStackTrace()V

    .line 113
    :goto_1
    sget-object p1, Lcom/ss/android/medialib/log/VEMonitor;->sMonitor:Lcom/ss/android/medialib/log/IMonitor;

    invoke-interface {p1, p0, v1}, Lcom/ss/android/medialib/log/IMonitor;->monitorLog(Ljava/lang/String;Lorg/json/JSONObject;)V

    .line 114
    return-void
.end method

.method public static perfLong(Ljava/lang/String;J)V
    .locals 1

    .line 50
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 51
    const-string p0, "VEMonitor"

    const-string p1, "perfLong: key is null"

    invoke-static {p0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 52
    return-void

    .line 54
    :cond_0
    invoke-static {p0, p1, p2}, Lcom/ss/android/medialib/log/VEMonitorInvoker;->nativePerfLong(Ljava/lang/String;J)V

    .line 55
    return-void
.end method

.method public static perfRational(Ljava/lang/String;FF)V
    .locals 1

    .line 65
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 66
    const-string p0, "VEMonitor"

    const-string p1, "perfLong: key is null"

    invoke-static {p0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 67
    return-void

    .line 69
    :cond_0
    invoke-static {p0, p1, p2}, Lcom/ss/android/medialib/log/VEMonitorInvoker;->nativePerfRational(Ljava/lang/String;FF)V

    .line 70
    return-void
.end method

.method public static register(Lcom/ss/android/medialib/log/IMonitor;)V
    .locals 0

    .line 33
    invoke-static {}, Lcom/ss/android/medialib/log/VEMonitorInvoker;->nativeInit()V

    .line 34
    sput-object p0, Lcom/ss/android/medialib/log/VEMonitor;->sMonitor:Lcom/ss/android/medialib/log/IMonitor;

    .line 35
    return-void
.end method

.method public static report(I)V
    .locals 0

    .line 29
    invoke-static {p0}, Lcom/ss/android/medialib/log/VEMonitorInvoker;->nativeMonitorPerf(I)V

    .line 30
    return-void
.end method
