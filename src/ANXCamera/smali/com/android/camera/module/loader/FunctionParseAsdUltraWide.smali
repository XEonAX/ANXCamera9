.class public Lcom/android/camera/module/loader/FunctionParseAsdUltraWide;
.super Ljava/lang/Object;
.source "FunctionParseAsdUltraWide.java"

# interfaces
.implements Lio/reactivex/functions/Function;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lio/reactivex/functions/Function<",
        "Landroid/hardware/camera2/CaptureResult;",
        "Landroid/hardware/camera2/CaptureResult;",
        ">;"
    }
.end annotation


# instance fields
.field private mIsOpenUltraWide:Z

.field private mUltrawidecheckcallback:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/android/camera2/Camera2Proxy$UltraWideCheckCallback;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/android/camera2/Camera2Proxy$UltraWideCheckCallback;)V
    .locals 1

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/android/camera/module/loader/FunctionParseAsdUltraWide;->mUltrawidecheckcallback:Ljava/lang/ref/WeakReference;

    .line 19
    return-void
.end method


# virtual methods
.method public apply(Landroid/hardware/camera2/CaptureResult;)Landroid/hardware/camera2/CaptureResult;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 23
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->fu()Z

    move-result v0

    if-nez v0, :cond_0

    .line 24
    return-object p1

    .line 26
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/loader/FunctionParseAsdUltraWide;->mUltrawidecheckcallback:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera2/Camera2Proxy$UltraWideCheckCallback;

    .line 27
    if-nez v0, :cond_1

    .line 28
    return-object p1

    .line 31
    :cond_1
    invoke-interface {v0}, Lcom/android/camera2/Camera2Proxy$UltraWideCheckCallback;->isUltraWideDetectStarted()Z

    move-result v1

    if-nez v1, :cond_2

    .line 32
    return-object p1

    .line 35
    :cond_2
    invoke-static {p1}, Lcom/android/camera2/CaptureResultParser;->getUltraWideDetectedResult(Landroid/hardware/camera2/CaptureResult;)I

    move-result v1

    .line 36
    const/4 v2, 0x1

    if-ne v1, v2, :cond_3

    goto :goto_0

    :cond_3
    const/4 v2, 0x0

    .line 37
    :goto_0
    iget-boolean v1, p0, Lcom/android/camera/module/loader/FunctionParseAsdUltraWide;->mIsOpenUltraWide:Z

    if-ne v1, v2, :cond_4

    .line 39
    return-object p1

    .line 41
    :cond_4
    iput-boolean v2, p0, Lcom/android/camera/module/loader/FunctionParseAsdUltraWide;->mIsOpenUltraWide:Z

    .line 42
    invoke-interface {v0, v2}, Lcom/android/camera2/Camera2Proxy$UltraWideCheckCallback;->onUltraWideChanged(Z)V

    .line 44
    return-object p1
.end method

.method public bridge synthetic apply(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 13
    check-cast p1, Landroid/hardware/camera2/CaptureResult;

    invoke-virtual {p0, p1}, Lcom/android/camera/module/loader/FunctionParseAsdUltraWide;->apply(Landroid/hardware/camera2/CaptureResult;)Landroid/hardware/camera2/CaptureResult;

    move-result-object p1

    return-object p1
.end method
