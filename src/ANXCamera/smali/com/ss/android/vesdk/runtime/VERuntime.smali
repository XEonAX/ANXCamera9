.class public Lcom/ss/android/vesdk/runtime/VERuntime;
.super Ljava/lang/Object;
.source "VERuntime.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ss/android/vesdk/runtime/VERuntime$VERuntimeSingleton;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "VERuntime"


# instance fields
.field private mAB:Lcom/ss/android/vesdk/VEAB;

.field mContext:Landroid/content/Context;

.field private mEnv:Lcom/ss/android/vesdk/runtime/VEEnv;

.field private mExternalMonitorListenerRef:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/ss/android/vesdk/runtime/VEExternalMonitorListener;",
            ">;"
        }
    .end annotation
.end field

.field private mIsInited:Z

.field private mMoniter:Lcom/ss/android/ttve/monitor/IMonitor;

.field private mResManager:Lcom/ss/android/vesdk/runtime/VEResManager;

.field private mVEMonitorListener:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/ss/android/vesdk/VEListener$VEMonitorListener;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 95
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 74
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/ss/android/vesdk/runtime/VERuntime;->mIsInited:Z

    .line 83
    new-instance v0, Lcom/ss/android/vesdk/runtime/VERuntime$1;

    invoke-direct {v0, p0}, Lcom/ss/android/vesdk/runtime/VERuntime$1;-><init>(Lcom/ss/android/vesdk/runtime/VERuntime;)V

    iput-object v0, p0, Lcom/ss/android/vesdk/runtime/VERuntime;->mMoniter:Lcom/ss/android/ttve/monitor/IMonitor;

    .line 96
    return-void
.end method

.method synthetic constructor <init>(Lcom/ss/android/vesdk/runtime/VERuntime$1;)V
    .locals 0

    .line 35
    invoke-direct {p0}, Lcom/ss/android/vesdk/runtime/VERuntime;-><init>()V

    return-void
.end method

.method static synthetic access$100(Lcom/ss/android/vesdk/runtime/VERuntime;)Ljava/lang/ref/WeakReference;
    .locals 0

    .line 35
    iget-object p0, p0, Lcom/ss/android/vesdk/runtime/VERuntime;->mVEMonitorListener:Ljava/lang/ref/WeakReference;

    return-object p0
.end method

.method public static getInstance()Lcom/ss/android/vesdk/runtime/VERuntime;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 100
    sget-object v0, Lcom/ss/android/vesdk/runtime/VERuntime$VERuntimeSingleton;->INSTANCE:Lcom/ss/android/vesdk/runtime/VERuntime$VERuntimeSingleton;

    invoke-virtual {v0}, Lcom/ss/android/vesdk/runtime/VERuntime$VERuntimeSingleton;->getInstance()Lcom/ss/android/vesdk/runtime/VERuntime;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public getAB()Lcom/ss/android/vesdk/VEAB;
    .locals 1

    .line 189
    iget-object v0, p0, Lcom/ss/android/vesdk/runtime/VERuntime;->mAB:Lcom/ss/android/vesdk/VEAB;

    if-nez v0, :cond_0

    .line 190
    new-instance v0, Lcom/ss/android/vesdk/VEAB;

    invoke-direct {v0}, Lcom/ss/android/vesdk/VEAB;-><init>()V

    iput-object v0, p0, Lcom/ss/android/vesdk/runtime/VERuntime;->mAB:Lcom/ss/android/vesdk/VEAB;

    .line 192
    :cond_0
    iget-object v0, p0, Lcom/ss/android/vesdk/runtime/VERuntime;->mAB:Lcom/ss/android/vesdk/VEAB;

    return-object v0
.end method

.method public getContext()Landroid/content/Context;
    .locals 1

    .line 196
    iget-object v0, p0, Lcom/ss/android/vesdk/runtime/VERuntime;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method public getEnv()Lcom/ss/android/vesdk/runtime/VEEnv;
    .locals 1

    .line 185
    iget-object v0, p0, Lcom/ss/android/vesdk/runtime/VERuntime;->mEnv:Lcom/ss/android/vesdk/runtime/VEEnv;

    return-object v0
