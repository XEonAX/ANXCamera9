.class public Lcom/android/camera/LocalParallelService$LocalBinder;
.super Landroid/os/Binder;
.source "LocalParallelService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/LocalParallelService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "LocalBinder"
.end annotation


# instance fields
.field private mAlivePostProcessor:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/xiaomi/camera/core/PostProcessor;",
            ">;"
        }
    .end annotation
.end field

.field private mCurrentBufferFormat:Lcom/xiaomi/engine/BufferFormat;

.field private mCurrentParams:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/xiaomi/protocol/IImageReaderParameterSets;",
            ">;"
        }
    .end annotation
.end field

.field private mCurrentPostProcessor:Lcom/xiaomi/camera/core/PostProcessor;

.field final synthetic this$0:Lcom/android/camera/LocalParallelService;


# direct methods
.method constructor <init>(Lcom/android/camera/LocalParallelService;)V
    .locals 3

    .line 85
    iput-object p1, p0, Lcom/android/camera/LocalParallelService$LocalBinder;->this$0:Lcom/android/camera/LocalParallelService;

    invoke-direct {p0}, Landroid/os/Binder;-><init>()V

    .line 80
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/camera/LocalParallelService$LocalBinder;->mAlivePostProcessor:Ljava/util/List;

    .line 86
    invoke-static {}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->instance()Lcom/xiaomi/camera/imagecodec/JpegEncoder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->init(Landroid/content/Context;)V

    .line 88
    sget-boolean v0, Lcom/mi/config/b;->qV:Z

    if-eqz v0, :cond_0

    .line 89
    invoke-static {}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->instance()Lcom/xiaomi/camera/imagecodec/JpegEncoder;

    move-result-object v0

    const-string v1, "5"

    const-string v2, "6"

    invoke-virtual {v0, v1, v2}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->setVTCameraIds(Ljava/lang/String;Ljava/lang/String;)V

    .line 94
    :cond_0
    invoke-static {p1}, Lcom/xiaomi/engine/MiCameraAlgo;->init(Landroid/content/Context;)V

    .line 95
    return-void
.end method

.method static synthetic access$200(Lcom/android/camera/LocalParallelService$LocalBinder;Lcom/xiaomi/camera/core/PostProcessor;)V
    .locals 0

    .line 79
    invoke-direct {p0, p1}, Lcom/android/camera/LocalParallelService$LocalBinder;->onPostProcessorClosed(Lcom/xiaomi/camera/core/PostProcessor;)V

    return-void
.end method

.method private isSetsEquals(Ljava/util/List;Ljava/util/List;)Z
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/xiaomi/protocol/IImageReaderParameterSets;",
            ">;",
            "Ljava/util/List<",
            "Lcom/xiaomi/protocol/IImageReaderParameterSets;",
            ">;)Z"
        }
    .end annotation

    .line 126
    const/4 v0, 0x0

    if-eqz p1, :cond_6

    if-nez p2, :cond_0

    goto :goto_3

    .line 129
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v2

    if-eq v1, v2, :cond_1

    .line 130
    return v0

    .line 133
    :cond_1
    nop

    .line 134
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    move v2, v0

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_4

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/xiaomi/protocol/IImageReaderParameterSets;

    .line 135
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_3

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/xiaomi/protocol/IImageReaderParameterSets;

    .line 136
    invoke-virtual {v3, v5}, Lcom/xiaomi/protocol/IImageReaderParameterSets;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 137
    add-int/lit8 v2, v2, 0x1

    .line 138
    goto :goto_2

    .line 140
    :cond_2
    goto :goto_1

    .line 141
    :cond_3
    :goto_2
    goto :goto_0

    .line 143
    :cond_4
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    if-ne p1, v2, :cond_5

    const/4 v0, 0x1

    nop

    :cond_5
    return v0

    .line 127
    :cond_6
    :goto_3
    return v0
.end method

.method private onPostProcessorClosed(Lcom/xiaomi/camera/core/PostProcessor;)V
    .locals 1

    .line 202
    iget-object v0, p0, Lcom/android/camera/LocalParallelService$LocalBinder;->mAlivePostProcessor:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 203
    return-void
.end method


