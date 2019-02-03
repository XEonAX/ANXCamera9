.class public Lcom/android/zxing/QrDecoder;
.super Lcom/android/zxing/Decoder;
.source "QrDecoder.java"


# static fields
.field public static final TAG:Ljava/lang/String; = "QrDecoder"


# instance fields
.field private final mMaxFrameWidth:I

.field private final mMultiFormatReader:Lcom/google/zxing/MultiFormatReader;

.field private mRectFinderCenter:Landroid/graphics/Rect;

.field private mScanResult:Ljava/lang/String;


# direct methods
.method constructor <init>()V
    .locals 4

    .line 37
    invoke-direct {p0}, Lcom/android/zxing/Decoder;-><init>()V

    .line 34
    const-string v0, ""

    iput-object v0, p0, Lcom/android/zxing/QrDecoder;->mScanResult:Ljava/lang/String;

    .line 35
    new-instance v0, Landroid/graphics/Rect;

    const/4 v1, 0x0

    invoke-direct {v0, v1, v1, v1, v1}, Landroid/graphics/Rect;-><init>(IIII)V

    iput-object v0, p0, Lcom/android/zxing/QrDecoder;->mRectFinderCenter:Landroid/graphics/Rect;

    .line 38
    new-instance v0, Lcom/google/zxing/MultiFormatReader;

    invoke-direct {v0}, Lcom/google/zxing/MultiFormatReader;-><init>()V

    iput-object v0, p0, Lcom/android/zxing/QrDecoder;->mMultiFormatReader:Lcom/google/zxing/MultiFormatReader;

    .line 39
    new-instance v0, Ljava/util/HashMap;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    .line 40
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 42
    sget-object v3, Lcom/android/zxing/DecodeFormats;->QR_CODE_FORMATS:Ljava/util/Vector;

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 43
    sget-object v3, Lcom/google/zxing/DecodeHintType;->POSSIBLE_FORMATS:Lcom/google/zxing/DecodeHintType;

    invoke-virtual {v0, v3, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 44
    iget-object v2, p0, Lcom/android/zxing/QrDecoder;->mMultiFormatReader:Lcom/google/zxing/MultiFormatReader;

    invoke-virtual {v2, v0}, Lcom/google/zxing/MultiFormatReader;->setHints(Ljava/util/Map;)V

    .line 45
    sget v0, Lcom/android/camera/Util;->sWindowWidth:I

    sget v2, Lcom/android/camera/Util;->sWindowHeight:I

    invoke-static {v0, v2}, Ljava/lang/Math;->min(II)I

    move-result v0

    iput v0, p0, Lcom/android/zxing/QrDecoder;->mMaxFrameWidth:I

    .line 46
    iput-boolean v1, p0, Lcom/android/zxing/QrDecoder;->mEnable:Z

    .line 47
    return-void
.end method

.method static synthetic access$000(Lcom/android/zxing/QrDecoder;)Ljava/lang/String;
    .locals 0

    .line 30
    iget-object p0, p0, Lcom/android/zxing/QrDecoder;->mScanResult:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$002(Lcom/android/zxing/QrDecoder;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 30
    iput-object p1, p0, Lcom/android/zxing/QrDecoder;->mScanResult:Ljava/lang/String;

    return-object p1
.end method

.method private buildLuminanceSource([BII)Lcom/android/zxing/YUVLuminanceSource;
    .locals 9

    .line 114
    :try_start_0
    iget-object v0, p0, Lcom/android/zxing/QrDecoder;->mRectFinderCenter:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 115
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

    .line 117
    :cond_0
    new-instance v8, Lcom/android/zxing/YUVLuminanceSource;

    iget-object v0, p0, Lcom/android/zxing/QrDecoder;->mRectFinderCenter:Landroid/graphics/Rect;

    iget v4, v0, Landroid/graphics/Rect;->left:I

    iget-object v0, p0, Lcom/android/zxing/QrDecoder;->mRectFinderCenter:Landroid/graphics/Rect;

    iget v5, v0, Landroid/graphics/Rect;->top:I

    iget-object v0, p0, Lcom/android/zxing/QrDecoder;->mRectFinderCenter:Landroid/graphics/Rect;

    .line 118
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v6

    iget-object v0, p0, Lcom/android/zxing/QrDecoder;->mRectFinderCenter:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v7

    move-object v0, v8

    move-object v1, p1

    move v2, p2

    move v3, p3

    invoke-direct/range {v0 .. v7}, Lcom/android/zxing/YUVLuminanceSource;-><init>([BIIIIII)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 117
    return-object v8

    .line 119
    :catch_0
    move-exception p1

    .line 122
    const/4 p1, 0x0

    return-object p1
.end method


# virtual methods
.method protected decode([BII)Ljava/lang/String;
    .locals 3

    .line 78
    mul-int v0, p2, p3

    new-array v1, v0, [B

    .line 80
    array-length v2, p1

    if-le v2, v0, :cond_0

    .line 81
    array-length v0, v1

    const/4 v2, 0x0

    invoke-static {p1, v2, v1, v2, v0}, Ljava/lang/System;->arraycopy([BI[BII)V

    .line 86
    move-object p1, v1

    goto :goto_0

    .line 83
    :cond_0
    nop

    .line 86
    :goto_0
    const-string v0, ""

    .line 88
    invoke-direct {p0, p1, p2, p3}, Lcom/android/zxing/QrDecoder;->buildLuminanceSource([BII)Lcom/android/zxing/YUVLuminanceSource;

    move-result-object p1

    .line 89
    if-nez p1, :cond_1

    .line 90
    return-object v0

    .line 92
    :cond_1
    new-instance p2, Lcom/google/zxing/BinaryBitmap;

    new-instance p3, Lcom/google/zxing/common/HybridBinarizer;

    invoke-direct {p3, p1}, Lcom/google/zxing/common/HybridBinarizer;-><init>(Lcom/google/zxing/LuminanceSource;)V

    invoke-direct {p2, p3}, Lcom/google/zxing/BinaryBitmap;-><init>(Lcom/google/zxing/Binarizer;)V

    .line 94
    :try_start_0
    iget-object p1, p0, Lcom/android/zxing/QrDecoder;->mMultiFormatReader:Lcom/google/zxing/MultiFormatReader;

    invoke-virtual {p1, p2}, Lcom/google/zxing/MultiFormatReader;->decodeWithState(Lcom/google/zxing/BinaryBitmap;)Lcom/google/zxing/Result;

    move-result-object p1

    .line 95
    if-eqz p1, :cond_2

    .line 97
    invoke-virtual {p1}, Lcom/google/zxing/Result;->getText()Ljava/lang/String;

    move-result-object p1
    :try_end_0
    .catch Lcom/google/zxing/ReaderException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 102
    move-object v0, p1

    :cond_2
    :goto_1
    iget-object p1, p0, Lcom/android/zxing/QrDecoder;->mMultiFormatReader:Lcom/google/zxing/MultiFormatReader;

    invoke-virtual {p1}, Lcom/google/zxing/MultiFormatReader;->reset()V

    .line 103
    goto :goto_2

    .line 102
    :catchall_0
    move-exception p1

    goto :goto_3

    .line 99
    :catch_0
    move-exception p1

    .line 100
    :try_start_1
    const-string p2, "QrDecoder"

    const-string p3, "decode: ReaderException: "

    invoke-static {p2, p3, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    .line 104
    :goto_2
    return-object v0

    .line 102
    :goto_3
    iget-object p2, p0, Lcom/android/zxing/QrDecoder;->mMultiFormatReader:Lcom/google/zxing/MultiFormatReader;

    invoke-virtual {p2}, Lcom/google/zxing/MultiFormatReader;->reset()V

    throw p1
.end method

.method public getScanResult()Ljava/lang/String;
    .locals 1

    .line 185
    iget-object v0, p0, Lcom/android/zxing/QrDecoder;->mScanResult:Ljava/lang/String;

    return-object v0
.end method

.method public init(I)V
    .locals 0

    .line 110
    return-void
.end method

.method public onPreviewFrame(Landroid/media/Image;III)V
    .locals 1

    .line 51
    invoke-virtual {p0}, Lcom/android/zxing/QrDecoder;->needPreviewFrame()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/zxing/QrDecoder;->mDecodeFlowableEmitter:Lio/reactivex/FlowableEmitter;

    if-eqz v0, :cond_0

    .line 52
    new-instance v0, Lcom/android/zxing/PreviewImage;

    invoke-direct {v0, p1, p2, p3, p4}, Lcom/android/zxing/PreviewImage;-><init>(Landroid/media/Image;III)V

    .line 53
    iget-object p1, p0, Lcom/android/zxing/QrDecoder;->mDecodeFlowableEmitter:Lio/reactivex/FlowableEmitter;

    invoke-interface {p1, v0}, Lio/reactivex/FlowableEmitter;->onNext(Ljava/lang/Object;)V

    .line 55
    :cond_0
    return-void
.end method

.method public reset()V
    .locals 0

    .line 182
    return-void
.end method

.method public resetScanResult()V
    .locals 1

    .line 189
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/zxing/QrDecoder;->mDecoding:Z

    .line 190
    const-string v0, ""

    iput-object v0, p0, Lcom/android/zxing/QrDecoder;->mScanResult:Ljava/lang/String;

    .line 191
    return-void
.end method

.method public startDecode()V
    .locals 3

    .line 127
    new-instance v0, Lcom/android/zxing/QrDecoder$4;

    invoke-direct {v0, p0}, Lcom/android/zxing/QrDecoder$4;-><init>(Lcom/android/zxing/QrDecoder;)V

    sget-object v1, Lio/reactivex/BackpressureStrategy;->DROP:Lio/reactivex/BackpressureStrategy;

    invoke-static {v0, v1}, Lio/reactivex/Flowable;->create(Lio/reactivex/FlowableOnSubscribe;Lio/reactivex/BackpressureStrategy;)Lio/reactivex/Flowable;

    move-result-object v0

    new-instance v1, Lcom/android/zxing/QrDecoder$3;

    invoke-direct {v1, p0}, Lcom/android/zxing/QrDecoder$3;-><init>(Lcom/android/zxing/QrDecoder;)V

    .line 133
    invoke-virtual {v0, v1}, Lio/reactivex/Flowable;->map(Lio/reactivex/functions/Function;)Lio/reactivex/Flowable;

    move-result-object v0

    .line 141
    invoke-static {}, Lio/reactivex/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/reactivex/Flowable;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Flowable;

    move-result-object v0

    new-instance v1, Lcom/android/zxing/QrDecoder$1;

    invoke-direct {v1, p0}, Lcom/android/zxing/QrDecoder$1;-><init>(Lcom/android/zxing/QrDecoder;)V

    new-instance v2, Lcom/android/zxing/QrDecoder$2;

    invoke-direct {v2, p0}, Lcom/android/zxing/QrDecoder$2;-><init>(Lcom/android/zxing/QrDecoder;)V

    .line 142
    invoke-virtual {v0, v1, v2}, Lio/reactivex/Flowable;->subscribe(Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;

    move-result-object v0

    iput-object v0, p0, Lcom/android/zxing/QrDecoder;->mDecodeDisposable:Lio/reactivex/disposables/Disposable;

    .line 175
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/zxing/QrDecoder;->mDecoding:Z

    .line 176
    iget-object v0, p0, Lcom/android/zxing/QrDecoder;->mDecodingCount:Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 177
    return-void
.end method

.method public updatePreviewSize(II)V
    .locals 5

    .line 61
    invoke-static {p1, p2}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 62
    iget v1, p0, Lcom/android/zxing/QrDecoder;->mMaxFrameWidth:I

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 63
    sub-int v1, p1, v0

    div-int/lit8 v1, v1, 0x2

    .line 64
    sub-int v2, p2, v0

    div-int/lit8 v2, v2, 0x2

    .line 65
    add-int v3, v1, v0

    .line 66
    add-int/2addr v0, v2

    .line 67
    iget-object v4, p0, Lcom/android/zxing/QrDecoder;->mRectFinderCenter:Landroid/graphics/Rect;

    invoke-virtual {v4, v1, v2, v3, v0}, Landroid/graphics/Rect;->set(IIII)V

    .line 68
    const-string v0, "QrDecoder"

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

    iget-object p1, p0, Lcom/android/zxing/QrDecoder;->mRectFinderCenter:Landroid/graphics/Rect;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 70
    return-void
.end method
