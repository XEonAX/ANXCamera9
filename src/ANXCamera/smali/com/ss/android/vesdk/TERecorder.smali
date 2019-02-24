.class public Lcom/ss/android/vesdk/TERecorder;
.super Ljava/lang/Object;
.source "TERecorder.java"


# instance fields
.field private mAudioEncodeSettings:Lcom/ss/android/vesdk/VEAudioEncodeSettings;

.field private mPreviewSettings:Lcom/ss/android/vesdk/VEPreviewSettings;

.field private mRecordCount:I

.field private mRecorder:Lcom/ss/android/vesdk/IRecorder;

.field private mResManager:Lcom/ss/android/vesdk/runtime/VERecorderResManager;

.field private mVERuntime:Lcom/ss/android/vesdk/runtime/VERuntime;

.field private mVideoEncodeSettings:Lcom/ss/android/vesdk/VEVideoEncodeSettings;


# direct methods
.method public constructor <init>(Ljava/lang/String;Landroid/content/Context;)V
    .locals 1
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/ss/android/vesdk/TERecorder;->mAudioEncodeSettings:Lcom/ss/android/vesdk/VEAudioEncodeSettings;

    .line 38
    iput-object v0, p0, Lcom/ss/android/vesdk/TERecorder;->mVideoEncodeSettings:Lcom/ss/android/vesdk/VEVideoEncodeSettings;

    .line 39
    iput-object v0, p0, Lcom/ss/android/vesdk/TERecorder;->mPreviewSettings:Lcom/ss/android/vesdk/VEPreviewSettings;

    .line 49
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 53
    if-eqz p2, :cond_0

    .line 57
    new-instance v0, Lcom/ss/android/vesdk/runtime/VERecorderResManager;

    invoke-direct {v0, p1}, Lcom/ss/android/vesdk/runtime/VERecorderResManager;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/ss/android/vesdk/TERecorder;->mResManager:Lcom/ss/android/vesdk/runtime/VERecorderResManager;

    .line 59
    invoke-static {}, Lcom/ss/android/vesdk/runtime/VERuntime;->getInstance()Lcom/ss/android/vesdk/runtime/VERuntime;

    move-result-object v0

    iput-object v0, p0, Lcom/ss/android/vesdk/TERecorder;->mVERuntime:Lcom/ss/android/vesdk/runtime/VERuntime;

    .line 60
    iget-object v0, p0, Lcom/ss/android/vesdk/TERecorder;->mVERuntime:Lcom/ss/android/vesdk/runtime/VERuntime;

    invoke-virtual {v0, p2, p1}, Lcom/ss/android/vesdk/runtime/VERuntime;->init(Landroid/content/Context;Ljava/lang/String;)V

    .line 61
    new-instance p1, Lcom/ss/android/vesdk/RecordV1;

    invoke-direct {p1, p2}, Lcom/ss/android/vesdk/RecordV1;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Lcom/ss/android/vesdk/TERecorder;->mRecorder:Lcom/ss/android/vesdk/IRecorder;

    .line 62
    return-void

    .line 54
    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "context could not be null"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 50
    :cond_1
    new-instance p1, Lcom/ss/android/vesdk/VEException;

    const/16 p2, -0x64

    const-string v0, "workSpace is null"

    invoke-direct {p1, p2, v0}, Lcom/ss/android/vesdk/VEException;-><init>(ILjava/lang/String;)V

    throw p1
.end method

