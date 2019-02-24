.class public Lcom/android/camera/fragment/lifeCircle/BaseFragmentLifecycle;
.super Ljava/lang/Object;
.source "BaseFragmentLifecycle.java"

# interfaces
.implements Lcom/android/camera/fragment/lifeCircle/BaseLifeCycle;


# instance fields
.field private mIsDestroyed:Z

.field private mIsStarted:Z

.field private final mLifecycleListeners:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lcom/android/camera/fragment/lifeCircle/BaseLifecycleListener;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    .line 14
    invoke-static {v0}, Ljava/util/Collections;->newSetFromMap(Ljava/util/Map;)Ljava/util/Set;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/lifeCircle/BaseFragmentLifecycle;->mLifecycleListeners:Ljava/util/Set;

    .line 13
    return-void
.end method


# virtual methods
.method public addListener(Lcom/android/camera/fragment/lifeCircle/BaseLifecycleListener;Ljava/lang/String;)V
    .locals 1

    .line 21
    iget-object v0, p0, Lcom/android/camera/fragment/lifeCircle/BaseFragmentLifecycle;->mLifecycleListeners:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 23
    iget-boolean v0, p0, Lcom/android/camera/fragment/lifeCircle/BaseFragmentLifecycle;->mIsDestroyed:Z

    if-eqz v0, :cond_0

    .line 24
    invoke-interface {p1, p2}, Lcom/android/camera/fragment/lifeCircle/BaseLifecycleListener;->onLifeDestroy(Ljava/lang/String;)V

    goto :goto_0

    .line 25
    :cond_0
    iget-boolean v0, p0, Lcom/android/camera/fragment/lifeCircle/BaseFragmentLifecycle;->mIsStarted:Z

    if-eqz v0, :cond_1

    .line 26
    invoke-interface {p1, p2}, Lcom/android/camera/fragment/lifeCircle/BaseLifecycleListener;->onLifeStart(Ljava/lang/String;)V

    goto :goto_0

    .line 28
    :cond_1
    invoke-interface {p1, p2}, Lcom/android/camera/fragment/lifeCircle/BaseLifecycleListener;->onLifeStop(Ljava/lang/String;)V

    .line 30
    :goto_0
    return-void
.end method

.method onDestroy(Ljava/lang/String;)V
    .locals 2

    .line 47
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/fragment/lifeCircle/BaseFragmentLifecycle;->mIsDestroyed:Z

    .line 48
    iget-object v0, p0, Lcom/android/camera/fragment/lifeCircle/BaseFragmentLifecycle;->mLifecycleListeners:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/camera/fragment/lifeCircle/BaseLifecycleListener;

    .line 49
    invoke-interface {v1, p1}, Lcom/android/camera/fragment/lifeCircle/BaseLifecycleListener;->onLifeDestroy(Ljava/lang/String;)V

    .line 50
    goto :goto_0

    .line 51
    :cond_0
    return-void
.end method

.method onStart(Ljava/lang/String;)V
    .locals 2

    .line 33
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/fragment/lifeCircle/BaseFragmentLifecycle;->mIsStarted:Z

    .line 34
    iget-object v0, p0, Lcom/android/camera/fragment/lifeCircle/BaseFragmentLifecycle;->mLifecycleListeners:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/camera/fragment/lifeCircle/BaseLifecycleListener;

    .line 35
    invoke-interface {v1, p1}, Lcom/android/camera/fragment/lifeCircle/BaseLifecycleListener;->onLifeStart(Ljava/lang/String;)V

    .line 36
    goto :goto_0

    .line 37
    :cond_0
    return-void
.end method

.method onStop(Ljava/lang/String;)V
    .locals 2

    .line 40
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/fragment/lifeCircle/BaseFragmentLifecycle;->mIsStarted:Z

    .line 41
    iget-object v0, p0, Lcom/android/camera/fragment/lifeCircle/BaseFragmentLifecycle;->mLifecycleListeners:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/camera/fragment/lifeCircle/BaseLifecycleListener;

    .line 42
    invoke-interface {v1, p1}, Lcom/android/camera/fragment/lifeCircle/BaseLifecycleListener;->onLifeStop(Ljava/lang/String;)V

    .line 43
    goto :goto_0

    .line 44
    :cond_0
    return-void
.end method
