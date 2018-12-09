.class final Lio/reactivex/internal/operators/completable/CompletableAmb$Amb;
.super Ljava/lang/Object;
.source "CompletableAmb.java"

# interfaces
.implements Lio/reactivex/CompletableObserver;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/completable/CompletableAmb;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Amb"
.end annotation


# instance fields
.field private final once:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private final s:Lio/reactivex/CompletableObserver;

.field private final set:Lio/reactivex/disposables/CompositeDisposable;


# direct methods
.method constructor <init>(Ljava/util/concurrent/atomic/AtomicBoolean;Lio/reactivex/disposables/CompositeDisposable;Lio/reactivex/CompletableObserver;)V
    .locals 0

    .line 98
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 99
    iput-object p1, p0, Lio/reactivex/internal/operators/completable/CompletableAmb$Amb;->once:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 100
    iput-object p2, p0, Lio/reactivex/internal/operators/completable/CompletableAmb$Amb;->set:Lio/reactivex/disposables/CompositeDisposable;

    .line 101
    iput-object p3, p0, Lio/reactivex/internal/operators/completable/CompletableAmb$Amb;->s:Lio/reactivex/CompletableObserver;

    .line 102
    return-void
.end method


# virtual methods
.method public onComplete()V
    .locals 3

    .line 106
    iget-object v0, p0, Lio/reactivex/internal/operators/completable/CompletableAmb$Amb;->once:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 107
    iget-object v0, p0, Lio/reactivex/internal/operators/completable/CompletableAmb$Amb;->set:Lio/reactivex/disposables/CompositeDisposable;

    invoke-virtual {v0}, Lio/reactivex/disposables/CompositeDisposable;->dispose()V

    .line 108
    iget-object v0, p0, Lio/reactivex/internal/operators/completable/CompletableAmb$Amb;->s:Lio/reactivex/CompletableObserver;

    invoke-interface {v0}, Lio/reactivex/CompletableObserver;->onComplete()V

    .line 110
    :cond_0
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 3

    .line 114
    iget-object v0, p0, Lio/reactivex/internal/operators/completable/CompletableAmb$Amb;->once:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 115
    iget-object v0, p0, Lio/reactivex/internal/operators/completable/CompletableAmb$Amb;->set:Lio/reactivex/disposables/CompositeDisposable;

    invoke-virtual {v0}, Lio/reactivex/disposables/CompositeDisposable;->dispose()V

    .line 116
    iget-object v0, p0, Lio/reactivex/internal/operators/completable/CompletableAmb$Amb;->s:Lio/reactivex/CompletableObserver;

    invoke-interface {v0, p1}, Lio/reactivex/CompletableObserver;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 118
    :cond_0
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    .line 120
    :goto_0
    return-void
.end method

.method public onSubscribe(Lio/reactivex/disposables/Disposable;)V
    .locals 1

    .line 124
    iget-object v0, p0, Lio/reactivex/internal/operators/completable/CompletableAmb$Amb;->set:Lio/reactivex/disposables/CompositeDisposable;

    invoke-virtual {v0, p1}, Lio/reactivex/disposables/CompositeDisposable;->add(Lio/reactivex/disposables/Disposable;)Z

    .line 125
    return-void
.end method