.method public static declared-synchronized addSlamDetectListener(Lcom/ss/android/medialib/TTRecorder$SlamDetectListener;)V
    .locals 1

    const-class v0, Lcom/ss/android/vesdk/TERecorder;

    monitor-enter v0

    .line 581
    :try_start_0
    invoke-static {p0}, Lcom/ss/android/medialib/TTRecorder;->addSlamDetectListener(Lcom/ss/android/medialib/TTRecorder$SlamDetectListener;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 582
    monitor-exit v0

    return-void

    .line 580
    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method public static declared-synchronized clearSlamDetectListener()V
    .locals 2

    const-class v0, Lcom/ss/android/vesdk/TERecorder;

    monitor-enter v0

    .line 596
    :try_start_0
    invoke-static {}, Lcom/ss/android/medialib/TTRecorder;->clearSlamDetectListener()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 597
    monitor-exit v0

    return-void

    .line 595
    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method public static declared-synchronized removeSlamDetectListener(Lcom/ss/android/medialib/TTRecorder$SlamDetectListener;)V
    .locals 1

    const-class v0, Lcom/ss/android/vesdk/TERecorder;

    monitor-enter v0

    .line 589
    :try_start_0
    invoke-static {p0}, Lcom/ss/android/medialib/TTRecorder;->removeSlamDetectListener(Lcom/ss/android/medialib/TTRecorder$SlamDetectListener;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 590
    monitor-exit v0

    return-void

    .line 588
    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method


# virtual methods
.method public chooseSlamFace(I)V
    .locals 1

    .line 559
    iget-object v0, p0, Lcom/ss/android/vesdk/TERecorder;->mRecorder:Lcom/ss/android/vesdk/IRecorder;

    invoke-interface {v0, p1}, Lcom/ss/android/vesdk/IRecorder;->chooseSlamFace(I)V

    .line 560
    return-void
.end method

.method public clearEnv()V
    .locals 1

    .line 203
    iget-object v0, p0, Lcom/ss/android/vesdk/TERecorder;->mRecorder:Lcom/ss/android/vesdk/IRecorder;

    invoke-interface {v0}, Lcom/ss/android/vesdk/IRecorder;->clearEnv()V

    .line 204
    return-void
.end method

.method public concat()[Ljava/lang/String;
    .locals 5
    .annotation build Landroid/support/annotation/WorkerThread;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ss/android/vesdk/VEException;
        }
    .end annotation

    .line 217
    iget-object v0, p0, Lcom/ss/android/vesdk/TERecorder;->mResManager:Lcom/ss/android/vesdk/runtime/VERecorderResManager;

    invoke-virtual {v0}, Lcom/ss/android/vesdk/runtime/VERecorderResManager;->genConcatSegmentVideoPath()V

    .line 218
    iget-object v0, p0, Lcom/ss/android/vesdk/TERecorder;->mResManager:Lcom/ss/android/vesdk/runtime/VERecorderResManager;

    invoke-virtual {v0}, Lcom/ss/android/vesdk/runtime/VERecorderResManager;->genConcatSegmentAudioPath()V

    .line 219
    iget-object v0, p0, Lcom/ss/android/vesdk/TERecorder;->mResManager:Lcom/ss/android/vesdk/runtime/VERecorderResManager;

    invoke-virtual {v0}, Lcom/ss/android/vesdk/runtime/VERecorderResManager;->getConcatSegmentVideoPath()Ljava/lang/String;

    move-result-object v0

    .line 220
    iget-object v1, p0, Lcom/ss/android/vesdk/TERecorder;->mResManager:Lcom/ss/android/vesdk/runtime/VERecorderResManager;

    invoke-virtual {v1}, Lcom/ss/android/vesdk/runtime/VERecorderResManager;->getConcatSegmentAudioPath()Ljava/lang/String;

    move-result-object v1

    .line 221
    iget-object v2, p0, Lcom/ss/android/vesdk/TERecorder;->mRecorder:Lcom/ss/android/vesdk/IRecorder;

    invoke-interface {v2, v0, v1}, Lcom/ss/android/vesdk/IRecorder;->concat(Ljava/lang/String;Ljava/lang/String;)I

    move-result v2

    .line 222
    if-ltz v2, :cond_0

    .line 225
    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    const/4 v0, 0x1

    aput-object v1, v2, v0

    return-object v2

    .line 223
    :cond_0
    new-instance v0, Lcom/ss/android/vesdk/VEException;

    const/4 v1, -0x1

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "concat failed: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/ss/android/vesdk/VEException;-><init>(ILjava/lang/String;)V

    throw v0
.end method

.method public concatAsync(Ljava/lang/String;Ljava/lang/String;Lcom/ss/android/vesdk/IRecorder$OnConcatFinishedListener;)V
    .locals 1

    .line 235
    iget-object v0, p0, Lcom/ss/android/vesdk/TERecorder;->mRecorder:Lcom/ss/android/vesdk/IRecorder;

    invoke-interface {v0, p1, p2, p3}, Lcom/ss/android/vesdk/IRecorder;->concatAsync(Ljava/lang/String;Ljava/lang/String;Lcom/ss/android/vesdk/IRecorder$OnConcatFinishedListener;)V

    .line 236
    return-void
.end method

.method public deleteLastFrag()V
    .locals 1

    .line 196
    iget-object v0, p0, Lcom/ss/android/vesdk/TERecorder;->mRecorder:Lcom/ss/android/vesdk/IRecorder;

    invoke-interface {v0}, Lcom/ss/android/vesdk/IRecorder;->deleteLastFrag()V

    .line 197
    return-void
.end method

.method public destroy()V
    .locals 1

    .line 259
    iget-object v0, p0, Lcom/ss/android/vesdk/TERecorder;->mRecorder:Lcom/ss/android/vesdk/IRecorder;

    invoke-interface {v0}, Lcom/ss/android/vesdk/IRecorder;->destroy()V

    .line 260
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/ss/android/vesdk/TERecorder;->mRecorder:Lcom/ss/android/vesdk/IRecorder;

    .line 261
    return-void
.end method

.method public enableTTFaceDetect(Z)I
    .locals 1

    .line 389
    iget-object v0, p0, Lcom/ss/android/vesdk/TERecorder;->mRecorder:Lcom/ss/android/vesdk/IRecorder;

    invoke-interface {v0, p1}, Lcom/ss/android/vesdk/IRecorder;->enableTTFaceDetect(Z)I

    move-result p1

    return p1
.end method

.method public getEndFrameTime()J
    .locals 2

    .line 188
    iget-object v0, p0, Lcom/ss/android/vesdk/TERecorder;->mRecorder:Lcom/ss/android/vesdk/IRecorder;

    invoke-interface {v0}, Lcom/ss/android/vesdk/IRecorder;->getEndFrameTime()J

    move-result-wide v0

    return-wide v0
.end method

.method public getSegmentInfo()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/ss/android/medialib/model/TimeSpeedModel;",
            ">;"
        }
    .end annotation

    .line 243
    iget-object v0, p0, Lcom/ss/android/vesdk/TERecorder;->mRecorder:Lcom/ss/android/vesdk/IRecorder;

    invoke-interface {v0}, Lcom/ss/android/vesdk/IRecorder;->getSegmentInfo()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getSlamFaceCount()I
    .locals 1

    .line 550
    iget-object v0, p0, Lcom/ss/android/vesdk/TERecorder;->mRecorder:Lcom/ss/android/vesdk/IRecorder;

    invoke-interface {v0}, Lcom/ss/android/vesdk/IRecorder;->getSlamFaceCount()I

    move-result v0

    return v0
.end method

.method public init(Lcom/ss/android/vesdk/VEVideoEncodeSettings;Lcom/ss/android/vesdk/VEAudioEncodeSettings;Lcom/ss/android/vesdk/VEPreviewSettings;)I
    .locals 7
    .param p1    # Lcom/ss/android/vesdk/VEVideoEncodeSettings;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/ss/android/vesdk/VEAudioEncodeSettings;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Lcom/ss/android/vesdk/VEPreviewSettings;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ss/android/vesdk/VEException;
        }
    .end annotation

    .line 100
    iput-object p1, p0, Lcom/ss/android/vesdk/TERecorder;->mVideoEncodeSettings:Lcom/ss/android/vesdk/VEVideoEncodeSettings;

    .line 101
    iput-object p2, p0, Lcom/ss/android/vesdk/TERecorder;->mAudioEncodeSettings:Lcom/ss/android/vesdk/VEAudioEncodeSettings;

    .line 102
    iput-object p3, p0, Lcom/ss/android/vesdk/TERecorder;->mPreviewSettings:Lcom/ss/android/vesdk/VEPreviewSettings;

    .line 104
    iget-object v0, p0, Lcom/ss/android/vesdk/TERecorder;->mVERuntime:Lcom/ss/android/vesdk/runtime/VERuntime;

    invoke-virtual {v0}, Lcom/ss/android/vesdk/runtime/VERuntime;->getEnv()Lcom/ss/android/vesdk/runtime/VEEnv;

    move-result-object v0

    invoke-virtual {v0}, Lcom/ss/android/vesdk/runtime/VEEnv;->getDetectModelsDir()Ljava/lang/String;

    move-result-object v5

    .line 105
    iget-object v0, p0, Lcom/ss/android/vesdk/TERecorder;->mResManager:Lcom/ss/android/vesdk/runtime/VERecorderResManager;

    invoke-virtual {v0}, Lcom/ss/android/vesdk/runtime/VERecorderResManager;->getSegmentDirPath()Ljava/lang/String;

    move-result-object v6

    .line 107
    invoke-static {}, Lcom/ss/android/ttve/oauth/TEOAuth;->isPermitted()Z

    move-result v0

    if-nez v0, :cond_0

    .line 108
    const/16 p1, -0x16d

    return p1

    .line 111
    :cond_0
    iget-object v1, p0, Lcom/ss/android/vesdk/TERecorder;->mRecorder:Lcom/ss/android/vesdk/IRecorder;

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    invoke-interface/range {v1 .. v6}, Lcom/ss/android/vesdk/IRecorder;->init(Lcom/ss/android/vesdk/VEVideoEncodeSettings;Lcom/ss/android/vesdk/VEAudioEncodeSettings;Lcom/ss/android/vesdk/VEPreviewSettings;Ljava/lang/String;Ljava/lang/String;)I

    move-result p1

    return p1
