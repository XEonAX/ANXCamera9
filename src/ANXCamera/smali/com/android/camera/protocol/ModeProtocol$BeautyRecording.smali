.class public interface abstract Lcom/android/camera/protocol/ModeProtocol$BeautyRecording;
.super Ljava/lang/Object;
.source "ModeProtocol.java"

# interfaces
.implements Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/protocol/ModeProtocol;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "BeautyRecording"
.end annotation


# static fields
.field public static final TYPE_TAG:I = 0xad


# virtual methods
.method public abstract addBeautyStack(Lcom/android/camera/protocol/ModeProtocol$HandleBeautyRecording;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<P::",
            "Lcom/android/camera/protocol/ModeProtocol$HandleBeautyRecording;",
            ">(TP;)V"
        }
    .end annotation
.end method

.method public abstract handleAngleChang(F)V
.end method

.method public abstract handleBeautyRecordingStart()V
.end method

.method public abstract handleBeautyRecordingStop()V
.end method

.method public abstract removeBeautyStack(Lcom/android/camera/protocol/ModeProtocol$HandleBeautyRecording;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<P::",
            "Lcom/android/camera/protocol/ModeProtocol$HandleBeautyRecording;",
            ">(TP;)V"
        }
    .end annotation
.end method
