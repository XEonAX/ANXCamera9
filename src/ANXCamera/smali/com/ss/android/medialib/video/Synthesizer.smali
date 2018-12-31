.class public Lcom/ss/android/medialib/video/Synthesizer;
.super Ljava/lang/Object;
.source "Synthesizer.java"


# annotations
.annotation build Landroid/support/annotation/Keep;
.end annotation


# instance fields
.field private handle:J

.field private progressListener:Lcom/ss/android/medialib/listener/ProgressListener;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 25
    invoke-static {}, Lcom/ss/android/medialib/NativePort/NativeLibsLoader;->loadLibrary()V

    .line 26
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/ss/android/medialib/video/Synthesizer;->handle:J

    .line 31
    invoke-direct {p0}, Lcom/ss/android/medialib/video/Synthesizer;->nativeCreate()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/ss/android/medialib/video/Synthesizer;->handle:J

    .line 32
    return-void
.end method

.method private native nativeCancel(J)V
.end method

.method private native nativeCreate()J
.end method

.method private native nativeDestroy(J)V
.end method

.method private native nativeSynVideo(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
.end method


# virtual methods
.method public cancel()V
    .locals 4

    .line 74
    iget-wide v0, p0, Lcom/ss/android/medialib/video/Synthesizer;->handle:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    return-void

    .line 75
    :cond_0
    iget-wide v0, p0, Lcom/ss/android/medialib/video/Synthesizer;->handle:J

    invoke-direct {p0, v0, v1}, Lcom/ss/android/medialib/video/Synthesizer;->nativeCancel(J)V

    .line 76
    return-void
.end method

.method public destroy()V
    .locals 4

    .line 82
    iget-wide v0, p0, Lcom/ss/android/medialib/video/Synthesizer;->handle:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    return-void

    .line 83
    :cond_0
    iget-wide v0, p0, Lcom/ss/android/medialib/video/Synthesizer;->handle:J

    invoke-direct {p0, v0, v1}, Lcom/ss/android/medialib/video/Synthesizer;->nativeDestroy(J)V

    .line 84
    iput-wide v2, p0, Lcom/ss/android/medialib/video/Synthesizer;->handle:J

    .line 85
    return-void
.end method

.method public onProgress(I)V
    .locals 1

    .line 101
    iget-object v0, p0, Lcom/ss/android/medialib/video/Synthesizer;->progressListener:Lcom/ss/android/medialib/listener/ProgressListener;

    if-eqz v0, :cond_0

    .line 102
    iget-object v0, p0, Lcom/ss/android/medialib/video/Synthesizer;->progressListener:Lcom/ss/android/medialib/listener/ProgressListener;

    invoke-interface {v0, p1}, Lcom/ss/android/medialib/listener/ProgressListener;->onProgress(I)V

    .line 104
    :cond_0
    return-void
.end method

.method public setProgressListener(Lcom/ss/android/medialib/listener/ProgressListener;)V
    .locals 0

    .line 41
    iput-object p1, p0, Lcom/ss/android/medialib/video/Synthesizer;->progressListener:Lcom/ss/android/medialib/listener/ProgressListener;

    .line 42
    return-void
.end method

.method public synVideo(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
    .locals 7
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/WorkerThread;
    .end annotation

    .line 55
    iget-wide v0, p0, Lcom/ss/android/medialib/video/Synthesizer;->handle:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 56
    const/16 p1, -0x64

    return p1

    .line 59
    :cond_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_4

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_4

    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_1

    .line 63
    :cond_1
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_3

    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_2

    goto :goto_0

    .line 67
    :cond_2
    iget-wide v2, p0, Lcom/ss/android/medialib/video/Synthesizer;->handle:J

    move-object v1, p0

    move-object v4, p1

    move-object v5, p2

    move-object v6, p3

    invoke-direct/range {v1 .. v6}, Lcom/ss/android/medialib/video/Synthesizer;->nativeSynVideo(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result p1

    return p1

    .line 64
    :cond_3
    :goto_0
    const/16 p1, -0x65

    return p1

    .line 60
    :cond_4
    :goto_1
    const/16 p1, -0x66

    return p1
.end method
