.class public Lcom/ss/android/ttve/monitor/TEMonitor;
.super Ljava/lang/Object;
.source "TEMonitor.java"


# static fields
.field public static MONITOR_ACTION_CANCEL:I = 0x0

.field public static MONITOR_ACTION_COMPILE:I = 0x0

.field private static final TAG:Ljava/lang/String; = "TEMonitor"

.field private static sMonitor:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/ss/android/ttve/monitor/IMonitor;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 27
    const/4 v0, 0x0

    sput v0, Lcom/ss/android/ttve/monitor/TEMonitor;->MONITOR_ACTION_CANCEL:I

    .line 31
    const/4 v0, 0x1

    sput v0, Lcom/ss/android/ttve/monitor/TEMonitor;->MONITOR_ACTION_COMPILE:I

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lorg/json/JSONObject;)V
    .locals 0

    .line 23
    invoke-static {p0}, Lcom/ss/android/ttve/monitor/TEMonitor;->monitorVELog(Lorg/json/JSONObject;)V

    return-void
.end method

.method public static clear()V
    .locals 0

    .line 76
    invoke-static {}, Lcom/ss/android/ttve/monitor/TEMonitorInvoker;->nativeReset()V

    .line 77
    invoke-static {}, Lcom/ss/android/medialib/log/VEMonitor;->clear()V

    .line 78
    return-void
.end method

.method public static getAppVersion()Ljava/lang/String;
    .locals 1

    .line 141
    invoke-static {}, Lcom/ss/android/ttve/monitor/MonitorUtils;->getAppVersion()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getDeviceId()Ljava/lang/String;
    .locals 1

    .line 130
    invoke-static {}, Lcom/ss/android/ttve/monitor/MonitorUtils;->getDeviceId()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static getIsComplete(Lorg/json/JSONObject;)I
    .locals 3

    .line 335
    const/4 v0, 0x0

    :try_start_0
    const-string v1, "completed"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "completed"

    .line 336
    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result p0
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 342
    move v0, p0

    goto :goto_0

    .line 336
    :cond_0
    nop

    .line 342
    :goto_0
    goto :goto_1

    .line 338
    :catch_0
    move-exception p0

    .line 339
    const-string v1, "TEMonitor"

    const-string v2, "get complete filed error!"

    invoke-static {v1, v2}, Lcom/ss/android/ttve/common/TELogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 340
    nop

    .line 341
    invoke-virtual {p0}, Lorg/json/JSONException;->printStackTrace()V

    .line 343
    :goto_1
    return v0
.end method

