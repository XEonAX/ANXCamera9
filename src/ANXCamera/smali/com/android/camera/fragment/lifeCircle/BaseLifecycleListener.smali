.class public interface abstract Lcom/android/camera/fragment/lifeCircle/BaseLifecycleListener;
.super Ljava/lang/Object;
.source "BaseLifecycleListener.java"


# virtual methods
.method public abstract onLifeAlive()V
.end method

.method public abstract onLifeDestroy(Ljava/lang/String;)V
.end method

.method public abstract onLifeStart(Ljava/lang/String;)V
.end method

.method public abstract onLifeStop(Ljava/lang/String;)V
.end method

.method public abstract setBlockingLifeCycles(Ljava/util/List;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method
