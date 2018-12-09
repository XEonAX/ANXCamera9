.class Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;
.super Landroid/os/Handler;
.source "InstrumentationConnection.java"


# annotations
.annotation build Landroid/support/annotation/VisibleForTesting;
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/test/internal/runner/InstrumentationConnection;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "IncomingHandler"
.end annotation


# instance fields
.field private final latches:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/util/UUID;",
            "Ljava/util/concurrent/CountDownLatch;",
            ">;"
        }
    .end annotation
.end field

.field mMessengerHandler:Landroid/os/Messenger;
    .annotation build Landroid/support/annotation/VisibleForTesting;
    .end annotation
.end field

.field mOtherInstrumentations:Ljava/util/Set;
    .annotation build Landroid/support/annotation/VisibleForTesting;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Landroid/os/Messenger;",
            ">;"
        }
    .end annotation
.end field

.field mTypedClients:Ljava/util/Map;
    .annotation build Landroid/support/annotation/VisibleForTesting;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/Set<",
            "Landroid/os/Messenger;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/os/Looper;)V
    .locals 1

    .line 327
    invoke-direct {p0, p1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 308
    new-instance v0, Landroid/os/Messenger;

    invoke-direct {v0, p0}, Landroid/os/Messenger;-><init>(Landroid/os/Handler;)V

    iput-object v0, p0, Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;->mMessengerHandler:Landroid/os/Messenger;

    .line 313
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;->mOtherInstrumentations:Ljava/util/Set;

    .line 319
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;->mTypedClients:Ljava/util/Map;

    .line 324
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;->latches:Ljava/util/Map;

    .line 328
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    if-eq v0, p1, :cond_0

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    if-eq v0, p1, :cond_0

    .line 333
    return-void

    .line 329
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "This handler should not be using the main thread looper nor the instrumentation thread looper."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method static synthetic access$000(Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;)V
    .locals 0

    .line 306
    invoke-direct {p0}, Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;->doDie()V

    return-void
.end method

.method static synthetic access$100(Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;Ljava/util/concurrent/Callable;)Ljava/lang/Object;
    .locals 0

    .line 306
    invoke-direct {p0, p1}, Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;->runSyncTask(Ljava/util/concurrent/Callable;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$200(Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;Ljava/util/UUID;Ljava/util/concurrent/CountDownLatch;)V
    .locals 0

    .line 306
    invoke-direct {p0, p1, p2}, Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;->associateLatch(Ljava/util/UUID;Ljava/util/concurrent/CountDownLatch;)V

    return-void
.end method

.method static synthetic access$300(Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;Ljava/util/UUID;)V
    .locals 0

    .line 306
    invoke-direct {p0, p1}, Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;->disassociateLatch(Ljava/util/UUID;)V

    return-void
.end method

.method static synthetic access$400(Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;Ljava/lang/String;)Ljava/util/Set;
    .locals 0

    .line 306
    invoke-direct {p0, p1}, Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;->getClientsForType(Ljava/lang/String;)Ljava/util/Set;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$700(Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;)Ljava/util/Map;
    .locals 0

    .line 306
    iget-object p0, p0, Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;->latches:Ljava/util/Map;

    return-object p0
.end method

.method private associateLatch(Ljava/util/UUID;Ljava/util/concurrent/CountDownLatch;)V
    .locals 1

    .line 453
    new-instance v0, Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler$1;

    invoke-direct {v0, p0, p1, p2}, Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler$1;-><init>(Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;Ljava/util/UUID;Ljava/util/concurrent/CountDownLatch;)V

    invoke-direct {p0, v0}, Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;->runSyncTask(Ljava/util/concurrent/Callable;)Ljava/lang/Object;

    .line 461
    return-void
.end method

.method private clientsRegistrationFromBundle(Landroid/os/Bundle;Z)V
    .locals 7

    .line 586
    const-string v0, "InstrConnection"

    const-string v1, "clientsRegistrationFromBundle called"

    const/4 v2, 0x0

    new-array v3, v2, [Ljava/lang/Object;

    invoke-static {v0, v1, v3}, Landroid/support/test/internal/util/LogUtil;->logDebugWithProcess(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 588
    if-nez p1, :cond_0

    .line 589
    const-string p1, "InstrConnection"

    const-string p2, "The client bundle is null, ignoring..."

    invoke-static {p1, p2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 590
    return-void

    .line 593
    :cond_0
    const-string v0, "instr_clients"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    .line 595
    if-nez v0, :cond_1

    .line 596
    const-string p1, "InstrConnection"

    const-string p2, "No clients found in the given bundle"

    invoke-static {p1, p2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 597
    return-void

    .line 600
    :cond_1
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 601
    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Landroid/os/Bundle;->getParcelableArray(Ljava/lang/String;)[Landroid/os/Parcelable;

    move-result-object v3

    .line 602
    if-eqz v3, :cond_3

    .line 603
    array-length v4, v3

    move v5, v2

    :goto_1
    if-ge v5, v4, :cond_3

    aget-object v6, v3, v5

    .line 604
    if-eqz p2, :cond_2

    .line 605
    check-cast v6, Landroid/os/Messenger;

    invoke-direct {p0, v1, v6}, Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;->registerClient(Ljava/lang/String;Landroid/os/Messenger;)V

    goto :goto_2

    .line 607
    :cond_2
    check-cast v6, Landroid/os/Messenger;

    invoke-direct {p0, v1, v6}, Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;->unregisterClient(Ljava/lang/String;Landroid/os/Messenger;)V

    .line 603
    :goto_2
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 611
    :cond_3
    goto :goto_0

    .line 612
    :cond_4
    return-void
.end method

.method private disassociateLatch(Ljava/util/UUID;)V
    .locals 1

    .line 464
    new-instance v0, Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler$2;

    invoke-direct {v0, p0, p1}, Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler$2;-><init>(Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;Ljava/util/UUID;)V

    invoke-direct {p0, v0}, Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;->runSyncTask(Ljava/util/concurrent/Callable;)Ljava/lang/Object;

    .line 472
    return-void
.end method

.method private doDie()V
    .locals 5

    .line 488
    const-string v0, "InstrConnection"

    const-string v1, "terminating process"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 490
    const/4 v0, 0x0

    const/4 v1, 0x5

    invoke-direct {p0, v1, v0}, Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;->sendMessageToOtherInstr(ILandroid/os/Bundle;)V

    .line 491
    iget-object v1, p0, Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;->mOtherInstrumentations:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->clear()V

    .line 492
    iget-object v1, p0, Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;->mTypedClients:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->clear()V

    .line 493
    const-string v1, "InstrConnection"

    const-string v2, "quitting looper..."

    const/4 v3, 0x0

    new-array v4, v3, [Ljava/lang/Object;

    invoke-static {v1, v2, v4}, Landroid/support/test/internal/util/LogUtil;->logDebugWithProcess(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 494
    invoke-virtual {p0}, Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;->getLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-virtual {v1}, Landroid/os/Looper;->quit()V

    .line 495
    const-string v1, "InstrConnection"

    const-string v2, "finishing instrumentation..."

    new-array v4, v3, [Ljava/lang/Object;

    invoke-static {v1, v2, v4}, Landroid/support/test/internal/util/LogUtil;->logDebugWithProcess(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 496
    invoke-static {}, Landroid/support/test/internal/runner/InstrumentationConnection;->access$600()Landroid/app/Instrumentation;

    move-result-object v1

    invoke-virtual {v1, v3, v0}, Landroid/app/Instrumentation;->finish(ILandroid/os/Bundle;)V

    .line 497
    invoke-static {v0}, Landroid/support/test/internal/runner/InstrumentationConnection;->access$602(Landroid/app/Instrumentation;)Landroid/app/Instrumentation;

    .line 498
    invoke-static {v0}, Landroid/support/test/internal/runner/InstrumentationConnection;->access$502(Landroid/support/test/runner/MonitoringInstrumentation$ActivityFinisher;)Landroid/support/test/runner/MonitoringInstrumentation$ActivityFinisher;

    .line 499
    return-void
.end method

.method private getClientsForType(Ljava/lang/String;)Ljava/util/Set;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Set<",
            "Landroid/os/Messenger;",
            ">;"
        }
    .end annotation

    .line 502
    new-instance v0, Ljava/util/concurrent/FutureTask;

    new-instance v1, Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler$3;

    invoke-direct {v1, p0, p1}, Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler$3;-><init>(Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;Ljava/lang/String;)V

    invoke-direct {v0, v1}, Ljava/util/concurrent/FutureTask;-><init>(Ljava/util/concurrent/Callable;)V

    .line 510
    invoke-virtual {p0, v0}, Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;->post(Ljava/lang/Runnable;)Z

    .line 513
    :try_start_0
    invoke-virtual {v0}, Ljava/util/concurrent/FutureTask;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/Set;
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    .line 517
    :catch_0
    move-exception p1

    .line 519
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-virtual {p1}, Ljava/util/concurrent/ExecutionException;->getCause()Ljava/lang/Throwable;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v0

    .line 514
    :catch_1
    move-exception p1

    .line 516
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v0
.end method

.method private instrBinderDied(Landroid/os/Messenger;)V
    .locals 1

    .line 665
    const/4 v0, 0x5

    invoke-virtual {p0, v0}, Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    .line 666
    iput-object p1, v0, Landroid/os/Message;->replyTo:Landroid/os/Messenger;

    .line 667
    invoke-virtual {p0, v0}, Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;->sendMessage(Landroid/os/Message;)Z

    .line 668
    return-void
.end method

.method private notifyLatch(Ljava/util/UUID;)V
    .locals 3

    .line 445
    if-eqz p1, :cond_0

    iget-object v0, p0, Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;->latches:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 446
    iget-object v0, p0, Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;->latches:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {p1}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    goto :goto_0

    .line 448
    :cond_0
    const-string v0, "InstrConnection"

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    const/16 v1, 0x10

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    add-int/2addr v1, v2

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v1, "Latch not found "

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 450
    :goto_0
    return-void
.end method

.method private registerClient(Ljava/lang/String;Landroid/os/Messenger;)V
    .locals 4

    .line 615
    const-string v0, "InstrConnection"

    const-string v1, "registerClient called with type = [%s] client = [%s]"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    const/4 v3, 0x1

    aput-object p2, v2, v3

    invoke-static {v0, v1, v2}, Landroid/support/test/internal/util/LogUtil;->logDebugWithProcess(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 617
    const-string v0, "type cannot be null!"

    invoke-static {p1, v0}, Landroid/support/test/internal/util/Checks;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 618
    const-string v0, "client cannot be null!"

    invoke-static {p2, v0}, Landroid/support/test/internal/util/Checks;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 620
    iget-object v0, p0, Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;->mTypedClients:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Set;

    .line 622
    if-nez v0, :cond_0

    .line 624
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 625
    invoke-interface {v0, p2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 626
    iget-object p2, p0, Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;->mTypedClients:Ljava/util/Map;

    invoke-interface {p2, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 627
    return-void

    .line 631
    :cond_0
    invoke-interface {v0, p2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 632
    return-void
.end method

.method private runSyncTask(Ljava/util/concurrent/Callable;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/Callable<",
            "TT;>;)TT;"
        }
    .end annotation

    .line 475
    new-instance v0, Ljava/util/concurrent/FutureTask;

    invoke-direct {v0, p1}, Ljava/util/concurrent/FutureTask;-><init>(Ljava/util/concurrent/Callable;)V

    .line 476
    invoke-virtual {p0, v0}, Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;->post(Ljava/lang/Runnable;)Z

    .line 479
    :try_start_0
    invoke-virtual {v0}, Ljava/util/concurrent/FutureTask;->get()Ljava/lang/Object;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    .line 482
    :catch_0
    move-exception p1

    .line 483
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-virtual {p1}, Ljava/util/concurrent/ExecutionException;->getCause()Ljava/lang/Throwable;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v0

    .line 480
    :catch_1
    move-exception p1

    .line 481
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-virtual {p1}, Ljava/lang/InterruptedException;->getCause()Ljava/lang/Throwable;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v0
.end method

.method private sendMessageToOtherInstr(ILandroid/os/Bundle;)V
    .locals 5

    .line 571
    const-string v0, "InstrConnection"

    const-string v1, "sendMessageToOtherInstr() called with: what = [%s], data = [%s]"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    .line 572
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    const/4 v3, 0x1

    aput-object p2, v2, v3

    .line 571
    invoke-static {v0, v1, v2}, Landroid/support/test/internal/util/LogUtil;->logDebugWithProcess(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 573
    iget-object v0, p0, Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;->mOtherInstrumentations:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/os/Messenger;

    .line 574
    invoke-direct {p0, v1, p1, p2}, Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;->sendMessageWithReply(Landroid/os/Messenger;ILandroid/os/Bundle;)V

    .line 575
    goto :goto_0

    .line 576
    :cond_0
    return-void
.end method

.method private sendMessageWithReply(Landroid/os/Messenger;ILandroid/os/Bundle;)V
    .locals 4

    .line 533
    const-string v0, "InstrConnection"

    new-instance v1, Ljava/lang/StringBuilder;

    const/16 v2, 0x2d

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v2, "sendMessageWithReply type: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " called"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v0, v1, v2}, Landroid/support/test/internal/util/LogUtil;->logDebugWithProcess(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 536
    invoke-virtual {p0, p2}, Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;->obtainMessage(I)Landroid/os/Message;

    move-result-object p2

    .line 537
    iget-object v0, p0, Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;->mMessengerHandler:Landroid/os/Messenger;

    iput-object v0, p2, Landroid/os/Message;->replyTo:Landroid/os/Messenger;

    .line 538
    if-eqz p3, :cond_0

    .line 539
    invoke-virtual {p2, p3}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 543
    :cond_0
    iget-object p3, p0, Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;->mTypedClients:Ljava/util/Map;

    invoke-interface {p3}, Ljava/util/Map;->isEmpty()Z

    move-result p3

    if-nez p3, :cond_2

    .line 544
    invoke-virtual {p2}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object p3

    .line 546
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;->mTypedClients:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 547
    const-string v1, "instr_clients"

    invoke-virtual {p3, v1, v0}, Landroid/os/Bundle;->putStringArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 548
    iget-object v0, p0, Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;->mTypedClients:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 549
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 550
    nop

    .line 551
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->size()I

    move-result v1

    new-array v1, v1, [Landroid/os/Messenger;

    invoke-interface {v3, v1}, Ljava/util/Set;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Landroid/os/Messenger;

    .line 552
    invoke-virtual {p3, v2, v1}, Landroid/os/Bundle;->putParcelableArray(Ljava/lang/String;[Landroid/os/Parcelable;)V

    .line 553
    goto :goto_0

    .line 554
    :cond_1
    invoke-virtual {p2, p3}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 559
    :cond_2
    :try_start_0
    invoke-virtual {p1, p2}, Landroid/os/Messenger;->send(Landroid/os/Message;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 567
    goto :goto_1

    .line 560
    :catch_0
    move-exception p2

    .line 564
    const-string p3, "InstrConnection"

    const-string v0, "The remote process is terminated unexpectedly"

    invoke-static {p3, v0, p2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 566
    invoke-direct {p0, p1}, Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;->instrBinderDied(Landroid/os/Messenger;)V

    .line 568
    :goto_1
    return-void
.end method

.method private unregisterClient(Ljava/lang/String;Landroid/os/Messenger;)V
    .locals 4

    .line 635
    const-string v0, "InstrConnection"

    const-string v1, "unregisterClient called with type = [%s] client = [%s]"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    const/4 v3, 0x1

    aput-object p2, v2, v3

    invoke-static {v0, v1, v2}, Landroid/support/test/internal/util/LogUtil;->logDebugWithProcess(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 637
    const-string v0, "type cannot be null!"

    invoke-static {p1, v0}, Landroid/support/test/internal/util/Checks;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 638
    const-string v0, "client cannot be null!"

    invoke-static {p2, v0}, Landroid/support/test/internal/util/Checks;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 640
    iget-object v0, p0, Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;->mTypedClients:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 641
    const-string p2, "InstrConnection"

    const-string v0, "There are no registered clients for type: "

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {v0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_0
    new-instance p1, Ljava/lang/String;

    invoke-direct {p1, v0}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    :goto_0
    invoke-static {p2, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 642
    return-void

    .line 645
    :cond_1
    iget-object v0, p0, Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;->mTypedClients:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Set;

    .line 647
    invoke-interface {v0, p2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 648
    const-string p2, "InstrConnection"

    const/16 v0, 0x4e

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    add-int/2addr v0, v1

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v0, "Could not unregister client for type "

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " because it doesn\'t seem to be registered"

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p2, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 653
    return-void

    .line 657
    :cond_2
    invoke-interface {v0, p2}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 659
    invoke-interface {v0}, Ljava/util/Set;->isEmpty()Z

    move-result p2

    if-eqz p2, :cond_3

    .line 660
    iget-object p2, p0, Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;->mTypedClients:Ljava/util/Map;

    invoke-interface {p2, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 662
    :cond_3
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 5

    .line 337
    iget v0, p1, Landroid/os/Message;->what:I

    const/4 v1, 0x0

    const/16 v2, 0xc

    const/4 v3, 0x1

    const/4 v4, 0x0

    packed-switch v0, :pswitch_data_0

    .line 439
    const-string v0, "InstrConnection"

    iget v1, p1, Landroid/os/Message;->what:I

    const/16 v2, 0x2a

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v2, "Unknown message code received: "

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 440
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    goto/16 :goto_0

    .line 435
    :pswitch_0
    const-string v0, "InstrConnection"

    const-string v1, "handleMessage(MSG_PERFORM_CLEANUP_FINISHED)"

    new-array v2, v4, [Ljava/lang/Object;

    invoke-static {v0, v1, v2}, Landroid/support/test/internal/util/LogUtil;->logDebugWithProcess(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 436
    invoke-virtual {p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object p1

    const-string v0, "instr_uuid"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object p1

    check-cast p1, Ljava/util/UUID;

    invoke-direct {p0, p1}, Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;->notifyLatch(Ljava/util/UUID;)V

    .line 437
    goto/16 :goto_0

    .line 430
    :pswitch_1
    const-string v0, "InstrConnection"

    const-string v1, "handleMessage(MSG_PERFORM_CLEANUP)"

    new-array v3, v4, [Ljava/lang/Object;

    invoke-static {v0, v1, v3}, Landroid/support/test/internal/util/LogUtil;->logDebugWithProcess(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 431
    invoke-static {}, Landroid/support/test/internal/runner/InstrumentationConnection;->access$600()Landroid/app/Instrumentation;

    move-result-object v0

    invoke-static {}, Landroid/support/test/internal/runner/InstrumentationConnection;->access$500()Landroid/support/test/runner/MonitoringInstrumentation$ActivityFinisher;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/Instrumentation;->runOnMainSync(Ljava/lang/Runnable;)V

    .line 432
    iget-object v0, p1, Landroid/os/Message;->replyTo:Landroid/os/Messenger;

    invoke-virtual {p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object p1

    invoke-direct {p0, v0, v2, p1}, Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;->sendMessageWithReply(Landroid/os/Messenger;ILandroid/os/Bundle;)V

    .line 433
    goto/16 :goto_0

    .line 420
    :pswitch_2
    const-string v0, "InstrConnection"

    const-string v1, "handleMessage(MSG_REMOTE_CLEANUP_REQUEST)"

    new-array v3, v4, [Ljava/lang/Object;

    invoke-static {v0, v1, v3}, Landroid/support/test/internal/util/LogUtil;->logDebugWithProcess(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 421
    iget-object v0, p0, Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;->mOtherInstrumentations:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 422
    invoke-virtual {p0, v2}, Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    .line 423
    invoke-virtual {p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 424
    invoke-virtual {p0, v0}, Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;->sendMessage(Landroid/os/Message;)Z

    .line 425
    goto/16 :goto_0

    .line 427
    :cond_0
    const/16 v0, 0xb

    invoke-virtual {p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object p1

    invoke-direct {p0, v0, p1}, Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;->sendMessageToOtherInstr(ILandroid/os/Bundle;)V

    .line 428
    goto/16 :goto_0

    .line 407
    :pswitch_3
    const-string v0, "InstrConnection"

    const-string v1, "handleMessage(MSG_UN_REG_CLIENT)"

    new-array v2, v4, [Ljava/lang/Object;

    invoke-static {v0, v1, v2}, Landroid/support/test/internal/util/LogUtil;->logDebugWithProcess(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 410
    nop

    .line 411
    invoke-virtual {p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "instr_client_type"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 412
    invoke-virtual {p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v1

    const-string v2, "instr_client_msgr"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Landroid/os/Messenger;

    .line 410
    invoke-direct {p0, v0, v1}, Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;->unregisterClient(Ljava/lang/String;Landroid/os/Messenger;)V

    .line 413
    invoke-virtual {p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object p1

    invoke-direct {p0, v3, p1}, Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;->sendMessageToOtherInstr(ILandroid/os/Bundle;)V

    .line 414
    goto/16 :goto_0

    .line 392
    :pswitch_4
    const-string v0, "InstrConnection"

    const-string v1, "handleMessage(MSG_REG_CLIENT)"

    new-array v2, v4, [Ljava/lang/Object;

    invoke-static {v0, v1, v2}, Landroid/support/test/internal/util/LogUtil;->logDebugWithProcess(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 395
    nop

    .line 396
    invoke-virtual {p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "instr_client_type"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 397
    invoke-virtual {p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v1

    const-string v2, "instr_client_msgr"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Landroid/os/Messenger;

    .line 395
    invoke-direct {p0, v0, v1}, Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;->registerClient(Ljava/lang/String;Landroid/os/Messenger;)V

    .line 398
    invoke-virtual {p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object p1

    invoke-direct {p0, v4, p1}, Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;->sendMessageToOtherInstr(ILandroid/os/Bundle;)V

    .line 399
    goto/16 :goto_0

    .line 386
    :pswitch_5
    const-string v0, "InstrConnection"

    const-string v1, "handleMessage(MSG_REMOVE_CLIENTS_IN_BUNDLE)"

    new-array v2, v4, [Ljava/lang/Object;

    invoke-static {v0, v1, v2}, Landroid/support/test/internal/util/LogUtil;->logDebugWithProcess(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 389
    invoke-virtual {p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object p1

    invoke-direct {p0, p1, v4}, Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;->clientsRegistrationFromBundle(Landroid/os/Bundle;Z)V

    .line 390
    goto/16 :goto_0

    .line 379
    :pswitch_6
    const-string v0, "InstrConnection"

    const-string v1, "handleMessage(MSG_ADD_CLIENTS_IN_BUNDLE)"

    new-array v2, v4, [Ljava/lang/Object;

    invoke-static {v0, v1, v2}, Landroid/support/test/internal/util/LogUtil;->logDebugWithProcess(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 383
    invoke-virtual {p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object p1

    invoke-direct {p0, p1, v3}, Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;->clientsRegistrationFromBundle(Landroid/os/Bundle;Z)V

    .line 384
    goto/16 :goto_0

    .line 371
    :pswitch_7
    const-string v0, "InstrConnection"

    const-string v1, "handleMessage(MSG_REMOVE_INSTRUMENTATION)"

    new-array v2, v4, [Ljava/lang/Object;

    invoke-static {v0, v1, v2}, Landroid/support/test/internal/util/LogUtil;->logDebugWithProcess(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 374
    iget-object v0, p0, Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;->mOtherInstrumentations:Ljava/util/Set;

    iget-object p1, p1, Landroid/os/Message;->replyTo:Landroid/os/Messenger;

    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_4

    .line 375
    const-string p1, "InstrConnection"

    const-string v0, "Attempting to remove a non-existent binder!"

    invoke-static {p1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 354
    :pswitch_8
    const-string v0, "InstrConnection"

    const-string v2, "handleMessage(MSG_ADD_INSTRUMENTATION)"

    new-array v4, v4, [Ljava/lang/Object;

    invoke-static {v0, v2, v4}, Landroid/support/test/internal/util/LogUtil;->logDebugWithProcess(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 359
    iget-object v0, p0, Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;->mOtherInstrumentations:Ljava/util/Set;

    iget-object v2, p1, Landroid/os/Message;->replyTo:Landroid/os/Messenger;

    invoke-interface {v0, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 361
    iget-object v0, p0, Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;->mTypedClients:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    .line 362
    iget-object v0, p1, Landroid/os/Message;->replyTo:Landroid/os/Messenger;

    const/4 v2, 0x6

    invoke-direct {p0, v0, v2, v1}, Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;->sendMessageWithReply(Landroid/os/Messenger;ILandroid/os/Bundle;)V

    .line 365
    :cond_1
    invoke-virtual {p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object p1

    invoke-direct {p0, p1, v3}, Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;->clientsRegistrationFromBundle(Landroid/os/Bundle;Z)V

    goto/16 :goto_0

    .line 367
    :cond_2
    const-string p1, "InstrConnection"

    const-string v0, "Message with existing binder was received, ignoring it.."

    invoke-static {p1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 369
    goto :goto_0

    .line 343
    :pswitch_9
    const-string v0, "InstrConnection"

    const-string v2, "handleMessage(MSG_HANDLE_INSTRUMENTATION_FROM_BROADCAST)"

    new-array v3, v4, [Ljava/lang/Object;

    invoke-static {v0, v2, v3}, Landroid/support/test/internal/util/LogUtil;->logDebugWithProcess(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 347
    iget-object v0, p0, Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;->mOtherInstrumentations:Ljava/util/Set;

    iget-object v2, p1, Landroid/os/Message;->replyTo:Landroid/os/Messenger;

    invoke-interface {v0, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 348
    iget-object p1, p1, Landroid/os/Message;->replyTo:Landroid/os/Messenger;

    const/4 v0, 0x4

    invoke-direct {p0, p1, v0, v1}, Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;->sendMessageWithReply(Landroid/os/Messenger;ILandroid/os/Bundle;)V

    goto :goto_0

    .line 350
    :cond_3
    const-string p1, "InstrConnection"

    const-string v0, "Broadcast with existing binder was received, ignoring it.."

    invoke-static {p1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 352
    goto :goto_0

    .line 339
    :pswitch_a
    const-string p1, "InstrConnection"

    const-string v0, "handleMessage(MSG_TERMINATE)"

    new-array v1, v4, [Ljava/lang/Object;

    invoke-static {p1, v0, v1}, Landroid/support/test/internal/util/LogUtil;->logDebugWithProcess(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 340
    invoke-direct {p0}, Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;->doDie()V

    .line 341
    goto :goto_0

    .line 416
    :pswitch_b
    const-string v0, "InstrConnection"

    const-string v1, "handleMessage(MSG_REMOTE_REMOVE_CLIENT)"

    new-array v2, v4, [Ljava/lang/Object;

    invoke-static {v0, v1, v2}, Landroid/support/test/internal/util/LogUtil;->logDebugWithProcess(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 417
    invoke-virtual {p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "instr_client_type"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iget-object p1, p1, Landroid/os/Message;->replyTo:Landroid/os/Messenger;

    invoke-direct {p0, v0, p1}, Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;->unregisterClient(Ljava/lang/String;Landroid/os/Messenger;)V

    .line 418
    goto :goto_0

    .line 401
    :pswitch_c
    const-string v0, "InstrConnection"

    const-string v1, "handleMessage(MSG_REMOTE_ADD_CLIENT)"

    new-array v2, v4, [Ljava/lang/Object;

    invoke-static {v0, v1, v2}, Landroid/support/test/internal/util/LogUtil;->logDebugWithProcess(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 402
    nop

    .line 403
    invoke-virtual {p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "instr_client_type"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 404
    invoke-virtual {p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object p1

    const-string v1, "instr_client_msgr"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p1

    check-cast p1, Landroid/os/Messenger;

    .line 402
    invoke-direct {p0, v0, p1}, Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;->registerClient(Ljava/lang/String;Landroid/os/Messenger;)V

    .line 405
    nop

    .line 442
    :cond_4
    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
