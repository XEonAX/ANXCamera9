.class public Lcom/android/camera/module/loader/camera2/CompletablePreFixCamera2Setup;
.super Ljava/lang/Object;
.source "CompletablePreFixCamera2Setup.java"

# interfaces
.implements Lio/reactivex/CompletableOnSubscribe;
.implements Lio/reactivex/Observer;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lio/reactivex/CompletableOnSubscribe;",
        "Lio/reactivex/Observer<",
        "Lcom/android/camera/module/loader/camera2/Camera2Result;",
        ">;"
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "prefix"


# instance fields
.field private isFromVoiceControl:Z

.field private mCameraScreenNail:Lcom/android/camera/CameraScreenNail;

.field private mEmitter:Lio/reactivex/CompletableEmitter;

.field private mFromScreenSlide:Z

.field private mIntent:Landroid/content/Intent;

.field private mLastMode:Lcom/android/camera/module/Module;

.field private mModuleChanged:Z

.field private mNeedBlur:Z

.field private mNeedConfigData:Z

.field private mStartFromKeyguard:Z


# direct methods
.method public constructor <init>(Lcom/android/camera/module/Module;Lcom/android/camera/module/loader/StartControl;Lcom/android/camera/CameraScreenNail;Landroid/content/Intent;ZZ)V
    .locals 1

    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    iput-object p1, p0, Lcom/android/camera/module/loader/camera2/CompletablePreFixCamera2Setup;->mLastMode:Lcom/android/camera/module/Module;

    .line 52
    if-eqz p2, :cond_0

    .line 53
    iget-boolean v0, p2, Lcom/android/camera/module/loader/StartControl;->mNeedBlurAnimation:Z

    iput-boolean v0, p0, Lcom/android/camera/module/loader/camera2/CompletablePreFixCamera2Setup;->mNeedBlur:Z

    .line 54
    iget-boolean v0, p2, Lcom/android/camera/module/loader/StartControl;->mFromScreenSlide:Z

    iput-boolean v0, p0, Lcom/android/camera/module/loader/camera2/CompletablePreFixCamera2Setup;->mFromScreenSlide:Z

    .line 55
    iget-boolean v0, p2, Lcom/android/camera/module/loader/StartControl;->mNeedReConfigureData:Z

    iput-boolean v0, p0, Lcom/android/camera/module/loader/camera2/CompletablePreFixCamera2Setup;->mNeedConfigData:Z

    .line 58
    :cond_0
    if-eqz p2, :cond_2

    if-eqz p1, :cond_2

    iget p2, p2, Lcom/android/camera/module/loader/StartControl;->mTargetMode:I

    .line 61
    invoke-interface {p1}, Lcom/android/camera/module/Module;->getModuleIndex()I

    move-result p1

    if-eq p2, p1, :cond_1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    goto :goto_1

    :cond_2
    :goto_0
    const/4 p1, 0x1

    :goto_1
    iput-boolean p1, p0, Lcom/android/camera/module/loader/camera2/CompletablePreFixCamera2Setup;->mModuleChanged:Z

    .line 64
    iput-object p3, p0, Lcom/android/camera/module/loader/camera2/CompletablePreFixCamera2Setup;->mCameraScreenNail:Lcom/android/camera/CameraScreenNail;

    .line 65
    iput-object p4, p0, Lcom/android/camera/module/loader/camera2/CompletablePreFixCamera2Setup;->mIntent:Landroid/content/Intent;

    .line 66
    iput-boolean p5, p0, Lcom/android/camera/module/loader/camera2/CompletablePreFixCamera2Setup;->mStartFromKeyguard:Z

    .line 67
    iput-boolean p6, p0, Lcom/android/camera/module/loader/camera2/CompletablePreFixCamera2Setup;->isFromVoiceControl:Z

    .line 68
    return-void
.end method

