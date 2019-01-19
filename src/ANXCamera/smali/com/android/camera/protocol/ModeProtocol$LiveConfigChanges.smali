.class public interface abstract Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;
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
    name = "LiveConfigChanges"
.end annotation


# static fields
.field public static final TYPE_TAG:I = 0xc9


# virtual methods
.method public abstract closeBGM()V
.end method

.method public abstract getAuthResult()Lcom/ss/android/ttve/oauth/TEOAuthResult;
.end method

.method public abstract getConcatResult()Landroid/util/Pair;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/util/Pair<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getInputSurfaceTexture()Landroid/graphics/SurfaceTexture;
.end method

.method public abstract getRecordSpeed()F
.end method

.method public abstract getSegments()I
.end method

.method public abstract getStartRecordingTime()J
.end method

.method public abstract getTimeValue()Ljava/lang/String;
.end method

.method public abstract getTotalRecordingTime()J
.end method

.method public abstract hasSegments()Z
.end method

.method public abstract initPreview(IIZI)V
.end method

.method public abstract initResource()V
.end method

.method public abstract isRecording()Z
.end method

.method public abstract isRecordingPaused()Z
.end method

.method public abstract onBGMChanged(Ljava/lang/String;)V
.end method

.method public abstract onDeviceRotationChange([F)V
.end method

.method public abstract onRecordConcat()Z
.end method

.method public abstract onRecordPause()V
.end method

.method public abstract onRecordResume()V
.end method

.method public abstract onRecordReverse()V
.end method

.method public abstract onRecordStart()V
.end method

.method public abstract onRecordStop()V
.end method

.method public abstract onSensorChanged(Landroid/hardware/SensorEvent;)V
.end method

.method public abstract release()V
.end method

.method public abstract setBeautify(ZF)V
.end method

.method public abstract setBeautyFaceReshape(ZFF)V
.end method

.method public abstract setFilter(ZLjava/lang/String;)V
.end method

.method public abstract setRecordSpeed(I)V
.end method

.method public abstract startPreview(Landroid/view/Surface;Lcom/ss/android/medialib/TTRecorder$SlamDetectListener;)V
.end method

.method public abstract updateRecordingTime()V
.end method
