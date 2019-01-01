.class public final Landroid/os/statistics/E2EScenarioPerfTracer;
.super Ljava/lang/Object;
.source "E2EScenarioPerfTracer.java"


# static fields
.field private static final VERSION:I = 0x1

.field private static final executor:Ljava/util/concurrent/ThreadPoolExecutor;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .line 18
    new-instance v7, Ljava/util/concurrent/ThreadPoolExecutor;

    sget-object v5, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    new-instance v6, Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-direct {v6}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    const/4 v1, 0x1

    const/4 v2, 0x1

    const-wide/16 v3, 0x0

    move-object v0, v7

    invoke-direct/range {v0 .. v6}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;)V

    sput-object v7, Landroid/os/statistics/E2EScenarioPerfTracer;->executor:Ljava/util/concurrent/ThreadPoolExecutor;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    return-void
.end method

.method public static abortScenario(Landroid/os/Bundle;)V
    .locals 12
    .param p0, "scenarioBundle"    # Landroid/os/Bundle;

    .line 123
    if-nez p0, :cond_0

    .line 124
    return-void

    .line 126
    :cond_0
    invoke-static {}, Lcom/miui/daemon/performance/PerfShielderManager;->getService()Lcom/android/internal/app/IPerfShielder;

    move-result-object v6

    .line 127
    .local v6, "perfShielder":Lcom/android/internal/app/IPerfShielder;
    if-nez v6, :cond_1

    .line 128
    return-void

    .line 130
    :cond_1
    invoke-static {}, Landroid/os/Process;->myTid()I

    move-result v7

    .line 131
    .local v7, "tid":I
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v8

    .line 132
    .local v8, "uptimeMs":J
    sget-object v10, Landroid/os/statistics/E2EScenarioPerfTracer;->executor:Ljava/util/concurrent/ThreadPoolExecutor;

    new-instance v11, Landroid/os/statistics/E2EScenarioPerfTracer$3;

    move-object v0, v11

    move-object v1, v6

    move-object v2, p0

    move v3, v7

    move-wide v4, v8

    invoke-direct/range {v0 .. v5}, Landroid/os/statistics/E2EScenarioPerfTracer$3;-><init>(Lcom/android/internal/app/IPerfShielder;Landroid/os/Bundle;IJ)V

    invoke-virtual {v10, v11}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    .line 141
    return-void
.end method

.method public static abortScenario(Landroid/os/statistics/E2EScenario;)V
    .locals 1
    .param p0, "scenario"    # Landroid/os/statistics/E2EScenario;

    .line 98
    const-string v0, ""

    invoke-static {p0, v0}, Landroid/os/statistics/E2EScenarioPerfTracer;->abortScenario(Landroid/os/statistics/E2EScenario;Ljava/lang/String;)V

    .line 99
    return-void
.end method

.method public static abortScenario(Landroid/os/statistics/E2EScenario;Ljava/lang/String;)V
    .locals 13
    .param p0, "scenario"    # Landroid/os/statistics/E2EScenario;
    .param p1, "tag"    # Ljava/lang/String;

    .line 102
    if-eqz p0, :cond_2

    invoke-virtual {p0}, Landroid/os/statistics/E2EScenario;->isValid()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 105
    :cond_0
    invoke-static {}, Lcom/miui/daemon/performance/PerfShielderManager;->getService()Lcom/android/internal/app/IPerfShielder;

    move-result-object v0

    .line 106
    .local v0, "perfShielder":Lcom/android/internal/app/IPerfShielder;
    if-nez v0, :cond_1

    .line 107
    return-void

    .line 109
    :cond_1
    invoke-static {}, Landroid/os/Process;->myTid()I

    move-result v8

    .line 110
    .local v8, "tid":I
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v9

    .line 111
    .local v9, "uptimeMs":J
    sget-object v11, Landroid/os/statistics/E2EScenarioPerfTracer;->executor:Ljava/util/concurrent/ThreadPoolExecutor;

    new-instance v12, Landroid/os/statistics/E2EScenarioPerfTracer$2;

    move-object v1, v12

    move-object v2, v0

    move-object v3, p0

    move-object v4, p1

    move v5, v8

    move-wide v6, v9

    invoke-direct/range {v1 .. v7}, Landroid/os/statistics/E2EScenarioPerfTracer$2;-><init>(Lcom/android/internal/app/IPerfShielder;Landroid/os/statistics/E2EScenario;Ljava/lang/String;IJ)V

    invoke-virtual {v11, v12}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    .line 120
    return-void

    .line 103
    .end local v0    # "perfShielder":Lcom/android/internal/app/IPerfShielder;
    .end local v8    # "tid":I
    .end local v9    # "uptimeMs":J
    :cond_2
    :goto_0
    return-void