.method private closeLastModule()V
    .locals 1

    .line 151
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/CompletablePreFixCamera2Setup;->mLastMode:Lcom/android/camera/module/Module;

    if-nez v0, :cond_0

    .line 152
    return-void

    .line 154
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/CompletablePreFixCamera2Setup;->mLastMode:Lcom/android/camera/module/Module;

    invoke-interface {v0}, Lcom/android/camera/module/Module;->unRegisterProtocol()V

    .line 155
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/CompletablePreFixCamera2Setup;->mLastMode:Lcom/android/camera/module/Module;

    invoke-interface {v0}, Lcom/android/camera/module/Module;->onPause()V

    .line 156
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/CompletablePreFixCamera2Setup;->mLastMode:Lcom/android/camera/module/Module;

    invoke-interface {v0}, Lcom/android/camera/module/Module;->onStop()V

    .line 157
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/CompletablePreFixCamera2Setup;->mLastMode:Lcom/android/camera/module/Module;

    invoke-interface {v0}, Lcom/android/camera/module/Module;->onDestroy()V

    .line 158
    return-void
.end method

.method private isLastModuleAlive()Z
    .locals 1

    .line 147
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/CompletablePreFixCamera2Setup;->mLastMode:Lcom/android/camera/module/Module;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/CompletablePreFixCamera2Setup;->mLastMode:Lcom/android/camera/module/Module;

    invoke-interface {v0}, Lcom/android/camera/module/Module;->isCreated()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method


# virtual methods
.method public onComplete()V
    .locals 0

    .line 144
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 0

    .line 139
    return-void
.end method

.method public onNext(Lcom/android/camera/module/loader/camera2/Camera2Result;)V
    .locals 0

    .line 133
    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/CompletablePreFixCamera2Setup;->mEmitter:Lio/reactivex/CompletableEmitter;

    invoke-interface {p1}, Lio/reactivex/CompletableEmitter;->onComplete()V

    .line 134
    return-void
.end method

.method public bridge synthetic onNext(Ljava/lang/Object;)V
    .locals 0

    .line 27
    check-cast p1, Lcom/android/camera/module/loader/camera2/Camera2Result;

    invoke-virtual {p0, p1}, Lcom/android/camera/module/loader/camera2/CompletablePreFixCamera2Setup;->onNext(Lcom/android/camera/module/loader/camera2/Camera2Result;)V

    return-void
.end method

.method public onSubscribe(Lio/reactivex/disposables/Disposable;)V
    .locals 0

    .line 129
    return-void
.end method

