.class public Lmiui/util/Pools$SimplePool;
.super Lmiui/util/Pools$BasePool;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lmiui/util/Pools;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SimplePool"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lmiui/util/Pools$BasePool<",
        "TT;>;"
    }
.end annotation


# direct methods
.method constructor <init>(Lmiui/util/Pools$Manager;I)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lmiui/util/Pools$Manager<",
            "TT;>;I)V"
        }
    .end annotation

    .line 478
    invoke-direct {p0, p1, p2}, Lmiui/util/Pools$BasePool;-><init>(Lmiui/util/Pools$Manager;I)V

    .line 479
    return-void
.end method


# virtual methods
.method final a(Lmiui/util/Pools$IInstanceHolder;I)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lmiui/util/Pools$IInstanceHolder<",
            "TT;>;I)V"
        }
    .end annotation

    .line 488
    check-cast p1, Lmiui/util/Pools$InstanceHolder;

    invoke-static {p1, p2}, Lmiui/util/Pools;->a(Lmiui/util/Pools$InstanceHolder;I)V

    .line 489
    return-void
.end method

.method public bridge synthetic acquire()Ljava/lang/Object;
    .registers 2

    .line 474
    invoke-super {p0}, Lmiui/util/Pools$BasePool;->acquire()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic close()V
    .registers 1

    .line 474
    invoke-super {p0}, Lmiui/util/Pools$BasePool;->close()V

    return-void
.end method

.method final d(Ljava/lang/Class;I)Lmiui/util/Pools$IInstanceHolder;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "TT;>;I)",
            "Lmiui/util/Pools$IInstanceHolder<",
            "TT;>;"
        }
    .end annotation

    .line 483
    invoke-static {p1, p2}, Lmiui/util/Pools;->b(Ljava/lang/Class;I)Lmiui/util/Pools$InstanceHolder;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic getSize()I
    .registers 2

    .line 474
    invoke-super {p0}, Lmiui/util/Pools$BasePool;->getSize()I

    move-result v0

    return v0
.end method

.method public bridge synthetic release(Ljava/lang/Object;)V
    .registers 2

    .line 474
    invoke-super {p0, p1}, Lmiui/util/Pools$BasePool;->release(Ljava/lang/Object;)V

    return-void
.end method
