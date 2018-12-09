.class public Lcom/bumptech/glide/load/engine/a/e;
.super Ljava/lang/Object;
.source "DiskLruCacheWrapper.java"

# interfaces
.implements Lcom/bumptech/glide/load/engine/a/a;


# static fields
.field private static final TAG:Ljava/lang/String; = "DiskLruCacheWrapper"

.field private static final hq:I = 0x1

.field private static final hr:I = 0x1

.field private static hs:Lcom/bumptech/glide/load/engine/a/e;


# instance fields
.field private final directory:Ljava/io/File;

.field private final ht:Lcom/bumptech/glide/load/engine/a/m;

.field private final hu:Lcom/bumptech/glide/load/engine/a/c;

.field private hv:Lcom/bumptech/glide/a/a;

.field private final maxSize:J


# direct methods
.method protected constructor <init>(Ljava/io/File;J)V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 73
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    new-instance v0, Lcom/bumptech/glide/load/engine/a/c;

    invoke-direct {v0}, Lcom/bumptech/glide/load/engine/a/c;-><init>()V

    iput-object v0, p0, Lcom/bumptech/glide/load/engine/a/e;->hu:Lcom/bumptech/glide/load/engine/a/c;

    .line 74
    iput-object p1, p0, Lcom/bumptech/glide/load/engine/a/e;->directory:Ljava/io/File;

    .line 75
    iput-wide p2, p0, Lcom/bumptech/glide/load/engine/a/e;->maxSize:J

    .line 76
    new-instance p1, Lcom/bumptech/glide/load/engine/a/m;

    invoke-direct {p1}, Lcom/bumptech/glide/load/engine/a/m;-><init>()V

    iput-object p1, p0, Lcom/bumptech/glide/load/engine/a/e;->ht:Lcom/bumptech/glide/load/engine/a/m;

    .line 77
    return-void
.end method

.method public static declared-synchronized a(Ljava/io/File;J)Lcom/bumptech/glide/load/engine/a/a;
    .locals 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const-class v0, Lcom/bumptech/glide/load/engine/a/e;

    monitor-enter v0

    .line 49
    :try_start_0
    sget-object v1, Lcom/bumptech/glide/load/engine/a/e;->hs:Lcom/bumptech/glide/load/engine/a/e;

    if-nez v1, :cond_0

    .line 50
    new-instance v1, Lcom/bumptech/glide/load/engine/a/e;

    invoke-direct {v1, p0, p1, p2}, Lcom/bumptech/glide/load/engine/a/e;-><init>(Ljava/io/File;J)V

    sput-object v1, Lcom/bumptech/glide/load/engine/a/e;->hs:Lcom/bumptech/glide/load/engine/a/e;

    .line 52
    :cond_0
    sget-object p0, Lcom/bumptech/glide/load/engine/a/e;->hs:Lcom/bumptech/glide/load/engine/a/e;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object p0

    .line 48
    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method public static b(Ljava/io/File;J)Lcom/bumptech/glide/load/engine/a/a;
    .locals 1

    .line 64
    new-instance v0, Lcom/bumptech/glide/load/engine/a/e;

    invoke-direct {v0, p0, p1, p2}, Lcom/bumptech/glide/load/engine/a/e;-><init>(Ljava/io/File;J)V

    return-object v0
.end method

.method private declared-synchronized bw()Lcom/bumptech/glide/a/a;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    .line 80
    :try_start_0
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/a/e;->hv:Lcom/bumptech/glide/a/a;

    if-nez v0, :cond_0

    .line 81
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/a/e;->directory:Ljava/io/File;

    iget-wide v1, p0, Lcom/bumptech/glide/load/engine/a/e;->maxSize:J

    const/4 v3, 0x1

    invoke-static {v0, v3, v3, v1, v2}, Lcom/bumptech/glide/a/a;->a(Ljava/io/File;IIJ)Lcom/bumptech/glide/a/a;

    move-result-object v0

    iput-object v0, p0, Lcom/bumptech/glide/load/engine/a/e;->hv:Lcom/bumptech/glide/a/a;

    .line 83
    :cond_0
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/a/e;->hv:Lcom/bumptech/glide/a/a;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    .line 79
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private declared-synchronized bx()V
    .locals 1

    monitor-enter p0

    .line 179
    const/4 v0, 0x0

    :try_start_0
    iput-object v0, p0, Lcom/bumptech/glide/load/engine/a/e;->hv:Lcom/bumptech/glide/a/a;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 180
    monitor-exit p0

    return-void

    .line 178
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method


