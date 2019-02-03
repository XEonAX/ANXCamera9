.class Lcom/android/camera/SensorStateManager$6;
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

    .line 636
    iput-object p1, p0, Lcom/android/camera/SensorStateManager$6;->this$0:Lcom/android/camera/SensorStateManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAccuracyChanged(Landroid/hardware/Sensor;I)V
    .locals 0

    .line 649
    return-void
.end method

.method public onSensorChanged(Landroid/hardware/SensorEvent;)V
    .locals 2

    .line 639
    iget-object v0, p0, Lcom/android/camera/SensorStateManager$6;->this$0:Lcom/android/camera/SensorStateManager;

    invoke-static {v0}, Lcom/android/camera/SensorStateManager;->access$000(Lcom/android/camera/SensorStateManager;)Lcom/android/camera/SensorStateManager$SensorStateListener;

    move-result-object v0

    .line 640
    if-eqz v0, :cond_1

    invoke-interface {v0}, Lcom/android/camera/SensorStateManager$SensorStateListener;->isWorking()Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0

    .line 643
    :cond_0
    invoke-interface {v0, p1}, Lcom/android/camera/SensorStateManager$SensorStateListener;->onSensorChanged(Landroid/hardware/SensorEvent;)V

    .line 644
    return-void

    .line 641
    :cond_1
    :goto_0
    return-void
.end method
