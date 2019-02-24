.class final Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;
.super Ljava/util/concurrent/atomic/AtomicInteger;
.source "ObservableCombineLatest.java"

# interfaces
.implements Lio/reactivex/disposables/Disposable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/observable/ObservableCombineLatest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "LatestCoordinator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "R:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/concurrent/atomic/AtomicInteger;",
        "Lio/reactivex/disposables/Disposable;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x76e7117251786db1L


# instance fields
.field active:I

.field final actual:Lio/reactivex/Observer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/Observer<",
            "-TR;>;"
        }
    .end annotation
.end field

.field volatile cancelled:Z

.field final combiner:Lio/reactivex/functions/Function;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Function<",
            "-[",
            "Ljava/lang/Object;",
            "+TR;>;"
        }
    .end annotation
.end field

.field complete:I

.field final delayError:Z

.field volatile done:Z

.field final errors:Lio/reactivex/internal/util/AtomicThrowable;

.field latest:[Ljava/lang/Object;

.field final observers:[Lio/reactivex/internal/operators/observable/ObservableCombineLatest$CombinerObserver;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Lio/reactivex/internal/operators/observable/ObservableCombineLatest$CombinerObserver<",
            "TT;TR;>;"
        }
    .end annotation
.end field

.field final queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/internal/queue/SpscLinkedArrayQueue<",
            "[",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lio/reactivex/Observer;Lio/reactivex/functions/Function;IIZ)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Observer<",
            "-TR;>;",
            "Lio/reactivex/functions/Function<",
            "-[",
            "Ljava/lang/Object;",
            "+TR;>;IIZ)V"
        }
    .end annotation

    .line 97
    invoke-direct {p0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    .line 89
    new-instance v0, Lio/reactivex/internal/util/AtomicThrowable;

    invoke-direct {v0}, Lio/reactivex/internal/util/AtomicThrowable;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->errors:Lio/reactivex/internal/util/AtomicThrowable;

    .line 98
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->actual:Lio/reactivex/Observer;

    .line 99
    iput-object p2, p0, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->combiner:Lio/reactivex/functions/Function;

    .line 100
    iput-boolean p5, p0, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->delayError:Z

    .line 101
    new-array p1, p3, [Ljava/lang/Object;

    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->latest:[Ljava/lang/Object;

    .line 102
    new-array p1, p3, [Lio/reactivex/internal/operators/observable/ObservableCombineLatest$CombinerObserver;

    .line 103
    const/4 p2, 0x0

    :goto_0
    if-ge p2, p3, :cond_0

    .line 104
    new-instance p5, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$CombinerObserver;

    invoke-direct {p5, p0, p2}, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$CombinerObserver;-><init>(Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;I)V

    aput-object p5, p1, p2

    .line 103
    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    .line 106
    :cond_0
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->observers:[Lio/reactivex/internal/operators/observable/ObservableCombineLatest$CombinerObserver;

    .line 107
    new-instance p1, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    invoke-direct {p1, p4}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;-><init>(I)V

    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    .line 108
    return-void
.end method


# virtual methods
.method cancelSources()V
    .locals 4

    .line 139
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->observers:[Lio/reactivex/internal/operators/observable/ObservableCombineLatest$CombinerObserver;

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, v0, v2

    .line 140
    invoke-virtual {v3}, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$CombinerObserver;->dispose()V

    .line 139
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 142
    :cond_0
    return-void
.end method

.method clear(Lio/reactivex/internal/queue/SpscLinkedArrayQueue;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/internal/queue/SpscLinkedArrayQueue<",
            "*>;)V"
        }
    .end annotation

    .line 145
    monitor-enter p0

    .line 146
    const/4 v0, 0x0

    :try_start_0
    iput-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->latest:[Ljava/lang/Object;

    .line 147
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 148
    invoke-virtual {p1}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->clear()V

    .line 149
    return-void

    .line 147
    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public dispose()V
    .locals 1

    .line 124
    iget-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->cancelled:Z

    if-nez v0, :cond_0

    .line 125
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->cancelled:Z

    .line 126
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->cancelSources()V

    .line 127
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->getAndIncrement()I

    move-result v0

    if-nez v0, :cond_0

    .line 128
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    invoke-virtual {p0, v0}, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->clear(Lio/reactivex/internal/queue/SpscLinkedArrayQueue;)V

    .line 131
    :cond_0
    return-void
.end method

.method drain()V
    .locals 8

    .line 152
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->getAndIncrement()I

    move-result v0

    if-eqz v0, :cond_0

    .line 153
    return-void

    .line 156
    :cond_0
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    .line 157
    iget-object v1, p0, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->actual:Lio/reactivex/Observer;

    .line 158
    iget-boolean v2, p0, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->delayError:Z

    .line 160
    nop

    .line 164
    const/4 v3, 0x1

    move v4, v3

    :cond_1
    :goto_0
    iget-boolean v5, p0, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->cancelled:Z

    if-eqz v5, :cond_2

    .line 165
    invoke-virtual {p0, v0}, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->clear(Lio/reactivex/internal/queue/SpscLinkedArrayQueue;)V

    .line 166
    return-void

    .line 169
    :cond_2
    if-nez v2, :cond_3

    iget-object v5, p0, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->errors:Lio/reactivex/internal/util/AtomicThrowable;

    invoke-virtual {v5}, Lio/reactivex/internal/util/AtomicThrowable;->get()Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_3

    .line 170
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->cancelSources()V

    .line 171
    invoke-virtual {p0, v0}, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->clear(Lio/reactivex/internal/queue/SpscLinkedArrayQueue;)V

    .line 172
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->errors:Lio/reactivex/internal/util/AtomicThrowable;

    invoke-virtual {v0}, Lio/reactivex/internal/util/AtomicThrowable;->terminate()Ljava/lang/Throwable;

    move-result-object v0

    invoke-interface {v1, v0}, Lio/reactivex/Observer;->onError(Ljava/lang/Throwable;)V

    .line 173
    return-void

    .line 176
    :cond_3
    iget-boolean v5, p0, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->done:Z

    .line 177
    invoke-virtual {v0}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->poll()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, [Ljava/lang/Object;

    .line 178
    if-nez v6, :cond_4

    .line 180
    move v7, v3

    goto :goto_1

    .line 178
    :cond_4
    const/4 v7, 0x0

    .line 180
    :goto_1
    if-eqz v5, :cond_6

    if-eqz v7, :cond_6

    .line 181
    invoke-virtual {p0, v0}, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->clear(Lio/reactivex/internal/queue/SpscLinkedArrayQueue;)V

    .line 182
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->errors:Lio/reactivex/internal/util/AtomicThrowable;

    invoke-virtual {v0}, Lio/reactivex/internal/util/AtomicThrowable;->terminate()Ljava/lang/Throwable;

    move-result-object v0

    .line 183
    if-nez v0, :cond_5

    .line 184
    invoke-interface {v1}, Lio/reactivex/Observer;->onComplete()V

    goto :goto_2

    .line 186
    :cond_5
    invoke-interface {v1, v0}, Lio/reactivex/Observer;->onError(Ljava/lang/Throwable;)V

    .line 188
    :goto_2
    return-void

    .line 191
    :cond_6
    if-eqz v7, :cond_7

    .line 192
    nop

    .line 212
    neg-int v4, v4

    invoke-virtual {p0, v4}, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->addAndGet(I)I

    move-result v4

    .line 213
    if-nez v4, :cond_1

    .line 214
    nop

    .line 217
    return-void

    .line 198
    :cond_7
    :try_start_0
    iget-object v5, p0, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->combiner:Lio/reactivex/functions/Function;

    invoke-interface {v5, v6}, Lio/reactivex/functions/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    const-string v6, "The combiner returned a null value"

    invoke-static {v5, v6}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 207
    nop

    .line 209
    invoke-interface {v1, v5}, Lio/reactivex/Observer;->onNext(Ljava/lang/Object;)V

    .line 210
    goto :goto_0

    .line 199
    :catch_0
    move-exception v2

    .line 200
    invoke-static {v2}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 201
    iget-object v3, p0, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->errors:Lio/reactivex/internal/util/AtomicThrowable;

    invoke-virtual {v3, v2}, Lio/reactivex/internal/util/AtomicThrowable;->addThrowable(Ljava/lang/Throwable;)Z

    .line 202
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->cancelSources()V

    .line 203
    invoke-virtual {p0, v0}, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->clear(Lio/reactivex/internal/queue/SpscLinkedArrayQueue;)V

    .line 204
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->errors:Lio/reactivex/internal/util/AtomicThrowable;

    invoke-virtual {v0}, Lio/reactivex/internal/util/AtomicThrowable;->terminate()Ljava/lang/Throwable;

    move-result-object v0

    .line 205
    invoke-interface {v1, v0}, Lio/reactivex/Observer;->onError(Ljava/lang/Throwable;)V

    .line 206
    return-void
.end method

.method innerComplete(I)V
    .locals 3

    .line 268
    nop

    .line 269
    monitor-enter p0

    .line 270
    :try_start_0
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->latest:[Ljava/lang/Object;

    .line 271
    if-nez v0, :cond_0

    .line 272
    monitor-exit p0

    return-void

    .line 275
    :cond_0
    aget-object p1, v0, p1

    const/4 v1, 0x1

    if-nez p1, :cond_1

    .line 276
    move p1, v1

    goto :goto_0

    .line 275
    :cond_1
    const/4 p1, 0x0

    .line 276
    :goto_0
    if-nez p1, :cond_2

    iget v2, p0, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->complete:I

    add-int/2addr v2, v1

    iput v2, p0, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->complete:I

    array-length v0, v0

    if-ne v2, v0, :cond_3

    .line 277
    :cond_2
    iput-boolean v1, p0, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->done:Z

    .line 279
    :cond_3
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 280
    if-eqz p1, :cond_4

    .line 281
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->cancelSources()V

    .line 283
    :cond_4
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->drain()V

    .line 284
    return-void

    .line 279
    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method innerError(ILjava/lang/Throwable;)V
    .locals 2

    .line 243
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->errors:Lio/reactivex/internal/util/AtomicThrowable;

    invoke-virtual {v0, p2}, Lio/reactivex/internal/util/AtomicThrowable;->addThrowable(Ljava/lang/Throwable;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 244
    nop

    .line 245
    iget-boolean p2, p0, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->delayError:Z

    const/4 v0, 0x1

    if-eqz p2, :cond_4

    .line 246
    monitor-enter p0

    .line 247
    :try_start_0
    iget-object p2, p0, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->latest:[Ljava/lang/Object;

    .line 248
    if-nez p2, :cond_0

    .line 249
    monitor-exit p0

    return-void

    .line 252
    :cond_0
    aget-object p1, p2, p1

    if-nez p1, :cond_1

    .line 253
    move p1, v0

    goto :goto_0

    .line 252
    :cond_1
    const/4 p1, 0x0

    .line 253
    :goto_0
    if-nez p1, :cond_2

    iget v1, p0, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->complete:I

    add-int/2addr v1, v0

    iput v1, p0, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->complete:I

    array-length p2, p2

    if-ne v1, p2, :cond_3

    .line 254
    :cond_2
    iput-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->done:Z

    .line 256
    :cond_3
    monitor-exit p0

    goto :goto_1

    :catchall_0
    move-exception p1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1

    .line 258
    :cond_4
    move p1, v0

    :goto_1
    if-eqz p1, :cond_5

    .line 259
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->cancelSources()V

    .line 261
    :cond_5
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->drain()V

    .line 262
    goto :goto_2

    .line 263
    :cond_6
    invoke-static {p2}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    .line 265
    :goto_2
    return-void
.end method

.method innerNext(ILjava/lang/Object;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITT;)V"
        }
    .end annotation

    .line 220
    nop

    .line 221
    monitor-enter p0

    .line 222
    :try_start_0
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->latest:[Ljava/lang/Object;

    .line 223
    if-nez v0, :cond_0

    .line 224
    monitor-exit p0

    return-void

    .line 226
    :cond_0
    aget-object v1, v0, p1

    .line 227
    iget v2, p0, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->active:I

    .line 228
    if-nez v1, :cond_1

    .line 229
    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->active:I

    .line 231
    :cond_1
    aput-object p2, v0, p1

    .line 232
    array-length p1, v0

    if-ne v2, p1, :cond_2

    .line 233
    iget-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    invoke-virtual {v0}, [Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->offer(Ljava/lang/Object;)Z

    .line 234
    nop

    .line 236
    const/4 p1, 0x1

    goto :goto_0

    :cond_2
    const/4 p1, 0x0

    :goto_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 237
    if-eqz p1, :cond_3

    .line 238
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->drain()V

    .line 240
    :cond_3
    return-void

    .line 236
    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public isDisposed()Z
    .locals 1

    .line 135
    iget-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->cancelled:Z

    return v0
.end method

.method public subscribe([Lio/reactivex/ObservableSource;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lio/reactivex/ObservableSource<",
            "+TT;>;)V"
        }
    .end annotation

    .line 111
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->observers:[Lio/reactivex/internal/operators/observable/ObservableCombineLatest$CombinerObserver;

    .line 112
    array-length v1, v0

    .line 113
    iget-object v2, p0, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->actual:Lio/reactivex/Observer;

    invoke-interface {v2, p0}, Lio/reactivex/Observer;->onSubscribe(Lio/reactivex/disposables/Disposable;)V

    .line 114
    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_2

    .line 115
    iget-boolean v3, p0, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->done:Z

    if-nez v3, :cond_1

    iget-boolean v3, p0, Lio/reactivex/internal/operators/observable/ObservableCombineLatest$LatestCoordinator;->cancelled:Z

    if-eqz v3, :cond_0

    goto :goto_1

    .line 118
    :cond_0
    aget-object v3, p1, v2

    aget-object v4, v0, v2

    invoke-interface {v3, v4}, Lio/reactivex/ObservableSource;->subscribe(Lio/reactivex/Observer;)V

    .line 114
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 116
    :cond_1
    :goto_1
    return-void

    .line 120
    :cond_2
    return-void
.end method
