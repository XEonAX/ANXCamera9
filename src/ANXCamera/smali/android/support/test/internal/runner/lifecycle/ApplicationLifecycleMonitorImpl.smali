.class public Landroid/support/test/internal/runner/lifecycle/ApplicationLifecycleMonitorImpl;
.super Ljava/lang/Object;
.source "ApplicationLifecycleMonitorImpl.java"

# interfaces
.implements Landroid/support/test/runner/lifecycle/ApplicationLifecycleMonitor;


# static fields
.field private static final TAG:Ljava/lang/String; = "ApplicationLifecycleMonitorImpl"


# instance fields
.field private final mCallbacks:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/ref/WeakReference<",
            "Landroid/support/test/runner/lifecycle/ApplicationLifecycleCallback;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroid/support/test/internal/runner/lifecycle/ApplicationLifecycleMonitorImpl;->mCallbacks:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public addLifecycleCallback(Landroid/support/test/runner/lifecycle/ApplicationLifecycleCallback;)V
    .locals 4

    .line 43
    invoke-static {p1}, Landroid/support/test/internal/util/Checks;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 45
    iget-object v0, p0, Landroid/support/test/internal/runner/lifecycle/ApplicationLifecycleMonitorImpl;->mCallbacks:Ljava/util/List;

    monitor-enter v0

    .line 46
    const/4 v1, 0x1

    .line 47
    :try_start_0
    iget-object v2, p0, Landroid/support/test/internal/runner/lifecycle/ApplicationLifecycleMonitorImpl;->mCallbacks:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 48
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 49
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/ref/WeakReference;

    invoke-virtual {v3}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/support/test/runner/lifecycle/ApplicationLifecycleCallback;

    .line 50
    if-nez v3, :cond_0

    .line 51
    invoke-interface {v2}, Ljava/util/Iterator;->remove()V

    goto :goto_1

    .line 52
    :cond_0
    if-ne v3, p1, :cond_1

    .line 53
    const/4 v1, 0x0

    .line 55
    :cond_1
    :goto_1
    goto :goto_0

    .line 56
    :cond_2
    if-eqz v1, :cond_3

    .line 57
    iget-object v1, p0, Landroid/support/test/internal/runner/lifecycle/ApplicationLifecycleMonitorImpl;->mCallbacks:Ljava/util/List;

    new-instance v2, Ljava/lang/ref/WeakReference;

    invoke-direct {v2, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 59
    :cond_3
    monitor-exit v0

    .line 60
    return-void

    .line 59
    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public removeLifecycleCallback(Landroid/support/test/runner/lifecycle/ApplicationLifecycleCallback;)V
    .locals 3

    .line 64
    invoke-static {p1}, Landroid/support/test/internal/util/Checks;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 66
    iget-object v0, p0, Landroid/support/test/internal/runner/lifecycle/ApplicationLifecycleMonitorImpl;->mCallbacks:Ljava/util/List;

    monitor-enter v0

    .line 67
    :try_start_0
    iget-object v1, p0, Landroid/support/test/internal/runner/lifecycle/ApplicationLifecycleMonitorImpl;->mCallbacks:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 68
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 69
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/ref/WeakReference;

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/test/runner/lifecycle/ApplicationLifecycleCallback;

    .line 70
    if-nez v2, :cond_0

    .line 71
    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    goto :goto_1

    .line 72
    :cond_0
    if-ne v2, p1, :cond_1

    .line 73
    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    .line 75
    :cond_1
    :goto_1
    goto :goto_0

    .line 76
    :cond_2
    monitor-exit v0

    .line 77
    return-void

    .line 76
    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public signalLifecycleChange(Landroid/app/Application;Landroid/support/test/runner/lifecycle/ApplicationStage;)V
    .locals 8

    .line 80
    iget-object v0, p0, Landroid/support/test/internal/runner/lifecycle/ApplicationLifecycleMonitorImpl;->mCallbacks:Ljava/util/List;

    monitor-enter v0

    .line 81
    :try_start_0
    iget-object v1, p0, Landroid/support/test/internal/runner/lifecycle/ApplicationLifecycleMonitorImpl;->mCallbacks:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 82
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 83
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/ref/WeakReference;

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/test/runner/lifecycle/ApplicationLifecycleCallback;

    .line 84
    if-nez v2, :cond_0

    .line 85
    invoke-interface {v1}, Ljava/util/Iterator;->remove()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    .line 88
    :cond_0
    :try_start_1
    const-string v3, "ApplicationLifecycleMonitorImpl"

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    const/16 v5, 0x12

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    add-int/2addr v5, v6

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v5}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v5, "running callback: "

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 89
    invoke-interface {v2, p1, p2}, Landroid/support/test/runner/lifecycle/ApplicationLifecycleCallback;->onApplicationLifecycleChanged(Landroid/app/Application;Landroid/support/test/runner/lifecycle/ApplicationStage;)V

    .line 90
    const-string v3, "ApplicationLifecycleMonitorImpl"

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    const/16 v5, 0x14

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    add-int/2addr v5, v6

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v5}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v5, "callback completes: "

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 97
    goto :goto_1

    .line 91
    :catch_0
    move-exception v3

    .line 92
    :try_start_2
    const-string v4, "ApplicationLifecycleMonitorImpl"

    const-string v5, "Callback threw exception! (callback: %s stage: %s)"

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object v2, v6, v7

    const/4 v2, 0x1

    aput-object p2, v6, v2

    .line 94
    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 92
    invoke-static {v4, v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 99
    :goto_1
    goto :goto_0

    .line 100
    :cond_1
    monitor-exit v0

    .line 101
    return-void

    .line 100
    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p1
.end method
