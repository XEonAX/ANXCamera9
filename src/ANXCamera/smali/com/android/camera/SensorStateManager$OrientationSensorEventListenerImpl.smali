.class Lcom/android/camera/SensorStateManager$OrientationSensorEventListenerImpl;
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
    name = "OrientationSensorEventListenerImpl"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/SensorStateManager;


# direct methods
.method constructor <init>(Lcom/android/camera/SensorStateManager;)V
    .locals 0

    .line 469
    iput-object p1, p0, Lcom/android/camera/SensorStateManager$OrientationSensorEventListenerImpl;->this$0:Lcom/android/camera/SensorStateManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAccuracyChanged(Landroid/hardware/Sensor;I)V
    .locals 2

    .line 516
    const-string p1, "SensorStateManager"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onAccuracyChanged accuracy="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 517
    return-void
.end method

.method public onSensorChanged(Landroid/hardware/SensorEvent;)V
    .locals 13

    .line 472
    iget-object v0, p0, Lcom/android/camera/SensorStateManager$OrientationSensorEventListenerImpl;->this$0:Lcom/android/camera/SensorStateManager;

    invoke-static {v0}, Lcom/android/camera/SensorStateManager;->access$000(Lcom/android/camera/SensorStateManager;)Lcom/android/camera/SensorStateManager$SensorStateListener;

    move-result-object v0

    .line 473
    if-nez v0, :cond_0

    .line 474
    return-void

    .line 476
    :cond_0
    const/high16 v1, -0x40800000    # -1.0f

    .line 478
    iget-object v2, p1, Landroid/hardware/SensorEvent;->values:[F

    const/4 v3, 0x1

    aget v2, v2, v3

    .line 479
    iget-object p1, p1, Landroid/hardware/SensorEvent;->values:[F

    const/4 v4, 0x2

    aget p1, p1, v4

    .line 480
    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v5

    .line 481
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result v6

    .line 483
    iget-object v7, p0, Lcom/android/camera/SensorStateManager$OrientationSensorEventListenerImpl;->this$0:Lcom/android/camera/SensorStateManager;

    invoke-static {v7}, Lcom/android/camera/SensorStateManager;->access$900(Lcom/android/camera/SensorStateManager;)Z

    move-result v7

    const/4 v8, 0x0

    if-eqz v7, :cond_1

    const/4 v7, 0x5

    goto :goto_0

    .line 484
    :cond_1
    move v7, v8

    :goto_0
    const/16 v9, 0x1a

    add-int/2addr v9, v7

    .line 485
    rsub-int v7, v7, 0x99

    .line 486
    int-to-float v9, v9

    cmpg-float v10, v5, v9

    if-lez v10, :cond_2

    int-to-float v10, v7

    cmpl-float v10, v5, v10

    if-ltz v10, :cond_3

    :cond_2
    cmpg-float v9, v6, v9

    if-lez v9, :cond_4

    int-to-float v7, v7

    cmpl-float v7, v6, v7

    if-ltz v7, :cond_3

    goto :goto_1

    .line 488
    :cond_3
    move v7, v8

    goto :goto_2

    .line 486
    :cond_4
    :goto_1
    nop

    .line 488
    move v7, v3

    :goto_2
    const/high16 v9, 0x42b40000    # 90.0f

    const/4 v10, 0x0

    if-eqz v7, :cond_8

    sub-float v11, v5, v6

    invoke-static {v11}, Ljava/lang/Math;->abs(F)F

    move-result v11

    const/high16 v12, 0x3f800000    # 1.0f

    cmpl-float v11, v11, v12

    if-lez v11, :cond_8

    .line 489
    cmpl-float v11, v5, v6

    if-lez v11, :cond_6

    .line 490
    cmpg-float v1, v2, v10

    if-gez v1, :cond_5

    .line 497
    move v1, v10

    goto :goto_3

    .line 490
    :cond_5
    const/high16 v1, 0x43340000    # 180.0f

    goto :goto_3

    .line 491
    :cond_6
    cmpg-float v2, v5, v6

    if-gez v2, :cond_8

    .line 492
    cmpg-float v1, p1, v10

    if-gez v1, :cond_7

    .line 497
    move v1, v9

    goto :goto_3

    .line 492
    :cond_7
    const/high16 v1, 0x43870000    # 270.0f

    .line 497
    :cond_8
    :goto_3
    sub-float/2addr v6, v9

    invoke-static {v6}, Ljava/lang/Math;->abs(F)F

    move-result v2

    invoke-static {}, Lcom/android/camera/SensorStateManager;->access$1000()I

    move-result v5

    int-to-float v5, v5

    cmpg-float v2, v2, v5

    if-gez v2, :cond_a

    .line 498
    iget-object v2, p0, Lcom/android/camera/SensorStateManager$OrientationSensorEventListenerImpl;->this$0:Lcom/android/camera/SensorStateManager;

    cmpg-float p1, p1, v10

    if-gez p1, :cond_9

    goto :goto_4

    :cond_9
    move v3, v4

    :goto_4
    invoke-static {v2, v3}, Lcom/android/camera/SensorStateManager;->access$1100(Lcom/android/camera/SensorStateManager;I)V

    goto :goto_5

    .line 500
    :cond_a
    iget-object p1, p0, Lcom/android/camera/SensorStateManager$OrientationSensorEventListenerImpl;->this$0:Lcom/android/camera/SensorStateManager;

    invoke-static {p1, v8}, Lcom/android/camera/SensorStateManager;->access$1100(Lcom/android/camera/SensorStateManager;I)V

    .line 503
    :goto_5
    iget-object p1, p0, Lcom/android/camera/SensorStateManager$OrientationSensorEventListenerImpl;->this$0:Lcom/android/camera/SensorStateManager;

    invoke-static {p1}, Lcom/android/camera/SensorStateManager;->access$900(Lcom/android/camera/SensorStateManager;)Z

    move-result p1

    if-ne v7, p1, :cond_b

    if-eqz v7, :cond_d

    iget-object p1, p0, Lcom/android/camera/SensorStateManager$OrientationSensorEventListenerImpl;->this$0:Lcom/android/camera/SensorStateManager;

    invoke-static {p1}, Lcom/android/camera/SensorStateManager;->access$1200(Lcom/android/camera/SensorStateManager;)F

    move-result p1

    cmpl-float p1, v1, p1

    if-eqz p1, :cond_d

    .line 504
    :cond_b
    iget-object p1, p0, Lcom/android/camera/SensorStateManager$OrientationSensorEventListenerImpl;->this$0:Lcom/android/camera/SensorStateManager;

    invoke-static {p1, v7}, Lcom/android/camera/SensorStateManager;->access$902(Lcom/android/camera/SensorStateManager;Z)Z

    .line 505
    iget-object p1, p0, Lcom/android/camera/SensorStateManager$OrientationSensorEventListenerImpl;->this$0:Lcom/android/camera/SensorStateManager;

    invoke-static {p1}, Lcom/android/camera/SensorStateManager;->access$900(Lcom/android/camera/SensorStateManager;)Z

    move-result p1

    if-eqz p1, :cond_c

    .line 506
    iget-object p1, p0, Lcom/android/camera/SensorStateManager$OrientationSensorEventListenerImpl;->this$0:Lcom/android/camera/SensorStateManager;

    invoke-static {p1, v1}, Lcom/android/camera/SensorStateManager;->access$1202(Lcom/android/camera/SensorStateManager;F)F

    .line 508
    :cond_c
    const-string p1, "SensorStateManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "SensorEventListenerImpl TYPE_ORIENTATION mOrientation="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/android/camera/SensorStateManager$OrientationSensorEventListenerImpl;->this$0:Lcom/android/camera/SensorStateManager;

    invoke-static {v2}, Lcom/android/camera/SensorStateManager;->access$1200(Lcom/android/camera/SensorStateManager;)F

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v2, " mIsLying="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/android/camera/SensorStateManager$OrientationSensorEventListenerImpl;->this$0:Lcom/android/camera/SensorStateManager;

    .line 509
    invoke-static {v2}, Lcom/android/camera/SensorStateManager;->access$900(Lcom/android/camera/SensorStateManager;)Z

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 508
    invoke-static {p1, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 510
    iget-object p1, p0, Lcom/android/camera/SensorStateManager$OrientationSensorEventListenerImpl;->this$0:Lcom/android/camera/SensorStateManager;

    invoke-static {p1}, Lcom/android/camera/SensorStateManager;->access$1200(Lcom/android/camera/SensorStateManager;)F

    move-result p1

    iget-object v1, p0, Lcom/android/camera/SensorStateManager$OrientationSensorEventListenerImpl;->this$0:Lcom/android/camera/SensorStateManager;

    invoke-static {v1}, Lcom/android/camera/SensorStateManager;->access$900(Lcom/android/camera/SensorStateManager;)Z

    move-result v1

    invoke-interface {v0, p1, v1}, Lcom/android/camera/SensorStateManager$SensorStateListener;->onDeviceOrientationChanged(FZ)V

    .line 512
    :cond_d
    return-void
.end method
