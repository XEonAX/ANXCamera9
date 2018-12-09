.class public interface abstract Lcom/ss/android/vesdk/VEListener$VEAudioRecorderStateListener;
.super Ljava/lang/Object;
.source "VEListener.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ss/android/vesdk/VEListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "VEAudioRecorderStateListener"
.end annotation


# virtual methods
.method public abstract audioRecorderOpenFailed(ILjava/lang/String;)V
.end method

.method public abstract onAudioRecordError()V
.end method

.method public abstract onPCMDataAvailable([BI)V
.end method

.method public abstract onStartRecord(III)V
.end method

.method public abstract onStopRecord(Z)V
.end method
