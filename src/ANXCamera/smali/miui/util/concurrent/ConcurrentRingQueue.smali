.class public Lmiui/util/concurrent/ConcurrentRingQueue;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lmiui/util/concurrent/Queue;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lmiui/util/concurrent/ConcurrentRingQueue$Node;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lmiui/util/concurrent/Queue<",
        "TT;>;"
    }
.end annotation


# instance fields
.field private LX:I

.field private final LZ:Z

.field private final Ma:Z

.field private final Mb:Ljava/util/concurrent/atomic/AtomicInteger;

.field private volatile Mc:Lmiui/util/concurrent/ConcurrentRingQueue$Node;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lmiui/util/concurrent/ConcurrentRingQueue$Node<",
            "TT;>;"
        }
    .end annotation
.end field

.field private final Md:Ljava/util/concurrent/atomic/AtomicInteger;

.field private volatile Me:Lmiui/util/concurrent/ConcurrentRingQueue$Node;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lmiui/util/concurrent/ConcurrentRingQueue$Node<",
            "TT;>;"
        }
    .end annotation
.end field

.field private volatile Mf:I


# direct methods
.method public constructor <init>(IZZ)V
    .locals 2

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    iput p1, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->LX:I

    .line 46
    iput-boolean p2, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->LZ:Z

    .line 47
    iput-boolean p3, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Ma:Z

    .line 48
    new-instance p2, Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 p3, 0x0

    invoke-direct {p2, p3}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object p2, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Mb:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 49
    new-instance p2, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {p2, p3}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object p2, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Md:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 51
    new-instance p2, Lmiui/util/concurrent/ConcurrentRingQueue$Node;

    const/4 v0, 0x0

    invoke-direct {p2, v0}, Lmiui/util/concurrent/ConcurrentRingQueue$Node;-><init>(Lmiui/util/concurrent/ConcurrentRingQueue$1;)V

    iput-object p2, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Mc:Lmiui/util/concurrent/ConcurrentRingQueue$Node;

    .line 52
    iget-object p2, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Mc:Lmiui/util/concurrent/ConcurrentRingQueue$Node;

    iput-object p2, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Me:Lmiui/util/concurrent/ConcurrentRingQueue$Node;

    .line 53
    iget-object p2, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Mc:Lmiui/util/concurrent/ConcurrentRingQueue$Node;

    .line 54
    :goto_0
    if-ge p3, p1, :cond_0

    .line 55
    new-instance v1, Lmiui/util/concurrent/ConcurrentRingQueue$Node;

    invoke-direct {v1, v0}, Lmiui/util/concurrent/ConcurrentRingQueue$Node;-><init>(Lmiui/util/concurrent/ConcurrentRingQueue$1;)V

    iput-object v1, p2, Lmiui/util/concurrent/ConcurrentRingQueue$Node;->Mg:Lmiui/util/concurrent/ConcurrentRingQueue$Node;

    .line 56
    iget-object p2, p2, Lmiui/util/concurrent/ConcurrentRingQueue$Node;->Mg:Lmiui/util/concurrent/ConcurrentRingQueue$Node;

    .line 54
    add-int/lit8 p3, p3, 0x1

    goto :goto_0

    .line 58
    :cond_0
    iget-object p1, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Mc:Lmiui/util/concurrent/ConcurrentRingQueue$Node;

    iput-object p1, p2, Lmiui/util/concurrent/ConcurrentRingQueue$Node;->Mg:Lmiui/util/concurrent/ConcurrentRingQueue$Node;

    .line 59
    return-void
.end method


# virtual methods
.method public clear()I
    .locals 4

    .line 162
    :goto_0
    iget-object v0, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Mb:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Mb:Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, -0x1

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->compareAndSet(II)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_2

    .line 166
    :cond_0
    nop

    .line 168
    iget-object v0, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Mc:Lmiui/util/concurrent/ConcurrentRingQueue$Node;

    move v1, v2

    :goto_1
    iget-object v3, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Me:Lmiui/util/concurrent/ConcurrentRingQueue$Node;

    if-eq v0, v3, :cond_1

    .line 169
    const/4 v3, 0x0

    iput-object v3, v0, Lmiui/util/concurrent/ConcurrentRingQueue$Node;->element:Ljava/lang/Object;

    .line 170
    add-int/lit8 v1, v1, 0x1

    .line 168
    iget-object v0, v0, Lmiui/util/concurrent/ConcurrentRingQueue$Node;->Mg:Lmiui/util/concurrent/ConcurrentRingQueue$Node;

    goto :goto_1

    .line 173
    :cond_1
    iput-object v0, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Mc:Lmiui/util/concurrent/ConcurrentRingQueue$Node;

    .line 175
    iget-object v0, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Mb:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0, v2}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 176
    return v1

    .line 163
    :cond_2
    :goto_2
    invoke-static {}, Ljava/lang/Thread;->yield()V

    goto :goto_0