.end method

.method public static asyncBeginScenario(Landroid/os/statistics/E2EScenario;Landroid/os/statistics/E2EScenarioSettings;)V
    .locals 2
    .param p0, "scenario"    # Landroid/os/statistics/E2EScenario;
    .param p1, "settings"    # Landroid/os/statistics/E2EScenarioSettings;

    .line 59
    const-string v0, ""

    const/4 v1, 0x0

    invoke-static {p0, p1, v0, v1}, Landroid/os/statistics/E2EScenarioPerfTracer;->asyncBeginScenario(Landroid/os/statistics/E2EScenario;Landroid/os/statistics/E2EScenarioSettings;Ljava/lang/String;Landroid/os/statistics/E2EScenarioPayload;)V

    .line 60
    return-void
.end method

.method public static asyncBeginScenario(Landroid/os/statistics/E2EScenario;Landroid/os/statistics/E2EScenarioSettings;Landroid/os/statistics/E2EScenarioPayload;)V
    .locals 1
    .param p0, "scenario"    # Landroid/os/statistics/E2EScenario;
    .param p1, "settings"    # Landroid/os/statistics/E2EScenarioSettings;
    .param p2, "payload"    # Landroid/os/statistics/E2EScenarioPayload;

    .line 69
    const-string v0, ""

    invoke-static {p0, p1, v0, p2}, Landroid/os/statistics/E2EScenarioPerfTracer;->asyncBeginScenario(Landroid/os/statistics/E2EScenario;Landroid/os/statistics/E2EScenarioSettings;Ljava/lang/String;Landroid/os/statistics/E2EScenarioPayload;)V

    .line 70
    return-void
.end method

.method public static asyncBeginScenario(Landroid/os/statistics/E2EScenario;Landroid/os/statistics/E2EScenarioSettings;Ljava/lang/String;)V
    .locals 1
    .param p0, "scenario"    # Landroid/os/statistics/E2EScenario;
    .param p1, "settings"    # Landroid/os/statistics/E2EScenarioSettings;
    .param p2, "tag"    # Ljava/lang/String;

    .line 64
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0}, Landroid/os/statistics/E2EScenarioPerfTracer;->asyncBeginScenario(Landroid/os/statistics/E2EScenario;Landroid/os/statistics/E2EScenarioSettings;Ljava/lang/String;Landroid/os/statistics/E2EScenarioPayload;)V

    .line 65
    return-void
.end method

