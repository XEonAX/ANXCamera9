.class Lcom/bumptech/glide/load/a/a/e;
.super Ljava/lang/Object;
.source "ThumbnailStreamOpener.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "ThumbStreamOpener"

.field private static final dI:Lcom/bumptech/glide/load/a/a/a;


# instance fields
.field private final dJ:Lcom/bumptech/glide/load/a/a/a;

.field private final dK:Lcom/bumptech/glide/load/a/a/d;

.field private final dL:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/bumptech/glide/load/ImageHeaderParser;",
            ">;"
        }
    .end annotation
.end field

.field private final du:Lcom/bumptech/glide/load/engine/bitmap_recycle/b;

.field private final dv:Landroid/content/ContentResolver;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 21
    new-instance v0, Lcom/bumptech/glide/load/a/a/a;

    invoke-direct {v0}, Lcom/bumptech/glide/load/a/a/a;-><init>()V

    sput-object v0, Lcom/bumptech/glide/load/a/a/e;->dI:Lcom/bumptech/glide/load/a/a/a;

    return-void
.end method

.method constructor <init>(Ljava/util/List;Lcom/bumptech/glide/load/a/a/a;Lcom/bumptech/glide/load/a/a/d;Lcom/bumptech/glide/load/engine/bitmap_recycle/b;Landroid/content/ContentResolver;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/bumptech/glide/load/ImageHeaderParser;",
            ">;",
            "Lcom/bumptech/glide/load/a/a/a;",
            "Lcom/bumptech/glide/load/a/a/d;",
            "Lcom/bumptech/glide/load/engine/bitmap_recycle/b;",
            "Landroid/content/ContentResolver;",
            ")V"
        }
    .end annotation

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    iput-object p2, p0, Lcom/bumptech/glide/load/a/a/e;->dJ:Lcom/bumptech/glide/load/a/a/a;

    .line 42
    iput-object p3, p0, Lcom/bumptech/glide/load/a/a/e;->dK:Lcom/bumptech/glide/load/a/a/d;

    .line 43
    iput-object p4, p0, Lcom/bumptech/glide/load/a/a/e;->du:Lcom/bumptech/glide/load/engine/bitmap_recycle/b;

    .line 44
    iput-object p5, p0, Lcom/bumptech/glide/load/a/a/e;->dv:Landroid/content/ContentResolver;

    .line 45
    iput-object p1, p0, Lcom/bumptech/glide/load/a/a/e;->dL:Ljava/util/List;

    .line 46
    return-void
.end method

.method constructor <init>(Ljava/util/List;Lcom/bumptech/glide/load/a/a/d;Lcom/bumptech/glide/load/engine/bitmap_recycle/b;Landroid/content/ContentResolver;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/bumptech/glide/load/ImageHeaderParser;",
            ">;",
            "Lcom/bumptech/glide/load/a/a/d;",
            "Lcom/bumptech/glide/load/engine/bitmap_recycle/b;",
            "Landroid/content/ContentResolver;",
            ")V"
        }
    .end annotation

    .line 32
    sget-object v2, Lcom/bumptech/glide/load/a/a/e;->dI:Lcom/bumptech/glide/load/a/a/a;

    move-object v0, p0

    move-object v1, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/bumptech/glide/load/a/a/e;-><init>(Ljava/util/List;Lcom/bumptech/glide/load/a/a/a;Lcom/bumptech/glide/load/a/a/d;Lcom/bumptech/glide/load/engine/bitmap_recycle/b;Landroid/content/ContentResolver;)V

    .line 33
    return-void
.end method

