.class public Lcom/android/camera/module/loader/PredicateFilterAiScene;
.super Ljava/lang/Object;
.source "PredicateFilterAiScene.java"

# interfaces
.implements Lio/reactivex/functions/Predicate;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lio/reactivex/functions/Predicate<",
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "PredicateFilterAiScene"


# instance fields
.field private mCurrentDetectedScene:I

.field private mLastChangeSceneTime:J

.field private mModuleWeakReference:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/android/camera/module/Camera2Module;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/android/camera/module/Camera2Module;)V
    .locals 2

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/android/camera/module/loader/PredicateFilterAiScene;->mLastChangeSceneTime:J

    .line 22
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/android/camera/module/loader/PredicateFilterAiScene;->mModuleWeakReference:Ljava/lang/ref/WeakReference;

    .line 23
    return-void
.end method


# virtual methods
.method public test(Ljava/lang/Integer;)Z
    .locals 6

    .line 27
    iget-object v0, p0, Lcom/android/camera/module/loader/PredicateFilterAiScene;->mModuleWeakReference:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera/module/Camera2Module;

    .line 28
    const/4 v1, 0x0

    if-eqz v0, :cond_2

    .line 29
    invoke-virtual {v0}, Lcom/android/camera/module/Camera2Module;->isDoingAction()Z

    move-result v2

    if-nez v2, :cond_1

    invoke-virtual {v0}, Lcom/android/camera/module/Camera2Module;->isAlive()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 33
    :cond_0
    iget v0, p0, Lcom/android/camera/module/loader/PredicateFilterAiScene;->mCurrentDetectedScene:I

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-eq v0, v2, :cond_2

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iget-wide v4, p0, Lcom/android/camera/module/loader/PredicateFilterAiScene;->mLastChangeSceneTime:J

    sub-long/2addr v2, v4

    const-wide/16 v4, 0x12c

    cmp-long v0, v2, v4

    if-lez v0, :cond_2

    .line 34
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    iput p1, p0, Lcom/android/camera/module/loader/PredicateFilterAiScene;->mCurrentDetectedScene:I

    .line 35
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/camera/module/loader/PredicateFilterAiScene;->mLastChangeSceneTime:J

    .line 36
    const/4 p1, 0x1

    return p1

    .line 30
    :cond_1
    :goto_0
    return v1

    .line 39
    :cond_2
    return v1
.end method

.method public bridge synthetic test(Ljava/lang/Object;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 9
    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p0, p1}, Lcom/android/camera/module/loader/PredicateFilterAiScene;->test(Ljava/lang/Integer;)Z

    move-result p1

    return p1
.end method