# virtual methods
.method public configCaptureOutputBuffer(Ljava/util/List;)Ljava/util/List;
    .locals 3
    .param p1    # Ljava/util/List;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/xiaomi/protocol/IImageReaderParameterSets;",
            ">;)",
            "Ljava/util/List<",
            "Landroid/view/Surface;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 99
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2

    .line 106
    iget-object v0, p0, Lcom/android/camera/LocalParallelService$LocalBinder;->mCurrentParams:Ljava/util/List;

    invoke-direct {p0, p1, v0}, Lcom/android/camera/LocalParallelService$LocalBinder;->isSetsEquals(Ljava/util/List;Ljava/util/List;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/LocalParallelService$LocalBinder;->mCurrentPostProcessor:Lcom/xiaomi/camera/core/PostProcessor;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/LocalParallelService$LocalBinder;->mCurrentPostProcessor:Lcom/xiaomi/camera/core/PostProcessor;

    .line 108
    invoke-virtual {v0}, Lcom/xiaomi/camera/core/PostProcessor;->getSurfaceList()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 109
    invoke-static {}, Lcom/android/camera/LocalParallelService;->access$300()Ljava/lang/String;

    move-result-object p1

    const-string v0, "configCaptureOutputBuffer: sets is not changed, return the old."

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 110
    iget-object p1, p0, Lcom/android/camera/LocalParallelService$LocalBinder;->mCurrentPostProcessor:Lcom/xiaomi/camera/core/PostProcessor;

    invoke-virtual {p1}, Lcom/xiaomi/camera/core/PostProcessor;->getSurfaceList()Ljava/util/List;

    move-result-object p1

    return-object p1

    .line 112
    :cond_0
    iget-object v0, p0, Lcom/android/camera/LocalParallelService$LocalBinder;->mCurrentPostProcessor:Lcom/xiaomi/camera/core/PostProcessor;

    if-eqz v0, :cond_1

    .line 113
    iget-object v0, p0, Lcom/android/camera/LocalParallelService$LocalBinder;->mCurrentPostProcessor:Lcom/xiaomi/camera/core/PostProcessor;

    invoke-virtual {v0}, Lcom/xiaomi/camera/core/PostProcessor;->destroyWhenTasksFinished()V

    .line 115
    :cond_1
    iput-object p1, p0, Lcom/android/camera/LocalParallelService$LocalBinder;->mCurrentParams:Ljava/util/List;

    .line 116
    invoke-static {}, Lcom/android/camera/LocalParallelService;->access$300()Ljava/lang/String;

    move-result-object v0

    const-string v1, "configCaptureOutputBuffer: create a new PostProcessor"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 117
    new-instance v0, Lcom/xiaomi/camera/core/PostProcessor;

    iget-object v1, p0, Lcom/android/camera/LocalParallelService$LocalBinder;->this$0:Lcom/android/camera/LocalParallelService;

    iget-object v2, p0, Lcom/android/camera/LocalParallelService$LocalBinder;->this$0:Lcom/android/camera/LocalParallelService;

    invoke-static {v2}, Lcom/android/camera/LocalParallelService;->access$400(Lcom/android/camera/LocalParallelService;)Lcom/xiaomi/camera/core/PostProcessor$PostProcessStatusCallback;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/xiaomi/camera/core/PostProcessor;-><init>(Landroid/content/Context;Lcom/xiaomi/camera/core/PostProcessor$PostProcessStatusCallback;)V

    iput-object v0, p0, Lcom/android/camera/LocalParallelService$LocalBinder;->mCurrentPostProcessor:Lcom/xiaomi/camera/core/PostProcessor;

    .line 118
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera/LocalParallelService$LocalBinder;->mCurrentBufferFormat:Lcom/xiaomi/engine/BufferFormat;

    .line 119
    iget-object v0, p0, Lcom/android/camera/LocalParallelService$LocalBinder;->mAlivePostProcessor:Ljava/util/List;

    iget-object v1, p0, Lcom/android/camera/LocalParallelService$LocalBinder;->mCurrentPostProcessor:Lcom/xiaomi/camera/core/PostProcessor;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 120
    iget-object v0, p0, Lcom/android/camera/LocalParallelService$LocalBinder;->mCurrentPostProcessor:Lcom/xiaomi/camera/core/PostProcessor;

    invoke-virtual {v0, p1}, Lcom/xiaomi/camera/core/PostProcessor;->configHALOutputSurface(Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    return-object p1

    .line 100
    :cond_2
    new-instance p1, Landroid/os/RemoteException;

    const-string v0, "List is empty"

    invoke-direct {p1, v0}, Landroid/os/RemoteException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public configCaptureSession(Lcom/xiaomi/engine/BufferFormat;)V
    .locals 5
    .param p1    # Lcom/xiaomi/engine/BufferFormat;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 147
    iget-object v0, p0, Lcom/android/camera/LocalParallelService$LocalBinder;->mCurrentBufferFormat:Lcom/xiaomi/engine/BufferFormat;

    invoke-virtual {p1, v0}, Lcom/xiaomi/engine/BufferFormat;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 148
    iput-object p1, p0, Lcom/android/camera/LocalParallelService$LocalBinder;->mCurrentBufferFormat:Lcom/xiaomi/engine/BufferFormat;

    .line 149
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 150
    iget-object p1, p0, Lcom/android/camera/LocalParallelService$LocalBinder;->mCurrentPostProcessor:Lcom/xiaomi/camera/core/PostProcessor;

    iget-object v2, p0, Lcom/android/camera/LocalParallelService$LocalBinder;->mCurrentBufferFormat:Lcom/xiaomi/engine/BufferFormat;

    invoke-virtual {p1, v2}, Lcom/xiaomi/camera/core/PostProcessor;->configCaptureSession(Lcom/xiaomi/engine/BufferFormat;)V

    .line 151
    invoke-static {}, Lcom/android/camera/LocalParallelService;->access$300()Ljava/lang/String;

    move-result-object p1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "configCaptureSession: create session cost: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    sub-long/2addr v3, v0

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 152
    goto :goto_0

    .line 153
    :cond_0
    invoke-static {}, Lcom/android/camera/LocalParallelService;->access$300()Ljava/lang/String;

    move-result-object p1

    const-string v0, "current BufferFormat is equals last BufferFormat, so need not re-config, returned."

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 156
    :goto_0
    return-void
.end method

.method public isIdle()Z
    .locals 2

    .line 192
    iget-object v0, p0, Lcom/android/camera/LocalParallelService$LocalBinder;->mAlivePostProcessor:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/xiaomi/camera/core/PostProcessor;

    .line 193
    invoke-virtual {v1}, Lcom/xiaomi/camera/core/PostProcessor;->isIdle()Z

    move-result v1

    if-nez v1, :cond_0

    .line 194
    const/4 v0, 0x0

    return v0

    .line 196
    :cond_0
    goto :goto_0

    .line 198
    :cond_1
    const/4 v0, 0x1

    return v0
.end method

.method public needWaitProcess()Z
    .locals 1

    .line 180
    iget-object v0, p0, Lcom/android/camera/LocalParallelService$LocalBinder;->mCurrentPostProcessor:Lcom/xiaomi/camera/core/PostProcessor;

    invoke-virtual {v0}, Lcom/xiaomi/camera/core/PostProcessor;->needWaitImageClose()Z

    move-result v0

    return v0
.end method

.method public onCaptureCompleted(Lcom/xiaomi/protocol/ICustomCaptureResult;Z)V
    .locals 1

    .line 167
    iget-object v0, p0, Lcom/android/camera/LocalParallelService$LocalBinder;->mCurrentPostProcessor:Lcom/xiaomi/camera/core/PostProcessor;

    invoke-virtual {v0}, Lcom/xiaomi/camera/core/PostProcessor;->getCaptureStatusListener()Lcom/xiaomi/camera/core/PostProcessor$CaptureStatusListener;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/xiaomi/camera/core/PostProcessor$CaptureStatusListener;->onCaptureCompleted(Lcom/xiaomi/protocol/ICustomCaptureResult;Z)V

    .line 168
    return-void
.end method

.method public onCaptureFailed(JI)V
    .locals 1

    .line 171
    iget-object v0, p0, Lcom/android/camera/LocalParallelService$LocalBinder;->mCurrentPostProcessor:Lcom/xiaomi/camera/core/PostProcessor;

    invoke-virtual {v0}, Lcom/xiaomi/camera/core/PostProcessor;->getCaptureStatusListener()Lcom/xiaomi/camera/core/PostProcessor$CaptureStatusListener;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3}, Lcom/xiaomi/camera/core/PostProcessor$CaptureStatusListener;->onCaptureFailed(JI)V

    .line 172
    return-void
.end method

.method public onCaptureStarted(Lcom/xiaomi/camera/core/ParallelTaskData;)V
    .locals 1

    .line 163
    iget-object v0, p0, Lcom/android/camera/LocalParallelService$LocalBinder;->mCurrentPostProcessor:Lcom/xiaomi/camera/core/PostProcessor;

    invoke-virtual {v0}, Lcom/xiaomi/camera/core/PostProcessor;->getCaptureStatusListener()Lcom/xiaomi/camera/core/PostProcessor$CaptureStatusListener;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/xiaomi/camera/core/PostProcessor$CaptureStatusListener;->onCaptureStarted(Lcom/xiaomi/camera/core/ParallelTaskData;)V

    .line 164
    return-void
.end method

.method public onServiceDestroy()V
    .locals 1

    .line 175
    invoke-static {}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->instance()Lcom/xiaomi/camera/imagecodec/JpegEncoder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->deInit()V

    .line 176
    invoke-static {}, Lcom/xiaomi/engine/MiCameraAlgo;->deInit()V

    .line 177
    return-void
.end method

.method public setImageSaver(Lcom/android/camera/storage/ImageSaver;)V
    .locals 1

    .line 188
    iget-object v0, p0, Lcom/android/camera/LocalParallelService$LocalBinder;->mCurrentPostProcessor:Lcom/xiaomi/camera/core/PostProcessor;

    invoke-virtual {v0, p1}, Lcom/xiaomi/camera/core/PostProcessor;->setImageSaver(Lcom/android/camera/storage/ImageSaver;)V

    .line 189
    return-void
.end method

.method public setJpegOutputSize(II)V
    .locals 1

    .line 159
    invoke-static {}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->instance()Lcom/xiaomi/camera/imagecodec/JpegEncoder;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->setJpegOutputSize(II)V

    .line 160
    return-void
.end method

.method public setOnPictureTakenListener(Lcom/android/camera/LocalParallelService$ServiceStatusListener;)V
    .locals 1

    .line 184
    iget-object v0, p0, Lcom/android/camera/LocalParallelService$LocalBinder;->this$0:Lcom/android/camera/LocalParallelService;

    invoke-static {v0, p1}, Lcom/android/camera/LocalParallelService;->access$002(Lcom/android/camera/LocalParallelService;Lcom/android/camera/LocalParallelService$ServiceStatusListener;)Lcom/android/camera/LocalParallelService$ServiceStatusListener;

    .line 185
    return-void
.end method
