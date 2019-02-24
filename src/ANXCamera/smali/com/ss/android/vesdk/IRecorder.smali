.class public interface abstract Lcom/ss/android/vesdk/IRecorder;
.super Ljava/lang/Object;
.source "IRecorder.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ss/android/vesdk/IRecorder$OnConcatFinishedListener;
    }
.end annotation


# virtual methods
.method public abstract chooseSlamFace(I)V
.end method

.method public abstract clearEnv()V
.end method

.method public abstract concat(Ljava/lang/String;Ljava/lang/String;)I
.end method

.method public abstract concatAsync(Ljava/lang/String;Ljava/lang/String;Lcom/ss/android/vesdk/IRecorder$OnConcatFinishedListener;)V
.end method

.method public abstract deleteLastFrag()V
.end method

.method public abstract destroy()V
.end method

.method public abstract enableTTFaceDetect(Z)I
.end method

.method public abstract getEndFrameTime()J
.end method

.method public abstract getSegmentInfo()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/ss/android/medialib/model/TimeSpeedModel;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getSlamFaceCount()I
.end method

.method public abstract init(Lcom/ss/android/vesdk/VEVideoEncodeSettings;Lcom/ss/android/vesdk/VEAudioEncodeSettings;Lcom/ss/android/vesdk/VEPreviewSettings;Ljava/lang/String;Ljava/lang/String;)I
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
.end method

.method public abstract pauseEffectAudio(Z)I
.end method

.method public abstract processTouchEvent(FF)I
.end method

.method public abstract setBeautyFace(ILjava/lang/String;)I
.end method

.method public abstract setBeautyFaceIntensity(FF)I
.end method

.method public abstract setDeviceRotation([F)I
.end method

.method public abstract setFaceReshape(Ljava/lang/String;FF)I
.end method

.method public abstract setFilter(Ljava/lang/String;F)I
.end method

.method public abstract setFilter(Ljava/lang/String;Ljava/lang/String;F)I
.end method

.method public abstract setNativeInitListener(Lcom/ss/android/medialib/listener/NativeInitListener;)V
.end method

.method public abstract setRecordBGM(Ljava/lang/String;III)I
.end method

.method public abstract setRecordStateCallback(Lcom/ss/android/vesdk/VEListener$VERecorderStateListener;)V
.end method

.method public abstract setRenderCallback(Lcom/ss/android/vesdk/IRenderCallback;)V
.end method

.method public abstract setSlamFace(Landroid/graphics/Bitmap;)I
.end method

.method public abstract setUseLargeMattingModel(Z)I
.end method

.method public abstract slamDeviceConfig(ZIZZZZLjava/lang/String;)I
.end method

.method public abstract slamProcessIngestAcc(DDDD)I
.end method

.method public abstract slamProcessIngestGra(DDDD)I
.end method

.method public abstract slamProcessIngestGyr(DDDD)I
.end method

.method public abstract slamProcessIngestOri([DD)I
.end method

.method public abstract slamProcessPanEvent(FFFFF)I
.end method

.method public abstract slamProcessRotationEvent(FF)I
.end method

.method public abstract slamProcessScaleEvent(FF)I
.end method

.method public abstract slamProcessTouchEvent(FF)I
.end method

.method public abstract slamProcessTouchEventByType(IFFI)I
.end method

.method public abstract startPreview(Landroid/view/Surface;)I
.end method

.method public abstract startRecord(Ljava/lang/String;Ljava/lang/String;F)I
.end method

.method public abstract stopPreview()I
.end method

.method public abstract stopRecord()I
.end method

.method public abstract switchEffect(Ljava/lang/String;)I
.end method

.method public abstract tryRestore()I
.end method

.method public abstract updatePreviewSettings(Lcom/ss/android/vesdk/VEPreviewSettings;)I
.end method

.method public abstract updateRotation(FFF)I
.end method
