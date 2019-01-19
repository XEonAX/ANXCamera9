.class public Lcom/android/camera/ui/V9EdgeShutterView;
.super Landroid/view/View;
.source "V9EdgeShutterView.java"

# interfaces
.implements Lcom/android/camera/ui/V6FunctionUI;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/ui/V9EdgeShutterView$CustomAnimatorListener;,
        Lcom/android/camera/ui/V9EdgeShutterView$ReverseInterpolator;
    }
.end annotation


# static fields
.field private static final CENTER_RADIUS:I

.field private static final FLYINOUT_DURATION:I = 0xfa

.field private static final MOVE_DURATION:I = 0x12c

.field private static final MSG_CAPTURE_MOVING:I = 0x2

.field private static final MSG_CAPTURE_POSTURE_CHANGED:I = 0x1

.field private static final MSG_LONG_TIME_UNUSED:I = 0x0

.field private static final NEAR_THRESHOLD:I

.field private static NORMAL_TAP_MAXY:I = 0x0

.field private static NORMAL_TOUCH_MAXY:I = 0x0

.field private static final OUTER_CIRCLE_WIDTH:I

.field private static final OUT_RADIUS:I

.field private static final PRESS_DURATION:I = 0xfa

.field private static final TAG:Ljava/lang/String; = "CameraEdgeShutterView"

.field private static final UNUSED_TRIGGER_TIME:I = 0x1388

.field private static final VIDEO_CENTER_COLOR:I = -0xfc0ff

.field private static final VIDEO_OUTER_COLOR:I = -0x6f000001

.field private static final VIEW_FLYOUT:I = 0x2

.field private static final VIEW_INVISIBLE:I = 0x4

.field private static final VIEW_MOVE:I = 0x3

.field private static final VIEW_VISIBLE:I = 0x1

.field private static final VIEW_WIDTH:I


# instance fields
.field private mAnimatorListener:Landroid/animation/Animator$AnimatorListener;

.field private mCenterPaint:Landroid/graphics/Paint;

.field private mClickAnim:Landroid/animation/ValueAnimator;

.field private mFlyOutAnim:Landroid/animation/ValueAnimator;

.field private mFlyinAnim:Landroid/animation/ValueAnimator;

.field private mFlyinInterpolator:Landroid/view/animation/Interpolator;

.field private mHandler:Landroid/os/Handler;

.field private mMessageDispatcher:Lcom/android/camera/ui/MessageDispatcher;

.field private mMoveAnim:Landroid/animation/ValueAnimator;

.field private mMoveInterpolator:Landroid/view/animation/Interpolator;

.field private mOuterPaint:Landroid/graphics/Paint;

.field private mPressInterpolator:Landroid/view/animation/Interpolator;

.field private mVisibleBounds:Landroid/graphics/Rect;

.field private mVisibleState:I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 50
    const v0, 0x4285570a    # 66.67f

    invoke-static {v0}, Lcom/android/camera/Util;->dpToPixel(F)I

    move-result v0

    sput v0, Lcom/android/camera/ui/V9EdgeShutterView;->NEAR_THRESHOLD:I

    .line 53
    const/high16 v0, 0x3f800000    # 1.0f

    invoke-static {v0}, Lcom/android/camera/Util;->dpToPixel(F)I

    move-result v0

    sput v0, Lcom/android/camera/ui/V9EdgeShutterView;->OUTER_CIRCLE_WIDTH:I

    .line 54
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 55
    const v1, 0x7f0a0052

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    sput v0, Lcom/android/camera/ui/V9EdgeShutterView;->OUT_RADIUS:I

    .line 56
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 57
    const v1, 0x7f0a0053

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    sput v0, Lcom/android/camera/ui/V9EdgeShutterView;->CENTER_RADIUS:I

    .line 58
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 59
    const v1, 0x7f0a0054

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    sput v0, Lcom/android/camera/ui/V9EdgeShutterView;->VIEW_WIDTH:I

    .line 60
    sget v0, Lcom/android/camera/Util;->sWindowHeight:I

    const-string v1, "camera_edge_max"

    const/16 v2, 0x4b

    invoke-static {v1, v2}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v1

    mul-int/2addr v0, v1

    div-int/lit8 v0, v0, 0x64

    sput v0, Lcom/android/camera/ui/V9EdgeShutterView;->NORMAL_TAP_MAXY:I

    .line 61
    sget v0, Lcom/android/camera/ui/V9EdgeShutterView;->NORMAL_TAP_MAXY:I

    sget v1, Lcom/android/camera/ui/V9EdgeShutterView;->NEAR_THRESHOLD:I

    div-int/lit8 v1, v1, 0x2

    add-int/2addr v0, v1

    sput v0, Lcom/android/camera/ui/V9EdgeShutterView;->NORMAL_TOUCH_MAXY:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2

    .line 110
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 72
    new-instance p1, Landroid/view/animation/OvershootInterpolator;

    invoke-direct {p1}, Landroid/view/animation/OvershootInterpolator;-><init>()V

    iput-object p1, p0, Lcom/android/camera/ui/V9EdgeShutterView;->mFlyinInterpolator:Landroid/view/animation/Interpolator;

    .line 73
    new-instance p1, Lcom/android/camera/ui/V9EdgeShutterView$ReverseInterpolator;

    const/4 p2, 0x0

    invoke-direct {p1, p0, p2}, Lcom/android/camera/ui/V9EdgeShutterView$ReverseInterpolator;-><init>(Lcom/android/camera/ui/V9EdgeShutterView;Lcom/android/camera/ui/V9EdgeShutterView$1;)V

    iput-object p1, p0, Lcom/android/camera/ui/V9EdgeShutterView;->mPressInterpolator:Landroid/view/animation/Interpolator;

    .line 74
    new-instance p1, Lmiui/view/animation/CubicEaseOutInterpolator;

    invoke-direct {p1}, Lmiui/view/animation/CubicEaseOutInterpolator;-><init>()V

    iput-object p1, p0, Lcom/android/camera/ui/V9EdgeShutterView;->mMoveInterpolator:Landroid/view/animation/Interpolator;

    .line 78
    new-instance p1, Lcom/android/camera/ui/V9EdgeShutterView$1;

    invoke-direct {p1, p0}, Lcom/android/camera/ui/V9EdgeShutterView$1;-><init>(Lcom/android/camera/ui/V9EdgeShutterView;)V

    iput-object p1, p0, Lcom/android/camera/ui/V9EdgeShutterView;->mHandler:Landroid/os/Handler;

    .line 111
    new-instance p1, Landroid/graphics/Rect;

    sget p2, Lcom/android/camera/Util;->sWindowWidth:I

    sget v0, Lcom/android/camera/Util;->sWindowHeight:I

    const/4 v1, 0x0

    invoke-direct {p1, v1, v1, p2, v0}, Landroid/graphics/Rect;-><init>(IIII)V

    iput-object p1, p0, Lcom/android/camera/ui/V9EdgeShutterView;->mVisibleBounds:Landroid/graphics/Rect;

    .line 112
    return-void
