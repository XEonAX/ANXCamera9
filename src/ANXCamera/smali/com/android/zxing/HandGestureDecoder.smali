.class public Lcom/android/zxing/HandGestureDecoder;
.super Lcom/android/zxing/Decoder;
.source "HandGestureDecoder.java"


# static fields
.field private static DEBUG:Z = false

.field public static final TAG:Ljava/lang/String; = "HandGestureDecoder"


# instance fields
.field mCameraId:I

.field mHandGesture:Lcom/android/camera/handgesture/HandGesture;

.field mTriggeringPhoto:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 32
    const/4 v0, 0x0

    sput-boolean v0, Lcom/android/zxing/HandGestureDecoder;->DEBUG:Z

    return-void
.end method

.method constructor <init>()V
    .locals 3
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "CheckResult"
        }
    .end annotation

    .line 38
    invoke-direct {p0}, Lcom/android/zxing/Decoder;-><init>()V

    .line 35
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/zxing/HandGestureDecoder;->mTriggeringPhoto:Z

    .line 39
    new-instance v0, Lcom/android/camera/handgesture/HandGesture;

    invoke-direct {v0}, Lcom/android/camera/handgesture/HandGesture;-><init>()V

    iput-object v0, p0, Lcom/android/zxing/HandGestureDecoder;->mHandGesture:Lcom/android/camera/handgesture/HandGesture;

    .line 40
    const/16 v0, 0x258

    sput v0, Lcom/android/zxing/HandGestureDecoder;->DECODE_MAX_COUNT:I

    .line 41
    const-wide/16 v0, 0x1f4

    sput-wide v0, Lcom/android/zxing/HandGestureDecoder;->DECODE_AUTO_INTERVAL:J

    .line 42
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/zxing/HandGestureDecoder;->mEnable:Z

    .line 43
    new-instance v0, Lcom/android/zxing/HandGestureDecoder$4;

    invoke-direct {v0, p0}, Lcom/android/zxing/HandGestureDecoder$4;-><init>(Lcom/android/zxing/HandGestureDecoder;)V

    sget-object v1, Lio/reactivex/BackpressureStrategy;->LATEST:Lio/reactivex/BackpressureStrategy;

    invoke-static {v0, v1}, Lio/reactivex/Flowable;->create(Lio/reactivex/FlowableOnSubscribe;Lio/reactivex/BackpressureStrategy;)Lio/reactivex/Flowable;

    move-result-object v0

    .line 49
    invoke-static {}, Lio/reactivex/schedulers/Schedulers;->single()Lio/reactivex/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/reactivex/Flowable;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Flowable;

    move-result-object v0

    new-instance v1, Lcom/android/zxing/HandGestureDecoder$3;

    invoke-direct {v1, p0}, Lcom/android/zxing/HandGestureDecoder$3;-><init>(Lcom/android/zxing/HandGestureDecoder;)V

    .line 50
    invoke-virtual {v0, v1}, Lio/reactivex/Flowable;->map(Lio/reactivex/functions/Function;)Lio/reactivex/Flowable;

    move-result-object v0

    .line 72
    invoke-static {}, Lio/reactivex/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/reactivex/Flowable;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Flowable;

    move-result-object v0

    new-instance v1, Lcom/android/zxing/HandGestureDecoder$1;

    invoke-direct {v1, p0}, Lcom/android/zxing/HandGestureDecoder$1;-><init>(Lcom/android/zxing/HandGestureDecoder;)V

    new-instance v2, Lcom/android/zxing/HandGestureDecoder$2;

    invoke-direct {v2, p0}, Lcom/android/zxing/HandGestureDecoder$2;-><init>(Lcom/android/zxing/HandGestureDecoder;)V

    .line 73
    invoke-virtual {v0, v1, v2}, Lio/reactivex/Flowable;->subscribe(Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;

    .line 92
    return-void
.end method

.method static synthetic access$000()Z
    .locals 1

    .line 30
    sget-boolean v0, Lcom/android/zxing/HandGestureDecoder;->DEBUG:Z

    return v0
.end method

.method static synthetic access$100(Lcom/android/zxing/HandGestureDecoder;Lcom/android/zxing/PreviewImage;)V
    .locals 0

    .line 30
    invoke-direct {p0, p1}, Lcom/android/zxing/HandGestureDecoder;->dumpPreviewImage(Lcom/android/zxing/PreviewImage;)V

    return-void
.end method

.method private dumpPreviewImage(Lcom/android/zxing/PreviewImage;)V
    .locals 12

    .line 144
    nop

    .line 146
    const/4 v0, 0x0

    :try_start_0
    invoke-virtual {p1}, Lcom/android/zxing/PreviewImage;->getTimestamp()J

    move-result-wide v1

    .line 147
    invoke-virtual {p1}, Lcom/android/zxing/PreviewImage;->getWidth()I

    move-result v9

    .line 148
    invoke-virtual {p1}, Lcom/android/zxing/PreviewImage;->getHeight()I

    move-result v10

    .line 150
    new-instance v11, Ljava/io/FileOutputStream;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lmiui/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v4, "/DCIM/Camera/hand_"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 151
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

    .line 152
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

    .line 153
    new-instance v0, Landroid/graphics/YuvImage;

    invoke-virtual {p1}, Lcom/android/zxing/PreviewImage;->getData()[B

    move-result-object v4

    const/16 v5, 0x11

    const/4 v8, 0x0

    move-object v3, v0

    move v6, v9

    move v7, v10

    invoke-direct/range {v3 .. v8}, Landroid/graphics/YuvImage;-><init>([BIII[I)V

    .line 154
    new-instance p1, Landroid/graphics/Rect;

    const/4 v1, 0x0

    invoke-direct {p1, v1, v1, v9, v10}, Landroid/graphics/Rect;-><init>(IIII)V

    const/16 v1, 0x64

    invoke-virtual {v0, p1, v1, v11}, Landroid/graphics/YuvImage;->compressToJpeg(Landroid/graphics/Rect;ILjava/io/OutputStream;)Z
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 159
    nop

    .line 160
    :try_start_2
    invoke-virtual {v11}, Ljava/io/FileOutputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_1

    .line 158
    :catchall_0
    move-exception p1

    move-object v0, v11

    goto :goto_3

    .line 155
    :catch_0
    move-exception p1

    move-object v0, v11

    goto :goto_0

    .line 158
    :catchall_1
    move-exception p1

    goto :goto_3

    .line 155
    :catch_1
    move-exception p1

    .line 156
    :goto_0
    :try_start_3
    const-string v1, "HandGestureDecoder"

    const-string v2, "Dump preview Image failed!"

    invoke-static {v1, v2, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 159
    if-eqz v0, :cond_0

    .line 160
    :try_start_4
    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2

    goto :goto_1

    .line 162
    :catch_2
    move-exception p1

    .line 163
    const-string v0, "HandGestureDecoder"

    const-string v1, "Close stream failed!"

    invoke-static {v0, v1, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 165
    goto :goto_2

    .line 164
    :cond_0
    :goto_1
    nop

    .line 166
    :goto_2
    return-void

    .line 158
    :goto_3
    nop

    .line 159
    if-eqz v0, :cond_1

    .line 160
    :try_start_5
    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_3

    goto :goto_4

    .line 162
    :catch_3
    move-exception v0

    .line 163
    const-string v1, "HandGestureDecoder"

    const-string v2, "Close stream failed!"

    invoke-static {v1, v2, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    nop

    .line 164
    :cond_1
    :goto_4
    throw p1
.end method


# virtual methods
.method protected decode(Lcom/android/zxing/PreviewImage;)Ljava/lang/Boolean;
    .locals 5

    .line 113
    invoke-virtual {p1}, Lcom/android/zxing/PreviewImage;->getOrientation()I

    move-result v0

    .line 115
    iget v1, p0, Lcom/android/zxing/HandGestureDecoder;->mCameraId:I

    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    .line 116
    rsub-int v0, v0, 0x10e

    goto :goto_0

    .line 118
    :cond_0
    const/16 v1, 0x5a

    add-int/2addr v1, v0

    rem-int/lit16 v0, v1, 0x168

    .line 120
    :goto_0
    iget-object v1, p0, Lcom/android/zxing/HandGestureDecoder;->mHandGesture:Lcom/android/camera/handgesture/HandGesture;

    invoke-virtual {p1}, Lcom/android/zxing/PreviewImage;->getData()[B

    move-result-object v3

    invoke-virtual {p1}, Lcom/android/zxing/PreviewImage;->getWidth()I

    move-result v4

    invoke-virtual {p1}, Lcom/android/zxing/PreviewImage;->getHeight()I

    move-result p1

    invoke-virtual {v1, v3, v4, p1, v0}, Lcom/android/camera/handgesture/HandGesture;->detectGesture([BIII)I

    move-result p1

    if-lez p1, :cond_1

    goto :goto_1

    :cond_1
    const/4 v2, 0x0

    :goto_1
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1
.end method

.method public init(I)V
    .locals 3

    .line 101
    invoke-virtual {p0}, Lcom/android/zxing/HandGestureDecoder;->reset()V

    .line 102
    iput p1, p0, Lcom/android/zxing/HandGestureDecoder;->mCameraId:I

    .line 103
    iget-object v0, p0, Lcom/android/zxing/HandGestureDecoder;->mDecodeFlowableEmitter:Lio/reactivex/FlowableEmitter;

    new-instance v1, Lcom/android/zxing/PreviewImage;

    const/4 v2, 0x1

    invoke-direct {v1, v2, p1}, Lcom/android/zxing/PreviewImage;-><init>(II)V

    invoke-interface {v0, v1}, Lio/reactivex/FlowableEmitter;->onNext(Ljava/lang/Object;)V

    .line 104
    return-void
.end method

.method public needPreviewFrame()Z
    .locals 1

    .line 96
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

.method public onPreviewFrame(Landroid/media/Image;III)V
    .locals 0

    .line 137
    invoke-virtual {p0}, Lcom/android/zxing/HandGestureDecoder;->needPreviewFrame()Z

    move-result p2

    if-eqz p2, :cond_0

    iget-object p2, p0, Lcom/android/zxing/HandGestureDecoder;->mDecodeFlowableEmitter:Lio/reactivex/FlowableEmitter;

    if-eqz p2, :cond_0

    .line 138
    new-instance p2, Lcom/android/zxing/PreviewImage;

    invoke-direct {p2, p1, p4}, Lcom/android/zxing/PreviewImage;-><init>(Landroid/media/Image;I)V

    .line 139
    iget-object p1, p0, Lcom/android/zxing/HandGestureDecoder;->mDecodeFlowableEmitter:Lio/reactivex/FlowableEmitter;

    invoke-interface {p1, p2}, Lio/reactivex/FlowableEmitter;->onNext(Ljava/lang/Object;)V

    .line 141
    :cond_0
    return-void
.end method

.method public quit()V
    .locals 4

    .line 130
    invoke-super {p0}, Lcom/android/zxing/Decoder;->quit()V

    .line 131
    iget-object v0, p0, Lcom/android/zxing/HandGestureDecoder;->mDecodeFlowableEmitter:Lio/reactivex/FlowableEmitter;

    new-instance v1, Lcom/android/zxing/PreviewImage;

    iget v2, p0, Lcom/android/zxing/HandGestureDecoder;->mCameraId:I

    const/4 v3, 0x3

    invoke-direct {v1, v3, v2}, Lcom/android/zxing/PreviewImage;-><init>(II)V

    invoke-interface {v0, v1}, Lio/reactivex/FlowableEmitter;->onNext(Ljava/lang/Object;)V

    .line 132
    iget-object v0, p0, Lcom/android/zxing/HandGestureDecoder;->mDecodeFlowableEmitter:Lio/reactivex/FlowableEmitter;

    invoke-interface {v0}, Lio/reactivex/FlowableEmitter;->onComplete()V

    .line 133
    return-void
.end method

.method public reset()V
    .locals 2

    .line 124
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/zxing/HandGestureDecoder;->mTriggeringPhoto:Z

    .line 125
    iget-object v1, p0, Lcom/android/zxing/HandGestureDecoder;->mDecodingCount:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v1, v0}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 126
    return-void
.end method

.method public startDecode()V
    .locals 2

    .line 108
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/zxing/HandGestureDecoder;->mDecoding:Z

    .line 109
    iget-object v0, p0, Lcom/android/zxing/HandGestureDecoder;->mDecodingCount:Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 110
    return-void
.end method
