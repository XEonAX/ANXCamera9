.class public interface abstract Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;
.super Ljava/lang/Object;
.source "FocusManager2.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/module/loader/camera2/FocusManager2;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "Listener"
.end annotation


# virtual methods
.method public abstract cancelFocus(Z)V
.end method

.method public abstract multiCapture()Z
.end method

.method public abstract notifyFocusAreaUpdate()V
.end method

.method public abstract onWaitingFocusFinished()Z
.end method

.method public abstract playSound(I)V
.end method

.method public abstract startFaceDetection()V
.end method

.method public abstract startFocus()V
.end method

.method public abstract stopFaceDetection(Z)V
.end method

.method public abstract stopObjectTracking(Z)V
.end method