.method private e(Ljava/io/File;)Z
    .locals 4

    .line 108
    iget-object v0, p0, Lcom/bumptech/glide/load/a/a/e;->dJ:Lcom/bumptech/glide/load/a/a/a;

    invoke-virtual {v0, p1}, Lcom/bumptech/glide/load/a/a/a;->exists(Ljava/io/File;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-wide/16 v0, 0x0

    iget-object v2, p0, Lcom/bumptech/glide/load/a/a/e;->dJ:Lcom/bumptech/glide/load/a/a/a;

    invoke-virtual {v2, p1}, Lcom/bumptech/glide/load/a/a/a;->d(Ljava/io/File;)J

    move-result-wide v2

    cmp-long p1, v0, v2

    if-gez p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method private j(Landroid/net/Uri;)Ljava/lang/String;
    .locals 1
    .param p1    # Landroid/net/Uri;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .line 93
    iget-object v0, p0, Lcom/bumptech/glide/load/a/a/e;->dK:Lcom/bumptech/glide/load/a/a/d;

    invoke-interface {v0, p1}, Lcom/bumptech/glide/load/a/a/d;->g(Landroid/net/Uri;)Landroid/database/Cursor;

    move-result-object p1

    .line 95
    if-eqz p1, :cond_2

    :try_start_0
    invoke-interface {p1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 96
    const/4 v0, 0x0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 101
    if-eqz p1, :cond_0

    .line 102
    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    .line 96
    :cond_0
    return-object v0

    .line 101
    :catchall_0
    move-exception v0

    if-eqz p1, :cond_1

    .line 102
    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    :cond_1
    throw v0

    .line 98
    :cond_2
    const/4 v0, 0x0

    .line 101
    if-eqz p1, :cond_3

    .line 102
    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    .line 98
    :cond_3
    return-object v0
.end method


# virtual methods
.method h(Landroid/net/Uri;)I
    .locals 6

    .line 49
    nop

    .line 51
    const/4 v0, 0x0

    :try_start_0
    iget-object v1, p0, Lcom/bumptech/glide/load/a/a/e;->dv:Landroid/content/ContentResolver;

    invoke-virtual {v1, p1}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 52
    :try_start_1
    iget-object v0, p0, Lcom/bumptech/glide/load/a/a/e;->dL:Ljava/util/List;

    iget-object v2, p0, Lcom/bumptech/glide/load/a/a/e;->du:Lcom/bumptech/glide/load/engine/bitmap_recycle/b;

    invoke-static {v0, v1, v2}, Lcom/bumptech/glide/load/b;->b(Ljava/util/List;Ljava/io/InputStream;Lcom/bumptech/glide/load/engine/bitmap_recycle/b;)I

    move-result v0
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/NullPointerException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 59
    if-eqz v1, :cond_0

    .line 61
    :try_start_2
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 64
    goto :goto_0

    .line 62
    :catch_0
    move-exception p1

    .line 52
    :cond_0
    :goto_0
    return v0

    .line 54
    :catch_1
    move-exception v0

    goto :goto_1

    .line 59
    :catchall_0
    move-exception p1

    move-object v1, v0

    goto :goto_4

    .line 54
    :catch_2
    move-exception v1

    move-object v5, v1

    move-object v1, v0

    move-object v0, v5

    .line 55
    :goto_1
    :try_start_3
    const-string v2, "ThumbStreamOpener"

    const/4 v3, 0x3

    invoke-static {v2, v3}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 56
    const-string v2, "ThumbStreamOpener"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Failed to open uri: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v2, p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 59
    :cond_1
    if-eqz v1, :cond_2

    .line 61
    :try_start_4
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_3

    .line 64
    :goto_2
    goto :goto_3

    .line 62
    :catch_3
    move-exception p1

    goto :goto_2

    .line 67
    :cond_2
    :goto_3
    const/4 p1, -0x1

    return p1

    .line 59
    :catchall_1
    move-exception p1

    :goto_4
    if-eqz v1, :cond_3

    .line 61
    :try_start_5
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_4

    .line 64
    goto :goto_5

    .line 62
    :catch_4
    move-exception v0

    .line 64
    :cond_3
    :goto_5
    throw p1
.end method

.method public i(Landroid/net/Uri;)Ljava/io/InputStream;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .line 71
    invoke-direct {p0, p1}, Lcom/bumptech/glide/load/a/a/e;->j(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v0

    .line 72
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    .line 73
    return-object v2

    .line 76
    :cond_0
    iget-object v1, p0, Lcom/bumptech/glide/load/a/a/e;->dJ:Lcom/bumptech/glide/load/a/a/a;

    invoke-virtual {v1, v0}, Lcom/bumptech/glide/load/a/a/a;->h(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    .line 77
    invoke-direct {p0, v0}, Lcom/bumptech/glide/load/a/a/e;->e(Ljava/io/File;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 78
    return-object v2

    .line 81
    :cond_1
    invoke-static {v0}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v0

    .line 83
    :try_start_0
    iget-object v1, p0, Lcom/bumptech/glide/load/a/a/e;->dv:Landroid/content/ContentResolver;

    invoke-virtual {v1, v0}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    .line 85
    :catch_0
    move-exception v1

    .line 86
    new-instance v2, Ljava/io/FileNotFoundException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "NPE opening uri: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, " -> "

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v2, p1}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    .line 87
    invoke-virtual {v2, v1}, Ljava/io/FileNotFoundException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    move-result-object p1

    check-cast p1, Ljava/io/FileNotFoundException;

    throw p1
.end method
