.class Lcom/arcsoft/avatar/c/a$1;
.super Ljava/lang/Thread;
.source "AudioEncoder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/arcsoft/avatar/c/a;->startRecording()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic dL:Lcom/arcsoft/avatar/c/a;


# direct methods
.method constructor <init>(Lcom/arcsoft/avatar/c/a;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/arcsoft/avatar/c/a$1;->dL:Lcom/arcsoft/avatar/c/a;

    invoke-direct {p0, p2}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 13

    invoke-super {p0}, Ljava/lang/Thread;->run()V

    const-string v0, "ARC_S"

    invoke-virtual {p0, v0}, Lcom/arcsoft/avatar/c/a$1;->setName(Ljava/lang/String;)V

    const/16 v0, 0x272

    const/4 v1, 0x0

    :try_start_0
    iget-object v2, p0, Lcom/arcsoft/avatar/c/a$1;->dL:Lcom/arcsoft/avatar/c/a;

    invoke-static {v2}, Lcom/arcsoft/avatar/c/a;->a(Lcom/arcsoft/avatar/c/a;)Landroid/media/AudioRecord;

    move-result-object v2

    invoke-virtual {v2}, Landroid/media/AudioRecord;->startRecording()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v2

    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    iget-object v2, p0, Lcom/arcsoft/avatar/c/a$1;->dL:Lcom/arcsoft/avatar/c/a;

    iget-object v2, v2, Lcom/arcsoft/avatar/c/a;->dV:Lcom/arcsoft/avatar/c/g;

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/arcsoft/avatar/c/a$1;->dL:Lcom/arcsoft/avatar/c/a;

    iget-object v2, v2, Lcom/arcsoft/avatar/c/a;->dV:Lcom/arcsoft/avatar/c/g;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v2, v0, v3}, Lcom/arcsoft/avatar/c/g;->onRecordingListener(ILjava/lang/Object;)V

    :cond_0
    :goto_0
    :try_start_1
    iget-object v2, p0, Lcom/arcsoft/avatar/c/a$1;->dL:Lcom/arcsoft/avatar/c/a;

    iget-object v2, v2, Lcom/arcsoft/avatar/c/a;->dR:Landroid/media/MediaCodec;

    invoke-virtual {v2}, Landroid/media/MediaCodec;->start()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    :catch_1
    move-exception v2

    iget-object v2, p0, Lcom/arcsoft/avatar/c/a$1;->dL:Lcom/arcsoft/avatar/c/a;

    iget-object v2, v2, Lcom/arcsoft/avatar/c/a;->dV:Lcom/arcsoft/avatar/c/g;

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/arcsoft/avatar/c/a$1;->dL:Lcom/arcsoft/avatar/c/a;

    iget-object v2, v2, Lcom/arcsoft/avatar/c/a;->dV:Lcom/arcsoft/avatar/c/g;

    const/16 v3, 0x223

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v2, v3, v4}, Lcom/arcsoft/avatar/c/g;->onRecordingListener(ILjava/lang/Object;)V

    :cond_1
    :goto_1
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v2

    iget-object v4, p0, Lcom/arcsoft/avatar/c/a$1;->dL:Lcom/arcsoft/avatar/c/a;

    invoke-static {v4}, Lcom/arcsoft/avatar/c/a;->b(Lcom/arcsoft/avatar/c/a;)I

    move-result v4

    invoke-static {v4}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v4

    :cond_2
    :goto_2
    iget-object v5, p0, Lcom/arcsoft/avatar/c/a$1;->dL:Lcom/arcsoft/avatar/c/a;

    iget-boolean v5, v5, Lcom/arcsoft/avatar/c/a;->dN:Z

    const/16 v6, 0x273

    if-nez v5, :cond_7

    iget-object v5, p0, Lcom/arcsoft/avatar/c/a$1;->dL:Lcom/arcsoft/avatar/c/a;

    iget-boolean v5, v5, Lcom/arcsoft/avatar/c/a;->e:Z

    if-eqz v5, :cond_6

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v7

    iget-object v5, p0, Lcom/arcsoft/avatar/c/a$1;->dL:Lcom/arcsoft/avatar/c/a;

    iget-object v5, v5, Lcom/arcsoft/avatar/c/a;->dO:Ljava/lang/Object;

    monitor-enter v5

    :try_start_2
    iget-object v9, p0, Lcom/arcsoft/avatar/c/a$1;->dL:Lcom/arcsoft/avatar/c/a;

    iget-boolean v9, v9, Lcom/arcsoft/avatar/c/a;->e:Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    if-eqz v9, :cond_5

    :try_start_3
    iget-object v9, p0, Lcom/arcsoft/avatar/c/a$1;->dL:Lcom/arcsoft/avatar/c/a;

    invoke-static {v9}, Lcom/arcsoft/avatar/c/a;->a(Lcom/arcsoft/avatar/c/a;)Landroid/media/AudioRecord;

    move-result-object v9

    invoke-virtual {v9}, Landroid/media/AudioRecord;->stop()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_3

    :catch_2
    move-exception v9

    :try_start_4
    invoke-virtual {v9}, Ljava/lang/Exception;->printStackTrace()V

    iget-object v9, p0, Lcom/arcsoft/avatar/c/a$1;->dL:Lcom/arcsoft/avatar/c/a;

    iget-object v9, v9, Lcom/arcsoft/avatar/c/a;->dV:Lcom/arcsoft/avatar/c/g;

    if-eqz v9, :cond_3

    iget-object v9, p0, Lcom/arcsoft/avatar/c/a$1;->dL:Lcom/arcsoft/avatar/c/a;

    iget-object v9, v9, Lcom/arcsoft/avatar/c/a;->dV:Lcom/arcsoft/avatar/c/g;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-interface {v9, v6, v10}, Lcom/arcsoft/avatar/c/g;->onRecordingListener(ILjava/lang/Object;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    :cond_3
    :goto_3
    :try_start_5
    iget-object v6, p0, Lcom/arcsoft/avatar/c/a$1;->dL:Lcom/arcsoft/avatar/c/a;

    iget-object v6, v6, Lcom/arcsoft/avatar/c/a;->dO:Ljava/lang/Object;

    invoke-virtual {v6}, Ljava/lang/Object;->wait()V
    :try_end_5
    .catch Ljava/lang/InterruptedException; {:try_start_5 .. :try_end_5} :catch_4
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    :try_start_6
    iget-object v6, p0, Lcom/arcsoft/avatar/c/a$1;->dL:Lcom/arcsoft/avatar/c/a;

    invoke-static {v6}, Lcom/arcsoft/avatar/c/a;->a(Lcom/arcsoft/avatar/c/a;)Landroid/media/AudioRecord;

    move-result-object v6

    invoke-virtual {v6}, Landroid/media/AudioRecord;->startRecording()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_3
    .catch Ljava/lang/InterruptedException; {:try_start_6 .. :try_end_6} :catch_4
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    goto :goto_4

    :catch_3
    move-exception v6

    :try_start_7
    invoke-virtual {v6}, Ljava/lang/Exception;->printStackTrace()V

    iget-object v6, p0, Lcom/arcsoft/avatar/c/a$1;->dL:Lcom/arcsoft/avatar/c/a;

    iget-object v6, v6, Lcom/arcsoft/avatar/c/a;->dV:Lcom/arcsoft/avatar/c/g;

    if-eqz v6, :cond_4

    iget-object v6, p0, Lcom/arcsoft/avatar/c/a$1;->dL:Lcom/arcsoft/avatar/c/a;

    iget-object v6, v6, Lcom/arcsoft/avatar/c/a;->dV:Lcom/arcsoft/avatar/c/g;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-interface {v6, v0, v9}, Lcom/arcsoft/avatar/c/g;->onRecordingListener(ILjava/lang/Object;)V

    :cond_4
    :goto_4
    iget-object v6, p0, Lcom/arcsoft/avatar/c/a$1;->dL:Lcom/arcsoft/avatar/c/a;

    iget-wide v9, v6, Lcom/arcsoft/avatar/c/a;->dP:J

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v11

    sub-long/2addr v11, v7

    add-long/2addr v9, v11

    iput-wide v9, v6, Lcom/arcsoft/avatar/c/a;->dP:J

    iget-object v6, p0, Lcom/arcsoft/avatar/c/a$1;->dL:Lcom/arcsoft/avatar/c/a;

    iget-object v6, v6, Lcom/arcsoft/avatar/c/a;->dU:Ljava/util/Queue;

    iget-object v7, p0, Lcom/arcsoft/avatar/c/a$1;->dL:Lcom/arcsoft/avatar/c/a;

    iget-wide v7, v7, Lcom/arcsoft/avatar/c/a;->dP:J

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    invoke-interface {v6, v7}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z
    :try_end_7
    .catch Ljava/lang/InterruptedException; {:try_start_7 .. :try_end_7} :catch_4
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    goto :goto_5

    :catch_4
    move-exception v6

    :try_start_8
    invoke-virtual {v6}, Ljava/lang/InterruptedException;->printStackTrace()V

    :cond_5
    :goto_5
    monitor-exit v5

    goto :goto_6

    :catchall_0
    move-exception v0

    monitor-exit v5
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    throw v0

    :cond_6
    :goto_6
    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    iget-object v5, p0, Lcom/arcsoft/avatar/c/a$1;->dL:Lcom/arcsoft/avatar/c/a;

    invoke-static {v5}, Lcom/arcsoft/avatar/c/a;->a(Lcom/arcsoft/avatar/c/a;)Landroid/media/AudioRecord;

    move-result-object v5

    iget-object v6, p0, Lcom/arcsoft/avatar/c/a$1;->dL:Lcom/arcsoft/avatar/c/a;

    invoke-static {v6}, Lcom/arcsoft/avatar/c/a;->b(Lcom/arcsoft/avatar/c/a;)I

    move-result v6

    invoke-virtual {v5, v4, v6}, Landroid/media/AudioRecord;->read(Ljava/nio/ByteBuffer;I)I

    move-result v5

    if-lez v5, :cond_2

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v5

    sub-long/2addr v5, v2

    iget-object v7, p0, Lcom/arcsoft/avatar/c/a$1;->dL:Lcom/arcsoft/avatar/c/a;

    iget-wide v7, v7, Lcom/arcsoft/avatar/c/a;->dP:J

    sub-long/2addr v5, v7

    const-wide/16 v7, 0x3e8

    div-long/2addr v5, v7

    iget-object v7, p0, Lcom/arcsoft/avatar/c/a$1;->dL:Lcom/arcsoft/avatar/c/a;

    invoke-virtual {v7, v4, v5, v6}, Lcom/arcsoft/avatar/c/a;->a(Ljava/nio/ByteBuffer;J)V

    iget-object v5, p0, Lcom/arcsoft/avatar/c/a$1;->dL:Lcom/arcsoft/avatar/c/a;

    invoke-virtual {v5}, Lcom/arcsoft/avatar/c/a;->drain()V

    goto/16 :goto_2

    :cond_7
    :try_start_9
    iget-object v0, p0, Lcom/arcsoft/avatar/c/a$1;->dL:Lcom/arcsoft/avatar/c/a;

    invoke-static {v0}, Lcom/arcsoft/avatar/c/a;->a(Lcom/arcsoft/avatar/c/a;)Landroid/media/AudioRecord;

    move-result-object v0

    invoke-virtual {v0}, Landroid/media/AudioRecord;->stop()V
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_5

    goto :goto_7

    :catch_5
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    iget-object v0, p0, Lcom/arcsoft/avatar/c/a$1;->dL:Lcom/arcsoft/avatar/c/a;

    iget-object v0, v0, Lcom/arcsoft/avatar/c/a;->dV:Lcom/arcsoft/avatar/c/g;

    if-eqz v0, :cond_8

    iget-object v0, p0, Lcom/arcsoft/avatar/c/a$1;->dL:Lcom/arcsoft/avatar/c/a;

    iget-object v0, v0, Lcom/arcsoft/avatar/c/a;->dV:Lcom/arcsoft/avatar/c/g;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v6, v1}, Lcom/arcsoft/avatar/c/g;->onRecordingListener(ILjava/lang/Object;)V

    :cond_8
    :goto_7
    iget-object v0, p0, Lcom/arcsoft/avatar/c/a$1;->dL:Lcom/arcsoft/avatar/c/a;

    const/4 v1, 0x0

    const-wide/16 v2, 0x0

    invoke-virtual {v0, v1, v2, v3}, Lcom/arcsoft/avatar/c/a;->a(Ljava/nio/ByteBuffer;J)V

    iget-object v0, p0, Lcom/arcsoft/avatar/c/a$1;->dL:Lcom/arcsoft/avatar/c/a;

    invoke-virtual {v0}, Lcom/arcsoft/avatar/c/a;->drain()V

    return-void
.end method
