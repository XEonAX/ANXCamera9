.class public Lcom/android/volley/toolbox/ByteArrayPool;
.super Ljava/lang/Object;
.source "ByteArrayPool.java"


# static fields
.field protected static final BUF_COMPARATOR:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator<",
            "[B>;"
        }
    .end annotation
.end field


# instance fields
.field private mBuffersByLastUse:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "[B>;"
        }
    .end annotation
.end field

.field private mBuffersBySize:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "[B>;"
        }
    .end annotation
.end field

.field private mCurrentSize:I

.field private final mSizeLimit:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 69
    new-instance v0, Lcom/android/volley/toolbox/ByteArrayPool$1;

    invoke-direct {v0}, Lcom/android/volley/toolbox/ByteArrayPool$1;-><init>()V

    sput-object v0, Lcom/android/volley/toolbox/ByteArrayPool;->BUF_COMPARATOR:Ljava/util/Comparator;

    return-void
.end method

.method public constructor <init>(I)V
    .registers 4
    .param p1, "sizeLimit"    # I

    .line 79
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 56
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/android/volley/toolbox/ByteArrayPool;->mBuffersByLastUse:Ljava/util/List;

    .line 57
    new-instance v0, Ljava/util/ArrayList;

    const/16 v1, 0x40

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/android/volley/toolbox/ByteArrayPool;->mBuffersBySize:Ljava/util/List;

    .line 60
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/volley/toolbox/ByteArrayPool;->mCurrentSize:I

    .line 80
    iput p1, p0, Lcom/android/volley/toolbox/ByteArrayPool;->mSizeLimit:I

    .line 81
    return-void
.end method

.method private declared-synchronized trim()V
    .registers 4

    monitor-enter p0

    .line 128
    :goto_1
    :try_start_1
    iget v0, p0, Lcom/android/volley/toolbox/ByteArrayPool;->mCurrentSize:I

    iget v1, p0, Lcom/android/volley/toolbox/ByteArrayPool;->mSizeLimit:I

    if-le v0, v1, :cond_1c

    .line 129
    iget-object v0, p0, Lcom/android/volley/toolbox/ByteArrayPool;->mBuffersByLastUse:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    .line 130
    .local v0, "buf":[B
    iget-object v1, p0, Lcom/android/volley/toolbox/ByteArrayPool;->mBuffersBySize:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 131
    iget v1, p0, Lcom/android/volley/toolbox/ByteArrayPool;->mCurrentSize:I

    array-length v2, v0

    sub-int/2addr v1, v2

    iput v1, p0, Lcom/android/volley/toolbox/ByteArrayPool;->mCurrentSize:I
    :try_end_1b
    .catchall {:try_start_1 .. :try_end_1b} :catchall_1e

    .line 132
    .end local v0    # "buf":[B
    goto :goto_1

    .line 133
    :cond_1c
    monitor-exit p0

    return-void

    .line 127
    :catchall_1e
    move-exception v0

    monitor-exit p0

    .end local p0    # "this":Lcom/android/volley/toolbox/ByteArrayPool;
    throw v0
.end method


# virtual methods
.method public declared-synchronized getBuf(I)[B
    .registers 6
    .param p1, "len"    # I

    monitor-enter p0

    .line 92
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_2
    :try_start_2
    iget-object v1, p0, Lcom/android/volley/toolbox/ByteArrayPool;->mBuffersBySize:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_2a

    .line 93
    iget-object v1, p0, Lcom/android/volley/toolbox/ByteArrayPool;->mBuffersBySize:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [B

    .line 94
    .local v1, "buf":[B
    array-length v2, v1

    if-lt v2, p1, :cond_27

    .line 95
    iget v2, p0, Lcom/android/volley/toolbox/ByteArrayPool;->mCurrentSize:I

    array-length v3, v1

    sub-int/2addr v2, v3

    iput v2, p0, Lcom/android/volley/toolbox/ByteArrayPool;->mCurrentSize:I

    .line 96
    iget-object v2, p0, Lcom/android/volley/toolbox/ByteArrayPool;->mBuffersBySize:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 97
    iget-object v2, p0, Lcom/android/volley/toolbox/ByteArrayPool;->mBuffersByLastUse:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z
    :try_end_25
    .catchall {:try_start_2 .. :try_end_25} :catchall_2e

    .line 98
    monitor-exit p0

    return-object v1

    .line 92
    .end local v1    # "buf":[B
    :cond_27
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 101
    .end local v0    # "i":I
    :cond_2a
    :try_start_2a
    new-array v0, p1, [B
    :try_end_2c
    .catchall {:try_start_2a .. :try_end_2c} :catchall_2e

    monitor-exit p0

    return-object v0

    .line 91
    .end local p1    # "len":I
    :catchall_2e
    move-exception p1

    monitor-exit p0

    .end local p0    # "this":Lcom/android/volley/toolbox/ByteArrayPool;
    throw p1
.end method

.method public declared-synchronized returnBuf([B)V
    .registers 5
    .param p1, "buf"    # [B

    monitor-enter p0

    .line 111
    if-eqz p1, :cond_2e

    :try_start_3
    array-length v0, p1

    iget v1, p0, Lcom/android/volley/toolbox/ByteArrayPool;->mSizeLimit:I

    if-le v0, v1, :cond_9

    goto :goto_2e

    .line 114
    :cond_9
    iget-object v0, p0, Lcom/android/volley/toolbox/ByteArrayPool;->mBuffersByLastUse:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 115
    iget-object v0, p0, Lcom/android/volley/toolbox/ByteArrayPool;->mBuffersBySize:Ljava/util/List;

    sget-object v1, Lcom/android/volley/toolbox/ByteArrayPool;->BUF_COMPARATOR:Ljava/util/Comparator;

    invoke-static {v0, p1, v1}, Ljava/util/Collections;->binarySearch(Ljava/util/List;Ljava/lang/Object;Ljava/util/Comparator;)I

    move-result v0

    .line 116
    .local v0, "pos":I
    if-gez v0, :cond_1b

    .line 117
    neg-int v1, v0

    add-int/lit8 v0, v1, -0x1

    .line 119
    :cond_1b
    iget-object v1, p0, Lcom/android/volley/toolbox/ByteArrayPool;->mBuffersBySize:Ljava/util/List;

    invoke-interface {v1, v0, p1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 120
    iget v1, p0, Lcom/android/volley/toolbox/ByteArrayPool;->mCurrentSize:I

    array-length v2, p1

    add-int/2addr v1, v2

    iput v1, p0, Lcom/android/volley/toolbox/ByteArrayPool;->mCurrentSize:I

    .line 121
    invoke-direct {p0}, Lcom/android/volley/toolbox/ByteArrayPool;->trim()V
    :try_end_29
    .catchall {:try_start_3 .. :try_end_29} :catchall_2b

    .line 122
    monitor-exit p0

    return-void

    .line 110
    .end local v0    # "pos":I
    .end local p1    # "buf":[B
    :catchall_2b
    move-exception p1

    monitor-exit p0

    .end local p0    # "this":Lcom/android/volley/toolbox/ByteArrayPool;
    throw p1

    .line 112
    .restart local p0    # "this":Lcom/android/volley/toolbox/ByteArrayPool;
    .restart local p1    # "buf":[B
    :cond_2e
    :goto_2e
    monitor-exit p0

    return-void
.end method
