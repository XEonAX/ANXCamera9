.class Lcom/android/camera/SensorStateManager$1;
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


# instance fields
.field final synthetic this$0:Lcom/android/camera/SensorStateManager;


# direct methods
.method constructor <init>(Lcom/android/camera/SensorStateManager;)V
    .locals 0

    .line 387
    iput-object p1, p0, Lcom/android/camera/SensorStateManager$1;->this$0:Lcom/android/camera/SensorStateManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAccuracyChanged(Landroid/hardware/Sensor;I)V
    .locals 0

    .line 432
    return-void
.end method

.method public onSensorChanged(Landroid/hardware/SensorEvent;)V
    .locals 7

    .line 390
    iget-object v0, p0, Lcom/android/camera/SensorStateManager$1;->this$0:Lcom/android/camera/SensorStateManager;

    invoke-static {v0}, Lcom/android/camera/SensorStateManager;->access$000(Lcom/android/camera/SensorStateManager;)Lcom/android/camera/SensorStateManager$SensorStateListener;

    move-result-object v0

    .line 391
    if-eqz v0, :cond_8

    invoke-interface {v0}, Lcom/android/camera/SensorStateManager$SensorStateListener;->isWorking()Z

    move-result v1

    if-nez v1, :cond_0

    goto/16 :goto_1

    .line 395
    :cond_0
    iget-wide v1, p1, Landroid/hardware/SensorEvent;->timestamp:J

    iget-object v3, p0, Lcom/android/camera/SensorStateManager$1;->this$0:Lcom/android/camera/SensorStateManager;

    invoke-static {v3}, Lcom/android/camera/SensorStateManager;->access$100(Lcom/android/camera/SensorStateManager;)J

    move-result-wide v3

    sub-long/2addr v1, v3

    invoke-static {v1, v2}, Ljava/lang/Math;->abs(J)J

    move-result-wide v1

    .line 396
    const-wide/32 v3, 0x5f5e100

    cmp-long v3, v1, v3

    if-gez v3, :cond_1

    .line 397
    return-void

    .line 400
    :cond_1
    iget-object v3, p0, Lcom/android/camera/SensorStateManager$1;->this$0:Lcom/android/camera/SensorStateManager;

    invoke-static {v3}, Lcom/android/camera/SensorStateManager;->access$100(Lcom/android/camera/SensorStateManager;)J

    move-result-wide v3

    const-wide/16 v5, 0x0

    cmp-long v3, v3, v5

    if-eqz v3, :cond_7

    const-wide/32 v3, 0x3b9aca00

    cmp-long v3, v1, v3

    if-lez v3, :cond_2

    goto/16 :goto_0

    .line 405
    :cond_2
    long-to-float v1, v1

    const v2, 0x3089705f    # 1.0E-9f

    mul-float/2addr v1, v2

    .line 406
    iget-object v2, p1, Landroid/hardware/SensorEvent;->values:[F

    const/4 v3, 0x0

    aget v2, v2, v3

    iget-object v4, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v3, v4, v3

    mul-float/2addr v2, v3

    iget-object v3, p1, Landroid/hardware/SensorEvent;->values:[F

    const/4 v4, 0x1

    aget v3, v3, v4

    iget-object v5, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v4, v5, v4

    mul-float/2addr v3, v4

    add-float/2addr v2, v3

    iget-object v3, p1, Landroid/hardware/SensorEvent;->values:[F

    const/4 v4, 0x2

    aget v3, v3, v4

    iget-object v5, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v4, v5, v4

    mul-float/2addr v3, v4

    add-float/2addr v2, v3

    float-to-double v2, v2

    invoke-static {v2, v3}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v2

    .line 409
    iget-object v4, p0, Lcom/android/camera/SensorStateManager$1;->this$0:Lcom/android/camera/SensorStateManager;

    iget-wide v5, p1, Landroid/hardware/SensorEvent;->timestamp:J

    invoke-static {v4, v5, v6}, Lcom/android/camera/SensorStateManager;->access$102(Lcom/android/camera/SensorStateManager;J)J

    .line 411
    invoke-static {}, Lcom/android/camera/SensorStateManager;->access$200()D

    move-result-wide v4

    cmpg-double v4, v4, v2

    if-gez v4, :cond_3

    .line 412
    iget-object v4, p0, Lcom/android/camera/SensorStateManager$1;->this$0:Lcom/android/camera/SensorStateManager;

    invoke-static {v4}, Lcom/android/camera/SensorStateManager;->access$300(Lcom/android/camera/SensorStateManager;)V

    .line 414
    :cond_3
    iget-object v4, p0, Lcom/android/camera/SensorStateManager$1;->this$0:Lcom/android/camera/SensorStateManager;

    iget-object v5, p0, Lcom/android/camera/SensorStateManager$1;->this$0:Lcom/android/camera/SensorStateManager;

    invoke-static {v5}, Lcom/android/camera/SensorStateManager;->access$404(Lcom/android/camera/SensorStateManager;)I

    move-result v5

    iget-object v6, p0, Lcom/android/camera/SensorStateManager$1;->this$0:Lcom/android/camera/SensorStateManager;

    invoke-static {v6}, Lcom/android/camera/SensorStateManager;->access$500(Lcom/android/camera/SensorStateManager;)[D

    move-result-object v6

    array-length v6, v6

    rem-int/2addr v5, v6

    invoke-static {v4, v5}, Lcom/android/camera/SensorStateManager;->access$402(Lcom/android/camera/SensorStateManager;I)I

    .line 415
    iget-object v4, p0, Lcom/android/camera/SensorStateManager$1;->this$0:Lcom/android/camera/SensorStateManager;

    invoke-static {v4}, Lcom/android/camera/SensorStateManager;->access$500(Lcom/android/camera/SensorStateManager;)[D

    move-result-object v4

    iget-object v5, p0, Lcom/android/camera/SensorStateManager$1;->this$0:Lcom/android/camera/SensorStateManager;

    invoke-static {v5}, Lcom/android/camera/SensorStateManager;->access$400(Lcom/android/camera/SensorStateManager;)I

    move-result v5

    aput-wide v2, v4, v5

    .line 416
    const-wide v4, 0x3fa99999a0000000L    # 0.05000000074505806

    cmpg-double v4, v2, v4

    if-gez v4, :cond_4

    .line 417
    return-void

    .line 419
    :cond_4
    iget-object v4, p0, Lcom/android/camera/SensorStateManager$1;->this$0:Lcom/android/camera/SensorStateManager;

    float-to-double v5, v1

    mul-double/2addr v2, v5

    invoke-static {v4, v2, v3}, Lcom/android/camera/SensorStateManager;->access$618(Lcom/android/camera/SensorStateManager;D)D

    .line 420
    iget-object v1, p0, Lcom/android/camera/SensorStateManager$1;->this$0:Lcom/android/camera/SensorStateManager;

    invoke-static {v1}, Lcom/android/camera/SensorStateManager;->access$600(Lcom/android/camera/SensorStateManager;)D

    move-result-wide v1

    const-wide v3, 0x3ff0c152382d7365L    # 1.0471975511965976

    cmpl-double v1, v1, v3

    if-lez v1, :cond_5

    .line 421
    iget-object v1, p0, Lcom/android/camera/SensorStateManager$1;->this$0:Lcom/android/camera/SensorStateManager;

    const-wide/16 v2, 0x0

    invoke-static {v1, v2, v3}, Lcom/android/camera/SensorStateManager;->access$602(Lcom/android/camera/SensorStateManager;D)D

    .line 422
    iget-object v1, p0, Lcom/android/camera/SensorStateManager$1;->this$0:Lcom/android/camera/SensorStateManager;

    const-wide v2, 0x40c3880000000000L    # 10000.0

    invoke-static {v1, v2, v3}, Lcom/android/camera/SensorStateManager;->access$700(Lcom/android/camera/SensorStateManager;D)V

    .line 424
    :cond_5
    invoke-interface {v0}, Lcom/android/camera/SensorStateManager$SensorStateListener;->isWorking()Z

    move-result v1

    if-eqz v1, :cond_6

    .line 425
    invoke-interface {v0, p1}, Lcom/android/camera/SensorStateManager$SensorStateListener;->onSensorChanged(Landroid/hardware/SensorEvent;)V

    .line 427
    :cond_6
    return-void

    .line 401
    :cond_7
    :goto_0
    iget-object v0, p0, Lcom/android/camera/SensorStateManager$1;->this$0:Lcom/android/camera/SensorStateManager;

    iget-wide v1, p1, Landroid/hardware/SensorEvent;->timestamp:J

    invoke-static {v0, v1, v2}, Lcom/android/camera/SensorStateManager;->access$102(Lcom/android/camera/SensorStateManager;J)J

    .line 402
    return-void

    .line 392
    :cond_8
    :goto_1
    return-void
.end method
