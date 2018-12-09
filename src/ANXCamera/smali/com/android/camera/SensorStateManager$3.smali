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

    .line 433
    iput-object p1, p0, Lcom/android/camera/SensorStateManager$3;->this$0:Lcom/android/camera/SensorStateManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 440
    const/4 p1, 0x3

    new-array v0, p1, [F

    iput-object v0, p0, Lcom/android/camera/SensorStateManager$3;->firstFilter:[F

    .line 441
    new-array p1, p1, [F

    iput-object p1, p0, Lcom/android/camera/SensorStateManager$3;->finalFilter:[F

    return-void
.end method

.method private clearFilter()V
    .locals 3

    .line 488
    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Lcom/android/camera/SensorStateManager$3;->firstFilter:[F

    array-length v1, v1

    if-ge v0, v1, :cond_0

    .line 489
    iget-object v1, p0, Lcom/android/camera/SensorStateManager$3;->firstFilter:[F

    const/4 v2, 0x0

    aput v2, v1, v0

    .line 490
    iget-object v1, p0, Lcom/android/camera/SensorStateManager$3;->finalFilter:[F

    aput v2, v1, v0

    .line 488
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 492
    :cond_0
    return-void
.end method


# virtual methods
.method public onAccuracyChanged(Landroid/hardware/Sensor;I)V
    .locals 2

    .line 496
    const-string p1, "SensorStateManager"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onAccuracyChanged accuracy="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 497
    return-void
.end method

.method public onSensorChanged(Landroid/hardware/SensorEvent;)V
    .locals 8

    .line 445
    iget-object v0, p0, Lcom/android/camera/SensorStateManager$3;->this$0:Lcom/android/camera/SensorStateManager;

    invoke-static {v0}, Lcom/android/camera/SensorStateManager;->access$100(Lcom/android/camera/SensorStateManager;)Lcom/android/camera/SensorStateManager$SensorStateListener;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    .line 449
    :cond_0
    iget-object v0, p0, Lcom/android/camera/SensorStateManager$3;->firstFilter:[F

    iget-object v1, p0, Lcom/android/camera/SensorStateManager$3;->firstFilter:[F

    const/4 v2, 0x0

    aget v1, v1, v2

    const v3, 0x3f4ccccd    # 0.8f

    mul-float/2addr v1, v3

    iget-object v4, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v4, v4, v2

    const v5, 0x3e4ccccc    # 0.19999999f

    mul-float/2addr v4, v5

    add-float/2addr v1, v4

    aput v1, v0, v2

    .line 450
    iget-object v0, p0, Lcom/android/camera/SensorStateManager$3;->firstFilter:[F

    iget-object v1, p0, Lcom/android/camera/SensorStateManager$3;->firstFilter:[F

    const/4 v4, 0x1

    aget v1, v1, v4

    mul-float/2addr v1, v3

    iget-object v6, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v6, v6, v4

    mul-float/2addr v6, v5

    add-float/2addr v1, v6

    aput v1, v0, v4

    .line 451
    iget-object v0, p0, Lcom/android/camera/SensorStateManager$3;->firstFilter:[F

    iget-object v1, p0, Lcom/android/camera/SensorStateManager$3;->firstFilter:[F

    const/4 v6, 0x2

    aget v1, v1, v6

    mul-float/2addr v3, v1

    iget-object v1, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v1, v1, v6

    mul-float/2addr v5, v1

    add-float/2addr v3, v5

    aput v3, v0, v6

    .line 452
    iget-object v0, p0, Lcom/android/camera/SensorStateManager$3;->finalFilter:[F

    iget-object v1, p0, Lcom/android/camera/SensorStateManager$3;->finalFilter:[F

    aget v1, v1, v2

    const v3, 0x3f333333    # 0.7f

    mul-float/2addr v1, v3

    iget-object v5, p0, Lcom/android/camera/SensorStateManager$3;->firstFilter:[F

    aget v5, v5, v2

    const v7, 0x3e99999a    # 0.3f

    mul-float/2addr v5, v7

    add-float/2addr v1, v5

    aput v1, v0, v2

    .line 453
    iget-object v0, p0, Lcom/android/camera/SensorStateManager$3;->finalFilter:[F

    iget-object v1, p0, Lcom/android/camera/SensorStateManager$3;->finalFilter:[F

    aget v1, v1, v4

    mul-float/2addr v1, v3

    iget-object v5, p0, Lcom/android/camera/SensorStateManager$3;->firstFilter:[F

    aget v5, v5, v4

    mul-float/2addr v5, v7

    add-float/2addr v1, v5

    aput v1, v0, v4

    .line 454
    iget-object v0, p0, Lcom/android/camera/SensorStateManager$3;->finalFilter:[F

    iget-object v1, p0, Lcom/android/camera/SensorStateManager$3;->finalFilter:[F

    aget v1, v1, v6

    mul-float/2addr v3, v1

    iget-object v1, p0, Lcom/android/camera/SensorStateManager$3;->firstFilter:[F

    aget v1, v1, v6

    mul-float/2addr v7, v1

    add-float/2addr v3, v7

    aput v3, v0, v6

    .line 455
    const-string v0, "SensorStateManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "finalFilter="

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/android/camera/SensorStateManager$3;->finalFilter:[F

    aget v3, v3, v2

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v3, " "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/android/camera/SensorStateManager$3;->finalFilter:[F

    aget v3, v3, v4

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v3, " "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/android/camera/SensorStateManager$3;->finalFilter:[F

    aget v3, v3, v6

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v3, " event.values="

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v3, v3, v2

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v3, " "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v3, v3, v4

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v3, " "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p1, p1, Landroid/hardware/SensorEvent;->values:[F

    aget p1, p1, v6

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 458
    const/high16 p1, -0x40800000    # -1.0f

    .line 460
    iget-object v0, p0, Lcom/android/camera/SensorStateManager$3;->finalFilter:[F

    aget v0, v0, v2

    neg-float v0, v0

    .line 461
    iget-object v1, p0, Lcom/android/camera/SensorStateManager$3;->finalFilter:[F

    aget v1, v1, v4

    neg-float v1, v1

    .line 462
    iget-object v2, p0, Lcom/android/camera/SensorStateManager$3;->finalFilter:[F

    aget v2, v2, v6

    neg-float v2, v2

    .line 463
    mul-float v3, v0, v0

    mul-float v4, v1, v1

    add-float/2addr v3, v4

    .line 465
    const/high16 v4, 0x40800000    # 4.0f

    mul-float/2addr v3, v4

    mul-float/2addr v2, v2

    cmpl-float v2, v3, v2

    if-ltz v2, :cond_1

    .line 466
    const p1, 0x42652ee1

    .line 467
    neg-float v1, v1

    float-to-double v1, v1

    float-to-double v3, v0

    invoke-static {v1, v2, v3, v4}, Ljava/lang/Math;->atan2(DD)D

    move-result-wide v0

    double-to-float v0, v0

    mul-float/2addr v0, p1

    .line 468
    const/high16 p1, 0x42b40000    # 90.0f

    sub-float/2addr p1, v0

    .line 470
    iget-object v0, p0, Lcom/android/camera/SensorStateManager$3;->this$0:Lcom/android/camera/SensorStateManager;

    invoke-static {v0, p1}, Lcom/android/camera/SensorStateManager;->access$1300(Lcom/android/camera/SensorStateManager;F)F

    move-result p1

    .line 473
    :cond_1
    iget-object v0, p0, Lcom/android/camera/SensorStateManager$3;->this$0:Lcom/android/camera/SensorStateManager;

    invoke-static {v0}, Lcom/android/camera/SensorStateManager;->access$1200(Lcom/android/camera/SensorStateManager;)F

    move-result v0

    cmpl-float v0, p1, v0

    if-eqz v0, :cond_3

    .line 474
    iget-object v0, p0, Lcom/android/camera/SensorStateManager$3;->this$0:Lcom/android/camera/SensorStateManager;

    invoke-static {v0}, Lcom/android/camera/SensorStateManager;->access$1200(Lcom/android/camera/SensorStateManager;)F

    move-result v0

    sub-float/2addr v0, p1

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    const/high16 v1, 0x40400000    # 3.0f

    cmpl-float v0, v0, v1

    if-lez v0, :cond_2

    .line 475
    invoke-direct {p0}, Lcom/android/camera/SensorStateManager$3;->clearFilter()V

    .line 477
    :cond_2
    iget-object v0, p0, Lcom/android/camera/SensorStateManager$3;->this$0:Lcom/android/camera/SensorStateManager;

    invoke-static {v0, p1}, Lcom/android/camera/SensorStateManager;->access$1202(Lcom/android/camera/SensorStateManager;F)F

    .line 478
    const-string p1, "SensorStateManager"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "SensorEventListenerImpl TYPE_ACCELEROMETER mOrientation="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/android/camera/SensorStateManager$3;->this$0:Lcom/android/camera/SensorStateManager;

    invoke-static {v1}, Lcom/android/camera/SensorStateManager;->access$1200(Lcom/android/camera/SensorStateManager;)F

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v1, " mIsLying="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/android/camera/SensorStateManager$3;->this$0:Lcom/android/camera/SensorStateManager;

    .line 479
    invoke-static {v1}, Lcom/android/camera/SensorStateManager;->access$900(Lcom/android/camera/SensorStateManager;)Z

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 478
    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 481
    iget-object p1, p0, Lcom/android/camera/SensorStateManager$3;->this$0:Lcom/android/camera/SensorStateManager;

    invoke-static {p1}, Lcom/android/camera/SensorStateManager;->access$100(Lcom/android/camera/SensorStateManager;)Lcom/android/camera/SensorStateManager$SensorStateListener;

    move-result-object p1

    if-eqz p1, :cond_3

    .line 482
    iget-object p1, p0, Lcom/android/camera/SensorStateManager$3;->this$0:Lcom/android/camera/SensorStateManager;

    invoke-static {p1}, Lcom/android/camera/SensorStateManager;->access$100(Lcom/android/camera/SensorStateManager;)Lcom/android/camera/SensorStateManager$SensorStateListener;

    move-result-object p1

    iget-object v0, p0, Lcom/android/camera/SensorStateManager$3;->this$0:Lcom/android/camera/SensorStateManager;

    invoke-static {v0}, Lcom/android/camera/SensorStateManager;->access$1200(Lcom/android/camera/SensorStateManager;)F

    move-result v0

    iget-object v1, p0, Lcom/android/camera/SensorStateManager$3;->this$0:Lcom/android/camera/SensorStateManager;

    invoke-static {v1}, Lcom/android/camera/SensorStateManager;->access$900(Lcom/android/camera/SensorStateManager;)Z

    move-result v1

    invoke-interface {p1, v0, v1}, Lcom/android/camera/SensorStateManager$SensorStateListener;->onDeviceOrientationChanged(FZ)V

    .line 485
    :cond_3
    return-void
.end method
