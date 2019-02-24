.class final Lio/reactivex/internal/operators/completable/CompletableDetach$DetachCompletableObserver;
.super Ljava/lang/Object;
.source "CompletableDetach.java"

# interfaces
.implements Lio/reactivex/CompletableObserver;
.implements Lio/reactivex/disposables/Disposable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/completable/CompletableDetach;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "DetachCompletableObserver"
.end annotation


# instance fields
.field actual:Lio/reactivex/CompletableObserver;

.field d:Lio/reactivex/disposables/Disposable;


# direct methods
.method constructor <init>(Lio/reactivex/CompletableObserver;)V
    .locals 0

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    iput-object p1, p0, Lio/reactivex/internal/operators/completable/CompletableDetach$DetachCompletableObserver;->actual:Lio/reactivex/CompletableObserver;

    .line 48
    return-void
.end method


# virtual methods
.method public dispose()V
    .locals 1

    .line 52
    const/4 v0, 0x0

    iput-object v0, p0, Lio/reactivex/internal/operators/completable/CompletableDetach$DetachCompletableObserver;->actual:Lio/reactivex/CompletableObserver;

    .line 53
    iget-object v0, p0, Lio/reactivex/internal/operators/completable/CompletableDetach$DetachCompletableObserver;->d:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 54
    sget-object v0, Lio/reactivex/internal/disposables/DisposableHelper;->DISPOSED:Lio/reactivex/internal/disposables/DisposableHelper;

    iput-object v0, p0, Lio/reactivex/internal/operators/completable/CompletableDetach$DetachCompletableObserver;->d:Lio/reactivex/disposables/Disposable;

    .line 55
    return-void
.end method

.method public isDisposed()Z
    .locals 1

    .line 59
    iget-object v0, p0, Lio/reactivex/internal/operators/completable/CompletableDetach$DetachCompletableObserver;->d:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->isDisposed()Z

    move-result v0

    return v0
.end method

.method public onComplete()V
    .locals 2

    .line 83
    sget-object v0, Lio/reactivex/internal/disposables/DisposableHelper;->DISPOSED:Lio/reactivex/internal/disposables/DisposableHelper;

    iput-object v0, p0, Lio/reactivex/internal/operators/completable/CompletableDetach$DetachCompletableObserver;->d:Lio/reactivex/disposables/Disposable;

    .line 84
    iget-object v0, p0, Lio/reactivex/internal/operators/completable/CompletableDetach$DetachCompletableObserver;->actual:Lio/reactivex/CompletableObserver;

    .line 85
    if-eqz v0, :cond_0

    .line 86
    const/4 v1, 0x0

    iput-object v1, p0, Lio/reactivex/internal/operators/completable/CompletableDetach$DetachCompletableObserver;->actual:Lio/reactivex/CompletableObserver;

    .line 87
    invoke-interface {v0}, Lio/reactivex/CompletableObserver;->onComplete()V

    .line 89
    :cond_0
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 2

    .line 73
    sget-object v0, Lio/reactivex/internal/disposables/DisposableHelper;->DISPOSED:Lio/reactivex/internal/disposables/DisposableHelper;

    iput-object v0, p0, Lio/reactivex/internal/operators/completable/CompletableDetach$DetachCompletableObserver;->d:Lio/reactivex/disposables/Disposable;

    .line 74
    iget-object v0, p0, Lio/reactivex/internal/operators/completable/CompletableDetach$DetachCompletableObserver;->actual:Lio/reactivex/CompletableObserver;

    .line 75
    if-eqz v0, :cond_0

    .line 76
    const/4 v1, 0x0

    iput-object v1, p0, Lio/reactivex/internal/operators/completable/CompletableDetach$DetachCompletableObserver;->actual:Lio/reactivex/CompletableObserver;

    .line 77
    invoke-interface {v0, p1}, Lio/reactivex/CompletableObserver;->onError(Ljava/lang/Throwable;)V

    .line 79
    :cond_0
    return-void
.end method

.method public onSubscribe(Lio/reactivex/disposables/Disposable;)V
    .locals 1

    .line 64
    iget-object v0, p0, Lio/reactivex/internal/operators/completable/CompletableDetach$DetachCompletableObserver;->d:Lio/reactivex/disposables/Disposable;

    invoke-static {v0, p1}, Lio/reactivex/internal/disposables/DisposableHelper;->validate(Lio/reactivex/disposables/Disposable;Lio/reactivex/disposables/Disposable;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 65
    iput-object p1, p0, Lio/reactivex/internal/operators/completable/CompletableDetach$DetachCompletableObserver;->d:Lio/reactivex/disposables/Disposable;

    .line 67
    iget-object p1, p0, Lio/reactivex/internal/operators/completable/CompletableDetach$DetachCompletableObserver;->actual:Lio/reactivex/CompletableObserver;

    invoke-interface {p1, p0}, Lio/reactivex/CompletableObserver;->onSubscribe(Lio/reactivex/disposables/Disposable;)V

    .line 69
    :cond_0
    return-void
.end method