.end method

.method public decreaseCapacity(I)V
    .locals 3

    .line 218
    iget-boolean v0, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Ma:Z

    if-eqz v0, :cond_3

    if-gtz p1, :cond_0

    goto :goto_2

    .line 222
    :cond_0
    :goto_0
    iget-object v0, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Md:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Md:Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, -0x1

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->compareAndSet(II)Z

    move-result v0

    if-nez v0, :cond_1

    goto :goto_1

    .line 226
    :cond_1
    iget v0, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->LX:I

    sub-int/2addr v0, p1

    iput v0, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->LX:I

    .line 227
    iput p1, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Mf:I

    .line 229
    iget-object p1, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Md:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {p1, v2}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 230
    return-void

    .line 223
    :cond_2
    :goto_1
    invoke-static {}, Ljava/lang/Thread;->yield()V

    goto :goto_0

    .line 219
    :cond_3
    :goto_2
    return-void
.end method

.method public get()Ljava/lang/Object;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 97
    :goto_0
    iget-object v0, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Mb:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Mb:Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, -0x1

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->compareAndSet(II)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_2

    .line 101
    :cond_0
    nop

    .line 102
    iget-object v0, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Mc:Lmiui/util/concurrent/ConcurrentRingQueue$Node;

    .line 103
    iget-object v1, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Me:Lmiui/util/concurrent/ConcurrentRingQueue$Node;

    const/4 v3, 0x0

    move-object v4, v1

    move-object v1, v0

    move-object v0, v3

    :goto_1
    if-nez v0, :cond_1

    if-eq v1, v4, :cond_1

    .line 104
    iget-object v0, v1, Lmiui/util/concurrent/ConcurrentRingQueue$Node;->element:Ljava/lang/Object;

    .line 105
    iput-object v3, v1, Lmiui/util/concurrent/ConcurrentRingQueue$Node;->element:Ljava/lang/Object;

    .line 103
    iget-object v1, v1, Lmiui/util/concurrent/ConcurrentRingQueue$Node;->Mg:Lmiui/util/concurrent/ConcurrentRingQueue$Node;

    iget-object v4, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Me:Lmiui/util/concurrent/ConcurrentRingQueue$Node;

    goto :goto_1

    .line 107
    :cond_1
    if-eqz v0, :cond_2

    .line 108
    iput-object v1, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Mc:Lmiui/util/concurrent/ConcurrentRingQueue$Node;

    .line 110
    :cond_2
    iget-object v1, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Mb:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v1, v2}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 111
    return-object v0

    .line 98
    :cond_3
    :goto_2
    invoke-static {}, Ljava/lang/Thread;->yield()V

    goto :goto_0
.end method

.method public getCapacity()I
    .locals 2

    .line 187
    iget v0, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Mf:I

    if-lez v0, :cond_0

    iget v1, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->LX:I

    add-int/2addr v1, v0

    goto :goto_0

    :cond_0
    iget v1, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->LX:I

    :goto_0
    return v1
.end method

.method public increaseCapacity(I)V
    .locals 3

    .line 197
    iget-boolean v0, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->LZ:Z

    if-nez v0, :cond_3

    if-gtz p1, :cond_0

    goto :goto_2

    .line 201
    :cond_0
    :goto_0
    iget-object v0, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Md:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Md:Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, -0x1

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->compareAndSet(II)Z

    move-result v0

    if-nez v0, :cond_1

    goto :goto_1

    .line 205
    :cond_1
    neg-int v0, p1

    iput v0, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Mf:I

    .line 206
    iget v0, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->LX:I

    add-int/2addr v0, p1

    iput v0, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->LX:I

    .line 208
    iget-object p1, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Md:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {p1, v2}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 209
    return-void

    .line 202
    :cond_2
    :goto_1
    invoke-static {}, Ljava/lang/Thread;->yield()V

    goto :goto_0

    .line 198
    :cond_3
    :goto_2
    return-void
.end method

