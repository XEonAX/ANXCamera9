.class public Lcom/arcsoft/avatar/c/a;
.super Lcom/arcsoft/avatar/c/b;
.source "AudioEncoder.java"


# static fields
.field private static final dy:Ljava/lang/String; = "Arc_BaseEncoder"

.field private static final dz:Ljava/lang/String; = "Arc_Audio_Encoder"


# instance fields
.field private final A:I

.field private E:I

.field public final NAME:Ljava/lang/String;

.field private final cf:I

.field private dA:Landroid/media/AudioRecord;

.field private dB:Ljava/lang/Thread;

.field private final dC:Ljava/lang/String;

.field private dD:I

.field private dE:I

.field private dF:I

.field private dG:I

.field private dH:I

.field private dI:Ljava/lang/Object;

.field private dJ:J

.field private dK:Z

.field private dh:I

.field private final x:I

.field private final y:I

.field private final z:I


# direct methods
.method public constructor <init>(Lcom/arcsoft/avatar/c/f;Ljava/lang/Object;Lcom/arcsoft/avatar/c/g;)V
    .locals 2

    invoke-direct {p0, p1, p2, p3}, Lcom/arcsoft/avatar/c/b;-><init>(Lcom/arcsoft/avatar/c/f;Ljava/lang/Object;Lcom/arcsoft/avatar/c/g;)V

    const-string p1, "ARC_S"

    iput-object p1, p0, Lcom/arcsoft/avatar/c/a;->NAME:Ljava/lang/String;

    const p1, 0xac44

    iput p1, p0, Lcom/arcsoft/avatar/c/a;->x:I

    const/16 p2, 0x10

    iput p2, p0, Lcom/arcsoft/avatar/c/a;->y:I

    const/4 p3, 0x2

    iput p3, p0, Lcom/arcsoft/avatar/c/a;->z:I

    const/4 v0, 0x6

    iput v0, p0, Lcom/arcsoft/avatar/c/a;->A:I

    const-string v1, "audio/mp4a-latm"

    iput-object v1, p0, Lcom/arcsoft/avatar/c/a;->dC:Ljava/lang/String;

    const v1, 0x1e8480

    iput v1, p0, Lcom/arcsoft/avatar/c/a;->cf:I

    iput p1, p0, Lcom/arcsoft/avatar/c/a;->dh:I

    iput p2, p0, Lcom/arcsoft/avatar/c/a;->E:I

    iput p3, p0, Lcom/arcsoft/avatar/c/a;->dD:I

    iput v0, p0, Lcom/arcsoft/avatar/c/a;->dE:I

    iput v1, p0, Lcom/arcsoft/avatar/c/a;->dF:I

    new-instance p1, Ljava/lang/Object;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/arcsoft/avatar/c/a;->dI:Ljava/lang/Object;

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/arcsoft/avatar/c/a;->dM:Z

    const-wide/16 p1, 0x0

    iput-wide p1, p0, Lcom/arcsoft/avatar/c/a;->dJ:J

    return-void
.end method

.method static synthetic a(Lcom/arcsoft/avatar/c/a;)Landroid/media/AudioRecord;
    .locals 0

    iget-object p0, p0, Lcom/arcsoft/avatar/c/a;->dA:Landroid/media/AudioRecord;

    return-object p0
.end method

.method static synthetic b(Lcom/arcsoft/avatar/c/a;)I
    .locals 0

    iget p0, p0, Lcom/arcsoft/avatar/c/a;->dH:I

    return p0
.end method

