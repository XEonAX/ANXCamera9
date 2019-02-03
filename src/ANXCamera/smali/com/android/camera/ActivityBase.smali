.class public abstract Lcom/android/camera/ActivityBase;
.super Landroid/support/v4/app/FragmentActivity;
.source "ActivityBase.java"

# interfaces
.implements Lcom/android/camera/AppController;
.implements Lcom/android/camera/module/loader/SurfaceStateListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/ActivityBase$ActivityHandler;
    }
.end annotation


# static fields
.field public static final MSG_CAMERA_OPEN_EXCEPTION:I = 0xa

.field protected static final MSG_DEBUG_INFO:I = 0x0

.field protected static final MSG_KEYGUARD_TWICE_RESUME:I = 0x1

.field private static final START_GALLERY_TIMEOUT:I = 0x12c

.field private static final TAG:Ljava/lang/String; = "ActivityBase"

.field private static final TOUCH_EVENT_TRACK_TIME_OUT:I = 0x3e8


# instance fields
.field protected volatile mActivityPaused:Z

.field private mAppLunchMap:Ljava/util/HashMap;

.field protected mAppStartTime:J

.field protected mApplication:Lcom/android/camera/CameraAppImpl;

.field protected mCamera2Device:Lcom/android/camera2/Camera2Proxy;

.field protected mCameraBrightness:Lcom/android/camera/CameraBrightness;

.field private mCameraErrorShown:Z

.field public mCameraIntentManager:Lcom/android/camera/CameraIntentManager;

.field protected mCameraRootView:Lcom/android/camera/ui/CameraRootView;

.field protected mCameraScreenNail:Lcom/android/camera/CameraScreenNail;

.field private mCameraSound:Lcom/android/camera/MiuiCameraSound;

.field private mCloseActivityThread:Ljava/lang/Thread;

.field protected mCurrentModule:Lcom/android/camera/module/Module;

.field private mCurrentSurfaceState:I

.field protected mDebugInfoView:Landroid/widget/TextView;

.field protected mDelayReleaseCamera:Z

.field protected mDisplayRotation:I

.field protected mEdgeShutterView:Lcom/android/camera/ui/V9EdgeShutterView;

.field private mErrorDialog:Landroid/app/AlertDialog;

.field private mGLCoverDisposable:Lio/reactivex/disposables/Disposable;

.field protected mGLCoverView:Landroid/widget/ImageView;

.field protected mGLView:Lcom/android/camera/ui/V6CameraGLSurfaceView;

.field private mGalleryLocked:Z

.field protected final mHandler:Landroid/os/Handler;

.field private mIsFinishInKeyguard:Z

.field private mIsSwitchingModule:Z

.field private mJumpFlag:I

.field protected mJumpedToGallery:Z

.field private mKeyguardManager:Landroid/app/KeyguardManager;

.field private mKeyguardSecureLocked:Z

.field private mLastJumpFlag:I

.field private mLocationManager:Lcom/android/camera/LocationManager;

.field protected mOrientation:I

.field protected mOrientationCompensation:I

.field protected mScreenHint:Lcom/android/camera/ui/ScreenHint;

.field private mSecureUriList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/net/Uri;",
            ">;"
        }
    .end annotation
.end field

.field private mStartFromKeyguard:Z

.field private mThumbnailUpdater:Lcom/android/camera/ThumbnailUpdater;

.field private mTrackAppLunchDisposable:Lio/reactivex/disposables/Disposable;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 84
    invoke-direct {p0}, Landroid/support/v4/app/FragmentActivity;-><init>()V

    .line 95
    const/4 v0, -0x1

    iput v0, p0, Lcom/android/camera/ActivityBase;->mOrientation:I

    .line 96
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera/ActivityBase;->mOrientationCompensation:I

    .line 100
    iput-boolean v0, p0, Lcom/android/camera/ActivityBase;->mKeyguardSecureLocked:Z

    .line 101
    iput-boolean v0, p0, Lcom/android/camera/ActivityBase;->mStartFromKeyguard:Z

    .line 102
    iput-boolean v0, p0, Lcom/android/camera/ActivityBase;->mGalleryLocked:Z

    .line 104
    iput v0, p0, Lcom/android/camera/ActivityBase;->mJumpFlag:I

    .line 105
    iput v0, p0, Lcom/android/camera/ActivityBase;->mLastJumpFlag:I

    .line 130
    iput-boolean v0, p0, Lcom/android/camera/ActivityBase;->mIsFinishInKeyguard:Z

    .line 132
    new-instance v0, Lcom/android/camera/ActivityBase$ActivityHandler;

    invoke-direct {v0, p0}, Lcom/android/camera/ActivityBase$ActivityHandler;-><init>(Lcom/android/camera/ActivityBase;)V

    iput-object v0, p0, Lcom/android/camera/ActivityBase;->mHandler:Landroid/os/Handler;

    .line 922
    const/4 v0, 0x1

    iput v0, p0, Lcom/android/camera/ActivityBase;->mCurrentSurfaceState:I

    return-void
.end method

.method static synthetic access$002(Lcom/android/camera/ActivityBase;Z)Z
    .locals 0

    .line 84
    iput-boolean p1, p0, Lcom/android/camera/ActivityBase;->mIsFinishInKeyguard:Z

    return p1
.end method

.method static synthetic access$100(Lcom/android/camera/ActivityBase;)Ljava/util/HashMap;
    .locals 0

    .line 84
    iget-object p0, p0, Lcom/android/camera/ActivityBase;->mAppLunchMap:Ljava/util/HashMap;

    return-object p0
.end method

.method static synthetic access$102(Lcom/android/camera/ActivityBase;Ljava/util/HashMap;)Ljava/util/HashMap;
    .locals 0

    .line 84
    iput-object p1, p0, Lcom/android/camera/ActivityBase;->mAppLunchMap:Ljava/util/HashMap;

    return-object p1
.end method

.method private addSecureUriIfNecessary(Landroid/net/Uri;)V
    .locals 2

    .line 743
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mSecureUriList:Ljava/util/ArrayList;

    if-eqz v0, :cond_1

    .line 744
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mSecureUriList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/16 v1, 0x64

    if-ne v0, v1, :cond_0

    .line 745
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mSecureUriList:Ljava/util/ArrayList;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 747
    :cond_0
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mSecureUriList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 749
    :cond_1
    return-void
.end method

