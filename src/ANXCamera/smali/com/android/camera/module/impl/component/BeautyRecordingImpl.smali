.class public Lcom/android/camera/module/impl/component/BeautyRecordingImpl;
.super Ljava/lang/Object;
.source "BeautyRecordingImpl.java"

# interfaces
.implements Lcom/android/camera/protocol/ModeProtocol$BeautyRecording;


# instance fields
.field private recordingArrayList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/android/camera/protocol/ModeProtocol$HandleBeautyRecording;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/camera/module/impl/component/BeautyRecordingImpl;->recordingArrayList:Ljava/util/ArrayList;

    .line 18
    return-void
.end method

.method public static create()Lcom/android/camera/module/impl/component/BeautyRecordingImpl;
    .locals 1

    .line 21
    new-instance v0, Lcom/android/camera/module/impl/component/BeautyRecordingImpl;

    invoke-direct {v0}, Lcom/android/camera/module/impl/component/BeautyRecordingImpl;-><init>()V

    return-object v0
.end method


# virtual methods
.method public addBeautyStack(Lcom/android/camera/protocol/ModeProtocol$HandleBeautyRecording;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<P::",
            "Lcom/android/camera/protocol/ModeProtocol$HandleBeautyRecording;",
            ">(TP;)V"
        }
    .end annotation

    .line 37
    iget-object v0, p0, Lcom/android/camera/module/impl/component/BeautyRecordingImpl;->recordingArrayList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 38
    return-void
.end method

.method public handleAngleChang(F)V
    .locals 2

    .line 47
    iget-object v0, p0, Lcom/android/camera/module/impl/component/BeautyRecordingImpl;->recordingArrayList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/camera/protocol/ModeProtocol$HandleBeautyRecording;

    .line 48
    invoke-interface {v1, p1}, Lcom/android/camera/protocol/ModeProtocol$HandleBeautyRecording;->onAngleChanged(F)V

    .line 49
    goto :goto_0

    .line 50
    :cond_0
    return-void
.end method

.method public handleBeautyRecordingStart()V
    .locals 2

    .line 54
    iget-object v0, p0, Lcom/android/camera/module/impl/component/BeautyRecordingImpl;->recordingArrayList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/camera/protocol/ModeProtocol$HandleBeautyRecording;

    .line 55
    invoke-interface {v1}, Lcom/android/camera/protocol/ModeProtocol$HandleBeautyRecording;->onBeautyRecordingStart()V

    .line 56
    goto :goto_0

    .line 57
    :cond_0
    return-void
.end method

.method public handleBeautyRecordingStop()V
    .locals 2

    .line 61
    iget-object v0, p0, Lcom/android/camera/module/impl/component/BeautyRecordingImpl;->recordingArrayList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/camera/protocol/ModeProtocol$HandleBeautyRecording;

    .line 62
    invoke-interface {v1}, Lcom/android/camera/protocol/ModeProtocol$HandleBeautyRecording;->onBeautyRecordingStop()V

    .line 63
    goto :goto_0

    .line 64
    :cond_0
    return-void
.end method

.method public registerProtocol()V
    .locals 2

    .line 26
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xad

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 27
    return-void
.end method

.method public removeBeautyStack(Lcom/android/camera/protocol/ModeProtocol$HandleBeautyRecording;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<P::",
            "Lcom/android/camera/protocol/ModeProtocol$HandleBeautyRecording;",
            ">(TP;)V"
        }
    .end annotation

    .line 42
    iget-object v0, p0, Lcom/android/camera/module/impl/component/BeautyRecordingImpl;->recordingArrayList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 43
    return-void
.end method

.method public unRegisterProtocol()V
    .locals 2

    .line 31
    iget-object v0, p0, Lcom/android/camera/module/impl/component/BeautyRecordingImpl;->recordingArrayList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 32
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xad

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 33
    return-void
.end method