.method private b()Z
    .locals 8

    iget v0, p0, Lcom/arcsoft/avatar/c/a;->dh:I

    iget v1, p0, Lcom/arcsoft/avatar/c/a;->E:I

    iget v2, p0, Lcom/arcsoft/avatar/c/a;->dD:I

    invoke-static {v0, v1, v2}, Landroid/media/AudioRecord;->getMinBufferSize(III)I

    move-result v0

    iput v0, p0, Lcom/arcsoft/avatar/c/a;->dG:I

    const/4 v0, 0x0

    :try_start_0
    new-instance v7, Landroid/media/AudioRecord;

    iget v2, p0, Lcom/arcsoft/avatar/c/a;->dE:I

    iget v3, p0, Lcom/arcsoft/avatar/c/a;->dh:I

    iget v4, p0, Lcom/arcsoft/avatar/c/a;->E:I

    iget v5, p0, Lcom/arcsoft/avatar/c/a;->dD:I

    iget v6, p0, Lcom/arcsoft/avatar/c/a;->dG:I

    move-object v1, v7

    invoke-direct/range {v1 .. v6}, Landroid/media/AudioRecord;-><init>(IIIII)V

    iput-object v7, p0, Lcom/arcsoft/avatar/c/a;->dA:Landroid/media/AudioRecord;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v1

    iget-object v2, p0, Lcom/arcsoft/avatar/c/a;->dV:Lcom/arcsoft/avatar/c/g;

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/arcsoft/avatar/c/a;->dV:Lcom/arcsoft/avatar/c/g;

    const/16 v3, 0x271

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v2, v3, v4}, Lcom/arcsoft/avatar/c/g;->onRecordingListener(ILjava/lang/Object;)V

    :cond_0
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    :goto_0
    iget-object v1, p0, Lcom/arcsoft/avatar/c/a;->dA:Landroid/media/AudioRecord;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/arcsoft/avatar/c/a;->dA:Landroid/media/AudioRecord;

    invoke-virtual {v1}, Landroid/media/AudioRecord;->getState()I

    move-result v1

    const/4 v2, 0x1

    if-eq v2, v1, :cond_1

    goto :goto_1

    :cond_1
    iget v0, p0, Lcom/arcsoft/avatar/c/a;->dG:I

    iput v0, p0, Lcom/arcsoft/avatar/c/a;->dH:I

    return v2

    :cond_2
    :goto_1
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/arcsoft/avatar/c/a;->dA:Landroid/media/AudioRecord;

    return v0
.end method

.method private c()Z
    .locals 7

    const-string v0, "audio/mp4a-latm"

    iget v1, p0, Lcom/arcsoft/avatar/c/a;->dh:I

    iget v2, p0, Lcom/arcsoft/avatar/c/a;->E:I

    invoke-static {v0, v1, v2}, Landroid/media/MediaFormat;->createAudioFormat(Ljava/lang/String;II)Landroid/media/MediaFormat;

    move-result-object v0

    const-string v1, "aac-profile"

    const/4 v2, 0x2

    invoke-virtual {v0, v1, v2}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    const-string v1, "channel-count"

    invoke-direct {p0}, Lcom/arcsoft/avatar/c/a;->d()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    const-string v1, "bitrate"

    iget v2, p0, Lcom/arcsoft/avatar/c/a;->dF:I

    invoke-virtual {v0, v1, v2}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    const/4 v1, 0x0

    const/4 v2, 0x0

    :try_start_0
    const-string v3, "audio/mp4a-latm"

    invoke-static {v3}, Landroid/media/MediaCodec;->createEncoderByType(Ljava/lang/String;)Landroid/media/MediaCodec;

    move-result-object v3

    iput-object v3, p0, Lcom/arcsoft/avatar/c/a;->dR:Landroid/media/MediaCodec;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v3

    iput-object v2, p0, Lcom/arcsoft/avatar/c/a;->dR:Landroid/media/MediaCodec;

    iget-object v4, p0, Lcom/arcsoft/avatar/c/a;->dV:Lcom/arcsoft/avatar/c/g;

    if-eqz v4, :cond_0

    iget-object v4, p0, Lcom/arcsoft/avatar/c/a;->dV:Lcom/arcsoft/avatar/c/g;

    const/16 v5, 0x221

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-interface {v4, v5, v6}, Lcom/arcsoft/avatar/c/g;->onRecordingListener(ILjava/lang/Object;)V

    :cond_0
    invoke-virtual {v3}, Ljava/io/IOException;->printStackTrace()V

    :goto_0
    iget-object v3, p0, Lcom/arcsoft/avatar/c/a;->dR:Landroid/media/MediaCodec;

    if-nez v3, :cond_1

    return v1

    :cond_1
    const/4 v3, 0x1

    :try_start_1
    iget-object v4, p0, Lcom/arcsoft/avatar/c/a;->dR:Landroid/media/MediaCodec;

    invoke-virtual {v4, v0, v2, v2, v3}, Landroid/media/MediaCodec;->configure(Landroid/media/MediaFormat;Landroid/view/Surface;Landroid/media/MediaCrypto;I)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    :catch_1
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    iget-object v0, p0, Lcom/arcsoft/avatar/c/a;->dV:Lcom/arcsoft/avatar/c/g;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/arcsoft/avatar/c/a;->dV:Lcom/arcsoft/avatar/c/g;

    const/16 v2, 0x222

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v2, v1}, Lcom/arcsoft/avatar/c/g;->onRecordingListener(ILjava/lang/Object;)V

    :cond_2
    :goto_1
    return v3
