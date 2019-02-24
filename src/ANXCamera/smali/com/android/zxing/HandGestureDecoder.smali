.class public Lcom/android/zxing/HandGestureDecoder;
.super Lcom/android/zxing/Decoder;
.source "HandGestureDecoder.java"


# static fields
.field private static DEBUG:Z = false

.field private static DETECTION_FRAMES_PER_SECOND:I = 0x0

.field public static final TAG:Ljava/lang/String; = "HandGestureDecoder"


# instance fields
.field private mCameraId:I

.field private mContinuousInterval:Ljava/util/concurrent/atomic/AtomicInteger;

.field private mHandGesture:Lcom/android/camera/handgesture/HandGesture;

.field private mTargetDetected:Z

.field mTipShowInterval:I

.field private mTipVisible:Z

.field private mTriggeringPhoto:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 37
    const/4 v0, 0x0

    sput-boolean v0, Lcom/android/zxing/HandGestureDecoder;->DEBUG:Z

    .line 38
    const/16 v0, 0x10

    sput v0, Lcom/android/zxing/HandGestureDecoder;->DETECTION_FRAMES_PER_SECOND:I

    return-void
.end method

.method constructor <init>()V
    .locals 3
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "CheckResult"
        }
    .end annotation

    .line 48
    invoke-direct {p0}, Lcom/android/zxing/Decoder;-><init>()V

    .line 39
    sget v0, Lcom/android/zxing/HandGestureDecoder;->DETECTION_FRAMES_PER_SECOND:I

    iput v0, p0, Lcom/android/zxing/HandGestureDecoder;->mTipShowInterval:I

    .line 42
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/zxing/HandGestureDecoder;->mTriggeringPhoto:Z

    .line 43
    iput-boolean v0, p0, Lcom/android/zxing/HandGestureDecoder;->mTargetDetected:Z

    .line 44
    new-instance v1, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v1, v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v1, p0, Lcom/android/zxing/HandGestureDecoder;->mContinuousInterval:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 45
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/zxing/HandGestureDecoder;->mTipVisible:Z

    .line 49
    new-instance v1, Lcom/android/camera/handgesture/HandGesture;

    invoke-direct {v1}, Lcom/android/camera/handgesture/HandGesture;-><init>()V

    iput-object v1, p0, Lcom/android/zxing/HandGestureDecoder;->mHandGesture:Lcom/android/camera/handgesture/HandGesture;

    .line 50
    const/16 v1, 0x1388

    sput v1, Lcom/android/zxing/HandGestureDecoder;->DECODE_MAX_COUNT:I

    .line 51
    sget v1, Lcom/android/zxing/HandGestureDecoder;->DETECTION_FRAMES_PER_SECOND:I

    const/16 v2, 0x3e8

    div-int/2addr v2, v1

    int-to-long v1, v2

    sput-wide v1, Lcom/android/zxing/HandGestureDecoder;->DECODE_AUTO_INTERVAL:J

    .line 52
    iput-boolean v0, p0, Lcom/android/zxing/HandGestureDecoder;->mEnable:Z

    .line 53
    new-instance v0, Lcom/android/zxing/HandGestureDecoder$4;

    invoke-direct {v0, p0}, Lcom/android/zxing/HandGestureDecoder$4;-><init>(Lcom/android/zxing/HandGestureDecoder;)V

    sget-object v1, Lio/reactivex/BackpressureStrategy;->LATEST:Lio/reactivex/BackpressureStrategy;

    invoke-static {v0, v1}, Lio/reactivex/Flowable;->create(Lio/reactivex/FlowableOnSubscribe;Lio/reactivex/BackpressureStrategy;)Lio/reactivex/Flowable;

    move-result-object v0

    .line 59
    invoke-static {}, Lio/reactivex/schedulers/Schedulers;->single()Lio/reactivex/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/reactivex/Flowable;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Flowable;

    move-result-object v0

    new-instance v1, Lcom/android/zxing/HandGestureDecoder$3;

    invoke-direct {v1, p0}, Lcom/android/zxing/HandGestureDecoder$3;-><init>(Lcom/android/zxing/HandGestureDecoder;)V

    .line 60
    invoke-virtual {v0, v1}, Lio/reactivex/Flowable;->map(Lio/reactivex/functions/Function;)Lio/reactivex/Flowable;

    move-result-object v0

    .line 82
    invoke-static {}, Lio/reactivex/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/reactivex/Flowable;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Flowable;

    move-result-object v0

    new-instance v1, Lcom/android/zxing/HandGestureDecoder$1;

    invoke-direct {v1, p0}, Lcom/android/zxing/HandGestureDecoder$1;-><init>(Lcom/android/zxing/HandGestureDecoder;)V

    new-instance v2, Lcom/android/zxing/HandGestureDecoder$2;

    invoke-direct {v2, p0}, Lcom/android/zxing/HandGestureDecoder$2;-><init>(Lcom/android/zxing/HandGestureDecoder;)V

    .line 83
    invoke-virtual {v0, v1, v2}, Lio/reactivex/Flowable;->subscribe(Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;

    .line 134
    return-void
.end method

.method static synthetic access$000(Lcom/android/zxing/HandGestureDecoder;)Z
    .locals 0

    .line 35
    iget-boolean p0, p0, Lcom/android/zxing/HandGestureDecoder;->mTargetDetected:Z

    return p0
.end method

.method static synthetic access$002(Lcom/android/zxing/HandGestureDecoder;Z)Z
    .locals 0

    .line 35
    iput-boolean p1, p0, Lcom/android/zxing/HandGestureDecoder;->mTargetDetected:Z

    return p1
.end method

.method static synthetic access$100(Lcom/android/zxing/HandGestureDecoder;)Ljava/util/concurrent/atomic/AtomicInteger;
    .locals 0

    .line 35
    iget-object p0, p0, Lcom/android/zxing/HandGestureDecoder;->mContinuousInterval:Ljava/util/concurrent/atomic/AtomicInteger;

    return-object p0
.end method

.method static synthetic access$200(Lcom/android/zxing/HandGestureDecoder;)Z
    .locals 0

    .line 35
    iget-boolean p0, p0, Lcom/android/zxing/HandGestureDecoder;->mTriggeringPhoto:Z

    return p0
.end method

.method static synthetic access$202(Lcom/android/zxing/HandGestureDecoder;Z)Z
    .locals 0

    .line 35
    iput-boolean p1, p0, Lcom/android/zxing/HandGestureDecoder;->mTriggeringPhoto:Z

    return p1
.end method

.method static synthetic access$300()I
    .locals 1

    .line 35
    sget v0, Lcom/android/zxing/HandGestureDecoder;->DETECTION_FRAMES_PER_SECOND:I

    return v0
.end method

.method static synthetic access$400(Lcom/android/zxing/HandGestureDecoder;)Z
    .locals 0

    .line 35
    iget-boolean p0, p0, Lcom/android/zxing/HandGestureDecoder;->mTipVisible:Z

    return p0
.end method

.method static synthetic access$402(Lcom/android/zxing/HandGestureDecoder;Z)Z
    .locals 0

    .line 35
    iput-boolean p1, p0, Lcom/android/zxing/HandGestureDecoder;->mTipVisible:Z

    return p1
.end method

.method static synthetic access$500(Lcom/android/zxing/HandGestureDecoder;)Lcom/android/camera/handgesture/HandGesture;
    .locals 0

    .line 35
    iget-object p0, p0, Lcom/android/zxing/HandGestureDecoder;->mHandGesture:Lcom/android/camera/handgesture/HandGesture;

    return-object p0
.end method

.method static synthetic access$600()Z
    .locals 1

    .line 35
    sget-boolean v0, Lcom/android/zxing/HandGestureDecoder;->DEBUG:Z

    return v0
.end method

.method static synthetic access$700(Lcom/android/zxing/HandGestureDecoder;Lcom/android/zxing/PreviewImage;)V
    .locals 0

    .line 35
    invoke-direct {p0, p1}, Lcom/android/zxing/HandGestureDecoder;->dumpPreviewImage(Lcom/android/zxing/PreviewImage;)V

    return-void
.end method

.method private dumpPreviewImage(Lcom/android/zxing/PreviewImage;)V
    .locals 12

    .line 189
    nop

    .line 191
    const/4 v0, 0x0

    :try_start_0
    invoke-virtual {p1}, Lcom/android/zxing/PreviewImage;->getTimestamp()J

    move-result-wide v1

    .line 192
    invoke-virtual {p1}, Lcom/android/zxing/PreviewImage;->getWidth()I

    move-result v9

    .line 193
    invoke-virtual {p1}, Lcom/android/zxing/PreviewImage;->getHeight()I

    move-result v10

    .line 195
    new-instance v11, Ljava/io/FileOutputStream;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lmiui/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v4, "/DCIM/Camera/hand_"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 196
    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, ".jpg"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v11, v3}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 197
    :try_start_1
    const-string v0, "HandGestureDecoder"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "PreviewImage timestamp: ["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, "]"

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 198
    new-instance v0, Landroid/graphics/YuvImage;

    invoke-virtual {p1}, Lcom/android/zxing/PreviewImage;->getData()[B

    move-result-object v4

    const/16 v5, 0x11

    const/4 v8, 0x0

    move-object v3, v0

    move v6, v9

    move v7, v10

    invoke-direct/range {v3 .. v8}, Landroid/graphics/YuvImage;-><init>([BIII[I)V

    .line 199
    new-instance p1, Landroid/graphics/Rect;

    const/4 v1, 0x0

    invoke-direct {p1, v1, v1, v9, v10}, Landroid/graphics/Rect;-><init>(IIII)V

    const/16 v1, 0x64

    invoke-virtual {v0, p1, v1, v11}, Landroid/graphics/YuvImage;->compressToJpeg(Landroid/graphics/Rect;ILjava/io/OutputStream;)Z
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 204
    nop

    .line 205
    :try_start_2
    invoke-virtual {v11}, Ljava/io/FileOutputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_1

    .line 203
    :catchall_0
    move-exception p1

    move-object v0, v11

    goto :goto_3

    .line 200
    :catch_0
    move-exception p1

    move-object v0, v11

    goto :goto_0

    .line 203
    :catchall_1
    move-exception p1

    goto :goto_3

    .line 200
    :catch_1
    move-exception p1

    .line 201
    :goto_0
    :try_start_3
    const-string v1, "HandGestureDecoder"

    const-string v2, "Dump preview Image failed!"

    invoke-static {v1, v2, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 204
    if-eqz v0, :cond_0

    .line 205
    :try_start_4
    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2

    goto :goto_1

    .line 207
    :catch_2
    move-exception p1

    .line 208
    const-string v0, "HandGestureDecoder"

    const-string v1, "Close stream failed!"

    invoke-static {v0, v1, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 210
    goto :goto_2

    .line 209
    :cond_0
    :goto_1
    nop

    .line 211
    :goto_2
    return-void

    .line 203
    :goto_3
    nop

    .line 204
    if-eqz v0, :cond_1

    .line 205
    :try_start_5
    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_3

    goto :goto_4

    .line 207
    :catch_3
    move-exception v0

    .line 208
    const-string v1, "HandGestureDecoder"

    const-string v2, "Close stream failed!"

    invoke-static {v1, v2, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    nop

    .line 209
    :cond_1
    :goto_4
    throw p1
.end method


# virtual methods
.method protected decode(Lcom/android/zxing/PreviewImage;)I
    .locals 4

    .line 156
    invoke-virtual {p1}, Lcom/android/zxing/PreviewImage;->getOrientation()I

    move-result v0

    .line 158
    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x0

    .line 159
    :cond_0
    iget v1, p0, Lcom/android/zxing/HandGestureDecoder;->mCameraId:I

    const/4 v2, 0x1

    if-ne v1, v2, :cond_1

    .line 160
    rsub-int v0, v0, 0x10e

    goto :goto_0

    .line 162
    :cond_1
    const/16 v1, 0x5a

    add-int/2addr v1, v0

    rem-int/lit16 v0, v1, 0x168

    .line 164
    :goto_0
    iget-object v1, p0, Lcom/android/zxing/HandGestureDecoder;->mHandGesture:Lcom/android/camera/handgesture/HandGesture;

    invoke-virtual {p1}, Lcom/android/zxing/PreviewImage;->getData()[B

    move-result-object v2

    invoke-virtual {p1}, Lcom/android/zxing/PreviewImage;->getWidth()I

    move-result v3

    invoke-virtual {p1}, Lcom/android/zxing/PreviewImage;->getHeight()I

    move-result p1

    invoke-virtual {v1, v2, v3, p1, v0}, Lcom/android/camera/handgesture/HandGesture;->detectGesture([BIII)I

    move-result p1

    return p1
.end method

.method public init(I)V
    .locals 3

    .line 143
    invoke-virtual {p0}, Lcom/android/zxing/HandGestureDecoder;->reset()V

    .line 144
    iput p1, p0, Lcom/android/zxing/HandGestureDecoder;->mCameraId:I

    .line 145
    iget-object v0, p0, Lcom/android/zxing/HandGestureDecoder;->mDecodeFlowableEmitter:Lio/reactivex/FlowableEmitter;

    new-instance v1, Lcom/android/zxing/PreviewImage;

    const/4 v2, 0x1

    invoke-direct {v1, v2, p1}, Lcom/android/zxing/PreviewImage;-><init>(II)V

    invoke-interface {v0, v1}, Lio/reactivex/FlowableEmitter;->onNext(Ljava/lang/Object;)V

    .line 146
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object p1

    invoke-virtual {p1, v2}, Lcom/android/camera/data/data/runing/DataItemRunning;->setHandGestureRunning(Z)V

    .line 147
    return-void
.end method

.method public needPreviewFrame()Z
    .locals 1

    .line 138
    invoke-super {p0}, Lcom/android/zxing/Decoder;->needPreviewFrame()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/android/camera/CameraSettings;->isHandGestureOpen()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public onPreviewFrame(Landroid/media/Image;III)V
    .locals 0

    .line 182
    invoke-virtual {p0}, Lcom/android/zxing/HandGestureDecoder;->needPreviewFrame()Z

    move-result p2

    if-eqz p2, :cond_0

    iget-object p2, p0, Lcom/android/zxing/HandGestureDecoder;->mDecodeFlowableEmitter:Lio/reactivex/FlowableEmitter;

    if-eqz p2, :cond_0

    .line 183
    new-instance p2, Lcom/android/zxing/PreviewImage;

    invoke-direct {p2, p1, p4}, Lcom/android/zxing/PreviewImage;-><init>(Landroid/media/Image;I)V

    .line 184
    iget-object p1, p0, Lcom/android/zxing/HandGestureDecoder;->mDecodeFlowableEmitter:Lio/reactivex/FlowableEmitter;

    invoke-interface {p1, p2}, Lio/reactivex/FlowableEmitter;->onNext(Ljava/lang/Object;)V

    .line 186
    :cond_0
    return-void
.end method

.method public quit()V
    .locals 4

    .line 175
    invoke-super {p0}, Lcom/android/zxing/Decoder;->quit()V

    .line 176
    iget-object v0, p0, Lcom/android/zxing/HandGestureDecoder;->mDecodeFlowableEmitter:Lio/reactivex/FlowableEmitter;

    new-instance v1, Lcom/android/zxing/PreviewImage;

    iget v2, p0, Lcom/android/zxing/HandGestureDecoder;->mCameraId:I

    const/4 v3, 0x3

    invoke-direct {v1, v3, v2}, Lcom/android/zxing/PreviewImage;-><init>(II)V

    invoke-interface {v0, v1}, Lio/reactivex/FlowableEmitter;->onNext(Ljava/lang/Object;)V

    .line 177
    iget-object v0, p0, Lcom/android/zxing/HandGestureDecoder;->mDecodeFlowableEmitter:Lio/reactivex/FlowableEmitter;

    invoke-interface {v0}, Lio/reactivex/FlowableEmitter;->onComplete()V

    .line 178
    return-void
.end method

.method public reset()V
    .locals 2

    .line 168
    const-string v0, "HandGestureDecoder"

    const-string v1, "Reset"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 169
    iget-object v0, p0, Lcom/android/zxing/HandGestureDecoder;->mDecodingCount:Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 170
    iput-boolean v1, p0, Lcom/android/zxing/HandGestureDecoder;->mTriggeringPhoto:Z

    .line 171
    return-void
.end method

.method public startDecode()V
    .locals 2

    .line 151
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/zxing/HandGestureDecoder;->mDecoding:Z

    .line 152
    iget-object v0, p0, Lcom/android/zxing/HandGestureDecoder;->mDecodingCount:Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 153
    return-void
.end method
