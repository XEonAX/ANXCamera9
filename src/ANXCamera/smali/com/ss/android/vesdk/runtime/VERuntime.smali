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

    .line 86
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 73
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/ss/android/vesdk/runtime/VERuntime;->mIsInited:Z

    .line 77
    new-instance v0, Lcom/ss/android/vesdk/runtime/VERuntime$1;

    invoke-direct {v0, p0}, Lcom/ss/android/vesdk/runtime/VERuntime$1;-><init>(Lcom/ss/android/vesdk/runtime/VERuntime;)V

    iput-object v0, p0, Lcom/ss/android/vesdk/runtime/VERuntime;->mMoniter:Lcom/ss/android/ttve/monitor/IMonitor;

    .line 87
    return-void
.end method

.method synthetic constructor <init>(Lcom/ss/android/vesdk/runtime/VERuntime$1;)V
    .locals 0

    .line 34
    invoke-direct {p0}, Lcom/ss/android/vesdk/runtime/VERuntime;-><init>()V

    return-void
.end method

.method static synthetic access$100(Lcom/ss/android/vesdk/runtime/VERuntime;)Ljava/lang/ref/WeakReference;
    .locals 0

    .line 34
    iget-object p0, p0, Lcom/ss/android/vesdk/runtime/VERuntime;->mVEMonitorListener:Ljava/lang/ref/WeakReference;

    return-object p0
.end method

.method public static getInstance()Lcom/ss/android/vesdk/runtime/VERuntime;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 91
    sget-object v0, Lcom/ss/android/vesdk/runtime/VERuntime$VERuntimeSingleton;->INSTANCE:Lcom/ss/android/vesdk/runtime/VERuntime$VERuntimeSingleton;

    invoke-virtual {v0}, Lcom/ss/android/vesdk/runtime/VERuntime$VERuntimeSingleton;->getInstance()Lcom/ss/android/vesdk/runtime/VERuntime;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public getAB()Lcom/ss/android/vesdk/VEAB;
    .locals 1

    .line 176
    iget-object v0, p0, Lcom/ss/android/vesdk/runtime/VERuntime;->mAB:Lcom/ss/android/vesdk/VEAB;

    if-nez v0, :cond_0

    .line 177
    new-instance v0, Lcom/ss/android/vesdk/VEAB;

    invoke-direct {v0}, Lcom/ss/android/vesdk/VEAB;-><init>()V

    iput-object v0, p0, Lcom/ss/android/vesdk/runtime/VERuntime;->mAB:Lcom/ss/android/vesdk/VEAB;

    .line 179
    :cond_0
    iget-object v0, p0, Lcom/ss/android/vesdk/runtime/VERuntime;->mAB:Lcom/ss/android/vesdk/VEAB;

    return-object v0
.end method

.method public getContext()Landroid/content/Context;
    .locals 1

    .line 183
    iget-object v0, p0, Lcom/ss/android/vesdk/runtime/VERuntime;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method public getEnv()Lcom/ss/android/vesdk/runtime/VEEnv;
    .locals 1

    .line 172
    iget-object v0, p0, Lcom/ss/android/vesdk/runtime/VERuntime;->mEnv:Lcom/ss/android/vesdk/runtime/VEEnv;

    return-object v0
.end method

