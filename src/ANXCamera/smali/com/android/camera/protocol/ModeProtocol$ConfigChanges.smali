.class public interface abstract Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;
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
    name = "ConfigChanges"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/protocol/ModeProtocol$ConfigChanges$ConfigCheckType;
    }
.end annotation


# static fields
.field public static final CHECK_TYPE_FORCE_CLOSE:I = 0x4

.field public static final CHECK_TYPE_MANUALLY:I = 0x1

.field public static final CHECK_TYPE_MUTEX:I = 0x3

.field public static final CHECK_TYPE_WATCH:I = 0x2

.field public static final TYPE_TAG:I = 0xa4


# virtual methods
.method public varargs abstract closeMutexElement(Ljava/lang/String;[I)V
.end method

.method public abstract configBeautySwitch(I)V
.end method

.method public abstract configDualWaterMarkSwitch()V
.end method

.method public abstract configFlash(Ljava/lang/String;)V
.end method

.method public abstract configFocusPeakSwitch(I)V
.end method

.method public abstract configGenderAgeSwitch(I)V
.end method

.method public abstract configGradienterSwitch(I)V
.end method

.method public abstract configGroupSwitch(I)V
.end method

.method public abstract configHHTSwitch(I)V
.end method

.method public abstract configHdr(Ljava/lang/String;)V
.end method

.method public abstract configLiveShotSwitch(I)V
.end method

.method public abstract configMagicFocusSwitch()V
.end method

.method public abstract configMagicMirrorSwitch(I)V
.end method

.method public abstract configPortraitSwitch(I)V
.end method

.method public abstract configRawSwitch()V
.end method

.method public abstract configScene(I)V
.end method

.method public abstract configSuperResolutionSwitch(I)V
.end method

.method public abstract configTiltSwitch(I)V
.end method

.method public abstract configTimerSwitch()V
.end method

.method public abstract configVideoFast()V
.end method

.method public abstract configVideoHFR()V
.end method

.method public abstract configVideoSlow()V
.end method

.method public abstract onConfigChanged(I)V
.end method

.method public abstract onThermalNotification(I)V
.end method

.method public abstract reCheckHandGesture()V
.end method

.method public abstract reCheckLighting()V
.end method

.method public abstract reCheckLiveShot()V
.end method

.method public abstract reCheckMutexConfigs(I)V
.end method

.method public abstract reCheckUltraPixelPhotoGraphy()V
.end method

.method public abstract restoreAllMutexElement(Ljava/lang/String;)V
.end method

.method public abstract setEyeLight(Ljava/lang/String;)V
.end method

.method public abstract setFilter(I)V
.end method

.method public abstract setLighting(ZLjava/lang/String;Ljava/lang/String;Z)V
.end method

.method public abstract showCloseTip(IZ)V
.end method

.method public abstract showOrHideFilter()V
.end method

.method public abstract showOrHideLighting(Z)V
.end method

.method public abstract showSetting()V
.end method