.end method

.method static synthetic access$100(Lcom/android/camera/ui/V9EdgeShutterView;)V
    .locals 0

    .line 35
    invoke-direct {p0}, Lcom/android/camera/ui/V9EdgeShutterView;->hideShutterView()V

    return-void
.end method

.method static synthetic access$200(Lcom/android/camera/ui/V9EdgeShutterView;)V
    .locals 0

    .line 35
    invoke-direct {p0}, Lcom/android/camera/ui/V9EdgeShutterView;->checkPosture()V

    return-void
.end method

.method static synthetic access$400(Lcom/android/camera/ui/V9EdgeShutterView;)Landroid/animation/ValueAnimator;
    .locals 0

    .line 35
    iget-object p0, p0, Lcom/android/camera/ui/V9EdgeShutterView;->mFlyOutAnim:Landroid/animation/ValueAnimator;

    return-object p0
.end method

.method static synthetic access$500(Lcom/android/camera/ui/V9EdgeShutterView;)I
    .locals 0

    .line 35
    iget p0, p0, Lcom/android/camera/ui/V9EdgeShutterView;->mVisibleState:I

    return p0
.end method

.method static synthetic access$502(Lcom/android/camera/ui/V9EdgeShutterView;I)I
    .locals 0

    .line 35
    iput p1, p0, Lcom/android/camera/ui/V9EdgeShutterView;->mVisibleState:I

    return p1
.end method

.method static synthetic access$600(Lcom/android/camera/ui/V9EdgeShutterView;I)V
    .locals 0

    .line 35
    invoke-direct {p0, p1}, Lcom/android/camera/ui/V9EdgeShutterView;->setRelateVisible(I)V

    return-void
.end method

.method static synthetic access$700(Lcom/android/camera/ui/V9EdgeShutterView;)Landroid/animation/ValueAnimator;
    .locals 0

    .line 35
    iget-object p0, p0, Lcom/android/camera/ui/V9EdgeShutterView;->mMoveAnim:Landroid/animation/ValueAnimator;

    return-object p0
.end method

.method static synthetic access$800(Lcom/android/camera/ui/V9EdgeShutterView;)Landroid/animation/ValueAnimator;
    .locals 0

    .line 35
    iget-object p0, p0, Lcom/android/camera/ui/V9EdgeShutterView;->mClickAnim:Landroid/animation/ValueAnimator;

    return-object p0
.end method

.method private checkPosture()V
    .locals 2

    .line 387
    invoke-virtual {p0}, Lcom/android/camera/ui/V9EdgeShutterView;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getCapturePosture()I

    move-result v0

    .line 388
    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    invoke-virtual {p0}, Lcom/android/camera/ui/V9EdgeShutterView;->getLeft()I

    move-result v1

    if-nez v1, :cond_2

    :cond_0
    const/4 v1, 0x2

    if-ne v0, v1, :cond_1

    .line 389
    invoke-virtual {p0}, Lcom/android/camera/ui/V9EdgeShutterView;->getLeft()I

    move-result v1

    if-eqz v1, :cond_2

    :cond_1
    if-nez v0, :cond_3

    .line 390
    invoke-virtual {p0}, Lcom/android/camera/ui/V9EdgeShutterView;->getTop()I

    move-result v0

    sget v1, Lcom/android/camera/ui/V9EdgeShutterView;->NORMAL_TAP_MAXY:I

    if-le v0, v1, :cond_3

    .line 391
    :cond_2
    invoke-direct {p0}, Lcom/android/camera/ui/V9EdgeShutterView;->hideShutterView()V

    .line 393
    :cond_3
    return-void
.end method