.method public static asyncBeginScenario(Landroid/os/statistics/E2EScenario;Landroid/os/statistics/E2EScenarioSettings;Ljava/lang/String;Landroid/os/statistics/E2EScenarioPayload;)V
    .locals 16
    .param p0, "scenario"    # Landroid/os/statistics/E2EScenario;
    .param p1, "settings"    # Landroid/os/statistics/E2EScenarioSettings;
    .param p2, "tag"    # Ljava/lang/String;
    .param p3, "payload"    # Landroid/os/statistics/E2EScenarioPayload;

    .line 74
    if-eqz p0, :cond_4

    invoke-virtual/range {p0 .. p0}, Landroid/os/statistics/E2EScenario;->isValid()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_1

    .line 77
    :cond_0
    if-eqz p1, :cond_3

    invoke-virtual/range {p1 .. p1}, Landroid/os/statistics/E2EScenarioSettings;->isValid()Z

    move-result v0

    if-nez v0, :cond_1

    goto :goto_0

    .line 80
    :cond_1
    invoke-static {}, Lcom/miui/daemon/performance/PerfShielderManager;->getService()Lcom/android/internal/app/IPerfShielder;

    move-result-object v10

    .line 81
    .local v10, "perfShielder":Lcom/android/internal/app/IPerfShielder;
    if-nez v10, :cond_2

    .line 82
    return-void

    .line 84
    :cond_2
    invoke-static {}, Landroid/os/Process;->myTid()I

    move-result v11

    .line 85
    .local v11, "tid":I
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v12

    .line 86
    .local v12, "uptimeMs":J
    sget-object v14, Landroid/os/statistics/E2EScenarioPerfTracer;->executor:Ljava/util/concurrent/ThreadPoolExecutor;

    new-instance v7, Landroid/os/statistics/E2EScenarioPerfTracer$1;

    move-object v0, v7

    move-object v1, v10

    move-object/from16 v2, p0

    move-object/from16 v3, p1

    move-object/from16 v4, p2

    move-object/from16 v5, p3

    move v6, v11

    move-object v9, v7

    move-wide v7, v12

    invoke-direct/range {v0 .. v8}, Landroid/os/statistics/E2EScenarioPerfTracer$1;-><init>(Lcom/android/internal/app/IPerfShielder;Landroid/os/statistics/E2EScenario;Landroid/os/statistics/E2EScenarioSettings;Ljava/lang/String;Landroid/os/statistics/E2EScenarioPayload;IJ)V

    invoke-virtual {v14, v9}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    .line 95
    return-void

    .line 78
    .end local v10    # "perfShielder":Lcom/android/internal/app/IPerfShielder;
    .end local v11    # "tid":I
    .end local v12    # "uptimeMs":J
    :cond_3
    :goto_0
    return-void

    .line 75
    :cond_4
    :goto_1
    return-void
.end method

.method public static beginScenario(Landroid/os/statistics/E2EScenario;Landroid/os/statistics/E2EScenarioSettings;)Landroid/os/Bundle;
    .locals 2
    .param p0, "scenario"    # Landroid/os/statistics/E2EScenario;
    .param p1, "settings"    # Landroid/os/statistics/E2EScenarioSettings;

    .line 29
    const-string v0, ""

    const/4 v1, 0x0

    invoke-static {p0, p1, v0, v1}, Landroid/os/statistics/E2EScenarioPerfTracer;->beginScenario(Landroid/os/statistics/E2EScenario;Landroid/os/statistics/E2EScenarioSettings;Ljava/lang/String;Landroid/os/statistics/E2EScenarioPayload;)Landroid/os/Bundle;

    move-result-object v0

    return-object v0
.end method

.method public static beginScenario(Landroid/os/statistics/E2EScenario;Landroid/os/statistics/E2EScenarioSettings;Landroid/os/statistics/E2EScenarioPayload;)Landroid/os/Bundle;
    .locals 1
    .param p0, "scenario"    # Landroid/os/statistics/E2EScenario;
    .param p1, "settings"    # Landroid/os/statistics/E2EScenarioSettings;
    .param p2, "payload"    # Landroid/os/statistics/E2EScenarioPayload;

    .line 37
    const-string v0, ""

    invoke-static {p0, p1, v0, p2}, Landroid/os/statistics/E2EScenarioPerfTracer;->beginScenario(Landroid/os/statistics/E2EScenario;Landroid/os/statistics/E2EScenarioSettings;Ljava/lang/String;Landroid/os/statistics/E2EScenarioPayload;)Landroid/os/Bundle;

    move-result-object v0

    return-object v0
.end method

.method public static beginScenario(Landroid/os/statistics/E2EScenario;Landroid/os/statistics/E2EScenarioSettings;Ljava/lang/String;)Landroid/os/Bundle;
    .locals 1
    .param p0, "scenario"    # Landroid/os/statistics/E2EScenario;
    .param p1, "settings"    # Landroid/os/statistics/E2EScenarioSettings;
    .param p2, "tag"    # Ljava/lang/String;

    .line 33
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0}, Landroid/os/statistics/E2EScenarioPerfTracer;->beginScenario(Landroid/os/statistics/E2EScenario;Landroid/os/statistics/E2EScenarioSettings;Ljava/lang/String;Landroid/os/statistics/E2EScenarioPayload;)Landroid/os/Bundle;

    move-result-object v0

    return-object v0
.end method

