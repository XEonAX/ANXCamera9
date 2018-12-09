.class public Lcom/ss/android/vesdk/runtime/VEEnv;
.super Ljava/lang/Object;
.source "VEEnv.java"


# static fields
.field private static final MODELS_DIR_SP_KEY:Ljava/lang/String; = "vesdk_models_dir_sp_key"


# instance fields
.field private mDetectModelsDir:Ljava/lang/String;

.field private mWorkspace:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    return-void
.end method


# virtual methods
.method public getDetectModelsDir()Ljava/lang/String;
    .locals 3
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 73
    iget-object v0, p0, Lcom/ss/android/vesdk/runtime/VEEnv;->mDetectModelsDir:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 74
    invoke-static {}, Lcom/ss/android/vesdk/runtime/persistence/VESP;->getInstance()Lcom/ss/android/vesdk/runtime/persistence/VESP;

    move-result-object v0

    const-string v1, "vesdk_models_dir_sp_key"

    const-string v2, ""

    invoke-virtual {v0, v1, v2}, Lcom/ss/android/vesdk/runtime/persistence/VESP;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/ss/android/vesdk/runtime/VEEnv;->mDetectModelsDir:Ljava/lang/String;

    .line 76
    :cond_0
    iget-object v0, p0, Lcom/ss/android/vesdk/runtime/VEEnv;->mDetectModelsDir:Ljava/lang/String;

    return-object v0
.end method

.method public getWorkspace()Ljava/lang/String;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 52
    iget-object v0, p0, Lcom/ss/android/vesdk/runtime/VEEnv;->mWorkspace:Ljava/lang/String;

    return-object v0
.end method

.method public prepareModels(Landroid/content/Context;)V
    .locals 3
    .param p1    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 102
    iget-object v0, p0, Lcom/ss/android/vesdk/runtime/VEEnv;->mWorkspace:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 103
    return-void

    .line 105
    :cond_0
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/ss/android/vesdk/runtime/VEEnv;->mWorkspace:Ljava/lang/String;

    const-string v2, "models"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 106
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_1

    .line 107
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 109
    :cond_1
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/ss/android/vesdk/runtime/VEEnv;->mDetectModelsDir:Ljava/lang/String;

    .line 110
    iget-object v0, p0, Lcom/ss/android/vesdk/runtime/VEEnv;->mDetectModelsDir:Ljava/lang/String;

    invoke-static {p1, v0}, Lcom/bef/effectsdk/EffectSDKUtils;->flushAlgorithmModelFiles(Landroid/content/Context;Ljava/lang/String;)V

    .line 111
    return-void
.end method

.method public setDetectModelsDir(Ljava/lang/String;)V
    .locals 2
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 87
    iput-object p1, p0, Lcom/ss/android/vesdk/runtime/VEEnv;->mDetectModelsDir:Ljava/lang/String;

    .line 88
    invoke-static {}, Lcom/ss/android/vesdk/runtime/persistence/VESP;->getInstance()Lcom/ss/android/vesdk/runtime/persistence/VESP;

    move-result-object p1

    const-string v0, "vesdk_models_dir_sp_key"

    iget-object v1, p0, Lcom/ss/android/vesdk/runtime/VEEnv;->mDetectModelsDir:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Lcom/ss/android/vesdk/runtime/persistence/VESP;->put(Ljava/lang/String;Ljava/lang/Object;)V

    .line 89
    return-void
.end method

.method public setWorkspace(Ljava/lang/String;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 62
    iput-object p1, p0, Lcom/ss/android/vesdk/runtime/VEEnv;->mWorkspace:Ljava/lang/String;

    .line 63
    return-void
.end method
