.class public interface abstract Lcom/android/camera/module/Module;
.super Ljava/lang/Object;
.source "Module.java"

# interfaces
.implements Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;


# virtual methods
.method public abstract canIgnoreFocusChanged()Z
.end method

.method public abstract checkActivityOrientation()V
.end method

.method public abstract closeCamera()V
.end method

.method public abstract enableCameraControls(Z)V
.end method

.method public abstract getModuleIndex()I
.end method

.method public abstract getSupportedSettingKeys()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getUnInterruptableReason()Ljava/lang/String;
.end method

.method public abstract isBlockSnap()Z
.end method

.method public abstract isCaptureIntent()Z
.end method

.method public abstract isCreated()Z
.end method

.method public abstract isDeparted()Z
.end method

.method public abstract isDoingAction()Z
.end method

.method public abstract isFrameAvailable()Z
.end method

.method public abstract isIgnoreTouchEvent()Z
.end method

.method public abstract isKeptBitmapTexture()Z
.end method

.method public abstract isPanoramaDoing()Z
.end method

.method public abstract isPostProcessing()Z
.end method

.method public abstract isSelectingCapturedResult()Z
.end method

.method public abstract isUnInterruptable()Z
.end method

.method public abstract isVideoRecording()Z
.end method

.method public abstract notifyError()V
.end method

.method public abstract onActivityResult(IILandroid/content/Intent;)V
.end method

.method public abstract onBackPressed()Z
.end method

.method public abstract onBroadcastReceived(Landroid/content/Context;Landroid/content/Intent;)V
.end method

.method public abstract onCreate(II)V
.end method

.method public abstract onDestroy()V
.end method

.method public abstract onGestureTrack(Landroid/graphics/RectF;Z)Z
.end method

.method public abstract onHostStopAndNotifyActionStop()V
.end method

.method public abstract onKeyDown(ILandroid/view/KeyEvent;)Z
.end method

.method public abstract onKeyUp(ILandroid/view/KeyEvent;)Z
.end method

.method public abstract onLongPress(II)V
.end method

.method public abstract onNewIntent()V
.end method

.method public abstract onNewUriArrived(Landroid/net/Uri;Ljava/lang/String;)V
.end method

.method public abstract onOrientationChanged(II)V
.end method

.method public abstract onPause()V
.end method

.method public abstract onPreviewPixelsRead([BII)V
.end method

.method public abstract onResume()V
.end method

.method public abstract onSaveInstanceState(Landroid/os/Bundle;)V
.end method

.method public abstract onScale(FFF)Z
.end method

.method public abstract onScaleBegin(FF)Z
.end method

.method public abstract onScaleEnd()V
.end method

.method public abstract onSingleTapUp(IIZ)V
.end method

.method public abstract onStop()V
.end method

.method public abstract onSurfaceTextureReleased()V
.end method

.method public abstract onSurfaceTextureUpdated(Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;)V
.end method

.method public abstract onUserInteraction()V
.end method

.method public abstract onWindowFocusChanged(Z)V
.end method

.method public abstract pausePreview()V
.end method

.method public abstract preTransferOrientation(II)V
.end method

.method public abstract registerProtocol()V
.end method

.method public abstract requestRender()V
.end method

.method public abstract resumePreview()V
.end method

.method public abstract setActivity(Lcom/android/camera/Camera;)V
.end method

.method public abstract setDeparted()V
.end method

.method public abstract setFrameAvailable(Z)V
.end method

.method public abstract setRestoring(Z)V
.end method

.method public abstract shouldReleaseLater()Z
.end method

.method public abstract startPreview()V
.end method

.method public abstract unRegisterModulePersistProtocol()V
.end method

.method public abstract unRegisterProtocol()V
.end method
