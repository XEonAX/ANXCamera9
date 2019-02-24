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

    .line 520
    iput-object p1, p0, Lcom/android/camera/SensorStateManager$3;->this$0:Lcom/android/camera/SensorStateManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 527
    const/4 p1, 0x3

    new-array v0, p1, [F

    iput-object v0, p0, Lcom/android/camera/SensorStateManager$3;->firstFilter:[F

    .line 528
    new-array p1, p1, [F

    iput-object p1, p0, Lcom/android/camera/SensorStateManager$3;->finalFilter:[F

    return-void
.end method

.method private clearFilter()V
    .locals 3

    .line 578
    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Lcom/android/camera/SensorStateManager$3;->firstFilter:[F

    array-length v1, v1

    if-ge v0, v1, :cond_0

    .line 579
    iget-object v1, p0, Lcom/android/camera/SensorStateManager$3;->firstFilter:[F

    const/4 v2, 0x0

    aput v2, v1, v0

    .line 580
    iget-object v1, p0, Lcom/android/camera/SensorStateManager$3;->finalFilter:[F

    aput v2, v1, v0

    .line 578
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 582
    :cond_0
    return-void
.end method


# virtual methods
.method public onAccuracyChanged(Landroid/hardware/Sensor;I)V
    .locals 2

    .line 586
    const-string p1, "SensorStateManager"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onAccuracyChanged accuracy="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 587
    return-void
.end method

.method public onSensorChanged(Landroid/hardware/SensorEvent;)V
    .locals 9

    .line 532
    iget-object v0, p0, Lcom/android/camera/SensorStateManager$3;->this$0:Lcom/android/camera/SensorStateManager;

    invoke-static {v0}, Lcom/android/camera/SensorStateManager;->access$000(Lcom/android/camera/SensorStateManager;)Lcom/android/camera/SensorStateManager$SensorStateListener;

    move-result-object v0

    .line 533
    if-nez v0, :cond_0

    .line 534
    return-void

    .line 539
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

    .line 540
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

    .line 541
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

    .line 542
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

    .line 543
    iget-object v1, p0, Lcom/android/camera/SensorStateManager$3;->finalFilter:[F

    iget-object v2, p0, Lcom/android/camera/SensorStateManager$3;->finalFilter:[F

    aget v2, v2, v5

    mul-float/2addr v2, v4

    iget-object v6, p0, Lcom/android/camera/SensorStateManager$3;->firstFilter:[F

    aget v6, v6, v5

    mul-float/2addr v6, v8

    add-float/2addr v2, v6

    aput v2, v1, v5

    .line 544
    iget-object v1, p0, Lcom/android/camera/SensorStateManager$3;->finalFilter:[F

    iget-object v2, p0, Lcom/android/camera/SensorStateManager$3;->finalFilter:[F

    aget v2, v2, v7

    mul-float/2addr v4, v2

    iget-object v2, p0, Lcom/android/camera/SensorStateManager$3;->firstFilter:[F

    aget v2, v2, v7

    mul-float/2addr v8, v2

    add-float/2addr v4, v8

    aput v4, v1, v7

    .line 545
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

    iget-object v4, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v4, v4, v7

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 548
    const/high16 v1, -0x40800000    # -1.0f

    .line 550
    iget-object v2, p0, Lcom/android/camera/SensorStateManager$3;->finalFilter:[F

    aget v2, v2, v3

    neg-float v2, v2

    .line 551
    iget-object v3, p0, Lcom/android/camera/SensorStateManager$3;->finalFilter:[F

    aget v3, v3, v5

    neg-float v3, v3

    .line 552
    iget-object v4, p0, Lcom/android/camera/SensorStateManager$3;->finalFilter:[F

    aget v4, v4, v7

    neg-float v4, v4

    .line 553
    mul-float v5, v2, v2

    mul-float v6, v3, v3

    add-float/2addr v5, v6

    .line 555
    const/high16 v6, 0x40800000    # 4.0f

    mul-float/2addr v5, v6

    mul-float/2addr v4, v4

    cmpl-float v4, v5, v4

    if-ltz v4, :cond_1

    .line 556
    const v1, 0x42652ee1

    .line 557
    neg-float v3, v3

    float-to-double v3, v3

    float-to-double v5, v2

    invoke-static {v3, v4, v5, v6}, Ljava/lang/Math;->atan2(DD)D

    move-result-wide v2

    double-to-float v2, v2

    mul-float/2addr v2, v1

    .line 558
    const/high16 v1, 0x42b40000    # 90.0f

    sub-float/2addr v1, v2

    .line 560
    iget-object v2, p0, Lcom/android/camera/SensorStateManager$3;->this$0:Lcom/android/camera/SensorStateManager;

    invoke-static {v2, v1}, Lcom/android/camera/SensorStateManager;->access$1300(Lcom/android/camera/SensorStateManager;F)F

    move-result v1

    .line 563
    :cond_1
    iget-object v2, p0, Lcom/android/camera/SensorStateManager$3;->this$0:Lcom/android/camera/SensorStateManager;

    invoke-static {v2}, Lcom/android/camera/SensorStateManager;->access$1200(Lcom/android/camera/SensorStateManager;)F

    move-result v2

    cmpl-float v2, v1, v2

    if-eqz v2, :cond_3

    .line 564
    iget-object v2, p0, Lcom/android/camera/SensorStateManager$3;->this$0:Lcom/android/camera/SensorStateManager;

    invoke-static {v2}, Lcom/android/camera/SensorStateManager;->access$1200(Lcom/android/camera/SensorStateManager;)F

    move-result v2

    sub-float/2addr v2, v1

    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v2

    const/high16 v3, 0x40400000    # 3.0f

    cmpl-float v2, v2, v3

    if-lez v2, :cond_2

    .line 565
    invoke-direct {p0}, Lcom/android/camera/SensorStateManager$3;->clearFilter()V

    .line 567
    :cond_2
    iget-object v2, p0, Lcom/android/camera/SensorStateManager$3;->this$0:Lcom/android/camera/SensorStateManager;

    invoke-static {v2, v1}, Lcom/android/camera/SensorStateManager;->access$1202(Lcom/android/camera/SensorStateManager;F)F

    .line 568
    const-string v1, "SensorStateManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "SensorEventListenerImpl TYPE_ACCELEROMETER mOrientation="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/android/camera/SensorStateManager$3;->this$0:Lcom/android/camera/SensorStateManager;

    invoke-static {v3}, Lcom/android/camera/SensorStateManager;->access$1200(Lcom/android/camera/SensorStateManager;)F

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v3, " mIsLying="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/android/camera/SensorStateManager$3;->this$0:Lcom/android/camera/SensorStateManager;

    .line 569
    invoke-static {v3}, Lcom/android/camera/SensorStateManager;->access$900(Lcom/android/camera/SensorStateManager;)Z

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 568
    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 570
    iget-object v1, p0, Lcom/android/camera/SensorStateManager$3;->this$0:Lcom/android/camera/SensorStateManager;

    invoke-static {v1}, Lcom/android/camera/SensorStateManager;->access$1200(Lcom/android/camera/SensorStateManager;)F

    move-result v1

    iget-object v2, p0, Lcom/android/camera/SensorStateManager$3;->this$0:Lcom/android/camera/SensorStateManager;

    invoke-static {v2}, Lcom/android/camera/SensorStateManager;->access$900(Lcom/android/camera/SensorStateManager;)Z

    move-result v2

    invoke-interface {v0, v1, v2}, Lcom/android/camera/SensorStateManager$SensorStateListener;->onDeviceOrientationChanged(FZ)V

    .line 572
    :cond_3
    invoke-interface {v0}, Lcom/android/camera/SensorStateManager$SensorStateListener;->isWorking()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 573
    invoke-interface {v0, p1}, Lcom/android/camera/SensorStateManager$SensorStateListener;->onSensorChanged(Landroid/hardware/SensorEvent;)V

    .line 575
    :cond_4
    return-void
.end method
