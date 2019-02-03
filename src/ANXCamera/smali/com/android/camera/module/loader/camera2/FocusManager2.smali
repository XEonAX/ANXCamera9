.class public Lcom/android/camera/module/loader/camera2/FocusManager2;
.super Lcom/android/camera/FocusManagerAbstract;
.source "FocusManager2.java"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x15
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/module/loader/camera2/FocusManager2$MainHandler;,
        Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;
    }
.end annotation


# static fields
.field private static final FOCUS_TIME_OUT:I = 0xfa0

.field private static final FORCE_RESET_TOUCH_FOCUS:I = 0x1

.field private static final FORCE_RESET_TOUCH_FOCUS_DELAY:I = 0x1388

.field private static final MAX_FACE_MOVE:I = 0x50

.field private static final RESET_TOUCH_FOCUS:I = 0x0

.field private static final RESET_TOUCH_FOCUS_DELAY:I = 0xbb8

.field private static final TAG:Ljava/lang/String; = "FocusManager"

.field private static final TAP_ACTION_AE:I = 0x1

.field private static final TAP_ACTION_AE_AND_AF:I = 0x2


# instance fields
.field private mAeAwbLock:Z

.field private mCafStartTime:J

.field private mCameraFocusArea:Landroid/graphics/Rect;

.field private mCameraMeteringArea:Landroid/graphics/Rect;

.field private mDestroyed:Z

.field private mFocusAreaSupported:Z

.field private mFocusMode:Ljava/lang/String;

.field private mFocusResultConsumer:Lio/reactivex/functions/Consumer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Consumer<",
            "Lcom/android/camera/module/loader/camera2/FocusTask;",
            ">;"
        }
    .end annotation
.end field

.field private mFocusResultDisposable:Lio/reactivex/disposables/Disposable;

.field private mFocusResultEmitter:Lio/reactivex/ObservableEmitter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/ObservableEmitter<",
            "Lcom/android/camera/module/loader/camera2/FocusTask;",
            ">;"
        }
    .end annotation
.end field

.field private mHandler:Landroid/os/Handler;

.field private mKeepFocusUIState:Z

.field private mLastFocusFrom:I

.field private mLastState:I

.field private mLatestFocusFace:Landroid/graphics/RectF;

.field private mLatestFocusTime:J

.field private mListener:Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;

.field private mLockAeAwbNeeded:Z

.field private mMeteringAreaSupported:Z

.field private mOverrideFocusMode:Ljava/lang/String;

.field private mPendingMultiCapture:Z

