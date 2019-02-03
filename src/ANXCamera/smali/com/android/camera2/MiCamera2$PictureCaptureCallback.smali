.class Lcom/android/camera2/MiCamera2$PictureCaptureCallback;
.super Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;
.source "MiCamera2.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera2/MiCamera2;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PictureCaptureCallback"
.end annotation


# instance fields
.field private mAutoFocusTask:Lcom/android/camera/module/loader/camera2/FocusTask;

.field private mLastResultAFState:I

.field private mManuallyFocusTask:Lcom/android/camera/module/loader/camera2/FocusTask;

.field private mPartialResultSupported:Z

.field private mPreviewCaptureResult:Landroid/hardware/camera2/CaptureResult;

.field private final mPreviewCaptureResultLock:Ljava/lang/Object;

.field private mState:I

.field private final mStateLock:Ljava/lang/Object;

.field private mTorchFocusTask:Lcom/android/camera/module/loader/camera2/FocusTask;

.field final synthetic this$0:Lcom/android/camera2/MiCamera2;


# direct methods
.method constructor <init>(Lcom/android/camera2/MiCamera2;)V
    .locals 1

    .line 2968
    iput-object p1, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->this$0:Lcom/android/camera2/MiCamera2;

    invoke-direct {p0}, Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;-><init>()V

    .line 2957
    const/4 v0, -0x1

    iput v0, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->mLastResultAFState:I

    .line 2958
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->mState:I

    .line 2964
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->mPreviewCaptureResultLock:Ljava/lang/Object;

    .line 2965
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->mStateLock:Ljava/lang/Object;

    .line 2969
    invoke-static {p1}, Lcom/android/camera2/MiCamera2;->access$1400(Lcom/android/camera2/MiCamera2;)Lcom/android/camera2/CameraCapabilities;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera2/CameraCapabilities;->isPartialMetadataSupported()Z

    move-result p1

    iput-boolean p1, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->mPartialResultSupported:Z

    .line 2970
    return-void
.end method

.method private isAutoFocusing(Ljava/lang/Integer;)Ljava/lang/Boolean;
    .locals 1

    .line 3298
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    const/4 v0, 0x1

    if-eq p1, v0, :cond_0

    const/4 v0, 0x3

    if-eq p1, v0, :cond_0

    .line 3304
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    return-object p1

    .line 3301
    :cond_0
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    return-object p1
.end method

