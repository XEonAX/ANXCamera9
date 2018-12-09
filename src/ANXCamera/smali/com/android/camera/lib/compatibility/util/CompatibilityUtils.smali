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

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static addChannelForNotificationBuilder(Landroid/app/NotificationManager;Ljava/lang/String;Ljava/lang/CharSequence;Landroid/app/Notification$Builder;)V
    .locals 0

    .line 113
    invoke-static {p0, p1, p2, p3}, Lcom/android/camera/lib/compatibility/related/v26/V26Utils;->addChannelForNotificationBuilder(Landroid/app/NotificationManager;Ljava/lang/String;Ljava/lang/CharSequence;Landroid/app/Notification$Builder;)V

    .line 114
    return-void
.end method

.method public static allocGraphicBuffers()V
    .locals 0

    .line 69
    invoke-static {}, Lcom/android/camera/lib/compatibility/related/v26/V26Utils;->allocGraphicBuffers()V

    .line 70
    return-void
.end method

.method public static constructCaptureRequestBuilder(Landroid/hardware/camera2/impl/CameraMetadataNative;ZILandroid/hardware/camera2/CaptureRequest;)Landroid/hardware/camera2/CaptureRequest$Builder;
    .locals 0

    .line 106
    invoke-static {p0, p1, p2, p3}, Lcom/android/camera/lib/compatibility/related/v28/V28Utils;->constructCaptureRequestBuilder(Landroid/hardware/camera2/impl/CameraMetadataNative;ZILandroid/hardware/camera2/CaptureRequest;)Landroid/hardware/camera2/CaptureRequest$Builder;

    move-result-object p0

    return-object p0
.end method

.method public static getInstallMethodDescription()Ljava/lang/String;
    .locals 1

    .line 98
    invoke-static {}, Lcom/android/camera/lib/compatibility/related/v28/V28Utils;->getInstallMethodDescription()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getPackageInstallObserver(Lcom/android/camera/lib/compatibility/util/CompatibilityUtils$PackageInstallerListener;)Ljava/lang/Object;
    .locals 0

    .line 94
    invoke-static {p0}, Lcom/android/camera/lib/compatibility/related/v28/V28Utils;->getPackageInstallObserver(Lcom/android/camera/lib/compatibility/util/CompatibilityUtils$PackageInstallerListener;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static getSdcardPath(Landroid/content/Context;)Ljava/lang/String;
    .locals 0

    .line 47
    invoke-static {p0}, Lcom/android/camera/lib/compatibility/related/v23/V23Utils;->getSdcardPath(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static final isInMultiWindowMode(Landroid/app/Activity;)Z
    .locals 0

    .line 39
    invoke-static {p0}, Lcom/android/camera/lib/compatibility/related/v24/V24Utils;->isInMultiWindowMode(Landroid/app/Activity;)Z

    move-result p0

    return p0
.end method

.method public static isInVideoCall(Landroid/content/Context;)Z
    .locals 0

    .line 43
    invoke-static {p0}, Lcom/android/camera/lib/compatibility/related/v23/V23Utils;->isInVideoCall(Landroid/content/Context;)Z

    move-result p0

    return p0
.end method

.method public static pauseMediaRecorder(Landroid/media/MediaRecorder;)V
    .locals 0

    .line 57
    invoke-static {p0}, Lcom/android/camera/lib/compatibility/related/v24/V24Utils;->pauseMediaRecorder(Landroid/media/MediaRecorder;)V

    .line 58
    return-void
.end method

.method public static resumeMediaRecorder(Landroid/media/MediaRecorder;)V
    .locals 0

    .line 61
    invoke-static {p0}, Lcom/android/camera/lib/compatibility/related/v24/V24Utils;->resumeMediaRecorder(Landroid/media/MediaRecorder;)V

    .line 62
    return-void
.end method

.method public static setBrightnessRampRate(Landroid/os/IPowerManager;I)V
    .locals 0

    .line 85
    invoke-static {p0, p1}, Lcom/android/camera/lib/compatibility/related/screenlight/ScreenLightUtils;->setBrightnessRampRate(Landroid/os/IPowerManager;I)V

    .line 86
    return-void
.end method

.method public static setCutoutModeShortEdges(Landroid/view/Window;)V
    .locals 0

    .line 117
    invoke-static {p0}, Lcom/android/camera/lib/compatibility/related/v28/V28Utils;->setCutoutModeShortEdges(Landroid/view/Window;)V

    .line 118
    return-void
.end method

.method public static setNextOutputFile(Landroid/media/MediaRecorder;Ljava/io/FileDescriptor;)Z
    .locals 0

    .line 77
    invoke-static {p0, p1}, Lcom/android/camera/lib/compatibility/related/v26/V26Utils;->setNextOutputFile(Landroid/media/MediaRecorder;Ljava/io/FileDescriptor;)Z

    move-result p0

    return p0
.end method

.method public static setNextOutputFile(Landroid/media/MediaRecorder;Ljava/lang/String;)Z
    .locals 0

    .line 73
    invoke-static {p0, p1}, Lcom/android/camera/lib/compatibility/related/v26/V26Utils;->setNextOutputFile(Landroid/media/MediaRecorder;Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method public static setSurfaceTextureOnFrameAvailableListener(Landroid/graphics/SurfaceTexture;Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;Landroid/os/Handler;)V
    .locals 0

    .line 53
    invoke-static {p0, p1, p2}, Lcom/android/camera/lib/compatibility/related/v21/V21Utils;->setSurfaceTextureOnFrameAvailableListener(Landroid/graphics/SurfaceTexture;Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;Landroid/os/Handler;)V

    .line 54
    return-void
.end method

.method public static setTextPaintLetterSpacing(Landroid/text/TextPaint;F)V
    .locals 0

    .line 65
    invoke-static {p0, p1}, Lcom/android/camera/lib/compatibility/related/v21/V21Utils;->setTextPaintLetterSpacing(Landroid/text/TextPaint;F)V

    .line 66
    return-void
.end method

.method public static setZsl(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V
    .locals 0

    .line 81
    invoke-static {p0, p1}, Lcom/android/camera/lib/compatibility/related/v26/V26Utils;->setZsl(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 82
    return-void
.end method
