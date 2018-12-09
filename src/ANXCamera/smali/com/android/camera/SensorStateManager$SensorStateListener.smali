.class public interface abstract Lcom/android/camera/SensorStateManager$SensorStateListener;
.super Ljava/lang/Object;
.source "SensorStateManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/SensorStateManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "SensorStateListener"
.end annotation


# virtual methods
.method public abstract isWorking()Z
.end method

.method public abstract notifyDevicePostureChanged()V
.end method

.method public abstract onDeviceBecomeStable()V
.end method

.method public abstract onDeviceBeginMoving()V
.end method

.method public abstract onDeviceKeepMoving(D)V
.end method

.method public abstract onDeviceKeepStable()V
.end method

.method public abstract onDeviceOrientationChanged(FZ)V
.end method
