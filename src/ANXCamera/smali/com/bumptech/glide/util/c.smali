.class public Lcom/bumptech/glide/util/c;
.super Ljava/io/InputStream;
.source "ExceptionCatchingInputStream.java"


# static fields
.field private static final ph:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue<",
            "Lcom/bumptech/glide/util/c;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private pi:Ljava/io/InputStream;

.field private pj:Ljava/io/IOException;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 19
    const/4 v0, 0x0

    invoke-static {v0}, Lcom/bumptech/glide/util/k;->U(I)Ljava/util/Queue;

    move-result-object v0

    sput-object v0, Lcom/bumptech/glide/util/c;->ph:Ljava/util/Queue;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 44
    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    .line 46
    return-void
.end method

.method static eC()V
    .locals 1

    .line 39
    :goto_0
    sget-object v0, Lcom/bumptech/glide/util/c;->ph:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 40
    sget-object v0, Lcom/bumptech/glide/util/c;->ph:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->remove()Ljava/lang/Object;

    goto :goto_0

    .line 42
    :cond_0
    return-void
.end method

.method public static h(Ljava/io/InputStream;)Lcom/bumptech/glide/util/c;
    .locals 2
    .param p0    # Ljava/io/InputStream;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 27
    sget-object v0, Lcom/bumptech/glide/util/c;->ph:Ljava/util/Queue;

    monitor-enter v0

    .line 28
    :try_start_0
    sget-object v1, Lcom/bumptech/glide/util/c;->ph:Ljava/util/Queue;

    invoke-interface {v1}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/bumptech/glide/util/c;

    .line 29
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 30
    if-nez v1, :cond_0

    .line 31
    new-instance v1, Lcom/bumptech/glide/util/c;

    invoke-direct {v1}, Lcom/bumptech/glide/util/c;-><init>()V

    .line 33
    :cond_0
    invoke-virtual {v1, p0}, Lcom/bumptech/glide/util/c;->setInputStream(Ljava/io/InputStream;)V

    .line 34
    return-object v1

    .line 29
    :catchall_0
    move-exception p0

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0
.end method


# virtual methods
.method public available()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 54
    iget-object v0, p0, Lcom/bumptech/glide/util/c;->pi:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->available()I

    move-result v0

    return v0
.end method

.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 59
    iget-object v0, p0, Lcom/bumptech/glide/util/c;->pi:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 60
    return-void
.end method

.method public eD()Ljava/io/IOException;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .line 127
    iget-object v0, p0, Lcom/bumptech/glide/util/c;->pj:Ljava/io/IOException;

    return-object v0
.end method

.method public mark(I)V
    .locals 1

    .line 64
    iget-object v0, p0, Lcom/bumptech/glide/util/c;->pi:Ljava/io/InputStream;

    invoke-virtual {v0, p1}, Ljava/io/InputStream;->mark(I)V

    .line 65
    return-void
.end method

.method public markSupported()Z
    .locals 1

    .line 69
    iget-object v0, p0, Lcom/bumptech/glide/util/c;->pi:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->markSupported()Z

    move-result v0

    return v0
.end method

.method public read()I
    .locals 1

    .line 117
    :try_start_0
    iget-object v0, p0, Lcom/bumptech/glide/util/c;->pi:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->read()I

    move-result v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 121
    goto :goto_0

    .line 118
    :catch_0
    move-exception v0

    .line 119
    iput-object v0, p0, Lcom/bumptech/glide/util/c;->pj:Ljava/io/IOException;

    .line 120
    const/4 v0, -0x1

    .line 122
    :goto_0
    return v0
.end method

.method public read([B)I
    .locals 1

    .line 76
    :try_start_0
    iget-object v0, p0, Lcom/bumptech/glide/util/c;->pi:Ljava/io/InputStream;

    invoke-virtual {v0, p1}, Ljava/io/InputStream;->read([B)I

    move-result p1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 80
    goto :goto_0

    .line 77
    :catch_0
    move-exception p1

    .line 78
    iput-object p1, p0, Lcom/bumptech/glide/util/c;->pj:Ljava/io/IOException;

    .line 79
    const/4 p1, -0x1

    .line 81
    :goto_0
    return p1
.end method

.method public read([BII)I
    .locals 1

    .line 88
    :try_start_0
    iget-object v0, p0, Lcom/bumptech/glide/util/c;->pi:Ljava/io/InputStream;

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/InputStream;->read([BII)I

    move-result p1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 92
    goto :goto_0

    .line 89
    :catch_0
    move-exception p1

    .line 90
    iput-object p1, p0, Lcom/bumptech/glide/util/c;->pj:Ljava/io/IOException;

    .line 91
    const/4 p1, -0x1

    .line 93
    :goto_0
    return p1
.end method

.method public release()V
    .locals 2

    .line 131
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/bumptech/glide/util/c;->pj:Ljava/io/IOException;

    .line 132
    iput-object v0, p0, Lcom/bumptech/glide/util/c;->pi:Ljava/io/InputStream;

    .line 133
    sget-object v0, Lcom/bumptech/glide/util/c;->ph:Ljava/util/Queue;

    monitor-enter v0

    .line 134
    :try_start_0
    sget-object v1, Lcom/bumptech/glide/util/c;->ph:Ljava/util/Queue;

    invoke-interface {v1, p0}, Ljava/util/Queue;->offer(Ljava/lang/Object;)Z

    .line 135
    monitor-exit v0

    .line 136
    return-void

    .line 135
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public declared-synchronized reset()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    .line 98
    :try_start_0
    iget-object v0, p0, Lcom/bumptech/glide/util/c;->pi:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->reset()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 99
    monitor-exit p0

    return-void

    .line 97
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method setInputStream(Ljava/io/InputStream;)V
    .locals 0
    .param p1    # Ljava/io/InputStream;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 49
    iput-object p1, p0, Lcom/bumptech/glide/util/c;->pi:Ljava/io/InputStream;

    .line 50
    return-void
.end method

.method public skip(J)J
    .locals 1

    .line 105
    :try_start_0
    iget-object v0, p0, Lcom/bumptech/glide/util/c;->pi:Ljava/io/InputStream;

    invoke-virtual {v0, p1, p2}, Ljava/io/InputStream;->skip(J)J

    move-result-wide p1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 109
    goto :goto_0

    .line 106
    :catch_0
    move-exception p1

    .line 107
    iput-object p1, p0, Lcom/bumptech/glide/util/c;->pj:Ljava/io/IOException;

    .line 108
    const-wide/16 p1, 0x0

    .line 110
    :goto_0
    return-wide p1
.end method
