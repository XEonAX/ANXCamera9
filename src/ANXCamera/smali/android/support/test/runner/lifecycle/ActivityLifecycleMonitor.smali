.class public interface abstract Landroid/support/test/runner/lifecycle/ActivityLifecycleMonitor;
.super Ljava/lang/Object;
.source "ActivityLifecycleMonitor.java"


# virtual methods
.method public abstract addLifecycleCallback(Landroid/support/test/runner/lifecycle/ActivityLifecycleCallback;)V
.end method

.method public abstract getActivitiesInStage(Landroid/support/test/runner/lifecycle/Stage;)Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/test/runner/lifecycle/Stage;",
            ")",
            "Ljava/util/Collection<",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getLifecycleStageOf(Landroid/app/Activity;)Landroid/support/test/runner/lifecycle/Stage;
.end method

.method public abstract removeLifecycleCallback(Landroid/support/test/runner/lifecycle/ActivityLifecycleCallback;)V
.end method
