.class public Lcom/ss/android/vesdk/VEAudioRecorder;
.super Ljava/lang/Object;
.source "VEAudioRecorder.java"

# interfaces
.implements Landroid/arch/lifecycle/LifecycleObserver;


# instance fields
.field private mAudioEncodeSettings:Lcom/ss/android/vesdk/VEAudioEncodeSettings;

.field private mAudioRecorder:Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;

.field private mCurrentTime:J

.field private mRuntime:Lcom/ss/android/vesdk/runtime/VERuntime;

.field private mWavFilePath:Ljava/lang/String;

.field private mbRecording:Z


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    invoke-static {}, Lcom/ss/android/vesdk/runtime/VERuntime;->getInstance()Lcom/ss/android/vesdk/runtime/VERuntime;

    move-result-object v0

    iput-object v0, p0, Lcom/ss/android/vesdk/VEAudioRecorder;->mRuntime:Lcom/ss/android/vesdk/runtime/VERuntime;

    .line 41
    new-instance v0, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;

    new-instance v1, Lcom/ss/android/ttve/audio/TEDubWriter;

    invoke-direct {v1}, Lcom/ss/android/ttve/audio/TEDubWriter;-><init>()V

    invoke-direct {v0, v1}, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;-><init>(Lcom/ss/android/ttve/audio/TEAudioWriterInterface;)V

    iput-object v0, p0, Lcom/ss/android/vesdk/VEAudioRecorder;->mAudioRecorder:Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;

    .line 42
    return-void
.end method

.method public constructor <init>(Landroid/arch/lifecycle/LifecycleOwner;)V
    .locals 0
    .param p1    # Landroid/arch/lifecycle/LifecycleOwner;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 51
    invoke-direct {p0}, Lcom/ss/android/vesdk/VEAudioRecorder;-><init>()V

    .line 52
    invoke-interface {p1}, Landroid/arch/lifecycle/LifecycleOwner;->getLifecycle()Landroid/arch/lifecycle/Lifecycle;

    move-result-object p1

    invoke-virtual {p1, p0}, Landroid/arch/lifecycle/Lifecycle;->addObserver(Landroid/arch/lifecycle/LifecycleObserver;)V

    .line 53
    return-void
.end method


# virtual methods
.method public delete(II)I
    .locals 1

    .line 120
    const/16 v0, -0x64

    if-lt p1, p2, :cond_0

    .line 121
    return v0

    .line 123
    :cond_0
    if-gez p1, :cond_1

    .line 124
    return v0

    .line 127
    :cond_1
    iget-object v0, p0, Lcom/ss/android/vesdk/VEAudioRecorder;->mWavFilePath:Ljava/lang/String;

    invoke-static {v0, p1, p2}, Lcom/ss/android/ttve/nativePort/TEVideoUtils;->clearWavSeg(Ljava/lang/String;II)I

    move-result p1

    return p1
.end method

.method public destory()V
    .locals 1
    .annotation runtime Landroid/arch/lifecycle/OnLifecycleEvent;
        value = .enum Landroid/arch/lifecycle/Lifecycle$Event;->ON_DESTROY:Landroid/arch/lifecycle/Lifecycle$Event;
    .end annotation

    .line 174
    iget-object v0, p0, Lcom/ss/android/vesdk/VEAudioRecorder;->mAudioRecorder:Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;

    invoke-virtual {v0}, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;->unInit()V

    .line 175
    return-void
.end method

.method public getCurrentTime()J
    .locals 2

    .line 138
    iget-wide v0, p0, Lcom/ss/android/vesdk/VEAudioRecorder;->mCurrentTime:J

    return-wide v0
.end method

.method public getWavFilePath()Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ss/android/vesdk/VEException;
        }
    .end annotation

    .line 149
    iget-boolean v0, p0, Lcom/ss/android/vesdk/VEAudioRecorder;->mbRecording:Z

    if-nez v0, :cond_0

    .line 151
    iget-object v0, p0, Lcom/ss/android/vesdk/VEAudioRecorder;->mWavFilePath:Ljava/lang/String;

    return-object v0

    .line 150
    :cond_0
    new-instance v0, Lcom/ss/android/vesdk/VEException;

    const/16 v1, -0x69

    const-string v2, "audio is recording"

    invoke-direct {v0, v1, v2}, Lcom/ss/android/vesdk/VEException;-><init>(ILjava/lang/String;)V

    throw v0
