.class public Lcom/ss/android/ttve/nativePort/TEVideoUtilsCallback;
.super Ljava/lang/Object;
.source "TEVideoUtilsCallback.java"


# annotations
.annotation build Landroid/support/annotation/Keep;
.end annotation


# instance fields
.field private listener:Lcom/ss/android/vesdk/VEFrameAvailableListener;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static allocateFrame(II)Ljava/nio/ByteBuffer;
    .locals 0

    .line 30
    mul-int/2addr p0, p1

    mul-int/lit8 p0, p0, 0x4

    invoke-static {p0}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object p0

    return-object p0
.end method

.method public static onFrameAvailable(Ljava/lang/Object;Ljava/nio/ByteBuffer;III)Z
    .locals 1

    .line 24
    check-cast p0, Ljava/lang/ref/WeakReference;

    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/ss/android/ttve/nativePort/TEVideoUtilsCallback;

    .line 25
    iget-object v0, p0, Lcom/ss/android/ttve/nativePort/TEVideoUtilsCallback;->listener:Lcom/ss/android/vesdk/VEFrameAvailableListener;

    if-eqz v0, :cond_0

    iget-object p0, p0, Lcom/ss/android/ttve/nativePort/TEVideoUtilsCallback;->listener:Lcom/ss/android/vesdk/VEFrameAvailableListener;

    invoke-interface {p0, p1, p2, p3, p4}, Lcom/ss/android/vesdk/VEFrameAvailableListener;->processFrame(Ljava/nio/ByteBuffer;III)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method


# virtual methods
.method public onFrameAvailable(Ljava/nio/ByteBuffer;III)Z
    .locals 1

    .line 19
    iget-object v0, p0, Lcom/ss/android/ttve/nativePort/TEVideoUtilsCallback;->listener:Lcom/ss/android/vesdk/VEFrameAvailableListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/ss/android/ttve/nativePort/TEVideoUtilsCallback;->listener:Lcom/ss/android/vesdk/VEFrameAvailableListener;

    invoke-interface {v0, p1, p2, p3, p4}, Lcom/ss/android/vesdk/VEFrameAvailableListener;->processFrame(Ljava/nio/ByteBuffer;III)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public setListener(Ljava/lang/Object;)V
    .locals 0

    .line 34
    check-cast p1, Lcom/ss/android/vesdk/VEFrameAvailableListener;

    iput-object p1, p0, Lcom/ss/android/ttve/nativePort/TEVideoUtilsCallback;->listener:Lcom/ss/android/vesdk/VEFrameAvailableListener;

    .line 35
    return-void
.end method
