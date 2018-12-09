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

    .line 384
    iput-object p1, p0, Lcom/android/camera/SensorStateManager$OrientationSensorEventListenerImpl;->this$0:Lcom/android/camera/SensorStateManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAccuracyChanged(Landroid/hardware/Sensor;I)V
    .locals 2

    .line 429
    const-string p1, "SensorStateManager"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onAccuracyChanged accuracy="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 430
    return-void
.end method

.method public onSensorChanged(Landroid/hardware/SensorEvent;)V
    .locals 12

    .line 387
    iget-object v0, p0, Lcom/android/camera/SensorStateManager$OrientationSensorEventListenerImpl;->this$0:Lcom/android/camera/SensorStateManager;

    invoke-static {v0}, Lcom/android/camera/SensorStateManager;->access$100(Lcom/android/camera/SensorStateManager;)Lcom/android/camera/SensorStateManager$SensorStateListener;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    .line 388
    :cond_0
    const/high16 v0, -0x40800000    # -1.0f

    .line 390
    iget-object v1, p1, Landroid/hardware/SensorEvent;->values:[F

    const/4 v2, 0x1

    aget v1, v1, v2

    .line 391
    iget-object p1, p1, Landroid/hardware/SensorEvent;->values:[F

    const/4 v3, 0x2

    aget p1, p1, v3

    .line 392
    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v4

    .line 393
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result v5

    .line 395
    iget-object v6, p0, Lcom/android/camera/SensorStateManager$OrientationSensorEventListenerImpl;->this$0:Lcom/android/camera/SensorStateManager;

    invoke-static {v6}, Lcom/android/camera/SensorStateManager;->access$900(Lcom/android/camera/SensorStateManager;)Z

    move-result v6

    const/4 v7, 0x0

    if-eqz v6, :cond_1

    const/4 v6, 0x5

    goto :goto_0

    .line 396
    :cond_1
    move v6, v7

    :goto_0
    const/16 v8, 0x1a

    add-int/2addr v8, v6

    .line 397
    rsub-int v6, v6, 0x99

    .line 398
    int-to-float v8, v8

    cmpg-float v9, v4, v8

    if-lez v9, :cond_2

    int-to-float v9, v6

    cmpl-float v9, v4, v9

    if-ltz v9, :cond_3

    :cond_2
    cmpg-float v8, v5, v8

    if-lez v8, :cond_4

    int-to-float v6, v6

    cmpl-float v6, v5, v6

    if-ltz v6, :cond_3

    goto :goto_1

    .line 400
    :cond_3
    move v6, v7

    goto :goto_2

    .line 398
    :cond_4
    :goto_1
    nop

    .line 400
    move v6, v2

    :goto_2
    const/high16 v8, 0x42b40000    # 90.0f

    const/4 v9, 0x0

    if-eqz v6, :cond_8

    sub-float v10, v4, v5

    invoke-static {v10}, Ljava/lang/Math;->abs(F)F

    move-result v10

    const/high16 v11, 0x3f800000    # 1.0f

    cmpl-float v10, v10, v11

    if-lez v10, :cond_8

    .line 401
    cmpl-float v10, v4, v5

    if-lez v10, :cond_6

    .line 402
    cmpg-float v0, v1, v9

    if-gez v0, :cond_5

    .line 409
    move v0, v9

    goto :goto_3

    .line 402
    :cond_5
    const/high16 v0, 0x43340000    # 180.0f

    goto :goto_3

    .line 403
    :cond_6
    cmpg-float v1, v4, v5

    if-gez v1, :cond_8

    .line 404
    cmpg-float v0, p1, v9

    if-gez v0, :cond_7

    .line 409
    move v0, v8

    goto :goto_3

    .line 404
    :cond_7
    const/high16 v0, 0x43870000    # 270.0f

    .line 409
    :cond_8
    :goto_3
    sub-float/2addr v5, v8

    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    move-result v1

    invoke-static {}, Lcom/android/camera/SensorStateManager;->access$1000()I

    move-result v4

    int-to-float v4, v4

    cmpg-float v1, v1, v4

    if-gez v1, :cond_a

    .line 410
    iget-object v1, p0, Lcom/android/camera/SensorStateManager$OrientationSensorEventListenerImpl;->this$0:Lcom/android/camera/SensorStateManager;

    cmpg-float p1, p1, v9

    if-gez p1, :cond_9

    goto :goto_4

    :cond_9
    move v2, v3

    :goto_4
    invoke-static {v1, v2}, Lcom/android/camera/SensorStateManager;->access$1100(Lcom/android/camera/SensorStateManager;I)V

    goto :goto_5

    .line 412
    :cond_a
    iget-object p1, p0, Lcom/android/camera/SensorStateManager$OrientationSensorEventListenerImpl;->this$0:Lcom/android/camera/SensorStateManager;

    invoke-static {p1, v7}, Lcom/android/camera/SensorStateManager;->access$1100(Lcom/android/camera/SensorStateManager;I)V

    .line 415
    :goto_5
    iget-object p1, p0, Lcom/android/camera/SensorStateManager$OrientationSensorEventListenerImpl;->this$0:Lcom/android/camera/SensorStateManager;

    invoke-static {p1}, Lcom/android/camera/SensorStateManager;->access$900(Lcom/android/camera/SensorStateManager;)Z

    move-result p1

    if-ne v6, p1, :cond_b

    if-eqz v6, :cond_d

    iget-object p1, p0, Lcom/android/camera/SensorStateManager$OrientationSensorEventListenerImpl;->this$0:Lcom/android/camera/SensorStateManager;

    invoke-static {p1}, Lcom/android/camera/SensorStateManager;->access$1200(Lcom/android/camera/SensorStateManager;)F

    move-result p1

    cmpl-float p1, v0, p1

    if-eqz p1, :cond_d

    .line 416
    :cond_b
    iget-object p1, p0, Lcom/android/camera/SensorStateManager$OrientationSensorEventListenerImpl;->this$0:Lcom/android/camera/SensorStateManager;

    invoke-static {p1, v6}, Lcom/android/camera/SensorStateManager;->access$902(Lcom/android/camera/SensorStateManager;Z)Z

    .line 417
    iget-object p1, p0, Lcom/android/camera/SensorStateManager$OrientationSensorEventListenerImpl;->this$0:Lcom/android/camera/SensorStateManager;

    invoke-static {p1}, Lcom/android/camera/SensorStateManager;->access$900(Lcom/android/camera/SensorStateManager;)Z

    move-result p1

    if-eqz p1, :cond_c

    .line 418
    iget-object p1, p0, Lcom/android/camera/SensorStateManager$OrientationSensorEventListenerImpl;->this$0:Lcom/android/camera/SensorStateManager;

    invoke-static {p1, v0}, Lcom/android/camera/SensorStateManager;->access$1202(Lcom/android/camera/SensorStateManager;F)F

    .line 419
    :cond_c
    const-string p1, "SensorStateManager"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "SensorEventListenerImpl TYPE_ORIENTATION mOrientation="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/android/camera/SensorStateManager$OrientationSensorEventListenerImpl;->this$0:Lcom/android/camera/SensorStateManager;

    invoke-static {v1}, Lcom/android/camera/SensorStateManager;->access$1200(Lcom/android/camera/SensorStateManager;)F

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v1, " mIsLying="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/android/camera/SensorStateManager$OrientationSensorEventListenerImpl;->this$0:Lcom/android/camera/SensorStateManager;

    .line 420
    invoke-static {v1}, Lcom/android/camera/SensorStateManager;->access$900(Lcom/android/camera/SensorStateManager;)Z

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 419
    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 421
    iget-object p1, p0, Lcom/android/camera/SensorStateManager$OrientationSensorEventListenerImpl;->this$0:Lcom/android/camera/SensorStateManager;

    invoke-static {p1}, Lcom/android/camera/SensorStateManager;->access$100(Lcom/android/camera/SensorStateManager;)Lcom/android/camera/SensorStateManager$SensorStateListener;

    move-result-object p1

    if-eqz p1, :cond_d

    .line 422
    iget-object p1, p0, Lcom/android/camera/SensorStateManager$OrientationSensorEventListenerImpl;->this$0:Lcom/android/camera/SensorStateManager;

    invoke-static {p1}, Lcom/android/camera/SensorStateManager;->access$100(Lcom/android/camera/SensorStateManager;)Lcom/android/camera/SensorStateManager$SensorStateListener;

    move-result-object p1

    iget-object v0, p0, Lcom/android/camera/SensorStateManager$OrientationSensorEventListenerImpl;->this$0:Lcom/android/camera/SensorStateManager;

    invoke-static {v0}, Lcom/android/camera/SensorStateManager;->access$1200(Lcom/android/camera/SensorStateManager;)F

    move-result v0

    iget-object v1, p0, Lcom/android/camera/SensorStateManager$OrientationSensorEventListenerImpl;->this$0:Lcom/android/camera/SensorStateManager;

    invoke-static {v1}, Lcom/android/camera/SensorStateManager;->access$900(Lcom/android/camera/SensorStateManager;)Z

    move-result v1

    invoke-interface {p1, v0, v1}, Lcom/android/camera/SensorStateManager$SensorStateListener;->onDeviceOrientationChanged(FZ)V

    .line 425
    :cond_d
    return-void
.end method
