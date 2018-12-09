.class public Lcom/android/zxing/QRCodeManager;
.super Ljava/lang/Object;
.source "QRCodeManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/zxing/QRCodeManager$Singleton;
    }
.end annotation


# static fields
.field private static final DECODE_AUTO_INTERVAL:J = 0x3e8L

.field private static final DECODE_MAX_COUNT:I = 0xf

.field private static final TAG:Ljava/lang/String; = "QRCodeManager"


# instance fields
.field private volatile mDecoding:Z

.field private mDecodingCount:Ljava/util/concurrent/atomic/AtomicInteger;

.field private mHandler:Landroid/os/Handler;

.field private final mMaxFrameWidth:I

.field private final mMultiFormatReader:Lcom/google/zxing/MultiFormatReader;

.field private mPreviewCallback:Lcom/android/camera2/Camera2Proxy$PreviewCallback;

.field private mPreviewHeight:I

.field private mPreviewWidth:I

.field private mQrCodeDisposable:Lio/reactivex/disposables/Disposable;

.field private mQrCodeFlowableEmitter:Lio/reactivex/FlowableEmitter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/FlowableEmitter<",
            "Lcom/android/zxing/PreviewImage;",
            ">;"
        }
    .end annotation
.end field

.field private mRectFinderCenter:Landroid/graphics/Rect;

.field private mScanResult:Ljava/lang/String;


# direct methods
.method private constructor <init>()V
    .locals 3

    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    new-instance v0, Landroid/graphics/Rect;

    const/4 v1, 0x0

    invoke-direct {v0, v1, v1, v1, v1}, Landroid/graphics/Rect;-><init>(IIII)V

    iput-object v0, p0, Lcom/android/zxing/QRCodeManager;->mRectFinderCenter:Landroid/graphics/Rect;

    .line 47
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v0, p0, Lcom/android/zxing/QRCodeManager;->mDecodingCount:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 68
    new-instance v0, Lcom/android/zxing/QRCodeManager$1;

    invoke-direct {v0, p0}, Lcom/android/zxing/QRCodeManager$1;-><init>(Lcom/android/zxing/QRCodeManager;)V

    iput-object v0, p0, Lcom/android/zxing/QRCodeManager;->mPreviewCallback:Lcom/android/camera2/Camera2Proxy$PreviewCallback;

    .line 54
    new-instance v0, Lcom/google/zxing/MultiFormatReader;

    invoke-direct {v0}, Lcom/google/zxing/MultiFormatReader;-><init>()V

    iput-object v0, p0, Lcom/android/zxing/QRCodeManager;->mMultiFormatReader:Lcom/google/zxing/MultiFormatReader;

    .line 55
    new-instance v0, Ljava/util/HashMap;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    .line 56
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 58
    sget-object v2, Lcom/android/zxing/DecodeFormats;->QR_CODE_FORMATS:Ljava/util/Vector;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 59
    sget-object v2, Lcom/google/zxing/DecodeHintType;->POSSIBLE_FORMATS:Lcom/google/zxing/DecodeHintType;

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 60
    iget-object v1, p0, Lcom/android/zxing/QRCodeManager;->mMultiFormatReader:Lcom/google/zxing/MultiFormatReader;

    invoke-virtual {v1, v0}, Lcom/google/zxing/MultiFormatReader;->setHints(Ljava/util/Map;)V

    .line 61
    sget v0, Lcom/android/camera/Util;->sWindowWidth:I

    sget v1, Lcom/android/camera/Util;->sWindowHeight:I

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    iput v0, p0, Lcom/android/zxing/QRCodeManager;->mMaxFrameWidth:I

    .line 62
    return-void
.end method

.method synthetic constructor <init>(Lcom/android/zxing/QRCodeManager$1;)V
    .locals 0

    .line 35
    invoke-direct {p0}, Lcom/android/zxing/QRCodeManager;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/android/zxing/QRCodeManager;)Z
    .locals 0

    .line 35
    iget-boolean p0, p0, Lcom/android/zxing/QRCodeManager;->mDecoding:Z

    return p0
.end method

.method static synthetic access$002(Lcom/android/zxing/QRCodeManager;Z)Z
    .locals 0

    .line 35
    iput-boolean p1, p0, Lcom/android/zxing/QRCodeManager;->mDecoding:Z

    return p1
.end method

