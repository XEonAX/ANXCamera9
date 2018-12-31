.class public Landroid/support/test/runner/MonitoringInstrumentation;
.super Landroid/support/test/internal/runner/hidden/ExposedInstrumentationApi;
.source "MonitoringInstrumentation.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/test/runner/MonitoringInstrumentation$ActivityFinisher;,
        Landroid/support/test/runner/MonitoringInstrumentation$StubResultCallable;
    }
.end annotation


# static fields
.field private static final MILLIS_TO_POLL_FOR_ACTIVITY_STOP:J

.field private static final MILLIS_TO_WAIT_FOR_ACTIVITY_TO_STOP:J

.field private static final START_ACTIVITY_TIMEOUT_SECONDS:I = 0x2d

.field private static final TAG:Ljava/lang/String; = "MonitoringInstr"


# instance fields
.field private mAnActivityHasBeenLaunched:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private mApplicationMonitor:Landroid/support/test/internal/runner/lifecycle/ApplicationLifecycleMonitorImpl;

.field private mExecutorService:Ljava/util/concurrent/ExecutorService;

.field private volatile mFinished:Z

.field private mHandlerForMainLooper:Landroid/os/Handler;

.field private mIdleHandler:Landroid/os/MessageQueue$IdleHandler;

.field private mIntentMonitor:Landroid/support/test/internal/runner/intent/IntentMonitorImpl;

.field private volatile mInterceptingActivityFactory:Landroid/support/test/runner/intercepting/InterceptingActivityFactory;

.field private mIsDexmakerClassLoaderInitialized:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private mIsJsBridgeLoaded:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private mJsBridgeClassName:Ljava/lang/String;

.field private mLastIdleTime:Ljava/util/concurrent/atomic/AtomicLong;

.field private mLifecycleMonitor:Landroid/support/test/internal/runner/lifecycle/ActivityLifecycleMonitorImpl;

.field private mStartedActivityCounter:Ljava/util/concurrent/atomic/AtomicInteger;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 100
    sget-object v0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v1, 0x2

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v0

    sput-wide v0, Landroid/support/test/runner/MonitoringInstrumentation;->MILLIS_TO_WAIT_FOR_ACTIVITY_TO_STOP:J

    .line 101
    sget-wide v0, Landroid/support/test/runner/MonitoringInstrumentation;->MILLIS_TO_WAIT_FOR_ACTIVITY_TO_STOP:J

    const-wide/16 v2, 0x28

    div-long/2addr v0, v2

    sput-wide v0, Landroid/support/test/runner/MonitoringInstrumentation;->MILLIS_TO_POLL_FOR_ACTIVITY_STOP:J

    return-void
.end method

.method public constructor <init>()V
    .locals 4

    .line 96
    invoke-direct {p0}, Landroid/support/test/internal/runner/hidden/ExposedInstrumentationApi;-><init>()V

    .line 104
    new-instance v0, Landroid/support/test/internal/runner/lifecycle/ActivityLifecycleMonitorImpl;

    invoke-direct {v0}, Landroid/support/test/internal/runner/lifecycle/ActivityLifecycleMonitorImpl;-><init>()V

    iput-object v0, p0, Landroid/support/test/runner/MonitoringInstrumentation;->mLifecycleMonitor:Landroid/support/test/internal/runner/lifecycle/ActivityLifecycleMonitorImpl;

    .line 105
    new-instance v0, Landroid/support/test/internal/runner/lifecycle/ApplicationLifecycleMonitorImpl;

    invoke-direct {v0}, Landroid/support/test/internal/runner/lifecycle/ApplicationLifecycleMonitorImpl;-><init>()V

    iput-object v0, p0, Landroid/support/test/runner/MonitoringInstrumentation;->mApplicationMonitor:Landroid/support/test/internal/runner/lifecycle/ApplicationLifecycleMonitorImpl;

    .line 107
    new-instance v0, Landroid/support/test/internal/runner/intent/IntentMonitorImpl;

    invoke-direct {v0}, Landroid/support/test/internal/runner/intent/IntentMonitorImpl;-><init>()V

    iput-object v0, p0, Landroid/support/test/runner/MonitoringInstrumentation;->mIntentMonitor:Landroid/support/test/internal/runner/intent/IntentMonitorImpl;

    .line 110
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Landroid/support/test/runner/MonitoringInstrumentation;->mAnActivityHasBeenLaunched:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 111
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    const-wide/16 v2, 0x0

    invoke-direct {v0, v2, v3}, Ljava/util/concurrent/atomic/AtomicLong;-><init>(J)V

    iput-object v0, p0, Landroid/support/test/runner/MonitoringInstrumentation;->mLastIdleTime:Ljava/util/concurrent/atomic/AtomicLong;

    .line 112
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v0, p0, Landroid/support/test/runner/MonitoringInstrumentation;->mStartedActivityCounter:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 114
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Landroid/support/test/runner/MonitoringInstrumentation;->mIsJsBridgeLoaded:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 116
    new-instance v0, Ljava/lang/ThreadLocal;

    invoke-direct {v0}, Ljava/lang/ThreadLocal;-><init>()V

    iput-object v0, p0, Landroid/support/test/runner/MonitoringInstrumentation;->mIsDexmakerClassLoaderInitialized:Ljava/lang/ThreadLocal;

    .line 118
    new-instance v0, Landroid/support/test/runner/MonitoringInstrumentation$1;

    invoke-direct {v0, p0}, Landroid/support/test/runner/MonitoringInstrumentation$1;-><init>(Landroid/support/test/runner/MonitoringInstrumentation;)V

    iput-object v0, p0, Landroid/support/test/runner/MonitoringInstrumentation;->mIdleHandler:Landroid/os/MessageQueue$IdleHandler;

    .line 127
    iput-boolean v1, p0, Landroid/support/test/runner/MonitoringInstrumentation;->mFinished:Z

    return-void
.end method

.method static synthetic access$000(Landroid/support/test/runner/MonitoringInstrumentation;)Ljava/util/concurrent/atomic/AtomicLong;
    .locals 0

    .line 96
    iget-object p0, p0, Landroid/support/test/runner/MonitoringInstrumentation;->mLastIdleTime:Ljava/util/concurrent/atomic/AtomicLong;

    return-object p0
.end method

.method static synthetic access$101(Landroid/support/test/runner/MonitoringInstrumentation;Landroid/content/Intent;)Landroid/app/Activity;
    .locals 0

    .line 96
    invoke-super {p0, p1}, Landroid/support/test/internal/runner/hidden/ExposedInstrumentationApi;->startActivitySync(Landroid/content/Intent;)Landroid/app/Activity;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$200(Landroid/support/test/runner/MonitoringInstrumentation;)Ljava/util/concurrent/atomic/AtomicBoolean;
    .locals 0

    .line 96
    iget-object p0, p0, Landroid/support/test/runner/MonitoringInstrumentation;->mIsJsBridgeLoaded:Ljava/util/concurrent/atomic/AtomicBoolean;

    return-object p0
.end method

