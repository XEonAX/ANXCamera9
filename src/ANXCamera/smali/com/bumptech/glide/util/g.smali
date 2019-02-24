.class public Lcom/bumptech/glide/util/g;
.super Ljava/io/FilterInputStream;
.source "MarkEnforcingInputStream.java"


# static fields
.field private static final UNSET:I = -0x80000000

.field private static final pn:I = -0x1


# instance fields
.field private po:I


# direct methods
.method public constructor <init>(Ljava/io/InputStream;)V
    .locals 0
    .param p1    # Ljava/io/InputStream;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 19
    invoke-direct {p0, p1}, Ljava/io/FilterInputStream;-><init>(Ljava/io/InputStream;)V

    .line 16
    const/high16 p1, -0x80000000

    iput p1, p0, Lcom/bumptech/glide/util/g;->po:I

    .line 20
    return-void
.end method

.method private f(J)J
    .locals 2

    .line 76
    iget v0, p0, Lcom/bumptech/glide/util/g;->po:I

    if-nez v0, :cond_0

    .line 77
    const-wide/16 p1, -0x1

    return-wide p1

    .line 78
    :cond_0
    iget v0, p0, Lcom/bumptech/glide/util/g;->po:I

    const/high16 v1, -0x80000000

    if-eq v0, v1, :cond_1

    iget v0, p0, Lcom/bumptech/glide/util/g;->po:I

    int-to-long v0, v0

    cmp-long v0, p1, v0

    if-lez v0, :cond_1

    .line 79
    iget p1, p0, Lcom/bumptech/glide/util/g;->po:I

    int-to-long p1, p1

    return-wide p1

    .line 81
    :cond_1
    return-wide p1
.end method

.method private g(J)V
    .locals 2

    .line 86
    iget v0, p0, Lcom/bumptech/glide/util/g;->po:I

    const/high16 v1, -0x80000000

    if-eq v0, v1, :cond_0

    const-wide/16 v0, -0x1

    cmp-long v0, p1, v0

    if-eqz v0, :cond_0

    .line 88
    iget v0, p0, Lcom/bumptech/glide/util/g;->po:I

    int-to-long v0, v0

    sub-long/2addr v0, p1

    long-to-int p1, v0

    iput p1, p0, Lcom/bumptech/glide/util/g;->po:I

    .line 90
    :cond_0
    return-void
.end method


# virtual methods
.method public available()I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 71
    iget v0, p0, Lcom/bumptech/glide/util/g;->po:I

    const/high16 v1, -0x80000000

    if-ne v0, v1, :cond_0

    invoke-super {p0}, Ljava/io/FilterInputStream;->available()I

    move-result v0

    goto :goto_0

    .line 72
    :cond_0
    iget v0, p0, Lcom/bumptech/glide/util/g;->po:I

    invoke-super {p0}, Ljava/io/FilterInputStream;->available()I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 71
    :goto_0
    return v0
.end method

.method public declared-synchronized mark(I)V
    .locals 0

    monitor-enter p0

    .line 24
    :try_start_0
    invoke-super {p0, p1}, Ljava/io/FilterInputStream;->mark(I)V

    .line 25
    iput p1, p0, Lcom/bumptech/glide/util/g;->po:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 26
    monitor-exit p0

    return-void

    .line 23
    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public read()I
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 30
    const-wide/16 v0, 0x1

    invoke-direct {p0, v0, v1}, Lcom/bumptech/glide/util/g;->f(J)J

    move-result-wide v2

    const-wide/16 v4, -0x1

    cmp-long v2, v2, v4

    if-nez v2, :cond_0

    .line 31
    const/4 v0, -0x1

    return v0

    .line 34
    :cond_0
    invoke-super {p0}, Ljava/io/FilterInputStream;->read()I

    move-result v2

    .line 35
    invoke-direct {p0, v0, v1}, Lcom/bumptech/glide/util/g;->g(J)V

    .line 36
    return v2
.end method

.method public read([BII)I
    .locals 2
    .param p1    # [B
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 41
    int-to-long v0, p3

    invoke-direct {p0, v0, v1}, Lcom/bumptech/glide/util/g;->f(J)J

    move-result-wide v0

    long-to-int p3, v0

    .line 42
    const/4 v0, -0x1

    if-ne p3, v0, :cond_0

    .line 43
    return v0

    .line 46
    :cond_0
    invoke-super {p0, p1, p2, p3}, Ljava/io/FilterInputStream;->read([BII)I

    move-result p1

    .line 47
    int-to-long p2, p1

    invoke-direct {p0, p2, p3}, Lcom/bumptech/glide/util/g;->g(J)V

    .line 48
    return p1
.end method

.method public declared-synchronized reset()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    .line 53
    :try_start_0
    invoke-super {p0}, Ljava/io/FilterInputStream;->reset()V

    .line 54
    const/high16 v0, -0x80000000

    iput v0, p0, Lcom/bumptech/glide/util/g;->po:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 55
    monitor-exit p0

    return-void

    .line 52
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public skip(J)J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 59
    invoke-direct {p0, p1, p2}, Lcom/bumptech/glide/util/g;->f(J)J

    move-result-wide p1

    .line 60
    const-wide/16 v0, -0x1

    cmp-long v0, p1, v0

    if-nez v0, :cond_0

    .line 61
    const-wide/16 p1, 0x0

    return-wide p1

    .line 64
    :cond_0
    invoke-super {p0, p1, p2}, Ljava/io/FilterInputStream;->skip(J)J

    move-result-wide p1

    .line 65
    invoke-direct {p0, p1, p2}, Lcom/bumptech/glide/util/g;->g(J)V

    .line 66
    return-wide p1
.end method