.method public isEmpty()Z
    .locals 2

    .line 181
    iget-object v0, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Me:Lmiui/util/concurrent/ConcurrentRingQueue$Node;

    iget-object v1, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Mc:Lmiui/util/concurrent/ConcurrentRingQueue$Node;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public put(Ljava/lang/Object;)Z
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    .line 63
    const/4 v0, 0x0

    if-nez p1, :cond_0

    .line 64
    return v0

    .line 67
    :cond_0
    :goto_0
    iget-object v1, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Md:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v1

    if-nez v1, :cond_6

    iget-object v1, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Md:Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v2, -0x1

    invoke-virtual {v1, v0, v2}, Ljava/util/concurrent/atomic/AtomicInteger;->compareAndSet(II)Z

    move-result v1

    if-nez v1, :cond_1

    goto :goto_3

    .line 71
    :cond_1
    nop

    .line 72
    iget-object v1, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Mc:Lmiui/util/concurrent/ConcurrentRingQueue$Node;

    .line 73
    iget-object v2, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Me:Lmiui/util/concurrent/ConcurrentRingQueue$Node;

    .line 74
    iget v3, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Mf:I

    .line 75
    iget-object v4, v2, Lmiui/util/concurrent/ConcurrentRingQueue$Node;->Mg:Lmiui/util/concurrent/ConcurrentRingQueue$Node;

    const/4 v5, 0x1

    if-eq v4, v1, :cond_3

    .line 76
    iput-object p1, v2, Lmiui/util/concurrent/ConcurrentRingQueue$Node;->element:Ljava/lang/Object;

    .line 77
    iget-object p1, v2, Lmiui/util/concurrent/ConcurrentRingQueue$Node;->Mg:Lmiui/util/concurrent/ConcurrentRingQueue$Node;

    iget-object p1, p1, Lmiui/util/concurrent/ConcurrentRingQueue$Node;->Mg:Lmiui/util/concurrent/ConcurrentRingQueue$Node;

    if-eq p1, v1, :cond_2

    iget-boolean p1, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Ma:Z

    if-eqz p1, :cond_2

    if-lez v3, :cond_2

    .line 78
    iget-object p1, v2, Lmiui/util/concurrent/ConcurrentRingQueue$Node;->Mg:Lmiui/util/concurrent/ConcurrentRingQueue$Node;

    iget-object p1, p1, Lmiui/util/concurrent/ConcurrentRingQueue$Node;->Mg:Lmiui/util/concurrent/ConcurrentRingQueue$Node;

    iput-object p1, v2, Lmiui/util/concurrent/ConcurrentRingQueue$Node;->Mg:Lmiui/util/concurrent/ConcurrentRingQueue$Node;

    .line 79
    sub-int/2addr v3, v5

    iput v3, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Mf:I

    .line 81
    :cond_2
    iget-object p1, v2, Lmiui/util/concurrent/ConcurrentRingQueue$Node;->Mg:Lmiui/util/concurrent/ConcurrentRingQueue$Node;

    iput-object p1, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Me:Lmiui/util/concurrent/ConcurrentRingQueue$Node;

    .line 82
    goto :goto_2

    .line 83
    :cond_3
    iget-boolean v4, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->LZ:Z

    if-nez v4, :cond_5

    if-gez v3, :cond_4

    goto :goto_1

    .line 91
    :cond_4
    move v5, v0

    goto :goto_2

    .line 84
    :cond_5
    :goto_1
    new-instance v4, Lmiui/util/concurrent/ConcurrentRingQueue$Node;

    const/4 v6, 0x0

    invoke-direct {v4, v6}, Lmiui/util/concurrent/ConcurrentRingQueue$Node;-><init>(Lmiui/util/concurrent/ConcurrentRingQueue$1;)V

    iput-object v4, v2, Lmiui/util/concurrent/ConcurrentRingQueue$Node;->Mg:Lmiui/util/concurrent/ConcurrentRingQueue$Node;

    .line 85
    iget-object v4, v2, Lmiui/util/concurrent/ConcurrentRingQueue$Node;->Mg:Lmiui/util/concurrent/ConcurrentRingQueue$Node;

    iput-object v1, v4, Lmiui/util/concurrent/ConcurrentRingQueue$Node;->Mg:Lmiui/util/concurrent/ConcurrentRingQueue$Node;

    .line 86
    iput-object p1, v2, Lmiui/util/concurrent/ConcurrentRingQueue$Node;->element:Ljava/lang/Object;

    .line 87
    add-int/2addr v3, v5

    iput v3, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Mf:I

    .line 88
    iget-object p1, v2, Lmiui/util/concurrent/ConcurrentRingQueue$Node;->Mg:Lmiui/util/concurrent/ConcurrentRingQueue$Node;

    iput-object p1, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Me:Lmiui/util/concurrent/ConcurrentRingQueue$Node;

    .line 89
    nop

    .line 91
    :goto_2
    iget-object p1, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Md:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {p1, v0}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 92
    return v5

    .line 68
    :cond_6
    :goto_3
    invoke-static {}, Ljava/lang/Thread;->yield()V

    goto :goto_0
