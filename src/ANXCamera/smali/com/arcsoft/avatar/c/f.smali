.class public Lcom/arcsoft/avatar/c/f;
.super Ljava/lang/Object;
.source "MuxerWrapper.java"


# static fields
.field private static final a:Ljava/lang/String; = "Arc_MuxerWrapper"

.field private static final ep:Ljava/lang/String; = ".mp4"

.field private static final g:Ljava/lang/String; = "video"


# instance fields
.field private b:I

.field private volatile c:I

.field private volatile dN:Z

.field private eA:J

.field private eB:J

.field private eC:Lcom/arcsoft/avatar/c/g;

.field private ez:Landroid/media/MediaMuxer;

.field private f:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;IILcom/arcsoft/avatar/c/g;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    invoke-direct {p0, p1, p3, p4}, Lcom/arcsoft/avatar/c/f;-><init>(Ljava/lang/String;ILcom/arcsoft/avatar/c/g;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILcom/arcsoft/avatar/c/g;)V
    .locals 3
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/arcsoft/avatar/c/f;->eA:J

    iput-wide v0, p0, Lcom/arcsoft/avatar/c/f;->eB:J

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/arcsoft/avatar/c/f;->eC:Lcom/arcsoft/avatar/c/g;

    iput-object p3, p0, Lcom/arcsoft/avatar/c/f;->eC:Lcom/arcsoft/avatar/c/g;

    iput-object p1, p0, Lcom/arcsoft/avatar/c/f;->f:Ljava/lang/String;

    const/4 p1, 0x0

    iput p1, p0, Lcom/arcsoft/avatar/c/f;->b:I

    iput p1, p0, Lcom/arcsoft/avatar/c/f;->c:I

    iput-boolean p1, p0, Lcom/arcsoft/avatar/c/f;->dN:Z

    invoke-direct {p0}, Lcom/arcsoft/avatar/c/f;->a()V

    const-string p3, "Arc_MuxerWrapper"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "MuxerWrapper()-> video name="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/arcsoft/avatar/c/f;->f:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p3, v1}, Lcom/arcsoft/avatar/d/f;->d(Ljava/lang/String;Ljava/lang/String;)V

    :try_start_0
    new-instance p3, Landroid/media/MediaMuxer;

    iget-object v1, p0, Lcom/arcsoft/avatar/c/f;->f:Ljava/lang/String;

    invoke-direct {p3, v1, p1}, Landroid/media/MediaMuxer;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Lcom/arcsoft/avatar/c/f;->ez:Landroid/media/MediaMuxer;

    iget-object p3, p0, Lcom/arcsoft/avatar/c/f;->ez:Landroid/media/MediaMuxer;

    invoke-virtual {p3, p2}, Landroid/media/MediaMuxer;->setOrientationHint(I)V

    const-string p3, "Arc_MuxerWrapper"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "MuxerWrapper()-> screenOrientation="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p3, p2}, Lcom/arcsoft/avatar/d/f;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p2

    const-string p3, "Arc_MuxerWrapper"

    const-string v1, "MuxerWrapper()-> create MediaMuxer failed."

    invoke-static {p3, v1}, Lcom/arcsoft/avatar/d/f;->e(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p2}, Ljava/io/IOException;->printStackTrace()V

    iput-object v0, p0, Lcom/arcsoft/avatar/c/f;->ez:Landroid/media/MediaMuxer;

    iget-object p2, p0, Lcom/arcsoft/avatar/c/f;->eC:Lcom/arcsoft/avatar/c/g;

    if-eqz p2, :cond_0

    iget-object p2, p0, Lcom/arcsoft/avatar/c/f;->eC:Lcom/arcsoft/avatar/c/g;

    const/16 p3, 0x261

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {p2, p3, p1}, Lcom/arcsoft/avatar/c/g;->onRecordingListener(ILjava/lang/Object;)V

    :cond_0
    :goto_0
    return-void
.end method

.method private a()V
    .locals 2

    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/arcsoft/avatar/c/f;->f:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_1

    new-instance v1, Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {v1}, Ljava/io/File;->mkdirs()Z

    :cond_0
    goto :goto_0

    :cond_1
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    :goto_0
    return-void
.end method