.method private checkGalleryLock()V
    .locals 1

    .line 438
    const-string v0, "com.miui.gallery"

    invoke-static {p0, v0}, Lcom/android/camera/Util;->isAppLocked(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/camera/ActivityBase;->mGalleryLocked:Z

    .line 439
    return-void
.end method

.method private checkKeyguardFlag()V
    .locals 4

    .line 442
    invoke-virtual {p0}, Lcom/android/camera/ActivityBase;->getKeyguardFlag()Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/camera/ActivityBase;->mStartFromKeyguard:Z

    .line 443
    iget-boolean v0, p0, Lcom/android/camera/ActivityBase;->mStartFromKeyguard:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/android/camera/ActivityBase;->mIsFinishInKeyguard:Z

    if-nez v0, :cond_0

    .line 444
    invoke-virtual {p0}, Lcom/android/camera/ActivityBase;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/high16 v1, 0x80000

    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    .line 445
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mKeyguardManager:Landroid/app/KeyguardManager;

    invoke-virtual {v0}, Landroid/app/KeyguardManager;->isKeyguardSecure()Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/camera/ActivityBase;->mKeyguardSecureLocked:Z

    .line 446
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    iget-boolean v1, p0, Lcom/android/camera/ActivityBase;->mKeyguardSecureLocked:Z

    invoke-virtual {v0, v1}, Lcom/android/camera/data/data/global/DataItemGlobal;->setStartFromKeyguard(Z)V

    .line 447
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/ActivityBase;->mIsFinishInKeyguard:Z

    .line 448
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x1

    const-wide/16 v2, 0x64

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 451
    :cond_0
    iget-boolean v0, p0, Lcom/android/camera/ActivityBase;->mKeyguardSecureLocked:Z

    if-nez v0, :cond_2

    invoke-virtual {p0}, Lcom/android/camera/ActivityBase;->isGalleryLocked()Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_0

    .line 456
    :cond_1
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera/ActivityBase;->mSecureUriList:Ljava/util/ArrayList;

    goto :goto_1

    .line 452
    :cond_2
    :goto_0
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mSecureUriList:Ljava/util/ArrayList;

    if-nez v0, :cond_3

    .line 453
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/camera/ActivityBase;->mSecureUriList:Ljava/util/ArrayList;

    .line 458
    :cond_3
    :goto_1
    const-string v0, "ActivityBase"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "checkKeyguard: fromKeyguard="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v2, p0, Lcom/android/camera/ActivityBase;->mStartFromKeyguard:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v2, " keyguardSecureLocked="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v2, p0, Lcom/android/camera/ActivityBase;->mKeyguardSecureLocked:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v2, " secureUriList is "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 459
    iget-object v2, p0, Lcom/android/camera/ActivityBase;->mSecureUriList:Ljava/util/ArrayList;

    if-nez v2, :cond_4

    const-string v2, "null"

    goto :goto_2

    :cond_4
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "not null ("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/android/camera/ActivityBase;->mSecureUriList:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    :goto_2
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 458
    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 460
    return-void
.end method

.method private clearNotification()V
    .locals 1

    .line 915
    const-string v0, "notification"

    .line 916
    invoke-virtual {p0, v0}, Lcom/android/camera/ActivityBase;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    .line 917
    if-eqz v0, :cond_0

    .line 918
    invoke-virtual {v0}, Landroid/app/NotificationManager;->cancelAll()V

    .line 920
    :cond_0
    return-void
.end method


# virtual methods
.method public couldShowErrorDialog()Z
    .locals 1

    .line 199
    iget-boolean v0, p0, Lcom/android/camera/ActivityBase;->mCameraErrorShown:Z

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public createCameraScreenNail(ZZ)V
    .locals 1

    .line 611
    iget-object p1, p0, Lcom/android/camera/ActivityBase;->mCameraScreenNail:Lcom/android/camera/CameraScreenNail;

    if-nez p1, :cond_0

    .line 613
    new-instance p1, Lcom/android/camera/ActivityBase$8;

    invoke-direct {p1, p0}, Lcom/android/camera/ActivityBase$8;-><init>(Lcom/android/camera/ActivityBase;)V

    .line 676
    new-instance p2, Lcom/android/camera/ActivityBase$9;

    invoke-direct {p2, p0}, Lcom/android/camera/ActivityBase$9;-><init>(Lcom/android/camera/ActivityBase;)V

    .line 688
    new-instance v0, Lcom/android/camera/CameraScreenNail;

    invoke-direct {v0, p1, p2}, Lcom/android/camera/CameraScreenNail;-><init>(Lcom/android/camera/CameraScreenNail$NailListener;Lcom/android/camera/CameraScreenNail$RequestRenderListener;)V

    iput-object v0, p0, Lcom/android/camera/ActivityBase;->mCameraScreenNail:Lcom/android/camera/CameraScreenNail;

    .line 690
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/ActivityBase;->initCameraScreenNail()V

    .line 691
    return-void
.end method

.method public dismissBlurCover()V
    .locals 2

    .line 352
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mGLCoverView:Landroid/widget/ImageView;

    if-eqz v0, :cond_1

    .line 353
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mGLCoverView:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getVisibility()I

    move-result v0

    const/16 v1, 0x8

    if-ne v0, v1, :cond_0

    .line 354
    return-void

    .line 358
    :cond_0
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mGLCoverView:Landroid/widget/ImageView;

    new-instance v1, Lcom/android/camera/ActivityBase$4;

    invoke-direct {v1, p0}, Lcom/android/camera/ActivityBase$4;-><init>(Lcom/android/camera/ActivityBase;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->post(Ljava/lang/Runnable;)Z

    .line 370
    :cond_1
    return-void
.end method

.method public dismissKeyguard()V
    .locals 2

    .line 893
    iget-boolean v0, p0, Lcom/android/camera/ActivityBase;->mStartFromKeyguard:Z

    if-eqz v0, :cond_0

    .line 894
    new-instance v0, Landroid/content/Intent;

    const-string v1, "xiaomi.intent.action.SHOW_SECURE_KEYGUARD"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/android/camera/ActivityBase;->sendBroadcast(Landroid/content/Intent;)V

    .line 896
    :cond_0
    return-void
.end method

.method public getCameraAppImpl()Lcom/android/camera/CameraAppImpl;
    .locals 1

    .line 222
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mApplication:Lcom/android/camera/CameraAppImpl;

    return-object v0
.end method

.method public getCameraDevice()Lcom/android/camera2/Camera2Proxy;
    .locals 1

    .line 226
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    return-object v0
.end method

.method public getCameraIntentManager()Lcom/android/camera/CameraIntentManager;
    .locals 1

    .line 966
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mCameraIntentManager:Lcom/android/camera/CameraIntentManager;

    if-nez v0, :cond_0

    .line 967
    invoke-virtual {p0}, Lcom/android/camera/ActivityBase;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-static {v0}, Lcom/android/camera/CameraIntentManager;->getInstance(Landroid/content/Intent;)Lcom/android/camera/CameraIntentManager;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/ActivityBase;->mCameraIntentManager:Lcom/android/camera/CameraIntentManager;

    .line 969
    :cond_0
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mCameraIntentManager:Lcom/android/camera/CameraIntentManager;

    return-object v0
.end method

.method public getCameraScreenNail()Lcom/android/camera/CameraScreenNail;
    .locals 1

    .line 764
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mCameraScreenNail:Lcom/android/camera/CameraScreenNail;

    return-object v0
.end method

.method public getCurrentModule()Lcom/android/camera/module/Module;
    .locals 1

    .line 859
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mCurrentModule:Lcom/android/camera/module/Module;

    return-object v0
.end method

.method public getEdgeShutterView()Lcom/android/camera/ui/V9EdgeShutterView;
    .locals 1

    .line 217
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mEdgeShutterView:Lcom/android/camera/ui/V9EdgeShutterView;

    return-object v0
.end method

.method public getGLView()Lcom/android/camera/ui/V6CameraGLSurfaceView;
    .locals 1

    .line 555
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mGLView:Lcom/android/camera/ui/V6CameraGLSurfaceView;

    return-object v0
.end method

.method protected getKeyguardFlag()Z
    .locals 3

    .line 432
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mKeyguardManager:Landroid/app/KeyguardManager;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 433
    invoke-virtual {p0}, Lcom/android/camera/ActivityBase;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v2, "StartActivityWhenLocked"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mKeyguardManager:Landroid/app/KeyguardManager;

    .line 434
    invoke-virtual {v0}, Landroid/app/KeyguardManager;->isKeyguardLocked()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v1, 0x1

    nop

    .line 432
    :cond_0
    return v1
.end method

.method public getOrientation()I
    .locals 1

    .line 727
    iget v0, p0, Lcom/android/camera/ActivityBase;->mOrientation:I

    return v0
.end method

.method public getScreenHint()Lcom/android/camera/ui/ScreenHint;
    .locals 1

    .line 560
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mScreenHint:Lcom/android/camera/ui/ScreenHint;

    return-object v0
.end method

.method public getSecureUriList()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Landroid/net/Uri;",
            ">;"
        }
    .end annotation

    .line 864
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mSecureUriList:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getSoundPlayTime()J
    .locals 2

    .line 778
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mCameraSound:Lcom/android/camera/MiuiCameraSound;

    if-eqz v0, :cond_0

    .line 779
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mCameraSound:Lcom/android/camera/MiuiCameraSound;

    invoke-virtual {v0}, Lcom/android/camera/MiuiCameraSound;->getLastSoundPlayTime()J

    move-result-wide v0

    return-wide v0

    .line 781
    :cond_0
    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public getThumbnailUpdater()Lcom/android/camera/ThumbnailUpdater;
    .locals 1

    .line 732
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mThumbnailUpdater:Lcom/android/camera/ThumbnailUpdater;

    return-object v0
.end method

.method public gotoGallery()V
    .locals 5

    .line 785
    invoke-virtual {p0}, Lcom/android/camera/ActivityBase;->isActivityPaused()Z

    move-result v0

    if-nez v0, :cond_a

    .line 786
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mThumbnailUpdater:Lcom/android/camera/ThumbnailUpdater;

    invoke-virtual {v0}, Lcom/android/camera/ThumbnailUpdater;->getThumbnail()Lcom/android/camera/Thumbnail;

    move-result-object v0

    .line 787
    if-eqz v0, :cond_a

    .line 788
    invoke-virtual {v0}, Lcom/android/camera/Thumbnail;->getUri()Landroid/net/Uri;

    move-result-object v1

    .line 789
    if-nez v1, :cond_1

    .line 790
    const-string v1, "ActivityBase"

    const-string v2, "Uri null!"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 791
    invoke-virtual {v0}, Lcom/android/camera/Thumbnail;->isWaitingForUri()Z

    move-result v0

    if-nez v0, :cond_0

    .line 792
    invoke-virtual {p0}, Lcom/android/camera/ActivityBase;->getThumbnailUpdater()Lcom/android/camera/ThumbnailUpdater;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/ThumbnailUpdater;->getLastThumbnailUncached()V

    .line 794
    :cond_0
    return-void

    .line 796
    :cond_1
    invoke-virtual {p0}, Lcom/android/camera/ActivityBase;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/android/camera/Util;->isUriValid(Landroid/net/Uri;Landroid/content/ContentResolver;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 797
    const-string v0, "ActivityBase"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Uri invalid. uri="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 800
    return-void

    .line 803
    :cond_2
    :try_start_0
    new-instance v0, Landroid/content/Intent;

    const-string v2, "com.android.camera.action.REVIEW"

    invoke-direct {v0, v2, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 804
    const-string v2, "com.miui.gallery"

    invoke-virtual {v0, v2}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 805
    const-string v2, "from_MiuiCamera"

    const/4 v3, 0x1

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 806
    invoke-static {}, Lcom/mi/config/b;->go()Z

    move-result v2

    if-eqz v2, :cond_5

    .line 807
    invoke-static {}, Lcom/mi/config/b;->hW()Z

    move-result v2

    if-eqz v2, :cond_4

    .line 808
    iget-object v2, p0, Lcom/android/camera/ActivityBase;->mCameraBrightness:Lcom/android/camera/CameraBrightness;

    invoke-virtual {v2}, Lcom/android/camera/CameraBrightness;->getCurrentBrightnessManual()I

    move-result v2

    const/4 v4, -0x1

    if-eq v2, v4, :cond_3

    .line 809
    const-string v2, "camera-brightness-manual"

    iget-object v4, p0, Lcom/android/camera/ActivityBase;->mCameraBrightness:Lcom/android/camera/CameraBrightness;

    invoke-virtual {v4}, Lcom/android/camera/CameraBrightness;->getCurrentBrightnessManual()I

    move-result v4

    invoke-virtual {v0, v2, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    goto :goto_0

    .line 811
    :cond_3
    const-string v2, "camera-brightness-auto"

    iget-object v4, p0, Lcom/android/camera/ActivityBase;->mCameraBrightness:Lcom/android/camera/CameraBrightness;

    invoke-virtual {v4}, Lcom/android/camera/CameraBrightness;->getCurrentBrightnessAuto()F

    move-result v4

    invoke-virtual {v0, v2, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;F)Landroid/content/Intent;

    goto :goto_0

    .line 814
    :cond_4
    const-string v2, "camera-brightness"

    iget-object v4, p0, Lcom/android/camera/ActivityBase;->mCameraBrightness:Lcom/android/camera/CameraBrightness;

    invoke-virtual {v4}, Lcom/android/camera/CameraBrightness;->getCurrentBrightness()I

    move-result v4

    invoke-virtual {v0, v2, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 817
    :cond_5
    :goto_0
    invoke-virtual {p0}, Lcom/android/camera/ActivityBase;->startFromKeyguard()Z

    move-result v2

    if-eqz v2, :cond_6

    .line 818
    const-string v2, "StartActivityWhenLocked"

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 820
    :cond_6
    const-string v2, "com.miui.gallery"

    invoke-static {p0, v2}, Lcom/android/camera/Util;->isAppLocked(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 821
    const-string v2, "skip_interception"

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 823
    :cond_7
    iget-object v2, p0, Lcom/android/camera/ActivityBase;->mSecureUriList:Ljava/util/ArrayList;

    if-eqz v2, :cond_8

    .line 824
    const-string v2, "SecureUri"

    iget-object v4, p0, Lcom/android/camera/ActivityBase;->mSecureUriList:Ljava/util/ArrayList;

    invoke-virtual {v0, v2, v4}, Landroid/content/Intent;->putParcelableArrayListExtra(Ljava/lang/String;Ljava/util/ArrayList;)Landroid/content/Intent;

    .line 826
    :cond_8
    invoke-virtual {p0, v0}, Lcom/android/camera/ActivityBase;->startActivity(Landroid/content/Intent;)V

    .line 827
    iput v3, p0, Lcom/android/camera/ActivityBase;->mJumpFlag:I

    .line 828
    iput-boolean v3, p0, Lcom/android/camera/ActivityBase;->mJumpedToGallery:Z

    .line 836
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mCurrentModule:Lcom/android/camera/module/Module;

    if-eqz v0, :cond_9

    .line 839
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mCurrentModule:Lcom/android/camera/module/Module;

    const/4 v2, 0x0

    invoke-interface {v0, v2}, Lcom/android/camera/module/Module;->enableCameraControls(Z)V

    .line 840
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mCurrentModule:Lcom/android/camera/module/Module;

    invoke-interface {v0}, Lcom/android/camera/module/Module;->getModuleIndex()I

    move-result v0

    invoke-static {v0}, Lcom/android/camera/statistic/CameraStatUtil;->trackGotoGallery(I)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 848
    :cond_9
    goto :goto_1

    .line 842
    :catch_0
    move-exception v0

    .line 844
    :try_start_1
    new-instance v0, Landroid/content/Intent;

    const-string v2, "android.intent.action.VIEW"

    invoke-direct {v0, v2, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-virtual {p0, v0}, Lcom/android/camera/ActivityBase;->startActivity(Landroid/content/Intent;)V
    :try_end_1
    .catch Landroid/content/ActivityNotFoundException; {:try_start_1 .. :try_end_1} :catch_1

    .line 847
    goto :goto_1

    .line 845
    :catch_1
    move-exception v0

    .line 846
    const-string v2, "ActivityBase"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "review image fail. uri="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 851
    :cond_a
    :goto_1
    return-void
.end method

.method public declared-synchronized hasSurface()Z
    .locals 3

    monitor-enter p0

    .line 926
    :try_start_0
    iget v0, p0, Lcom/android/camera/ActivityBase;->mCurrentSurfaceState:I

    const/4 v1, 0x2

    const/4 v2, 0x0

    if-eq v0, v1, :cond_2

    const/4 v1, 0x4

    if-eq v0, v1, :cond_0

    goto :goto_0

    .line 928
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/ActivityBase;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/CameraScreenNail;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    move-result-object v0

    if-nez v0, :cond_1

    .line 929
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mGLView:Lcom/android/camera/ui/V6CameraGLSurfaceView;

    invoke-virtual {v0}, Lcom/android/camera/ui/V6CameraGLSurfaceView;->onResume()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 930
    monitor-exit p0

    return v2

    .line 932
    :cond_1
    const/4 v0, 0x1

    monitor-exit p0

    return v0

    .line 936
    :cond_2
    :try_start_1
    sget-boolean v0, Lcom/android/camera/Util;->sIsFullScreenNavBarHidden:Z

    if-eqz v0, :cond_3

    .line 937
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/android/camera/ActivityBase$10;

    invoke-direct {v1, p0}, Lcom/android/camera/ActivityBase$10;-><init>(Lcom/android/camera/ActivityBase;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0

    .line 945
    :cond_3
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mGLView:Lcom/android/camera/ui/V6CameraGLSurfaceView;

    invoke-virtual {v0}, Lcom/android/camera/ui/V6CameraGLSurfaceView;->onResume()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 949
    :goto_0
    monitor-exit p0

    return v2

    .line 925
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public initCameraScreenNail()V
    .locals 3

    .line 694
    const-string v0, "ActivityBase"

    const-string v1, "initCameraScreenNail"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 695
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mCameraScreenNail:Lcom/android/camera/CameraScreenNail;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mCameraScreenNail:Lcom/android/camera/CameraScreenNail;

    invoke-virtual {v0}, Lcom/android/camera/CameraScreenNail;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    move-result-object v0

    if-nez v0, :cond_0

    .line 696
    invoke-virtual {p0}, Lcom/android/camera/ActivityBase;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v0

    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    .line 697
    new-instance v1, Landroid/graphics/Point;

    invoke-direct {v1}, Landroid/graphics/Point;-><init>()V

    .line 698
    invoke-virtual {v0, v1}, Landroid/view/Display;->getSize(Landroid/graphics/Point;)V

    .line 699
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mCameraScreenNail:Lcom/android/camera/CameraScreenNail;

    iget v2, v1, Landroid/graphics/Point;->x:I

    iget v1, v1, Landroid/graphics/Point;->y:I

    invoke-virtual {v0, v2, v1}, Lcom/android/camera/CameraScreenNail;->setPreviewSize(II)V

    .line 701
    :cond_0
    return-void
.end method

.method public isActivityPaused()Z
    .locals 1

    .line 907
    iget-boolean v0, p0, Lcom/android/camera/ActivityBase;->mActivityPaused:Z

    return v0
.end method

.method public isGalleryLocked()Z
    .locals 1

    .line 756
    iget-boolean v0, p0, Lcom/android/camera/ActivityBase;->mGalleryLocked:Z

    return v0
.end method

.method public isGotoGallery()Z
    .locals 2

    .line 868
    iget v0, p0, Lcom/android/camera/ActivityBase;->mJumpFlag:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method public isJumpBack()Z
    .locals 1

    .line 872
    iget v0, p0, Lcom/android/camera/ActivityBase;->mLastJumpFlag:I

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isPostProcessing()Z
    .locals 1

    .line 973
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mCurrentModule:Lcom/android/camera/module/Module;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mCurrentModule:Lcom/android/camera/module/Module;

    invoke-interface {v0}, Lcom/android/camera/module/Module;->isCreated()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mCurrentModule:Lcom/android/camera/module/Module;

    invoke-interface {v0}, Lcom/android/camera/module/Module;->isPostProcessing()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method protected isShowBottomIntentDone()Z
    .locals 2

    .line 420
    invoke-virtual {p0}, Lcom/android/camera/ActivityBase;->getCameraIntentManager()Lcom/android/camera/CameraIntentManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/CameraIntentManager;->isImageCaptureIntent()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/android/camera/ActivityBase;->getCameraIntentManager()Lcom/android/camera/CameraIntentManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/CameraIntentManager;->isVideoCaptureIntent()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 421
    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa0

    .line 422
    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;

    .line 423
    if-eqz v0, :cond_1

    const v1, 0x7f0d001b

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;->getActiveFragment(I)I

    move-result v0

    const/16 v1, 0xff3

    if-ne v0, v1, :cond_1

    .line 425
    const/4 v0, 0x1

    return v0

    .line 428
    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method public isSwitchingModule()Z
    .locals 1

    .line 899
    iget-boolean v0, p0, Lcom/android/camera/ActivityBase;->mIsSwitchingModule:Z

    return v0
.end method

.method public loadCameraSound(I)V
    .locals 1

    .line 772
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mCameraSound:Lcom/android/camera/MiuiCameraSound;

    if-eqz v0, :cond_0

    .line 773
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mCameraSound:Lcom/android/camera/MiuiCameraSound;

    invoke-virtual {v0, p1}, Lcom/android/camera/MiuiCameraSound;->load(I)V

    .line 775
    :cond_0
    return-void
.end method

.method public abstract notifyOnFirstFrameArrived(I)V
    .annotation build Landroid/support/annotation/UiThread;
    .end annotation
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 1

    .line 854
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mCurrentModule:Lcom/android/camera/module/Module;

    invoke-interface {v0, p1, p2, p3}, Lcom/android/camera/module/Module;->onActivityResult(IILandroid/content/Intent;)V

    .line 855
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 2

    .line 237
    sget-boolean v0, Lcom/android/camera/Util;->isNotchDevice:Z

    if-eqz v0, :cond_0

    .line 239
    invoke-virtual {p0}, Lcom/android/camera/ActivityBase;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-static {v0}, Lcom/android/camera/lib/compatibility/util/CompatibilityUtils;->setCutoutModeShortEdges(Landroid/view/Window;)V

    .line 241
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/ActivityBase;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/16 v1, 0x400

    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    .line 245
    invoke-super {p0, p1}, Landroid/support/v4/app/FragmentActivity;->onCreate(Landroid/os/Bundle;)V

    .line 246
    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Lcom/android/camera/ActivityBase;->setVolumeControlStream(I)V

    .line 247
    new-instance v0, Lcom/android/camera/ui/ScreenHint;

    invoke-direct {v0, p0}, Lcom/android/camera/ui/ScreenHint;-><init>(Landroid/app/Activity;)V

    iput-object v0, p0, Lcom/android/camera/ActivityBase;->mScreenHint:Lcom/android/camera/ui/ScreenHint;

    .line 248
    new-instance v0, Lcom/android/camera/ThumbnailUpdater;

    invoke-direct {v0, p0}, Lcom/android/camera/ThumbnailUpdater;-><init>(Lcom/android/camera/ActivityBase;)V

    iput-object v0, p0, Lcom/android/camera/ActivityBase;->mThumbnailUpdater:Lcom/android/camera/ThumbnailUpdater;

    .line 249
    const-string v0, "keyguard"

    invoke-virtual {p0, v0}, Lcom/android/camera/ActivityBase;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/KeyguardManager;

    iput-object v0, p0, Lcom/android/camera/ActivityBase;->mKeyguardManager:Landroid/app/KeyguardManager;

    .line 250
    invoke-virtual {p0}, Lcom/android/camera/ActivityBase;->getKeyguardFlag()Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/camera/ActivityBase;->mStartFromKeyguard:Z

    .line 251
    iget-boolean v0, p0, Lcom/android/camera/ActivityBase;->mStartFromKeyguard:Z

    if-eqz v0, :cond_1

    .line 252
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mKeyguardManager:Landroid/app/KeyguardManager;

    invoke-virtual {v0}, Landroid/app/KeyguardManager;->isKeyguardSecure()Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/camera/ActivityBase;->mKeyguardSecureLocked:Z

    .line 255
    :cond_1
    iget-boolean v0, p0, Lcom/android/camera/ActivityBase;->mStartFromKeyguard:Z

    if-eqz v0, :cond_2

    .line 256
    invoke-virtual {p0}, Lcom/android/camera/ActivityBase;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Intent;->getFlags()I

    move-result v0

    const/high16 v1, 0x800000

    and-int/2addr v0, v1

    if-nez v0, :cond_2

    goto :goto_0

    :cond_2
    const/4 p1, 0x0

    .line 257
    :goto_0
    if-eqz p1, :cond_3

    .line 258
    const-string p1, "ActivityBase"

    const-string v0, "onCreate: addFlag --> FLAG_TURN_SCREEN_ON"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 259
    invoke-virtual {p0}, Lcom/android/camera/ActivityBase;->getWindow()Landroid/view/Window;

    move-result-object p1

    const/high16 v0, 0x200000

    invoke-virtual {p1, v0}, Landroid/view/Window;->addFlags(I)V

    .line 261
    :cond_3
    iget-object p1, p0, Lcom/android/camera/ActivityBase;->mApplication:Lcom/android/camera/CameraAppImpl;

    invoke-virtual {p1, p0}, Lcom/android/camera/CameraAppImpl;->addActivity(Landroid/app/Activity;)V

    .line 262
    new-instance p1, Lcom/android/camera/CameraBrightness;

    invoke-direct {p1, p0}, Lcom/android/camera/CameraBrightness;-><init>(Landroid/app/Activity;)V

    iput-object p1, p0, Lcom/android/camera/ActivityBase;->mCameraBrightness:Lcom/android/camera/CameraBrightness;

    .line 263
    invoke-static {}, Lcom/android/camera/LocationManager;->instance()Lcom/android/camera/LocationManager;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/ActivityBase;->mLocationManager:Lcom/android/camera/LocationManager;

    .line 265
    new-instance p1, Ljava/lang/Thread;

    new-instance v0, Lcom/android/camera/ActivityBase$1;

    invoke-direct {v0, p0}, Lcom/android/camera/ActivityBase$1;-><init>(Lcom/android/camera/ActivityBase;)V

    invoke-direct {p1, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    iput-object p1, p0, Lcom/android/camera/ActivityBase;->mCloseActivityThread:Ljava/lang/Thread;

    .line 273
    :try_start_0
    iget-object p1, p0, Lcom/android/camera/ActivityBase;->mCloseActivityThread:Ljava/lang/Thread;

    invoke-virtual {p1}, Ljava/lang/Thread;->start()V
    :try_end_0
    .catch Ljava/lang/IllegalThreadStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 276
    goto :goto_1

    .line 274
    :catch_0
    move-exception p1

    .line 275
    const-string v0, "ActivityBase"

    invoke-virtual {p1}, Ljava/lang/IllegalThreadStateException;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 277
    :goto_1
    return-void
.end method

.method protected onDestroy()V
    .locals 3

    .line 588
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mCameraScreenNail:Lcom/android/camera/CameraScreenNail;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mCameraScreenNail:Lcom/android/camera/CameraScreenNail;

    invoke-virtual {v0}, Lcom/android/camera/CameraScreenNail;->getLastFrameGaussianBitmap()Landroid/graphics/Bitmap;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 589
    invoke-static {}, Lio/reactivex/schedulers/Schedulers;->io()Lio/reactivex/Scheduler;

    move-result-object v1

    new-instance v2, Lcom/android/camera/ActivityBase$7;

    invoke-direct {v2, p0, v0}, Lcom/android/camera/ActivityBase$7;-><init>(Lcom/android/camera/ActivityBase;Landroid/graphics/Bitmap;)V

    invoke-virtual {v1, v2}, Lio/reactivex/Scheduler;->scheduleDirect(Ljava/lang/Runnable;)Lio/reactivex/disposables/Disposable;

    .line 596
    :cond_0
    invoke-static {p0}, Lcom/android/camera/ui/PopupManager;->removeInstance(Landroid/content/Context;)V

    .line 597
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mApplication:Lcom/android/camera/CameraAppImpl;

    invoke-virtual {v0, p0}, Lcom/android/camera/CameraAppImpl;->removeActivity(Landroid/app/Activity;)V

    .line 598
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mTrackAppLunchDisposable:Lio/reactivex/disposables/Disposable;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 599
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mTrackAppLunchDisposable:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 600
    iput-object v1, p0, Lcom/android/camera/ActivityBase;->mTrackAppLunchDisposable:Lio/reactivex/disposables/Disposable;

    .line 602
    :cond_1
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mCameraSound:Lcom/android/camera/MiuiCameraSound;

    if-eqz v0, :cond_2

    .line 603
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mCameraSound:Lcom/android/camera/MiuiCameraSound;

    invoke-virtual {v0}, Lcom/android/camera/MiuiCameraSound;->release()V

    .line 604
    iput-object v1, p0, Lcom/android/camera/ActivityBase;->mCameraSound:Lcom/android/camera/MiuiCameraSound;

    .line 606
    :cond_2
    invoke-super {p0}, Landroid/support/v4/app/FragmentActivity;->onDestroy()V

    .line 607
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 1

    .line 571
    const/16 v0, 0x54

    if-ne p1, v0, :cond_0

    .line 572
    invoke-virtual {p2}, Landroid/view/KeyEvent;->isLongPress()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p1, 0x1

    return p1

    .line 574
    :cond_0
    invoke-super {p0, p1, p2}, Landroid/support/v4/app/FragmentActivity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result p1

    return p1
.end method

.method public onLayoutChange(Landroid/graphics/Rect;)V
    .locals 2

    .line 715
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mCameraScreenNail:Lcom/android/camera/CameraScreenNail;

    invoke-virtual {v0, p1}, Lcom/android/camera/CameraScreenNail;->setRenderArea(Landroid/graphics/Rect;)V

    .line 717
    invoke-static {p0}, Lcom/android/camera/Util;->getDisplayRotation(Landroid/app/Activity;)I

    move-result v0

    rem-int/lit16 v0, v0, 0xb4

    if-nez v0, :cond_0

    .line 718
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mCameraScreenNail:Lcom/android/camera/CameraScreenNail;

    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    move-result v1

    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    move-result p1

    invoke-virtual {v0, v1, p1}, Lcom/android/camera/CameraScreenNail;->setPreviewFrameLayoutSize(II)V

    goto :goto_0

    .line 722
    :cond_0
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mCameraScreenNail:Lcom/android/camera/CameraScreenNail;

    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    move-result v1

    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    move-result p1

    invoke-virtual {v0, v1, p1}, Lcom/android/camera/CameraScreenNail;->setPreviewFrameLayoutSize(II)V

    .line 724
    :goto_0
    return-void
.end method

.method protected onNewIntent(Landroid/content/Intent;)V
    .locals 0

    .line 281
    invoke-super {p0, p1}, Landroid/support/v4/app/FragmentActivity;->onNewIntent(Landroid/content/Intent;)V

    .line 282
    invoke-direct {p0}, Lcom/android/camera/ActivityBase;->checkGalleryLock()V

    .line 283
    invoke-direct {p0}, Lcom/android/camera/ActivityBase;->checkKeyguardFlag()V

    .line 284
    return-void
.end method

.method public onNewUriArrived(Landroid/net/Uri;Ljava/lang/String;)V
    .locals 1

    .line 736
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mCurrentModule:Lcom/android/camera/module/Module;

    if-eqz v0, :cond_0

    .line 737
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mCurrentModule:Lcom/android/camera/module/Module;

    invoke-interface {v0, p1, p2}, Lcom/android/camera/module/Module;->onNewUriArrived(Landroid/net/Uri;Ljava/lang/String;)V

    .line 739
    :cond_0
    invoke-direct {p0, p1}, Lcom/android/camera/ActivityBase;->addSecureUriIfNecessary(Landroid/net/Uri;)V

    .line 740
    return-void
.end method

.method protected onPause()V
    .locals 4

    .line 471
    invoke-super {p0}, Landroid/support/v4/app/FragmentActivity;->onPause()V

    .line 472
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mCameraScreenNail:Lcom/android/camera/CameraScreenNail;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/android/camera/ActivityBase;->isShowBottomIntentDone()Z

    move-result v0

    if-nez v0, :cond_0

    .line 473
    const-string v0, "ActivityBase"

    const-string v1, "onPause: readLastFrameGaussian..."

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 474
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mCameraScreenNail:Lcom/android/camera/CameraScreenNail;

    invoke-virtual {v0}, Lcom/android/camera/CameraScreenNail;->readLastFrameGaussian()V

    .line 476
    :cond_0
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mGLCoverDisposable:Lio/reactivex/disposables/Disposable;

    if-eqz v0, :cond_1

    .line 477
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mGLCoverDisposable:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 479
    :cond_1
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mErrorDialog:Landroid/app/AlertDialog;

    if-eqz v0, :cond_2

    .line 480
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mErrorDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    .line 482
    :cond_2
    invoke-virtual {p0}, Lcom/android/camera/ActivityBase;->pause()V

    .line 484
    invoke-virtual {p0}, Lcom/android/camera/ActivityBase;->startFromKeyguard()Z

    move-result v0

    if-eqz v0, :cond_3

    iget-boolean v0, p0, Lcom/android/camera/ActivityBase;->mIsFinishInKeyguard:Z

    if-eqz v0, :cond_3

    .line 485
    const-string v0, "ActivityBase"

    const-string v1, "onPause: clearFlag --> FLAG_TURN_SCREEN_ON"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 486
    invoke-virtual {p0}, Lcom/android/camera/ActivityBase;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/high16 v1, 0x200000

    invoke-virtual {v0, v1}, Landroid/view/Window;->clearFlags(I)V

    .line 487
    iget v0, p0, Lcom/android/camera/ActivityBase;->mJumpFlag:I

    if-nez v0, :cond_3

    .line 489
    invoke-virtual {p0}, Lcom/android/camera/ActivityBase;->finish()V

    .line 499
    :cond_3
    iget v0, p0, Lcom/android/camera/ActivityBase;->mJumpFlag:I

    const/4 v1, 0x1

    if-nez v0, :cond_5

    invoke-virtual {p0}, Lcom/android/camera/ActivityBase;->startFromSecureKeyguard()Z

    move-result v0

    if-nez v0, :cond_4

    invoke-virtual {p0}, Lcom/android/camera/ActivityBase;->isGalleryLocked()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 501
    :cond_4
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera/ActivityBase;->mSecureUriList:Ljava/util/ArrayList;

    .line 502
    iget-object v2, p0, Lcom/android/camera/ActivityBase;->mThumbnailUpdater:Lcom/android/camera/ThumbnailUpdater;

    const/4 v3, 0x0

    invoke-virtual {v2, v0, v1, v3}, Lcom/android/camera/ThumbnailUpdater;->setThumbnail(Lcom/android/camera/Thumbnail;ZZ)V

    goto :goto_0

    .line 503
    :cond_5
    iget v0, p0, Lcom/android/camera/ActivityBase;->mJumpFlag:I

    if-ne v0, v1, :cond_6

    .line 505
    invoke-direct {p0}, Lcom/android/camera/ActivityBase;->clearNotification()V

    .line 507
    :cond_6
    :goto_0
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 508
    return-void
.end method

.method protected onResume()V
    .locals 1

    .line 288
    invoke-super {p0}, Landroid/support/v4/app/FragmentActivity;->onResume()V

    .line 289
    invoke-virtual {p0}, Lcom/android/camera/ActivityBase;->showBlurCover()V

    .line 290
    iget v0, p0, Lcom/android/camera/ActivityBase;->mJumpFlag:I

    iput v0, p0, Lcom/android/camera/ActivityBase;->mLastJumpFlag:I

    .line 291
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera/ActivityBase;->mJumpFlag:I

    .line 292
    invoke-direct {p0}, Lcom/android/camera/ActivityBase;->checkGalleryLock()V

    .line 293
    invoke-direct {p0}, Lcom/android/camera/ActivityBase;->checkKeyguardFlag()V

    .line 294
    invoke-virtual {p0}, Lcom/android/camera/ActivityBase;->resume()V

    .line 295
    return-void
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 1

    .line 579
    invoke-super {p0, p1}, Landroid/support/v4/app/FragmentActivity;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 580
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mCurrentModule:Lcom/android/camera/module/Module;

    if-eqz v0, :cond_0

    .line 581
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mCurrentModule:Lcom/android/camera/module/Module;

    invoke-interface {v0, p1}, Lcom/android/camera/module/Module;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 583
    :cond_0
    return-void
.end method

.method public onSearchRequested()Z
    .locals 1

    .line 565
    const/4 v0, 0x0

    return v0
.end method

.method protected onStart()V
    .locals 1

    .line 464
    invoke-super {p0}, Landroid/support/v4/app/FragmentActivity;->onStart()V

    .line 466
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mGLView:Lcom/android/camera/ui/V6CameraGLSurfaceView;

    invoke-virtual {v0}, Lcom/android/camera/ui/V6CameraGLSurfaceView;->onResume()V

    .line 467
    return-void
.end method

.method protected onStop()V
    .locals 1

    .line 512
    invoke-super {p0}, Landroid/support/v4/app/FragmentActivity;->onStop()V

    .line 514
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mGLView:Lcom/android/camera/ui/V6CameraGLSurfaceView;

    invoke-virtual {v0}, Lcom/android/camera/ui/V6CameraGLSurfaceView;->onPause()V

    .line 515
    invoke-virtual {p0}, Lcom/android/camera/ActivityBase;->releaseCameraScreenNail()V

    .line 516
    return-void
.end method

.method public pause()V
    .locals 2

    .line 533
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 534
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mCameraBrightness:Lcom/android/camera/CameraBrightness;

    invoke-virtual {v0}, Lcom/android/camera/CameraBrightness;->onPause()V

    .line 535
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mCloseActivityThread:Ljava/lang/Thread;

    if-eqz v0, :cond_0

    .line 537
    :try_start_0
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mCloseActivityThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->join()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 540
    goto :goto_0

    .line 538
    :catch_0
    move-exception v0

    .line 539
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    .line 541
    :goto_0
    iput-object v1, p0, Lcom/android/camera/ActivityBase;->mCloseActivityThread:Ljava/lang/Thread;

    .line 544
    :cond_0
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mLocationManager:Lcom/android/camera/LocationManager;

    if-eqz v0, :cond_1

    .line 545
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mLocationManager:Lcom/android/camera/LocationManager;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/camera/LocationManager;->recordLocation(Z)V

    .line 548
    :cond_1
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mThumbnailUpdater:Lcom/android/camera/ThumbnailUpdater;

    if-eqz v0, :cond_2

    .line 549
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mThumbnailUpdater:Lcom/android/camera/ThumbnailUpdater;

    invoke-virtual {v0}, Lcom/android/camera/ThumbnailUpdater;->saveThumbnailToFile()V

    .line 550
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mThumbnailUpdater:Lcom/android/camera/ThumbnailUpdater;

    invoke-virtual {v0}, Lcom/android/camera/ThumbnailUpdater;->cancelTask()V

    .line 552
    :cond_2
    return-void
.end method

.method public playCameraSound(I)V
    .locals 1

    .line 768
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mCameraSound:Lcom/android/camera/MiuiCameraSound;

    invoke-virtual {v0, p1}, Lcom/android/camera/MiuiCameraSound;->playSound(I)V

    .line 769
    return-void
.end method

.method protected releaseCameraScreenNail()V
    .locals 2

    .line 704
    const-string v0, "ActivityBase"

    const-string v1, "releaseCameraScreenNail: "

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 705
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mCameraScreenNail:Lcom/android/camera/CameraScreenNail;

    if-eqz v0, :cond_0

    .line 706
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mCameraScreenNail:Lcom/android/camera/CameraScreenNail;

    invoke-virtual {v0}, Lcom/android/camera/CameraScreenNail;->releaseSurfaceTexture()V

    .line 708
    :cond_0
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mCurrentModule:Lcom/android/camera/module/Module;

    if-eqz v0, :cond_1

    .line 709
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mCurrentModule:Lcom/android/camera/module/Module;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Lcom/android/camera/module/Module;->setFrameAvailable(Z)V

    .line 711
    :cond_1
    return-void
.end method

.method public resetStartTime()V
    .locals 2

    .line 959
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/android/camera/ActivityBase;->mAppStartTime:J

    .line 960
    return-void
.end method

.method public resume()V
    .locals 2

    .line 519
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mCameraSound:Lcom/android/camera/MiuiCameraSound;

    if-nez v0, :cond_0

    .line 520
    new-instance v0, Lcom/android/camera/MiuiCameraSound;

    invoke-direct {v0, p0}, Lcom/android/camera/MiuiCameraSound;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/android/camera/ActivityBase;->mCameraSound:Lcom/android/camera/MiuiCameraSound;

    .line 527
    :cond_0
    invoke-static {}, Lcom/android/camera/CameraSettings;->isRecordLocation()Z

    move-result v0

    .line 528
    iget-object v1, p0, Lcom/android/camera/ActivityBase;->mLocationManager:Lcom/android/camera/LocationManager;

    invoke-virtual {v1, v0}, Lcom/android/camera/LocationManager;->recordLocation(Z)V

    .line 529
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mCameraBrightness:Lcom/android/camera/CameraBrightness;

    invoke-virtual {v0}, Lcom/android/camera/CameraBrightness;->onResume()V

    .line 530
    return-void
.end method

.method public setErrorDialog(Landroid/app/AlertDialog;)V
    .locals 0

    .line 207
    iput-object p1, p0, Lcom/android/camera/ActivityBase;->mErrorDialog:Landroid/app/AlertDialog;

    .line 208
    return-void
.end method

.method public setJumpFlag(I)V
    .locals 0

    .line 889
    iput p1, p0, Lcom/android/camera/ActivityBase;->mJumpFlag:I

    .line 890
    return-void
.end method

.method public setSwitchingModule(Z)V
    .locals 0

    .line 903
    iput-boolean p1, p0, Lcom/android/camera/ActivityBase;->mIsSwitchingModule:Z

    .line 904
    return-void
.end method

.method protected showBlurCover()V
    .locals 4

    .line 298
    invoke-virtual {p0}, Lcom/android/camera/ActivityBase;->isShowBottomIntentDone()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 299
    return-void

    .line 301
    :cond_0
    iget-boolean v0, p0, Lcom/android/camera/ActivityBase;->mDelayReleaseCamera:Z

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/android/camera/ActivityBase;->isPostProcessing()Z

    move-result v0

    if-nez v0, :cond_1

    .line 302
    return-void

    .line 304
    :cond_1
    invoke-virtual {p0}, Lcom/android/camera/ActivityBase;->getCameraIntentManager()Lcom/android/camera/CameraIntentManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/CameraIntentManager;->isFromScreenSlide()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 305
    return-void

    .line 308
    :cond_2
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 309
    new-instance v2, Lcom/android/camera/ActivityBase$2;

    invoke-direct {v2, p0}, Lcom/android/camera/ActivityBase$2;-><init>(Lcom/android/camera/ActivityBase;)V

    .line 326
    nop

    .line 327
    invoke-static {}, Lio/reactivex/schedulers/Schedulers;->io()Lio/reactivex/Scheduler;

    move-result-object v3

    invoke-virtual {v2, v3}, Lio/reactivex/Single;->subscribeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Single;

    move-result-object v2

    .line 328
    invoke-static {}, Lio/reactivex/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/Scheduler;

    move-result-object v3

    invoke-virtual {v2, v3}, Lio/reactivex/Single;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Single;

    move-result-object v2

    new-instance v3, Lcom/android/camera/ActivityBase$3;

    invoke-direct {v3, p0, v0, v1}, Lcom/android/camera/ActivityBase$3;-><init>(Lcom/android/camera/ActivityBase;J)V

    .line 329
    invoke-virtual {v2, v3}, Lio/reactivex/Single;->subscribe(Lio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/ActivityBase;->mGLCoverDisposable:Lio/reactivex/disposables/Disposable;

    .line 349
    return-void
.end method

.method public showDebugInfo(Ljava/lang/String;)V
    .locals 1

    .line 211
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mDebugInfoView:Landroid/widget/TextView;

    if-eqz v0, :cond_0

    .line 212
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mDebugInfoView:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 214
    :cond_0
    return-void
.end method

.method public showErrorDialog()V
    .locals 1

    .line 203
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/ActivityBase;->mCameraErrorShown:Z

    .line 204
    return-void
.end method

.method public startFromKeyguard()Z
    .locals 1

    .line 760
    iget-boolean v0, p0, Lcom/android/camera/ActivityBase;->mStartFromKeyguard:Z

    return v0
.end method

.method public startFromSecureKeyguard()Z
    .locals 1

    .line 752
    iget-boolean v0, p0, Lcom/android/camera/ActivityBase;->mKeyguardSecureLocked:Z

    return v0
.end method

.method protected trackAppLunchTimeStart(Z)V
    .locals 1

    .line 373
    invoke-static {p1}, Lcom/android/camera/statistic/ScenarioTrackUtil;->trackAppLunchTimeStart(Z)V

    .line 374
    new-instance p1, Lcom/android/camera/ActivityBase$5;

    invoke-direct {p1, p0}, Lcom/android/camera/ActivityBase$5;-><init>(Lcom/android/camera/ActivityBase;)V

    .line 407
    nop

    .line 408
    invoke-static {}, Lio/reactivex/schedulers/Schedulers;->io()Lio/reactivex/Scheduler;

    move-result-object v0

    invoke-virtual {p1, v0}, Lio/reactivex/Single;->subscribeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Single;

    move-result-object p1

    .line 409
    invoke-static {}, Lio/reactivex/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/Scheduler;

    move-result-object v0

    invoke-virtual {p1, v0}, Lio/reactivex/Single;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Single;

    move-result-object p1

    new-instance v0, Lcom/android/camera/ActivityBase$6;

    invoke-direct {v0, p0}, Lcom/android/camera/ActivityBase$6;-><init>(Lcom/android/camera/ActivityBase;)V

    .line 410
    invoke-virtual {p1, v0}, Lio/reactivex/Single;->subscribe(Lio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/ActivityBase;->mTrackAppLunchDisposable:Lio/reactivex/disposables/Disposable;

    .line 416
    return-void
.end method

.method public declared-synchronized updateSurfaceState(I)V
    .locals 3

    monitor-enter p0

    .line 954
    :try_start_0
    const-string v0, "ActivityBase"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "updateSurfaceState: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 955
    iput p1, p0, Lcom/android/camera/ActivityBase;->mCurrentSurfaceState:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 956
    monitor-exit p0

    return-void

    .line 953
    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method