.method public subscribe(Lio/reactivex/CompletableEmitter;)V
    .locals 7
    .annotation build Landroid/support/annotation/WorkerThread;
    .end annotation

    .line 73
    iput-object p1, p0, Lcom/android/camera/module/loader/camera2/CompletablePreFixCamera2Setup;->mEmitter:Lio/reactivex/CompletableEmitter;

    .line 76
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    .line 78
    iget-boolean p1, p0, Lcom/android/camera/module/loader/camera2/CompletablePreFixCamera2Setup;->mModuleChanged:Z

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/CompletablePreFixCamera2Setup;->mLastMode:Lcom/android/camera/module/Module;

    if-eqz p1, :cond_0

    .line 79
    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/CompletablePreFixCamera2Setup;->mLastMode:Lcom/android/camera/module/Module;

    invoke-interface {p1}, Lcom/android/camera/module/Module;->unRegisterModulePersistProtocol()V

    .line 83
    :cond_0
    invoke-direct {p0}, Lcom/android/camera/module/loader/camera2/CompletablePreFixCamera2Setup;->isLastModuleAlive()Z

    move-result p1

    if-eqz p1, :cond_2

    .line 84
    iget-boolean p1, p0, Lcom/android/camera/module/loader/camera2/CompletablePreFixCamera2Setup;->mNeedConfigData:Z

    if-eqz p1, :cond_1

    .line 85
    invoke-static {}, Lcom/android/camera/data/DataRepository;->getInstance()Lcom/android/camera/data/DataRepository;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/data/DataRepository;->backUp()Lcom/android/camera/data/backup/DataBackUp;

    move-result-object p1

    .line 86
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v1

    iget-object v2, p0, Lcom/android/camera/module/loader/camera2/CompletablePreFixCamera2Setup;->mLastMode:Lcom/android/camera/module/Module;

    .line 87
    invoke-interface {v2}, Lcom/android/camera/module/Module;->getModuleIndex()I

    move-result v2

    invoke-virtual {v0, v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getDataBackUpKey(I)I

    move-result v2

    .line 88
    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getLastCameraId()I

    move-result v3

    const/4 v4, 0x1

    .line 85
    invoke-interface {p1, v1, v2, v3, v4}, Lcom/android/camera/data/backup/DataBackUp;->backupRunning(Lcom/android/camera/data/data/runing/DataItemRunning;IIZ)V

    .line 91
    :cond_1
    invoke-direct {p0}, Lcom/android/camera/module/loader/camera2/CompletablePreFixCamera2Setup;->closeLastModule()V

    .line 94
    :cond_2
    iget-boolean p1, p0, Lcom/android/camera/module/loader/camera2/CompletablePreFixCamera2Setup;->mNeedBlur:Z

    if-eqz p1, :cond_3

    .line 95
    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/CompletablePreFixCamera2Setup;->mCameraScreenNail:Lcom/android/camera/CameraScreenNail;

    iget-boolean v1, p0, Lcom/android/camera/module/loader/camera2/CompletablePreFixCamera2Setup;->mFromScreenSlide:Z

    invoke-virtual {p1, v1}, Lcom/android/camera/CameraScreenNail;->animateModuleCopyTexture(Z)V

    .line 101
    :cond_3
    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/CompletablePreFixCamera2Setup;->mIntent:Landroid/content/Intent;

    if-eqz p1, :cond_5

    .line 102
    iget-object v1, p0, Lcom/android/camera/module/loader/camera2/CompletablePreFixCamera2Setup;->mIntent:Landroid/content/Intent;

    iget-boolean p1, p0, Lcom/android/camera/module/loader/camera2/CompletablePreFixCamera2Setup;->isFromVoiceControl:Z

    .line 103
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    iget-boolean v3, p0, Lcom/android/camera/module/loader/camera2/CompletablePreFixCamera2Setup;->mStartFromKeyguard:Z

    const/4 v4, 0x1

    const/4 v5, 0x1

    invoke-virtual/range {v0 .. v5}, Lcom/android/camera/data/data/global/DataItemGlobal;->parseIntent(Landroid/content/Intent;Ljava/lang/Boolean;ZZZ)Landroid/support/v4/util/Pair;

    move-result-object p1

    .line 105
    iget-object v0, p1, Landroid/support/v4/util/Pair;->first:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 106
    iget-object p1, p1, Landroid/support/v4/util/Pair;->second:Ljava/lang/Object;

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    .line 108
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mi/config/a;->fp()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 110
    invoke-static {}, Lcom/android/camera/db/DbRepository;->dbItemSaveTask()Lcom/android/camera/db/item/DbItemSaveTask;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/db/item/DbItemSaveTask;->markAllDepartedTask()V

    .line 112
    invoke-static {}, Lcom/android/camera/parallel/AlgoConnector;->getInstance()Lcom/android/camera/parallel/AlgoConnector;

    move-result-object v1

    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/android/camera/parallel/AlgoConnector;->startService(Landroid/content/Context;)V

    .line 115
    :cond_4
    invoke-static {}, Lcom/android/camera/ThermalDetector;->getInstance()Lcom/android/camera/ThermalDetector;

    move-result-object v1

    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/android/camera/ThermalDetector;->onCreate(Landroid/content/Context;)V

    .line 116
    nop

    .line 121
    move v6, v0

    move v0, p1

    move p1, v6

    goto :goto_0

    .line 117
    :cond_5
    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentCameraId()I

    move-result p1

    .line 118
    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentMode()I

    move-result v0

    .line 121
    :goto_0
    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2OpenManager;

    move-result-object v1

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mi/config/a;->fV()Z

    move-result v2

    invoke-virtual {v1, p1, v0, p0, v2}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->openCamera(IILio/reactivex/Observer;Z)V

    .line 123
    return-void
.end method
