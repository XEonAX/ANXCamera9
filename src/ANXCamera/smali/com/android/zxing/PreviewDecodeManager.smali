.class public Lcom/android/zxing/PreviewDecodeManager;
.super Ljava/lang/Object;
.source "PreviewDecodeManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/zxing/PreviewDecodeManager$Singleton;
    }
.end annotation


# static fields
.field public static final DECODE_TYPE_HAND_GESTURE:I = 0x1

.field public static final DECODE_TYPE_QR:I = 0x0

.field private static final TAG:Ljava/lang/String; = "PreviewDecodeManager"


# instance fields
.field private mDecoders:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Lcom/android/zxing/Decoder;",
            ">;"
        }
    .end annotation
.end field

.field private mHandler:Landroid/os/Handler;

.field private mPreviewCallback:Lcom/android/camera2/Camera2Proxy$PreviewCallback;

.field private mPreviewHeight:I

.field private mPreviewWidth:I


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    new-instance v0, Lcom/android/zxing/PreviewDecodeManager$1;

    invoke-direct {v0, p0}, Lcom/android/zxing/PreviewDecodeManager$1;-><init>(Lcom/android/zxing/PreviewDecodeManager;)V

    iput-object v0, p0, Lcom/android/zxing/PreviewDecodeManager;->mPreviewCallback:Lcom/android/camera2/Camera2Proxy$PreviewCallback;

    .line 36
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/android/zxing/PreviewDecodeManager;->mDecoders:Ljava/util/HashMap;

    .line 37
    return-void
.end method

.method synthetic constructor <init>(Lcom/android/zxing/PreviewDecodeManager$1;)V
    .locals 0

    .line 15
    invoke-direct {p0}, Lcom/android/zxing/PreviewDecodeManager;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/android/zxing/PreviewDecodeManager;)Ljava/util/HashMap;
    .locals 0

    .line 15
    iget-object p0, p0, Lcom/android/zxing/PreviewDecodeManager;->mDecoders:Ljava/util/HashMap;

    return-object p0
.end method

.method static synthetic access$100(Lcom/android/zxing/PreviewDecodeManager;)I
    .locals 0

    .line 15
    iget p0, p0, Lcom/android/zxing/PreviewDecodeManager;->mPreviewWidth:I

    return p0
.end method

.method static synthetic access$200(Lcom/android/zxing/PreviewDecodeManager;)I
    .locals 0

    .line 15
    iget p0, p0, Lcom/android/zxing/PreviewDecodeManager;->mPreviewHeight:I

    return p0
.end method

.method public static getInstance()Lcom/android/zxing/PreviewDecodeManager;
    .locals 1

    .line 40
    sget-object v0, Lcom/android/zxing/PreviewDecodeManager$Singleton;->INSTANCE:Lcom/android/zxing/PreviewDecodeManager;

    return-object v0
.end method


# virtual methods
.method public getHandler()Landroid/os/Handler;
    .locals 1

    .line 89
    iget-object v0, p0, Lcom/android/zxing/PreviewDecodeManager;->mHandler:Landroid/os/Handler;

    return-object v0
.end method

.method public getPreviewCallback()Lcom/android/camera2/Camera2Proxy$PreviewCallback;
    .locals 1

    .line 49
    iget-object v0, p0, Lcom/android/zxing/PreviewDecodeManager;->mPreviewCallback:Lcom/android/camera2/Camera2Proxy$PreviewCallback;

    return-object v0
.end method