.end method

.method public remove(Lmiui/util/concurrent/Queue$Predicate;)I
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lmiui/util/concurrent/Queue$Predicate<",
            "TT;>;)I"
        }
    .end annotation

    .line 138
    const/4 v0, 0x0

    if-nez p1, :cond_0

    .line 139
    return v0

    .line 142
    :cond_0
    :goto_0
    iget-object v1, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Mb:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v1

    if-nez v1, :cond_4

    iget-object v1, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Mb:Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v2, -0x1

    invoke-virtual {v1, v0, v2}, Ljava/util/concurrent/atomic/AtomicInteger;->compareAndSet(II)Z

    move-result v1

    if-nez v1, :cond_1

    goto :goto_2

    .line 146
    :cond_1
    nop

    .line 148
    :try_start_0
    iget-object v1, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Mc:Lmiui/util/concurrent/ConcurrentRingQueue$Node;

    move v2, v0

    :goto_1
    iget-object v3, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Me:Lmiui/util/concurrent/ConcurrentRingQueue$Node;

    if-eq v1, v3, :cond_3

    .line 149
    iget-object v3, v1, Lmiui/util/concurrent/ConcurrentRingQueue$Node;->element:Ljava/lang/Object;

    invoke-interface {p1, v3}, Lmiui/util/concurrent/Queue$Predicate;->apply(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 150
    const/4 v3, 0x0

    iput-object v3, v1, Lmiui/util/concurrent/ConcurrentRingQueue$Node;->element:Ljava/lang/Object;

    .line 151
    add-int/lit8 v2, v2, 0x1

    .line 148
    :cond_2
    iget-object v1, v1, Lmiui/util/concurrent/ConcurrentRingQueue$Node;->Mg:Lmiui/util/concurrent/ConcurrentRingQueue$Node;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    .line 155
    :cond_3
    iget-object p1, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Mb:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {p1, v0}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 156
    nop

    .line 157
    return v2

    .line 155
    :catchall_0
    move-exception p1

    iget-object v1, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Mb:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v1, v0}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    throw p1

    .line 143
    :cond_4
    :goto_2
    invoke-static {}, Ljava/lang/Thread;->yield()V

    goto :goto_0
.end method

.method public remove(Ljava/lang/Object;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    .line 116
    const/4 v0, 0x0

    if-nez p1, :cond_0

    .line 117
    return v0

    .line 120
    :cond_0
    :goto_0
    iget-object v1, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Mb:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v1

    if-nez v1, :cond_4

    iget-object v1, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Mb:Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v2, -0x1

    invoke-virtual {v1, v0, v2}, Ljava/util/concurrent/atomic/AtomicInteger;->compareAndSet(II)Z

    move-result v1

    if-nez v1, :cond_1

    goto :goto_3

    .line 124
    :cond_1
    nop

    .line 125
    iget-object v1, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Mc:Lmiui/util/concurrent/ConcurrentRingQueue$Node;

    :goto_1
    iget-object v2, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Me:Lmiui/util/concurrent/ConcurrentRingQueue$Node;

    if-eq v1, v2, :cond_3

    .line 126
    iget-object v2, v1, Lmiui/util/concurrent/ConcurrentRingQueue$Node;->element:Ljava/lang/Object;

    invoke-virtual {p1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 127
    const/4 p1, 0x0

    iput-object p1, v1, Lmiui/util/concurrent/ConcurrentRingQueue$Node;->element:Ljava/lang/Object;

    .line 128
    const/4 p1, 0x1

    .line 129
    goto :goto_2

    .line 125
    :cond_2
    iget-object v1, v1, Lmiui/util/concurrent/ConcurrentRingQueue$Node;->Mg:Lmiui/util/concurrent/ConcurrentRingQueue$Node;

    goto :goto_1

    .line 132
    :cond_3
    move p1, v0

    :goto_2
    iget-object v1, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Mb:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v1, v0}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 133
    return p1

    .line 121
    :cond_4
    :goto_3
    invoke-static {}, Ljava/lang/Thread;->yield()V

    goto :goto_0
.end method