.method static synthetic access$300(Landroid/support/test/runner/MonitoringInstrumentation;)Landroid/support/test/internal/runner/lifecycle/ActivityLifecycleMonitorImpl;
    .locals 0

    .line 96
    iget-object p0, p0, Landroid/support/test/runner/MonitoringInstrumentation;->mLifecycleMonitor:Landroid/support/test/internal/runner/lifecycle/ActivityLifecycleMonitorImpl;

    return-object p0
.end method

.method private logUncaughtExceptions()V
    .locals 3

    .line 255
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->getUncaughtExceptionHandler()Ljava/lang/Thread$UncaughtExceptionHandler;

    move-result-object v0

    .line 256
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    new-instance v2, Landroid/support/test/runner/MonitoringInstrumentation$3;

    invoke-direct {v2, p0, v0}, Landroid/support/test/runner/MonitoringInstrumentation$3;-><init>(Landroid/support/test/runner/MonitoringInstrumentation;Ljava/lang/Thread$UncaughtExceptionHandler;)V

    .line 257
    invoke-virtual {v1, v2}, Ljava/lang/Thread;->setUncaughtExceptionHandler(Ljava/lang/Thread$UncaughtExceptionHandler;)V

    .line 284
    return-void
.end method

.method private setupDexmakerClassloader()V
    .locals 7

    .line 233
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    iget-object v1, p0, Landroid/support/test/runner/MonitoringInstrumentation;->mIsDexmakerClassLoaderInitialized:Ljava/lang/ThreadLocal;

    invoke-virtual {v1}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 236
    return-void

    .line 239
    :cond_0
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->getContextClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    .line 242
    invoke-virtual {p0}, Landroid/support/test/runner/MonitoringInstrumentation;->getTargetContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    .line 244
    const-string v2, "MonitoringInstr"

    const-string v3, "Setting context classloader to \'%s\', Original: \'%s\'"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    .line 248
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x1

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    aput-object v0, v4, v5

    .line 246
    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 244
    invoke-static {v2, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 249
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setContextClassLoader(Ljava/lang/ClassLoader;)V

    .line 250
    iget-object v0, p0, Landroid/support/test/runner/MonitoringInstrumentation;->mIsDexmakerClassLoaderInitialized:Ljava/lang/ThreadLocal;

    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 251
    return-void
.end method

.method private stubResultFor(Landroid/content/Intent;)Landroid/app/Instrumentation$ActivityResult;
    .locals 4

    .line 594
    invoke-static {}, Landroid/support/test/runner/intent/IntentStubberRegistry;->isLoaded()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 597
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    if-eq v0, v1, :cond_0

    .line 598
    new-instance v0, Ljava/util/concurrent/FutureTask;

    new-instance v1, Landroid/support/test/runner/MonitoringInstrumentation$StubResultCallable;

    invoke-direct {v1, p1}, Landroid/support/test/runner/MonitoringInstrumentation$StubResultCallable;-><init>(Landroid/content/Intent;)V

    invoke-direct {v0, v1}, Ljava/util/concurrent/FutureTask;-><init>(Ljava/util/concurrent/Callable;)V

    .line 600
    invoke-virtual {p0, v0}, Landroid/support/test/runner/MonitoringInstrumentation;->runOnMainSync(Ljava/lang/Runnable;)V

    .line 602
    :try_start_0
    invoke-virtual {v0}, Ljava/util/concurrent/FutureTask;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Instrumentation$ActivityResult;
    :try_end_0
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 606
    :catch_0
    move-exception p1

    .line 607
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V

    .line 608
    new-instance v0, Ljava/lang/RuntimeException;

    invoke-direct {v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v0

    .line 603
    :catch_1
    move-exception v0

    .line 604
    new-instance v1, Ljava/lang/RuntimeException;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    .line 605
    const-string p1, "Could not retrieve stub result for intent %s"

    invoke-static {p1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v1, p1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 611
    :cond_0
    invoke-static {}, Landroid/support/test/runner/intent/IntentStubberRegistry;->getInstance()Landroid/support/test/runner/intent/IntentStubber;

    move-result-object v0

    invoke-interface {v0, p1}, Landroid/support/test/runner/intent/IntentStubber;->getActivityResultForIntent(Landroid/content/Intent;)Landroid/app/Instrumentation$ActivityResult;

    move-result-object p1

    return-object p1

    .line 614
    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method

.method private tryLoadingJsBridge(Ljava/lang/String;)V
    .locals 1

    .line 785
    if-eqz p1, :cond_0

    .line 788
    new-instance v0, Landroid/support/test/runner/MonitoringInstrumentation$5;

    invoke-direct {v0, p0, p1}, Landroid/support/test/runner/MonitoringInstrumentation$5;-><init>(Landroid/support/test/runner/MonitoringInstrumentation;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Landroid/support/test/runner/MonitoringInstrumentation;->runOnMainSync(Ljava/lang/Runnable;)V

    .line 805
    return-void

    .line 786
    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    const-string v0, "JsBridge class name cannot be null!"

    invoke-direct {p1, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public callActivityOnCreate(Landroid/app/Activity;Landroid/os/Bundle;)V
    .locals 2

    .line 666
    iget-object v0, p0, Landroid/support/test/runner/MonitoringInstrumentation;->mLifecycleMonitor:Landroid/support/test/internal/runner/lifecycle/ActivityLifecycleMonitorImpl;

    sget-object v1, Landroid/support/test/runner/lifecycle/Stage;->PRE_ON_CREATE:Landroid/support/test/runner/lifecycle/Stage;

    invoke-virtual {v0, v1, p1}, Landroid/support/test/internal/runner/lifecycle/ActivityLifecycleMonitorImpl;->signalLifecycleChange(Landroid/support/test/runner/lifecycle/Stage;Landroid/app/Activity;)V

    .line 667
    invoke-super {p0, p1, p2}, Landroid/support/test/internal/runner/hidden/ExposedInstrumentationApi;->callActivityOnCreate(Landroid/app/Activity;Landroid/os/Bundle;)V

    .line 668
    iget-object p2, p0, Landroid/support/test/runner/MonitoringInstrumentation;->mLifecycleMonitor:Landroid/support/test/internal/runner/lifecycle/ActivityLifecycleMonitorImpl;

    sget-object v0, Landroid/support/test/runner/lifecycle/Stage;->CREATED:Landroid/support/test/runner/lifecycle/Stage;

    invoke-virtual {p2, v0, p1}, Landroid/support/test/internal/runner/lifecycle/ActivityLifecycleMonitorImpl;->signalLifecycleChange(Landroid/support/test/runner/lifecycle/Stage;Landroid/app/Activity;)V

    .line 669
    return-void
.end method

.method public callActivityOnDestroy(Landroid/app/Activity;)V
    .locals 2

    .line 654
    invoke-super {p0, p1}, Landroid/support/test/internal/runner/hidden/ExposedInstrumentationApi;->callActivityOnDestroy(Landroid/app/Activity;)V

    .line 655
    iget-object v0, p0, Landroid/support/test/runner/MonitoringInstrumentation;->mLifecycleMonitor:Landroid/support/test/internal/runner/lifecycle/ActivityLifecycleMonitorImpl;

    sget-object v1, Landroid/support/test/runner/lifecycle/Stage;->DESTROYED:Landroid/support/test/runner/lifecycle/Stage;

    invoke-virtual {v0, v1, p1}, Landroid/support/test/internal/runner/lifecycle/ActivityLifecycleMonitorImpl;->signalLifecycleChange(Landroid/support/test/runner/lifecycle/Stage;Landroid/app/Activity;)V

    .line 656
    return-void
.end method

.method public callActivityOnPause(Landroid/app/Activity;)V
    .locals 2

    .line 705
    invoke-super {p0, p1}, Landroid/support/test/internal/runner/hidden/ExposedInstrumentationApi;->callActivityOnPause(Landroid/app/Activity;)V

    .line 706
    iget-object v0, p0, Landroid/support/test/runner/MonitoringInstrumentation;->mLifecycleMonitor:Landroid/support/test/internal/runner/lifecycle/ActivityLifecycleMonitorImpl;

    sget-object v1, Landroid/support/test/runner/lifecycle/Stage;->PAUSED:Landroid/support/test/runner/lifecycle/Stage;

    invoke-virtual {v0, v1, p1}, Landroid/support/test/internal/runner/lifecycle/ActivityLifecycleMonitorImpl;->signalLifecycleChange(Landroid/support/test/runner/lifecycle/Stage;Landroid/app/Activity;)V

    .line 707
    return-void
.end method

.method public callActivityOnRestart(Landroid/app/Activity;)V
    .locals 2

    .line 660
    invoke-super {p0, p1}, Landroid/support/test/internal/runner/hidden/ExposedInstrumentationApi;->callActivityOnRestart(Landroid/app/Activity;)V

    .line 661
    iget-object v0, p0, Landroid/support/test/runner/MonitoringInstrumentation;->mLifecycleMonitor:Landroid/support/test/internal/runner/lifecycle/ActivityLifecycleMonitorImpl;

    sget-object v1, Landroid/support/test/runner/lifecycle/Stage;->RESTARTED:Landroid/support/test/runner/lifecycle/Stage;

    invoke-virtual {v0, v1, p1}, Landroid/support/test/internal/runner/lifecycle/ActivityLifecycleMonitorImpl;->signalLifecycleChange(Landroid/support/test/runner/lifecycle/Stage;Landroid/app/Activity;)V

    .line 662
    return-void
.end method

.method public callActivityOnResume(Landroid/app/Activity;)V
    .locals 2

    .line 699
    invoke-super {p0, p1}, Landroid/support/test/internal/runner/hidden/ExposedInstrumentationApi;->callActivityOnResume(Landroid/app/Activity;)V

    .line 700
    iget-object v0, p0, Landroid/support/test/runner/MonitoringInstrumentation;->mLifecycleMonitor:Landroid/support/test/internal/runner/lifecycle/ActivityLifecycleMonitorImpl;

    sget-object v1, Landroid/support/test/runner/lifecycle/Stage;->RESUMED:Landroid/support/test/runner/lifecycle/Stage;

    invoke-virtual {v0, v1, p1}, Landroid/support/test/internal/runner/lifecycle/ActivityLifecycleMonitorImpl;->signalLifecycleChange(Landroid/support/test/runner/lifecycle/Stage;Landroid/app/Activity;)V

    .line 701
    return-void
.end method

.method public callActivityOnStart(Landroid/app/Activity;)V
    .locals 2

    .line 677
    iget-object v0, p0, Landroid/support/test/runner/MonitoringInstrumentation;->mStartedActivityCounter:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    .line 679
    :try_start_0
    invoke-super {p0, p1}, Landroid/support/test/internal/runner/hidden/ExposedInstrumentationApi;->callActivityOnStart(Landroid/app/Activity;)V

    .line 680
    iget-object v0, p0, Landroid/support/test/runner/MonitoringInstrumentation;->mLifecycleMonitor:Landroid/support/test/internal/runner/lifecycle/ActivityLifecycleMonitorImpl;

    sget-object v1, Landroid/support/test/runner/lifecycle/Stage;->STARTED:Landroid/support/test/runner/lifecycle/Stage;

    invoke-virtual {v0, v1, p1}, Landroid/support/test/internal/runner/lifecycle/ActivityLifecycleMonitorImpl;->signalLifecycleChange(Landroid/support/test/runner/lifecycle/Stage;Landroid/app/Activity;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 684
    nop

    .line 685
    return-void

    .line 681
    :catch_0
    move-exception p1

    .line 682
    iget-object v0, p0, Landroid/support/test/runner/MonitoringInstrumentation;->mStartedActivityCounter:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 683
    throw p1
.end method

.method public callActivityOnStop(Landroid/app/Activity;)V
    .locals 2

    .line 690
    :try_start_0
    invoke-super {p0, p1}, Landroid/support/test/internal/runner/hidden/ExposedInstrumentationApi;->callActivityOnStop(Landroid/app/Activity;)V

    .line 691
    iget-object v0, p0, Landroid/support/test/runner/MonitoringInstrumentation;->mLifecycleMonitor:Landroid/support/test/internal/runner/lifecycle/ActivityLifecycleMonitorImpl;

    sget-object v1, Landroid/support/test/runner/lifecycle/Stage;->STOPPED:Landroid/support/test/runner/lifecycle/Stage;

    invoke-virtual {v0, v1, p1}, Landroid/support/test/internal/runner/lifecycle/ActivityLifecycleMonitorImpl;->signalLifecycleChange(Landroid/support/test/runner/lifecycle/Stage;Landroid/app/Activity;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 693
    iget-object p1, p0, Landroid/support/test/runner/MonitoringInstrumentation;->mStartedActivityCounter:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 694
    nop

    .line 695
    return-void

    .line 693
    :catchall_0
    move-exception p1

    iget-object v0, p0, Landroid/support/test/runner/MonitoringInstrumentation;->mStartedActivityCounter:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    throw p1
.end method

.method public callApplicationOnCreate(Landroid/app/Application;)V
    .locals 2

    .line 405
    iget-object v0, p0, Landroid/support/test/runner/MonitoringInstrumentation;->mApplicationMonitor:Landroid/support/test/internal/runner/lifecycle/ApplicationLifecycleMonitorImpl;

    sget-object v1, Landroid/support/test/runner/lifecycle/ApplicationStage;->PRE_ON_CREATE:Landroid/support/test/runner/lifecycle/ApplicationStage;

    invoke-virtual {v0, p1, v1}, Landroid/support/test/internal/runner/lifecycle/ApplicationLifecycleMonitorImpl;->signalLifecycleChange(Landroid/app/Application;Landroid/support/test/runner/lifecycle/ApplicationStage;)V

    .line 406
    invoke-super {p0, p1}, Landroid/support/test/internal/runner/hidden/ExposedInstrumentationApi;->callApplicationOnCreate(Landroid/app/Application;)V

    .line 407
    iget-object v0, p0, Landroid/support/test/runner/MonitoringInstrumentation;->mApplicationMonitor:Landroid/support/test/internal/runner/lifecycle/ApplicationLifecycleMonitorImpl;

    sget-object v1, Landroid/support/test/runner/lifecycle/ApplicationStage;->CREATED:Landroid/support/test/runner/lifecycle/ApplicationStage;

    invoke-virtual {v0, p1, v1}, Landroid/support/test/internal/runner/lifecycle/ApplicationLifecycleMonitorImpl;->signalLifecycleChange(Landroid/app/Application;Landroid/support/test/runner/lifecycle/ApplicationStage;)V

    .line 408
    return-void
.end method

.method protected dumpThreadStateToOutputs(Ljava/lang/String;)V
    .locals 1

    .line 631
    invoke-virtual {p0}, Landroid/support/test/runner/MonitoringInstrumentation;->getThreadState()Ljava/lang/String;

    move-result-object p1

    .line 632
    const-string v0, "THREAD_STATE"

    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 633
    return-void
.end method

.method public execStartActivities(Landroid/content/Context;Landroid/os/IBinder;Landroid/os/IBinder;Landroid/app/Activity;[Landroid/content/Intent;Landroid/os/Bundle;)V
    .locals 11

    move-object/from16 v0, p5

    .line 550
    const-string v1, "MonitoringInstr"

    const-string v2, "execStartActivities(context, ibinder, ibinder, activity, intent[], bundle)"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 554
    nop

    .line 555
    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v8, v0, v2

    .line 556
    const/4 v9, -0x1

    move-object v3, p0

    move-object v4, p1

    move-object v5, p2

    move-object v6, p3

    move-object v7, p4

    move-object/from16 v10, p6

    invoke-virtual/range {v3 .. v10}, Landroid/support/test/runner/MonitoringInstrumentation;->execStartActivity(Landroid/content/Context;Landroid/os/IBinder;Landroid/os/IBinder;Landroid/app/Activity;Landroid/content/Intent;ILandroid/os/Bundle;)Landroid/app/Instrumentation$ActivityResult;

    .line 555
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 558
    :cond_0
    return-void
.end method

.method public execStartActivity(Landroid/content/Context;Landroid/os/IBinder;Landroid/os/IBinder;Landroid/app/Activity;Landroid/content/Intent;I)Landroid/app/Instrumentation$ActivityResult;
    .locals 1

    .line 476
    iget-object v0, p0, Landroid/support/test/runner/MonitoringInstrumentation;->mIntentMonitor:Landroid/support/test/internal/runner/intent/IntentMonitorImpl;

    invoke-virtual {v0, p5}, Landroid/support/test/internal/runner/intent/IntentMonitorImpl;->signalIntent(Landroid/content/Intent;)V

    .line 477
    invoke-direct {p0, p5}, Landroid/support/test/runner/MonitoringInstrumentation;->stubResultFor(Landroid/content/Intent;)Landroid/app/Instrumentation$ActivityResult;

    move-result-object v0

    .line 478
    if-eqz v0, :cond_0

    .line 479
    const-string p1, "MonitoringInstr"

    const-string p2, "Stubbing intent %s"

    const/4 p3, 0x1

    new-array p3, p3, [Ljava/lang/Object;

    const/4 p4, 0x0

    aput-object p5, p3, p4

    invoke-static {p2, p3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 480
    return-object v0

    .line 482
    :cond_0
    invoke-super/range {p0 .. p6}, Landroid/support/test/internal/runner/hidden/ExposedInstrumentationApi;->execStartActivity(Landroid/content/Context;Landroid/os/IBinder;Landroid/os/IBinder;Landroid/app/Activity;Landroid/content/Intent;I)Landroid/app/Instrumentation$ActivityResult;

    move-result-object p1

    return-object p1
.end method

.method public execStartActivity(Landroid/content/Context;Landroid/os/IBinder;Landroid/os/IBinder;Landroid/app/Activity;Landroid/content/Intent;ILandroid/os/Bundle;)Landroid/app/Instrumentation$ActivityResult;
    .locals 1

    .line 495
    iget-object v0, p0, Landroid/support/test/runner/MonitoringInstrumentation;->mIntentMonitor:Landroid/support/test/internal/runner/intent/IntentMonitorImpl;

    invoke-virtual {v0, p5}, Landroid/support/test/internal/runner/intent/IntentMonitorImpl;->signalIntent(Landroid/content/Intent;)V

    .line 496
    invoke-direct {p0, p5}, Landroid/support/test/runner/MonitoringInstrumentation;->stubResultFor(Landroid/content/Intent;)Landroid/app/Instrumentation$ActivityResult;

    move-result-object v0

    .line 497
    if-eqz v0, :cond_0

    .line 498
    const-string p1, "MonitoringInstr"

    const-string p2, "Stubbing intent %s"

    const/4 p3, 0x1

    new-array p3, p3, [Ljava/lang/Object;

    const/4 p4, 0x0

    aput-object p5, p3, p4

    invoke-static {p2, p3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 499
    return-object v0

    .line 501
    :cond_0
    invoke-super/range {p0 .. p7}, Landroid/support/test/internal/runner/hidden/ExposedInstrumentationApi;->execStartActivity(Landroid/content/Context;Landroid/os/IBinder;Landroid/os/IBinder;Landroid/app/Activity;Landroid/content/Intent;ILandroid/os/Bundle;)Landroid/app/Instrumentation$ActivityResult;

    move-result-object p1

    return-object p1
.end method

.method public execStartActivity(Landroid/content/Context;Landroid/os/IBinder;Landroid/os/IBinder;Landroid/app/Activity;Landroid/content/Intent;ILandroid/os/Bundle;Landroid/os/UserHandle;)Landroid/app/Instrumentation$ActivityResult;
    .locals 0

    .line 534
    invoke-super/range {p0 .. p8}, Landroid/support/test/internal/runner/hidden/ExposedInstrumentationApi;->execStartActivity(Landroid/content/Context;Landroid/os/IBinder;Landroid/os/IBinder;Landroid/app/Activity;Landroid/content/Intent;ILandroid/os/Bundle;Landroid/os/UserHandle;)Landroid/app/Instrumentation$ActivityResult;

    move-result-object p1

    return-object p1
.end method

.method public execStartActivity(Landroid/content/Context;Landroid/os/IBinder;Landroid/os/IBinder;Landroid/app/Fragment;Landroid/content/Intent;ILandroid/os/Bundle;)Landroid/app/Instrumentation$ActivityResult;
    .locals 2

    .line 570
    const-string v0, "MonitoringInstr"

    const-string v1, "execStartActivity(context, IBinder, IBinder, Fragment, Intent, int, Bundle)"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 571
    iget-object v0, p0, Landroid/support/test/runner/MonitoringInstrumentation;->mIntentMonitor:Landroid/support/test/internal/runner/intent/IntentMonitorImpl;

    invoke-virtual {v0, p5}, Landroid/support/test/internal/runner/intent/IntentMonitorImpl;->signalIntent(Landroid/content/Intent;)V

    .line 572
    invoke-direct {p0, p5}, Landroid/support/test/runner/MonitoringInstrumentation;->stubResultFor(Landroid/content/Intent;)Landroid/app/Instrumentation$ActivityResult;

    move-result-object v0

    .line 573
    if-eqz v0, :cond_0

    .line 574
    const-string p1, "MonitoringInstr"

    const-string p2, "Stubbing intent %s"

    const/4 p3, 0x1

    new-array p3, p3, [Ljava/lang/Object;

    const/4 p4, 0x0

    aput-object p5, p3, p4

    invoke-static {p2, p3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 575
    return-object v0

    .line 577
    :cond_0
    invoke-super/range {p0 .. p7}, Landroid/support/test/internal/runner/hidden/ExposedInstrumentationApi;->execStartActivity(Landroid/content/Context;Landroid/os/IBinder;Landroid/os/IBinder;Landroid/app/Fragment;Landroid/content/Intent;ILandroid/os/Bundle;)Landroid/app/Instrumentation$ActivityResult;

    move-result-object p1

    return-object p1
.end method

.method public execStartActivity(Landroid/content/Context;Landroid/os/IBinder;Landroid/os/IBinder;Ljava/lang/String;Landroid/content/Intent;ILandroid/os/Bundle;)Landroid/app/Instrumentation$ActivityResult;
    .locals 1

    .line 514
    iget-object v0, p0, Landroid/support/test/runner/MonitoringInstrumentation;->mIntentMonitor:Landroid/support/test/internal/runner/intent/IntentMonitorImpl;

    invoke-virtual {v0, p5}, Landroid/support/test/internal/runner/intent/IntentMonitorImpl;->signalIntent(Landroid/content/Intent;)V

    .line 515
    invoke-direct {p0, p5}, Landroid/support/test/runner/MonitoringInstrumentation;->stubResultFor(Landroid/content/Intent;)Landroid/app/Instrumentation$ActivityResult;

    move-result-object v0

    .line 516
    if-eqz v0, :cond_0

    .line 517
    const-string p1, "MonitoringInstr"

    const-string p2, "Stubbing intent %s"

    const/4 p3, 0x1

    new-array p3, p3, [Ljava/lang/Object;

    const/4 p4, 0x0

    aput-object p5, p3, p4

    invoke-static {p2, p3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 518
    return-object v0

    .line 520
    :cond_0
    invoke-super/range {p0 .. p7}, Landroid/support/test/internal/runner/hidden/ExposedInstrumentationApi;->execStartActivity(Landroid/content/Context;Landroid/os/IBinder;Landroid/os/IBinder;Ljava/lang/String;Landroid/content/Intent;ILandroid/os/Bundle;)Landroid/app/Instrumentation$ActivityResult;

    move-result-object p1

    return-object p1
.end method

.method public finish(ILandroid/os/Bundle;)V
    .locals 8

    .line 337
    iget-boolean v0, p0, Landroid/support/test/runner/MonitoringInstrumentation;->mFinished:Z

    if-eqz v0, :cond_0

    .line 338
    const-string p1, "MonitoringInstr"

    const-string p2, "finish called 2x!"

    invoke-static {p1, p2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 339
    return-void

    .line 341
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/test/runner/MonitoringInstrumentation;->mFinished:Z

    .line 344
    iget-object v1, p0, Landroid/support/test/runner/MonitoringInstrumentation;->mHandlerForMainLooper:Landroid/os/Handler;

    new-instance v2, Landroid/support/test/runner/MonitoringInstrumentation$ActivityFinisher;

    invoke-direct {v2, p0}, Landroid/support/test/runner/MonitoringInstrumentation$ActivityFinisher;-><init>(Landroid/support/test/runner/MonitoringInstrumentation;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 346
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    .line 347
    invoke-virtual {p0}, Landroid/support/test/runner/MonitoringInstrumentation;->waitForActivitiesToComplete()V

    .line 348
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    .line 349
    const-string v5, "MonitoringInstr"

    const-string v6, "waitForActivitiesToComplete() took: %sms"

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v7, 0x0

    sub-long/2addr v3, v1

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    aput-object v1, v0, v7

    invoke-static {v6, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v5, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 350
    const/4 v0, 0x0

    invoke-static {v0}, Landroid/support/test/runner/lifecycle/ActivityLifecycleMonitorRegistry;->registerInstance(Landroid/support/test/runner/lifecycle/ActivityLifecycleMonitor;)V

    .line 351
    invoke-super {p0, p1, p2}, Landroid/support/test/internal/runner/hidden/ExposedInstrumentationApi;->finish(ILandroid/os/Bundle;)V

    .line 352
    return-void
.end method

.method protected getThreadState()Ljava/lang/String;
    .locals 8

    .line 636
    invoke-static {}, Ljava/lang/Thread;->getAllStackTraces()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    .line 637
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 638
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 639
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "  "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 640
    const-string v4, "\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 641
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Ljava/lang/StackTraceElement;

    array-length v4, v2

    const/4 v5, 0x0

    :goto_1
    if-ge v5, v4, :cond_0

    aget-object v6, v2, v5

    .line 642
    const-string v7, "    "

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 643
    invoke-virtual {v6}, Ljava/lang/StackTraceElement;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 644
    const-string v6, "\n"

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 641
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 646
    :cond_0
    const-string v2, "\n"

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 647
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 648
    goto :goto_0

    .line 649
    :cond_1
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected installMultidex()V
    .locals 7

    .line 178
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-ge v0, v1, :cond_0

    .line 180
    :try_start_0
    const-string v0, "android.support.multidex.MultiDex"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_4
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1

    .line 182
    :try_start_1
    const-string v1, "installInstrumentation"

    const/4 v2, 0x2

    new-array v3, v2, [Ljava/lang/Class;

    const-class v4, Landroid/content/Context;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    const-class v4, Landroid/content/Context;

    const/4 v6, 0x1

    aput-object v4, v3, v6

    .line 183
    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 184
    const/4 v3, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {p0}, Landroid/support/test/runner/MonitoringInstrumentation;->getContext()Landroid/content/Context;

    move-result-object v4

    aput-object v4, v2, v5

    invoke-virtual {p0}, Landroid/support/test/runner/MonitoringInstrumentation;->getTargetContext()Landroid/content/Context;

    move-result-object v4

    aput-object v4, v2, v6

    invoke-virtual {v1, v3, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/NoSuchMethodException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1 .. :try_end_1} :catch_4
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_1} :catch_1

    .line 187
    goto :goto_0

    .line 185
    :catch_0
    move-exception v1

    .line 186
    :try_start_2
    invoke-virtual {p0, v0}, Landroid/support/test/runner/MonitoringInstrumentation;->installOldMultiDex(Ljava/lang/Class;)V
    :try_end_2
    .catch Ljava/lang/ClassNotFoundException; {:try_start_2 .. :try_end_2} :catch_4
    .catch Ljava/lang/NoSuchMethodException; {:try_start_2 .. :try_end_2} :catch_3
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljava/lang/IllegalAccessException; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_0

    .line 194
    :catch_1
    move-exception v0

    .line 195
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "multidex is available at runtime, but calling it failed."

    invoke-direct {v1, v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 192
    :catch_2
    move-exception v0

    .line 193
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "multidex is available at runtime, but calling it failed."

    invoke-direct {v1, v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 190
    :catch_3
    move-exception v0

    .line 191
    const-string v1, "MonitoringInstr"

    const-string v2, "No multidex."

    invoke-static {v1, v2, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 188
    :catch_4
    move-exception v0

    .line 189
    const-string v0, "MonitoringInstr"

    const-string v1, "No multidex."

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 196
    :goto_0
    nop

    .line 198
    :cond_0
    return-void
.end method

.method protected installOldMultiDex(Ljava/lang/Class;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NoSuchMethodException;,
            Ljava/lang/reflect/InvocationTargetException;,
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .line 206
    const-string v0, "install"

    const/4 v1, 0x1

    new-array v2, v1, [Ljava/lang/Class;

    const-class v3, Landroid/content/Context;

    const/4 v4, 0x0

    aput-object v3, v2, v4

    invoke-virtual {p1, v0, v2}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p1

    .line 207
    new-array v0, v1, [Ljava/lang/Object;

    invoke-virtual {p0}, Landroid/support/test/runner/MonitoringInstrumentation;->getTargetContext()Landroid/content/Context;

    move-result-object v1

    aput-object v1, v0, v4

    const/4 v1, 0x0

    invoke-virtual {p1, v1, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 208
    return-void
.end method

.method public interceptActivityUsing(Landroid/support/test/runner/intercepting/InterceptingActivityFactory;)V
    .locals 0

    .line 767
    invoke-static {p1}, Landroid/support/test/internal/util/Checks;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 768
    iput-object p1, p0, Landroid/support/test/runner/MonitoringInstrumentation;->mInterceptingActivityFactory:Landroid/support/test/runner/intercepting/InterceptingActivityFactory;

    .line 769
    return-void
.end method

.method protected isPrimaryInstrProcess(Ljava/lang/String;)Z
    .locals 1
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .line 843
    invoke-virtual {p0}, Landroid/support/test/runner/MonitoringInstrumentation;->getTargetContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/support/test/internal/util/ProcessUtil;->getCurrentProcessName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .line 844
    if-eqz p1, :cond_0

    .line 845
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    return p1

    .line 847
    :cond_0
    invoke-virtual {p0}, Landroid/support/test/runner/MonitoringInstrumentation;->getTargetContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object p1

    iget-object p1, p1, Landroid/content/pm/ApplicationInfo;->processName:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public newActivity(Ljava/lang/Class;Landroid/content/Context;Landroid/os/IBinder;Landroid/app/Application;Landroid/content/Intent;Landroid/content/pm/ActivityInfo;Ljava/lang/CharSequence;Landroid/app/Activity;Ljava/lang/String;Ljava/lang/Object;)Landroid/app/Activity;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Landroid/content/Context;",
            "Landroid/os/IBinder;",
            "Landroid/app/Application;",
            "Landroid/content/Intent;",
            "Landroid/content/pm/ActivityInfo;",
            "Ljava/lang/CharSequence;",
            "Landroid/app/Activity;",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ")",
            "Landroid/app/Activity;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InstantiationException;,
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .line 727
    invoke-virtual {p1}, Ljava/lang/Class;->getPackage()Ljava/lang/Package;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Package;->getName()Ljava/lang/String;

    move-result-object v0

    .line 728
    invoke-virtual {p2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    .line 729
    invoke-virtual {p5}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v2

    .line 730
    invoke-virtual {v2}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 731
    invoke-virtual {v2}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 732
    new-instance v0, Landroid/content/ComponentName;

    .line 733
    invoke-virtual {v2}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 732
    invoke-virtual {p5, v0}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 736
    :cond_0
    invoke-super/range {p0 .. p10}, Landroid/support/test/internal/runner/hidden/ExposedInstrumentationApi;->newActivity(Ljava/lang/Class;Landroid/content/Context;Landroid/os/IBinder;Landroid/app/Application;Landroid/content/Intent;Landroid/content/pm/ActivityInfo;Ljava/lang/CharSequence;Landroid/app/Activity;Ljava/lang/String;Ljava/lang/Object;)Landroid/app/Activity;

    move-result-object p1

    return-object p1
.end method

.method public newActivity(Ljava/lang/ClassLoader;Ljava/lang/String;Landroid/content/Intent;)Landroid/app/Activity;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InstantiationException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .line 752
    iget-object v0, p0, Landroid/support/test/runner/MonitoringInstrumentation;->mInterceptingActivityFactory:Landroid/support/test/runner/intercepting/InterceptingActivityFactory;

    invoke-interface {v0, p1, p2, p3}, Landroid/support/test/runner/intercepting/InterceptingActivityFactory;->shouldIntercept(Ljava/lang/ClassLoader;Ljava/lang/String;Landroid/content/Intent;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 753
    iget-object v0, p0, Landroid/support/test/runner/MonitoringInstrumentation;->mInterceptingActivityFactory:Landroid/support/test/runner/intercepting/InterceptingActivityFactory;

    invoke-interface {v0, p1, p2, p3}, Landroid/support/test/runner/intercepting/InterceptingActivityFactory;->create(Ljava/lang/ClassLoader;Ljava/lang/String;Landroid/content/Intent;)Landroid/app/Activity;

    move-result-object p1

    goto :goto_0

    .line 754
    :cond_0
    invoke-super {p0, p1, p2, p3}, Landroid/support/test/internal/runner/hidden/ExposedInstrumentationApi;->newActivity(Ljava/lang/ClassLoader;Ljava/lang/String;Landroid/content/Intent;)Landroid/app/Activity;

    move-result-object p1

    .line 752
    :goto_0
    return-object p1
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 10

    .line 138
    invoke-virtual {p0}, Landroid/support/test/runner/MonitoringInstrumentation;->getTargetContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/support/test/internal/util/ProcessUtil;->getCurrentProcessName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .line 139
    const-string v1, "MonitoringInstr"

    const-string v2, "Instrumentation started on process "

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    if-eqz v3, :cond_0

    invoke-virtual {v2, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_0
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, v2}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    :goto_0
    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 140
    invoke-direct {p0}, Landroid/support/test/runner/MonitoringInstrumentation;->logUncaughtExceptions()V

    .line 142
    invoke-virtual {p0}, Landroid/support/test/runner/MonitoringInstrumentation;->installMultidex()V

    .line 144
    invoke-static {p0, p1}, Landroid/support/test/InstrumentationRegistry;->registerInstance(Landroid/app/Instrumentation;Landroid/os/Bundle;)V

    .line 145
    iget-object v0, p0, Landroid/support/test/runner/MonitoringInstrumentation;->mLifecycleMonitor:Landroid/support/test/internal/runner/lifecycle/ActivityLifecycleMonitorImpl;

    invoke-static {v0}, Landroid/support/test/runner/lifecycle/ActivityLifecycleMonitorRegistry;->registerInstance(Landroid/support/test/runner/lifecycle/ActivityLifecycleMonitor;)V

    .line 146
    iget-object v0, p0, Landroid/support/test/runner/MonitoringInstrumentation;->mApplicationMonitor:Landroid/support/test/internal/runner/lifecycle/ApplicationLifecycleMonitorImpl;

    invoke-static {v0}, Landroid/support/test/runner/lifecycle/ApplicationLifecycleMonitorRegistry;->registerInstance(Landroid/support/test/runner/lifecycle/ApplicationLifecycleMonitor;)V

    .line 147
    iget-object v0, p0, Landroid/support/test/runner/MonitoringInstrumentation;->mIntentMonitor:Landroid/support/test/internal/runner/intent/IntentMonitorImpl;

    invoke-static {v0}, Landroid/support/test/runner/intent/IntentMonitorRegistry;->registerInstance(Landroid/support/test/runner/intent/IntentMonitor;)V

    .line 149
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Landroid/support/test/runner/MonitoringInstrumentation;->mHandlerForMainLooper:Landroid/os/Handler;

    .line 150
    nop

    .line 151
    nop

    .line 152
    new-instance v0, Ljava/util/concurrent/ThreadPoolExecutor;

    const/4 v3, 0x0

    const v4, 0x7fffffff

    const-wide/16 v5, 0x0

    sget-object v7, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    new-instance v8, Ljava/util/concurrent/SynchronousQueue;

    invoke-direct {v8}, Ljava/util/concurrent/SynchronousQueue;-><init>()V

    new-instance v9, Landroid/support/test/runner/MonitoringInstrumentation$2;

    invoke-direct {v9, p0}, Landroid/support/test/runner/MonitoringInstrumentation$2;-><init>(Landroid/support/test/runner/MonitoringInstrumentation;)V

    move-object v2, v0

    invoke-direct/range {v2 .. v9}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/ThreadFactory;)V

    iput-object v0, p0, Landroid/support/test/runner/MonitoringInstrumentation;->mExecutorService:Ljava/util/concurrent/ExecutorService;

    .line 167
    invoke-static {}, Landroid/os/Looper;->myQueue()Landroid/os/MessageQueue;

    move-result-object v0

    iget-object v1, p0, Landroid/support/test/runner/MonitoringInstrumentation;->mIdleHandler:Landroid/os/MessageQueue$IdleHandler;

    invoke-virtual {v0, v1}, Landroid/os/MessageQueue;->addIdleHandler(Landroid/os/MessageQueue$IdleHandler;)V

    .line 168
    invoke-super {p0, p1}, Landroid/support/test/internal/runner/hidden/ExposedInstrumentationApi;->onCreate(Landroid/os/Bundle;)V

    .line 169
    invoke-virtual {p0}, Landroid/support/test/runner/MonitoringInstrumentation;->specifyDexMakerCacheProperty()V

    .line 170
    invoke-direct {p0}, Landroid/support/test/runner/MonitoringInstrumentation;->setupDexmakerClassloader()V

    .line 171
    invoke-virtual {p0}, Landroid/support/test/runner/MonitoringInstrumentation;->useDefaultInterceptingActivityFactory()V

    .line 172
    return-void
.end method

.method public onDestroy()V
    .locals 2

    .line 395
    const-string v0, "MonitoringInstr"

    const-string v1, "Instrumentation Finished!"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 396
    invoke-static {}, Landroid/os/Looper;->myQueue()Landroid/os/MessageQueue;

    move-result-object v0

    iget-object v1, p0, Landroid/support/test/runner/MonitoringInstrumentation;->mIdleHandler:Landroid/os/MessageQueue$IdleHandler;

    invoke-virtual {v0, v1}, Landroid/os/MessageQueue;->removeIdleHandler(Landroid/os/MessageQueue$IdleHandler;)V

    .line 398
    invoke-static {}, Landroid/support/test/internal/runner/InstrumentationConnection;->getInstance()Landroid/support/test/internal/runner/InstrumentationConnection;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/test/internal/runner/InstrumentationConnection;->terminate()V

    .line 400
    invoke-super {p0}, Landroid/support/test/internal/runner/hidden/ExposedInstrumentationApi;->onDestroy()V

    .line 401
    return-void
.end method

.method public onException(Ljava/lang/Object;Ljava/lang/Throwable;)Z
    .locals 3

    .line 619
    const-string v0, "Exception encountered by: %s. Dumping thread state to outputs and pining for the fjords."

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    .line 620
    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 624
    const-string v1, "MonitoringInstr"

    invoke-static {v1, v0, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 625
    const-string v0, "ThreadState-onException.txt"

    invoke-virtual {p0, v0}, Landroid/support/test/runner/MonitoringInstrumentation;->dumpThreadStateToOutputs(Ljava/lang/String;)V

    .line 626
    const-string v0, "MonitoringInstr"

    const-string v1, "Dying now..."

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 627
    invoke-super {p0, p1, p2}, Landroid/support/test/internal/runner/hidden/ExposedInstrumentationApi;->onException(Ljava/lang/Object;Ljava/lang/Throwable;)Z

    move-result p1

    return p1
.end method

.method public onStart()V
    .locals 2

    .line 295
    invoke-super {p0}, Landroid/support/test/internal/runner/hidden/ExposedInstrumentationApi;->onStart()V

    .line 297
    iget-object v0, p0, Landroid/support/test/runner/MonitoringInstrumentation;->mJsBridgeClassName:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 298
    iget-object v0, p0, Landroid/support/test/runner/MonitoringInstrumentation;->mJsBridgeClassName:Ljava/lang/String;

    invoke-direct {p0, v0}, Landroid/support/test/runner/MonitoringInstrumentation;->tryLoadingJsBridge(Ljava/lang/String;)V

    .line 317
    :cond_0
    invoke-virtual {p0}, Landroid/support/test/runner/MonitoringInstrumentation;->waitForIdleSync()V

    .line 322
    invoke-direct {p0}, Landroid/support/test/runner/MonitoringInstrumentation;->setupDexmakerClassloader()V

    .line 324
    invoke-static {}, Landroid/support/test/internal/runner/InstrumentationConnection;->getInstance()Landroid/support/test/internal/runner/InstrumentationConnection;

    move-result-object v0

    new-instance v1, Landroid/support/test/runner/MonitoringInstrumentation$ActivityFinisher;

    invoke-direct {v1, p0}, Landroid/support/test/runner/MonitoringInstrumentation$ActivityFinisher;-><init>(Landroid/support/test/runner/MonitoringInstrumentation;)V

    invoke-virtual {v0, p0, v1}, Landroid/support/test/internal/runner/InstrumentationConnection;->init(Landroid/app/Instrumentation;Landroid/support/test/runner/MonitoringInstrumentation$ActivityFinisher;)V

    .line 325
    return-void
.end method

.method protected final setJsBridgeClassName(Ljava/lang/String;)V
    .locals 1

    .line 221
    if-eqz p1, :cond_1

    .line 225
    iget-object v0, p0, Landroid/support/test/runner/MonitoringInstrumentation;->mIsJsBridgeLoaded:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-nez v0, :cond_0

    .line 228
    iput-object p1, p0, Landroid/support/test/runner/MonitoringInstrumentation;->mJsBridgeClassName:Ljava/lang/String;

    .line 229
    return-void

    .line 226
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "JsBridge is already loaded!"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 222
    :cond_1
    new-instance p1, Ljava/lang/NullPointerException;

    const-string v0, "JsBridge class name cannot be null!"

    invoke-direct {p1, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method protected specifyDexMakerCacheProperty()V
    .locals 3

    .line 216
    invoke-virtual {p0}, Landroid/support/test/runner/MonitoringInstrumentation;->getTargetContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "dxmaker_cache"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getDir(Ljava/lang/String;I)Ljava/io/File;

    move-result-object v0

    .line 217
    invoke-static {}, Ljava/lang/System;->getProperties()Ljava/util/Properties;

    move-result-object v1

    const-string v2, "dexmaker.dexcache"

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v2, v0}, Ljava/util/Properties;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 218
    return-void
.end method

.method public startActivitySync(Landroid/content/Intent;)Landroid/app/Activity;
    .locals 8

    .line 412
    invoke-static {}, Landroid/support/test/internal/util/Checks;->checkNotMainThread()V

    .line 413
    iget-object v0, p0, Landroid/support/test/runner/MonitoringInstrumentation;->mLastIdleTime:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v0

    .line 415
    iget-object v2, p0, Landroid/support/test/runner/MonitoringInstrumentation;->mAnActivityHasBeenLaunched:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v3, 0x0

    const/4 v4, 0x1

    invoke-virtual {v2, v3, v4}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 429
    const/high16 v2, 0x4000000

    invoke-virtual {p1, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 431
    :cond_0
    iget-object v2, p0, Landroid/support/test/runner/MonitoringInstrumentation;->mExecutorService:Ljava/util/concurrent/ExecutorService;

    new-instance v5, Landroid/support/test/runner/MonitoringInstrumentation$4;

    invoke-direct {v5, p0, p1}, Landroid/support/test/runner/MonitoringInstrumentation$4;-><init>(Landroid/support/test/runner/MonitoringInstrumentation;Landroid/content/Intent;)V

    .line 432
    invoke-interface {v2, v5}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    move-result-object v2

    .line 441
    const-wide/16 v5, 0x2d

    :try_start_0
    sget-object v7, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v2, v5, v6, v7}, Ljava/util/concurrent/Future;->get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/app/Activity;
    :try_end_0
    .catch Ljava/util/concurrent/TimeoutException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v5

    .line 461
    :catch_0
    move-exception p1

    .line 462
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V

    .line 463
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "interrupted"

    invoke-direct {v0, v1, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0

    .line 459
    :catch_1
    move-exception p1

    .line 460
    new-instance v0, Ljava/lang/RuntimeException;

    invoke-virtual {p1}, Ljava/util/concurrent/ExecutionException;->getCause()Ljava/lang/Throwable;

    move-result-object p1

    const-string v1, "Could not launch activity"

    invoke-direct {v0, v1, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0

    .line 442
    :catch_2
    move-exception v5

    .line 443
    const-string v5, "ThreadState-startActivityTimeout.txt"

    invoke-virtual {p0, v5}, Landroid/support/test/runner/MonitoringInstrumentation;->dumpThreadStateToOutputs(Ljava/lang/String;)V

    .line 444
    invoke-interface {v2, v4}, Ljava/util/concurrent/Future;->cancel(Z)Z

    .line 445
    new-instance v2, Ljava/lang/RuntimeException;

    const/4 v5, 0x4

    new-array v5, v5, [Ljava/lang/Object;

    aput-object p1, v5, v3

    const/16 p1, 0x2d

    .line 456
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v5, v4

    const/4 p1, 0x2

    .line 457
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    aput-object v0, v5, p1

    const/4 p1, 0x3

    iget-object v0, p0, Landroid/support/test/runner/MonitoringInstrumentation;->mLastIdleTime:Ljava/util/concurrent/atomic/AtomicLong;

    .line 458
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    aput-object v0, v5, p1

    .line 446
    const-string p1, "Could not launch intent %s within %s seconds. Perhaps the main thread has not gone idle within a reasonable amount of time? There could be an animation or something constantly repainting the screen. Or the activity is doing network calls on creation? See the threaddump logs. For your reference the last time the event queue was idle before your activity launch request was %s and now the last time the queue went idle was: %s. If these numbers are the same your activity might be hogging the event queue."

    invoke-static {p1, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v2, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public useDefaultInterceptingActivityFactory()V
    .locals 1

    .line 776
    new-instance v0, Landroid/support/test/internal/runner/intercepting/DefaultInterceptingActivityFactory;

    invoke-direct {v0}, Landroid/support/test/internal/runner/intercepting/DefaultInterceptingActivityFactory;-><init>()V

    iput-object v0, p0, Landroid/support/test/runner/MonitoringInstrumentation;->mInterceptingActivityFactory:Landroid/support/test/runner/intercepting/InterceptingActivityFactory;

    .line 777
    return-void
.end method

.method protected waitForActivitiesToComplete()V
    .locals 6

    .line 366
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v1

    if-eq v0, v1, :cond_2

    .line 370
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    sget-wide v2, Landroid/support/test/runner/MonitoringInstrumentation;->MILLIS_TO_WAIT_FOR_ACTIVITY_TO_STOP:J

    add-long/2addr v0, v2

    .line 371
    iget-object v2, p0, Landroid/support/test/runner/MonitoringInstrumentation;->mStartedActivityCounter:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v2

    .line 372
    :goto_0
    if-lez v2, :cond_0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    cmp-long v3, v3, v0

    if-gez v3, :cond_0

    .line 374
    :try_start_0
    const-string v3, "MonitoringInstr"

    const/16 v4, 0x25

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5, v4}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v4, "Unstopped activity count: "

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 375
    sget-wide v3, Landroid/support/test/runner/MonitoringInstrumentation;->MILLIS_TO_POLL_FOR_ACTIVITY_STOP:J

    invoke-static {v3, v4}, Ljava/lang/Thread;->sleep(J)V

    .line 376
    iget-object v3, p0, Landroid/support/test/runner/MonitoringInstrumentation;->mStartedActivityCounter:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v3
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 380
    nop

    .line 372
    move v2, v3

    goto :goto_0

    .line 377
    :catch_0
    move-exception v0

    .line 378
    const-string v1, "MonitoringInstr"

    const-string v3, "Abandoning activity wait due to interruption."

    invoke-static {v1, v3, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 379
    nop

    .line 383
    :cond_0
    if-lez v2, :cond_1

    .line 384
    const-string v0, "ThreadState-unstopped.txt"

    invoke-virtual {p0, v0}, Landroid/support/test/runner/MonitoringInstrumentation;->dumpThreadStateToOutputs(Ljava/lang/String;)V

    .line 385
    const-string v0, "MonitoringInstr"

    const-string v1, "Still %s activities active after waiting %s ms."

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    .line 389
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v3, v4

    const/4 v2, 0x1

    sget-wide v4, Landroid/support/test/runner/MonitoringInstrumentation;->MILLIS_TO_WAIT_FOR_ACTIVITY_TO_STOP:J

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    aput-object v4, v3, v2

    .line 387
    invoke-static {v1, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 385
    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 391
    :cond_1
    return-void

    .line 367
    :cond_2
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Cannot be called from main thread!"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
