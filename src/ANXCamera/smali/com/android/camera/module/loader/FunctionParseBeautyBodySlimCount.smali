.class public Lcom/android/camera/module/loader/FunctionParseBeautyBodySlimCount;
.super Ljava/lang/Object;
.source "FunctionParseBeautyBodySlimCount.java"

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


# static fields
.field private static final TAG:Ljava/lang/String; = "FunctionParseBeautyBodySlimCount"

.field public static final TIP_INTERVAL_TIME:J = 0x2710L

.field public static final TIP_TIME:J = 0xfa0L


# instance fields
.field private final mCallbackRef:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/android/camera2/Camera2Proxy$BeautyBodySlimCountCallback;",
            ">;"
        }
    .end annotation
.end field

.field private final mIsSupportBeautyBody:Z

.field private mTipHideTime:J

.field private mTipShowTime:J

.field private mTipStatus:Z


# direct methods
.method public constructor <init>(Lcom/android/camera2/Camera2Proxy$BeautyBodySlimCountCallback;)V
    .locals 1

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/android/camera/module/loader/FunctionParseBeautyBodySlimCount;->mCallbackRef:Ljava/lang/ref/WeakReference;

    .line 28
    invoke-static {}, Lcom/android/camera/CameraSettings;->isSupportBeautyBody()Z

    move-result p1

    iput-boolean p1, p0, Lcom/android/camera/module/loader/FunctionParseBeautyBodySlimCount;->mIsSupportBeautyBody:Z

    .line 29
    return-void
.end method


# virtual methods
.method public apply(Landroid/hardware/camera2/CaptureResult;)Landroid/hardware/camera2/CaptureResult;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 33
    iget-boolean v0, p0, Lcom/android/camera/module/loader/FunctionParseBeautyBodySlimCount;->mIsSupportBeautyBody:Z

    if-nez v0, :cond_0

    .line 34
    return-object p1

    .line 37
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/loader/FunctionParseBeautyBodySlimCount;->mCallbackRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera2/Camera2Proxy$BeautyBodySlimCountCallback;

    .line 38
    if-nez v0, :cond_1

    .line 39
    return-object p1

    .line 41
    :cond_1
    iget-boolean v1, p0, Lcom/android/camera/module/loader/FunctionParseBeautyBodySlimCount;->mTipStatus:Z

    const/4 v2, 0x0

    if-eqz v1, :cond_2

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    iget-wide v5, p0, Lcom/android/camera/module/loader/FunctionParseBeautyBodySlimCount;->mTipShowTime:J

    sub-long/2addr v3, v5

    const-wide/16 v5, 0xfa0

    cmp-long v1, v3, v5

    if-lez v1, :cond_2

    .line 42
    iput-boolean v2, p0, Lcom/android/camera/module/loader/FunctionParseBeautyBodySlimCount;->mTipStatus:Z

    .line 43
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    iput-wide v3, p0, Lcom/android/camera/module/loader/FunctionParseBeautyBodySlimCount;->mTipHideTime:J

    .line 45
    :cond_2
    invoke-interface {v0}, Lcom/android/camera2/Camera2Proxy$BeautyBodySlimCountCallback;->isBeautyBodySlimCountDetectStarted()Z

    move-result v1

    if-nez v1, :cond_4

    .line 46
    iget-boolean v1, p0, Lcom/android/camera/module/loader/FunctionParseBeautyBodySlimCount;->mTipStatus:Z

    if-eqz v1, :cond_3

    .line 47
    invoke-interface {v0, v2}, Lcom/android/camera2/Camera2Proxy$BeautyBodySlimCountCallback;->onBeautyBodySlimCountChange(Z)V

    .line 48
    iput-boolean v2, p0, Lcom/android/camera/module/loader/FunctionParseBeautyBodySlimCount;->mTipStatus:Z

    .line 49
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/android/camera/module/loader/FunctionParseBeautyBodySlimCount;->mTipHideTime:J

    .line 51
    :cond_3
    return-object p1

    .line 53
    :cond_4
    invoke-static {p1}, Lcom/android/camera2/CaptureResultParser;->getBeautyBodySlimCountResult(Landroid/hardware/camera2/CaptureResult;)I

    move-result v1

    .line 54
    const/4 v3, -0x1

    if-ne v1, v3, :cond_5

    .line 55
    return-object p1

    .line 57
    :cond_5
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    iget-wide v5, p0, Lcom/android/camera/module/loader/FunctionParseBeautyBodySlimCount;->mTipHideTime:J

    sub-long/2addr v3, v5

    const-wide/16 v5, 0x2710

    cmp-long v3, v3, v5

    if-gez v3, :cond_6

    .line 58
    return-object p1

    .line 60
    :cond_6
    const/4 v3, 0x1

    if-eq v1, v3, :cond_7

    .line 61
    move v2, v3

    goto :goto_0

    .line 60
    :cond_7
    nop

    .line 61
    :goto_0
    iget-boolean v3, p0, Lcom/android/camera/module/loader/FunctionParseBeautyBodySlimCount;->mTipStatus:Z

    if-ne v3, v2, :cond_8

    .line 62
    return-object p1

    .line 64
    :cond_8
    iput-boolean v2, p0, Lcom/android/camera/module/loader/FunctionParseBeautyBodySlimCount;->mTipStatus:Z

    .line 65
    const-string v3, "FunctionParseBeautyBodySlimCount"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Beauty body slim count:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v3, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 66
    invoke-interface {v0, v2}, Lcom/android/camera2/Camera2Proxy$BeautyBodySlimCountCallback;->onBeautyBodySlimCountChange(Z)V

    .line 67
    if-eqz v2, :cond_9

    .line 68
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/camera/module/loader/FunctionParseBeautyBodySlimCount;->mTipShowTime:J

    goto :goto_1

    .line 70
    :cond_9
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/camera/module/loader/FunctionParseBeautyBodySlimCount;->mTipHideTime:J

    .line 72
    :goto_1
    return-object p1
.end method

.method public bridge synthetic apply(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 16
    check-cast p1, Landroid/hardware/camera2/CaptureResult;

    invoke-virtual {p0, p1}, Lcom/android/camera/module/loader/FunctionParseBeautyBodySlimCount;->apply(Landroid/hardware/camera2/CaptureResult;)Landroid/hardware/camera2/CaptureResult;

    move-result-object p1

    return-object p1
.end method
