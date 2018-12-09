.class public final Lio/reactivex/internal/observers/FullArbiterObserver;
.super Ljava/lang/Object;
.source "FullArbiterObserver.java"

# interfaces
.implements Lio/reactivex/Observer;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lio/reactivex/Observer<",
        "TT;>;"
    }
.end annotation


# instance fields
.field final arbiter:Lio/reactivex/internal/disposables/ObserverFullArbiter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/internal/disposables/ObserverFullArbiter<",
            "TT;>;"
        }
    .end annotation
.end field

.field s:Lio/reactivex/disposables/Disposable;


# direct methods
.method public constructor <init>(Lio/reactivex/internal/disposables/ObserverFullArbiter;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/internal/disposables/ObserverFullArbiter<",
            "TT;>;)V"
        }
    .end annotation

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    iput-object p1, p0, Lio/reactivex/internal/observers/FullArbiterObserver;->arbiter:Lio/reactivex/internal/disposables/ObserverFullArbiter;

    .line 32
    return-void
.end method


# virtual methods
.method public onComplete()V
    .locals 2

    .line 54
    iget-object v0, p0, Lio/reactivex/internal/observers/FullArbiterObserver;->arbiter:Lio/reactivex/internal/disposables/ObserverFullArbiter;

    iget-object v1, p0, Lio/reactivex/internal/observers/FullArbiterObserver;->s:Lio/reactivex/disposables/Disposable;

    invoke-virtual {v0, v1}, Lio/reactivex/internal/disposables/ObserverFullArbiter;->onComplete(Lio/reactivex/disposables/Disposable;)V

    .line 55
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 2

    .line 49
    iget-object v0, p0, Lio/reactivex/internal/observers/FullArbiterObserver;->arbiter:Lio/reactivex/internal/disposables/ObserverFullArbiter;

    iget-object v1, p0, Lio/reactivex/internal/observers/FullArbiterObserver;->s:Lio/reactivex/disposables/Disposable;

    invoke-virtual {v0, p1, v1}, Lio/reactivex/internal/disposables/ObserverFullArbiter;->onError(Ljava/lang/Throwable;Lio/reactivex/disposables/Disposable;)V

    .line 50
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 44
    iget-object v0, p0, Lio/reactivex/internal/observers/FullArbiterObserver;->arbiter:Lio/reactivex/internal/disposables/ObserverFullArbiter;

    iget-object v1, p0, Lio/reactivex/internal/observers/FullArbiterObserver;->s:Lio/reactivex/disposables/Disposable;

    invoke-virtual {v0, p1, v1}, Lio/reactivex/internal/disposables/ObserverFullArbiter;->onNext(Ljava/lang/Object;Lio/reactivex/disposables/Disposable;)Z

    .line 45
    return-void
.end method

.method public onSubscribe(Lio/reactivex/disposables/Disposable;)V
    .locals 1

    .line 36
    iget-object v0, p0, Lio/reactivex/internal/observers/FullArbiterObserver;->s:Lio/reactivex/disposables/Disposable;

    invoke-static {v0, p1}, Lio/reactivex/internal/disposables/DisposableHelper;->validate(Lio/reactivex/disposables/Disposable;Lio/reactivex/disposables/Disposable;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 37
    iput-object p1, p0, Lio/reactivex/internal/observers/FullArbiterObserver;->s:Lio/reactivex/disposables/Disposable;

    .line 38
    iget-object v0, p0, Lio/reactivex/internal/observers/FullArbiterObserver;->arbiter:Lio/reactivex/internal/disposables/ObserverFullArbiter;

    invoke-virtual {v0, p1}, Lio/reactivex/internal/disposables/ObserverFullArbiter;->setDisposable(Lio/reactivex/disposables/Disposable;)Z

    .line 40
    :cond_0
    return-void
.end method