.method static synthetic access$100(Lcom/android/zxing/QRCodeManager;)Ljava/util/concurrent/atomic/AtomicInteger;
    .locals 0

    .line 35
    iget-object p0, p0, Lcom/android/zxing/QRCodeManager;->mDecodingCount:Ljava/util/concurrent/atomic/AtomicInteger;

    return-object p0
.end method

.method static synthetic access$200(Lcom/android/zxing/QRCodeManager;)Lio/reactivex/FlowableEmitter;
    .locals 0

    .line 35
    iget-object p0, p0, Lcom/android/zxing/QRCodeManager;->mQrCodeFlowableEmitter:Lio/reactivex/FlowableEmitter;

    return-object p0
.end method

.method static synthetic access$202(Lcom/android/zxing/QRCodeManager;Lio/reactivex/FlowableEmitter;)Lio/reactivex/FlowableEmitter;
    .locals 0

    .line 35
    iput-object p1, p0, Lcom/android/zxing/QRCodeManager;->mQrCodeFlowableEmitter:Lio/reactivex/FlowableEmitter;

    return-object p1
.end method

.method static synthetic access$300(Lcom/android/zxing/QRCodeManager;)I
    .locals 0

    .line 35
    iget p0, p0, Lcom/android/zxing/QRCodeManager;->mPreviewWidth:I

    return p0
.end method

.method static synthetic access$400(Lcom/android/zxing/QRCodeManager;)I
    .locals 0

    .line 35
    iget p0, p0, Lcom/android/zxing/QRCodeManager;->mPreviewHeight:I

    return p0
.end method