.end method

.method public pauseEffectAudio(Z)I
    .locals 1

    .line 379
    iget-object v0, p0, Lcom/ss/android/vesdk/TERecorder;->mRecorder:Lcom/ss/android/vesdk/IRecorder;

    invoke-interface {v0, p1}, Lcom/ss/android/vesdk/IRecorder;->pauseEffectAudio(Z)I

    move-result p1

    return p1
.end method

.method public processTouchEvent(FF)I
    .locals 1

    .line 474
    iget-object v0, p0, Lcom/ss/android/vesdk/TERecorder;->mRecorder:Lcom/ss/android/vesdk/IRecorder;

    invoke-interface {v0, p1, p2}, Lcom/ss/android/vesdk/IRecorder;->processTouchEvent(FF)I

    move-result p1

    return p1
.end method

.method public setBeautyFace(ILjava/lang/String;)I
    .locals 4

    .line 310
    new-instance v0, Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;

    invoke-direct {v0}, Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;-><init>()V

    .line 311
    const-string v1, "iesve_verecorder_set_beauty_algorithm"

    invoke-virtual {v0, v1, p1}, Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;->add(Ljava/lang/String;I)Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;

    move-result-object v1

    const-string v2, "old"

    .line 312
    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;->add(Ljava/lang/String;I)Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;

    .line 313
    const-string v1, "iesve_verecorder_set_beauty_algorithm"

    const/4 v2, 0x1

    invoke-static {v1, v2, v0}, Lcom/ss/android/ttve/monitor/MonitorUtils;->monitorStatistics(Ljava/lang/String;ILcom/ss/android/vesdk/keyvaluepair/VEKeyValue;)V

    .line 314
    iget-object v0, p0, Lcom/ss/android/vesdk/TERecorder;->mRecorder:Lcom/ss/android/vesdk/IRecorder;

    invoke-interface {v0, p1, p2}, Lcom/ss/android/vesdk/IRecorder;->setBeautyFace(ILjava/lang/String;)I

    move-result p1

    return p1
