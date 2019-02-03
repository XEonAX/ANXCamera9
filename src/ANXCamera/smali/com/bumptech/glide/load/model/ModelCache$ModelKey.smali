.class final Lcom/bumptech/glide/load/model/ModelCache$ModelKey;
.super Ljava/lang/Object;
.source "ModelCache.java"


# annotations
.annotation build Landroid/support/annotation/VisibleForTesting;
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bumptech/glide/load/model/ModelCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "ModelKey"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<A:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# static fields
.field private static final jn:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue<",
            "Lcom/bumptech/glide/load/model/ModelCache$ModelKey<",
            "*>;>;"
        }
    .end annotation
.end field


# instance fields
.field private aL:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TA;"
        }
    .end annotation
.end field

.field private height:I

.field private width:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 77
    const/4 v0, 0x0

    invoke-static {v0}, Lcom/bumptech/glide/util/k;->U(I)Ljava/util/Queue;

    move-result-object v0

    sput-object v0, Lcom/bumptech/glide/load/model/ModelCache$ModelKey;->jn:Ljava/util/Queue;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 97
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 98
    return-void
.end method

.method static d(Ljava/lang/Object;II)Lcom/bumptech/glide/load/model/ModelCache$ModelKey;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<A:",
            "Ljava/lang/Object;",
            ">(TA;II)",
            "Lcom/bumptech/glide/load/model/ModelCache$ModelKey<",
            "TA;>;"
        }
    .end annotation

    .line 86
    sget-object v0, Lcom/bumptech/glide/load/model/ModelCache$ModelKey;->jn:Ljava/util/Queue;

    monitor-enter v0

    .line 87
    :try_start_0
    sget-object v1, Lcom/bumptech/glide/load/model/ModelCache$ModelKey;->jn:Ljava/util/Queue;

    invoke-interface {v1}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/bumptech/glide/load/model/ModelCache$ModelKey;

    .line 88
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 89
    if-nez v1, :cond_0

    .line 90
    new-instance v1, Lcom/bumptech/glide/load/model/ModelCache$ModelKey;

    invoke-direct {v1}, Lcom/bumptech/glide/load/model/ModelCache$ModelKey;-><init>()V

    .line 93
    :cond_0
    invoke-direct {v1, p0, p1, p2}, Lcom/bumptech/glide/load/model/ModelCache$ModelKey;->e(Ljava/lang/Object;II)V

    .line 94
    return-object v1

    .line 88
    :catchall_0
    move-exception p0

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0
.end method

.method private e(Ljava/lang/Object;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TA;II)V"
        }
    .end annotation

    .line 101
    iput-object p1, p0, Lcom/bumptech/glide/load/model/ModelCache$ModelKey;->aL:Ljava/lang/Object;

    .line 102
    iput p2, p0, Lcom/bumptech/glide/load/model/ModelCache$ModelKey;->width:I

    .line 103
    iput p3, p0, Lcom/bumptech/glide/load/model/ModelCache$ModelKey;->height:I

    .line 104
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 3

    .line 114
    instance-of v0, p1, Lcom/bumptech/glide/load/model/ModelCache$ModelKey;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 115
    check-cast p1, Lcom/bumptech/glide/load/model/ModelCache$ModelKey;

    .line 116
    iget v0, p0, Lcom/bumptech/glide/load/model/ModelCache$ModelKey;->width:I

    iget v2, p1, Lcom/bumptech/glide/load/model/ModelCache$ModelKey;->width:I

    if-ne v0, v2, :cond_0

    iget v0, p0, Lcom/bumptech/glide/load/model/ModelCache$ModelKey;->height:I

    iget v2, p1, Lcom/bumptech/glide/load/model/ModelCache$ModelKey;->height:I

    if-ne v0, v2, :cond_0

    iget-object v0, p0, Lcom/bumptech/glide/load/model/ModelCache$ModelKey;->aL:Ljava/lang/Object;

    iget-object p1, p1, Lcom/bumptech/glide/load/model/ModelCache$ModelKey;->aL:Ljava/lang/Object;

    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 v1, 0x1

    nop

    :cond_0
    return v1

    .line 118
    :cond_1
    return v1
.end method

.method public hashCode()I
    .locals 3

    .line 123
    iget v0, p0, Lcom/bumptech/glide/load/model/ModelCache$ModelKey;->height:I

    .line 124
    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget v2, p0, Lcom/bumptech/glide/load/model/ModelCache$ModelKey;->width:I

    add-int/2addr v0, v2

    .line 125
    mul-int/2addr v1, v0

    iget-object v0, p0, Lcom/bumptech/glide/load/model/ModelCache$ModelKey;->aL:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    add-int/2addr v1, v0

    .line 126
    return v1
.end method

.method public release()V
    .locals 2

    .line 107
    sget-object v0, Lcom/bumptech/glide/load/model/ModelCache$ModelKey;->jn:Ljava/util/Queue;

    monitor-enter v0

    .line 108
    :try_start_0
    sget-object v1, Lcom/bumptech/glide/load/model/ModelCache$ModelKey;->jn:Ljava/util/Queue;

    invoke-interface {v1, p0}, Ljava/util/Queue;->offer(Ljava/lang/Object;)Z

    .line 109
    monitor-exit v0

    .line 110
    return-void

    .line 109
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method