.method public static beginScenario(Landroid/os/statistics/E2EScenario;Landroid/os/statistics/E2EScenarioSettings;Ljava/lang/String;Landroid/os/statistics/E2EScenarioPayload;)Landroid/os/Bundle;
    .locals 11
    .param p0, "scenario"    # Landroid/os/statistics/E2EScenario;
    .param p1, "settings"    # Landroid/os/statistics/E2EScenarioSettings;
    .param p2, "tag"    # Ljava/lang/String;
    .param p3, "payload"    # Landroid/os/statistics/E2EScenarioPayload;

    .line 41
    const/4 v0, 0x0

    if-eqz p0, :cond_4

    invoke-virtual {p0}, Landroid/os/statistics/E2EScenario;->isValid()Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_1

    .line 44
    :cond_0
    if-eqz p1, :cond_3

    invoke-virtual {p1}, Landroid/os/statistics/E2EScenarioSettings;->isValid()Z

    move-result v1

    if-nez v1, :cond_1

    goto :goto_0

    .line 47
    :cond_1
    invoke-static {}, Lcom/miui/daemon/performance/PerfShielderManager;->getService()Lcom/android/internal/app/IPerfShielder;

    move-result-object v1

    .line 48
    .local v1, "perfShielder":Lcom/android/internal/app/IPerfShielder;
    if-nez v1, :cond_2

    .line 49
    return-object v0

    .line 52
    :cond_2
    :try_start_0
    invoke-static {}, Landroid/os/Process;->myTid()I

    move-result v7

    const-wide/16 v8, 0x0

    const/4 v10, 0x1

    move-object v2, v1

    move-object v3, p0

    move-object v4, p1

    move-object v5, p2

    move-object v6, p3

    invoke-interface/range {v2 .. v10}, Lcom/android/internal/app/IPerfShielder;->beginScenario(Landroid/os/statistics/E2EScenario;Landroid/os/statistics/E2EScenarioSettings;Ljava/lang/String;Landroid/os/statistics/E2EScenarioPayload;IJZ)Landroid/os/Bundle;

    move-result-object v2
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v2

    .line 53
    :catch_0
    move-exception v2

    .line 54
    .local v2, "ex":Landroid/os/RemoteException;
    return-object v0

    .line 45
    .end local v1    # "perfShielder":Lcom/android/internal/app/IPerfShielder;
    .end local v2    # "ex":Landroid/os/RemoteException;
    :cond_3
    :goto_0
    return-object v0

    .line 42
    :cond_4
    :goto_1
    return-object v0
.end method

.method public static finishScenario(Landroid/os/Bundle;)V
    .locals 1
    .param p0, "scenarioBundle"    # Landroid/os/Bundle;

    .line 177
    const/4 v0, 0x0

    invoke-static {p0, v0}, Landroid/os/statistics/E2EScenarioPerfTracer;->finishScenario(Landroid/os/Bundle;Landroid/os/statistics/E2EScenarioPayload;)V

    .line 178
    return-void
.end method

.method public static finishScenario(Landroid/os/Bundle;Landroid/os/statistics/E2EScenarioPayload;)V
    .locals 13
    .param p0, "scenarioBundle"    # Landroid/os/Bundle;
    .param p1, "payload"    # Landroid/os/statistics/E2EScenarioPayload;

    .line 181
    if-nez p0, :cond_0

    .line 182
    return-void

    .line 184
    :cond_0
    invoke-static {}, Lcom/miui/daemon/performance/PerfShielderManager;->getService()Lcom/android/internal/app/IPerfShielder;

    move-result-object v7

    .line 185
    .local v7, "perfShielder":Lcom/android/internal/app/IPerfShielder;
    if-nez v7, :cond_1

    .line 186
    return-void

    .line 188
    :cond_1
    invoke-static {}, Landroid/os/Process;->myTid()I

    move-result v8

    .line 189
    .local v8, "tid":I
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v9

    .line 190
    .local v9, "uptimeMs":J
    sget-object v11, Landroid/os/statistics/E2EScenarioPerfTracer;->executor:Ljava/util/concurrent/ThreadPoolExecutor;

    new-instance v12, Landroid/os/statistics/E2EScenarioPerfTracer$5;

    move-object v0, v12

    move-object v1, v7

    move-object v2, p0

    move-object v3, p1

    move v4, v8

    move-wide v5, v9

    invoke-direct/range {v0 .. v6}, Landroid/os/statistics/E2EScenarioPerfTracer$5;-><init>(Lcom/android/internal/app/IPerfShielder;Landroid/os/Bundle;Landroid/os/statistics/E2EScenarioPayload;IJ)V

    invoke-virtual {v11, v12}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    .line 199
    return-void