.end method

.method public getResManager()Lcom/ss/android/vesdk/runtime/VEResManager;
    .locals 1

    .line 200
    iget-object v0, p0, Lcom/ss/android/vesdk/runtime/VERuntime;->mResManager:Lcom/ss/android/vesdk/runtime/VEResManager;

    return-object v0
.end method

.method public init(Landroid/content/Context;Lcom/ss/android/vesdk/runtime/VEEnv;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/ss/android/vesdk/runtime/VEEnv;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 111
    iget-boolean v0, p0, Lcom/ss/android/vesdk/runtime/VERuntime;->mIsInited:Z

    if-eqz v0, :cond_0

    .line 112
    return-void

    .line 114
    :cond_0
    iput-object p1, p0, Lcom/ss/android/vesdk/runtime/VERuntime;->mContext:Landroid/content/Context;

    .line 115
    iput-object p2, p0, Lcom/ss/android/vesdk/runtime/VERuntime;->mEnv:Lcom/ss/android/vesdk/runtime/VEEnv;

    .line 116
    new-instance p2, Lcom/ss/android/vesdk/VEAB;

    invoke-direct {p2}, Lcom/ss/android/vesdk/VEAB;-><init>()V

    iput-object p2, p0, Lcom/ss/android/vesdk/runtime/VERuntime;->mAB:Lcom/ss/android/vesdk/VEAB;

    .line 117
    new-instance p2, Lcom/ss/android/vesdk/runtime/VEResManager;

    invoke-direct {p2}, Lcom/ss/android/vesdk/runtime/VEResManager;-><init>()V

    iput-object p2, p0, Lcom/ss/android/vesdk/runtime/VERuntime;->mResManager:Lcom/ss/android/vesdk/runtime/VEResManager;

    .line 118
    invoke-static {}, Lcom/ss/android/vesdk/runtime/persistence/VESP;->getInstance()Lcom/ss/android/vesdk/runtime/persistence/VESP;

    move-result-object p2

    invoke-virtual {p2, p1}, Lcom/ss/android/vesdk/runtime/persistence/VESP;->init(Landroid/content/Context;)V

    .line 119
    invoke-static {}, Lcom/ss/android/ttve/monitor/TEMonitor;->init()V

    .line 121
    const-string p1, "on"

    const-string p2, "off"

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 122
    new-instance p1, Lcom/ss/android/vesdk/runtime/VERuntime$2;

    invoke-direct {p1, p0}, Lcom/ss/android/vesdk/runtime/VERuntime$2;-><init>(Lcom/ss/android/vesdk/runtime/VERuntime;)V

    .line 133
    invoke-virtual {p1}, Lcom/ss/android/vesdk/runtime/VERuntime$2;->start()V

    .line 135
    :cond_1
    return-void
.end method

.method public init(Landroid/content/Context;Ljava/lang/String;)V
    .locals 2
    .param p1    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 144
    iget-boolean v0, p0, Lcom/ss/android/vesdk/runtime/VERuntime;->mIsInited:Z

    if-eqz v0, :cond_0

    .line 145
    return-void

    .line 147
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/ss/android/vesdk/runtime/VERuntime;->mIsInited:Z

    .line 148
    iput-object p1, p0, Lcom/ss/android/vesdk/runtime/VERuntime;->mContext:Landroid/content/Context;

    .line 149
    new-instance v1, Lcom/ss/android/vesdk/runtime/VEEnv;

    invoke-direct {v1}, Lcom/ss/android/vesdk/runtime/VEEnv;-><init>()V

    iput-object v1, p0, Lcom/ss/android/vesdk/runtime/VERuntime;->mEnv:Lcom/ss/android/vesdk/runtime/VEEnv;

    .line 150
    iget-object v1, p0, Lcom/ss/android/vesdk/runtime/VERuntime;->mEnv:Lcom/ss/android/vesdk/runtime/VEEnv;

    invoke-virtual {v1, p2}, Lcom/ss/android/vesdk/runtime/VEEnv;->setWorkspace(Ljava/lang/String;)V

    .line 151
    new-instance p2, Lcom/ss/android/vesdk/VEAB;

    invoke-direct {p2}, Lcom/ss/android/vesdk/VEAB;-><init>()V

    iput-object p2, p0, Lcom/ss/android/vesdk/runtime/VERuntime;->mAB:Lcom/ss/android/vesdk/VEAB;

    .line 152
    new-instance p2, Lcom/ss/android/vesdk/runtime/VEResManager;

    invoke-direct {p2}, Lcom/ss/android/vesdk/runtime/VEResManager;-><init>()V

    iput-object p2, p0, Lcom/ss/android/vesdk/runtime/VERuntime;->mResManager:Lcom/ss/android/vesdk/runtime/VEResManager;

    .line 153
    invoke-static {}, Lcom/ss/android/vesdk/runtime/persistence/VESP;->getInstance()Lcom/ss/android/vesdk/runtime/persistence/VESP;

    move-result-object p2

    invoke-virtual {p2, p1}, Lcom/ss/android/vesdk/runtime/persistence/VESP;->init(Landroid/content/Context;)V

    .line 154
    invoke-static {}, Lcom/ss/android/ttve/monitor/TEMonitor;->init()V

    .line 156
    new-instance p1, Lcom/ss/android/vesdk/runtime/VERuntime$3;

    invoke-direct {p1, p0}, Lcom/ss/android/vesdk/runtime/VERuntime$3;-><init>(Lcom/ss/android/vesdk/runtime/VERuntime;)V

    .line 169
    invoke-virtual {p1}, Lcom/ss/android/vesdk/runtime/VERuntime$3;->start()V

    .line 170
    new-instance p1, Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;

    invoke-direct {p1}, Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;-><init>()V

    .line 171
    const-string p2, "iesve_vesdk_init_finish_result"

    const-string v1, "success"

    invoke-virtual {p1, p2, v1}, Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;->add(Ljava/lang/String;Ljava/lang/String;)Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;

    .line 172
    const-string p2, "iesve_vesdk_init_finish_reason"

    const-string v1, "null"

    invoke-virtual {p1, p2, v1}, Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;->add(Ljava/lang/String;Ljava/lang/String;)Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;

    .line 173
    const-string p2, "iesve_vesdk_init_finish"

    invoke-static {p2, v0, p1}, Lcom/ss/android/ttve/monitor/MonitorUtils;->monitorStatistics(Ljava/lang/String;ILcom/ss/android/vesdk/keyvaluepair/VEKeyValue;)V

    .line 174
    return-void
.end method

.method public needUpdateEffectModelFiles()I
    .locals 2

    .line 264
    iget-object v0, p0, Lcom/ss/android/vesdk/runtime/VERuntime;->mEnv:Lcom/ss/android/vesdk/runtime/VEEnv;

    const/16 v1, -0x6c

    if-nez v0, :cond_0

    .line 265
    return v1

    .line 267
    :cond_0
    iget-object v0, p0, Lcom/ss/android/vesdk/runtime/VERuntime;->mEnv:Lcom/ss/android/vesdk/runtime/VEEnv;

    invoke-virtual {v0}, Lcom/ss/android/vesdk/runtime/VEEnv;->getWorkspace()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 268
    return v1

    .line 270
    :cond_1
    iget-object v0, p0, Lcom/ss/android/vesdk/runtime/VERuntime;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/ss/android/vesdk/runtime/VERuntime;->mEnv:Lcom/ss/android/vesdk/runtime/VEEnv;

    invoke-virtual {v1}, Lcom/ss/android/vesdk/runtime/VEEnv;->getDetectModelsDir()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/bef/effectsdk/EffectSDKUtils;->needUpdate(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 271
    const/4 v0, 0x0

    return v0

    .line 273
    :cond_2
    const/4 v0, -0x1

    return v0
.end method

.method public notifyExternalMonitor(Ljava/lang/String;ILjava/lang/String;)Z
    .locals 1

    .line 225
    iget-object v0, p0, Lcom/ss/android/vesdk/runtime/VERuntime;->mExternalMonitorListenerRef:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_0

    .line 226
    iget-object v0, p0, Lcom/ss/android/vesdk/runtime/VERuntime;->mExternalMonitorListenerRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/ss/android/vesdk/runtime/VEExternalMonitorListener;

    .line 227
    if-eqz v0, :cond_0

    .line 228
    invoke-interface {v0, p1, p2, p3}, Lcom/ss/android/vesdk/runtime/VEExternalMonitorListener;->onMonitorInvoked(Ljava/lang/String;ILjava/lang/String;)V

    .line 229
    const/4 p1, 0x1

    return p1

    .line 232
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public registerMonitor(Lcom/ss/android/vesdk/VEListener$VEMonitorListener;)V
    .locals 1

    .line 204
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/ss/android/vesdk/runtime/VERuntime;->mVEMonitorListener:Ljava/lang/ref/WeakReference;

    .line 205
    iget-object p1, p0, Lcom/ss/android/vesdk/runtime/VERuntime;->mMoniter:Lcom/ss/android/ttve/monitor/IMonitor;

    invoke-static {p1}, Lcom/ss/android/ttve/monitor/TEMonitor;->register(Lcom/ss/android/ttve/monitor/IMonitor;)V

    .line 206
    return-void
.end method

.method public setAB(Lcom/ss/android/vesdk/VEAB;)V
    .locals 0

    .line 181
    iput-object p1, p0, Lcom/ss/android/vesdk/runtime/VERuntime;->mAB:Lcom/ss/android/vesdk/VEAB;

    .line 182
    return-void
.end method

.method public setEnv(Lcom/ss/android/vesdk/runtime/VEEnv;)V
    .locals 0
    .param p1    # Lcom/ss/android/vesdk/runtime/VEEnv;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 177
    iput-object p1, p0, Lcom/ss/android/vesdk/runtime/VERuntime;->mEnv:Lcom/ss/android/vesdk/runtime/VEEnv;

    .line 178
    return-void
.end method

.method public setExternalMonitorListener(Lcom/ss/android/vesdk/runtime/VEExternalMonitorListener;)V
    .locals 1

    .line 213
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/ss/android/vesdk/runtime/VERuntime;->mExternalMonitorListenerRef:Ljava/lang/ref/WeakReference;

    .line 214
    return-void
.end method

.method public updateEffectModelFiles()I
    .locals 3

    .line 242
    iget-object v0, p0, Lcom/ss/android/vesdk/runtime/VERuntime;->mEnv:Lcom/ss/android/vesdk/runtime/VEEnv;

    const/16 v1, -0x6c

    if-nez v0, :cond_0

    .line 243
    return v1

    .line 245
    :cond_0
    iget-object v0, p0, Lcom/ss/android/vesdk/runtime/VERuntime;->mEnv:Lcom/ss/android/vesdk/runtime/VEEnv;

    invoke-virtual {v0}, Lcom/ss/android/vesdk/runtime/VEEnv;->getWorkspace()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 246
    return v1

    .line 248
    :cond_1
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/ss/android/vesdk/runtime/VERuntime;->mEnv:Lcom/ss/android/vesdk/runtime/VEEnv;

    invoke-virtual {v1}, Lcom/ss/android/vesdk/runtime/VEEnv;->getWorkspace()Ljava/lang/String;

    move-result-object v1

    const-string v2, "models"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 249
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_2

    .line 250
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 252
    :cond_2
    const/4 v1, 0x0

    .line 254
    :try_start_0
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    .line 255
    iget-object v2, p0, Lcom/ss/android/vesdk/runtime/VERuntime;->mContext:Landroid/content/Context;

    invoke-static {v2, v0}, Lcom/bef/effectsdk/EffectSDKUtils;->flushAlgorithmModelFiles(Landroid/content/Context;Ljava/lang/String;)V

    .line 256
    iget-object v2, p0, Lcom/ss/android/vesdk/runtime/VERuntime;->mEnv:Lcom/ss/android/vesdk/runtime/VEEnv;

    invoke-virtual {v2, v0}, Lcom/ss/android/vesdk/runtime/VEEnv;->setDetectModelsDir(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 259
    goto :goto_0

    .line 257
    :catch_0
    move-exception v0

    .line 258
    const/4 v1, -0x1

    .line 260
    :goto_0
    return v1
.end method