.method public getResManager()Lcom/ss/android/vesdk/runtime/VEResManager;
    .locals 1

    .line 187
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

    .line 102
    iget-boolean v0, p0, Lcom/ss/android/vesdk/runtime/VERuntime;->mIsInited:Z

    if-eqz v0, :cond_0

    .line 103
    return-void

    .line 105
    :cond_0
    iput-object p1, p0, Lcom/ss/android/vesdk/runtime/VERuntime;->mContext:Landroid/content/Context;

    .line 106
    iput-object p2, p0, Lcom/ss/android/vesdk/runtime/VERuntime;->mEnv:Lcom/ss/android/vesdk/runtime/VEEnv;

    .line 107
    new-instance p2, Lcom/ss/android/vesdk/VEAB;

    invoke-direct {p2}, Lcom/ss/android/vesdk/VEAB;-><init>()V

    iput-object p2, p0, Lcom/ss/android/vesdk/runtime/VERuntime;->mAB:Lcom/ss/android/vesdk/VEAB;

    .line 108
    new-instance p2, Lcom/ss/android/vesdk/runtime/VEResManager;

    invoke-direct {p2}, Lcom/ss/android/vesdk/runtime/VEResManager;-><init>()V

    iput-object p2, p0, Lcom/ss/android/vesdk/runtime/VERuntime;->mResManager:Lcom/ss/android/vesdk/runtime/VEResManager;

    .line 109
    invoke-static {}, Lcom/ss/android/vesdk/runtime/persistence/VESP;->getInstance()Lcom/ss/android/vesdk/runtime/persistence/VESP;

    move-result-object p2

    invoke-virtual {p2, p1}, Lcom/ss/android/vesdk/runtime/persistence/VESP;->init(Landroid/content/Context;)V

    .line 110
    invoke-static {}, Lcom/ss/android/ttve/monitor/TEMonitor;->init()V

    .line 112
    const-string p1, "on"

    const-string p2, "off"

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 113
    new-instance p1, Lcom/ss/android/vesdk/runtime/VERuntime$2;

    invoke-direct {p1, p0}, Lcom/ss/android/vesdk/runtime/VERuntime$2;-><init>(Lcom/ss/android/vesdk/runtime/VERuntime;)V

    .line 124
    invoke-virtual {p1}, Lcom/ss/android/vesdk/runtime/VERuntime$2;->start()V

    .line 126
    :cond_1
    return-void
.end method

