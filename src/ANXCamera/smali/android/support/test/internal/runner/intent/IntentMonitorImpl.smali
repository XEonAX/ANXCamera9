.class public final Landroid/support/test/internal/runner/intent/IntentMonitorImpl;
.super Ljava/lang/Object;
.source "IntentMonitorImpl.java"

# interfaces
.implements Landroid/support/test/runner/intent/IntentMonitor;


# static fields
.field private static final TAG:Ljava/lang/String; = "IntentMonitorImpl"


# instance fields
.field mCallbacks:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/ref/WeakReference<",
            "Landroid/support/test/runner/intent/IntentCallback;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 46
    invoke-static {v0}, Ljava/util/Collections;->synchronizedList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Landroid/support/test/internal/runner/intent/IntentMonitorImpl;->mCallbacks:Ljava/util/List;

    .line 45
    return-void
.end method


# virtual methods
.method public addIntentCallback(Landroid/support/test/runner/intent/IntentCallback;)V
    .locals 3
    .param p1    # Landroid/support/test/runner/intent/IntentCallback;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 54
    if-eqz p1, :cond_4

    .line 57
    const/4 v0, 0x1

    .line 58
    iget-object v1, p0, Landroid/support/test/internal/runner/intent/IntentMonitorImpl;->mCallbacks:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 59
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 60
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/ref/WeakReference;

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/test/runner/intent/IntentCallback;

    .line 61
    if-nez v2, :cond_0

    .line 62
    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    goto :goto_1

    .line 63
    :cond_0
    if-ne v2, p1, :cond_1

    .line 64
    const/4 v0, 0x0

    .line 66
    :cond_1
    :goto_1
    goto :goto_0

    .line 67
    :cond_2
    if-eqz v0, :cond_3

    .line 68
    iget-object v0, p0, Landroid/support/test/internal/runner/intent/IntentMonitorImpl;->mCallbacks:Ljava/util/List;

    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-direct {v1, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 70
    :cond_3
    return-void

    .line 55
    :cond_4
    new-instance p1, Ljava/lang/NullPointerException;

    const-string v0, "callback cannot be null!"

    invoke-direct {p1, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public removeIntentCallback(Landroid/support/test/runner/intent/IntentCallback;)V
    .locals 2
    .param p1    # Landroid/support/test/runner/intent/IntentCallback;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 75
    if-eqz p1, :cond_3

    .line 78
    iget-object v0, p0, Landroid/support/test/internal/runner/intent/IntentMonitorImpl;->mCallbacks:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 79
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 80
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/support/test/runner/intent/IntentCallback;

    .line 81
    if-nez v1, :cond_0

    .line 82
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    goto :goto_1

    .line 83
    :cond_0
    if-ne v1, p1, :cond_1

    .line 84
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    .line 86
    :cond_1
    :goto_1
    goto :goto_0

    .line 87
    :cond_2
    return-void

    .line 76
    :cond_3
    new-instance p1, Ljava/lang/NullPointerException;

    const-string v0, "callback cannot be null!"

    invoke-direct {p1, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public signalIntent(Landroid/content/Intent;)V
    .locals 7

    .line 97
    iget-object v0, p0, Landroid/support/test/internal/runner/intent/IntentMonitorImpl;->mCallbacks:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 98
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 99
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/support/test/runner/intent/IntentCallback;

    .line 100
    if-nez v1, :cond_0

    .line 101
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    goto :goto_1

    .line 105
    :cond_0
    :try_start_0
    new-instance v2, Landroid/content/Intent;

    invoke-direct {v2, p1}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    invoke-interface {v1, v2}, Landroid/support/test/runner/intent/IntentCallback;->onIntentSent(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 112
    goto :goto_1

    .line 106
    :catch_0
    move-exception v2

    .line 107
    const-string v3, "IntentMonitorImpl"

    const-string v4, "Callback threw exception! (callback: %s intent: %s)"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object v1, v5, v6

    const/4 v1, 0x1

    aput-object p1, v5, v1

    .line 109
    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 107
    invoke-static {v3, v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 114
    :goto_1
    goto :goto_0

    .line 115
    :cond_1
    return-void
.end method
