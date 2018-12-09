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

    .line 313
    iput-object p1, p0, Lcom/android/camera/SensorStateManager$1;->this$0:Lcom/android/camera/SensorStateManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAccuracyChanged(Landroid/hardware/Sensor;I)V
    .locals 0

    .line 351
    return-void
.end method

.method public onSensorChanged(Landroid/hardware/SensorEvent;)V
    .locals 6

    .line 316
    iget-wide v0, p1, Landroid/hardware/SensorEvent;->timestamp:J

    iget-object v2, p0, Lcom/android/camera/SensorStateManager$1;->this$0:Lcom/android/camera/SensorStateManager;

    invoke-static {v2}, Lcom/android/camera/SensorStateManager;->access$000(Lcom/android/camera/SensorStateManager;)J

    move-result-wide v2

    sub-long/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->abs(J)J

    move-result-wide v0

    .line 317
    iget-object v2, p0, Lcom/android/camera/SensorStateManager$1;->this$0:Lcom/android/camera/SensorStateManager;

    invoke-static {v2}, Lcom/android/camera/SensorStateManager;->access$100(Lcom/android/camera/SensorStateManager;)Lcom/android/camera/SensorStateManager$SensorStateListener;

    move-result-object v2

    if-eqz v2, :cond_6

    iget-object v2, p0, Lcom/android/camera/SensorStateManager$1;->this$0:Lcom/android/camera/SensorStateManager;

    .line 318
    invoke-static {v2}, Lcom/android/camera/SensorStateManager;->access$100(Lcom/android/camera/SensorStateManager;)Lcom/android/camera/SensorStateManager$SensorStateListener;

    move-result-object v2

    invoke-interface {v2}, Lcom/android/camera/SensorStateManager$SensorStateListener;->isWorking()Z

    move-result v2

    if-eqz v2, :cond_6

    const-wide/32 v2, 0x5f5e100

    cmp-long v2, v0, v2

    if-gez v2, :cond_0

    goto/16 :goto_1

    .line 322
    :cond_0
    iget-object v2, p0, Lcom/android/camera/SensorStateManager$1;->this$0:Lcom/android/camera/SensorStateManager;

    invoke-static {v2}, Lcom/android/camera/SensorStateManager;->access$000(Lcom/android/camera/SensorStateManager;)J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-eqz v2, :cond_5

    const-wide/32 v2, 0x3b9aca00

    cmp-long v2, v0, v2

    if-lez v2, :cond_1

    goto/16 :goto_0

    .line 327
    :cond_1
    long-to-float v0, v0

    const v1, 0x3089705f    # 1.0E-9f

    mul-float/2addr v0, v1

    .line 328
    iget-object v1, p1, Landroid/hardware/SensorEvent;->values:[F

    const/4 v2, 0x0

    aget v1, v1, v2

    iget-object v3, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v2, v3, v2

    mul-float/2addr v1, v2

    iget-object v2, p1, Landroid/hardware/SensorEvent;->values:[F

    const/4 v3, 0x1

    aget v2, v2, v3

    iget-object v4, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v3, v4, v3

    mul-float/2addr v2, v3

    add-float/2addr v1, v2

    iget-object v2, p1, Landroid/hardware/SensorEvent;->values:[F

    const/4 v3, 0x2

    aget v2, v2, v3

    iget-object v4, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v3, v4, v3

    mul-float/2addr v2, v3

    add-float/2addr v1, v2

    float-to-double v1, v1

    invoke-static {v1, v2}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v1

    .line 331
    iget-object v3, p0, Lcom/android/camera/SensorStateManager$1;->this$0:Lcom/android/camera/SensorStateManager;

    iget-wide v4, p1, Landroid/hardware/SensorEvent;->timestamp:J

    invoke-static {v3, v4, v5}, Lcom/android/camera/SensorStateManager;->access$002(Lcom/android/camera/SensorStateManager;J)J

    .line 333
    invoke-static {}, Lcom/android/camera/SensorStateManager;->access$200()D

    move-result-wide v3

    cmpg-double p1, v3, v1

    if-gez p1, :cond_2

    .line 334
    iget-object p1, p0, Lcom/android/camera/SensorStateManager$1;->this$0:Lcom/android/camera/SensorStateManager;

    invoke-static {p1}, Lcom/android/camera/SensorStateManager;->access$300(Lcom/android/camera/SensorStateManager;)V

    .line 336
    :cond_2
    iget-object p1, p0, Lcom/android/camera/SensorStateManager$1;->this$0:Lcom/android/camera/SensorStateManager;

    iget-object v3, p0, Lcom/android/camera/SensorStateManager$1;->this$0:Lcom/android/camera/SensorStateManager;

    invoke-static {v3}, Lcom/android/camera/SensorStateManager;->access$404(Lcom/android/camera/SensorStateManager;)I

    move-result v3

    iget-object v4, p0, Lcom/android/camera/SensorStateManager$1;->this$0:Lcom/android/camera/SensorStateManager;

    invoke-static {v4}, Lcom/android/camera/SensorStateManager;->access$500(Lcom/android/camera/SensorStateManager;)[D

    move-result-object v4

    array-length v4, v4

    rem-int/2addr v3, v4

    invoke-static {p1, v3}, Lcom/android/camera/SensorStateManager;->access$402(Lcom/android/camera/SensorStateManager;I)I

    .line 337
    iget-object p1, p0, Lcom/android/camera/SensorStateManager$1;->this$0:Lcom/android/camera/SensorStateManager;

    invoke-static {p1}, Lcom/android/camera/SensorStateManager;->access$500(Lcom/android/camera/SensorStateManager;)[D

    move-result-object p1

    iget-object v3, p0, Lcom/android/camera/SensorStateManager$1;->this$0:Lcom/android/camera/SensorStateManager;

    invoke-static {v3}, Lcom/android/camera/SensorStateManager;->access$400(Lcom/android/camera/SensorStateManager;)I

    move-result v3

    aput-wide v1, p1, v3

    .line 338
    const-wide v3, 0x3fa99999a0000000L    # 0.05000000074505806

    cmpg-double p1, v1, v3

    if-gez p1, :cond_3

    .line 339
    return-void

    .line 341
    :cond_3
    iget-object p1, p0, Lcom/android/camera/SensorStateManager$1;->this$0:Lcom/android/camera/SensorStateManager;

    float-to-double v3, v0

    mul-double/2addr v1, v3

    invoke-static {p1, v1, v2}, Lcom/android/camera/SensorStateManager;->access$618(Lcom/android/camera/SensorStateManager;D)D

    .line 342
    iget-object p1, p0, Lcom/android/camera/SensorStateManager$1;->this$0:Lcom/android/camera/SensorStateManager;

    invoke-static {p1}, Lcom/android/camera/SensorStateManager;->access$600(Lcom/android/camera/SensorStateManager;)D

    move-result-wide v0

    const-wide v2, 0x3ff0c152382d7365L    # 1.0471975511965976

    cmpl-double p1, v0, v2

    if-lez p1, :cond_4

    .line 343
    iget-object p1, p0, Lcom/android/camera/SensorStateManager$1;->this$0:Lcom/android/camera/SensorStateManager;

    const-wide/16 v0, 0x0

    invoke-static {p1, v0, v1}, Lcom/android/camera/SensorStateManager;->access$602(Lcom/android/camera/SensorStateManager;D)D

    .line 344
    iget-object p1, p0, Lcom/android/camera/SensorStateManager$1;->this$0:Lcom/android/camera/SensorStateManager;

    const-wide v0, 0x40c3880000000000L    # 10000.0

    invoke-static {p1, v0, v1}, Lcom/android/camera/SensorStateManager;->access$700(Lcom/android/camera/SensorStateManager;D)V

    .line 346
    :cond_4
    return-void

    .line 323
    :cond_5
    :goto_0
    iget-object v0, p0, Lcom/android/camera/SensorStateManager$1;->this$0:Lcom/android/camera/SensorStateManager;

    iget-wide v1, p1, Landroid/hardware/SensorEvent;->timestamp:J

    invoke-static {v0, v1, v2}, Lcom/android/camera/SensorStateManager;->access$002(Lcom/android/camera/SensorStateManager;J)J

    .line 324
    return-void

    .line 319
    :cond_6
    :goto_1
    return-void
.end method