.end method

.method public init(Lcom/ss/android/vesdk/VEAudioEncodeSettings;I)I
    .locals 3

    .line 65
    iput-object p1, p0, Lcom/ss/android/vesdk/VEAudioRecorder;->mAudioEncodeSettings:Lcom/ss/android/vesdk/VEAudioEncodeSettings;

    .line 66
    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/ss/android/vesdk/VEAudioRecorder;->mbRecording:Z

    .line 67
    iget-object v0, p0, Lcom/ss/android/vesdk/VEAudioRecorder;->mRuntime:Lcom/ss/android/vesdk/runtime/VERuntime;

    invoke-virtual {v0}, Lcom/ss/android/vesdk/runtime/VERuntime;->getResManager()Lcom/ss/android/vesdk/runtime/VEResManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/ss/android/vesdk/runtime/VEResManager;->genRecordWavPath()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/ss/android/vesdk/VEAudioRecorder;->mWavFilePath:Ljava/lang/String;

    .line 69
    iget-object v0, p0, Lcom/ss/android/vesdk/VEAudioRecorder;->mAudioRecorder:Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;

    const/4 v1, 0x5

    invoke-virtual {v0, v1}, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;->init(I)V

    .line 72
    iget-object v0, p0, Lcom/ss/android/vesdk/VEAudioRecorder;->mWavFilePath:Ljava/lang/String;

    iget-object v1, p0, Lcom/ss/android/vesdk/VEAudioRecorder;->mAudioRecorder:Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;

    invoke-virtual {v1}, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;->getSampleRateInHz()I

    move-result v1

    const/4 v2, 0x2

    invoke-static {v0, v1, v2, p2}, Lcom/ss/android/ttve/nativePort/TEVideoUtils;->generateMuteWav(Ljava/lang/String;III)I

    .line 74
    return p1
.end method

.method public startRecord(FII)I
    .locals 6

    .line 85
    iget-boolean v0, p0, Lcom/ss/android/vesdk/VEAudioRecorder;->mbRecording:Z

    if-eqz v0, :cond_0

    .line 86
    const/16 p1, -0x69

    return p1

    .line 88
    :cond_0
    iget-object v0, p0, Lcom/ss/android/vesdk/VEAudioRecorder;->mAudioRecorder:Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;

    iget-object v1, p0, Lcom/ss/android/vesdk/VEAudioRecorder;->mWavFilePath:Ljava/lang/String;

    float-to-double v2, p1

    move v4, p2

    move v5, p3

    invoke-virtual/range {v0 .. v5}, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;->startRecording(Ljava/lang/String;DII)V

    .line 90
    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/ss/android/vesdk/VEAudioRecorder;->mbRecording:Z

    .line 91
    const/4 p1, 0x0

    return p1
.end method

.method public stopRecord()J
    .locals 2

    .line 101
    iget-boolean v0, p0, Lcom/ss/android/vesdk/VEAudioRecorder;->mbRecording:Z

    if-nez v0, :cond_0

    .line 102
    const-wide/16 v0, -0x69

    return-wide v0

    .line 104
    :cond_0
    iget-object v0, p0, Lcom/ss/android/vesdk/VEAudioRecorder;->mAudioRecorder:Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;

    invoke-virtual {v0}, Lcom/ss/android/ttve/audio/TEBufferedAudioRecorder;->stopRecording()Z

    .line 106
    nop

    .line 107
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/ss/android/vesdk/VEAudioRecorder;->mbRecording:Z

    .line 108
    iget-wide v0, p0, Lcom/ss/android/vesdk/VEAudioRecorder;->mCurrentTime:J

    return-wide v0
.end method

.method public toAAC()Ljava/lang/String;
    .locals 1

    .line 163
    iget-object v0, p0, Lcom/ss/android/vesdk/VEAudioRecorder;->mRuntime:Lcom/ss/android/vesdk/runtime/VERuntime;

    invoke-virtual {v0}, Lcom/ss/android/vesdk/runtime/VERuntime;->getResManager()Lcom/ss/android/vesdk/runtime/VEResManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/ss/android/vesdk/runtime/VEResManager;->genRecordAacPath()Ljava/lang/String;

    move-result-object v0

    .line 166
    return-object v0
.end method