# virtual methods
.method public declared-synchronized J()V
    .locals 5

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/arcsoft/avatar/c/f;->ez:Landroid/media/MediaMuxer;

    if-nez v0, :cond_0

    const-string v0, "Arc_MuxerWrapper"

    const-string v1, "startMuxer()-> mMuxer must be created , but it\'s null until now"

    invoke-static {v0, v1}, Lcom/arcsoft/avatar/d/f;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    iget v0, p0, Lcom/arcsoft/avatar/c/f;->c:I

    const/4 v1, 0x1

    add-int/2addr v0, v1

    iput v0, p0, Lcom/arcsoft/avatar/c/f;->c:I

    iget v0, p0, Lcom/arcsoft/avatar/c/f;->c:I

    iget v2, p0, Lcom/arcsoft/avatar/c/f;->b:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-ne v0, v2, :cond_2

    :try_start_2
    const-string v0, "Arc_MuxerWrapper"

    const-string v2, "startMuxer()-> Muxerstart"

    invoke-static {v0, v2}, Lcom/arcsoft/avatar/d/f;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/arcsoft/avatar/c/f;->ez:Landroid/media/MediaMuxer;

    invoke-virtual {v0}, Landroid/media/MediaMuxer;->start()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    :catch_0
    move-exception v0

    :try_start_3
    const-string v2, "Arc_MuxerWrapper"

    const-string v3, "startMuxer()-> Muxer start failed"

    invoke-static {v2, v3}, Lcom/arcsoft/avatar/d/f;->e(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v2, p0, Lcom/arcsoft/avatar/c/f;->eC:Lcom/arcsoft/avatar/c/g;

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/arcsoft/avatar/c/f;->eC:Lcom/arcsoft/avatar/c/g;

    const/16 v3, 0x263

    const/4 v4, 0x0

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v2, v3, v4}, Lcom/arcsoft/avatar/c/g;->onRecordingListener(ILjava/lang/Object;)V

    :cond_1
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    :goto_0
    iput-boolean v1, p0, Lcom/arcsoft/avatar/c/f;->dN:Z

    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    const-string v0, "Arc_MuxerWrapper"

    const-string v1, "startMuxer()-> mMuxer is started"

    invoke-static {v0, v1}, Lcom/arcsoft/avatar/d/f;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :cond_2
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized K()V
    .locals 5

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/arcsoft/avatar/c/f;->ez:Landroid/media/MediaMuxer;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    iget v0, p0, Lcom/arcsoft/avatar/c/f;->c:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/arcsoft/avatar/c/f;->c:I

    const-string v0, "Arc_MuxerWrapper"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "stopMuxer()-> mEncoderCount="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/arcsoft/avatar/c/f;->c:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " ,maxCount="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/arcsoft/avatar/c/f;->b:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/arcsoft/avatar/d/f;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget v0, p0, Lcom/arcsoft/avatar/c/f;->c:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-nez v0, :cond_4

    const/4 v0, 0x0

    :try_start_2
    iget-object v1, p0, Lcom/arcsoft/avatar/c/f;->ez:Landroid/media/MediaMuxer;

    invoke-virtual {v1}, Landroid/media/MediaMuxer;->stop()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    :catch_0
    move-exception v1

    :try_start_3
    const-string v2, "Arc_MuxerWrapper"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "stopMuxer()-> muxer.stop() error="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Lcom/arcsoft/avatar/d/f;->e(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v1, p0, Lcom/arcsoft/avatar/c/f;->eC:Lcom/arcsoft/avatar/c/g;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/arcsoft/avatar/c/f;->eC:Lcom/arcsoft/avatar/c/g;

    const/16 v2, 0x265

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Lcom/arcsoft/avatar/c/g;->onRecordingListener(ILjava/lang/Object;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :cond_1
    :goto_0
    :try_start_4
    iget-object v1, p0, Lcom/arcsoft/avatar/c/f;->ez:Landroid/media/MediaMuxer;

    invoke-virtual {v1}, Landroid/media/MediaMuxer;->release()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_1

    :catch_1
    move-exception v1

    :try_start_5
    const-string v2, "Arc_MuxerWrapper"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "stopMuxer()-> muxer.release() error="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Lcom/arcsoft/avatar/d/f;->e(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v1, p0, Lcom/arcsoft/avatar/c/f;->eC:Lcom/arcsoft/avatar/c/g;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/arcsoft/avatar/c/f;->eC:Lcom/arcsoft/avatar/c/g;

    const/16 v2, 0x266

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {v1, v2, v0}, Lcom/arcsoft/avatar/c/g;->onRecordingListener(ILjava/lang/Object;)V

    :cond_2
    :goto_1
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/arcsoft/avatar/c/f;->ez:Landroid/media/MediaMuxer;

    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/arcsoft/avatar/c/f;->f:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_3

    const-string v1, "Arc_MuxerWrapper"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "stopMuxer()->  video size = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/arcsoft/avatar/d/f;->d(Ljava/lang/String;Ljava/lang/String;)V

    const-wide/16 v1, 0x0

    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v3

    cmp-long v1, v1, v3

    if-nez v1, :cond_3

    invoke-virtual {v0}, Ljava/io/File;->isFile()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    const-string v0, "Arc_MuxerWrapper"

    const-string v1, "stopMuxer()->  video size = 0 delete."

    invoke-static {v0, v1}, Lcom/arcsoft/avatar/d/f;->d(Ljava/lang/String;Ljava/lang/String;)V

    :cond_3
    const-string v0, "Arc_MuxerWrapper"

    const-string v1, "stopMuxer()-> Muxer is released."

    invoke-static {v0, v1}, Lcom/arcsoft/avatar/d/f;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    :cond_4
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public L()J
    .locals 4

    iget-wide v0, p0, Lcom/arcsoft/avatar/c/f;->eB:J

    iget-wide v2, p0, Lcom/arcsoft/avatar/c/f;->eA:J

    sub-long/2addr v0, v2

    return-wide v0
.end method

.method public M()J
    .locals 2

    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/arcsoft/avatar/c/f;->f:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {v0}, Ljava/io/File;->isFile()Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v0

    return-wide v0

    :cond_1
    :goto_0
    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public declared-synchronized addTrack(Landroid/media/MediaFormat;)I
    .locals 4
    .param p1    # Landroid/media/MediaFormat;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/arcsoft/avatar/c/f;->ez:Landroid/media/MediaMuxer;

    if-nez v0, :cond_0

    const-string p1, "Arc_MuxerWrapper"

    const-string v0, "writeSampleData()-> mMuxer must be created , but it\'s null until now."

    invoke-static {p1, v0}, Lcom/arcsoft/avatar/d/f;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 p1, -0x1

    monitor-exit p0

    return p1

    :cond_0
    nop

    const/4 v0, 0x0

    :try_start_1
    iget-object v1, p0, Lcom/arcsoft/avatar/c/f;->ez:Landroid/media/MediaMuxer;

    invoke-virtual {v1, p1}, Landroid/media/MediaMuxer;->addTrack(Landroid/media/MediaFormat;)I

    move-result p1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catch_0
    move-exception p1

    :try_start_2
    iget-object v1, p0, Lcom/arcsoft/avatar/c/f;->eC:Lcom/arcsoft/avatar/c/g;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/arcsoft/avatar/c/f;->eC:Lcom/arcsoft/avatar/c/g;

    const/16 v2, 0x262

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Lcom/arcsoft/avatar/c/g;->onRecordingListener(ILjava/lang/Object;)V

    :cond_1
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move p1, v0

    :goto_0
    monitor-exit p0

    return p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public b(J)V
    .locals 0

    iput-wide p1, p0, Lcom/arcsoft/avatar/c/f;->eB:J

    return-void
.end method

.method public i(I)V
    .locals 1

    if-lez p1, :cond_0

    const/4 v0, 0x2

    if-gt p1, v0, :cond_0

    iput p1, p0, Lcom/arcsoft/avatar/c/f;->b:I

    return-void

    :cond_0
    new-instance p1, Ljava/lang/RuntimeException;

    const-string v0, "The encoder count must between 1 and 2."

    invoke-direct {p1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public isStarted()Z
    .locals 1

    iget-boolean v0, p0, Lcom/arcsoft/avatar/c/f;->dN:Z

    return v0
.end method

.method public setStartTime(J)V
    .locals 0

    iput-wide p1, p0, Lcom/arcsoft/avatar/c/f;->eA:J

    return-void
.end method

.method public declared-synchronized writeSampleData(ILjava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)V
    .locals 1
    .param p2    # Ljava/nio/ByteBuffer;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Landroid/media/MediaCodec$BufferInfo;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/arcsoft/avatar/c/f;->ez:Landroid/media/MediaMuxer;

    if-nez v0, :cond_0

    const-string p1, "Arc_MuxerWrapper"

    const-string p2, "writeSampleData()-> mMuxer must be created , but it\'s null until now."

    invoke-static {p1, p2}, Lcom/arcsoft/avatar/d/f;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/arcsoft/avatar/c/f;->ez:Landroid/media/MediaMuxer;

    invoke-virtual {v0, p1, p2, p3}, Landroid/media/MediaMuxer;->writeSampleData(ILjava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)V

    const-string p1, "Arc_MuxerWrapper"

    const-string p2, "writeSampleData()-> writeSampleData done"

    invoke-static {p1, p2}, Lcom/arcsoft/avatar/d/f;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catch_0
    move-exception p1

    :try_start_2
    const-string p2, "Arc_MuxerWrapper"

    const-string p3, "writeSampleData()-> writeSampleData failed"

    invoke-static {p2, p3}, Lcom/arcsoft/avatar/d/f;->e(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    iget-object p1, p0, Lcom/arcsoft/avatar/c/f;->eC:Lcom/arcsoft/avatar/c/g;

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/arcsoft/avatar/c/f;->eC:Lcom/arcsoft/avatar/c/g;

    const/16 p2, 0x264

    const/4 p3, 0x0

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    invoke-interface {p1, p2, p3}, Lcom/arcsoft/avatar/c/g;->onRecordingListener(ILjava/lang/Object;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :cond_1
    :goto_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method