.method public getScanResult()Ljava/lang/String;
    .locals 2

    .line 121
    iget-object v0, p0, Lcom/android/zxing/PreviewDecodeManager;->mDecoders:Ljava/util/HashMap;

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/zxing/QrDecoder;

    invoke-virtual {v0}, Lcom/android/zxing/QrDecoder;->getScanResult()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public init(II)V
    .locals 2

    .line 65
    iget-object v0, p0, Lcom/android/zxing/PreviewDecodeManager;->mHandler:Landroid/os/Handler;

    if-nez v0, :cond_0

    .line 66
    new-instance v0, Landroid/os/HandlerThread;

    const-string v1, "PreviewDecodeManager"

    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 67
    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    .line 68
    new-instance v1, Landroid/os/Handler;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {v1, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v1, p0, Lcom/android/zxing/PreviewDecodeManager;->mHandler:Landroid/os/Handler;

    .line 70
    :cond_0
    packed-switch p2, :pswitch_data_0

    goto :goto_0

    .line 77
    :pswitch_0
    iget-object p2, p0, Lcom/android/zxing/PreviewDecodeManager;->mDecoders:Ljava/util/HashMap;

    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    if-nez p2, :cond_1

    .line 78
    iget-object p2, p0, Lcom/android/zxing/PreviewDecodeManager;->mDecoders:Ljava/util/HashMap;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    new-instance v1, Lcom/android/zxing/HandGestureDecoder;

    invoke-direct {v1}, Lcom/android/zxing/HandGestureDecoder;-><init>()V

    invoke-virtual {p2, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 72
    :pswitch_1
    iget-object p2, p0, Lcom/android/zxing/PreviewDecodeManager;->mDecoders:Ljava/util/HashMap;

    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    if-nez p2, :cond_1

    .line 73
    iget-object p2, p0, Lcom/android/zxing/PreviewDecodeManager;->mDecoders:Ljava/util/HashMap;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    new-instance v1, Lcom/android/zxing/QrDecoder;

    invoke-direct {v1}, Lcom/android/zxing/QrDecoder;-><init>()V

    invoke-virtual {p2, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 82
    :cond_1
    :goto_0
    iget-object p2, p0, Lcom/android/zxing/PreviewDecodeManager;->mDecoders:Ljava/util/HashMap;

    invoke-virtual {p2}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object p2

    invoke-interface {p2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_1
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 83
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/zxing/Decoder;

    .line 84
    invoke-virtual {v0, p1}, Lcom/android/zxing/Decoder;->init(I)V

    .line 85
    goto :goto_1

    .line 86
    :cond_2
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public quit()V
    .locals 2

    .line 93
    iget-object v0, p0, Lcom/android/zxing/PreviewDecodeManager;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 94
    iget-object v0, p0, Lcom/android/zxing/PreviewDecodeManager;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 95
    iget-object v0, p0, Lcom/android/zxing/PreviewDecodeManager;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Looper;->quitSafely()V

    .line 97
    :cond_0
    iput-object v1, p0, Lcom/android/zxing/PreviewDecodeManager;->mHandler:Landroid/os/Handler;

    .line 98
    iget-object v0, p0, Lcom/android/zxing/PreviewDecodeManager;->mDecoders:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 99
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/zxing/Decoder;

    .line 100
    invoke-virtual {v1}, Lcom/android/zxing/Decoder;->stopDecode()V

    .line 101
    invoke-virtual {v1}, Lcom/android/zxing/Decoder;->quit()V

    .line 102
    goto :goto_0

    .line 103
    :cond_1
    iget-object v0, p0, Lcom/android/zxing/PreviewDecodeManager;->mDecoders:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 104
    return-void
.end method

.method public reset()V
    .locals 2

    .line 114
    iget-object v0, p0, Lcom/android/zxing/PreviewDecodeManager;->mDecoders:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 115
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/zxing/Decoder;

    .line 116
    invoke-virtual {v1}, Lcom/android/zxing/Decoder;->reset()V

    .line 117
    goto :goto_0

    .line 118
    :cond_0
    return-void
.end method

.method public resetScanResult()V
    .locals 2

    .line 125
    iget-object v0, p0, Lcom/android/zxing/PreviewDecodeManager;->mDecoders:Ljava/util/HashMap;

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/zxing/QrDecoder;

    invoke-virtual {v0}, Lcom/android/zxing/QrDecoder;->resetScanResult()V

    .line 126
    return-void
.end method

.method public setPreviewSize(II)V
    .locals 3

    .line 53
    iget v0, p0, Lcom/android/zxing/PreviewDecodeManager;->mPreviewWidth:I

    if-ne v0, p1, :cond_0

    iget v0, p0, Lcom/android/zxing/PreviewDecodeManager;->mPreviewHeight:I

    if-eq v0, p2, :cond_1

    .line 54
    :cond_0
    iput p1, p0, Lcom/android/zxing/PreviewDecodeManager;->mPreviewWidth:I

    .line 55
    iput p2, p0, Lcom/android/zxing/PreviewDecodeManager;->mPreviewHeight:I

    .line 56
    iget-object v0, p0, Lcom/android/zxing/PreviewDecodeManager;->mDecoders:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 57
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/zxing/Decoder;

    .line 58
    invoke-virtual {v1, p1, p2}, Lcom/android/zxing/Decoder;->updatePreviewSize(II)V

    .line 59
    goto :goto_0

    .line 61
    :cond_1
    const-string v0, "PreviewDecodeManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setPreviewSize: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " x "

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 62
    return-void
.end method

.method public startDecode()V
    .locals 2

    .line 107
    iget-object v0, p0, Lcom/android/zxing/PreviewDecodeManager;->mDecoders:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 108
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/zxing/Decoder;

    .line 109
    invoke-virtual {v1}, Lcom/android/zxing/Decoder;->startDecode()V

    .line 110
    goto :goto_0

    .line 111
    :cond_0
    return-void
.end method

.method public stopDecode(I)V
    .locals 2

    .line 129
    iget-object v0, p0, Lcom/android/zxing/PreviewDecodeManager;->mDecoders:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 130
    iget-object v0, p0, Lcom/android/zxing/PreviewDecodeManager;->mDecoders:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/android/zxing/Decoder;

    invoke-virtual {p1}, Lcom/android/zxing/Decoder;->stopDecode()V

    .line 132
    :cond_0
    return-void
.end method