.method static synthetic access$502(Lcom/android/zxing/QRCodeManager;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 35
    iput-object p1, p0, Lcom/android/zxing/QRCodeManager;->mScanResult:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$600(Lcom/android/zxing/QRCodeManager;[BII)Ljava/lang/String;
    .locals 0

    .line 35
    invoke-direct {p0, p1, p2, p3}, Lcom/android/zxing/QRCodeManager;->decode([BII)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private buildLuminanceSource([BII)Lcom/android/zxing/YUVLuminanceSource;
    .locals 9

    .line 221
    :try_start_0
    iget-object v0, p0, Lcom/android/zxing/QRCodeManager;->mRectFinderCenter:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 222
    new-instance v0, Lcom/android/zxing/YUVLuminanceSource;

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v1, v0

    move-object v2, p1

    move v3, p2

    move v4, p3

    move v7, p2

    move v8, p3

    invoke-direct/range {v1 .. v8}, Lcom/android/zxing/YUVLuminanceSource;-><init>([BIIIIII)V

    return-object v0

    .line 224
    :cond_0
    new-instance v8, Lcom/android/zxing/YUVLuminanceSource;

    iget-object v0, p0, Lcom/android/zxing/QRCodeManager;->mRectFinderCenter:Landroid/graphics/Rect;

    iget v4, v0, Landroid/graphics/Rect;->left:I

    iget-object v0, p0, Lcom/android/zxing/QRCodeManager;->mRectFinderCenter:Landroid/graphics/Rect;

    iget v5, v0, Landroid/graphics/Rect;->top:I

    iget-object v0, p0, Lcom/android/zxing/QRCodeManager;->mRectFinderCenter:Landroid/graphics/Rect;

    .line 225
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v6

    iget-object v0, p0, Lcom/android/zxing/QRCodeManager;->mRectFinderCenter:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v7

    move-object v0, v8

    move-object v1, p1

    move v2, p2

    move v3, p3

    invoke-direct/range {v0 .. v7}, Lcom/android/zxing/YUVLuminanceSource;-><init>([BIIIIII)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 224
    return-object v8

    .line 226
    :catch_0
    move-exception p1

    .line 229
    const/4 p1, 0x0

    return-object p1
.end method

.method private decode([BII)Ljava/lang/String;
    .locals 3

    .line 190
    mul-int v0, p2, p3

    new-array v1, v0, [B

    .line 192
    array-length v2, p1

    if-le v2, v0, :cond_0

    .line 193
    array-length v0, v1

    const/4 v2, 0x0

    invoke-static {p1, v2, v1, v2, v0}, Ljava/lang/System;->arraycopy([BI[BII)V

    .line 198
    move-object p1, v1

    goto :goto_0

    .line 195
    :cond_0
    nop

    .line 198
    :goto_0
    const-string v0, ""

    .line 200
    invoke-direct {p0, p1, p2, p3}, Lcom/android/zxing/QRCodeManager;->buildLuminanceSource([BII)Lcom/android/zxing/YUVLuminanceSource;

    move-result-object p1

    .line 201
    if-nez p1, :cond_1

    .line 202
    return-object v0

    .line 204
    :cond_1
    new-instance p2, Lcom/google/zxing/BinaryBitmap;

    new-instance p3, Lcom/google/zxing/common/HybridBinarizer;

    invoke-direct {p3, p1}, Lcom/google/zxing/common/HybridBinarizer;-><init>(Lcom/google/zxing/LuminanceSource;)V

    invoke-direct {p2, p3}, Lcom/google/zxing/BinaryBitmap;-><init>(Lcom/google/zxing/Binarizer;)V

    .line 206
    :try_start_0
    iget-object p1, p0, Lcom/android/zxing/QRCodeManager;->mMultiFormatReader:Lcom/google/zxing/MultiFormatReader;

    invoke-virtual {p1, p2}, Lcom/google/zxing/MultiFormatReader;->decodeWithState(Lcom/google/zxing/BinaryBitmap;)Lcom/google/zxing/Result;

    move-result-object p1

    .line 207
    if-eqz p1, :cond_2

    .line 209
    invoke-virtual {p1}, Lcom/google/zxing/Result;->getText()Ljava/lang/String;

    move-result-object p1
    :try_end_0
    .catch Lcom/google/zxing/ReaderException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 214
    move-object v0, p1

    :cond_2
    :goto_1
    iget-object p1, p0, Lcom/android/zxing/QRCodeManager;->mMultiFormatReader:Lcom/google/zxing/MultiFormatReader;

    invoke-virtual {p1}, Lcom/google/zxing/MultiFormatReader;->reset()V

    .line 215
    goto :goto_2

    .line 214
    :catchall_0
    move-exception p1

    goto :goto_3

    .line 211
    :catch_0
    move-exception p1

    .line 212
    :try_start_1
    const-string p2, "QRCodeManager"

    const-string p3, "decode: ReaderException: "

    invoke-static {p2, p3, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    .line 216
    :goto_2
    return-object v0

    .line 214
    :goto_3
    iget-object p2, p0, Lcom/android/zxing/QRCodeManager;->mMultiFormatReader:Lcom/google/zxing/MultiFormatReader;

    invoke-virtual {p2}, Lcom/google/zxing/MultiFormatReader;->reset()V

    throw p1
.end method

.method public static getInstance()Lcom/android/zxing/QRCodeManager;
    .locals 1

    .line 65
    sget-object v0, Lcom/android/zxing/QRCodeManager$Singleton;->INSTANCE:Lcom/android/zxing/QRCodeManager;

    return-object v0
.end method


# virtual methods
.method public getHandler()Landroid/os/Handler;
    .locals 1

    .line 125
    iget-object v0, p0, Lcom/android/zxing/QRCodeManager;->mHandler:Landroid/os/Handler;

    return-object v0
.end method

.method public getPreviewCallback()Lcom/android/camera2/Camera2Proxy$PreviewCallback;
    .locals 1

    .line 98
    iget-object v0, p0, Lcom/android/zxing/QRCodeManager;->mPreviewCallback:Lcom/android/camera2/Camera2Proxy$PreviewCallback;

    return-object v0
.end method

.method public getScanResult()Ljava/lang/String;
    .locals 1

    .line 234
    iget-object v0, p0, Lcom/android/zxing/QRCodeManager;->mScanResult:Ljava/lang/String;

    return-object v0
.end method

.method public init()V
    .locals 2

    .line 119
    new-instance v0, Landroid/os/HandlerThread;

    const-string v1, "QRCodeManager"

    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 120
    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    .line 121
    new-instance v1, Landroid/os/Handler;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {v1, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v1, p0, Lcom/android/zxing/QRCodeManager;->mHandler:Landroid/os/Handler;

    .line 122
    return-void
.end method

.method public quit()V
    .locals 2

    .line 129
    iget-object v0, p0, Lcom/android/zxing/QRCodeManager;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 130
    iget-object v0, p0, Lcom/android/zxing/QRCodeManager;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 131
    iget-object v0, p0, Lcom/android/zxing/QRCodeManager;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Looper;->quitSafely()V

    .line 133
    :cond_0
    iput-object v1, p0, Lcom/android/zxing/QRCodeManager;->mHandler:Landroid/os/Handler;

    .line 134
    return-void
.end method

.method public setPreviewSize(II)V
    .locals 5

    .line 102
    iget v0, p0, Lcom/android/zxing/QRCodeManager;->mPreviewWidth:I

    if-ne v0, p1, :cond_0

    iget v0, p0, Lcom/android/zxing/QRCodeManager;->mPreviewHeight:I

    if-eq v0, p2, :cond_1

    .line 103
    :cond_0
    iput p1, p0, Lcom/android/zxing/QRCodeManager;->mPreviewWidth:I

    .line 104
    iput p2, p0, Lcom/android/zxing/QRCodeManager;->mPreviewHeight:I

    .line 106
    invoke-static {p1, p2}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 107
    iget v1, p0, Lcom/android/zxing/QRCodeManager;->mMaxFrameWidth:I

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 108
    sub-int v1, p1, v0

    div-int/lit8 v1, v1, 0x2

    .line 109
    sub-int v2, p2, v0

    div-int/lit8 v2, v2, 0x2

    .line 110
    add-int v3, v1, v0

    .line 111
    add-int/2addr v0, v2

    .line 112
    iget-object v4, p0, Lcom/android/zxing/QRCodeManager;->mRectFinderCenter:Landroid/graphics/Rect;

    invoke-virtual {v4, v1, v2, v3, v0}, Landroid/graphics/Rect;->set(IIII)V

    .line 114
    :cond_1
    const-string v0, "QRCodeManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setPreviewSize: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " x "

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, "mRectFinderCenter = "

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p1, p0, Lcom/android/zxing/QRCodeManager;->mRectFinderCenter:Landroid/graphics/Rect;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 116
    return-void
.end method

.method public startDecode()V
    .locals 3

    .line 137
    new-instance v0, Lcom/android/zxing/QRCodeManager$5;

    invoke-direct {v0, p0}, Lcom/android/zxing/QRCodeManager$5;-><init>(Lcom/android/zxing/QRCodeManager;)V

    sget-object v1, Lio/reactivex/BackpressureStrategy;->DROP:Lio/reactivex/BackpressureStrategy;

    invoke-static {v0, v1}, Lio/reactivex/Flowable;->create(Lio/reactivex/FlowableOnSubscribe;Lio/reactivex/BackpressureStrategy;)Lio/reactivex/Flowable;

    move-result-object v0

    new-instance v1, Lcom/android/zxing/QRCodeManager$4;

    invoke-direct {v1, p0}, Lcom/android/zxing/QRCodeManager$4;-><init>(Lcom/android/zxing/QRCodeManager;)V

    .line 143
    invoke-virtual {v0, v1}, Lio/reactivex/Flowable;->map(Lio/reactivex/functions/Function;)Lio/reactivex/Flowable;

    move-result-object v0

    .line 151
    invoke-static {}, Lio/reactivex/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/reactivex/Flowable;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Flowable;

    move-result-object v0

    new-instance v1, Lcom/android/zxing/QRCodeManager$2;

    invoke-direct {v1, p0}, Lcom/android/zxing/QRCodeManager$2;-><init>(Lcom/android/zxing/QRCodeManager;)V

    new-instance v2, Lcom/android/zxing/QRCodeManager$3;

    invoke-direct {v2, p0}, Lcom/android/zxing/QRCodeManager$3;-><init>(Lcom/android/zxing/QRCodeManager;)V

    .line 152
    invoke-virtual {v0, v1, v2}, Lio/reactivex/Flowable;->subscribe(Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;

    move-result-object v0

    iput-object v0, p0, Lcom/android/zxing/QRCodeManager;->mQrCodeDisposable:Lio/reactivex/disposables/Disposable;

    .line 173
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/zxing/QRCodeManager;->mDecoding:Z

    .line 174
    iget-object v0, p0, Lcom/android/zxing/QRCodeManager;->mDecodingCount:Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 175
    return-void
.end method

.method public stopDecode()V
    .locals 1

    .line 178
    iget-object v0, p0, Lcom/android/zxing/QRCodeManager;->mQrCodeDisposable:Lio/reactivex/disposables/Disposable;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/zxing/QRCodeManager;->mQrCodeDisposable:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->isDisposed()Z

    move-result v0

    if-nez v0, :cond_0

    .line 179
    iget-object v0, p0, Lcom/android/zxing/QRCodeManager;->mQrCodeDisposable:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 181
    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/zxing/QRCodeManager;->mDecoding:Z

    .line 182
    return-void
.end method