.end method

.method public static finishScenario(Landroid/os/statistics/E2EScenario;)V
    .locals 2
    .param p0, "scenario"    # Landroid/os/statistics/E2EScenario;

    .line 144
    const-string v0, ""

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Landroid/os/statistics/E2EScenarioPerfTracer;->finishScenario(Landroid/os/statistics/E2EScenario;Ljava/lang/String;Landroid/os/statistics/E2EScenarioPayload;)V

    .line 145
    return-void
.end method

.method public static finishScenario(Landroid/os/statistics/E2EScenario;Landroid/os/statistics/E2EScenarioPayload;)V
    .locals 1
    .param p0, "scenario"    # Landroid/os/statistics/E2EScenario;
    .param p1, "payload"    # Landroid/os/statistics/E2EScenarioPayload;

    .line 148
    const-string v0, ""

    invoke-static {p0, v0, p1}, Landroid/os/statistics/E2EScenarioPerfTracer;->finishScenario(Landroid/os/statistics/E2EScenario;Ljava/lang/String;Landroid/os/statistics/E2EScenarioPayload;)V

    .line 149
    return-void
.end method

.method public static finishScenario(Landroid/os/statistics/E2EScenario;Ljava/lang/String;)V
    .locals 1
    .param p0, "scenario"    # Landroid/os/statistics/E2EScenario;
    .param p1, "tag"    # Ljava/lang/String;

    .line 152
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Landroid/os/statistics/E2EScenarioPerfTracer;->finishScenario(Landroid/os/statistics/E2EScenario;Ljava/lang/String;Landroid/os/statistics/E2EScenarioPayload;)V

    .line 153
    return-void
.end method

.method public static finishScenario(Landroid/os/statistics/E2EScenario;Ljava/lang/String;Landroid/os/statistics/E2EScenarioPayload;)V
    .locals 14
    .param p0, "scenario"    # Landroid/os/statistics/E2EScenario;
    .param p1, "tag"    # Ljava/lang/String;
    .param p2, "payload"    # Landroid/os/statistics/E2EScenarioPayload;

    .line 156
    if-eqz p0, :cond_2

    invoke-virtual {p0}, Landroid/os/statistics/E2EScenario;->isValid()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 159
    :cond_0
    invoke-static {}, Lcom/miui/daemon/performance/PerfShielderManager;->getService()Lcom/android/internal/app/IPerfShielder;

    move-result-object v8

    .line 160
    .local v8, "perfShielder":Lcom/android/internal/app/IPerfShielder;
    if-nez v8, :cond_1

    .line 161
    return-void

    .line 163
    :cond_1
    invoke-static {}, Landroid/os/Process;->myTid()I

    move-result v9

    .line 164
    .local v9, "tid":I
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v10

    .line 165
    .local v10, "uptimeMs":J
    sget-object v12, Landroid/os/statistics/E2EScenarioPerfTracer;->executor:Ljava/util/concurrent/ThreadPoolExecutor;

    new-instance v13, Landroid/os/statistics/E2EScenarioPerfTracer$4;

    move-object v0, v13

    move-object v1, v8

    move-object v2, p0

    move-object v3, p1

    move-object/from16 v4, p2

    move v5, v9

    move-wide v6, v10

    invoke-direct/range {v0 .. v7}, Landroid/os/statistics/E2EScenarioPerfTracer$4;-><init>(Lcom/android/internal/app/IPerfShielder;Landroid/os/statistics/E2EScenario;Ljava/lang/String;Landroid/os/statistics/E2EScenarioPayload;IJ)V

    invoke-virtual {v12, v13}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    .line 174
    return-void

    .line 157
    .end local v8    # "perfShielder":Lcom/android/internal/app/IPerfShielder;
    .end local v9    # "tid":I
    .end local v10    # "uptimeMs":J
    :cond_2
    :goto_0
    return-void
.end method

.method public static getVersion()I
    .locals 1

    .line 25
    const/4 v0, 0x1

    return v0
.end method