.method public static getUserId()Ljava/lang/String;
    .locals 1

    .line 120
    invoke-static {}, Lcom/ss/android/ttve/monitor/MonitorUtils;->getUserId()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static init()V
    .locals 2

    .line 41
    invoke-static {}, Lcom/ss/android/vesdk/runtime/VERuntime;->getInstance()Lcom/ss/android/vesdk/runtime/VERuntime;

    move-result-object v0

    invoke-virtual {v0}, Lcom/ss/android/vesdk/runtime/VERuntime;->getContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, v1, v1, v1}, Lcom/ss/android/ttve/monitor/MonitorUtils;->init(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    invoke-static {}, Lcom/ss/android/ttve/monitor/TEMonitorInvoker;->nativeInit()V

    .line 44
    new-instance v0, Lcom/ss/android/ttve/monitor/TEMonitor$1;

    invoke-direct {v0}, Lcom/ss/android/ttve/monitor/TEMonitor$1;-><init>()V

    invoke-static {v0}, Lcom/ss/android/medialib/log/VEMonitor;->register(Lcom/ss/android/medialib/log/IMonitor;)V

    .line 50
    return-void
.end method

.method public static monitorTELog(Ljava/lang/String;Ljava/lang/String;F)Z
    .locals 1

    .line 241
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 242
    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p2

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 243
    invoke-static {p0, p1, v0}, Lcom/ss/android/ttve/monitor/TEMonitor;->monitorTELog(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)Z

    move-result p0

    return p0
.end method

.method public static monitorTELog(Ljava/lang/String;Ljava/lang/String;J)Z
    .locals 1

    .line 226
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 227
    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p2

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 228
    invoke-static {p0, p1, v0}, Lcom/ss/android/ttve/monitor/TEMonitor;->monitorTELog(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)Z

    move-result p0

    return p0
.end method

.method public static monitorTELog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1

    .line 256
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 257
    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 258
    invoke-static {p0, p1, v0}, Lcom/ss/android/ttve/monitor/TEMonitor;->monitorTELog(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)Z

    move-result p0

    return p0
.end method

.method public static monitorTELog(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)Z
    .locals 1

    .line 270
    sget-object v0, Lcom/ss/android/ttve/monitor/TEMonitor;->sMonitor:Ljava/lang/ref/WeakReference;

    invoke-static {v0, p0, p1, p2}, Lcom/ss/android/ttve/monitor/TEMonitor;->monitorTELog(Ljava/lang/ref/WeakReference;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)Z

    move-result p0

    return p0
.end method

.method private static monitorTELog(Ljava/lang/ref/WeakReference;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/ref/WeakReference<",
            "Lcom/ss/android/ttve/monitor/IMonitor;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Map;",
            ")Z"
        }
    .end annotation

    .line 278
    const/4 v0, 0x0

    if-nez p0, :cond_0

    .line 279
    const-string p0, "TEMonitor"

    const-string p1, "No monitor callback, return"

    invoke-static {p0, p1}, Lcom/ss/android/ttve/common/TELogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 280
    return v0

    .line 284
    :cond_0
    invoke-static {}, Lcom/ss/android/medialib/log/VEMonitor;->getMap()Ljava/util/Map;

    move-result-object v1

    .line 286
    invoke-interface {p3, v1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 288
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 290
    :try_start_0
    invoke-static {p3, v1}, Lcom/ss/android/ttve/monitor/TEMonitor;->putAll(Ljava/util/Map;Lorg/json/JSONObject;)V

    .line 292
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p3

    if-nez p3, :cond_1

    .line 293
    const-string p3, "service"

    invoke-virtual {v1, p3, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 298
    :cond_1
    nop

    .line 301
    invoke-static {p0, p1, v1}, Lcom/ss/android/ttve/monitor/TEMonitor;->reportMonitor(Ljava/lang/ref/WeakReference;Ljava/lang/String;Lorg/json/JSONObject;)V

    .line 303
    const/4 p0, 0x1

    return p0

    .line 295
    :catch_0
    move-exception p0

    .line 296
    const-string p0, "TEMonitor"

    const-string p1, "No monitor callback, skip"

    invoke-static {p0, p1}, Lcom/ss/android/ttve/common/TELogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 297
    return v0
.end method

.method private static monitorVELog(Lorg/json/JSONObject;)V
    .locals 3

    .line 312
    invoke-static {}, Lcom/ss/android/ttve/monitor/TEMonitorInvoker;->nativeGetMap()Ljava/util/Map;

    move-result-object v0

    .line 315
    :try_start_0
    invoke-static {v0, p0}, Lcom/ss/android/ttve/monitor/TEMonitor;->putAll(Ljava/util/Map;Lorg/json/JSONObject;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 319
    goto :goto_0

    .line 316
    :catch_0
    move-exception v0

    .line 317
    const-string v1, "TEMonitor"

    const-string v2, "merge monitor logs error"

    invoke-static {v1, v2}, Lcom/ss/android/ttve/common/TELogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 318
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    .line 321
    :goto_0
    invoke-static {p0}, Lcom/ss/android/ttve/monitor/TEMonitor;->getIsComplete(Lorg/json/JSONObject;)I

    .line 323
    sget-object v0, Lcom/ss/android/ttve/monitor/TEMonitor;->sMonitor:Ljava/lang/ref/WeakReference;

    const-string v1, "sdk_video_edit_compose"

    invoke-static {v0, v1, p0}, Lcom/ss/android/ttve/monitor/TEMonitor;->reportMonitor(Ljava/lang/ref/WeakReference;Ljava/lang/String;Lorg/json/JSONObject;)V

    .line 324
    return-void
.end method

.method public static perfDouble(Ljava/lang/String;D)V
    .locals 1

    .line 177
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 178
    const-string p0, "TEMonitor"

    const-string p1, "perfDouble: key is null"

    invoke-static {p0, p1}, Lcom/ss/android/ttve/common/TELogUtil;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 179
    return-void

    .line 181
    :cond_0
    invoke-static {p0, p1, p2}, Lcom/ss/android/ttve/monitor/TEMonitorInvoker;->nativePerfDouble(Ljava/lang/String;D)V

    .line 182
    return-void
.end method

.method public static perfLong(Ljava/lang/String;J)V
    .locals 1

    .line 162
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 163
    const-string p0, "TEMonitor"

    const-string p1, "perfLong: key is null"

    invoke-static {p0, p1}, Lcom/ss/android/ttve/common/TELogUtil;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 164
    return-void

    .line 166
    :cond_0
    invoke-static {p0, p1, p2}, Lcom/ss/android/ttve/monitor/TEMonitorInvoker;->nativePerfLong(Ljava/lang/String;J)V

    .line 167
    return-void
.end method

.method public static perfRational(Ljava/lang/String;FF)V
    .locals 1

    .line 194
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 195
    const-string p0, "TEMonitor"

    const-string p1, "perfLong: key is null"

    invoke-static {p0, p1}, Lcom/ss/android/ttve/common/TELogUtil;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 196
    return-void

    .line 198
    :cond_0
    invoke-static {p0, p1, p2}, Lcom/ss/android/ttve/monitor/TEMonitorInvoker;->nativePerfRational(Ljava/lang/String;FF)V

    .line 199
    return-void
.end method

.method public static perfString(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 209
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 210
    const-string p0, "TEMonitor"

    const-string p1, "perfString: key is null"

    invoke-static {p0, p1}, Lcom/ss/android/ttve/common/TELogUtil;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 211
    return-void

    .line 213
    :cond_0
    if-nez p1, :cond_1

    const-string p1, ""

    :cond_1
    invoke-static {p0, p1}, Lcom/ss/android/ttve/monitor/TEMonitorInvoker;->nativePerfString(Ljava/lang/String;Ljava/lang/String;)V

    .line 214
    return-void
.end method

.method private static putAll(Ljava/util/Map;Lorg/json/JSONObject;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 388
    invoke-interface {p0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 389
    check-cast v1, Ljava/lang/String;

    .line 391
    const-string v2, "iesve_"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 392
    invoke-static {v1}, Lcom/ss/android/medialib/log/VEMonitorKeys;->getType(Ljava/lang/String;)I

    move-result v2

    goto :goto_1

    .line 394
    :cond_0
    invoke-static {v1}, Lcom/ss/android/ttve/monitor/TEMonitorKeys;->getType(Ljava/lang/String;)I

    move-result v2

    .line 396
    :goto_1
    sget v3, Lcom/ss/android/ttve/monitor/TEMonitorKeys;->TYPE_INT:I

    if-ne v2, v3, :cond_1

    .line 398
    :try_start_0
    invoke-interface {p0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    .line 399
    invoke-virtual {p1, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    .line 400
    :catch_0
    move-exception v2

    .line 401
    const-string v2, "TEMonitor"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Parse int error:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {p0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Lcom/ss/android/ttve/common/TELogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 402
    :goto_2
    goto :goto_4

    .line 404
    :cond_1
    sget v3, Lcom/ss/android/ttve/monitor/TEMonitorKeys;->TYPE_DOUBLE:I

    if-ne v2, v3, :cond_2

    .line 406
    :try_start_1
    invoke-interface {p0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v2

    .line 407
    float-to-double v2, v2

    invoke-virtual {p1, v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_3

    .line 408
    :catch_1
    move-exception v1

    .line 409
    const-string v1, "TEMonitor"

    const-string v2, "Parse float error"

    invoke-static {v1, v2}, Lcom/ss/android/ttve/common/TELogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 410
    :goto_3
    goto :goto_4

    .line 413
    :cond_2
    invoke-interface {p0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p1, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 415
    :goto_4
    goto :goto_0

    .line 416
    :cond_3
    return-void
.end method

.method public static register(Lcom/ss/android/ttve/monitor/IMonitor;)V
    .locals 1

    .line 63
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lcom/ss/android/ttve/monitor/TEMonitor;->sMonitor:Ljava/lang/ref/WeakReference;

    .line 64
    return-void
.end method

.method public static report(I)V
    .locals 0

    .line 59
    invoke-static {p0}, Lcom/ss/android/ttve/monitor/TEMonitorInvoker;->nativeMonitorPerf(I)V

    .line 60
    return-void
.end method

.method private static reportMonitor(Ljava/lang/ref/WeakReference;Ljava/lang/String;Lorg/json/JSONObject;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/ref/WeakReference<",
            "Lcom/ss/android/ttve/monitor/IMonitor;",
            ">;",
            "Ljava/lang/String;",
            "Lorg/json/JSONObject;",
            ")V"
        }
    .end annotation

    .line 358
    nop

    .line 359
    const-string v0, "sdk_video_edit_compose"

    .line 360
    if-eqz p2, :cond_1

    .line 361
    invoke-static {p2}, Lcom/ss/android/ttve/monitor/TEMonitor;->getIsComplete(Lorg/json/JSONObject;)I

    move-result v1

    .line 363
    :try_start_0
    const-string v2, "service"

    invoke-virtual {p2, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 364
    const-string v2, "service"

    invoke-virtual {p2, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 368
    move-object v0, v2

    :cond_0
    goto :goto_0

    .line 366
    :catch_0
    move-exception v2

    .line 367
    invoke-virtual {v2}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0

    .line 371
    :cond_1
    const/4 v1, 0x0

    :goto_0
    invoke-static {v0, v1, p2}, Lcom/ss/android/ttve/monitor/MonitorUtils;->monitorStatusRate(Ljava/lang/String;ILorg/json/JSONObject;)V

    .line 372
    if-eqz p0, :cond_2

    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 375
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/ss/android/ttve/monitor/IMonitor;

    invoke-interface {p0, p1, p2}, Lcom/ss/android/ttve/monitor/IMonitor;->monitorLog(Ljava/lang/String;Lorg/json/JSONObject;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 378
    goto :goto_1

    .line 376
    :catch_1
    move-exception p0

    .line 377
    const-string p1, "TEMonitor"

    const-string p2, "Something happened when monitor log"

    invoke-static {p1, p2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 380
    :cond_2
    :goto_1
    return-void
.end method

.method public static setAppVersion(Ljava/lang/String;)V
    .locals 0

    .line 110
    invoke-static {p0}, Lcom/ss/android/ttve/monitor/MonitorUtils;->setAppVersion(Ljava/lang/String;)V

    .line 111
    return-void
.end method

.method public static setDeviceId(Ljava/lang/String;)V
    .locals 0

    .line 99
    invoke-static {p0}, Lcom/ss/android/ttve/monitor/MonitorUtils;->setDeviceId(Ljava/lang/String;)V

    .line 100
    return-void
.end method

.method public static setSDKMonitorEnable(Z)V
    .locals 0

    .line 151
    invoke-static {p0}, Lcom/ss/android/ttve/monitor/MonitorUtils;->setEnable(Z)V

    .line 152
    return-void
.end method

.method public static setUserId(Ljava/lang/String;)V
    .locals 0

    .line 88
    invoke-static {p0}, Lcom/ss/android/ttve/monitor/MonitorUtils;->setUserId(Ljava/lang/String;)V

    .line 89
    return-void
.end method