.method private isFocusLocked(Ljava/lang/Integer;)Ljava/lang/Boolean;
    .locals 1

    .line 3284
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    const/4 v0, 0x2

    if-eq p1, v0, :cond_0

    packed-switch p1, :pswitch_data_0

    .line 3294
    const/4 p1, 0x0

    return-object p1

    .line 3291
    :pswitch_0
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    return-object p1

    .line 3287
    :cond_0
    :pswitch_1
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    return-object p1

    :pswitch_data_0
    .packed-switch 0x4
        :pswitch_1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method private process(Landroid/hardware/camera2/CaptureResult;)V
    .locals 3
    .param p1    # Landroid/hardware/camera2/CaptureResult;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 3150
    iget-object v0, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->mPreviewCaptureResultLock:Ljava/lang/Object;

    monitor-enter v0

    .line 3151
    :try_start_0
    iput-object p1, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->mPreviewCaptureResult:Landroid/hardware/camera2/CaptureResult;

    .line 3152
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3153
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->processVideoRecordStatus(Landroid/hardware/camera2/CaptureResult;)V

    .line 3154
    iget-object v0, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->this$0:Lcom/android/camera2/MiCamera2;

    invoke-static {v0}, Lcom/android/camera2/MiCamera2;->access$1900(Lcom/android/camera2/MiCamera2;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    invoke-static {p1}, Lcom/android/camera2/CaptureResultParser;->getFastZoomResult(Landroid/hardware/camera2/CaptureResult;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 3155
    invoke-static {}, Lcom/android/camera2/MiCamera2;->access$000()Ljava/lang/String;

    move-result-object v0

    const-string v2, "process: CaptureResultParser fast zoom..."

    invoke-static {v0, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 3156
    iget-object v0, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->this$0:Lcom/android/camera2/MiCamera2;

    invoke-virtual {v0, v1}, Lcom/android/camera2/MiCamera2;->setOpticalZoomToTele(Z)V

    .line 3157
    iget-object v0, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->this$0:Lcom/android/camera2/MiCamera2;

    invoke-virtual {v0}, Lcom/android/camera2/MiCamera2;->resumePreview()V

    .line 3160
    :cond_0
    iget-object v0, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->this$0:Lcom/android/camera2/MiCamera2;

    invoke-virtual {v0}, Lcom/android/camera2/MiCamera2;->getMetadataCallback()Lcom/android/camera2/Camera2Proxy$CameraMetaDataCallback;

    move-result-object v0

    .line 3161
    invoke-virtual {p0}, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->getState()I

    move-result v2

    packed-switch v2, :pswitch_data_0

    const/4 v0, 0x2

    packed-switch v2, :pswitch_data_1

    goto :goto_0

    .line 3194
    :pswitch_0
    sget-object v2, Landroid/hardware/camera2/CaptureResult;->FLASH_STATE:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {p1, v2}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    .line 3195
    if-eqz p1, :cond_1

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    if-ne p1, v0, :cond_3

    .line 3196
    :cond_1
    invoke-virtual {p0, v1}, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->setState(I)V

    .line 3197
    iget-object p1, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->this$0:Lcom/android/camera2/MiCamera2;

    invoke-virtual {p1}, Lcom/android/camera2/MiCamera2;->pausePreview()V

    goto :goto_0

    .line 3177
    :pswitch_1
    sget-object v0, Landroid/hardware/camera2/CaptureResult;->FLASH_STATE:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {p1, v0}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    .line 3178
    if-eqz p1, :cond_3

    const/4 v0, 0x3

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    if-ne v0, p1, :cond_3

    .line 3179
    iget-object p1, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->this$0:Lcom/android/camera2/MiCamera2;

    invoke-static {p1}, Lcom/android/camera2/MiCamera2;->access$2000(Lcom/android/camera2/MiCamera2;)V

    goto :goto_0

    .line 3185
    :pswitch_2
    sget-object v1, Landroid/hardware/camera2/CaptureResult;->FLASH_STATE:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {p1, v1}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    .line 3186
    if-eqz p1, :cond_2

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    if-ne p1, v0, :cond_3

    .line 3187
    :cond_2
    const/4 p1, 0x7

    invoke-virtual {p0, p1}, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->setState(I)V

    .line 3188
    iget-object p1, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->this$0:Lcom/android/camera2/MiCamera2;

    invoke-static {p1}, Lcom/android/camera2/MiCamera2;->access$2100(Lcom/android/camera2/MiCamera2;)V

    goto :goto_0

    .line 3170
    :pswitch_3
    if-eqz v0, :cond_3

    .line 3171
    invoke-interface {v0, p1}, Lcom/android/camera2/Camera2Proxy$CameraMetaDataCallback;->onPreviewMetaDataUpdate(Landroid/hardware/camera2/CaptureResult;)V

    goto :goto_0

    .line 3163
    :pswitch_4
    if-eqz v0, :cond_3

    .line 3164
    invoke-interface {v0, p1}, Lcom/android/camera2/Camera2Proxy$CameraMetaDataCallback;->onPreviewMetaDataUpdate(Landroid/hardware/camera2/CaptureResult;)V

    .line 3201
    :cond_3
    :goto_0
    return-void

    .line 3152
    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_4
        :pswitch_3
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x8
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private processAfResult(Landroid/hardware/camera2/CaptureResult;)V
    .locals 8

    .line 3216
    sget-object v0, Landroid/hardware/camera2/CaptureResult;->CONTROL_AF_STATE:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {p1, v0}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    .line 3217
    if-nez p1, :cond_0

    .line 3218
    return-void

    .line 3221
    :cond_0
    iget-object v0, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->this$0:Lcom/android/camera2/MiCamera2;

    invoke-virtual {v0}, Lcom/android/camera2/MiCamera2;->getFocusCallback()Lcom/android/camera2/Camera2Proxy$FocusCallback;

    move-result-object v0

    .line 3222
    if-nez v0, :cond_1

    .line 3223
    return-void

    .line 3226
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    iget v2, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->mLastResultAFState:I

    if-ne v1, v2, :cond_2

    .line 3227
    return-void

    .line 3230
    :cond_2
    invoke-static {}, Lcom/android/camera2/MiCamera2;->access$000()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v3, "afState changed from %d to %d"

    const/4 v4, 0x2

    new-array v5, v4, [Ljava/lang/Object;

    const/4 v6, 0x0

    iget v7, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->mLastResultAFState:I

    .line 3231
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    const/4 v7, 0x1

    aput-object v6, v5, v7

    .line 3230
    invoke-static {v2, v3, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 3233
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    iput v1, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->mLastResultAFState:I

    .line 3234
    iget-object v1, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->mManuallyFocusTask:Lcom/android/camera/module/loader/camera2/FocusTask;

    const/4 v2, 0x0

    if-nez v1, :cond_5

    .line 3235
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->isAutoFocusing(Ljava/lang/Integer;)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 3236
    invoke-static {v4}, Lcom/android/camera/module/loader/camera2/FocusTask;->create(I)Lcom/android/camera/module/loader/camera2/FocusTask;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->mAutoFocusTask:Lcom/android/camera/module/loader/camera2/FocusTask;

    .line 3237
    iget-object p1, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->mAutoFocusTask:Lcom/android/camera/module/loader/camera2/FocusTask;

    invoke-interface {v0, p1}, Lcom/android/camera2/Camera2Proxy$FocusCallback;->onFocusStateChanged(Lcom/android/camera/module/loader/camera2/FocusTask;)V

    goto :goto_0

    .line 3239
    :cond_3
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->isFocusLocked(Ljava/lang/Integer;)Ljava/lang/Boolean;

    move-result-object p1

    .line 3240
    if-eqz p1, :cond_4

    iget-object v1, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->mAutoFocusTask:Lcom/android/camera/module/loader/camera2/FocusTask;

    if-eqz v1, :cond_4

    .line 3241
    iget-object v1, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->mAutoFocusTask:Lcom/android/camera/module/loader/camera2/FocusTask;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    invoke-virtual {v1, p1}, Lcom/android/camera/module/loader/camera2/FocusTask;->setResult(Z)V

    .line 3242
    iget-object p1, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->mAutoFocusTask:Lcom/android/camera/module/loader/camera2/FocusTask;

    invoke-interface {v0, p1}, Lcom/android/camera2/Camera2Proxy$FocusCallback;->onFocusStateChanged(Lcom/android/camera/module/loader/camera2/FocusTask;)V

    .line 3243
    iput-object v2, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->mAutoFocusTask:Lcom/android/camera/module/loader/camera2/FocusTask;

    .line 3245
    :cond_4
    goto :goto_0

    .line 3249
    :cond_5
    iget-object v1, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->mAutoFocusTask:Lcom/android/camera/module/loader/camera2/FocusTask;

    if-eqz v1, :cond_6

    .line 3250
    iput-object v2, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->mAutoFocusTask:Lcom/android/camera/module/loader/camera2/FocusTask;

    .line 3251
    return-void

    .line 3253
    :cond_6
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->isFocusLocked(Ljava/lang/Integer;)Ljava/lang/Boolean;

    move-result-object p1

    .line 3254
    if-eqz p1, :cond_7

    .line 3255
    iget-object v1, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->mManuallyFocusTask:Lcom/android/camera/module/loader/camera2/FocusTask;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    invoke-virtual {v1, p1}, Lcom/android/camera/module/loader/camera2/FocusTask;->setResult(Z)V

    .line 3256
    iget-object p1, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->mManuallyFocusTask:Lcom/android/camera/module/loader/camera2/FocusTask;

    invoke-interface {v0, p1}, Lcom/android/camera2/Camera2Proxy$FocusCallback;->onFocusStateChanged(Lcom/android/camera/module/loader/camera2/FocusTask;)V

    .line 3257
    iput-object v2, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->mManuallyFocusTask:Lcom/android/camera/module/loader/camera2/FocusTask;

    .line 3258
    invoke-virtual {p0, v7}, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->setState(I)V

    .line 3261
    :cond_7
    :goto_0
    return-void
.end method

.method private processPartial(Landroid/hardware/camera2/CaptureResult;)V
    .locals 9
    .param p1    # Landroid/hardware/camera2/CaptureResult;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 3045
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->processAfResult(Landroid/hardware/camera2/CaptureResult;)V

    .line 3046
    invoke-virtual {p0}, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->getState()I

    move-result v0

    const/4 v1, 0x4

    const/4 v2, 0x0

    const/4 v3, 0x1

    const/4 v4, 0x6

    const/4 v5, 0x5

    packed-switch v0, :pswitch_data_0

    goto/16 :goto_3

    .line 3130
    :pswitch_0
    sget-object v0, Landroid/hardware/camera2/CaptureResult;->CONTROL_AF_STATE:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {p1, v0}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 3131
    sget-object v1, Landroid/hardware/camera2/CaptureResult;->CONTROL_AE_STATE:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {p1, v1}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    .line 3132
    sget-object v4, Landroid/hardware/camera2/CaptureResult;->CONTROL_AWB_STATE:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {p1, v4}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    .line 3133
    invoke-static {}, Lcom/android/camera2/MiCamera2;->access$000()Ljava/lang/String;

    move-result-object v4

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "STATE_WAITING_NON_PRECAPTURE:  AF = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v0}, Lcom/android/camera/Util;->controlAFStateToString(Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v4, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 3134
    invoke-static {}, Lcom/android/camera2/MiCamera2;->access$000()Ljava/lang/String;

    move-result-object v0

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "STATE_WAITING_NON_PRECAPTURE:  AE = "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v1}, Lcom/android/camera/Util;->controlAEStateToString(Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v0, v4}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 3135
    invoke-static {}, Lcom/android/camera2/MiCamera2;->access$000()Ljava/lang/String;

    move-result-object v0

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "STATE_WAITING_NON_PRECAPTURE: AWB = "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p1}, Lcom/android/camera/Util;->controlAWBStateToString(Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 3136
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    if-ne p1, v3, :cond_0

    .line 3137
    invoke-static {}, Lcom/android/camera2/MiCamera2;->access$000()Ljava/lang/String;

    move-result-object p1

    const-string v0, "STATE_WAITING_NON_PRECAPTURE: keep stay in STATE_WAITING_NON_PRECAPTURE"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_3

    .line 3138
    :cond_0
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    if-eq p1, v5, :cond_b

    .line 3139
    invoke-static {}, Lcom/android/camera2/MiCamera2;->access$000()Ljava/lang/String;

    move-result-object p1

    const-string v0, "STATE_WAITING_NON_PRECAPTURE: lockExposure()"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 3142
    iget-object p1, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->this$0:Lcom/android/camera2/MiCamera2;

    invoke-virtual {p1, v2}, Lcom/android/camera2/MiCamera2;->lockExposure(Z)V

    goto/16 :goto_3

    .line 3101
    :pswitch_1
    sget-object v0, Landroid/hardware/camera2/CaptureResult;->CONTROL_AF_STATE:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {p1, v0}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 3102
    sget-object v2, Landroid/hardware/camera2/CaptureResult;->CONTROL_AE_STATE:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {p1, v2}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    .line 3103
    sget-object v3, Landroid/hardware/camera2/CaptureResult;->CONTROL_AWB_STATE:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {p1, v3}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    .line 3104
    invoke-static {}, Lcom/android/camera2/MiCamera2;->access$000()Ljava/lang/String;

    move-result-object v6

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "STATE_WAITING_PRECAPTURE:  AF = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v0}, Lcom/android/camera/Util;->controlAFStateToString(Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v6, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 3105
    invoke-static {}, Lcom/android/camera2/MiCamera2;->access$000()Ljava/lang/String;

    move-result-object v0

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "STATE_WAITING_PRECAPTURE:  AE = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v2}, Lcom/android/camera/Util;->controlAEStateToString(Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v0, v6}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 3106
    invoke-static {}, Lcom/android/camera2/MiCamera2;->access$000()Ljava/lang/String;

    move-result-object v0

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "STATE_WAITING_PRECAPTURE: AWB = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v3}, Lcom/android/camera/Util;->controlAWBStateToString(Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 3107
    if-eqz v2, :cond_3

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-eq v0, v5, :cond_3

    .line 3108
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-ne v0, v1, :cond_1

    goto :goto_0

    .line 3111
    :cond_1
    iget-object v0, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->this$0:Lcom/android/camera2/MiCamera2;

    invoke-static {v0}, Lcom/android/camera2/MiCamera2;->access$1800(Lcom/android/camera2/MiCamera2;)I

    move-result v0

    invoke-virtual {p1}, Landroid/hardware/camera2/CaptureResult;->getRequest()Landroid/hardware/camera2/CaptureRequest;

    move-result-object p1

    invoke-virtual {p1}, Landroid/hardware/camera2/CaptureRequest;->hashCode()I

    move-result p1

    if-ne v0, p1, :cond_2

    .line 3119
    invoke-static {}, Lcom/android/camera2/MiCamera2;->access$000()Ljava/lang/String;

    move-result-object p1

    const-string v0, "STATE_WAITING_PRECAPTURE: switch to STATE_WAITING_NON_PRECAPTURE(2)"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 3120
    invoke-virtual {p0, v4}, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->setState(I)V

    goto/16 :goto_3

    .line 3122
    :cond_2
    invoke-static {}, Lcom/android/camera2/MiCamera2;->access$000()Ljava/lang/String;

    move-result-object p1

    const-string v0, "STATE_WAITING_PRECAPTURE: keep stay in STATE_WAITING_PRECAPTURE"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 3124
    goto/16 :goto_3

    .line 3109
    :cond_3
    :goto_0
    invoke-static {}, Lcom/android/camera2/MiCamera2;->access$000()Ljava/lang/String;

    move-result-object p1

    const-string v0, "STATE_WAITING_PRECAPTURE: switch to STATE_WAITING_NON_PRECAPTURE(1)"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 3110
    invoke-virtual {p0, v4}, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->setState(I)V

    goto/16 :goto_3

    .line 3083
    :pswitch_2
    sget-object v0, Landroid/hardware/camera2/CaptureResult;->CONTROL_AF_STATE:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {p1, v0}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 3084
    sget-object v1, Landroid/hardware/camera2/CaptureResult;->CONTROL_AE_STATE:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {p1, v1}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    .line 3085
    sget-object v2, Landroid/hardware/camera2/CaptureResult;->CONTROL_AWB_STATE:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {p1, v2}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    .line 3086
    invoke-static {}, Lcom/android/camera2/MiCamera2;->access$000()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "STATE_WAITING_AE_LOCK:  AF = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v0}, Lcom/android/camera/Util;->controlAFStateToString(Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 3087
    invoke-static {}, Lcom/android/camera2/MiCamera2;->access$000()Ljava/lang/String;

    move-result-object v0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "STATE_WAITING_AE_LOCK:  AE = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v1}, Lcom/android/camera/Util;->controlAEStateToString(Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 3088
    invoke-static {}, Lcom/android/camera2/MiCamera2;->access$000()Ljava/lang/String;

    move-result-object v0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "STATE_WAITING_AE_LOCK: AWB = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p1}, Lcom/android/camera/Util;->controlAWBStateToString(Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 3089
    if-eqz v1, :cond_5

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    const/4 v0, 0x3

    if-ne p1, v0, :cond_4

    goto :goto_1

    .line 3093
    :cond_4
    invoke-static {}, Lcom/android/camera2/MiCamera2;->access$000()Ljava/lang/String;

    move-result-object p1

    const-string v0, "STATE_WAITING_AE_LOCK: keep stay in STATE_WAITING_AE_LOCK"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 3095
    goto/16 :goto_3

    .line 3090
    :cond_5
    :goto_1
    invoke-static {}, Lcom/android/camera2/MiCamera2;->access$000()Ljava/lang/String;

    move-result-object p1

    const-string v0, "STATE_WAITING_AE_LOCK: runCaptureSequence()"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 3091
    iget-object p1, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->this$0:Lcom/android/camera2/MiCamera2;

    invoke-static {p1}, Lcom/android/camera2/MiCamera2;->access$100(Lcom/android/camera2/MiCamera2;)V

    goto/16 :goto_3

    .line 3048
    :pswitch_3
    sget-object v0, Landroid/hardware/camera2/CaptureResult;->CONTROL_AF_STATE:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {p1, v0}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 3049
    if-nez v0, :cond_6

    .line 3050
    goto/16 :goto_3

    .line 3052
    :cond_6
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v6

    if-eq v1, v6, :cond_8

    .line 3053
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-eq v5, v1, :cond_8

    const/4 v1, 0x2

    .line 3054
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v5

    if-eq v1, v5, :cond_8

    .line 3055
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-eq v4, v1, :cond_8

    iget-object v1, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->this$0:Lcom/android/camera2/MiCamera2;

    .line 3056
    invoke-static {v1}, Lcom/android/camera2/MiCamera2;->access$1600(Lcom/android/camera2/MiCamera2;)I

    move-result v1

    invoke-virtual {p1}, Landroid/hardware/camera2/CaptureResult;->getRequest()Landroid/hardware/camera2/CaptureRequest;

    move-result-object v4

    invoke-virtual {v4}, Landroid/hardware/camera2/CaptureRequest;->hashCode()I

    move-result v4

    if-ne v1, v4, :cond_7

    .line 3057
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-nez v0, :cond_7

    goto :goto_2

    .line 3076
    :cond_7
    iget-object v0, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->this$0:Lcom/android/camera2/MiCamera2;

    invoke-static {v0}, Lcom/android/camera2/MiCamera2;->access$1600(Lcom/android/camera2/MiCamera2;)I

    move-result v0

    invoke-virtual {p1}, Landroid/hardware/camera2/CaptureResult;->getRequest()Landroid/hardware/camera2/CaptureRequest;

    move-result-object p1

    invoke-virtual {p1}, Landroid/hardware/camera2/CaptureRequest;->hashCode()I

    move-result p1

    if-ne v0, p1, :cond_b

    .line 3077
    iget-object p1, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->this$0:Lcom/android/camera2/MiCamera2;

    invoke-static {p1, v2}, Lcom/android/camera2/MiCamera2;->access$1602(Lcom/android/camera2/MiCamera2;I)I

    goto :goto_3

    .line 3058
    :cond_8
    :goto_2
    iget-object v0, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->this$0:Lcom/android/camera2/MiCamera2;

    invoke-static {v0}, Lcom/android/camera2/MiCamera2;->access$1600(Lcom/android/camera2/MiCamera2;)I

    move-result v0

    invoke-virtual {p1}, Landroid/hardware/camera2/CaptureResult;->getRequest()Landroid/hardware/camera2/CaptureRequest;

    move-result-object p1

    invoke-virtual {p1}, Landroid/hardware/camera2/CaptureRequest;->hashCode()I

    move-result p1

    if-eq v0, p1, :cond_9

    iget-object p1, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->this$0:Lcom/android/camera2/MiCamera2;

    .line 3059
    invoke-static {p1}, Lcom/android/camera2/MiCamera2;->access$1600(Lcom/android/camera2/MiCamera2;)I

    move-result p1

    if-nez p1, :cond_b

    .line 3065
    :cond_9
    iget-object p1, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->this$0:Lcom/android/camera2/MiCamera2;

    invoke-static {p1}, Lcom/android/camera2/MiCamera2;->access$1700(Lcom/android/camera2/MiCamera2;)Landroid/os/Handler;

    move-result-object p1

    if-eqz p1, :cond_a

    .line 3066
    iget-object p1, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->this$0:Lcom/android/camera2/MiCamera2;

    invoke-static {p1}, Lcom/android/camera2/MiCamera2;->access$1700(Lcom/android/camera2/MiCamera2;)Landroid/os/Handler;

    move-result-object p1

    invoke-virtual {p1, v3}, Landroid/os/Handler;->removeMessages(I)V

    .line 3072
    :cond_a
    iget-object p1, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->this$0:Lcom/android/camera2/MiCamera2;

    invoke-static {p1}, Lcom/android/camera2/MiCamera2;->access$100(Lcom/android/camera2/MiCamera2;)V

    .line 3147
    :cond_b
    :goto_3
    return-void

    :pswitch_data_0
    .packed-switch 0x3
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private processVideoRecordStatus(Landroid/hardware/camera2/CaptureResult;)V
    .locals 2

    .line 3204
    iget-object v0, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->this$0:Lcom/android/camera2/MiCamera2;

    invoke-static {v0}, Lcom/android/camera2/MiCamera2;->access$2200(Lcom/android/camera2/MiCamera2;)Ljava/lang/Object;

    move-result-object v0

    monitor-enter v0

    .line 3205
    :try_start_0
    iget-object v1, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->this$0:Lcom/android/camera2/MiCamera2;

    invoke-static {v1}, Lcom/android/camera2/MiCamera2;->access$2300(Lcom/android/camera2/MiCamera2;)Lcom/android/camera2/Camera2Proxy$VideoRecordStateCallback;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 3206
    sget-object v1, Lcom/android/camera/constant/MiCaptureResult;->VIDEO_RECORD_STATE:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {p1, v1}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    .line 3207
    if-eqz p1, :cond_0

    const/4 v1, 0x2

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    if-ne v1, p1, :cond_0

    .line 3208
    iget-object p1, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->this$0:Lcom/android/camera2/MiCamera2;

    invoke-static {p1}, Lcom/android/camera2/MiCamera2;->access$2300(Lcom/android/camera2/MiCamera2;)Lcom/android/camera2/Camera2Proxy$VideoRecordStateCallback;

    move-result-object p1

    invoke-interface {p1}, Lcom/android/camera2/Camera2Proxy$VideoRecordStateCallback;->onVideoRecordStopped()V

    .line 3209
    iget-object p1, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->this$0:Lcom/android/camera2/MiCamera2;

    const/4 v1, 0x0

    invoke-static {p1, v1}, Lcom/android/camera2/MiCamera2;->access$2302(Lcom/android/camera2/MiCamera2;Lcom/android/camera2/Camera2Proxy$VideoRecordStateCallback;)Lcom/android/camera2/Camera2Proxy$VideoRecordStateCallback;

    .line 3212
    :cond_0
    monitor-exit v0

    .line 3213
    return-void

    .line 3212
    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method


# virtual methods
.method getCurrentAEState()Ljava/lang/Integer;
    .locals 2

    .line 2987
    invoke-virtual {p0}, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->getPreviewCaptureResult()Landroid/hardware/camera2/CaptureResult;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    .line 2988
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->getPreviewCaptureResult()Landroid/hardware/camera2/CaptureResult;

    move-result-object v0

    sget-object v1, Landroid/hardware/camera2/CaptureResult;->CONTROL_AE_STATE:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 2987
    :goto_0
    return-object v0
.end method

.method getCurrentColorTemperature()I
    .locals 2

    .line 2992
    invoke-virtual {p0}, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->getPreviewCaptureResult()Landroid/hardware/camera2/CaptureResult;

    move-result-object v0

    .line 2993
    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 2994
    return v1

    .line 2996
    :cond_0
    invoke-static {v0}, Lcom/android/camera2/CaptureResultParser;->getAWBFrameControl(Landroid/hardware/camera2/CaptureResult;)Lcom/android/camera2/AWBFrameControl;

    move-result-object v0

    .line 2997
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/android/camera2/AWBFrameControl;->getColorTemperature()I

    move-result v1

    nop

    :cond_1
    return v1
.end method

.method getPreviewCaptureResult()Landroid/hardware/camera2/CaptureResult;
    .locals 4

    .line 3001
    iget-object v0, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->mPreviewCaptureResultLock:Ljava/lang/Object;

    monitor-enter v0

    .line 3002
    :try_start_0
    iget-object v1, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->mPreviewCaptureResult:Landroid/hardware/camera2/CaptureResult;

    if-nez v1, :cond_0

    .line 3003
    invoke-static {}, Lcom/android/camera2/MiCamera2;->access$000()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "returned a null PreviewCaptureResult, mState is "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->mState:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 3005
    :cond_0
    iget-object v1, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->mPreviewCaptureResult:Landroid/hardware/camera2/CaptureResult;

    monitor-exit v0

    return-object v1

    .line 3006
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getState()I
    .locals 2

    .line 2981
    iget-object v0, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->mStateLock:Ljava/lang/Object;

    monitor-enter v0

    .line 2982
    :try_start_0
    iget v1, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->mState:I

    monitor-exit v0

    return v1

    .line 2983
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public onCaptureCompleted(Landroid/hardware/camera2/CameraCaptureSession;Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/TotalCaptureResult;)V
    .locals 2
    .param p1    # Landroid/hardware/camera2/CameraCaptureSession;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/hardware/camera2/CaptureRequest;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Landroid/hardware/camera2/TotalCaptureResult;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 3024
    invoke-virtual {p3}, Landroid/hardware/camera2/TotalCaptureResult;->getFrameNumber()J

    move-result-wide p1

    const-wide/16 v0, 0x0

    cmp-long p1, p1, v0

    if-nez p1, :cond_0

    .line 3025
    invoke-static {}, Lcom/android/camera2/MiCamera2;->access$000()Ljava/lang/String;

    move-result-object p1

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "onCaptureCompleted Sequence: "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Landroid/hardware/camera2/TotalCaptureResult;->getSequenceId()I

    move-result v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, " first frame received"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 3026
    iget-object p1, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->this$0:Lcom/android/camera2/MiCamera2;

    const/4 p2, 0x0

    invoke-static {p1, p2}, Lcom/android/camera2/MiCamera2;->access$1500(Lcom/android/camera2/MiCamera2;Z)V

    .line 3029
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->getState()I

    move-result p1

    if-nez p1, :cond_1

    .line 3030
    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->setState(I)V

    .line 3033
    :cond_1
    iget-boolean p1, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->mPartialResultSupported:Z

    if-nez p1, :cond_2

    .line 3034
    invoke-direct {p0, p3}, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->processPartial(Landroid/hardware/camera2/CaptureResult;)V

    .line 3036
    :cond_2
    invoke-direct {p0, p3}, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->process(Landroid/hardware/camera2/CaptureResult;)V

    .line 3037
    return-void
.end method

.method public onCaptureProgressed(Landroid/hardware/camera2/CameraCaptureSession;Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CaptureResult;)V
    .locals 0
    .param p1    # Landroid/hardware/camera2/CameraCaptureSession;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/hardware/camera2/CaptureRequest;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Landroid/hardware/camera2/CaptureResult;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 3017
    invoke-direct {p0, p3}, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->processPartial(Landroid/hardware/camera2/CaptureResult;)V

    .line 3018
    return-void
.end method

.method setFocusTask(Lcom/android/camera/module/loader/camera2/FocusTask;)V
    .locals 0

    .line 3010
    iput-object p1, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->mManuallyFocusTask:Lcom/android/camera/module/loader/camera2/FocusTask;

    .line 3011
    return-void
.end method

.method setState(I)V
    .locals 4

    .line 2973
    iget-object v0, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->mStateLock:Ljava/lang/Object;

    monitor-enter v0

    .line 2974
    :try_start_0
    invoke-static {}, Lcom/android/camera2/MiCamera2;->access$000()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "setState: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2975
    iput p1, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->mState:I

    .line 2976
    monitor-exit v0

    .line 2977
    return-void

    .line 2976
    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method showAutoFocusFinish(Z)V
    .locals 2

    .line 3272
    iget-object v0, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->mTorchFocusTask:Lcom/android/camera/module/loader/camera2/FocusTask;

    if-nez v0, :cond_0

    .line 3273
    return-void

    .line 3275
    :cond_0
    iget-object v0, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->this$0:Lcom/android/camera2/MiCamera2;

    invoke-virtual {v0}, Lcom/android/camera2/MiCamera2;->getFocusCallback()Lcom/android/camera2/Camera2Proxy$FocusCallback;

    move-result-object v0

    .line 3276
    if-eqz v0, :cond_1

    .line 3277
    iget-object v1, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->mTorchFocusTask:Lcom/android/camera/module/loader/camera2/FocusTask;

    invoke-virtual {v1, p1}, Lcom/android/camera/module/loader/camera2/FocusTask;->setResult(Z)V

    .line 3278
    iget-object p1, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->mTorchFocusTask:Lcom/android/camera/module/loader/camera2/FocusTask;

    invoke-interface {v0, p1}, Lcom/android/camera2/Camera2Proxy$FocusCallback;->onFocusStateChanged(Lcom/android/camera/module/loader/camera2/FocusTask;)V

    .line 3279
    const/4 p1, 0x0

    iput-object p1, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->mTorchFocusTask:Lcom/android/camera/module/loader/camera2/FocusTask;

    .line 3281
    :cond_1
    return-void
.end method

.method showAutoFocusStart()V
    .locals 2

    .line 3264
    iget-object v0, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->this$0:Lcom/android/camera2/MiCamera2;

    invoke-virtual {v0}, Lcom/android/camera2/MiCamera2;->getFocusCallback()Lcom/android/camera2/Camera2Proxy$FocusCallback;

    move-result-object v0

    .line 3265
    if-eqz v0, :cond_0

    .line 3266
    const/4 v1, 0x3

    invoke-static {v1}, Lcom/android/camera/module/loader/camera2/FocusTask;->create(I)Lcom/android/camera/module/loader/camera2/FocusTask;

    move-result-object v1

    iput-object v1, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->mTorchFocusTask:Lcom/android/camera/module/loader/camera2/FocusTask;

    .line 3267
    iget-object v1, p0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->mTorchFocusTask:Lcom/android/camera/module/loader/camera2/FocusTask;

    invoke-interface {v0, v1}, Lcom/android/camera2/Camera2Proxy$FocusCallback;->onFocusStateChanged(Lcom/android/camera/module/loader/camera2/FocusTask;)V

    .line 3269
    :cond_0
    return-void
.end method
