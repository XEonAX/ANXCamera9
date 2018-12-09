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

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public allocateFrame(II)Ljava/nio/ByteBuffer;
    .locals 0

    .line 22
    mul-int/2addr p1, p2

    mul-int/lit8 p1, p1, 0x4

    invoke-static {p1}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object p1

    return-object p1
.end method

.method public onFrameAvailable(Ljava/nio/ByteBuffer;III)Z
    .locals 1

    .line 18
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

.method public setListener(Lcom/ss/android/vesdk/VEFrameAvailableListener;)V
    .locals 0

    .line 26
    iput-object p1, p0, Lcom/ss/android/ttve/nativePort/TEVideoUtilsCallback;->listener:Lcom/ss/android/vesdk/VEFrameAvailableListener;

    .line 27
    return-void
.end method
