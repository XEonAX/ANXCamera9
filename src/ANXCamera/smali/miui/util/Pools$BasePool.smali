.class abstract Lmiui/util/Pools$BasePool;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lmiui/util/Pools$Pool;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lmiui/util/Pools;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x408
    name = "BasePool"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lmiui/util/Pools$Pool<",
        "TT;>;"
    }
.end annotation


# instance fields
.field private final Hf:I

.field private final Jy:Lmiui/util/Pools$Manager;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lmiui/util/Pools$Manager<",
            "TT;>;"
        }
    .end annotation
.end field

.field private Jz:Lmiui/util/Pools$IInstanceHolder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lmiui/util/Pools$IInstanceHolder<",
            "TT;>;"
        }
    .end annotation
.end field

.field private final zM:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lmiui/util/Pools$Manager;I)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lmiui/util/Pools$Manager<",
            "TT;>;I)V"
        }
    .end annotation

    .line 362
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 351
    new-instance v0, Lmiui/util/Pools$BasePool$1;

    invoke-direct {v0, p0}, Lmiui/util/Pools$BasePool$1;-><init>(Lmiui/util/Pools$BasePool;)V

    iput-object v0, p0, Lmiui/util/Pools$BasePool;->zM:Ljava/lang/Object;

    .line 363
    if-eqz p1, :cond_31

    const/4 v0, 0x1

    if-lt p2, v0, :cond_31

    .line 369
    iput-object p1, p0, Lmiui/util/Pools$BasePool;->Jy:Lmiui/util/Pools$Manager;

    .line 370
    iput p2, p0, Lmiui/util/Pools$BasePool;->Hf:I

    .line 371
    iget-object p1, p0, Lmiui/util/Pools$BasePool;->Jy:Lmiui/util/Pools$Manager;

    invoke-virtual {p1}, Lmiui/util/Pools$Manager;->createInstance()Ljava/lang/Object;

    move-result-object p1

    .line 372
    if-eqz p1, :cond_29

    .line 376
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    .line 377
    invoke-virtual {p0, v0, p2}, Lmiui/util/Pools$BasePool;->d(Ljava/lang/Class;I)Lmiui/util/Pools$IInstanceHolder;

    move-result-object p2

    iput-object p2, p0, Lmiui/util/Pools$BasePool;->Jz:Lmiui/util/Pools$IInstanceHolder;

    .line 378
    invoke-virtual {p0, p1}, Lmiui/util/Pools$BasePool;->doRelease(Ljava/lang/Object;)V

    .line 379
    return-void

    .line 373
    :cond_29
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "manager create instance cannot return null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 365
    :cond_31
    iget-object p1, p0, Lmiui/util/Pools$BasePool;->zM:Ljava/lang/Object;

    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    move-result p1

    iput p1, p0, Lmiui/util/Pools$BasePool;->Hf:I

    .line 366
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "manager cannot be null and size cannot less then 1"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method abstract a(Lmiui/util/Pools$IInstanceHolder;I)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lmiui/util/Pools$IInstanceHolder<",
            "TT;>;I)V"
        }
    .end annotation
.end method

.method public acquire()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 420
    invoke-virtual {p0}, Lmiui/util/Pools$BasePool;->doAcquire()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public close()V
    .registers 3

    .line 430
    iget-object v0, p0, Lmiui/util/Pools$BasePool;->Jz:Lmiui/util/Pools$IInstanceHolder;

    if-eqz v0, :cond_e

    .line 431
    iget-object v0, p0, Lmiui/util/Pools$BasePool;->Jz:Lmiui/util/Pools$IInstanceHolder;

    iget v1, p0, Lmiui/util/Pools$BasePool;->Hf:I

    invoke-virtual {p0, v0, v1}, Lmiui/util/Pools$BasePool;->a(Lmiui/util/Pools$IInstanceHolder;I)V

    .line 432
    const/4 v0, 0x0

    iput-object v0, p0, Lmiui/util/Pools$BasePool;->Jz:Lmiui/util/Pools$IInstanceHolder;

    .line 434
    :cond_e
    return-void
.end method

.method abstract d(Ljava/lang/Class;I)Lmiui/util/Pools$IInstanceHolder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "TT;>;I)",
            "Lmiui/util/Pools$IInstanceHolder<",
            "TT;>;"
        }
    .end annotation
.end method

.method protected final doAcquire()Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 385
    iget-object v0, p0, Lmiui/util/Pools$BasePool;->Jz:Lmiui/util/Pools$IInstanceHolder;

    if-eqz v0, :cond_23

    .line 389
    iget-object v0, p0, Lmiui/util/Pools$BasePool;->Jz:Lmiui/util/Pools$IInstanceHolder;

    invoke-interface {v0}, Lmiui/util/Pools$IInstanceHolder;->get()Ljava/lang/Object;

    move-result-object v0

    .line 390
    if-nez v0, :cond_1d

    .line 391
    iget-object v0, p0, Lmiui/util/Pools$BasePool;->Jy:Lmiui/util/Pools$Manager;

    invoke-virtual {v0}, Lmiui/util/Pools$Manager;->createInstance()Ljava/lang/Object;

    move-result-object v0

    .line 392
    if-eqz v0, :cond_15

    goto :goto_1d

    .line 393
    :cond_15
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "manager create instance cannot return null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 397
    :cond_1d
    :goto_1d
    iget-object v1, p0, Lmiui/util/Pools$BasePool;->Jy:Lmiui/util/Pools$Manager;

    invoke-virtual {v1, v0}, Lmiui/util/Pools$Manager;->onAcquire(Ljava/lang/Object;)V

    .line 399
    return-object v0

    .line 386
    :cond_23
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Cannot acquire object after close()"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected final doRelease(Ljava/lang/Object;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 403
    iget-object v0, p0, Lmiui/util/Pools$BasePool;->Jz:Lmiui/util/Pools$IInstanceHolder;

    if-eqz v0, :cond_1a

    .line 407
    if-nez p1, :cond_7

    .line 408
    return-void

    .line 411
    :cond_7
    iget-object v0, p0, Lmiui/util/Pools$BasePool;->Jy:Lmiui/util/Pools$Manager;

    invoke-virtual {v0, p1}, Lmiui/util/Pools$Manager;->onRelease(Ljava/lang/Object;)V

    .line 413
    iget-object v0, p0, Lmiui/util/Pools$BasePool;->Jz:Lmiui/util/Pools$IInstanceHolder;

    invoke-interface {v0, p1}, Lmiui/util/Pools$IInstanceHolder;->put(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_19

    .line 414
    iget-object v0, p0, Lmiui/util/Pools$BasePool;->Jy:Lmiui/util/Pools$Manager;

    invoke-virtual {v0, p1}, Lmiui/util/Pools$Manager;->onDestroy(Ljava/lang/Object;)V

    .line 416
    :cond_19
    return-void

    .line 404
    :cond_1a
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Cannot release object after close()"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public getSize()I
    .registers 2

    .line 438
    iget-object v0, p0, Lmiui/util/Pools$BasePool;->Jz:Lmiui/util/Pools$IInstanceHolder;

    if-nez v0, :cond_6

    const/4 v0, 0x0

    goto :goto_8

    :cond_6
    iget v0, p0, Lmiui/util/Pools$BasePool;->Hf:I

    :goto_8
    return v0
.end method

.method public release(Ljava/lang/Object;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 425
    invoke-virtual {p0, p1}, Lmiui/util/Pools$BasePool;->doRelease(Ljava/lang/Object;)V

    .line 426
    return-void
.end method
