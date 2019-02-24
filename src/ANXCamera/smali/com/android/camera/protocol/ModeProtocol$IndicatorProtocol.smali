.class public interface abstract Lcom/android/camera/protocol/ModeProtocol$IndicatorProtocol;
.super Ljava/lang/Object;
.source "ModeProtocol.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/protocol/ModeProtocol;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "IndicatorProtocol"
.end annotation


# virtual methods
.method public abstract clearFocusView(I)V
.end method

.method public abstract clearIndicator(I)V
.end method

.method public abstract getActiveIndicator()I
.end method

.method public abstract getFaces()[Lcom/android/camera2/CameraHardwareFace;
.end method

.method public abstract getFocusRect(I)Landroid/graphics/RectF;
.end method

.method public abstract getFocusRectInPreviewFrame()Landroid/graphics/RectF;
.end method

.method public abstract initializeFocusView(Lcom/android/camera/ui/FocusView$ExposureViewListener;)V
.end method

.method public abstract initializeObjectTrack(Landroid/graphics/RectF;Z)Z
.end method

.method public abstract initializeObjectView(Landroid/graphics/RectF;Z)Z
.end method

.method public abstract isAdjustingObjectView()Z
.end method

.method public abstract isEvAdjusted(Z)Z
.end method

.method public abstract isFaceExists(I)Z
.end method

.method public abstract isFaceStable(I)Z
.end method

.method public abstract isFocusViewVisible()Z
.end method

.method public abstract isIndicatorVisible(I)Z
.end method

.method public abstract isNeedExposure(I)Z
.end method

.method public abstract isObjectTrackFailed()Z
.end method

.method public abstract lightingCancel()V
.end method

.method public abstract lightingDetectFace([Lcom/android/camera2/CameraHardwareFace;)V
.end method

.method public abstract lightingFocused()V
.end method

.method public abstract lightingStart()V
.end method

.method public abstract onStopObjectTrack()V
.end method

.method public abstract reShowFaceRect()V
.end method

.method public abstract setActiveIndicator(I)V
.end method

.method public abstract setAfRegionView([Landroid/hardware/camera2/params/MeteringRectangle;Landroid/graphics/Rect;F)V
.end method

.method public abstract setCameraDisplayOrientation(I)V
.end method

.method public abstract setDisplaySize(II)V
.end method

.method public abstract setEvAdjustable(Z)V
.end method

.method public abstract setFaces(I[Lcom/android/camera2/CameraHardwareFace;Landroid/graphics/Rect;F)Z
.end method

.method public abstract setFocusViewPosition(III)V
.end method

.method public abstract setFocusViewType(Z)V
.end method

.method public abstract setObjectViewListener(Lcom/android/camera/ui/ObjectView$ObjectViewListener;)V
.end method

.method public abstract setPreviewSize(II)V
.end method

.method public abstract setShowGenderAndAge(Z)V
.end method

.method public abstract setShowMagicMirror(Z)V
.end method

.method public abstract setSkipDrawFace(Z)V
.end method

.method public abstract showIndicator(II)V
.end method

.method public abstract updateFaceView(ZZZZI)V
.end method