.field private mSupportedFocusModes:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/android/camera2/CameraCapabilities;Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;ZLandroid/os/Looper;)V
    .locals 1

    .line 180
    invoke-direct {p0}, Lcom/android/camera/FocusManagerAbstract;-><init>()V

    .line 88
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mLastState:I

    .line 104
    const/4 v0, -0x1

    iput v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mLastFocusFrom:I

    .line 366
    new-instance v0, Lcom/android/camera/module/loader/camera2/FocusManager2$2;

    invoke-direct {v0, p0}, Lcom/android/camera/module/loader/camera2/FocusManager2$2;-><init>(Lcom/android/camera/module/loader/camera2/FocusManager2;)V

    iput-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mFocusResultConsumer:Lio/reactivex/functions/Consumer;

    .line 181
    new-instance v0, Lcom/android/camera/module/loader/camera2/FocusManager2$MainHandler;

    invoke-direct {v0, p0, p4}, Lcom/android/camera/module/loader/camera2/FocusManager2$MainHandler;-><init>(Lcom/android/camera/module/loader/camera2/FocusManager2;Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mHandler:Landroid/os/Handler;

    .line 182
    invoke-virtual {p0, p1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setCharacteristics(Lcom/android/camera2/CameraCapabilities;)V

    .line 183
    iput-object p2, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mListener:Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;

    .line 184
    invoke-virtual {p0, p3}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setMirror(Z)V

    .line 186
    new-instance p1, Lcom/android/camera/module/loader/camera2/FocusManager2$1;

    invoke-direct {p1, p0}, Lcom/android/camera/module/loader/camera2/FocusManager2$1;-><init>(Lcom/android/camera/module/loader/camera2/FocusManager2;)V

    invoke-static {p1}, Lio/reactivex/Observable;->create(Lio/reactivex/ObservableOnSubscribe;)Lio/reactivex/Observable;

    move-result-object p1

    .line 192
    invoke-static {}, Lio/reactivex/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/Scheduler;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/reactivex/Observable;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object p1

    iget-object p2, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mFocusResultConsumer:Lio/reactivex/functions/Consumer;

    invoke-virtual {p1, p2}, Lio/reactivex/Observable;->subscribe(Lio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mFocusResultDisposable:Lio/reactivex/disposables/Disposable;

    .line 193
    return-void
.end method

.method static synthetic access$000(Lcom/android/camera/module/loader/camera2/FocusManager2;I)V
    .locals 0

    .line 77
    invoke-direct {p0, p1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setFocusState(I)V

    return-void
.end method

.method static synthetic access$100(Lcom/android/camera/module/loader/camera2/FocusManager2;I)V
    .locals 0

    .line 77
    invoke-direct {p0, p1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setLastFocusState(I)V

    return-void
.end method

.method static synthetic access$1000(Lcom/android/camera/module/loader/camera2/FocusManager2;)I
    .locals 0

    .line 77
    iget p0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mState:I

    return p0
.end method

.method static synthetic access$1100(Lcom/android/camera/module/loader/camera2/FocusManager2;)Ljava/lang/String;
    .locals 0

    .line 77
    iget-object p0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mFocusMode:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$1200(Lcom/android/camera/module/loader/camera2/FocusManager2;)I
    .locals 0

    .line 77
    iget p0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mLastFocusFrom:I

    return p0
.end method

.method static synthetic access$1300(Lcom/android/camera/module/loader/camera2/FocusManager2;)Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;
    .locals 0

    .line 77
    iget-object p0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mListener:Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;

    return-object p0
.end method

.method static synthetic access$1400(Lcom/android/camera/module/loader/camera2/FocusManager2;)Z
    .locals 0

    .line 77
    iget-boolean p0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mMirror:Z

    return p0
.end method

.method static synthetic access$1500(Lcom/android/camera/module/loader/camera2/FocusManager2;)Landroid/os/Handler;
    .locals 0

    .line 77
    iget-object p0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mHandler:Landroid/os/Handler;

    return-object p0
.end method

.method static synthetic access$1602(Lcom/android/camera/module/loader/camera2/FocusManager2;Z)Z
    .locals 0

    .line 77
    iput-boolean p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mCancelAutoFocusIfMove:Z

    return p1
.end method

.method static synthetic access$1700(Lcom/android/camera/module/loader/camera2/FocusManager2;)I
    .locals 0

    .line 77
    iget p0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mState:I

    return p0
.end method

.method static synthetic access$200(Lcom/android/camera/module/loader/camera2/FocusManager2;)Z
    .locals 0

    .line 77
    iget-boolean p0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mPendingMultiCapture:Z

    return p0
.end method

.method static synthetic access$300(Lcom/android/camera/module/loader/camera2/FocusManager2;)V
    .locals 0

    .line 77
    invoke-direct {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->multiCapture()V

    return-void
.end method

.method static synthetic access$400(Lcom/android/camera/module/loader/camera2/FocusManager2;)V
    .locals 0

    .line 77
    invoke-direct {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->capture()V

    return-void
.end method

.method static synthetic access$502(Lcom/android/camera/module/loader/camera2/FocusManager2;Lio/reactivex/ObservableEmitter;)Lio/reactivex/ObservableEmitter;
    .locals 0

    .line 77
    iput-object p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mFocusResultEmitter:Lio/reactivex/ObservableEmitter;

    return-object p1
.end method

.method static synthetic access$600(Lcom/android/camera/module/loader/camera2/FocusManager2;)Z
    .locals 0

    .line 77
    iget-boolean p0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mDestroyed:Z

    return p0
.end method

.method static synthetic access$700(Lcom/android/camera/module/loader/camera2/FocusManager2;)I
    .locals 0

    .line 77
    iget p0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mState:I

    return p0
.end method

.method static synthetic access$800(Lcom/android/camera/module/loader/camera2/FocusManager2;ZZ)V
    .locals 0

    .line 77
    invoke-direct {p0, p1, p2}, Lcom/android/camera/module/loader/camera2/FocusManager2;->onAutoFocusMoving(ZZ)V

    return-void
.end method

.method static synthetic access$900(Lcom/android/camera/module/loader/camera2/FocusManager2;)I
    .locals 0

    .line 77
    iget p0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mState:I

    return p0
.end method

.method private afaeRectangle(Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Rect;)[Landroid/hardware/camera2/params/MeteringRectangle;
    .locals 5

    .line 1008
    const/4 v0, 0x1

    new-array v1, v0, [Landroid/hardware/camera2/params/MeteringRectangle;

    .line 1009
    new-instance v2, Landroid/graphics/RectF;

    invoke-direct {v2, p1}, Landroid/graphics/RectF;-><init>(Landroid/graphics/Rect;)V

    .line 1010
    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p1, v2}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 1011
    new-instance p1, Landroid/graphics/Matrix;

    invoke-direct {p1}, Landroid/graphics/Matrix;-><init>()V

    .line 1012
    invoke-virtual {p3}, Landroid/graphics/Rect;->width()I

    move-result v3

    div-int/lit8 v3, v3, 0x2

    int-to-float v3, v3

    invoke-virtual {p3}, Landroid/graphics/Rect;->height()I

    move-result v4

    div-int/lit8 v4, v4, 0x2

    int-to-float v4, v4

    invoke-virtual {p1, v3, v4}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 1013
    invoke-virtual {p1, v2}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 1014
    iget p1, v2, Landroid/graphics/RectF;->left:F

    invoke-virtual {p2}, Landroid/graphics/Rect;->width()I

    move-result v3

    int-to-float v3, v3

    mul-float/2addr p1, v3

    .line 1015
    invoke-virtual {p3}, Landroid/graphics/Rect;->width()I

    move-result v3

    int-to-float v3, v3

    div-float/2addr p1, v3

    iget v3, p2, Landroid/graphics/Rect;->left:I

    int-to-float v3, v3

    add-float/2addr p1, v3

    iput p1, v2, Landroid/graphics/RectF;->left:F

    .line 1016
    iget p1, v2, Landroid/graphics/RectF;->top:F

    invoke-virtual {p2}, Landroid/graphics/Rect;->height()I

    move-result v3

    int-to-float v3, v3

    mul-float/2addr p1, v3

    .line 1017
    invoke-virtual {p3}, Landroid/graphics/Rect;->height()I

    move-result v3

    int-to-float v3, v3

    div-float/2addr p1, v3

    iget v3, p2, Landroid/graphics/Rect;->top:I

    int-to-float v3, v3

    add-float/2addr p1, v3

    iput p1, v2, Landroid/graphics/RectF;->top:F

    .line 1018
    iget p1, v2, Landroid/graphics/RectF;->right:F

    invoke-virtual {p2}, Landroid/graphics/Rect;->width()I

    move-result v3

    int-to-float v3, v3

    mul-float/2addr p1, v3

    .line 1019
    invoke-virtual {p3}, Landroid/graphics/Rect;->width()I

    move-result v3

    int-to-float v3, v3

    div-float/2addr p1, v3

    iget v3, p2, Landroid/graphics/Rect;->left:I

    int-to-float v3, v3

    add-float/2addr p1, v3

    iput p1, v2, Landroid/graphics/RectF;->right:F

    .line 1020
    iget p1, v2, Landroid/graphics/RectF;->bottom:F

    invoke-virtual {p2}, Landroid/graphics/Rect;->height()I

    move-result v3

    int-to-float v3, v3

    mul-float/2addr p1, v3

    .line 1021
    invoke-virtual {p3}, Landroid/graphics/Rect;->height()I

    move-result p3

    int-to-float p3, p3

    div-float/2addr p1, p3

    iget p3, p2, Landroid/graphics/Rect;->top:I

    int-to-float p3, p3

    add-float/2addr p1, p3

    iput p1, v2, Landroid/graphics/RectF;->bottom:F

    .line 1023
    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    .line 1024
    invoke-static {v2, p1}, Lcom/android/camera/Util;->rectFToRect(Landroid/graphics/RectF;Landroid/graphics/Rect;)V

    .line 1026
    iget p3, p1, Landroid/graphics/Rect;->left:I

    iget v2, p2, Landroid/graphics/Rect;->left:I

    iget v3, p2, Landroid/graphics/Rect;->right:I

    invoke-static {p3, v2, v3}, Lcom/android/camera/Util;->clamp(III)I

    move-result p3

    iput p3, p1, Landroid/graphics/Rect;->left:I

    .line 1028
    iget p3, p1, Landroid/graphics/Rect;->top:I

    iget v2, p2, Landroid/graphics/Rect;->top:I

    iget v3, p2, Landroid/graphics/Rect;->bottom:I

    invoke-static {p3, v2, v3}, Lcom/android/camera/Util;->clamp(III)I

    move-result p3

    iput p3, p1, Landroid/graphics/Rect;->top:I

    .line 1030
    iget p3, p1, Landroid/graphics/Rect;->right:I

    iget v2, p2, Landroid/graphics/Rect;->left:I

    iget v3, p2, Landroid/graphics/Rect;->right:I

    invoke-static {p3, v2, v3}, Lcom/android/camera/Util;->clamp(III)I

    move-result p3

    iput p3, p1, Landroid/graphics/Rect;->right:I

    .line 1032
    iget p3, p1, Landroid/graphics/Rect;->bottom:I

    iget v2, p2, Landroid/graphics/Rect;->top:I

    iget p2, p2, Landroid/graphics/Rect;->bottom:I

    invoke-static {p3, v2, p2}, Lcom/android/camera/Util;->clamp(III)I

    move-result p2

    iput p2, p1, Landroid/graphics/Rect;->bottom:I

    .line 1035
    new-instance p2, Landroid/hardware/camera2/params/MeteringRectangle;

    invoke-direct {p2, p1, v0}, Landroid/hardware/camera2/params/MeteringRectangle;-><init>(Landroid/graphics/Rect;I)V

    const/4 p1, 0x0

    aput-object p2, v1, p1

    .line 1036
    return-object v1
.end method

.method private capture()V
    .locals 2

    .line 774
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mListener:Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;

    invoke-interface {v0}, Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;->onWaitingFocusFinished()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 775
    invoke-static {}, Lcom/mi/config/b;->gu()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 776
    invoke-direct {p0, v1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setFocusState(I)V

    .line 777
    iput-boolean v1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mCancelAutoFocusIfMove:Z

    .line 779
    :cond_0
    iput-boolean v1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mPendingMultiCapture:Z

    .line 780
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 782
    :cond_1
    return-void
.end method

.method private focusPoint(IIIZ)V
    .locals 2

    .line 583
    iget-boolean v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mInitialized:Z

    if-eqz v0, :cond_5

    iget v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mState:I

    const/4 v1, 0x2

    if-eq v0, v1, :cond_5

    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mOverrideFocusMode:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mOverrideFocusMode:Ljava/lang/String;

    .line 584
    invoke-direct {p0, v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->isAutoFocusMode(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_1

    .line 589
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->isNeedCancelAutoFocus()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 590
    invoke-virtual {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->cancelFocus()V

    .line 593
    :cond_1
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/camera/module/loader/camera2/FocusManager2;->initializeParameters(IIIZ)V

    .line 594
    const/4 v0, 0x1

    invoke-direct {p0, v0, p1, p2}, Lcom/android/camera/module/loader/camera2/FocusManager2;->initializeFocusIndicator(III)V

    .line 597
    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mListener:Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;

    invoke-interface {p1}, Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;->notifyFocusAreaUpdate()V

    .line 598
    iget-boolean p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mFocusAreaSupported:Z

    if-eqz p1, :cond_2

    if-nez p4, :cond_2

    .line 599
    invoke-direct {p0, p3}, Lcom/android/camera/module/loader/camera2/FocusManager2;->isFocusValid(I)Z

    move-result p1

    if-eqz p1, :cond_4

    .line 600
    invoke-direct {p0, p3}, Lcom/android/camera/module/loader/camera2/FocusManager2;->startFocus(I)V

    goto :goto_0

    .line 602
    :cond_2
    iget-boolean p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mMeteringAreaSupported:Z

    if-eqz p1, :cond_4

    .line 605
    const/4 p1, 0x3

    if-ne p1, p3, :cond_3

    invoke-direct {p0, p3}, Lcom/android/camera/module/loader/camera2/FocusManager2;->isFocusValid(I)Z

    move-result p2

    if-eqz p2, :cond_3

    .line 607
    iget-object p2, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mListener:Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;

    invoke-interface {p2, v0}, Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;->playFocusSound(I)V

    .line 608
    iput-boolean v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mCancelAutoFocusIfMove:Z

    .line 610
    :cond_3
    iput p3, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mLastFocusFrom:I

    .line 611
    invoke-direct {p0, v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setFocusState(I)V

    .line 612
    invoke-virtual {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->updateFocusUI()V

    .line 613
    invoke-direct {p0, p1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setFocusState(I)V

    .line 614
    invoke-virtual {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->updateFocusUI()V

    .line 616
    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mHandler:Landroid/os/Handler;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Landroid/os/Handler;->removeMessages(I)V

    .line 618
    :cond_4
    :goto_0
    return-void

    .line 585
    :cond_5
    :goto_1
    return-void
.end method

.method private getTapAction()I
    .locals 2

    .line 961
    invoke-virtual {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->getFocusMode()Ljava/lang/String;

    move-result-object v0

    .line 962
    const-string v1, "edof"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string v1, "manual"

    .line 963
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 966
    :cond_0
    const/4 v0, 0x2

    return v0

    .line 964
    :cond_1
    :goto_0
    const/4 v0, 0x1

    return v0
.end method

.method private initializeFocusAreas(IIIIII)V
    .locals 9

    .line 513
    iget-object v1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mCameraFocusArea:Landroid/graphics/Rect;

    if-nez v1, :cond_0

    .line 514
    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    iput-object v1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mCameraFocusArea:Landroid/graphics/Rect;

    .line 518
    :cond_0
    const/high16 v3, 0x3f800000    # 1.0f

    iget-object v8, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mCameraFocusArea:Landroid/graphics/Rect;

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v4, p3

    move v5, p4

    move v6, p5

    move v7, p6

    invoke-virtual/range {v0 .. v8}, Lcom/android/camera/module/loader/camera2/FocusManager2;->calculateTapArea(IIFIIIILandroid/graphics/Rect;)V

    .line 520
    return-void
.end method

.method private initializeFocusIndicator(III)V
    .locals 2

    .line 545
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa6

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    .line 547
    if-eqz v0, :cond_0

    .line 548
    invoke-interface {v0, p1, p2, p3}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->setFocusViewPosition(III)V

    .line 550
    :cond_0
    return-void
.end method

.method private initializeMeteringAreas(IIIIIII)V
    .locals 9

    move-object v0, p0

    .line 526
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    const/16 v2, 0xa6

    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v1

    check-cast v1, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    .line 528
    const/4 v2, 0x1

    move/from16 v3, p7

    if-ne v3, v2, :cond_0

    if-eqz v1, :cond_0

    .line 529
    invoke-interface {v1, v2}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->isNeedExposure(I)Z

    move-result v1

    if-nez v1, :cond_0

    .line 530
    const/4 v1, 0x0

    iput-object v1, v0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mCameraMeteringArea:Landroid/graphics/Rect;

    .line 531
    return-void

    .line 534
    :cond_0
    iget-object v1, v0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mCameraMeteringArea:Landroid/graphics/Rect;

    if-nez v1, :cond_1

    .line 535
    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    iput-object v1, v0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mCameraMeteringArea:Landroid/graphics/Rect;

    .line 539
    :cond_1
    const v3, 0x3fe66666    # 1.8f

    iget-object v8, v0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mCameraMeteringArea:Landroid/graphics/Rect;

    move v1, p1

    move v2, p2

    move v4, p3

    move v5, p4

    move v6, p5

    move v7, p6

    invoke-virtual/range {v0 .. v8}, Lcom/android/camera/module/loader/camera2/FocusManager2;->calculateTapArea(IIFIIIILandroid/graphics/Rect;)V

    .line 541
    return-void
.end method

.method private initializeParameters(IIIZ)V
    .locals 8

    .line 563
    iget-boolean v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mFocusAreaSupported:Z

    if-eqz v0, :cond_0

    if-nez p4, :cond_0

    .line 564
    iget v2, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->FOCUS_AREA_WIDTH:I

    iget v3, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->FOCUS_AREA_HEIGHT:I

    iget v6, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mPreviewWidth:I

    iget v7, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mPreviewHeight:I

    move-object v1, p0

    move v4, p1

    move v5, p2

    invoke-direct/range {v1 .. v7}, Lcom/android/camera/module/loader/camera2/FocusManager2;->initializeFocusAreas(IIIIII)V

    .line 568
    :cond_0
    iget-boolean p4, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mMeteringAreaSupported:Z

    if-eqz p4, :cond_1

    .line 569
    iget v1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->FOCUS_AREA_WIDTH:I

    iget v2, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->FOCUS_AREA_HEIGHT:I

    iget v5, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mPreviewWidth:I

    iget v6, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mPreviewHeight:I

    move-object v0, p0

    move v3, p1

    move v4, p2

    move v7, p3

    invoke-direct/range {v0 .. v7}, Lcom/android/camera/module/loader/camera2/FocusManager2;->initializeMeteringAreas(IIIIIII)V

    .line 572
    :cond_1
    return-void
.end method

.method private isAutoFocusMode(Ljava/lang/String;)Z
    .locals 1

    .line 971
    const-string v0, "auto"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "macro"

    .line 972
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p1, 0x1

    .line 971
    :goto_1
    return p1
.end method

.method private isFocusEnabled()Z
    .locals 3

    .line 1003
    iget-boolean v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mInitialized:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mState:I

    const/4 v2, 0x2

    if-eq v0, v2, :cond_0

    iget v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mState:I

    if-eq v0, v1, :cond_0

    .line 1004
    invoke-direct {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->needAutoFocusCall()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 1003
    :goto_0
    return v1
.end method

.method private isFocusValid(I)Z
    .locals 7

    .line 702
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 703
    iget v2, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mLastFocusFrom:I

    const/4 v3, 0x3

    if-eq v2, v3, :cond_1

    iget v2, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mLastFocusFrom:I

    const/4 v4, 0x4

    if-ne v2, v4, :cond_0

    goto :goto_0

    .line 704
    :cond_0
    const-wide/16 v4, 0xfa0

    goto :goto_1

    :cond_1
    :goto_0
    const-wide/16 v4, 0x1388

    .line 705
    :goto_1
    const/4 v6, 0x1

    if-ge p1, v3, :cond_4

    iget v2, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mLastFocusFrom:I

    if-ge p1, v2, :cond_4

    iget-wide v2, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mLatestFocusTime:J

    .line 706
    invoke-static/range {v0 .. v5}, Lcom/android/camera/Util;->isTimeout(JJJ)Z

    move-result p1

    if-eqz p1, :cond_2

    goto :goto_2

    .line 710
    :cond_2
    iget p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mLastFocusFrom:I

    if-ne p1, v6, :cond_3

    .line 711
    const/4 p1, 0x7

    invoke-virtual {p0, p1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->resetTouchFocus(I)V

    .line 713
    :cond_3
    const/4 p1, 0x0

    return p1

    .line 707
    :cond_4
    :goto_2
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mLatestFocusTime:J

    .line 708
    return v6
.end method

.method private lockAeAwbIfNeeded()V
    .locals 1

    .line 294
    iget-boolean v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mLockAeAwbNeeded:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mAeAwbLock:Z

    if-nez v0, :cond_0

    .line 295
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mAeAwbLock:Z

    .line 296
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mListener:Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;

    invoke-interface {v0}, Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;->notifyFocusAreaUpdate()V

    .line 298
    :cond_0
    return-void
.end method

.method private multiCapture()V
    .locals 2

    .line 785
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mListener:Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;

    invoke-interface {v0}, Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;->multiCapture()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 789
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setFocusState(I)V

    .line 790
    iput-boolean v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mPendingMultiCapture:Z

    .line 791
    iget-object v1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->removeMessages(I)V

    .line 793
    :cond_0
    return-void
.end method

.method private needAutoFocusCall()Z
    .locals 2

    .line 957
    invoke-direct {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->getTapAction()I

    move-result v0

    const/4 v1, 0x2

    if-ne v1, v0, :cond_0

    iget-boolean v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mFocusAreaSupported:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private onAutoFocusMoving(ZZ)V
    .locals 10

    .line 428
    iget-boolean v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mInitialized:Z

    if-nez v0, :cond_0

    .line 429
    const-string p1, "FocusManager"

    const-string p2, "onAutoFocusMoving"

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 430
    return-void

    .line 434
    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa6

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    .line 436
    nop

    .line 438
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->getActiveIndicator()I

    move-result v1

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->isFaceExists(I)Z

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    const/4 v4, 0x3

    if-eqz v1, :cond_1

    .line 439
    invoke-interface {v0, v4}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->clearFocusView(I)V

    .line 440
    nop

    .line 443
    move v1, v2

    goto :goto_0

    :cond_1
    move v1, v3

    :goto_0
    const-string v5, "FocusManager"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "onAutoFocusMoving: mode="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->getFocusMode()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, " show="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 445
    iget-object v5, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mCameraFocusArea:Landroid/graphics/Rect;

    if-nez v5, :cond_a

    const-string v5, "auto"

    invoke-virtual {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->getFocusMode()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    goto/16 :goto_4

    .line 449
    :cond_2
    invoke-interface {v0, v2}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->setFocusViewType(Z)V

    .line 450
    const/4 v2, 0x2

    if-eqz p1, :cond_4

    .line 451
    iget p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mState:I

    if-eq p1, v2, :cond_3

    .line 452
    invoke-direct {p0, v3}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setFocusState(I)V

    .line 454
    :cond_3
    const-string p1, "FocusManager"

    const-string p2, "Camera KPI: CAF start"

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 455
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p1

    iput-wide p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mCafStartTime:J

    .line 456
    if-eqz v1, :cond_9

    .line 457
    invoke-interface {v0, v2, v3}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->showIndicator(II)V

    goto :goto_3

    .line 460
    :cond_4
    iget p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mState:I

    .line 461
    const-string v3, "FocusManager"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Camera KPI: CAF stop: Focus time: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    iget-wide v8, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mCafStartTime:J

    sub-long/2addr v6, v8

    invoke-virtual {v5, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v5}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 462
    if-eqz p2, :cond_5

    .line 463
    invoke-direct {p0, v4}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setFocusState(I)V

    .line 464
    invoke-direct {p0, v4}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setLastFocusState(I)V

    goto :goto_1

    .line 466
    :cond_5
    const/4 v3, 0x4

    invoke-direct {p0, v3}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setFocusState(I)V

    .line 467
    invoke-direct {p0, v3}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setLastFocusState(I)V

    .line 469
    :goto_1
    if-eqz v1, :cond_7

    .line 470
    nop

    .line 471
    if-eqz p2, :cond_6

    .line 470
    move p2, v2

    goto :goto_2

    .line 471
    :cond_6
    nop

    .line 470
    move p2, v4

    :goto_2
    invoke-interface {v0, v2, p2}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->showIndicator(II)V

    .line 474
    :cond_7
    if-ne p1, v2, :cond_9

    .line 475
    invoke-direct {p0, v4}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setFocusState(I)V

    .line 476
    iget-boolean p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mPendingMultiCapture:Z

    if-eqz p1, :cond_8

    .line 477
    invoke-direct {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->multiCapture()V

    goto :goto_3

    .line 479
    :cond_8
    invoke-direct {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->capture()V

    .line 483
    :cond_9
    :goto_3
    return-void

    .line 446
    :cond_a
    :goto_4
    return-void
.end method

.method private onlyAe()Z
    .locals 2

    .line 579
    invoke-direct {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->getTapAction()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method private resetFocusAreaToCenter()V
    .locals 7

    .line 505
    iget v1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->FOCUS_AREA_WIDTH:I

    iget v2, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->FOCUS_AREA_HEIGHT:I

    iget v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mPreviewWidth:I

    div-int/lit8 v3, v0, 0x2

    iget v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mPreviewHeight:I

    div-int/lit8 v4, v0, 0x2

    iget v5, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mPreviewWidth:I

    iget v6, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mPreviewHeight:I

    move-object v0, p0

    invoke-direct/range {v0 .. v6}, Lcom/android/camera/module/loader/camera2/FocusManager2;->initializeFocusAreas(IIIIII)V

    .line 508
    iget v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mPreviewWidth:I

    div-int/lit8 v0, v0, 0x2

    iget v1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mPreviewHeight:I

    div-int/lit8 v1, v1, 0x2

    const/4 v2, 0x5

    invoke-direct {p0, v2, v0, v1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->initializeFocusIndicator(III)V

    .line 509
    return-void
.end method

.method private resetFocusAreaToFaceArea()Z
    .locals 10

    .line 487
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa6

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    .line 489
    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->getActiveIndicator()I

    move-result v1

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->isFaceExists(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 491
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->getActiveIndicator()I

    move-result v1

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->getFocusRect(I)Landroid/graphics/RectF;

    move-result-object v0

    .line 492
    if-eqz v0, :cond_0

    .line 493
    iput-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mLatestFocusFace:Landroid/graphics/RectF;

    .line 494
    iget v1, v0, Landroid/graphics/RectF;->left:F

    iget v2, v0, Landroid/graphics/RectF;->right:F

    add-float/2addr v1, v2

    const/high16 v2, 0x40000000    # 2.0f

    div-float/2addr v1, v2

    float-to-int v6, v1

    .line 495
    iget v1, v0, Landroid/graphics/RectF;->top:F

    iget v0, v0, Landroid/graphics/RectF;->bottom:F

    add-float/2addr v1, v0

    div-float/2addr v1, v2

    float-to-int v7, v1

    .line 496
    iget v4, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->FOCUS_AREA_WIDTH:I

    iget v5, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->FOCUS_AREA_HEIGHT:I

    iget v8, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mPreviewWidth:I

    iget v9, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mPreviewHeight:I

    move-object v3, p0

    invoke-direct/range {v3 .. v9}, Lcom/android/camera/module/loader/camera2/FocusManager2;->initializeFocusAreas(IIIIII)V

    .line 498
    const/4 v0, 0x1

    return v0

    .line 501
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method private setFocusState(I)V
    .locals 3

    .line 215
    const-string v0, "FocusManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setFocusState: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 216
    iput p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mState:I

    .line 217
    return-void
.end method

.method private setLastFocusState(I)V
    .locals 0

    .line 220
    iput p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mLastState:I

    .line 221
    return-void
.end method

.method private startFocus(I)V
    .locals 3

    .line 717
    const-string v0, "FocusManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "startFocus: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 718
    const-string v0, "auto"

    invoke-virtual {p0, v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setFocusMode(Ljava/lang/String;)Ljava/lang/String;

    .line 719
    iput p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mLastFocusFrom:I

    .line 723
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa6

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    .line 725
    const/4 v1, 0x0

    const/4 v2, 0x1

    if-ne p1, v2, :cond_0

    if-eqz v0, :cond_1

    .line 726
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->getActiveIndicator()I

    move-result p1

    if-ne v2, p1, :cond_1

    .line 727
    :cond_0
    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mListener:Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;

    invoke-interface {p1, v1}, Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;->stopObjectTracking(Z)V

    .line 729
    :cond_1
    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mListener:Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;

    invoke-interface {p1}, Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;->startFocus()V

    .line 736
    invoke-direct {p0, v2}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setFocusState(I)V

    .line 737
    invoke-virtual {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->updateFocusUI()V

    .line 738
    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mHandler:Landroid/os/Handler;

    invoke-virtual {p1, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 739
    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mHandler:Landroid/os/Handler;

    invoke-virtual {p1, v2}, Landroid/os/Handler;->removeMessages(I)V

    .line 742
    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mHandler:Landroid/os/Handler;

    const-wide/16 v0, 0x1388

    invoke-virtual {p1, v2, v0, v1}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 744
    return-void
.end method

.method private unlockAeAwbIfNeeded()V
    .locals 2

    .line 303
    iget-boolean v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mLockAeAwbNeeded:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mAeAwbLock:Z

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mState:I

    const/4 v1, 0x2

    if-eq v0, v1, :cond_0

    .line 304
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mAeAwbLock:Z

    .line 305
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mListener:Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;

    invoke-interface {v0}, Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;->notifyFocusAreaUpdate()V

    .line 307
    :cond_0
    return-void
.end method


# virtual methods
.method public canRecord()Z
    .locals 1

    .line 1040
    invoke-virtual {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->isFocusing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1041
    const/4 v0, 0x2

    invoke-direct {p0, v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setFocusState(I)V

    .line 1042
    const/4 v0, 0x0

    return v0

    .line 1044
    :cond_0
    const/4 v0, 0x1

    return v0
.end method

.method public cancelFocus()V
    .locals 4

    .line 747
    invoke-static {}, Lcom/android/camera/CameraSettings;->getFocusMode()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setFocusMode(Ljava/lang/String;)Ljava/lang/String;

    .line 748
    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->resetTouchFocus(I)V

    .line 749
    invoke-direct {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->needAutoFocusCall()Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_0

    .line 750
    iget-object v1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mListener:Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;

    invoke-interface {v1, v2}, Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;->cancelFocus(Z)V

    goto :goto_0

    .line 753
    :cond_0
    iget-object v1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mListener:Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;

    invoke-interface {v1}, Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;->notifyFocusAreaUpdate()V

    .line 761
    :goto_0
    iget v1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mState:I

    const/4 v3, 0x0

    if-eq v0, v1, :cond_1

    .line 762
    invoke-direct {p0, v3}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setFocusState(I)V

    goto :goto_1

    .line 764
    :cond_1
    const-string v0, "FocusManager"

    const-string v1, "waiting focus timeout!"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 766
    :goto_1
    invoke-virtual {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->updateFocusUI()V

    .line 767
    iput-boolean v3, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mCancelAutoFocusIfMove:Z

    .line 768
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v3}, Landroid/os/Handler;->removeMessages(I)V

    .line 769
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v2}, Landroid/os/Handler;->removeMessages(I)V

    .line 770
    const-string v0, "FocusManager"

    const-string v1, "cancelFocus"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 771
    return-void
.end method

.method public cancelLongPressedAutoFocus()V
    .locals 2

    .line 996
    iget-boolean v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mCancelAutoFocusIfMove:Z

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 997
    invoke-direct {p0, v1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setLastFocusState(I)V

    .line 999
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 1000
    return-void
.end method

.method public cancelMultiSnapPending()Z
    .locals 3

    .line 932
    iget v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mState:I

    const/4 v1, 0x0

    const/4 v2, 0x2

    if-ne v0, v2, :cond_0

    iget-boolean v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mPendingMultiCapture:Z

    if-eqz v0, :cond_0

    .line 933
    iput-boolean v1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mPendingMultiCapture:Z

    .line 934
    const/4 v0, 0x1

    return v0

    .line 936
    :cond_0
    return v1
.end method

.method public destroy()V
    .locals 1

    .line 1057
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mDestroyed:Z

    .line 1058
    invoke-virtual {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->removeMessages()V

    .line 1059
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mFocusResultDisposable:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 1060
    return-void
.end method

.method public doMultiSnap(Z)V
    .locals 1

    .line 334
    iget-boolean v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mInitialized:Z

    if-nez v0, :cond_0

    .line 335
    return-void

    .line 339
    :cond_0
    if-nez p1, :cond_1

    .line 340
    invoke-direct {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->multiCapture()V

    .line 345
    :cond_1
    iget p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mState:I

    const/4 v0, 0x3

    if-eq p1, v0, :cond_4

    iget p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mState:I

    const/4 v0, 0x4

    if-eq p1, v0, :cond_4

    invoke-direct {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->needAutoFocusCall()Z

    move-result p1

    if-nez p1, :cond_2

    goto :goto_0

    .line 347
    :cond_2
    iget p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mState:I

    const/4 v0, 0x1

    if-ne p1, v0, :cond_3

    .line 351
    const/4 p1, 0x2

    invoke-direct {p0, p1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setFocusState(I)V

    .line 352
    iput-boolean v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mPendingMultiCapture:Z

    goto :goto_1

    .line 353
    :cond_3
    iget p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mState:I

    if-nez p1, :cond_5

    .line 358
    invoke-direct {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->multiCapture()V

    goto :goto_1

    .line 346
    :cond_4
    :goto_0
    invoke-direct {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->multiCapture()V

    .line 360
    :cond_5
    :goto_1
    return-void
.end method

.method public doSnap()V
    .locals 2

    .line 310
    iget-boolean v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mInitialized:Z

    if-nez v0, :cond_0

    .line 311
    return-void

    .line 317
    :cond_0
    iget v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mState:I

    const/4 v1, 0x3

    if-eq v0, v1, :cond_3

    iget v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mState:I

    const/4 v1, 0x4

    if-eq v0, v1, :cond_3

    invoke-direct {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->needAutoFocusCall()Z

    move-result v0

    if-nez v0, :cond_1

    goto :goto_0

    .line 319
    :cond_1
    iget v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mState:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_2

    .line 323
    const/4 v0, 0x2

    invoke-direct {p0, v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setFocusState(I)V

    goto :goto_1

    .line 324
    :cond_2
    iget v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mState:I

    if-nez v0, :cond_4

    .line 329
    invoke-direct {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->capture()V

    goto :goto_1

    .line 318
    :cond_3
    :goto_0
    invoke-direct {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->capture()V

    .line 331
    :cond_4
    :goto_1
    return-void
.end method

.method public focusFaceArea()Z
    .locals 7

    .line 658
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa6

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    .line 660
    invoke-virtual {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->getFocusMode()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->isAutoFocusMode(Ljava/lang/String;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_5

    if-eqz v0, :cond_0

    const/4 v1, 0x2

    .line 661
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->getActiveIndicator()I

    move-result v3

    if-ne v1, v3, :cond_0

    goto :goto_2

    .line 664
    :cond_0
    if-eqz v0, :cond_1

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->getActiveIndicator()I

    move-result v1

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->getFocusRect(I)Landroid/graphics/RectF;

    move-result-object v0

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    .line 665
    :goto_0
    if-eqz v0, :cond_4

    invoke-virtual {v0}, Landroid/graphics/RectF;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_2

    goto :goto_1

    .line 668
    :cond_2
    iget-object v1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mLatestFocusFace:Landroid/graphics/RectF;

    const/4 v3, 0x1

    if-eqz v1, :cond_3

    iget v1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mLastFocusFrom:I

    if-ne v1, v3, :cond_3

    .line 669
    iget v1, v0, Landroid/graphics/RectF;->left:F

    iget-object v4, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mLatestFocusFace:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->left:F

    sub-float/2addr v1, v4

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v1

    const/high16 v4, 0x42a00000    # 80.0f

    cmpg-float v1, v1, v4

    if-gez v1, :cond_3

    iget v1, v0, Landroid/graphics/RectF;->right:F

    iget v5, v0, Landroid/graphics/RectF;->left:F

    sub-float/2addr v1, v5

    iget-object v5, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mLatestFocusFace:Landroid/graphics/RectF;

    iget v5, v5, Landroid/graphics/RectF;->right:F

    iget-object v6, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mLatestFocusFace:Landroid/graphics/RectF;

    iget v6, v6, Landroid/graphics/RectF;->left:F

    sub-float/2addr v5, v6

    sub-float/2addr v1, v5

    .line 670
    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v1

    cmpg-float v1, v1, v4

    if-gez v1, :cond_3

    .line 672
    return v2

    .line 675
    :cond_3
    iput-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mLatestFocusFace:Landroid/graphics/RectF;

    .line 676
    iget v1, v0, Landroid/graphics/RectF;->left:F

    iget v4, v0, Landroid/graphics/RectF;->right:F

    add-float/2addr v1, v4

    const/high16 v4, 0x40000000    # 2.0f

    div-float/2addr v1, v4

    float-to-int v1, v1

    .line 677
    iget v5, v0, Landroid/graphics/RectF;->top:F

    iget v0, v0, Landroid/graphics/RectF;->bottom:F

    add-float/2addr v5, v0

    div-float/2addr v5, v4

    float-to-int v0, v5

    .line 678
    invoke-direct {p0, v1, v0, v3, v2}, Lcom/android/camera/module/loader/camera2/FocusManager2;->focusPoint(IIIZ)V

    .line 679
    return v3

    .line 666
    :cond_4
    :goto_1
    return v2

    .line 662
    :cond_5
    :goto_2
    return v2
.end method

.method public getAeAwbLock()Z
    .locals 1

    .line 953
    iget-boolean v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mAeAwbLock:Z

    return v0
.end method

.method public getCurrentFocusState()I
    .locals 1

    .line 924
    iget v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mState:I

    return v0
.end method

.method public getFocusAreas(Landroid/graphics/Rect;Landroid/graphics/Rect;)[Landroid/hardware/camera2/params/MeteringRectangle;
    .locals 1

    .line 841
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mCameraFocusArea:Landroid/graphics/Rect;

    if-nez v0, :cond_0

    .line 842
    const/4 p1, 0x0

    return-object p1

    .line 845
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mCameraFocusArea:Landroid/graphics/Rect;

    invoke-direct {p0, v0, p1, p2}, Lcom/android/camera/module/loader/camera2/FocusManager2;->afaeRectangle(Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Rect;)[Landroid/hardware/camera2/params/MeteringRectangle;

    move-result-object p1

    return-object p1
.end method

.method public getFocusMode()Ljava/lang/String;
    .locals 3

    .line 829
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mOverrideFocusMode:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 830
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mOverrideFocusMode:Ljava/lang/String;

    return-object v0

    .line 833
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mFocusMode:Ljava/lang/String;

    if-nez v0, :cond_1

    .line 834
    invoke-static {}, Lcom/android/camera/CameraSettings;->getFocusMode()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mFocusMode:Ljava/lang/String;

    .line 836
    :cond_1
    const-string v0, "FocusManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "getFocusMode="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mFocusMode:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 837
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mFocusMode:Ljava/lang/String;

    return-object v0
.end method

.method public getLastFocusState()I
    .locals 1

    .line 224
    iget v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mLastState:I

    return v0
.end method

.method public getMeteringAreas(Landroid/graphics/Rect;Landroid/graphics/Rect;)[Landroid/hardware/camera2/params/MeteringRectangle;
    .locals 1

    .line 849
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mCameraMeteringArea:Landroid/graphics/Rect;

    if-nez v0, :cond_0

    .line 850
    const/4 p1, 0x0

    return-object p1

    .line 853
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mCameraMeteringArea:Landroid/graphics/Rect;

    invoke-direct {p0, v0, p1, p2}, Lcom/android/camera/module/loader/camera2/FocusManager2;->afaeRectangle(Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Rect;)[Landroid/hardware/camera2/params/MeteringRectangle;

    move-result-object p1

    return-object p1
.end method

.method public isFocusCompleted()Z
    .locals 2

    .line 920
    iget v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mState:I

    const/4 v1, 0x3

    if-eq v0, v1, :cond_1

    iget v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mState:I

    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method public isFocusing()Z
    .locals 3

    .line 1049
    iget v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mState:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_1

    iget v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mState:I

    const/4 v2, 0x2

    if-ne v0, v2, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    nop

    :cond_1
    :goto_0
    return v1
.end method

.method public isFocusingSnapOnFinish()Z
    .locals 2

    .line 928
    iget v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mState:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isNeedCancelAutoFocus()Z
    .locals 3

    .line 980
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->hasMessages(I)Z

    move-result v0

    const/4 v2, 0x1

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mHandler:Landroid/os/Handler;

    .line 981
    invoke-virtual {v0, v2}, Landroid/os/Handler;->hasMessages(I)Z

    move-result v0

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mCancelAutoFocusIfMove:Z

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    goto :goto_1

    .line 980
    :cond_1
    :goto_0
    move v1, v2

    :goto_1
    return v1
.end method

.method public onCameraReleased()V
    .locals 0

    .line 698
    invoke-virtual {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->onPreviewStopped()V

    .line 699
    return-void
.end method

.method public onDeviceBecomeStable()V
    .locals 0

    .line 977
    return-void
.end method

.method public onDeviceKeepMoving(D)V
    .locals 6

    .line 986
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mLatestFocusTime:J

    const-wide/16 v4, 0xbb8

    invoke-static/range {v0 .. v5}, Lcom/android/camera/Util;->isTimeout(JJJ)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 988
    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setLastFocusState(I)V

    .line 989
    iget-boolean p2, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mCancelAutoFocusIfMove:Z

    if-eqz p2, :cond_0

    .line 990
    iget-object p2, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mHandler:Landroid/os/Handler;

    invoke-virtual {p2, p1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 993
    :cond_0
    return-void
.end method

.method public onFocusResult(Lcom/android/camera/module/loader/camera2/FocusTask;)V
    .locals 1

    .line 363
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mFocusResultEmitter:Lio/reactivex/ObservableEmitter;

    invoke-interface {v0, p1}, Lio/reactivex/ObservableEmitter;->onNext(Ljava/lang/Object;)V

    .line 364
    return-void
.end method

.method public onPreviewStarted()V
    .locals 1

    .line 688
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setFocusState(I)V

    .line 689
    return-void
.end method

.method public onPreviewStopped()V
    .locals 1

    .line 692
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setFocusState(I)V

    .line 693
    const/4 v0, 0x7

    invoke-virtual {p0, v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->resetTouchFocus(I)V

    .line 694
    invoke-virtual {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->updateFocusUI()V

    .line 695
    return-void
.end method

.method public onShutter()V
    .locals 1

    .line 683
    invoke-virtual {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->updateFocusUI()V

    .line 684
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mAeAwbLock:Z

    .line 685
    return-void
.end method

.method public onShutterDown()V
    .locals 0

    .line 287
    return-void
.end method

.method public onShutterUp()V
    .locals 0

    .line 291
    return-void
.end method

.method public onSingleTapUp(II)V
    .locals 2

    .line 575
    invoke-direct {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->onlyAe()Z

    move-result v0

    const/4 v1, 0x3

    invoke-direct {p0, p1, p2, v1, v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->focusPoint(IIIZ)V

    .line 576
    return-void
.end method

.method public overrideFocusMode(Ljava/lang/String;)V
    .locals 0

    .line 945
    iput-object p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mOverrideFocusMode:Ljava/lang/String;

    .line 946
    return-void
.end method

.method public prepareCapture(ZI)V
    .locals 8

    .line 228
    iget-boolean v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mInitialized:Z

    if-nez v0, :cond_0

    .line 229
    return-void

    .line 231
    :cond_0
    nop

    .line 232
    nop

    .line 233
    invoke-virtual {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->getFocusMode()Ljava/lang/String;

    move-result-object v0

    .line 235
    const/4 v1, 0x2

    const/4 v2, 0x3

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-ne p2, v1, :cond_3

    const-string v1, "auto"

    .line 236
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string v1, "macro"

    .line 237
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 239
    :cond_1
    iget v1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mLastState:I

    if-eq v1, v2, :cond_2

    if-nez p1, :cond_3

    .line 240
    :cond_2
    nop

    .line 244
    move v1, v3

    goto :goto_0

    :cond_3
    move v1, v4

    :goto_0
    const-string v5, "FocusManager"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "prepareCapture: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v7, "|"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p2, "|"

    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {v5, p2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 246
    const-string p2, "continuous-picture"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    .line 247
    invoke-direct {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->isFocusEnabled()Z

    move-result v0

    if-eqz v0, :cond_6

    if-nez p2, :cond_6

    if-eqz v1, :cond_6

    .line 249
    iget v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mState:I

    if-eq v0, v2, :cond_5

    iget v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mState:I

    const/4 v1, 0x4

    if-eq v0, v1, :cond_5

    .line 252
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa6

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    .line 254
    if-eqz v0, :cond_4

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->getActiveIndicator()I

    move-result v1

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->isFaceExists(I)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 255
    invoke-virtual {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->focusFaceArea()Z

    .line 256
    goto :goto_1

    .line 258
    :cond_4
    invoke-direct {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->resetFocusAreaToCenter()V

    .line 259
    invoke-direct {p0, v3}, Lcom/android/camera/module/loader/camera2/FocusManager2;->startFocus(I)V

    .line 260
    nop

    .line 262
    :goto_1
    nop

    .line 272
    :goto_2
    move v3, v4

    goto :goto_3

    .line 262
    :cond_5
    if-eqz p1, :cond_6

    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mCameraFocusArea:Landroid/graphics/Rect;

    if-eqz v0, :cond_6

    invoke-static {}, Lcom/mi/config/b;->gu()Z

    move-result v0

    if-nez v0, :cond_6

    .line 264
    iput-boolean v4, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mKeepFocusUIState:Z

    .line 265
    iget v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mLastFocusFrom:I

    invoke-direct {p0, v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->startFocus(I)V

    .line 266
    iput-boolean v3, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mKeepFocusUIState:Z

    .line 267
    goto :goto_2

    .line 272
    :cond_6
    :goto_3
    if-nez v3, :cond_8

    if-eqz p1, :cond_8

    if-eqz p2, :cond_8

    .line 274
    invoke-static {}, Lcom/mi/config/b;->hj()Z

    move-result p1

    if-eqz p1, :cond_7

    .line 275
    iget p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mState:I

    if-ne p1, v4, :cond_8

    .line 276
    invoke-virtual {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->cancelFocus()V

    goto :goto_4

    .line 279
    :cond_7
    invoke-virtual {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->requestAutoFocus()V

    .line 282
    :cond_8
    :goto_4
    return-void
.end method

.method public removeMessages()V
    .locals 2

    .line 940
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 941
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 942
    return-void
.end method

.method public requestAutoFocus()V
    .locals 6

    .line 621
    invoke-direct {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->needAutoFocusCall()Z

    move-result v0

    if-eqz v0, :cond_5

    iget-boolean v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mInitialized:Z

    if-eqz v0, :cond_5

    iget v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mState:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    goto :goto_1

    .line 627
    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v2, 0xa6

    invoke-virtual {v0, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    .line 629
    const/4 v2, 0x4

    .line 631
    invoke-virtual {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->isNeedCancelAutoFocus()Z

    move-result v3

    const/4 v4, 0x1

    const/4 v5, 0x0

    if-eqz v3, :cond_2

    .line 633
    iget-object v3, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mListener:Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;

    invoke-interface {v3, v5}, Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;->cancelFocus(Z)V

    .line 634
    if-eqz v0, :cond_1

    .line 635
    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->clearFocusView(I)V

    .line 637
    :cond_1
    invoke-direct {p0, v5}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setFocusState(I)V

    .line 638
    iput-boolean v5, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mCancelAutoFocusIfMove:Z

    .line 639
    iget-object v1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1, v5}, Landroid/os/Handler;->removeMessages(I)V

    .line 640
    iget-object v1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1, v4}, Landroid/os/Handler;->removeMessages(I)V

    .line 642
    :cond_2
    invoke-direct {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->resetFocusAreaToFaceArea()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 643
    if-eqz v0, :cond_3

    .line 644
    const/16 v1, 0x9

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->clearFocusView(I)V

    .line 646
    :cond_3
    nop

    .line 651
    move v2, v4

    goto :goto_0

    .line 648
    :cond_4
    invoke-direct {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->resetFocusAreaToCenter()V

    .line 651
    :goto_0
    iput-boolean v5, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mAeAwbLock:Z

    .line 652
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mListener:Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;

    invoke-interface {v0}, Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;->notifyFocusAreaUpdate()V

    .line 653
    invoke-direct {p0, v2}, Lcom/android/camera/module/loader/camera2/FocusManager2;->startFocus(I)V

    .line 654
    return-void

    .line 623
    :cond_5
    :goto_1
    return-void
.end method

.method public resetAfterCapture(Z)V
    .locals 3

    .line 905
    invoke-static {}, Lcom/mi/config/b;->gu()Z

    move-result v0

    const/4 v1, 0x7

    if-eqz v0, :cond_0

    .line 906
    invoke-virtual {p0, v1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->resetTouchFocus(I)V

    goto :goto_0

    .line 907
    :cond_0
    if-eqz p1, :cond_2

    .line 909
    iget p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mLastFocusFrom:I

    const/4 v0, 0x4

    const/4 v2, 0x0

    if-ne p1, v0, :cond_1

    .line 910
    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mListener:Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;

    invoke-interface {p1, v2}, Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;->cancelFocus(Z)V

    .line 911
    invoke-virtual {p0, v1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->resetTouchFocus(I)V

    .line 912
    invoke-virtual {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->removeMessages()V

    goto :goto_0

    .line 914
    :cond_1
    invoke-direct {p0, v2}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setLastFocusState(I)V

    .line 917
    :cond_2
    :goto_0
    return-void
.end method

.method public resetFocusIndicator(I)V
    .locals 2

    .line 554
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa6

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    .line 556
    if-eqz v0, :cond_0

    .line 557
    invoke-interface {v0, p1}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->clearFocusView(I)V

    .line 559
    :cond_0
    return-void
.end method

.method public resetFocusStateIfNeeded()V
    .locals 2

    .line 796
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mCameraFocusArea:Landroid/graphics/Rect;

    .line 797
    iput-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mCameraMeteringArea:Landroid/graphics/Rect;

    .line 799
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setFocusState(I)V

    .line 800
    invoke-direct {p0, v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setLastFocusState(I)V

    .line 801
    iput-boolean v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mCancelAutoFocusIfMove:Z

    .line 805
    iget-object v1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->hasMessages(I)Z

    move-result v1

    if-nez v1, :cond_0

    .line 806
    iget-object v1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 808
    :cond_0
    return-void
.end method

.method public resetFocused()V
    .locals 1

    .line 1053
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setFocusState(I)V

    .line 1054
    return-void
.end method

.method public resetTouchFocus(I)V
    .locals 1

    .line 895
    iget-boolean v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mInitialized:Z

    if-eqz v0, :cond_0

    .line 896
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mCameraFocusArea:Landroid/graphics/Rect;

    .line 897
    iput-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mCameraMeteringArea:Landroid/graphics/Rect;

    .line 898
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mCancelAutoFocusIfMove:Z

    .line 899
    invoke-virtual {p0, p1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->resetFocusIndicator(I)V

    .line 901
    :cond_0
    return-void
.end method

.method public setAeAwbLock(Z)V
    .locals 0

    .line 949
    iput-boolean p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mAeAwbLock:Z

    .line 950
    return-void
.end method

.method public setCharacteristics(Lcom/android/camera2/CameraCapabilities;)V
    .locals 1

    .line 196
    invoke-virtual {p1}, Lcom/android/camera2/CameraCapabilities;->isAFRegionSupported()Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mFocusAreaSupported:Z

    .line 197
    invoke-virtual {p1}, Lcom/android/camera2/CameraCapabilities;->isAERegionSupported()Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mMeteringAreaSupported:Z

    .line 198
    invoke-virtual {p1}, Lcom/android/camera2/CameraCapabilities;->isAELockSupported()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p1}, Lcom/android/camera2/CameraCapabilities;->isAWBLockSupported()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    iput-boolean v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mLockAeAwbNeeded:Z

    .line 199
    invoke-virtual {p1}, Lcom/android/camera2/CameraCapabilities;->getSupportedFocusModes()[I

    move-result-object v0

    invoke-static {v0}, Lcom/android/camera/constant/AutoFocus;->convertToLegacyFocusModes([I)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mSupportedFocusModes:Ljava/util/List;

    .line 200
    invoke-virtual {p1}, Lcom/android/camera2/CameraCapabilities;->getActiveArraySize()Landroid/graphics/Rect;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mActiveArraySize:Landroid/graphics/Rect;

    .line 201
    return-void
.end method

.method public setFocusMode(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 811
    if-nez p1, :cond_0

    .line 812
    const-string v0, "FocusManager"

    const-string v1, "setFocusMode: null focus mode"

    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2}, Ljava/lang/RuntimeException;-><init>()V

    invoke-static {v0, v1, v2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 813
    return-object p1

    .line 815
    :cond_0
    const-string v0, "auto"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mSupportedFocusModes:Ljava/util/List;

    .line 816
    invoke-static {p1, v0}, Lcom/android/camera/Util;->isSupported(Ljava/lang/String;Ljava/util/List;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 817
    iput-object p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mFocusMode:Ljava/lang/String;

    goto :goto_0

    .line 819
    :cond_1
    const-string p1, "auto"

    iput-object p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mFocusMode:Ljava/lang/String;

    .line 821
    :goto_0
    const-string p1, "continuous-picture"

    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mFocusMode:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_2

    const-string p1, "continuous-video"

    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mFocusMode:Ljava/lang/String;

    .line 822
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    .line 823
    :cond_2
    const/4 p1, -0x1

    iput p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mLastFocusFrom:I

    .line 825
    :cond_3
    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mFocusMode:Ljava/lang/String;

    return-object p1
.end method

.method public setPreviewSize(II)V
    .locals 1

    .line 205
    iget v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mPreviewWidth:I

    if-ne v0, p1, :cond_0

    iget v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mPreviewHeight:I

    if-eq v0, p2, :cond_1

    .line 206
    :cond_0
    iput p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mPreviewWidth:I

    .line 207
    iput p2, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mPreviewHeight:I

    .line 209
    const-string p1, "FocusManager"

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "setPreviewSize: "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mPreviewWidth:I

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, "x"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mPreviewHeight:I

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 210
    invoke-virtual {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setMatrix()V

    .line 212
    :cond_1
    return-void
.end method

.method public updateFocusUI()V
    .locals 5

    .line 859
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa6

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    .line 861
    iget-boolean v1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mInitialized:Z

    if-eqz v1, :cond_5

    iget-boolean v1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mKeepFocusUIState:Z

    if-nez v1, :cond_5

    if-nez v0, :cond_0

    goto :goto_3

    .line 865
    :cond_0
    nop

    .line 866
    iget v1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mLastFocusFrom:I

    const/4 v2, 0x1

    const/4 v3, 0x2

    if-ne v2, v1, :cond_1

    .line 867
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->getActiveIndicator()I

    move-result v1

    goto :goto_0

    .line 869
    :cond_1
    move v1, v3

    :goto_0
    iget v4, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mState:I

    packed-switch v4, :pswitch_data_0

    goto :goto_2

    .line 886
    :pswitch_0
    nop

    .line 887
    const-string v2, "continuous-picture"

    iget-object v4, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mFocusMode:Ljava/lang/String;

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3

    const-string v2, "continuous-video"

    iget-object v4, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mFocusMode:Ljava/lang/String;

    .line 888
    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    goto :goto_1

    .line 889
    :cond_2
    const/4 v3, 0x3

    nop

    .line 886
    :cond_3
    :goto_1
    invoke-interface {v0, v1, v3}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->showIndicator(II)V

    goto :goto_2

    .line 883
    :pswitch_1
    invoke-interface {v0, v1, v3}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->showIndicator(II)V

    .line 884
    goto :goto_2

    .line 880
    :pswitch_2
    invoke-interface {v0, v1, v2}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->showIndicator(II)V

    .line 881
    goto :goto_2

    .line 871
    :pswitch_3
    if-ne v1, v3, :cond_4

    .line 872
    const/4 v1, 0x7

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->clearFocusView(I)V

    goto :goto_2

    .line 874
    :cond_4
    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->clearIndicator(I)V

    .line 876
    nop

    .line 892
    :goto_2
    return-void

    .line 862
    :cond_5
    :goto_3
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
