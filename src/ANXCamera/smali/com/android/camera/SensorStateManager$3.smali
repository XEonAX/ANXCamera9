.class Lcom/android/camera/SensorStateManager$3;
.super Ljava/lang/Object;
.source "SensorStateManager.java"

# interfaces
.implements Landroid/hardware/SensorEventListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/SensorStateManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# static fields
.field private static final CLEAR_FILTER_THRESHOLD:F = 3.0f

.field private static final _DATA_X:I = 0x0

.field private static final _DATA_Y:I = 0x1

.field private static final _DATA_Z:I = 0x2

.field private static final finalAlpha:F = 0.7f

.field private static final firstAlpha:F = 0.8f


# instance fields
.field private finalFilter:[F

.field private firstFilter:[F

.field final synthetic this$0:Lcom/android/camera/SensorStateManager;


# direct methods
.method constructor <init>(Lcom/android/camera/SensorStateManager;)V
    .locals 1

    .line 447
    iput-object p1, p0, Lcom/android/camera/SensorStateManager$3;->this$0:Lcom/android/camera/SensorStateManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 454
    const/4 p1, 0x3

    new-array v0, p1, [F

    iput-object v0, p0, Lcom/android/camera/SensorStateManager$3;->firstFilter:[F

    .line 455
    new-array p1, p1, [F

    iput-object p1, p0, Lcom/android/camera/SensorStateManager$3;->finalFilter:[F

    return-void
.end method

.method private clearFilter()V
    .locals 3

    .line 502
    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Lcom/android/camera/SensorStateManager$3;->firstFilter:[F

    array-length v1, v1

    if-ge v0, v1, :cond_0

    .line 503
    iget-object v1, p0, Lcom/android/camera/SensorStateManager$3;->firstFilter:[F

    const/4 v2, 0x0

    aput v2, v1, v0

    .line 504
    iget-object v1, p0, Lcom/android/camera/SensorStateManager$3;->finalFilter:[F

    aput v2, v1, v0

    .line 502
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 506
    :cond_0
    return-void
.end method


# virtual methods
.method public onAccuracyChanged(Landroid/hardware/Sensor;I)V
    .locals 2

    .line 510
    const-string p1, "SensorStateManager"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onAccuracyChanged accuracy="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 511
    return-void
.end method

.method public onSensorChanged(Landroid/hardware/SensorEvent;)V
    .locals 9

    .line 459
    iget-object v0, p0, Lcom/android/camera/SensorStateManager$3;->this$0:Lcom/android/camera/SensorStateManager;

    invoke-static {v0}, Lcom/android/camera/SensorStateManager;->access$000(Lcom/android/camera/SensorStateManager;)Lcom/android/camera/SensorStateManager$SensorStateListener;

    move-result-object v0

    .line 460
    if-nez v0, :cond_0

    .line 461
    return-void

    .line 466
    :cond_0
    iget-object v1, p0, Lcom/android/camera/SensorStateManager$3;->firstFilter:[F

    iget-object v2, p0, Lcom/android/camera/SensorStateManager$3;->firstFilter:[F

    const/4 v3, 0x0

    aget v2, v2, v3

    const v4, 0x3f4ccccd    # 0.8f

    mul-float/2addr v2, v4

    iget-object v5, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v5, v5, v3

    const v6, 0x3e4ccccc    # 0.19999999f

    mul-float/2addr v5, v6

    add-float/2addr v2, v5

    aput v2, v1, v3

    .line 467
    iget-object v1, p0, Lcom/android/camera/SensorStateManager$3;->firstFilter:[F

    iget-object v2, p0, Lcom/android/camera/SensorStateManager$3;->firstFilter:[F

    const/4 v5, 0x1

    aget v2, v2, v5

    mul-float/2addr v2, v4

    iget-object v7, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v7, v7, v5

    mul-float/2addr v7, v6

    add-float/2addr v2, v7

    aput v2, v1, v5

    .line 468
    iget-object v1, p0, Lcom/android/camera/SensorStateManager$3;->firstFilter:[F

    iget-object v2, p0, Lcom/android/camera/SensorStateManager$3;->firstFilter:[F

    const/4 v7, 0x2

    aget v2, v2, v7

    mul-float/2addr v4, v2

    iget-object v2, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v2, v2, v7

    mul-float/2addr v6, v2

    add-float/2addr v4, v6

    aput v4, v1, v7

    .line 469
    iget-object v1, p0, Lcom/android/camera/SensorStateManager$3;->finalFilter:[F

    iget-object v2, p0, Lcom/android/camera/SensorStateManager$3;->finalFilter:[F

    aget v2, v2, v3

    const v4, 0x3f333333    # 0.7f

    mul-float/2addr v2, v4

    iget-object v6, p0, Lcom/android/camera/SensorStateManager$3;->firstFilter:[F

    aget v6, v6, v3

    const v8, 0x3e99999a    # 0.3f

    mul-float/2addr v6, v8

    add-float/2addr v2, v6

    aput v2, v1, v3

    .line 470
    iget-object v1, p0, Lcom/android/camera/SensorStateManager$3;->finalFilter:[F

    iget-object v2, p0, Lcom/android/camera/SensorStateManager$3;->finalFilter:[F

    aget v2, v2, v5

    mul-float/2addr v2, v4

    iget-object v6, p0, Lcom/android/camera/SensorStateManager$3;->firstFilter:[F

    aget v6, v6, v5

    mul-float/2addr v6, v8

    add-float/2addr v2, v6

    aput v2, v1, v5

    .line 471
    iget-object v1, p0, Lcom/android/camera/SensorStateManager$3;->finalFilter:[F

    iget-object v2, p0, Lcom/android/camera/SensorStateManager$3;->finalFilter:[F

    aget v2, v2, v7

    mul-float/2addr v4, v2

    iget-object v2, p0, Lcom/android/camera/SensorStateManager$3;->firstFilter:[F

    aget v2, v2, v7

    mul-float/2addr v8, v2

    add-float/2addr v4, v8

    aput v4, v1, v7

    .line 472
    const-string v1, "SensorStateManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "finalFilter="

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, p0, Lcom/android/camera/SensorStateManager$3;->finalFilter:[F

    aget v4, v4, v3

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v4, " "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, p0, Lcom/android/camera/SensorStateManager$3;->finalFilter:[F

    aget v4, v4, v5

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v4, " "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, p0, Lcom/android/camera/SensorStateManager$3;->finalFilter:[F

    aget v4, v4, v7

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v4, " event.values="

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v4, v4, v3

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v4, " "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v4, v4, v5

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v4, " "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p1, p1, Landroid/hardware/SensorEvent;->values:[F

    aget p1, p1, v7

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 475
    const/high16 p1, -0x40800000    # -1.0f

    .line 477
    iget-object v1, p0, Lcom/android/camera/SensorStateManager$3;->finalFilter:[F

    aget v1, v1, v3

    neg-float v1, v1

    .line 478
    iget-object v2, p0, Lcom/android/camera/SensorStateManager$3;->finalFilter:[F

    aget v2, v2, v5

    neg-float v2, v2

    .line 479
    iget-object v3, p0, Lcom/android/camera/SensorStateManager$3;->finalFilter:[F

    aget v3, v3, v7

    neg-float v3, v3

    .line 480
    mul-float v4, v1, v1

    mul-float v5, v2, v2

    add-float/2addr v4, v5

    .line 482
    const/high16 v5, 0x40800000    # 4.0f

    mul-float/2addr v4, v5

    mul-float/2addr v3, v3

    cmpl-float v3, v4, v3

    if-ltz v3, :cond_1

    .line 483
    const p1, 0x42652ee1

    .line 484
    neg-float v2, v2

    float-to-double v2, v2

    float-to-double v4, v1

    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->atan2(DD)D

    move-result-wide v1

    double-to-float v1, v1

    mul-float/2addr v1, p1

    .line 485
    const/high16 p1, 0x42b40000    # 90.0f

    sub-float/2addr p1, v1

    .line 487
    iget-object v1, p0, Lcom/android/camera/SensorStateManager$3;->this$0:Lcom/android/camera/SensorStateManager;

    invoke-static {v1, p1}, Lcom/android/camera/SensorStateManager;->access$1300(Lcom/android/camera/SensorStateManager;F)F

    move-result p1

    .line 490
    :cond_1
    iget-object v1, p0, Lcom/android/camera/SensorStateManager$3;->this$0:Lcom/android/camera/SensorStateManager;

    invoke-static {v1}, Lcom/android/camera/SensorStateManager;->access$1200(Lcom/android/camera/SensorStateManager;)F

    move-result v1

    cmpl-float v1, p1, v1

    if-eqz v1, :cond_3

    .line 491
    iget-object v1, p0, Lcom/android/camera/SensorStateManager$3;->this$0:Lcom/android/camera/SensorStateManager;

    invoke-static {v1}, Lcom/android/camera/SensorStateManager;->access$1200(Lcom/android/camera/SensorStateManager;)F

    move-result v1

    sub-float/2addr v1, p1

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v1

    const/high16 v2, 0x40400000    # 3.0f

    cmpl-float v1, v1, v2

    if-lez v1, :cond_2

    .line 492
    invoke-direct {p0}, Lcom/android/camera/SensorStateManager$3;->clearFilter()V

    .line 494
    :cond_2
    iget-object v1, p0, Lcom/android/camera/SensorStateManager$3;->this$0:Lcom/android/camera/SensorStateManager;

    invoke-static {v1, p1}, Lcom/android/camera/SensorStateManager;->access$1202(Lcom/android/camera/SensorStateManager;F)F

    .line 495
    const-string p1, "SensorStateManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "SensorEventListenerImpl TYPE_ACCELEROMETER mOrientation="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/android/camera/SensorStateManager$3;->this$0:Lcom/android/camera/SensorStateManager;

    invoke-static {v2}, Lcom/android/camera/SensorStateManager;->access$1200(Lcom/android/camera/SensorStateManager;)F

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v2, " mIsLying="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/android/camera/SensorStateManager$3;->this$0:Lcom/android/camera/SensorStateManager;

    .line 496
    invoke-static {v2}, Lcom/android/camera/SensorStateManager;->access$900(Lcom/android/camera/SensorStateManager;)Z

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 495
    invoke-static {p1, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 497
    iget-object p1, p0, Lcom/android/camera/SensorStateManager$3;->this$0:Lcom/android/camera/SensorStateManager;

    invoke-static {p1}, Lcom/android/camera/SensorStateManager;->access$1200(Lcom/android/camera/SensorStateManager;)F

    move-result p1

    iget-object v1, p0, Lcom/android/camera/SensorStateManager$3;->this$0:Lcom/android/camera/SensorStateManager;

    invoke-static {v1}, Lcom/android/camera/SensorStateManager;->access$900(Lcom/android/camera/SensorStateManager;)Z

    move-result v1

    invoke-interface {v0, p1, v1}, Lcom/android/camera/SensorStateManager$SensorStateListener;->onDeviceOrientationChanged(FZ)V

    .line 499
    :cond_3
    return-void
.end method
