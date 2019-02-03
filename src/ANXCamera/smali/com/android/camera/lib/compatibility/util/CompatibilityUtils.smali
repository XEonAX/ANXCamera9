.class public Lcom/android/camera/lib/compatibility/util/CompatibilityUtils;
.super Ljava/lang/Object;
.source "CompatibilityUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/lib/compatibility/util/CompatibilityUtils$PackageInstallerListener;
    }
.end annotation


# static fields
.field public static final ANDROID_L_VERSION:I = 0x15

.field public static final ANDROID_M_VERSION:I = 0x17

.field public static final ANDROID_N_VERSION:I = 0x18

.field public static final ANDROID_O_VERSION:I = 0x1a

.field public static final ANDROID_P_VERSION:I = 0x1c

.field public static final MEDIA_RECORDER_INFO_MAX_FILESIZE_APPROACHING:I = 0x322

.field public static final MEDIA_RECORDER_INFO_NEXT_OUTPUT_FILE_STARTED:I = 0x323


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static addChannelForNotificationBuilder(Landroid/app/NotificationManager;Ljava/lang/String;Ljava/lang/CharSequence;Landroid/app/Notification$Builder;)V
    .locals 0

    .line 118
    invoke-static {p0, p1, p2, p3}, Lcom/android/camera/lib/compatibility/related/v26/V26Utils;->addChannelForNotificationBuilder(Landroid/app/NotificationManager;Ljava/lang/String;Ljava/lang/CharSequence;Landroid/app/Notification$Builder;)V

    .line 119
    return-void
.end method

.method public static allocGraphicBuffers()V
    .locals 0

    .line 74
    invoke-static {}, Lcom/android/camera/lib/compatibility/related/v26/V26Utils;->allocGraphicBuffers()V

    .line 75
    return-void
.end method

.method public static constructCaptureRequestBuilder(Landroid/hardware/camera2/impl/CameraMetadataNative;ZILandroid/hardware/camera2/CaptureRequest;)Landroid/hardware/camera2/CaptureRequest$Builder;
    .locals 0

    .line 111
    invoke-static {p0, p1, p2, p3}, Lcom/android/camera/lib/compatibility/related/v28/V28Utils;->constructCaptureRequestBuilder(Landroid/hardware/camera2/impl/CameraMetadataNative;ZILandroid/hardware/camera2/CaptureRequest;)Landroid/hardware/camera2/CaptureRequest$Builder;

    move-result-object p0

    return-object p0
.end method

.method public static createCaptureSessionWithSessionConfiguration(Landroid/hardware/camera2/CameraDevice;Ljava/util/List;Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CameraCaptureSession$StateCallback;Landroid/os/Handler;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/hardware/camera2/CameraDevice;",
            "Ljava/util/List<",
            "Landroid/view/Surface;",
            ">;",
            "Landroid/hardware/camera2/CaptureRequest;",
            "Landroid/hardware/camera2/CameraCaptureSession$StateCallback;",
            "Landroid/os/Handler;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/hardware/camera2/CameraAccessException;
        }
    .end annotation

    .line 131
    invoke-static {p0, p1, p2, p3, p4}, Lcom/android/camera/lib/compatibility/related/v28/V28Utils;->createCaptureSessionWithSessionConfiguration(Landroid/hardware/camera2/CameraDevice;Ljava/util/List;Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CameraCaptureSession$StateCallback;Landroid/os/Handler;)V

    .line 133
    return-void
.end method

