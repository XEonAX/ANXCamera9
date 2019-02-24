.class public Lcom/android/camera/module/loader/FunctionParseAsdFace;
.super Ljava/lang/Object;
.source "FunctionParseAsdFace.java"

# interfaces
.implements Lio/reactivex/functions/Function;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lio/reactivex/functions/Function<",
        "Landroid/hardware/camera2/CaptureResult;",
        "Landroid/hardware/camera2/CaptureResult;",
        ">;"
    }
.end annotation


# instance fields
.field private mFaceCallbackReference:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/android/camera2/Camera2Proxy$FaceDetectionCallback;",
            ">;"
        }
    .end annotation
.end field

.field private mFaceInfo:Lcom/android/camera/effect/FaceAnalyzeInfo;

.field private mNeedFaceInfo:Z


# direct methods
.method public constructor <init>(Lcom/android/camera2/Camera2Proxy$FaceDetectionCallback;Z)V
    .locals 1

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/android/camera/module/loader/FunctionParseAsdFace;->mFaceCallbackReference:Ljava/lang/ref/WeakReference;

    .line 24
    iput-boolean p2, p0, Lcom/android/camera/module/loader/FunctionParseAsdFace;->mNeedFaceInfo:Z

    .line 25
    return-void
.end method


# virtual methods
.method public apply(Landroid/hardware/camera2/CaptureResult;)Landroid/hardware/camera2/CaptureResult;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 29
    iget-object v0, p0, Lcom/android/camera/module/loader/FunctionParseAsdFace;->mFaceCallbackReference:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera2/Camera2Proxy$FaceDetectionCallback;

    .line 30
    if-nez v0, :cond_0

    .line 31
    return-object p1

    .line 34
    :cond_0
    invoke-interface {v0}, Lcom/android/camera2/Camera2Proxy$FaceDetectionCallback;->isFaceDetectStarted()Z

    move-result v1

    if-nez v1, :cond_1

    .line 35
    return-object p1

    .line 38
    :cond_1
    sget-object v1, Landroid/hardware/camera2/CaptureResult;->STATISTICS_FACES:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {p1, v1}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Landroid/hardware/camera2/params/Face;

    .line 39
    if-nez v1, :cond_2

    .line 40
    return-object p1

    .line 43
    :cond_2
    invoke-interface {v0}, Lcom/android/camera2/Camera2Proxy$FaceDetectionCallback;->isUseFaceInfo()Z

    move-result v2

    .line 44
    iget-boolean v3, p0, Lcom/android/camera/module/loader/FunctionParseAsdFace;->mNeedFaceInfo:Z

    if-eqz v3, :cond_4

    if-eqz v2, :cond_4

    .line 45
    iget-object v3, p0, Lcom/android/camera/module/loader/FunctionParseAsdFace;->mFaceInfo:Lcom/android/camera/effect/FaceAnalyzeInfo;

    if-nez v3, :cond_3

    .line 46
    new-instance v3, Lcom/android/camera/effect/FaceAnalyzeInfo;

    invoke-direct {v3}, Lcom/android/camera/effect/FaceAnalyzeInfo;-><init>()V

    iput-object v3, p0, Lcom/android/camera/module/loader/FunctionParseAsdFace;->mFaceInfo:Lcom/android/camera/effect/FaceAnalyzeInfo;

    .line 49
    :cond_3
    iget-object v3, p0, Lcom/android/camera/module/loader/FunctionParseAsdFace;->mFaceInfo:Lcom/android/camera/effect/FaceAnalyzeInfo;

    sget-object v4, Lcom/android/camera/constant/MiCaptureResult;->STATISTICS_FACE_AGE:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {p1, v4}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [F

    iput-object v4, v3, Lcom/android/camera/effect/FaceAnalyzeInfo;->mAge:[F

    .line 50
    iget-object v3, p0, Lcom/android/camera/module/loader/FunctionParseAsdFace;->mFaceInfo:Lcom/android/camera/effect/FaceAnalyzeInfo;

    sget-object v4, Lcom/android/camera/constant/MiCaptureResult;->STATISTICS_FACE_GENDER:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {p1, v4}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [F

    iput-object v4, v3, Lcom/android/camera/effect/FaceAnalyzeInfo;->mGender:[F

    .line 51
    iget-object v3, p0, Lcom/android/camera/module/loader/FunctionParseAsdFace;->mFaceInfo:Lcom/android/camera/effect/FaceAnalyzeInfo;

    sget-object v4, Lcom/android/camera/constant/MiCaptureResult;->STATISTICS_FACE_FACESCORE:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {p1, v4}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [F

    iput-object v4, v3, Lcom/android/camera/effect/FaceAnalyzeInfo;->mFaceScore:[F

    .line 52
    iget-object v3, p0, Lcom/android/camera/module/loader/FunctionParseAsdFace;->mFaceInfo:Lcom/android/camera/effect/FaceAnalyzeInfo;

    sget-object v4, Lcom/android/camera/constant/MiCaptureResult;->STATISTICS_FACE_PROP:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {p1, v4}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [F

    iput-object v4, v3, Lcom/android/camera/effect/FaceAnalyzeInfo;->mProp:[F

    .line 57
    :cond_4
    iget-boolean v3, p0, Lcom/android/camera/module/loader/FunctionParseAsdFace;->mNeedFaceInfo:Z

    if-eqz v3, :cond_5

    if-eqz v2, :cond_5

    array-length v2, v1

    if-lez v2, :cond_5

    iget-object v2, p0, Lcom/android/camera/module/loader/FunctionParseAsdFace;->mFaceInfo:Lcom/android/camera/effect/FaceAnalyzeInfo;

    iget-object v2, v2, Lcom/android/camera/effect/FaceAnalyzeInfo;->mAge:[F

    if-eqz v2, :cond_5

    iget-object v2, p0, Lcom/android/camera/module/loader/FunctionParseAsdFace;->mFaceInfo:Lcom/android/camera/effect/FaceAnalyzeInfo;

    iget-object v2, v2, Lcom/android/camera/effect/FaceAnalyzeInfo;->mFaceScore:[F

    if-eqz v2, :cond_5

    .line 59
    iget-object v2, p0, Lcom/android/camera/module/loader/FunctionParseAsdFace;->mFaceInfo:Lcom/android/camera/effect/FaceAnalyzeInfo;

    invoke-static {v1, v2}, Lcom/android/camera2/CameraHardwareFace;->convertExCameraHardwareFace([Landroid/hardware/camera2/params/Face;Lcom/android/camera/effect/FaceAnalyzeInfo;)[Lcom/android/camera2/CameraHardwareFace;

    move-result-object v1

    goto :goto_0

    .line 61
    :cond_5
    invoke-static {v1}, Lcom/android/camera2/CameraHardwareFace;->convertCameraHardwareFace([Landroid/hardware/camera2/params/Face;)[Lcom/android/camera2/CameraHardwareFace;

    move-result-object v1

    .line 64
    :goto_0
    iget-object v2, p0, Lcom/android/camera/module/loader/FunctionParseAsdFace;->mFaceInfo:Lcom/android/camera/effect/FaceAnalyzeInfo;

    invoke-interface {v0, v1, v2}, Lcom/android/camera2/Camera2Proxy$FaceDetectionCallback;->onFaceDetected([Lcom/android/camera2/CameraHardwareFace;Lcom/android/camera/effect/FaceAnalyzeInfo;)V

    .line 66
    return-object p1
.end method

.method public bridge synthetic apply(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 15
    check-cast p1, Landroid/hardware/camera2/CaptureResult;

    invoke-virtual {p0, p1}, Lcom/android/camera/module/loader/FunctionParseAsdFace;->apply(Landroid/hardware/camera2/CaptureResult;)Landroid/hardware/camera2/CaptureResult;

    move-result-object p1

    return-object p1
.end method
