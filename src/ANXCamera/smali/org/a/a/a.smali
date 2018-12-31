.class public Lorg/a/a/a;
.super Ljava/lang/Object;
.source "AudioPlayer.java"


# instance fields
.field private mHandle:J

.field private mStatus:I

.field private ua:Landroid/media/AudioTrack;

.field private ub:J

.field private uc:Ljava/lang/Thread;

.field private ud:Lorg/a/a/b;


# direct methods
.method public constructor <init>(J)V
    .locals 3

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/a/a/a;->ua:Landroid/media/AudioTrack;

    .line 17
    const-wide/16 v1, 0x0

    iput-wide v1, p0, Lorg/a/a/a;->ub:J

    .line 19
    iput-object v0, p0, Lorg/a/a/a;->uc:Ljava/lang/Thread;

    .line 20
    iput-object v0, p0, Lorg/a/a/a;->ud:Lorg/a/a/b;

    .line 25
    const/4 v0, 0x0

    iput v0, p0, Lorg/a/a/a;->mStatus:I

    .line 26
    iput-wide p1, p0, Lorg/a/a/a;->mHandle:J

    .line 27
    return-void
.end method

.method static synthetic a(Lorg/a/a/a;)Landroid/media/AudioTrack;
    .locals 0

    .line 14
    iget-object p0, p0, Lorg/a/a/a;->ua:Landroid/media/AudioTrack;

    return-object p0
.end method

.method static synthetic b(Lorg/a/a/a;)I
    .locals 0

    .line 14
    iget p0, p0, Lorg/a/a/a;->mStatus:I

    return p0
.end method

.method static synthetic c(Lorg/a/a/a;)J
    .locals 2

    .line 14
    iget-wide v0, p0, Lorg/a/a/a;->mHandle:J

    return-wide v0
.end method

.method static synthetic d(Lorg/a/a/a;)Lorg/a/a/b;
    .locals 0

    .line 14
    iget-object p0, p0, Lorg/a/a/a;->ud:Lorg/a/a/b;

    return-object p0
.end method

.method private hN()V
    .locals 8

    .line 124
    invoke-direct {p0}, Lorg/a/a/a;->hO()V

    .line 126
    new-instance v7, Landroid/media/AudioTrack;

    iget-wide v0, p0, Lorg/a/a/a;->ub:J

    long-to-int v5, v0

    const/4 v1, 0x3

    const v2, 0xac44

    const/16 v3, 0xc

    const/4 v4, 0x2

    const/4 v6, 0x1

    move-object v0, v7

    invoke-direct/range {v0 .. v6}, Landroid/media/AudioTrack;-><init>(IIIIII)V

    iput-object v7, p0, Lorg/a/a/a;->ua:Landroid/media/AudioTrack;

    .line 129
    return-void
.end method

.method private hO()V
    .locals 2

    .line 134
    iget-object v0, p0, Lorg/a/a/a;->ua:Landroid/media/AudioTrack;

    if-eqz v0, :cond_1

    .line 135
    iget-object v0, p0, Lorg/a/a/a;->ua:Landroid/media/AudioTrack;

    invoke-virtual {v0}, Landroid/media/AudioTrack;->flush()V

    .line 136
    iget-object v0, p0, Lorg/a/a/a;->ua:Landroid/media/AudioTrack;

    invoke-virtual {v0}, Landroid/media/AudioTrack;->getPlayState()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 137
    iget-object v0, p0, Lorg/a/a/a;->ua:Landroid/media/AudioTrack;

    invoke-virtual {v0}, Landroid/media/AudioTrack;->stop()V

    .line 139
    :cond_0
    iget-object v0, p0, Lorg/a/a/a;->ua:Landroid/media/AudioTrack;

    invoke-virtual {v0}, Landroid/media/AudioTrack;->release()V

    .line 140
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/a/a/a;->ua:Landroid/media/AudioTrack;

    .line 142
    :cond_1
    return-void
.end method

