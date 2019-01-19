.class public abstract Lcom/android/zxing/Decoder;
.super Ljava/lang/Object;
.source "Decoder.java"


# static fields
.field static final DECODE_AUTO_INTERVAL:J = 0x3e8L

.field static DECODE_MAX_COUNT:I = 0x0

.field public static final TAG:Ljava/lang/String; = "Decoder"


# instance fields
.field mDecodeDisposable:Lio/reactivex/disposables/Disposable;

.field mDecodeFlowableEmitter:Lio/reactivex/FlowableEmitter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/FlowableEmitter<",
            "Lcom/android/zxing/PreviewImage;",
            ">;"
        }
    .end annotation
.end field

.field volatile mDecoding:Z

.field mDecodingCount:Ljava/util/concurrent/atomic/AtomicInteger;

.field mEnable:Z

.field mLastDecodeTime:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 14
    const/16 v0, 0xf

    sput v0, Lcom/android/zxing/Decoder;->DECODE_MAX_COUNT:I

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/zxing/Decoder;->mEnable:Z

    .line 21
    new-instance v1, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v1, v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v1, p0, Lcom/android/zxing/Decoder;->mDecodingCount:Ljava/util/concurrent/atomic/AtomicInteger;

    return-void
.end method


# virtual methods
.method public needPreviewFrame()Z
    .locals 8

    .line 25
    iget-boolean v0, p0, Lcom/android/zxing/Decoder;->mEnable:Z

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 26
    return v1

    .line 28
    :cond_0
    iget-boolean v0, p0, Lcom/android/zxing/Decoder;->mDecoding:Z

    if-nez v0, :cond_1

    .line 29
    return v1

    .line 31
    :cond_1
    iget-object v0, p0, Lcom/android/zxing/Decoder;->mDecodingCount:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    sget v2, Lcom/android/zxing/Decoder;->DECODE_MAX_COUNT:I

    if-lt v0, v2, :cond_2

    .line 32
    return v1

    .line 34
    :cond_2
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    .line 35
    iget-wide v4, p0, Lcom/android/zxing/Decoder;->mLastDecodeTime:J

    sub-long v4, v2, v4

    const-wide/16 v6, 0x3e8

    cmp-long v0, v4, v6

    if-gez v0, :cond_3

    .line 36
    return v1

    .line 38
    :cond_3
    iput-wide v2, p0, Lcom/android/zxing/Decoder;->mLastDecodeTime:J

    .line 39
    iget-object v0, p0, Lcom/android/zxing/Decoder;->mDecodingCount:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    .line 40
    const-string v0, "Decoder"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "preview frame buffer received... mDecodingCount = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/android/zxing/Decoder;->mDecodingCount:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 41
    const/4 v0, 0x1

    return v0
.end method

.method public onPreviewFrame(Lcom/android/zxing/PreviewImage;)V
    .locals 1

    .line 49
    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/android/zxing/Decoder;->mDecodeFlowableEmitter:Lio/reactivex/FlowableEmitter;

    if-eqz v0, :cond_0

    .line 50
    iget-object v0, p0, Lcom/android/zxing/Decoder;->mDecodeFlowableEmitter:Lio/reactivex/FlowableEmitter;

    invoke-interface {v0, p1}, Lio/reactivex/FlowableEmitter;->onNext(Ljava/lang/Object;)V

    .line 52
    :cond_0
    return-void
.end method

.method public abstract reConfig(I)V
.end method

.method public abstract reset()V
.end method

.method public setEnable(Z)V
    .locals 0

    .line 46
    iput-boolean p1, p0, Lcom/android/zxing/Decoder;->mEnable:Z

    .line 47
    return-void
.end method

.method public abstract startDecode()V
.end method

.method public stopDecode()V
    .locals 2

    .line 62
    const-string v0, "Decoder"

    const-string v1, "Stop decode."

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 63
    iget-object v0, p0, Lcom/android/zxing/Decoder;->mDecodeDisposable:Lio/reactivex/disposables/Disposable;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/zxing/Decoder;->mDecodeDisposable:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->isDisposed()Z

    move-result v0

    if-nez v0, :cond_0

    .line 64
    iget-object v0, p0, Lcom/android/zxing/Decoder;->mDecodeDisposable:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 66
    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/zxing/Decoder;->mDecoding:Z

    .line 67
    return-void
.end method

.method public updatePreviewSize(II)V
    .locals 0

    .line 55
    return-void
.end method