.method private couldTouch(II)Z
    .locals 2

    .line 158
    iget v0, p0, Lcom/android/camera/ui/V9EdgeShutterView;->mVisibleState:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 159
    invoke-virtual {p0}, Lcom/android/camera/ui/V9EdgeShutterView;->getLeft()I

    move-result v0

    sub-int/2addr p1, v0

    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    move-result p1

    sget v0, Lcom/android/camera/ui/V9EdgeShutterView;->NEAR_THRESHOLD:I

    if-gt p1, v0, :cond_0

    .line 160
    invoke-virtual {p0}, Lcom/android/camera/ui/V9EdgeShutterView;->getTop()I

    move-result p1

    invoke-virtual {p0}, Lcom/android/camera/ui/V9EdgeShutterView;->getBottom()I

    move-result v0

    add-int/2addr p1, v0

    div-int/lit8 p1, p1, 0x2

    sub-int/2addr p2, p1

    invoke-static {p2}, Ljava/lang/Math;->abs(I)I

    move-result p1

    sget p2, Lcom/android/camera/ui/V9EdgeShutterView;->NEAR_THRESHOLD:I

    if-gt p1, p2, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 158
    :goto_0
    return v1
.end method

.method private createClickAnimation()Landroid/animation/ValueAnimator;
    .locals 4

    .line 353
    const-string v0, "x"

    const/4 v1, 0x1

    new-array v1, v1, [F

    .line 354
    invoke-virtual {p0}, Lcom/android/camera/ui/V9EdgeShutterView;->getLeft()I

    move-result v2

    sget v3, Lcom/android/camera/ui/V9EdgeShutterView;->VIEW_WIDTH:I

    if-ge v2, v3, :cond_0

    invoke-virtual {p0}, Lcom/android/camera/ui/V9EdgeShutterView;->getLeft()I

    move-result v2

    sget v3, Lcom/android/camera/ui/V9EdgeShutterView;->VIEW_WIDTH:I

    div-int/lit8 v3, v3, 0x5

    add-int/2addr v2, v3

    :goto_0
    int-to-float v2, v2

    goto :goto_1

    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/ui/V9EdgeShutterView;->getLeft()I

    move-result v2

    sget v3, Lcom/android/camera/ui/V9EdgeShutterView;->VIEW_WIDTH:I

    div-int/lit8 v3, v3, 0x5

    sub-int/2addr v2, v3

    goto :goto_0

    :goto_1
    const/4 v3, 0x0

    aput v2, v1, v3

    .line 353
    invoke-static {p0, v0, v1}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v0

    .line 355
    iget-object v1, p0, Lcom/android/camera/ui/V9EdgeShutterView;->mPressInterpolator:Landroid/view/animation/Interpolator;

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 356
    const-wide/16 v1, 0xfa

    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 357
    iget-object v1, p0, Lcom/android/camera/ui/V9EdgeShutterView;->mAnimatorListener:Landroid/animation/Animator$AnimatorListener;

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 358
    return-object v0
.end method

.method private createFlyInAnimation()Landroid/animation/ValueAnimator;
    .locals 4

    .line 312
    invoke-virtual {p0}, Lcom/android/camera/ui/V9EdgeShutterView;->getLeft()I

    move-result v0

    sget v1, Lcom/android/camera/ui/V9EdgeShutterView;->VIEW_WIDTH:I

    if-ge v0, v1, :cond_0

    .line 313
    sget v0, Lcom/android/camera/ui/V9EdgeShutterView;->VIEW_WIDTH:I

    neg-int v0, v0

    .line 314
    goto :goto_0

    .line 316
    :cond_0
    sget v0, Lcom/android/camera/ui/V9EdgeShutterView;->VIEW_WIDTH:I

    .line 317
    nop

    .line 319
    :goto_0
    const-string v1, "translationX"

    const/4 v2, 0x2

    new-array v2, v2, [F

    int-to-float v0, v0

    const/4 v3, 0x0

    aput v0, v2, v3

    const/4 v0, 0x1

    int-to-float v3, v3

    aput v3, v2, v0

    invoke-static {p0, v1, v2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v0

    .line 320
    iget-object v1, p0, Lcom/android/camera/ui/V9EdgeShutterView;->mFlyinInterpolator:Landroid/view/animation/Interpolator;

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 321
    const-wide/16 v1, 0xfa

    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 322
    iget-object v1, p0, Lcom/android/camera/ui/V9EdgeShutterView;->mAnimatorListener:Landroid/animation/Animator$AnimatorListener;

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 323
    return-object v0
.end method

.method private createFlyOutAnimation()Landroid/animation/ValueAnimator;
    .locals 5

    .line 338
    invoke-virtual {p0}, Lcom/android/camera/ui/V9EdgeShutterView;->getLeft()I

    move-result v0

    sget v1, Lcom/android/camera/ui/V9EdgeShutterView;->VIEW_WIDTH:I

    if-ge v0, v1, :cond_0

    .line 339
    nop

    .line 340
    sget v0, Lcom/android/camera/ui/V9EdgeShutterView;->VIEW_WIDTH:I

    neg-int v0, v0

    goto :goto_0

    .line 342
    :cond_0
    nop

    .line 343
    sget v0, Lcom/android/camera/ui/V9EdgeShutterView;->VIEW_WIDTH:I

    .line 345
    :goto_0
    const-string v1, "translationX"

    const/4 v2, 0x2

    new-array v2, v2, [F

    const/4 v3, 0x0

    int-to-float v4, v3

    aput v4, v2, v3

    const/4 v3, 0x1

    int-to-float v0, v0

    aput v0, v2, v3

    invoke-static {p0, v1, v2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v0

    .line 346
    iget-object v1, p0, Lcom/android/camera/ui/V9EdgeShutterView;->mMoveInterpolator:Landroid/view/animation/Interpolator;

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 347
    const-wide/16 v1, 0xfa

    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 348
    iget-object v1, p0, Lcom/android/camera/ui/V9EdgeShutterView;->mAnimatorListener:Landroid/animation/Animator$AnimatorListener;

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 349
    return-object v0
.end method

.method private createMoveAnimation(Landroid/graphics/Rect;)Landroid/animation/ValueAnimator;
    .locals 5

    .line 327
    const-string v0, "x"

    const/4 v1, 0x1

    new-array v2, v1, [F

    iget v3, p1, Landroid/graphics/Rect;->left:I

    int-to-float v3, v3

    const/4 v4, 0x0

    aput v3, v2, v4

    invoke-static {v0, v2}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v0

    .line 328
    const-string v2, "y"

    new-array v3, v1, [F

    iget p1, p1, Landroid/graphics/Rect;->top:I

    int-to-float p1, p1

    aput p1, v3, v4

    invoke-static {v2, v3}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object p1

    .line 329
    const/4 v2, 0x2

    new-array v2, v2, [Landroid/animation/PropertyValuesHolder;

    aput-object v0, v2, v4

    aput-object p1, v2, v1

    invoke-static {p0, v2}, Landroid/animation/ObjectAnimator;->ofPropertyValuesHolder(Ljava/lang/Object;[Landroid/animation/PropertyValuesHolder;)Landroid/animation/ObjectAnimator;

    move-result-object p1

    .line 330
    iget-object v0, p0, Lcom/android/camera/ui/V9EdgeShutterView;->mMoveInterpolator:Landroid/view/animation/Interpolator;

    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 331
    const-wide/16 v0, 0x12c

    invoke-virtual {p1, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 332
    iget-object v0, p0, Lcom/android/camera/ui/V9EdgeShutterView;->mAnimatorListener:Landroid/animation/Animator$AnimatorListener;

    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 333
    return-object p1
.end method

.method private flyto(II)V
    .locals 3

    .line 186
    iget-object v0, p0, Lcom/android/camera/ui/V9EdgeShutterView;->mVisibleBounds:Landroid/graphics/Rect;

    invoke-direct {p0, p1, p2, v0}, Lcom/android/camera/ui/V9EdgeShutterView;->reviseLocation(IILandroid/graphics/Rect;)Landroid/graphics/Rect;

    move-result-object p1

    .line 187
    const-string p2, "CameraEdgeShutterView"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "flyto "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/android/camera/ui/V9EdgeShutterView;->getVisibility()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " rec="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, " viewstate:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-direct {p0}, Lcom/android/camera/ui/V9EdgeShutterView;->getViewState()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p2, v0}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 188
    invoke-virtual {p0}, Lcom/android/camera/ui/V9EdgeShutterView;->getVisibility()I

    move-result p2

    if-eqz p2, :cond_1

    .line 189
    invoke-virtual {p0}, Lcom/android/camera/ui/V9EdgeShutterView;->getVisibility()I

    move-result p2

    const/16 v0, 0x8

    if-ne p2, v0, :cond_0

    .line 190
    invoke-direct {p0, p1}, Lcom/android/camera/ui/V9EdgeShutterView;->setInitLayoutParameters(Landroid/graphics/Rect;)V

    .line 192
    :cond_0
    iget p2, p1, Landroid/graphics/Rect;->left:I

    iget v0, p1, Landroid/graphics/Rect;->top:I

    iget v1, p1, Landroid/graphics/Rect;->right:I

    iget p1, p1, Landroid/graphics/Rect;->bottom:I

    invoke-virtual {p0, p2, v0, v1, p1}, Lcom/android/camera/ui/V9EdgeShutterView;->layout(IIII)V

    .line 193
    invoke-direct {p0}, Lcom/android/camera/ui/V9EdgeShutterView;->createFlyInAnimation()Landroid/animation/ValueAnimator;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/ui/V9EdgeShutterView;->mFlyinAnim:Landroid/animation/ValueAnimator;

    .line 194
    iget-object p1, p0, Lcom/android/camera/ui/V9EdgeShutterView;->mFlyinAnim:Landroid/animation/ValueAnimator;

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->start()V

    .line 195
    const/4 p1, 0x1

    iput p1, p0, Lcom/android/camera/ui/V9EdgeShutterView;->mVisibleState:I

    .line 196
    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lcom/android/camera/ui/V9EdgeShutterView;->setRelateVisible(I)V

    goto :goto_0

    .line 198
    :cond_1
    iget-object p2, p0, Lcom/android/camera/ui/V9EdgeShutterView;->mFlyOutAnim:Landroid/animation/ValueAnimator;

    if-eqz p2, :cond_2

    iget-object p2, p0, Lcom/android/camera/ui/V9EdgeShutterView;->mFlyOutAnim:Landroid/animation/ValueAnimator;

    invoke-virtual {p2}, Landroid/animation/ValueAnimator;->isStarted()Z

    move-result p2

    if-eqz p2, :cond_2

    .line 199
    iget-object p2, p0, Lcom/android/camera/ui/V9EdgeShutterView;->mFlyOutAnim:Landroid/animation/ValueAnimator;

    invoke-virtual {p2}, Landroid/animation/ValueAnimator;->cancel()V

    .line 201
    :cond_2
    iget-object p2, p0, Lcom/android/camera/ui/V9EdgeShutterView;->mFlyinAnim:Landroid/animation/ValueAnimator;

    if-eqz p2, :cond_3

    iget-object p2, p0, Lcom/android/camera/ui/V9EdgeShutterView;->mFlyinAnim:Landroid/animation/ValueAnimator;

    invoke-virtual {p2}, Landroid/animation/ValueAnimator;->isStarted()Z

    move-result p2

    if-eqz p2, :cond_3

    .line 202
    iget-object p2, p0, Lcom/android/camera/ui/V9EdgeShutterView;->mFlyinAnim:Landroid/animation/ValueAnimator;

    invoke-virtual {p2}, Landroid/animation/ValueAnimator;->cancel()V

    .line 204
    :cond_3
    invoke-direct {p0, p1}, Lcom/android/camera/ui/V9EdgeShutterView;->createMoveAnimation(Landroid/graphics/Rect;)Landroid/animation/ValueAnimator;

    move-result-object p2

    iput-object p2, p0, Lcom/android/camera/ui/V9EdgeShutterView;->mMoveAnim:Landroid/animation/ValueAnimator;

    .line 205
    iget-object p2, p0, Lcom/android/camera/ui/V9EdgeShutterView;->mMoveAnim:Landroid/animation/ValueAnimator;

    invoke-virtual {p2}, Landroid/animation/ValueAnimator;->start()V

    .line 206
    const/4 p2, 0x3

    iput p2, p0, Lcom/android/camera/ui/V9EdgeShutterView;->mVisibleState:I

    .line 207
    iget p2, p1, Landroid/graphics/Rect;->left:I

    iget v0, p1, Landroid/graphics/Rect;->top:I

    iget v1, p1, Landroid/graphics/Rect;->right:I

    iget v2, p1, Landroid/graphics/Rect;->bottom:I

    invoke-virtual {p0, p2, v0, v1, v2}, Lcom/android/camera/ui/V9EdgeShutterView;->layout(IIII)V

    .line 208
    iget p1, p1, Landroid/graphics/Rect;->left:I

    int-to-float p1, p1

    invoke-virtual {p0, p1}, Lcom/android/camera/ui/V9EdgeShutterView;->setX(F)V

    .line 210
    :goto_0
    return-void
.end method

.method private getViewState()Ljava/lang/String;
    .locals 5

    .line 373
    sget-object v0, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v1, "View state mleft=%d mtop=%d width=%d height=%d mVisibleState=%d getVisibility()=%d"

    const/4 v2, 0x6

    new-array v2, v2, [Ljava/lang/Object;

    .line 375
    invoke-virtual {p0}, Lcom/android/camera/ui/V9EdgeShutterView;->getLeft()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    invoke-virtual {p0}, Lcom/android/camera/ui/V9EdgeShutterView;->getTop()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x1

    aput-object v3, v2, v4

    invoke-virtual {p0}, Lcom/android/camera/ui/V9EdgeShutterView;->getWidth()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x2

    aput-object v3, v2, v4

    invoke-virtual {p0}, Lcom/android/camera/ui/V9EdgeShutterView;->getHeight()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x3

    aput-object v3, v2, v4

    iget v3, p0, Lcom/android/camera/ui/V9EdgeShutterView;->mVisibleState:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x4

    aput-object v3, v2, v4

    invoke-virtual {p0}, Lcom/android/camera/ui/V9EdgeShutterView;->getVisibility()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x5

    aput-object v3, v2, v4

    .line 373
    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private hideShutterView()V
    .locals 2

    .line 379
    iget v0, p0, Lcom/android/camera/ui/V9EdgeShutterView;->mVisibleState:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 380
    invoke-direct {p0}, Lcom/android/camera/ui/V9EdgeShutterView;->createFlyOutAnimation()Landroid/animation/ValueAnimator;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/ui/V9EdgeShutterView;->mFlyOutAnim:Landroid/animation/ValueAnimator;

    .line 381
    iget-object v0, p0, Lcom/android/camera/ui/V9EdgeShutterView;->mFlyOutAnim:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    .line 382
    const/4 v0, 0x2

    iput v0, p0, Lcom/android/camera/ui/V9EdgeShutterView;->mVisibleState:I

    .line 384
    :cond_0
    return-void
.end method

.method private isDeviceStateReady(III)Z
    .locals 5

    .line 396
    invoke-virtual {p0}, Lcom/android/camera/ui/V9EdgeShutterView;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/android/camera/Camera;

    .line 397
    invoke-virtual {v0}, Lcom/android/camera/Camera;->isStable()Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_0

    .line 398
    const-string p1, "CameraEdgeShutterView"

    const-string p2, "Device is not stable, ignore edgetouch"

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 399
    return v2

    .line 401
    :cond_0
    invoke-virtual {v0}, Lcom/android/camera/Camera;->getCapturePosture()I

    move-result v0

    .line 402
    if-nez v0, :cond_1

    if-le p2, p3, :cond_1

    .line 403
    const-string v1, "CameraEdgeShutterView"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Device post wrong, y is too big, capturePosture="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, " x="

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " y="

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " maxY="

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 405
    return v2

    .line 406
    :cond_1
    const/4 p3, 0x1

    if-ne v0, p3, :cond_2

    if-nez p1, :cond_3

    :cond_2
    const/4 v1, 0x2

    if-ne v0, v1, :cond_4

    if-nez p1, :cond_4

    .line 407
    :cond_3
    const-string p3, "CameraEdgeShutterView"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Device post wrong, touching bottom edge, capturePosture="

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, " x="

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " y="

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p3, p1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 409
    return v2

    .line 411
    :cond_4
    return p3
.end method

.method private resendUnusedMessage()V
    .locals 4

    .line 362
    iget-object v0, p0, Lcom/android/camera/ui/V9EdgeShutterView;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 363
    iget-object v0, p0, Lcom/android/camera/ui/V9EdgeShutterView;->mHandler:Landroid/os/Handler;

    const-wide/16 v2, 0x1388

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 364
    return-void
.end method

.method private reviseLocation(IILandroid/graphics/Rect;)Landroid/graphics/Rect;
    .locals 3

    .line 220
    const-string v0, "CameraEdgeShutterView"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "flyto reviseLocation x"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " y="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " bounds="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, " viewstate:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 221
    invoke-direct {p0}, Lcom/android/camera/ui/V9EdgeShutterView;->getViewState()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 220
    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 222
    sget v0, Lcom/android/camera/ui/V9EdgeShutterView;->VIEW_WIDTH:I

    mul-int/2addr v0, p2

    sget v1, Lcom/android/camera/Util;->sWindowHeight:I

    div-int/2addr v0, v1

    .line 223
    new-instance v1, Landroid/graphics/Rect;

    sub-int/2addr p2, v0

    sget v0, Lcom/android/camera/ui/V9EdgeShutterView;->VIEW_WIDTH:I

    add-int/2addr v0, p1

    sget v2, Lcom/android/camera/ui/V9EdgeShutterView;->VIEW_WIDTH:I

    add-int/2addr v2, p2

    invoke-direct {v1, p1, p2, v0, v2}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 228
    invoke-virtual {p3, v1}, Landroid/graphics/Rect;->contains(Landroid/graphics/Rect;)Z

    move-result p1

    if-eqz p1, :cond_0

    return-object v1

    .line 229
    :cond_0
    iget p1, v1, Landroid/graphics/Rect;->left:I

    iget p2, p3, Landroid/graphics/Rect;->left:I

    if-ge p1, p2, :cond_1

    .line 230
    iget p1, p3, Landroid/graphics/Rect;->left:I

    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    move-result p2

    add-int/2addr p1, p2

    iput p1, v1, Landroid/graphics/Rect;->right:I

    .line 231
    iget p1, p3, Landroid/graphics/Rect;->left:I

    iput p1, v1, Landroid/graphics/Rect;->left:I

    goto :goto_0

    .line 232
    :cond_1
    iget p1, v1, Landroid/graphics/Rect;->right:I

    iget p2, p3, Landroid/graphics/Rect;->right:I

    if-le p1, p2, :cond_2

    .line 233
    iget p1, p3, Landroid/graphics/Rect;->right:I

    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    move-result p2

    sub-int/2addr p1, p2

    iput p1, v1, Landroid/graphics/Rect;->left:I

    .line 234
    iget p1, p3, Landroid/graphics/Rect;->right:I

    iput p1, v1, Landroid/graphics/Rect;->right:I

    .line 236
    :cond_2
    :goto_0
    iget p1, v1, Landroid/graphics/Rect;->top:I

    iget p2, p3, Landroid/graphics/Rect;->top:I

    if-ge p1, p2, :cond_3

    .line 237
    iget p1, p3, Landroid/graphics/Rect;->top:I

    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    move-result p2

    add-int/2addr p1, p2

    iput p1, v1, Landroid/graphics/Rect;->bottom:I

    .line 238
    iget p1, p3, Landroid/graphics/Rect;->top:I

    iput p1, v1, Landroid/graphics/Rect;->top:I

    goto :goto_1

    .line 239
    :cond_3
    iget p1, v1, Landroid/graphics/Rect;->bottom:I

    iget p2, p3, Landroid/graphics/Rect;->bottom:I

    if-le p1, p2, :cond_4

    .line 240
    iget p1, p3, Landroid/graphics/Rect;->bottom:I

    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    move-result p2

    sub-int/2addr p1, p2

    iput p1, v1, Landroid/graphics/Rect;->top:I

    .line 241
    iget p1, p3, Landroid/graphics/Rect;->bottom:I

    iput p1, v1, Landroid/graphics/Rect;->bottom:I

    .line 243
    :cond_4
    :goto_1
    return-object v1
.end method

.method private setInitLayoutParameters(Landroid/graphics/Rect;)V
    .locals 2

    .line 213
    invoke-virtual {p0}, Lcom/android/camera/ui/V9EdgeShutterView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout$LayoutParams;

    .line 214
    iget v1, p1, Landroid/graphics/Rect;->left:I

    iput v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->leftMargin:I

    .line 215
    iget p1, p1, Landroid/graphics/Rect;->top:I

    iput p1, v0, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    .line 216
    invoke-virtual {p0, v0}, Lcom/android/camera/ui/V9EdgeShutterView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 217
    return-void
.end method

.method private setRelateVisible(I)V
    .locals 2

    .line 423
    invoke-virtual {p0}, Lcom/android/camera/ui/V9EdgeShutterView;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout;

    .line 424
    if-eqz v0, :cond_1

    .line 425
    const/16 v1, 0x8

    if-eq v1, p1, :cond_0

    const/4 v1, 0x0

    nop

    :cond_0
    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 427
    :cond_1
    invoke-virtual {p0, p1}, Lcom/android/camera/ui/V9EdgeShutterView;->setVisibility(I)V

    .line 428
    return-void
.end method


# virtual methods
.method public cancelAnimation()V
    .locals 1

    .line 367
    invoke-virtual {p0}, Lcom/android/camera/ui/V9EdgeShutterView;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->cancel()V

    .line 368
    invoke-virtual {p0}, Lcom/android/camera/ui/V9EdgeShutterView;->getLeft()I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p0, v0}, Lcom/android/camera/ui/V9EdgeShutterView;->setX(F)V

    .line 369
    invoke-virtual {p0}, Lcom/android/camera/ui/V9EdgeShutterView;->getTop()I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p0, v0}, Lcom/android/camera/ui/V9EdgeShutterView;->setY(F)V

    .line 370
    return-void
.end method

.method public enableControls(Z)V
    .locals 0

    .line 134
    return-void
.end method

.method public onCameraOpen()V
    .locals 0

    .line 131
    return-void
.end method

.method public onCreate()V
    .locals 2

    .line 120
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isVideoModule()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 121
    iget-object v0, p0, Lcom/android/camera/ui/V9EdgeShutterView;->mCenterPaint:Landroid/graphics/Paint;

    const v1, -0xfc0ff

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 122
    iget-object v0, p0, Lcom/android/camera/ui/V9EdgeShutterView;->mOuterPaint:Landroid/graphics/Paint;

    const v1, -0x6f000001

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    goto :goto_0

    .line 124
    :cond_0
    iget-object v0, p0, Lcom/android/camera/ui/V9EdgeShutterView;->mCenterPaint:Landroid/graphics/Paint;

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 125
    iget-object v0, p0, Lcom/android/camera/ui/V9EdgeShutterView;->mOuterPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 127
    :goto_0
    return-void
.end method

.method public onDeviceMoving()V
    .locals 2

    .line 419
    iget-object v0, p0, Lcom/android/camera/ui/V9EdgeShutterView;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 420
    return-void
.end method

.method public onDevicePostureChanged()V
    .locals 2

    .line 415
    iget-object v0, p0, Lcom/android/camera/ui/V9EdgeShutterView;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 416
    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 4

    .line 254
    sget v0, Lcom/android/camera/ui/V9EdgeShutterView;->VIEW_WIDTH:I

    div-int/lit8 v0, v0, 0x2

    int-to-float v0, v0

    sget v1, Lcom/android/camera/ui/V9EdgeShutterView;->VIEW_WIDTH:I

    div-int/lit8 v1, v1, 0x2

    int-to-float v1, v1

    sget v2, Lcom/android/camera/ui/V9EdgeShutterView;->OUT_RADIUS:I

    add-int/lit8 v2, v2, -0x2

    int-to-float v2, v2

    iget-object v3, p0, Lcom/android/camera/ui/V9EdgeShutterView;->mOuterPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 256
    sget v0, Lcom/android/camera/ui/V9EdgeShutterView;->VIEW_WIDTH:I

    div-int/lit8 v0, v0, 0x2

    int-to-float v0, v0

    sget v1, Lcom/android/camera/ui/V9EdgeShutterView;->VIEW_WIDTH:I

    div-int/lit8 v1, v1, 0x2

    int-to-float v1, v1

    sget v2, Lcom/android/camera/ui/V9EdgeShutterView;->CENTER_RADIUS:I

    int-to-float v2, v2

    iget-object v3, p0, Lcom/android/camera/ui/V9EdgeShutterView;->mCenterPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 257
    return-void
.end method

.method public onEdgeTap(II)Z
    .locals 3

    .line 148
    const-string v0, "CameraEdgeShutterView"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onEdgeTouch x="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " y="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " viewstate:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-direct {p0}, Lcom/android/camera/ui/V9EdgeShutterView;->getViewState()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 149
    invoke-direct {p0, p1, p2}, Lcom/android/camera/ui/V9EdgeShutterView;->couldTouch(II)Z

    move-result v0

    if-nez v0, :cond_0

    sget v0, Lcom/android/camera/ui/V9EdgeShutterView;->NORMAL_TAP_MAXY:I

    invoke-direct {p0, p1, p2, v0}, Lcom/android/camera/ui/V9EdgeShutterView;->isDeviceStateReady(III)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 150
    invoke-direct {p0, p1, p2}, Lcom/android/camera/ui/V9EdgeShutterView;->flyto(II)V

    .line 151
    invoke-direct {p0}, Lcom/android/camera/ui/V9EdgeShutterView;->resendUnusedMessage()V

    .line 152
    const/4 p1, 0x1

    return p1

    .line 154
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public onEdgeTouch(II)Z
    .locals 6

    .line 164
    const-string v0, "CameraEdgeShutterView"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onEdgeTouch x="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " y="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " viewstate:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-direct {p0}, Lcom/android/camera/ui/V9EdgeShutterView;->getViewState()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 165
    invoke-direct {p0, p1, p2}, Lcom/android/camera/ui/V9EdgeShutterView;->couldTouch(II)Z

    move-result v0

    if-eqz v0, :cond_2

    sget v0, Lcom/android/camera/ui/V9EdgeShutterView;->NORMAL_TOUCH_MAXY:I

    invoke-direct {p0, p1, p2, v0}, Lcom/android/camera/ui/V9EdgeShutterView;->isDeviceStateReady(III)Z

    move-result p1

    if-eqz p1, :cond_2

    .line 166
    iget-object p1, p0, Lcom/android/camera/ui/V9EdgeShutterView;->mFlyinAnim:Landroid/animation/ValueAnimator;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/android/camera/ui/V9EdgeShutterView;->mFlyinAnim:Landroid/animation/ValueAnimator;

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->isStarted()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 167
    iget-object p1, p0, Lcom/android/camera/ui/V9EdgeShutterView;->mFlyinAnim:Landroid/animation/ValueAnimator;

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->cancel()V

    .line 169
    :cond_0
    iget-object p1, p0, Lcom/android/camera/ui/V9EdgeShutterView;->mMessageDispatcher:Lcom/android/camera/ui/MessageDispatcher;

    if-eqz p1, :cond_1

    .line 170
    iget-object v0, p0, Lcom/android/camera/ui/V9EdgeShutterView;->mMessageDispatcher:Lcom/android/camera/ui/MessageDispatcher;

    const/4 v1, 0x0

    const v2, 0x7f0d00ff

    const/4 v3, 0x2

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-interface/range {v0 .. v5}, Lcom/android/camera/ui/MessageDispatcher;->dispatchMessage(IIILjava/lang/Object;Ljava/lang/Object;)Z

    .line 176
    :cond_1
    invoke-direct {p0}, Lcom/android/camera/ui/V9EdgeShutterView;->createClickAnimation()Landroid/animation/ValueAnimator;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/ui/V9EdgeShutterView;->mClickAnim:Landroid/animation/ValueAnimator;

    .line 177
    iget-object p1, p0, Lcom/android/camera/ui/V9EdgeShutterView;->mClickAnim:Landroid/animation/ValueAnimator;

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->start()V

    .line 179
    invoke-direct {p0}, Lcom/android/camera/ui/V9EdgeShutterView;->resendUnusedMessage()V

    .line 180
    const/4 p1, 0x1

    return p1

    .line 182
    :cond_2
    const/4 p1, 0x0

    return p1
.end method

.method protected onFinishInflate()V
    .locals 4

    .line 95
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/android/camera/ui/V9EdgeShutterView;->mCenterPaint:Landroid/graphics/Paint;

    .line 96
    iget-object v0, p0, Lcom/android/camera/ui/V9EdgeShutterView;->mCenterPaint:Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 97
    iget-object v0, p0, Lcom/android/camera/ui/V9EdgeShutterView;->mCenterPaint:Landroid/graphics/Paint;

    const/4 v2, -0x1

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 98
    iget-object v0, p0, Lcom/android/camera/ui/V9EdgeShutterView;->mCenterPaint:Landroid/graphics/Paint;

    sget-object v3, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 100
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/android/camera/ui/V9EdgeShutterView;->mOuterPaint:Landroid/graphics/Paint;

    .line 101
    iget-object v0, p0, Lcom/android/camera/ui/V9EdgeShutterView;->mOuterPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 102
    iget-object v0, p0, Lcom/android/camera/ui/V9EdgeShutterView;->mOuterPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 103
    iget-object v0, p0, Lcom/android/camera/ui/V9EdgeShutterView;->mOuterPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 104
    iget-object v0, p0, Lcom/android/camera/ui/V9EdgeShutterView;->mOuterPaint:Landroid/graphics/Paint;

    sget v1, Lcom/android/camera/ui/V9EdgeShutterView;->OUTER_CIRCLE_WIDTH:I

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 106
    new-instance v0, Lcom/android/camera/ui/V9EdgeShutterView$CustomAnimatorListener;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/android/camera/ui/V9EdgeShutterView$CustomAnimatorListener;-><init>(Lcom/android/camera/ui/V9EdgeShutterView;Lcom/android/camera/ui/V9EdgeShutterView$1;)V

    iput-object v0, p0, Lcom/android/camera/ui/V9EdgeShutterView;->mAnimatorListener:Landroid/animation/Animator$AnimatorListener;

    .line 107
    return-void
.end method

.method protected onMeasure(II)V
    .locals 0

    .line 248
    sget p1, Lcom/android/camera/ui/V9EdgeShutterView;->VIEW_WIDTH:I

    sget p2, Lcom/android/camera/ui/V9EdgeShutterView;->VIEW_WIDTH:I

    invoke-virtual {p0, p1, p2}, Lcom/android/camera/ui/V9EdgeShutterView;->setMeasuredDimension(II)V

    .line 249
    return-void
.end method

.method public onPause()V
    .locals 2

    .line 141
    iget-object v0, p0, Lcom/android/camera/ui/V9EdgeShutterView;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 142
    iget-object v0, p0, Lcom/android/camera/ui/V9EdgeShutterView;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 143
    iget-object v0, p0, Lcom/android/camera/ui/V9EdgeShutterView;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 144
    const/16 v0, 0x8

    invoke-direct {p0, v0}, Lcom/android/camera/ui/V9EdgeShutterView;->setRelateVisible(I)V

    .line 145
    return-void
.end method

.method public onResume()V
    .locals 0

    .line 137
    return-void
.end method

.method public setMessageDispatcher(Lcom/android/camera/ui/MessageDispatcher;)V
    .locals 0

    .line 115
    iput-object p1, p0, Lcom/android/camera/ui/V9EdgeShutterView;->mMessageDispatcher:Lcom/android/camera/ui/MessageDispatcher;

    .line 116
    return-void
.end method
