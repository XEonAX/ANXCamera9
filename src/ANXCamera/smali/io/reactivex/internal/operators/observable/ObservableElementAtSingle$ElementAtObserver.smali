.class final Lio/reactivex/internal/operators/observable/ObservableElementAtSingle$ElementAtObserver;
.super Ljava/lang/Object;
.source "ObservableElementAtSingle.java"

# interfaces
.implements Lio/reactivex/Observer;
.implements Lio/reactivex/disposables/Disposable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/observable/ObservableElementAtSingle;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "ElementAtObserver"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lio/reactivex/Observer<",
        "TT;>;",
        "Lio/reactivex/disposables/Disposable;"
    }
.end annotation


# instance fields
.field final actual:Lio/reactivex/SingleObserver;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/SingleObserver<",
            "-TT;>;"
        }
    .end annotation
.end field

.field count:J

.field final defaultValue:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field done:Z

.field final index:J

.field s:Lio/reactivex/disposables/Disposable;


# direct methods
.method constructor <init>(Lio/reactivex/SingleObserver;JLjava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/SingleObserver<",
            "-TT;>;JTT;)V"
        }
    .end annotation

    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableElementAtSingle$ElementAtObserver;->actual:Lio/reactivex/SingleObserver;

    .line 58
    iput-wide p2, p0, Lio/reactivex/internal/operators/observable/ObservableElementAtSingle$ElementAtObserver;->index:J

    .line 59
    iput-object p4, p0, Lio/reactivex/internal/operators/observable/ObservableElementAtSingle$ElementAtObserver;->defaultValue:Ljava/lang/Object;

    .line 60
    return-void
.end method


# virtual methods
.method public dispose()V
    .locals 1

    .line 73
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableElementAtSingle$ElementAtObserver;->s:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 74
    return-void
.end method

.method public isDisposed()Z
    .locals 1

    .line 78
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableElementAtSingle$ElementAtObserver;->s:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->isDisposed()Z

    move-result v0

    return v0
.end method

.method public onComplete()V
    .locals 2

    .line 109
    iget-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableElementAtSingle$ElementAtObserver;->done:Z

    if-nez v0, :cond_1

    .line 110
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableElementAtSingle$ElementAtObserver;->done:Z

    .line 112
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableElementAtSingle$ElementAtObserver;->defaultValue:Ljava/lang/Object;

    .line 114
    if-eqz v0, :cond_0

    .line 115
    iget-object v1, p0, Lio/reactivex/internal/operators/observable/ObservableElementAtSingle$ElementAtObserver;->actual:Lio/reactivex/SingleObserver;

    invoke-interface {v1, v0}, Lio/reactivex/SingleObserver;->onSuccess(Ljava/lang/Object;)V

    goto :goto_0

    .line 117
    :cond_0
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableElementAtSingle$ElementAtObserver;->actual:Lio/reactivex/SingleObserver;

    new-instance v1, Ljava/util/NoSuchElementException;

    invoke-direct {v1}, Ljava/util/NoSuchElementException;-><init>()V

    invoke-interface {v0, v1}, Lio/reactivex/SingleObserver;->onError(Ljava/lang/Throwable;)V

    .line 120
    :cond_1
    :goto_0
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1

    .line 99
    iget-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableElementAtSingle$ElementAtObserver;->done:Z

    if-eqz v0, :cond_0

    .line 100
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    .line 101
    return-void

    .line 103
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableElementAtSingle$ElementAtObserver;->done:Z

    .line 104
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableElementAtSingle$ElementAtObserver;->actual:Lio/reactivex/SingleObserver;

    invoke-interface {v0, p1}, Lio/reactivex/SingleObserver;->onError(Ljava/lang/Throwable;)V

    .line 105
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 84
    iget-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableElementAtSingle$ElementAtObserver;->done:Z

    if-eqz v0, :cond_0

    .line 85
    return-void

    .line 87
    :cond_0
    iget-wide v0, p0, Lio/reactivex/internal/operators/observable/ObservableElementAtSingle$ElementAtObserver;->count:J

    .line 88
    iget-wide v2, p0, Lio/reactivex/internal/operators/observable/ObservableElementAtSingle$ElementAtObserver;->index:J

    cmp-long v2, v0, v2

    if-nez v2, :cond_1

    .line 89
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableElementAtSingle$ElementAtObserver;->done:Z

    .line 90
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableElementAtSingle$ElementAtObserver;->s:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 91
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableElementAtSingle$ElementAtObserver;->actual:Lio/reactivex/SingleObserver;

    invoke-interface {v0, p1}, Lio/reactivex/SingleObserver;->onSuccess(Ljava/lang/Object;)V

    .line 92
    return-void

    .line 94
    :cond_1
    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    iput-wide v0, p0, Lio/reactivex/internal/operators/observable/ObservableElementAtSingle$ElementAtObserver;->count:J

    .line 95
    return-void
.end method

.method public onSubscribe(Lio/reactivex/disposables/Disposable;)V
    .locals 1

    .line 64
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableElementAtSingle$ElementAtObserver;->s:Lio/reactivex/disposables/Disposable;

    invoke-static {v0, p1}, Lio/reactivex/internal/disposables/DisposableHelper;->validate(Lio/reactivex/disposables/Disposable;Lio/reactivex/disposables/Disposable;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 65
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableElementAtSingle$ElementAtObserver;->s:Lio/reactivex/disposables/Disposable;

    .line 66
    iget-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableElementAtSingle$ElementAtObserver;->actual:Lio/reactivex/SingleObserver;

    invoke-interface {p1, p0}, Lio/reactivex/SingleObserver;->onSubscribe(Lio/reactivex/disposables/Disposable;)V

    .line 68
    :cond_0
    return-void
.end method