# virtual methods
.method public a(Lcom/bumptech/glide/load/c;Lcom/bumptech/glide/load/engine/a/a$b;)V
    .locals 4

    .line 113
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/a/e;->ht:Lcom/bumptech/glide/load/engine/a/m;

    invoke-virtual {v0, p1}, Lcom/bumptech/glide/load/engine/a/m;->h(Lcom/bumptech/glide/load/c;)Ljava/lang/String;

    move-result-object v0

    .line 114
    iget-object v1, p0, Lcom/bumptech/glide/load/engine/a/e;->hu:Lcom/bumptech/glide/load/engine/a/c;

    invoke-virtual {v1, v0}, Lcom/bumptech/glide/load/engine/a/c;->k(Ljava/lang/String;)V

    .line 116
    :try_start_0
    const-string v1, "DiskLruCacheWrapper"

    const/4 v2, 0x2

    invoke-static {v1, v2}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 117
    const-string v1, "DiskLruCacheWrapper"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Put: Obtained: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " for for Key: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 122
    :cond_0
    :try_start_1
    invoke-direct {p0}, Lcom/bumptech/glide/load/engine/a/e;->bw()Lcom/bumptech/glide/a/a;

    move-result-object p1

    .line 123
    invoke-virtual {p1, v0}, Lcom/bumptech/glide/a/a;->c(Ljava/lang/String;)Lcom/bumptech/glide/a/a$d;

    move-result-object v1
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 124
    if-eqz v1, :cond_1

    .line 146
    iget-object p1, p0, Lcom/bumptech/glide/load/engine/a/e;->hu:Lcom/bumptech/glide/load/engine/a/c;

    invoke-virtual {p1, v0}, Lcom/bumptech/glide/load/engine/a/c;->l(Ljava/lang/String;)V

    .line 125
    return-void

    .line 128
    :cond_1
    :try_start_2
    invoke-virtual {p1, v0}, Lcom/bumptech/glide/a/a;->f(Ljava/lang/String;)Lcom/bumptech/glide/a/a$b;

    move-result-object p1
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 129
    if-eqz p1, :cond_3

    .line 133
    const/4 v1, 0x0

    :try_start_3
    invoke-virtual {p1, v1}, Lcom/bumptech/glide/a/a$b;->f(I)Ljava/io/File;

    move-result-object v1

    .line 134
    invoke-interface {p2, v1}, Lcom/bumptech/glide/load/engine/a/a$b;->f(Ljava/io/File;)Z

    move-result p2

    if-eqz p2, :cond_2

    .line 135
    invoke-virtual {p1}, Lcom/bumptech/glide/a/a$b;->commit()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 138
    :cond_2
    :try_start_4
    invoke-virtual {p1}, Lcom/bumptech/glide/a/a$b;->abortUnlessCommitted()V

    .line 139
    nop

    .line 144
    goto :goto_0

    .line 138
    :catchall_0
    move-exception p2

    invoke-virtual {p1}, Lcom/bumptech/glide/a/a$b;->abortUnlessCommitted()V

    throw p2

    .line 130
    :cond_3
    new-instance p1, Ljava/lang/IllegalStateException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Had two simultaneous puts for: "

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 140
    :catch_0
    move-exception p1

    .line 141
    :try_start_5
    const-string p2, "DiskLruCacheWrapper"

    const/4 v1, 0x5

    invoke-static {p2, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result p2

    if-eqz p2, :cond_4

    .line 142
    const-string p2, "DiskLruCacheWrapper"

    const-string v1, "Unable to put to disk cache"

    invoke-static {p2, v1, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 146
    :cond_4
    :goto_0
    iget-object p1, p0, Lcom/bumptech/glide/load/engine/a/e;->hu:Lcom/bumptech/glide/load/engine/a/c;

    invoke-virtual {p1, v0}, Lcom/bumptech/glide/load/engine/a/c;->l(Ljava/lang/String;)V

    .line 147
    nop

    .line 148
    return-void

    .line 146
    :catchall_1
    move-exception p1

    iget-object p2, p0, Lcom/bumptech/glide/load/engine/a/e;->hu:Lcom/bumptech/glide/load/engine/a/c;

    invoke-virtual {p2, v0}, Lcom/bumptech/glide/load/engine/a/c;->l(Ljava/lang/String;)V

    throw p1
.end method

.method public declared-synchronized clear()V
    .locals 3

    monitor-enter p0

    .line 165
    :try_start_0
    invoke-direct {p0}, Lcom/bumptech/glide/load/engine/a/e;->bw()Lcom/bumptech/glide/a/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/bumptech/glide/a/a;->delete()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 174
    :cond_0
    :goto_0
    :try_start_1
    invoke-direct {p0}, Lcom/bumptech/glide/load/engine/a/e;->bx()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 175
    goto :goto_1

    .line 174
    :catchall_0
    move-exception v0

    goto :goto_2

    .line 166
    :catch_0
    move-exception v0

    .line 167
    :try_start_2
    const-string v1, "DiskLruCacheWrapper"

    const/4 v2, 0x5

    invoke-static {v1, v2}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 168
    const-string v1, "DiskLruCacheWrapper"

    const-string v2, "Unable to clear disk cache or disk cache cleared externally"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 176
    :goto_1
    monitor-exit p0

    return-void

    .line 174
    :goto_2
    :try_start_3
    invoke-direct {p0}, Lcom/bumptech/glide/load/engine/a/e;->bx()V

    throw v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 164
    :catchall_1
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public e(Lcom/bumptech/glide/load/c;)Ljava/io/File;
    .locals 4

    .line 88
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/a/e;->ht:Lcom/bumptech/glide/load/engine/a/m;

    invoke-virtual {v0, p1}, Lcom/bumptech/glide/load/engine/a/m;->h(Lcom/bumptech/glide/load/c;)Ljava/lang/String;

    move-result-object v0

    .line 89
    const-string v1, "DiskLruCacheWrapper"

    const/4 v2, 0x2

    invoke-static {v1, v2}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 90
    const-string v1, "DiskLruCacheWrapper"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Get: Obtained: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " for for Key: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 92
    :cond_0
    const/4 p1, 0x0

    .line 97
    :try_start_0
    invoke-direct {p0}, Lcom/bumptech/glide/load/engine/a/e;->bw()Lcom/bumptech/glide/a/a;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/bumptech/glide/a/a;->c(Ljava/lang/String;)Lcom/bumptech/glide/a/a$d;

    move-result-object v0

    .line 98
    if-eqz v0, :cond_1

    .line 99
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/bumptech/glide/a/a$d;->f(I)Ljava/io/File;

    move-result-object v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 105
    move-object p1, v0

    :cond_1
    goto :goto_0

    .line 101
    :catch_0
    move-exception v0

    .line 102
    const-string v1, "DiskLruCacheWrapper"

    const/4 v2, 0x5

    invoke-static {v1, v2}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 103
    const-string v1, "DiskLruCacheWrapper"

    const-string v2, "Unable to get from disk cache"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 106
    :cond_2
    :goto_0
    return-object p1
.end method

.method public f(Lcom/bumptech/glide/load/c;)V
    .locals 2

    .line 152
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/a/e;->ht:Lcom/bumptech/glide/load/engine/a/m;

    invoke-virtual {v0, p1}, Lcom/bumptech/glide/load/engine/a/m;->h(Lcom/bumptech/glide/load/c;)Ljava/lang/String;

    move-result-object p1

    .line 154
    :try_start_0
    invoke-direct {p0}, Lcom/bumptech/glide/load/engine/a/e;->bw()Lcom/bumptech/glide/a/a;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/bumptech/glide/a/a;->remove(Ljava/lang/String;)Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 159
    goto :goto_0

    .line 155
    :catch_0
    move-exception p1

    .line 156
    const-string v0, "DiskLruCacheWrapper"

    const/4 v1, 0x5

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 157
    const-string v0, "DiskLruCacheWrapper"

    const-string v1, "Unable to delete from disk cache"

    invoke-static {v0, v1, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 160
    :cond_0
    :goto_0
    return-void
.end method