.end method

.method private d()I
    .locals 2

    iget v0, p0, Lcom/arcsoft/avatar/c/a;->dD:I

    const/16 v1, 0xc

    if-ne v1, v0, :cond_0

    const/4 v0, 0x2

    return v0

    :cond_0
    const/4 v0, 0x1

    return v0
.end method


# virtual methods
.method public f(Z)V
    .locals 0

    invoke-direct {p0}, Lcom/arcsoft/avatar/c/a;->b()Z

    move-result p1

    if-nez p1, :cond_0

    return-void

    :cond_0
    invoke-direct {p0}, Lcom/arcsoft/avatar/c/a;->c()Z

    move-result p1

    if-nez p1, :cond_1

    return-void

    :cond_1
    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/arcsoft/avatar/c/a;->dK:Z

    return-void
.end method

.method public release(Z)V
    .locals 2

    nop

    iget-object v0, p0, Lcom/arcsoft/avatar/c/a;->dB:Ljava/lang/Thread;

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    :try_start_0
    iget-object v1, p0, Lcom/arcsoft/avatar/c/a;->dB:Ljava/lang/Thread;

    invoke-virtual {v1}, Ljava/lang/Thread;->join()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :goto_0
    iput-object v0, p0, Lcom/arcsoft/avatar/c/a;->dB:Ljava/lang/Thread;

    goto :goto_2

    :catchall_0
    move-exception p1

    goto :goto_1

    :catch_0
    move-exception v1

    :try_start_1
    invoke-virtual {v1}, Ljava/lang/InterruptedException;->printStackTrace()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :goto_1
    iput-object v0, p0, Lcom/arcsoft/avatar/c/a;->dB:Ljava/lang/Thread;

    throw p1

    :cond_0
    :goto_2
    iget-object v0, p0, Lcom/arcsoft/avatar/c/a;->dA:Landroid/media/AudioRecord;

    invoke-virtual {v0}, Landroid/media/AudioRecord;->release()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/arcsoft/avatar/c/a;->dK:Z

    invoke-super {p0, p1}, Lcom/arcsoft/avatar/c/b;->release(Z)V

    return-void
.end method

.method public startRecording()V
    .locals 2

    iget-boolean v0, p0, Lcom/arcsoft/avatar/c/a;->dK:Z

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/arcsoft/avatar/c/a;->dB:Ljava/lang/Thread;

    if-nez v0, :cond_1

    invoke-super {p0}, Lcom/arcsoft/avatar/c/b;->startRecording()V

    new-instance v0, Lcom/arcsoft/avatar/c/a$1;

    const-string v1, "Arc_Audio_Encoder"

    invoke-direct {v0, p0, v1}, Lcom/arcsoft/avatar/c/a$1;-><init>(Lcom/arcsoft/avatar/c/a;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/arcsoft/avatar/c/a;->dB:Ljava/lang/Thread;

    iget-object v0, p0, Lcom/arcsoft/avatar/c/a;->dB:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    return-void

    :cond_1
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Audio encoder thread has been started already, can not start twice."

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public t()V
    .locals 0

    return-void
.end method