.end method

.method public setBeautyFaceIntensity(FF)I
    .locals 4

    .line 325
    new-instance v0, Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;

    invoke-direct {v0}, Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;-><init>()V

    .line 326
    const-string v1, "iesve_verecorder_set_beauty_level"

    invoke-virtual {v0, v1, p1}, Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;->add(Ljava/lang/String;F)Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;

    move-result-object v1

    const-string v2, "old"

    .line 327
    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;->add(Ljava/lang/String;I)Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;

    .line 328
    const-string v1, "iesve_verecorder_set_beauty_level"

    const/4 v2, 0x1

    invoke-static {v1, v2, v0}, Lcom/ss/android/ttve/monitor/MonitorUtils;->monitorStatistics(Ljava/lang/String;ILcom/ss/android/vesdk/keyvaluepair/VEKeyValue;)V

    .line 329
    iget-object v0, p0, Lcom/ss/android/vesdk/TERecorder;->mRecorder:Lcom/ss/android/vesdk/IRecorder;

    invoke-interface {v0, p1, p2}, Lcom/ss/android/vesdk/IRecorder;->setBeautyFaceIntensity(FF)I

    move-result p1

    return p1
.end method

.method public setDeviceRotation([F)I
    .locals 1

    .line 370
    iget-object v0, p0, Lcom/ss/android/vesdk/TERecorder;->mRecorder:Lcom/ss/android/vesdk/IRecorder;

    invoke-interface {v0, p1}, Lcom/ss/android/vesdk/IRecorder;->setDeviceRotation([F)I

    move-result p1

    return p1
.end method

.method public setFaceReshape(Ljava/lang/String;FF)I
    .locals 4

    .line 341
    new-instance v0, Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;

    invoke-direct {v0}, Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;-><init>()V

    .line 342
    const-string v1, "iesve_verecorder_set_bigeyes_smallface_level"

    invoke-virtual {v0, v1, p2}, Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;->add(Ljava/lang/String;F)Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;

    move-result-object v1

    const-string v2, "old"

    .line 343
    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;->add(Ljava/lang/String;I)Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;

    .line 344
    const-string v1, "iesve_verecorder_set_bigeyes_smallface"

    const/4 v2, 0x1

    invoke-static {v1, v2, v0}, Lcom/ss/android/ttve/monitor/MonitorUtils;->monitorStatistics(Ljava/lang/String;ILcom/ss/android/vesdk/keyvaluepair/VEKeyValue;)V

    .line 345
    iget-object v0, p0, Lcom/ss/android/vesdk/TERecorder;->mRecorder:Lcom/ss/android/vesdk/IRecorder;

    invoke-interface {v0, p1, p2, p3}, Lcom/ss/android/vesdk/IRecorder;->setFaceReshape(Ljava/lang/String;FF)I

    move-result p1

    return p1
.end method

.method public setFilter(Ljava/lang/String;F)I
    .locals 4

    .line 273
    new-instance v0, Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;

    invoke-direct {v0}, Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;-><init>()V

    .line 274
    const-string v1, "iesve_verecorder_set_filter_click_idfilter_id"

    invoke-static {p1}, Lcom/ss/android/utils/StringUtils;->parsePathSimpleName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;->add(Ljava/lang/String;Ljava/lang/String;)Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;

    move-result-object v1

    const-string v2, "old"

    .line 275
    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;->add(Ljava/lang/String;I)Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;

    .line 276
    const-string v1, "iesve_verecorder_set_filter_click"

    const/4 v2, 0x1

    invoke-static {v1, v2, v0}, Lcom/ss/android/ttve/monitor/MonitorUtils;->monitorStatistics(Ljava/lang/String;ILcom/ss/android/vesdk/keyvaluepair/VEKeyValue;)V

    .line 277
    iget-object v0, p0, Lcom/ss/android/vesdk/TERecorder;->mRecorder:Lcom/ss/android/vesdk/IRecorder;

    invoke-interface {v0, p1, p2}, Lcom/ss/android/vesdk/IRecorder;->setFilter(Ljava/lang/String;F)I

    move-result p1

    return p1
.end method

.method public setFilter(Ljava/lang/String;Ljava/lang/String;F)I
    .locals 4

    .line 289
    new-instance v0, Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;

    invoke-direct {v0}, Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;-><init>()V

    .line 290
    const-string v1, "iesve_verecorder_set_filter_slide_left_id"

    invoke-static {p1}, Lcom/ss/android/utils/StringUtils;->parsePathSimpleName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;->add(Ljava/lang/String;Ljava/lang/String;)Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;

    move-result-object v1

    const-string v2, "iesve_verecorder_set_filter_slide_right_id"

    .line 291
    invoke-static {p2}, Lcom/ss/android/utils/StringUtils;->parsePathSimpleName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;->add(Ljava/lang/String;Ljava/lang/String;)Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;

    move-result-object v1

    const-string v2, "old"

    .line 292
    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;->add(Ljava/lang/String;I)Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;

    .line 293
    const-string v1, "iesve_verecorder_set_filter_slide"

    const/4 v2, 0x1

    invoke-static {v1, v2, v0}, Lcom/ss/android/ttve/monitor/MonitorUtils;->monitorStatistics(Ljava/lang/String;ILcom/ss/android/vesdk/keyvaluepair/VEKeyValue;)V

    .line 294
    iget-object v0, p0, Lcom/ss/android/vesdk/TERecorder;->mRecorder:Lcom/ss/android/vesdk/IRecorder;

    invoke-interface {v0, p1, p2, p3}, Lcom/ss/android/vesdk/IRecorder;->setFilter(Ljava/lang/String;Ljava/lang/String;F)I

    move-result p1

    return p1
.end method

.method public setNativeInitListener(Lcom/ss/android/medialib/listener/NativeInitListener;)V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 86
    iget-object v0, p0, Lcom/ss/android/vesdk/TERecorder;->mRecorder:Lcom/ss/android/vesdk/IRecorder;

    invoke-interface {v0, p1}, Lcom/ss/android/vesdk/IRecorder;->setNativeInitListener(Lcom/ss/android/medialib/listener/NativeInitListener;)V

    .line 87
    return-void
.end method

.method public setRecordBGM(Ljava/lang/String;III)I
    .locals 1

    .line 154
    iget-object v0, p0, Lcom/ss/android/vesdk/TERecorder;->mRecorder:Lcom/ss/android/vesdk/IRecorder;

    invoke-interface {v0, p1, p2, p3, p4}, Lcom/ss/android/vesdk/IRecorder;->setRecordBGM(Ljava/lang/String;III)I

    move-result p1

    return p1
.end method

.method public setRecrodStateCallback(Lcom/ss/android/vesdk/VEListener$VERecorderStateListener;)V
    .locals 1

    .line 77
    iget-object v0, p0, Lcom/ss/android/vesdk/TERecorder;->mRecorder:Lcom/ss/android/vesdk/IRecorder;

    invoke-interface {v0, p1}, Lcom/ss/android/vesdk/IRecorder;->setRecordStateCallback(Lcom/ss/android/vesdk/VEListener$VERecorderStateListener;)V

    .line 78
    return-void
.end method

.method public setRenderCallback(Lcom/ss/android/vesdk/IRenderCallback;)V
    .locals 1

    .line 69
    iget-object v0, p0, Lcom/ss/android/vesdk/TERecorder;->mRecorder:Lcom/ss/android/vesdk/IRecorder;

    invoke-interface {v0, p1}, Lcom/ss/android/vesdk/IRecorder;->setRenderCallback(Lcom/ss/android/vesdk/IRenderCallback;)V

    .line 70
    return-void
.end method

.method public setSlamFace(Landroid/graphics/Bitmap;)I
    .locals 1

    .line 542
    iget-object v0, p0, Lcom/ss/android/vesdk/TERecorder;->mRecorder:Lcom/ss/android/vesdk/IRecorder;

    invoke-interface {v0, p1}, Lcom/ss/android/vesdk/IRecorder;->setSlamFace(Landroid/graphics/Bitmap;)I

    move-result p1

    return p1
.end method

.method public setUseLargeMattingModel(Z)I
    .locals 1

    .line 569
    iget-object v0, p0, Lcom/ss/android/vesdk/TERecorder;->mRecorder:Lcom/ss/android/vesdk/IRecorder;

    invoke-interface {v0, p1}, Lcom/ss/android/vesdk/IRecorder;->setUseLargeMattingModel(Z)I

    move-result p1

    return p1
.end method

.method public slamDeviceConfig(ZIZZZZLjava/lang/String;)I
    .locals 8

    .line 406
    iget-object v0, p0, Lcom/ss/android/vesdk/TERecorder;->mRecorder:Lcom/ss/android/vesdk/IRecorder;

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    move v6, p6

    move-object v7, p7

    invoke-interface/range {v0 .. v7}, Lcom/ss/android/vesdk/IRecorder;->slamDeviceConfig(ZIZZZZLjava/lang/String;)I

    move-result p1

    return p1
.end method

.method public slamProcessIngestAcc(DDDD)I
    .locals 9

    .line 418
    move-object v0, p0

    iget-object v0, v0, Lcom/ss/android/vesdk/TERecorder;->mRecorder:Lcom/ss/android/vesdk/IRecorder;

    move-wide v1, p1

    move-wide v3, p3

    move-wide v5, p5

    move-wide/from16 v7, p7

    invoke-interface/range {v0 .. v8}, Lcom/ss/android/vesdk/IRecorder;->slamProcessIngestAcc(DDDD)I

    move-result v0

    return v0
.end method

.method public slamProcessIngestGra(DDDD)I
    .locals 9

    .line 443
    move-object v0, p0

    iget-object v0, v0, Lcom/ss/android/vesdk/TERecorder;->mRecorder:Lcom/ss/android/vesdk/IRecorder;

    move-wide v1, p1

    move-wide v3, p3

    move-wide v5, p5

    move-wide/from16 v7, p7

    invoke-interface/range {v0 .. v8}, Lcom/ss/android/vesdk/IRecorder;->slamProcessIngestGra(DDDD)I

    move-result v0

    return v0
.end method

.method public slamProcessIngestGyr(DDDD)I
    .locals 9

    .line 430
    move-object v0, p0

    iget-object v0, v0, Lcom/ss/android/vesdk/TERecorder;->mRecorder:Lcom/ss/android/vesdk/IRecorder;

    move-wide v1, p1

    move-wide v3, p3

    move-wide v5, p5

    move-wide/from16 v7, p7

    invoke-interface/range {v0 .. v8}, Lcom/ss/android/vesdk/IRecorder;->slamProcessIngestGyr(DDDD)I

    move-result v0

    return v0
.end method

.method public slamProcessIngestOri([DD)I
    .locals 1

    .line 453
    iget-object v0, p0, Lcom/ss/android/vesdk/TERecorder;->mRecorder:Lcom/ss/android/vesdk/IRecorder;

    invoke-interface {v0, p1, p2, p3}, Lcom/ss/android/vesdk/IRecorder;->slamProcessIngestOri([DD)I

    move-result p1

    return p1
.end method

.method public slamProcessPanEvent(FFFFF)I
    .locals 6

    .line 513
    iget-object v0, p0, Lcom/ss/android/vesdk/TERecorder;->mRecorder:Lcom/ss/android/vesdk/IRecorder;

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    invoke-interface/range {v0 .. v5}, Lcom/ss/android/vesdk/IRecorder;->slamProcessPanEvent(FFFFF)I

    move-result p1

    return p1
.end method

.method public slamProcessRotationEvent(FF)I
    .locals 1

    .line 533
    iget-object v0, p0, Lcom/ss/android/vesdk/TERecorder;->mRecorder:Lcom/ss/android/vesdk/IRecorder;

    invoke-interface {v0, p1, p2}, Lcom/ss/android/vesdk/IRecorder;->slamProcessRotationEvent(FF)I

    move-result p1

    return p1
.end method

.method public slamProcessScaleEvent(FF)I
    .locals 1

    .line 523
    iget-object v0, p0, Lcom/ss/android/vesdk/TERecorder;->mRecorder:Lcom/ss/android/vesdk/IRecorder;

    invoke-interface {v0, p1, p2}, Lcom/ss/android/vesdk/IRecorder;->slamProcessScaleEvent(FF)I

    move-result p1

    return p1
.end method

.method public slamProcessTouchEvent(FF)I
    .locals 1

    .line 464
    iget-object v0, p0, Lcom/ss/android/vesdk/TERecorder;->mRecorder:Lcom/ss/android/vesdk/IRecorder;

    invoke-interface {v0, p1, p2}, Lcom/ss/android/vesdk/IRecorder;->slamProcessTouchEvent(FF)I

    move-result p1

    return p1
.end method

.method public slamProcessTouchEventByType(IFFI)I
    .locals 1

    .line 499
    iget-object v0, p0, Lcom/ss/android/vesdk/TERecorder;->mRecorder:Lcom/ss/android/vesdk/IRecorder;

    invoke-interface {v0, p1, p2, p3, p4}, Lcom/ss/android/vesdk/IRecorder;->slamProcessTouchEventByType(IFFI)I

    move-result p1

    return p1
.end method

.method public startPreview(Landroid/view/Surface;)I
    .locals 1

    .line 120
    iget-object v0, p0, Lcom/ss/android/vesdk/TERecorder;->mRecorder:Lcom/ss/android/vesdk/IRecorder;

    invoke-interface {v0, p1}, Lcom/ss/android/vesdk/IRecorder;->startPreview(Landroid/view/Surface;)I

    move-result p1

    return p1
.end method

.method public startRecord(F)I
    .locals 3

    .line 164
    iget-object v0, p0, Lcom/ss/android/vesdk/TERecorder;->mResManager:Lcom/ss/android/vesdk/runtime/VERecorderResManager;

    iget v1, p0, Lcom/ss/android/vesdk/TERecorder;->mRecordCount:I

    invoke-virtual {v0, v1}, Lcom/ss/android/vesdk/runtime/VERecorderResManager;->genSegmentVideoPath(I)Ljava/lang/String;

    move-result-object v0

    .line 165
    iget-object v1, p0, Lcom/ss/android/vesdk/TERecorder;->mResManager:Lcom/ss/android/vesdk/runtime/VERecorderResManager;

    iget v2, p0, Lcom/ss/android/vesdk/TERecorder;->mRecordCount:I

    invoke-virtual {v1, v2}, Lcom/ss/android/vesdk/runtime/VERecorderResManager;->genSegmentAudioPath(I)Ljava/lang/String;

    move-result-object v1

    .line 166
    iget v2, p0, Lcom/ss/android/vesdk/TERecorder;->mRecordCount:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/ss/android/vesdk/TERecorder;->mRecordCount:I

    .line 168
    iget-object v2, p0, Lcom/ss/android/vesdk/TERecorder;->mResManager:Lcom/ss/android/vesdk/runtime/VERecorderResManager;

    invoke-virtual {v2, v1}, Lcom/ss/android/vesdk/runtime/VERecorderResManager;->addSegmentAudioPath(Ljava/lang/String;)V

    .line 169
    iget-object v2, p0, Lcom/ss/android/vesdk/TERecorder;->mResManager:Lcom/ss/android/vesdk/runtime/VERecorderResManager;

    invoke-virtual {v2, v0}, Lcom/ss/android/vesdk/runtime/VERecorderResManager;->addSegmentVideoPath(Ljava/lang/String;)V

    .line 170
    iget-object v2, p0, Lcom/ss/android/vesdk/TERecorder;->mRecorder:Lcom/ss/android/vesdk/IRecorder;

    invoke-interface {v2, v0, v1, p1}, Lcom/ss/android/vesdk/IRecorder;->startRecord(Ljava/lang/String;Ljava/lang/String;F)I

    move-result p1

    return p1
.end method

.method public stopPreview()I
    .locals 1

    .line 138
    iget-object v0, p0, Lcom/ss/android/vesdk/TERecorder;->mRecorder:Lcom/ss/android/vesdk/IRecorder;

    invoke-interface {v0}, Lcom/ss/android/vesdk/IRecorder;->stopPreview()I

    move-result v0

    return v0
.end method

.method public stopRecord()I
    .locals 1

    .line 179
    iget-object v0, p0, Lcom/ss/android/vesdk/TERecorder;->mRecorder:Lcom/ss/android/vesdk/IRecorder;

    invoke-interface {v0}, Lcom/ss/android/vesdk/IRecorder;->stopRecord()I

    move-result v0

    return v0
.end method

.method public switchEffect(Ljava/lang/String;)I
    .locals 4

    .line 355
    new-instance v0, Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;

    invoke-direct {v0}, Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;-><init>()V

    .line 356
    invoke-static {p1}, Lcom/ss/android/utils/StringUtils;->parsePathSimpleName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 357
    const-string v2, "iesve_verecorder_set_sticker_id"

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_0

    const-string v1, "0"

    :cond_0
    invoke-virtual {v0, v2, v1}, Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;->add(Ljava/lang/String;Ljava/lang/String;)Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;

    move-result-object v1

    const-string v2, "old"

    const/4 v3, 0x0

    .line 358
    invoke-virtual {v1, v2, v3}, Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;->add(Ljava/lang/String;I)Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;

    .line 359
    const-string v1, "iesve_verecorder_set_sticker"

    const/4 v2, 0x1

    invoke-static {v1, v2, v0}, Lcom/ss/android/ttve/monitor/MonitorUtils;->monitorStatistics(Ljava/lang/String;ILcom/ss/android/vesdk/keyvaluepair/VEKeyValue;)V

    .line 360
    iget-object v0, p0, Lcom/ss/android/vesdk/TERecorder;->mRecorder:Lcom/ss/android/vesdk/IRecorder;

    invoke-interface {v0, p1}, Lcom/ss/android/vesdk/IRecorder;->switchEffect(Ljava/lang/String;)I

    move-result p1

    return p1
.end method

.method public tryRestore()I
    .locals 1

    .line 251
    iget-object v0, p0, Lcom/ss/android/vesdk/TERecorder;->mRecorder:Lcom/ss/android/vesdk/IRecorder;

    invoke-interface {v0}, Lcom/ss/android/vesdk/IRecorder;->tryRestore()I

    move-result v0

    return v0
.end method

.method public updatePreviewSettings(Lcom/ss/android/vesdk/VEPreviewSettings;)V
    .locals 1

    .line 129
    iput-object p1, p0, Lcom/ss/android/vesdk/TERecorder;->mPreviewSettings:Lcom/ss/android/vesdk/VEPreviewSettings;

    .line 130
    iget-object v0, p0, Lcom/ss/android/vesdk/TERecorder;->mRecorder:Lcom/ss/android/vesdk/IRecorder;

    invoke-interface {v0, p1}, Lcom/ss/android/vesdk/IRecorder;->updatePreviewSettings(Lcom/ss/android/vesdk/VEPreviewSettings;)I

    .line 131
    return-void
.end method

.method public updateRotation(FFF)I
    .locals 1

    .line 573
    iget-object v0, p0, Lcom/ss/android/vesdk/TERecorder;->mRecorder:Lcom/ss/android/vesdk/IRecorder;

    invoke-interface {v0, p1, p2, p3}, Lcom/ss/android/vesdk/IRecorder;->updateRotation(FFF)I

    move-result p1

    return p1
.end method