.method private hP()I
    .locals 2

    .line 146
    iget v0, p0, Lorg/a/a/a;->mStatus:I

    const/4 v1, 0x2

    if-eq v0, v1, :cond_0

    .line 147
    const/4 v0, -0x1

    return v0

    .line 150
    :cond_0
    iget-object v0, p0, Lorg/a/a/a;->ud:Lorg/a/a/b;

    if-nez v0, :cond_1

    .line 151
    const/4 v0, -0x2

    return v0

    .line 153
    :cond_1
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lorg/a/a/a$1;

    invoke-direct {v1, p0}, Lorg/a/a/a$1;-><init>(Lorg/a/a/a;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    iput-object v0, p0, Lorg/a/a/a;->uc:Ljava/lang/Thread;

    .line 187
    iget-object v0, p0, Lorg/a/a/a;->uc:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 188
    const/4 v0, 0x0

    return v0
.end method


# virtual methods
.method public a(Lorg/a/a/b;)Z
    .locals 6

    .line 40
    iput-object p1, p0, Lorg/a/a/a;->ud:Lorg/a/a/b;

    .line 42
    const p1, 0xac44

    const/16 v0, 0xc

    const/4 v1, 0x2

    invoke-static {p1, v0, v1}, Landroid/media/AudioTrack;->getMinBufferSize(III)I

    move-result p1

    int-to-long v0, p1

    iput-wide v0, p0, Lorg/a/a/a;->ub:J

    .line 44
    iget-wide v0, p0, Lorg/a/a/a;->ub:J

    const-wide/16 v2, 0x0

    cmp-long p1, v0, v2

    const/4 v0, 0x0

    if-gtz p1, :cond_0

    return v0

    .line 46
    :cond_0
    invoke-direct {p0}, Lorg/a/a/a;->hN()V

    .line 48
    iget-object p1, p0, Lorg/a/a/a;->ua:Landroid/media/AudioTrack;

    invoke-virtual {p1}, Landroid/media/AudioTrack;->getState()I

    move-result p1

    const/4 v1, 0x1

    if-eq p1, v1, :cond_1

    return v0

    .line 50
    :cond_1
    iput v1, p0, Lorg/a/a/a;->mStatus:I

    .line 55
    iget-object p1, p0, Lorg/a/a/a;->ud:Lorg/a/a/b;

    if-eqz p1, :cond_2

    .line 56
    iget-object p1, p0, Lorg/a/a/a;->ud:Lorg/a/a/b;

    iget-wide v2, p0, Lorg/a/a/a;->mHandle:J

    const-wide/16 v4, 0x1000

    invoke-interface {p1, v2, v3, v4, v5}, Lorg/a/a/b;->setAudioMinSize(JJ)V

    .line 59
    :cond_2
    return v1
.end method

.method public hJ()J
    .locals 2

    .line 30
    iget-wide v0, p0, Lorg/a/a/a;->mHandle:J

    return-wide v0
.end method

.method public hK()V
    .locals 1

    .line 68
    const/4 v0, 0x0

    iput v0, p0, Lorg/a/a/a;->mStatus:I

    .line 70
    invoke-virtual {p0}, Lorg/a/a/a;->hM()V

    .line 72
    invoke-direct {p0}, Lorg/a/a/a;->hO()V

    .line 74
    return-void
.end method

.method public hL()V
    .locals 2

    .line 78
    iget v0, p0, Lorg/a/a/a;->mStatus:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_0

    .line 79
    return-void

    .line 81
    :cond_0
    const/4 v0, 0x2

    iput v0, p0, Lorg/a/a/a;->mStatus:I

    .line 82
    invoke-direct {p0}, Lorg/a/a/a;->hP()I

    .line 83
    return-void
.end method

.method public hM()V
    .locals 3

    .line 105
    const/4 v0, 0x4

    iput v0, p0, Lorg/a/a/a;->mStatus:I

    .line 107
    iget-object v0, p0, Lorg/a/a/a;->ud:Lorg/a/a/b;

    if-eqz v0, :cond_0

    .line 108
    iget-object v0, p0, Lorg/a/a/a;->ud:Lorg/a/a/b;

    iget-wide v1, p0, Lorg/a/a/a;->mHandle:J

    invoke-interface {v0, v1, v2}, Lorg/a/a/b;->stopAudio(J)V

    .line 111
    :cond_0
    iget-object v0, p0, Lorg/a/a/a;->uc:Ljava/lang/Thread;

    if-eqz v0, :cond_1

    .line 113
    :try_start_0
    iget-object v0, p0, Lorg/a/a/a;->uc:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->join()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 115
    goto :goto_0

    .line 114
    :catch_0
    move-exception v0

    .line 118
    :cond_1
    :goto_0
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/a/a/a;->uc:Ljava/lang/Thread;

    .line 120
    return-void
.end method

.method public pause()V
    .locals 2

    .line 93
    iget v0, p0, Lorg/a/a/a;->mStatus:I

    const/4 v1, 0x2

    if-eq v0, v1, :cond_0

    .line 94
    return-void

    .line 96
    :cond_0
    const/4 v0, 0x3

    iput v0, p0, Lorg/a/a/a;->mStatus:I

    .line 97
    return-void
.end method

.method public resume()V
    .locals 2

    .line 86
    iget v0, p0, Lorg/a/a/a;->mStatus:I

    const/4 v1, 0x3

    if-eq v0, v1, :cond_0

    .line 87
    return-void

    .line 89
    :cond_0
    const/4 v0, 0x2

    iput v0, p0, Lorg/a/a/a;->mStatus:I

    .line 90
    return-void
.end method