.method public static getInstallMethodDescription()Ljava/lang/String;
    .locals 1

    .line 103
    invoke-static {}, Lcom/android/camera/lib/compatibility/related/v28/V28Utils;->getInstallMethodDescription()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getPackageInstallObserver(Lcom/android/camera/lib/compatibility/util/CompatibilityUtils$PackageInstallerListener;)Ljava/lang/Object;
    .locals 0

    .line 99
    invoke-static {p0}, Lcom/android/camera/lib/compatibility/related/v28/V28Utils;->getPackageInstallObserver(Lcom/android/camera/lib/compatibility/util/CompatibilityUtils$PackageInstallerListener;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static getSdcardPath(Landroid/content/Context;)Ljava/lang/String;
    .locals 0

    .line 52
    invoke-static {p0}, Lcom/android/camera/lib/compatibility/related/v23/V23Utils;->getSdcardPath(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static final isInMultiWindowMode(Landroid/app/Activity;)Z
    .locals 0

    .line 44
    invoke-static {p0}, Lcom/android/camera/lib/compatibility/related/v24/V24Utils;->isInMultiWindowMode(Landroid/app/Activity;)Z

    move-result p0

    return p0
.end method

.method public static isInVideoCall(Landroid/content/Context;)Z
    .locals 0

    .line 48
    invoke-static {p0}, Lcom/android/camera/lib/compatibility/related/v23/V23Utils;->isInVideoCall(Landroid/content/Context;)Z

    move-result p0

    return p0
.end method

.method public static pauseMediaRecorder(Landroid/media/MediaRecorder;)V
    .locals 0

    .line 62
    invoke-static {p0}, Lcom/android/camera/lib/compatibility/related/v24/V24Utils;->pauseMediaRecorder(Landroid/media/MediaRecorder;)V

    .line 63
    return-void
.end method

.method public static resumeMediaRecorder(Landroid/media/MediaRecorder;)V
    .locals 0

    .line 66
    invoke-static {p0}, Lcom/android/camera/lib/compatibility/related/v24/V24Utils;->resumeMediaRecorder(Landroid/media/MediaRecorder;)V

    .line 67
    return-void
.end method

.method public static setBrightnessRampRate(Landroid/os/IPowerManager;I)V
    .locals 0

    .line 90
    invoke-static {p0, p1}, Lcom/android/camera/lib/compatibility/related/screenlight/ScreenLightUtils;->setBrightnessRampRate(Landroid/os/IPowerManager;I)V

    .line 91
    return-void
.end method

.method public static setCutoutModeShortEdges(Landroid/view/Window;)V
    .locals 0

    .line 122
    invoke-static {p0}, Lcom/android/camera/lib/compatibility/related/v28/V28Utils;->setCutoutModeShortEdges(Landroid/view/Window;)V

    .line 123
    return-void
.end method

.method public static setNextOutputFile(Landroid/media/MediaRecorder;Ljava/io/FileDescriptor;)Z
    .locals 0

    .line 82
    invoke-static {p0, p1}, Lcom/android/camera/lib/compatibility/related/v26/V26Utils;->setNextOutputFile(Landroid/media/MediaRecorder;Ljava/io/FileDescriptor;)Z

    move-result p0

    return p0
.end method

.method public static setNextOutputFile(Landroid/media/MediaRecorder;Ljava/lang/String;)Z
    .locals 0

    .line 78
    invoke-static {p0, p1}, Lcom/android/camera/lib/compatibility/related/v26/V26Utils;->setNextOutputFile(Landroid/media/MediaRecorder;Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method public static setSurfaceTextureOnFrameAvailableListener(Landroid/graphics/SurfaceTexture;Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;Landroid/os/Handler;)V
    .locals 0

    .line 58
    invoke-static {p0, p1, p2}, Lcom/android/camera/lib/compatibility/related/v21/V21Utils;->setSurfaceTextureOnFrameAvailableListener(Landroid/graphics/SurfaceTexture;Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;Landroid/os/Handler;)V

    .line 59
    return-void
.end method

.method public static setTextPaintLetterSpacing(Landroid/text/TextPaint;F)V
    .locals 0

    .line 70
    invoke-static {p0, p1}, Lcom/android/camera/lib/compatibility/related/v21/V21Utils;->setTextPaintLetterSpacing(Landroid/text/TextPaint;F)V

    .line 71
    return-void
.end method

.method public static setZsl(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V
    .locals 0

    .line 86
    invoke-static {p0, p1}, Lcom/android/camera/lib/compatibility/related/v26/V26Utils;->setZsl(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 87
    return-void
.end method