.method public init(Landroid/content/Context;Ljava/lang/String;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 135
    iget-boolean v0, p0, Lcom/ss/android/vesdk/runtime/VERuntime;->mIsInited:Z

    if-eqz v0, :cond_0

    .line 136
    return-void

    .line 138
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/ss/android/vesdk/runtime/VERuntime;->mIsInited:Z

    .line 139
    iput-object p1, p0, Lcom/ss/android/vesdk/runtime/VERuntime;->mContext:Landroid/content/Context;

    .line 140
    new-instance v0, Lcom/ss/android/vesdk/runtime/VEEnv;

    invoke-direct {v0}, Lcom/ss/android/vesdk/runtime/VEEnv;-><init>()V

    iput-object v0, p0, Lcom/ss/android/vesdk/runtime/VERuntime;->mEnv:Lcom/ss/android/vesdk/runtime/VEEnv;

    .line 141
    iget-object v0, p0, Lcom/ss/android/vesdk/runtime/VERuntime;->mEnv:Lcom/ss/android/vesdk/runtime/VEEnv;

    invoke-virtual {v0, p2}, Lcom/ss/android/vesdk/runtime/VEEnv;->setWorkspace(Ljava/lang/String;)V

    .line 142
    new-instance p2, Lcom/ss/android/vesdk/VEAB;

    invoke-direct {p2}, Lcom/ss/android/vesdk/VEAB;-><init>()V

    iput-object p2, p0, Lcom/ss/android/vesdk/runtime/VERuntime;->mAB:Lcom/ss/android/vesdk/VEAB;

    .line 143
    new-instance p2, Lcom/ss/android/vesdk/runtime/VEResManager;

    invoke-direct {p2}, Lcom/ss/android/vesdk/runtime/VEResManager;-><init>()V

    iput-object p2, p0, Lcom/ss/android/vesdk/runtime/VERuntime;->mResManager:Lcom/ss/android/vesdk/runtime/VEResManager;

    .line 144
    invoke-static {}, Lcom/ss/android/vesdk/runtime/persistence/VESP;->getInstance()Lcom/ss/android/vesdk/runtime/persistence/VESP;

    move-result-object p2

    invoke-virtual {p2, p1}, Lcom/ss/android/vesdk/runtime/persistence/VESP;->init(Landroid/content/Context;)V

    .line 145
    invoke-static {}, Lcom/ss/android/ttve/monitor/TEMonitor;->init()V

    .line 147
    new-instance p1, Lcom/ss/android/vesdk/runtime/VERuntime$3;

    invoke-direct {p1, p0}, Lcom/ss/android/vesdk/runtime/VERuntime$3;-><init>(Lcom/ss/android/vesdk/runtime/VERuntime;)V

    .line 160
    invoke-virtual {p1}, Lcom/ss/android/vesdk/runtime/VERuntime$3;->start()V

    .line 161
    return-void
.end method

.method public needUpdateEffectModelFiles()I
    .locals 2

    .line 224
    iget-object v0, p0, Lcom/ss/android/vesdk/runtime/VERuntime;->mEnv:Lcom/ss/android/vesdk/runtime/VEEnv;

    const/16 v1, -0x6c

    if-nez v0, :cond_0

    .line 225
    return v1

    .line 227
    :cond_0
    iget-object v0, p0, Lcom/ss/android/vesdk/runtime/VERuntime;->mEnv:Lcom/ss/android/vesdk/runtime/VEEnv;

    invoke-virtual {v0}, Lcom/ss/android/vesdk/runtime/VEEnv;->getWorkspace()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 228
    return v1

    .line 230
    :cond_1
    iget-object v0, p0, Lcom/ss/android/vesdk/runtime/VERuntime;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/ss/android/vesdk/runtime/VERuntime;->mEnv:Lcom/ss/android/vesdk/runtime/VEEnv;

    invoke-virtual {v1}, Lcom/ss/android/vesdk/runtime/VEEnv;->getDetectModelsDir()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/bef/effectsdk/EffectSDKUtils;->needUpdate(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 231
    const/4 v0, 0x0

    return v0

    .line 233
    :cond_2
    const/4 v0, -0x1

    return v0
.end method

.method public registerMonitor(Lcom/ss/android/vesdk/VEListener$VEMonitorListener;)V
    .locals 1

    .line 191
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/ss/android/vesdk/runtime/VERuntime;->mVEMonitorListener:Ljava/lang/ref/WeakReference;

    .line 192
    iget-object p1, p0, Lcom/ss/android/vesdk/runtime/VERuntime;->mMoniter:Lcom/ss/android/ttve/monitor/IMonitor;

    invoke-static {p1}, Lcom/ss/android/ttve/monitor/TEMonitor;->register(Lcom/ss/android/ttve/monitor/IMonitor;)V

    .line 193
    return-void
.end method

.method public setAB(Lcom/ss/android/vesdk/VEAB;)V
    .locals 0

    .line 168
    iput-object p1, p0, Lcom/ss/android/vesdk/runtime/VERuntime;->mAB:Lcom/ss/android/vesdk/VEAB;

    .line 169
    return-void
.end method

.method public setEnv(Lcom/ss/android/vesdk/runtime/VEEnv;)V
    .locals 0
    .param p1    # Lcom/ss/android/vesdk/runtime/VEEnv;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 164
    iput-object p1, p0, Lcom/ss/android/vesdk/runtime/VERuntime;->mEnv:Lcom/ss/android/vesdk/runtime/VEEnv;

    .line 165
    return-void
.end method

.method public updateEffectModelFiles()I
    .locals 3

    .line 202
    iget-object v0, p0, Lcom/ss/android/vesdk/runtime/VERuntime;->mEnv:Lcom/ss/android/vesdk/runtime/VEEnv;

    const/16 v1, -0x6c

    if-nez v0, :cond_0

    .line 203
    return v1

    .line 205
    :cond_0
    iget-object v0, p0, Lcom/ss/android/vesdk/runtime/VERuntime;->mEnv:Lcom/ss/android/vesdk/runtime/VEEnv;

    invoke-virtual {v0}, Lcom/ss/android/vesdk/runtime/VEEnv;->getWorkspace()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 206
    return v1

    .line 208
    :cond_1
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/ss/android/vesdk/runtime/VERuntime;->mEnv:Lcom/ss/android/vesdk/runtime/VEEnv;

    invoke-virtual {v1}, Lcom/ss/android/vesdk/runtime/VEEnv;->getWorkspace()Ljava/lang/String;

    move-result-object v1

    const-string v2, "models"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 209
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_2

    .line 210
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 212
    :cond_2
    const/4 v1, 0x0

    .line 214
    :try_start_0
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    .line 215
    iget-object v2, p0, Lcom/ss/android/vesdk/runtime/VERuntime;->mContext:Landroid/content/Context;

    invoke-static {v2, v0}, Lcom/bef/effectsdk/EffectSDKUtils;->flushAlgorithmModelFiles(Landroid/content/Context;Ljava/lang/String;)V

    .line 216
    iget-object v2, p0, Lcom/ss/android/vesdk/runtime/VERuntime;->mEnv:Lcom/ss/android/vesdk/runtime/VEEnv;

    invoke-virtual {v2, v0}, Lcom/ss/android/vesdk/runtime/VEEnv;->setDetectModelsDir(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 219
    goto :goto_0

    .line 217
    :catch_0
    move-exception v0

    .line 218
    const/4 v1, -0x1

    .line 220
    :goto_0
    return v1
.end method
