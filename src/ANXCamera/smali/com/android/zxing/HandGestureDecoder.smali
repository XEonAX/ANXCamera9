.class public Lcom/android/zxing/HandGestureDecoder;
.super Lcom/android/zxing/Decoder;
.source "HandGestureDecoder.java"


# static fields
.field public static final TAG:Ljava/lang/String; = "HandGestureDecoder"


# instance fields
.field mCameraId:I

.field mHandGesture:Lcom/android/camera/handgesture/HandGesture;

.field mTriggeringPhoto:Z


# direct methods
.method constructor <init>()V
    .locals 1

    .line 26
    invoke-direct {p0}, Lcom/android/zxing/Decoder;-><init>()V

    .line 24
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/zxing/HandGestureDecoder;->mTriggeringPhoto:Z

    .line 27
    new-instance v0, Lcom/android/camera/handgesture/HandGesture;

    invoke-direct {v0}, Lcom/android/camera/handgesture/HandGesture;-><init>()V

    iput-object v0, p0, Lcom/android/zxing/HandGestureDecoder;->mHandGesture:Lcom/android/camera/handgesture/HandGesture;

    .line 28
    const/16 v0, 0x12c

    sput v0, Lcom/android/zxing/HandGestureDecoder;->DECODE_MAX_COUNT:I

    .line 29
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/zxing/HandGestureDecoder;->mEnable:Z

    .line 30
    return-void
.end method


# virtual methods
.method protected decode([BIII)Ljava/lang/Boolean;
    .locals 2

    .line 86
    iget v0, p0, Lcom/android/zxing/HandGestureDecoder;->mCameraId:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 87
    rsub-int p4, p4, 0x10e

    goto :goto_0

    .line 89
    :cond_0
    const/16 v0, 0x5a

    add-int/2addr v0, p4

    rem-int/lit16 p4, v0, 0x168

    .line 91
    :goto_0
    iget-object v0, p0, Lcom/android/zxing/HandGestureDecoder;->mHandGesture:Lcom/android/camera/handgesture/HandGesture;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/android/camera/handgesture/HandGesture;->detectGesture([BIII)I

    move-result p1

    if-lez p1, :cond_1

    goto :goto_1

    :cond_1
    const/4 v1, 0x0

    :goto_1
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1
.end method

.method public needPreviewFrame()Z
    .locals 1

    .line 34
    invoke-super {p0}, Lcom/android/zxing/Decoder;->needPreviewFrame()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/android/camera/CameraSettings;->isHangGestureOpen()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public reConfig(I)V
    .locals 1

    .line 39
    iget-object v0, p0, Lcom/android/zxing/HandGestureDecoder;->mHandGesture:Lcom/android/camera/handgesture/HandGesture;

    invoke-virtual {v0}, Lcom/android/camera/handgesture/HandGesture;->unInit()V

    .line 40
    iget-object v0, p0, Lcom/android/zxing/HandGestureDecoder;->mHandGesture:Lcom/android/camera/handgesture/HandGesture;

    invoke-virtual {v0, p1}, Lcom/android/camera/handgesture/HandGesture;->init(I)V

    .line 41
    iput p1, p0, Lcom/android/zxing/HandGestureDecoder;->mCameraId:I

    .line 42
    return-void
.end method

.method public reset()V
    .locals 2

    .line 95
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/zxing/HandGestureDecoder;->mTriggeringPhoto:Z

    .line 96
    iget-object v1, p0, Lcom/android/zxing/HandGestureDecoder;->mDecodingCount:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v1, v0}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 97
    return-void
.end method

.method public startDecode()V
    .locals 3

    .line 46
    new-instance v0, Lcom/android/zxing/HandGestureDecoder$4;

    invoke-direct {v0, p0}, Lcom/android/zxing/HandGestureDecoder$4;-><init>(Lcom/android/zxing/HandGestureDecoder;)V

    sget-object v1, Lio/reactivex/BackpressureStrategy;->DROP:Lio/reactivex/BackpressureStrategy;

    invoke-static {v0, v1}, Lio/reactivex/Flowable;->create(Lio/reactivex/FlowableOnSubscribe;Lio/reactivex/BackpressureStrategy;)Lio/reactivex/Flowable;

    move-result-object v0

    new-instance v1, Lcom/android/zxing/HandGestureDecoder$3;

    invoke-direct {v1, p0}, Lcom/android/zxing/HandGestureDecoder$3;-><init>(Lcom/android/zxing/HandGestureDecoder;)V

    .line 52
    invoke-virtual {v0, v1}, Lio/reactivex/Flowable;->map(Lio/reactivex/functions/Function;)Lio/reactivex/Flowable;

    move-result-object v0

    .line 60
    invoke-static {}, Lio/reactivex/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/reactivex/Flowable;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Flowable;

    move-result-object v0

    new-instance v1, Lcom/android/zxing/HandGestureDecoder$1;

    invoke-direct {v1, p0}, Lcom/android/zxing/HandGestureDecoder$1;-><init>(Lcom/android/zxing/HandGestureDecoder;)V

    new-instance v2, Lcom/android/zxing/HandGestureDecoder$2;

    invoke-direct {v2, p0}, Lcom/android/zxing/HandGestureDecoder$2;-><init>(Lcom/android/zxing/HandGestureDecoder;)V

    .line 61
    invoke-virtual {v0, v1, v2}, Lio/reactivex/Flowable;->subscribe(Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;

    move-result-object v0

    iput-object v0, p0, Lcom/android/zxing/HandGestureDecoder;->mDecodeDisposable:Lio/reactivex/disposables/Disposable;

    .line 80
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/zxing/HandGestureDecoder;->mDecoding:Z

    .line 81
    iget-object v0, p0, Lcom/android/zxing/HandGestureDecoder;->mDecodingCount:Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 82
    return-void
.end method
