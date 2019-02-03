.class public Lcom/android/camera/ui/ObjectView;
.super Lcom/android/camera/ui/FrameView;
.source "ObjectView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/ui/ObjectView$EndAction;,
        Lcom/android/camera/ui/ObjectView$StartAction;,
        Lcom/android/camera/ui/ObjectView$Filter;,
        Lcom/android/camera/ui/ObjectView$ObjectViewListener;
    }
.end annotation


# static fields
.field private static final ADJUST_TIME_INTERVAL:I = 0x0

.field private static final ANIMATION_DOING:I = 0x1

.field private static final ANIMATION_DONE:I = 0x5

.field private static final ANIMATION_IDLE:I = 0x0

.field private static final ANIMATION_ZOOMIN_DOING:I = 0x2

.field private static final ANIMATION_ZOOMIN_DONE:I = 0x3

.field private static final ANIMATION_ZOOMOUT_DOING:I = 0x4

.field private static final MIN_CROP_WIDTH_HEIGHT:I = 0xc8

.field private static final MOVE_BLOCK:I = 0x10

.field private static final MOVE_BOTTOM:I = 0x8

.field private static final MOVE_LEFT:I = 0x1

.field private static final MOVE_RIGHT:I = 0x4

.field private static final MOVE_TOP:I = 0x2

.field private static final MOVE_VERTEXS:I = 0x20

.field private static final MSG_ADJUST_DONE:I = 0x1

.field private static final MSG_TRACK_FAIL:I = 0x2

.field private static final NEAR_EDGE:I

.field public static final OBJECT_FOCUSED:I = 0x1

.field public static final OBJECT_FOCUSING:I = 0x0

.field private static final OBJECT_TRACKING_ICON:[I

.field public static final OBJECT_TRACKING_SUCCEED:I = 0x1

.field private static final OUT_OF_PREVIEW_THRESHOLD:I = 0x96

.field private static final RECT_EDGE_WIDTH:I

.field private static final SCALING_DOWN_TIME:I = 0x50

.field private static final SCALING_UP_TIME:I = 0x96

.field private static final TAG:Ljava/lang/String; = "ObjectView"

.field private static final TOUCH_TOLERANCE:I

.field private static final TRACKING_FAIL_THRESHOLD:I = 0x32

.field private static final VERTEXS_TOUCH_TOLERANCE:I

.field private static final WAIT_TRACKING_TIME:I = 0x3e8


# instance fields
.field private final mDisplayBounds:Landroid/graphics/RectF;

.field private mEndAction:Ljava/lang/Runnable;

.field protected mFace:Lcom/android/camera2/CameraHardwareFace;

.field private mFace2UIMatrix:Landroid/graphics/Matrix;

.field private mFilter:Lcom/android/camera/ui/ObjectView$Filter;

.field private mHandler:Landroid/os/Handler;

.field private mLastX:F

.field private mLastY:F

.field private mListener:Lcom/android/camera/ui/ObjectView$ObjectViewListener;

.field private mLostTrackThreshold:I

.field private mLostTrackingNum:I

.field private mMovingMode:I

.field protected mObjectRect:Landroid/graphics/RectF;

.field protected mOldObjectRect:Landroid/graphics/RectF;

.field private mPreviewHeight:I

.field private mPreviewWidth:I

.field private mStartAction:Ljava/lang/Runnable;

.field protected mTrackIndicator:Landroid/graphics/drawable/Drawable;

.field private mTrackStatusIndicator:[Landroid/graphics/drawable/Drawable;

.field private mZoomAnimState:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 60
    const/high16 v0, 0x41c80000    # 25.0f

    invoke-static {v0}, Lcom/android/camera/Util;->dpToPixel(F)I

    move-result v0

    sput v0, Lcom/android/camera/ui/ObjectView;->TOUCH_TOLERANCE:I

    .line 61
    const/high16 v0, 0x420c0000    # 35.0f

    invoke-static {v0}, Lcom/android/camera/Util;->dpToPixel(F)I

    move-result v1

    sput v1, Lcom/android/camera/ui/ObjectView;->VERTEXS_TOUCH_TOLERANCE:I

    .line 62
    invoke-static {v0}, Lcom/android/camera/Util;->dpToPixel(F)I

    move-result v0

    sput v0, Lcom/android/camera/ui/ObjectView;->NEAR_EDGE:I

    .line 65
    const/high16 v0, 0x41200000    # 10.0f

    invoke-static {v0}, Lcom/android/camera/Util;->dpToPixel(F)I

    move-result v0

    sput v0, Lcom/android/camera/ui/ObjectView;->RECT_EDGE_WIDTH:I

    .line 66
    const/4 v0, 0x2

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/android/camera/ui/ObjectView;->OBJECT_TRACKING_ICON:[I

    return-void

    nop

    :array_0
    .array-data 4
        0x7f020146
        0x7f020147
    .end array-data
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 3

    .line 128
    invoke-direct {p0, p1, p2}, Lcom/android/camera/ui/FrameView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 40
    new-instance p1, Lcom/android/camera/ui/ObjectView$StartAction;

    const/4 p2, 0x0

    invoke-direct {p1, p0, p2}, Lcom/android/camera/ui/ObjectView$StartAction;-><init>(Lcom/android/camera/ui/ObjectView;Lcom/android/camera/ui/ObjectView$1;)V

    iput-object p1, p0, Lcom/android/camera/ui/ObjectView;->mStartAction:Ljava/lang/Runnable;

    .line 41
    new-instance p1, Lcom/android/camera/ui/ObjectView$EndAction;

    invoke-direct {p1, p0, p2}, Lcom/android/camera/ui/ObjectView$EndAction;-><init>(Lcom/android/camera/ui/ObjectView;Lcom/android/camera/ui/ObjectView$1;)V

    iput-object p1, p0, Lcom/android/camera/ui/ObjectView;->mEndAction:Ljava/lang/Runnable;

    .line 74
    sget-object p1, Lcom/android/camera/ui/ObjectView;->OBJECT_TRACKING_ICON:[I

    array-length p1, p1

    new-array p1, p1, [Landroid/graphics/drawable/Drawable;

    iput-object p1, p0, Lcom/android/camera/ui/ObjectView;->mTrackStatusIndicator:[Landroid/graphics/drawable/Drawable;

    .line 75
    const/4 p1, 0x0

    iput p1, p0, Lcom/android/camera/ui/ObjectView;->mZoomAnimState:I

    .line 78
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    .line 79
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/android/camera/ui/ObjectView;->mOldObjectRect:Landroid/graphics/RectF;

    .line 80
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/android/camera/ui/ObjectView;->mDisplayBounds:Landroid/graphics/RectF;

    .line 83
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/android/camera/ui/ObjectView;->mFace2UIMatrix:Landroid/graphics/Matrix;

    .line 90
    iput p1, p0, Lcom/android/camera/ui/ObjectView;->mLostTrackingNum:I

    .line 93
    new-instance v0, Lcom/android/camera/ui/ObjectView$Filter;

    invoke-direct {v0, p0, p2}, Lcom/android/camera/ui/ObjectView$Filter;-><init>(Lcom/android/camera/ui/ObjectView;Lcom/android/camera/ui/ObjectView$1;)V

    iput-object v0, p0, Lcom/android/camera/ui/ObjectView;->mFilter:Lcom/android/camera/ui/ObjectView$Filter;

    .line 104
    new-instance p2, Lcom/android/camera/ui/ObjectView$1;

    invoke-direct {p2, p0}, Lcom/android/camera/ui/ObjectView$1;-><init>(Lcom/android/camera/ui/ObjectView;)V

    iput-object p2, p0, Lcom/android/camera/ui/ObjectView;->mHandler:Landroid/os/Handler;

    .line 129
    move p2, p1

    :goto_0
    sget-object v0, Lcom/android/camera/ui/ObjectView;->OBJECT_TRACKING_ICON:[I

    array-length v0, v0

    if-ge p2, v0, :cond_0

    .line 130
    iget-object v0, p0, Lcom/android/camera/ui/ObjectView;->mTrackStatusIndicator:[Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0}, Lcom/android/camera/ui/ObjectView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget-object v2, Lcom/android/camera/ui/ObjectView;->OBJECT_TRACKING_ICON:[I

    aget v2, v2, p2

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    aput-object v1, v0, p2

    .line 129
    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    .line 133
    :cond_0
    iget-object p2, p0, Lcom/android/camera/ui/ObjectView;->mTrackStatusIndicator:[Landroid/graphics/drawable/Drawable;

    aget-object p1, p2, p1

    iput-object p1, p0, Lcom/android/camera/ui/ObjectView;->mTrackIndicator:Landroid/graphics/drawable/Drawable;

    .line 134
    return-void
.end method

.method static synthetic access$300(Lcom/android/camera/ui/ObjectView;)Lcom/android/camera/ui/ObjectView$ObjectViewListener;
    .locals 0

    .line 38
    iget-object p0, p0, Lcom/android/camera/ui/ObjectView;->mListener:Lcom/android/camera/ui/ObjectView$ObjectViewListener;

    return-object p0
.end method

.method static synthetic access$400(Lcom/android/camera/ui/ObjectView;)Lcom/android/camera/ui/ObjectView$Filter;
    .locals 0

    .line 38
    iget-object p0, p0, Lcom/android/camera/ui/ObjectView;->mFilter:Lcom/android/camera/ui/ObjectView$Filter;

    return-object p0
.end method

.method static synthetic access$502(Lcom/android/camera/ui/ObjectView;I)I
    .locals 0

    .line 38
    iput p1, p0, Lcom/android/camera/ui/ObjectView;->mZoomAnimState:I

    return p1
.end method

.method private detectMovingStyle(FFFF)V
    .locals 3

    .line 375
    const/4 v0, 0x0

    cmpg-float v1, p3, v0

    if-ltz v1, :cond_1

    cmpg-float v0, p4, v0

    if-gez v0, :cond_0

    goto :goto_0

    .line 400
    :cond_0
    iget-object v0, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->left:F

    invoke-static {p1, p3}, Ljava/lang/Math;->min(FF)F

    move-result v1

    sub-float/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    sget v1, Lcom/android/camera/ui/ObjectView;->VERTEXS_TOUCH_TOLERANCE:I

    int-to-float v1, v1

    cmpg-float v0, v0, v1

    if-gtz v0, :cond_9

    iget-object v0, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->right:F

    .line 401
    invoke-static {p1, p3}, Ljava/lang/Math;->max(FF)F

    move-result p1

    sub-float/2addr v0, p1

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result p1

    sget p3, Lcom/android/camera/ui/ObjectView;->VERTEXS_TOUCH_TOLERANCE:I

    int-to-float p3, p3

    cmpg-float p1, p1, p3

    if-gtz p1, :cond_9

    iget-object p1, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    iget p1, p1, Landroid/graphics/RectF;->top:F

    .line 402
    invoke-static {p2, p4}, Ljava/lang/Math;->min(FF)F

    move-result p3

    sub-float/2addr p1, p3

    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result p1

    sget p3, Lcom/android/camera/ui/ObjectView;->VERTEXS_TOUCH_TOLERANCE:I

    int-to-float p3, p3

    cmpg-float p1, p1, p3

    if-gtz p1, :cond_9

    iget-object p1, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    iget p1, p1, Landroid/graphics/RectF;->bottom:F

    .line 403
    invoke-static {p2, p4}, Ljava/lang/Math;->max(FF)F

    move-result p2

    sub-float/2addr p1, p2

    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result p1

    sget p2, Lcom/android/camera/ui/ObjectView;->VERTEXS_TOUCH_TOLERANCE:I

    int-to-float p2, p2

    cmpg-float p1, p1, p2

    if-gtz p1, :cond_9

    .line 404
    const/16 p1, 0x20

    iput p1, p0, Lcom/android/camera/ui/ObjectView;->mMovingMode:I

    goto/16 :goto_4

    .line 376
    :cond_1
    :goto_0
    const/4 p3, 0x0

    iput p3, p0, Lcom/android/camera/ui/ObjectView;->mMovingMode:I

    .line 378
    iget-object p4, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    iget p4, p4, Landroid/graphics/RectF;->left:F

    sub-float p4, p1, p4

    invoke-static {p4}, Ljava/lang/Math;->abs(F)F

    move-result p4

    .line 379
    iget-object v0, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->right:F

    sub-float v0, p1, v0

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    .line 380
    sget v1, Lcom/android/camera/ui/ObjectView;->TOUCH_TOLERANCE:I

    int-to-float v1, v1

    cmpg-float v1, p4, v1

    const/4 v2, 0x1

    if-gtz v1, :cond_2

    cmpg-float p4, p4, v0

    if-gez p4, :cond_2

    .line 381
    iget p4, p0, Lcom/android/camera/ui/ObjectView;->mMovingMode:I

    or-int/2addr p4, v2

    iput p4, p0, Lcom/android/camera/ui/ObjectView;->mMovingMode:I

    goto :goto_1

    .line 382
    :cond_2
    sget p4, Lcom/android/camera/ui/ObjectView;->TOUCH_TOLERANCE:I

    int-to-float p4, p4

    cmpg-float p4, v0, p4

    if-gtz p4, :cond_3

    .line 383
    iget p4, p0, Lcom/android/camera/ui/ObjectView;->mMovingMode:I

    or-int/lit8 p4, p4, 0x4

    iput p4, p0, Lcom/android/camera/ui/ObjectView;->mMovingMode:I

    .line 387
    :cond_3
    :goto_1
    iget-object p4, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    iget p4, p4, Landroid/graphics/RectF;->top:F

    sub-float p4, p2, p4

    invoke-static {p4}, Ljava/lang/Math;->abs(F)F

    move-result p4

    .line 388
    iget-object v0, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->bottom:F

    sub-float v0, p2, v0

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    .line 389
    sget v1, Lcom/android/camera/ui/ObjectView;->TOUCH_TOLERANCE:I

    int-to-float v1, v1

    cmpg-float v1, p4, v1

    if-gtz v1, :cond_4

    move v1, v2

    goto :goto_2

    :cond_4
    move v1, p3

    :goto_2
    cmpg-float p4, p4, v0

    if-gez p4, :cond_5

    move p3, v2

    nop

    :cond_5
    and-int/2addr p3, v1

    if-eqz p3, :cond_6

    .line 390
    iget p3, p0, Lcom/android/camera/ui/ObjectView;->mMovingMode:I

    or-int/lit8 p3, p3, 0x2

    iput p3, p0, Lcom/android/camera/ui/ObjectView;->mMovingMode:I

    goto :goto_3

    .line 391
    :cond_6
    sget p3, Lcom/android/camera/ui/ObjectView;->TOUCH_TOLERANCE:I

    int-to-float p3, p3

    cmpg-float p3, v0, p3

    if-gtz p3, :cond_7

    .line 392
    iget p3, p0, Lcom/android/camera/ui/ObjectView;->mMovingMode:I

    or-int/lit8 p3, p3, 0x8

    iput p3, p0, Lcom/android/camera/ui/ObjectView;->mMovingMode:I

    .line 395
    :cond_7
    :goto_3
    iget-object p3, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    invoke-virtual {p3, p1, p2}, Landroid/graphics/RectF;->contains(FF)Z

    move-result p1

    if-eqz p1, :cond_8

    iget p1, p0, Lcom/android/camera/ui/ObjectView;->mMovingMode:I

    if-nez p1, :cond_8

    .line 397
    const/16 p1, 0x10

    iput p1, p0, Lcom/android/camera/ui/ObjectView;->mMovingMode:I

    .line 399
    :cond_8
    nop

    .line 407
    :cond_9
    :goto_4
    invoke-virtual {p0}, Lcom/android/camera/ui/ObjectView;->invalidate()V

    .line 408
    return-void
.end method

.method private isInObjectViewArea(FF)Z
    .locals 2

    .line 298
    iget-object v0, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->left:F

    sget v1, Lcom/android/camera/ui/ObjectView;->RECT_EDGE_WIDTH:I

    int-to-float v1, v1

    sub-float/2addr v0, v1

    cmpl-float v0, p1, v0

    if-ltz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->right:F

    sget v1, Lcom/android/camera/ui/ObjectView;->RECT_EDGE_WIDTH:I

    int-to-float v1, v1

    add-float/2addr v0, v1

    cmpg-float p1, p1, v0

    if-gez p1, :cond_0

    iget-object p1, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    iget p1, p1, Landroid/graphics/RectF;->top:F

    sget v0, Lcom/android/camera/ui/ObjectView;->RECT_EDGE_WIDTH:I

    int-to-float v0, v0

    sub-float/2addr p1, v0

    cmpl-float p1, p2, p1

    if-ltz p1, :cond_0

    iget-object p1, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    iget p1, p1, Landroid/graphics/RectF;->bottom:F

    sget v0, Lcom/android/camera/ui/ObjectView;->RECT_EDGE_WIDTH:I

    int-to-float v0, v0

    add-float/2addr p1, v0

    cmpg-float p1, p2, p1

    if-gez p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method private mapRect(Landroid/graphics/RectF;Z)Landroid/graphics/RectF;
    .locals 1

    .line 585
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 586
    invoke-virtual {v0, p1}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 587
    if-eqz p2, :cond_0

    .line 588
    iget-object p1, p0, Lcom/android/camera/ui/ObjectView;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p1, v0}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    goto :goto_0

    .line 590
    :cond_0
    iget-object p1, p0, Lcom/android/camera/ui/ObjectView;->mFace2UIMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p1, v0}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 592
    :goto_0
    return-object v0
.end method

.method private moveObjectView(Landroid/view/MotionEvent;)V
    .locals 6

    .line 411
    iget v0, p0, Lcom/android/camera/ui/ObjectView;->mMovingMode:I

    const/4 v1, 0x1

    const/high16 v2, 0x43480000    # 200.0f

    const/16 v3, 0x20

    if-ne v0, v3, :cond_2

    .line 412
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getX(I)F

    move-result v3

    .line 413
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getY(I)F

    move-result v0

    .line 414
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getX(I)F

    move-result v4

    .line 415
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getY(I)F

    move-result p1

    .line 416
    sub-float v1, v4, v3

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v1

    cmpg-float v1, v2, v1

    if-gez v1, :cond_0

    .line 417
    iget-object v1, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    invoke-static {v3, v4}, Ljava/lang/Math;->min(FF)F

    move-result v5

    iput v5, v1, Landroid/graphics/RectF;->left:F

    .line 418
    iget-object v1, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    invoke-static {v3, v4}, Ljava/lang/Math;->max(FF)F

    move-result v3

    iput v3, v1, Landroid/graphics/RectF;->right:F

    .line 420
    :cond_0
    sub-float v1, p1, v0

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v1

    cmpg-float v1, v2, v1

    if-gez v1, :cond_1

    .line 421
    iget-object v1, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    invoke-static {v0, p1}, Ljava/lang/Math;->min(FF)F

    move-result v2

    iput v2, v1, Landroid/graphics/RectF;->top:F

    .line 422
    iget-object v1, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    invoke-static {v0, p1}, Ljava/lang/Math;->max(FF)F

    move-result p1

    iput p1, v1, Landroid/graphics/RectF;->bottom:F

    .line 424
    :cond_1
    goto/16 :goto_2

    .line 425
    :cond_2
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    iget v3, p0, Lcom/android/camera/ui/ObjectView;->mLastX:F

    sub-float/2addr v0, v3

    .line 426
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    iget v3, p0, Lcom/android/camera/ui/ObjectView;->mLastY:F

    sub-float/2addr p1, v3

    .line 427
    iget v3, p0, Lcom/android/camera/ui/ObjectView;->mMovingMode:I

    const/16 v4, 0x10

    if-ne v3, v4, :cond_5

    .line 429
    const/4 v1, 0x0

    cmpl-float v2, v0, v1

    if-lez v2, :cond_3

    iget-object v2, p0, Lcom/android/camera/ui/ObjectView;->mDisplayBounds:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->right:F

    iget-object v3, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    iget v3, v3, Landroid/graphics/RectF;->right:F

    sub-float/2addr v2, v3

    invoke-static {v2, v0}, Ljava/lang/Math;->min(FF)F

    move-result v0

    goto :goto_0

    .line 430
    :cond_3
    iget-object v2, p0, Lcom/android/camera/ui/ObjectView;->mDisplayBounds:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->left:F

    iget-object v3, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    iget v3, v3, Landroid/graphics/RectF;->left:F

    sub-float/2addr v2, v3

    invoke-static {v2, v0}, Ljava/lang/Math;->max(FF)F

    move-result v0

    .line 431
    :goto_0
    cmpl-float v1, p1, v1

    if-lez v1, :cond_4

    iget-object v1, p0, Lcom/android/camera/ui/ObjectView;->mDisplayBounds:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->bottom:F

    iget-object v2, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->bottom:F

    sub-float/2addr v1, v2

    invoke-static {v1, p1}, Ljava/lang/Math;->min(FF)F

    move-result p1

    goto :goto_1

    .line 432
    :cond_4
    iget-object v1, p0, Lcom/android/camera/ui/ObjectView;->mDisplayBounds:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->top:F

    iget-object v2, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->top:F

    sub-float/2addr v1, v2

    invoke-static {v1, p1}, Ljava/lang/Math;->max(FF)F

    move-result p1

    .line 433
    :goto_1
    iget-object v1, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    invoke-virtual {v1, v0, p1}, Landroid/graphics/RectF;->offset(FF)V

    goto :goto_2

    .line 436
    :cond_5
    nop

    .line 437
    nop

    .line 438
    iget v3, p0, Lcom/android/camera/ui/ObjectView;->mMovingMode:I

    and-int/2addr v1, v3

    if-eqz v1, :cond_6

    .line 439
    iget-object v1, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    iget-object v3, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    iget v3, v3, Landroid/graphics/RectF;->left:F

    add-float/2addr v3, v0

    iget-object v4, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->right:F

    sub-float/2addr v4, v2

    invoke-static {v3, v4}, Ljava/lang/Math;->min(FF)F

    move-result v3

    iput v3, v1, Landroid/graphics/RectF;->left:F

    .line 441
    :cond_6
    iget v1, p0, Lcom/android/camera/ui/ObjectView;->mMovingMode:I

    and-int/lit8 v1, v1, 0x2

    if-eqz v1, :cond_7

    .line 442
    iget-object v1, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    iget-object v3, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    iget v3, v3, Landroid/graphics/RectF;->top:F

    add-float/2addr v3, p1

    iget-object v4, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->bottom:F

    sub-float/2addr v4, v2

    invoke-static {v3, v4}, Ljava/lang/Math;->min(FF)F

    move-result v3

    iput v3, v1, Landroid/graphics/RectF;->top:F

    .line 444
    :cond_7
    iget v1, p0, Lcom/android/camera/ui/ObjectView;->mMovingMode:I

    and-int/lit8 v1, v1, 0x4

    if-eqz v1, :cond_8

    .line 445
    iget-object v1, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    iget-object v3, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    iget v3, v3, Landroid/graphics/RectF;->right:F

    add-float/2addr v3, v0

    iget-object v0, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->left:F

    add-float/2addr v0, v2

    invoke-static {v3, v0}, Ljava/lang/Math;->max(FF)F

    move-result v0

    iput v0, v1, Landroid/graphics/RectF;->right:F

    .line 447
    :cond_8
    iget v0, p0, Lcom/android/camera/ui/ObjectView;->mMovingMode:I

    and-int/lit8 v0, v0, 0x8

    if-eqz v0, :cond_9

    .line 448
    iget-object v0, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    iget-object v1, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->bottom:F

    add-float/2addr v1, p1

    iget-object p1, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    iget p1, p1, Landroid/graphics/RectF;->top:F

    add-float/2addr p1, v2

    invoke-static {v1, p1}, Ljava/lang/Math;->max(FF)F

    move-result p1

    iput p1, v0, Landroid/graphics/RectF;->bottom:F

    .line 450
    :cond_9
    iget-object p1, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    iget-object v0, p0, Lcom/android/camera/ui/ObjectView;->mDisplayBounds:Landroid/graphics/RectF;

    invoke-virtual {p1, v0}, Landroid/graphics/RectF;->intersect(Landroid/graphics/RectF;)Z

    .line 453
    :goto_2
    invoke-virtual {p0}, Lcom/android/camera/ui/ObjectView;->invalidate()V

    .line 454
    return-void
.end method

.method private resetView()V
    .locals 2

    .line 544
    invoke-virtual {p0}, Lcom/android/camera/ui/ObjectView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout$LayoutParams;

    .line 545
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lcom/android/camera/ui/ObjectView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 546
    invoke-virtual {p0}, Lcom/android/camera/ui/ObjectView;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/ViewPropertyAnimator;->cancel()V

    .line 547
    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {p0, v1}, Lcom/android/camera/ui/ObjectView;->setScaleX(F)V

    .line 548
    invoke-virtual {p0, v1}, Lcom/android/camera/ui/ObjectView;->setScaleY(F)V

    .line 549
    iget-object v1, p0, Lcom/android/camera/ui/ObjectView;->mDisplayBounds:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->width()F

    move-result v1

    float-to-int v1, v1

    iput v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->width:I

    .line 550
    iget-object v1, p0, Lcom/android/camera/ui/ObjectView;->mDisplayBounds:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->height()F

    move-result v1

    float-to-int v1, v1

    iput v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->height:I

    .line 551
    const/4 v1, 0x0

    invoke-virtual {v0, v1, v1, v1, v1}, Landroid/widget/RelativeLayout$LayoutParams;->setMargins(IIII)V

    .line 552
    iget-object v0, p0, Lcom/android/camera/ui/ObjectView;->mTrackStatusIndicator:[Landroid/graphics/drawable/Drawable;

    aget-object v0, v0, v1

    iput-object v0, p0, Lcom/android/camera/ui/ObjectView;->mTrackIndicator:Landroid/graphics/drawable/Drawable;

    .line 553
    return-void
.end method

.method private setMatrix()V
    .locals 4

    .line 571
    iget v0, p0, Lcom/android/camera/ui/ObjectView;->mPreviewWidth:I

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/android/camera/ui/ObjectView;->mPreviewHeight:I

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/ui/ObjectView;->mDisplayBounds:Landroid/graphics/RectF;

    .line 572
    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v0

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/ui/ObjectView;->mDisplayBounds:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->height()F

    move-result v0

    cmpl-float v0, v0, v1

    if-eqz v0, :cond_0

    .line 573
    iget-object v0, p0, Lcom/android/camera/ui/ObjectView;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0}, Landroid/graphics/Matrix;->reset()V

    .line 574
    iget-object v0, p0, Lcom/android/camera/ui/ObjectView;->mMatrix:Landroid/graphics/Matrix;

    iget v1, p0, Lcom/android/camera/ui/ObjectView;->mPreviewWidth:I

    int-to-float v1, v1

    iget-object v2, p0, Lcom/android/camera/ui/ObjectView;->mDisplayBounds:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->width()F

    move-result v2

    div-float/2addr v1, v2

    iget v2, p0, Lcom/android/camera/ui/ObjectView;->mPreviewHeight:I

    int-to-float v2, v2

    iget-object v3, p0, Lcom/android/camera/ui/ObjectView;->mDisplayBounds:Landroid/graphics/RectF;

    .line 575
    invoke-virtual {v3}, Landroid/graphics/RectF;->height()F

    move-result v3

    div-float/2addr v2, v3

    .line 574
    invoke-virtual {v0, v1, v2}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 579
    iget-object v0, p0, Lcom/android/camera/ui/ObjectView;->mFace2UIMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0}, Landroid/graphics/Matrix;->reset()V

    .line 580
    iget-object v0, p0, Lcom/android/camera/ui/ObjectView;->mMatrix:Landroid/graphics/Matrix;

    iget-object v1, p0, Lcom/android/camera/ui/ObjectView;->mFace2UIMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->invert(Landroid/graphics/Matrix;)Z

    .line 582
    :cond_0
    return-void
.end method

.method private updateAnimateView()V
    .locals 4

    .line 457
    nop

    .line 458
    invoke-virtual {p0}, Lcom/android/camera/ui/ObjectView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout$LayoutParams;

    .line 459
    iget-object v1, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->width()F

    move-result v1

    float-to-int v1, v1

    iput v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->width:I

    .line 460
    iget-object v1, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->height()F

    move-result v1

    float-to-int v1, v1

    iput v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->height:I

    .line 461
    iget-object v1, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->left:F

    float-to-int v1, v1

    iget-object v2, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->top:F

    float-to-int v2, v2

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3, v3}, Landroid/widget/RelativeLayout$LayoutParams;->setMargins(IIII)V

    .line 462
    invoke-virtual {p0}, Lcom/android/camera/ui/ObjectView;->requestLayout()V

    .line 463
    return-void
.end method


# virtual methods
.method public clear()V
    .locals 2

    .line 494
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera/ui/ObjectView;->mFace:Lcom/android/camera2/CameraHardwareFace;

    .line 495
    iget-object v0, p0, Lcom/android/camera/ui/ObjectView;->mOldObjectRect:Landroid/graphics/RectF;

    iget-object v1, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    invoke-virtual {v0, v1}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 496
    iget-object v0, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    const/4 v1, 0x0

    invoke-virtual {v0, v1, v1, v1, v1}, Landroid/graphics/RectF;->set(FFFF)V

    .line 497
    invoke-direct {p0}, Lcom/android/camera/ui/ObjectView;->resetView()V

    .line 498
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera/ui/ObjectView;->mZoomAnimState:I

    .line 499
    invoke-virtual {p0}, Lcom/android/camera/ui/ObjectView;->invalidate()V

    .line 500
    return-void
.end method

.method public faceExists()Z
    .locals 1

    .line 267
    iget-object v0, p0, Lcom/android/camera/ui/ObjectView;->mFace:Lcom/android/camera2/CameraHardwareFace;

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/android/camera/ui/ObjectView;->isAdjusting()Z

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
    return v0
.end method

.method public getFocusRect()Landroid/graphics/RectF;
    .locals 2

    .line 206
    invoke-virtual {p0}, Lcom/android/camera/ui/ObjectView;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/android/camera/ActivityBase;

    invoke-virtual {v0}, Lcom/android/camera/ActivityBase;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v0

    .line 207
    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/android/camera/ui/ObjectView;->mPause:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v0

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-lez v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->height()F

    move-result v0

    cmpl-float v0, v0, v1

    if-lez v0, :cond_0

    .line 208
    iget-object v0, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    return-object v0

    .line 210
    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public getFocusRectInPreviewFrame()Landroid/graphics/RectF;
    .locals 2

    .line 258
    invoke-virtual {p0}, Lcom/android/camera/ui/ObjectView;->getFocusRect()Landroid/graphics/RectF;

    move-result-object v0

    .line 259
    if-eqz v0, :cond_0

    .line 260
    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Lcom/android/camera/ui/ObjectView;->mapRect(Landroid/graphics/RectF;Z)Landroid/graphics/RectF;

    move-result-object v0

    return-object v0

    .line 262
    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public initializeTrackView(Landroid/graphics/RectF;Z)Z
    .locals 3

    .line 276
    const/4 v0, 0x0

    if-eqz p1, :cond_2

    .line 277
    const-string v1, "counter"

    const-string v2, "t2t_times"

    invoke-static {v1, v2}, Lcom/android/camera/statistic/CameraStat;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    .line 278
    iget-object v1, p0, Lcom/android/camera/ui/ObjectView;->mDisplayBounds:Landroid/graphics/RectF;

    invoke-virtual {p1, v1}, Landroid/graphics/RectF;->intersect(Landroid/graphics/RectF;)Z

    .line 279
    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    move-result v1

    const/high16 v2, 0x43480000    # 200.0f

    cmpg-float v1, v1, v2

    if-ltz v1, :cond_1

    invoke-virtual {p1}, Landroid/graphics/RectF;->height()F

    move-result v1

    cmpg-float v1, v1, v2

    if-gez v1, :cond_0

    goto :goto_0

    .line 282
    :cond_0
    iget-object v1, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    invoke-virtual {v1, p1}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 283
    iget-object v1, p0, Lcom/android/camera/ui/ObjectView;->mOldObjectRect:Landroid/graphics/RectF;

    invoke-virtual {v1, p1}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    goto :goto_1

    .line 280
    :cond_1
    :goto_0
    return v0

    .line 285
    :cond_2
    iget-object p1, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    iget-object v1, p0, Lcom/android/camera/ui/ObjectView;->mOldObjectRect:Landroid/graphics/RectF;

    invoke-virtual {p1, v1}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 287
    :goto_1
    invoke-virtual {p0, v0}, Lcom/android/camera/ui/ObjectView;->setVisibility(I)V

    .line 288
    invoke-virtual {p0}, Lcom/android/camera/ui/ObjectView;->resume()V

    .line 289
    invoke-virtual {p0}, Lcom/android/camera/ui/ObjectView;->requestLayout()V

    .line 290
    const/4 p1, 0x1

    if-eqz p2, :cond_3

    .line 291
    iget-object p2, p0, Lcom/android/camera/ui/ObjectView;->mHandler:Landroid/os/Handler;

    invoke-virtual {p2, p1}, Landroid/os/Handler;->removeMessages(I)V

    .line 292
    iget-object p2, p0, Lcom/android/camera/ui/ObjectView;->mHandler:Landroid/os/Handler;

    const-wide/16 v0, 0x0

    invoke-virtual {p2, p1, v0, v1}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 294
    :cond_3
    return p1
.end method

.method public isAdjusting()Z
    .locals 2

    .line 201
    iget v0, p0, Lcom/android/camera/ui/ObjectView;->mMovingMode:I

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v0

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-lez v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->height()F

    move-result v0

    cmpl-float v0, v0, v1

    if-lez v0, :cond_0

    iget v0, p0, Lcom/android/camera/ui/ObjectView;->mZoomAnimState:I

    if-nez v0, :cond_0

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

.method public isTrackFailed()Z
    .locals 2

    .line 556
    iget-object v0, p0, Lcom/android/camera/ui/ObjectView;->mFace:Lcom/android/camera2/CameraHardwareFace;

    const/4 v1, 0x1

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/ui/ObjectView;->mFace:Lcom/android/camera2/CameraHardwareFace;

    iget v0, v0, Lcom/android/camera2/CameraHardwareFace;->score:I

    if-le v1, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    nop

    :cond_1
    :goto_0
    return v1
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 7

    .line 504
    sget-boolean v0, Lcom/android/camera/Util;->sIsDumpLog:Z

    if-eqz v0, :cond_0

    .line 505
    const-string v0, "ObjectView"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onDraw(), mZoomAnimState:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/android/camera/ui/ObjectView;->mZoomAnimState:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", mPause="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v2, p0, Lcom/android/camera/ui/ObjectView;->mPause:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v2, " mObjectRect="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, " mFace="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/android/camera/ui/ObjectView;->mFace:Lcom/android/camera2/CameraHardwareFace;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, ", mTrackIndicator="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/android/camera/ui/ObjectView;->mTrackIndicator:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, ", getWidth="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 508
    invoke-virtual {p0}, Lcom/android/camera/ui/ObjectView;->getWidth()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", getheight="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/android/camera/ui/ObjectView;->getHeight()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", mDisplayBounds="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/android/camera/ui/ObjectView;->mDisplayBounds:Landroid/graphics/RectF;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 505
    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 510
    :cond_0
    iget-boolean v0, p0, Lcom/android/camera/ui/ObjectView;->mPause:Z

    if-nez v0, :cond_2

    iget v0, p0, Lcom/android/camera/ui/ObjectView;->mZoomAnimState:I

    if-eqz v0, :cond_1

    iget v0, p0, Lcom/android/camera/ui/ObjectView;->mZoomAnimState:I

    const/4 v1, 0x5

    if-ne v0, v1, :cond_2

    iget-object v0, p0, Lcom/android/camera/ui/ObjectView;->mFace:Lcom/android/camera2/CameraHardwareFace;

    if-eqz v0, :cond_2

    .line 513
    :cond_1
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 515
    iget-object v0, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->centerX()F

    move-result v0

    iget-object v1, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->centerY()F

    move-result v1

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->translate(FF)V

    .line 517
    iget-object v0, p0, Lcom/android/camera/ui/ObjectView;->mTrackIndicator:Landroid/graphics/drawable/Drawable;

    iget-object v1, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->right:F

    iget-object v2, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->left:F

    sub-float/2addr v1, v2

    neg-float v1, v1

    const/high16 v2, 0x40000000    # 2.0f

    div-float/2addr v1, v2

    .line 518
    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    iget-object v3, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    iget v3, v3, Landroid/graphics/RectF;->bottom:F

    iget-object v4, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->top:F

    sub-float/2addr v3, v4

    neg-float v3, v3

    div-float/2addr v3, v2

    .line 519
    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v3

    iget-object v4, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->right:F

    iget-object v5, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    iget v5, v5, Landroid/graphics/RectF;->left:F

    sub-float/2addr v4, v5

    div-float/2addr v4, v2

    .line 520
    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    move-result v4

    iget-object v5, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    iget v5, v5, Landroid/graphics/RectF;->bottom:F

    iget-object v6, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    iget v6, v6, Landroid/graphics/RectF;->top:F

    sub-float/2addr v5, v6

    div-float/2addr v5, v2

    .line 521
    invoke-static {v5}, Ljava/lang/Math;->round(F)I

    move-result v2

    .line 517
    invoke-virtual {v0, v1, v3, v4, v2}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 522
    iget-object v0, p0, Lcom/android/camera/ui/ObjectView;->mTrackIndicator:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 523
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    goto :goto_0

    .line 525
    :cond_2
    invoke-super {p0, p1}, Lcom/android/camera/ui/FrameView;->onDraw(Landroid/graphics/Canvas;)V

    .line 527
    :goto_0
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 9

    .line 306
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    .line 307
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v1

    .line 308
    iget-boolean v2, p0, Lcom/android/camera/ui/ObjectView;->mPause:Z

    const/4 v3, 0x0

    if-nez v2, :cond_a

    iget v2, p0, Lcom/android/camera/ui/ObjectView;->mMovingMode:I

    if-nez v2, :cond_0

    invoke-direct {p0, v0, v1}, Lcom/android/camera/ui/ObjectView;->isInObjectViewArea(FF)Z

    move-result v2

    if-eqz v2, :cond_a

    :cond_0
    iget v2, p0, Lcom/android/camera/ui/ObjectView;->mLostTrackingNum:I

    if-eqz v2, :cond_1

    goto/16 :goto_1

    .line 311
    :cond_1
    invoke-virtual {p0}, Lcom/android/camera/ui/ObjectView;->isEnabled()Z

    move-result v2

    const/4 v4, 0x1

    if-eqz v2, :cond_9

    .line 312
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v2

    const/4 v5, 0x4

    const/16 v6, 0x20

    const/high16 v7, -0x40800000    # -1.0f

    const/4 v8, 0x2

    packed-switch v2, :pswitch_data_0

    :pswitch_0
    goto/16 :goto_0

    .line 348
    :pswitch_1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result v0

    if-ge v0, v8, :cond_9

    iget v0, p0, Lcom/android/camera/ui/ObjectView;->mMovingMode:I

    if-ne v0, v6, :cond_9

    .line 349
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result v0

    rsub-int/lit8 v0, v0, 0x1

    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getX(I)F

    move-result v0

    iput v0, p0, Lcom/android/camera/ui/ObjectView;->mLastX:F

    .line 350
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result v0

    rsub-int/lit8 v0, v0, 0x1

    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getY(I)F

    move-result p1

    iput p1, p0, Lcom/android/camera/ui/ObjectView;->mLastY:F

    .line 351
    iget p1, p0, Lcom/android/camera/ui/ObjectView;->mLastX:F

    iget v0, p0, Lcom/android/camera/ui/ObjectView;->mLastY:F

    invoke-direct {p0, p1, v0, v7, v7}, Lcom/android/camera/ui/ObjectView;->detectMovingStyle(FFFF)V

    goto/16 :goto_0

    .line 332
    :pswitch_2
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v0

    if-ne v0, v8, :cond_9

    .line 333
    invoke-virtual {p1, v3}, Landroid/view/MotionEvent;->getX(I)F

    move-result v0

    invoke-virtual {p1, v3}, Landroid/view/MotionEvent;->getY(I)F

    move-result v1

    invoke-virtual {p1, v4}, Landroid/view/MotionEvent;->getX(I)F

    move-result v2

    invoke-virtual {p1, v4}, Landroid/view/MotionEvent;->getY(I)F

    move-result v7

    invoke-direct {p0, v0, v1, v2, v7}, Lcom/android/camera/ui/ObjectView;->detectMovingStyle(FFFF)V

    .line 335
    iget v0, p0, Lcom/android/camera/ui/ObjectView;->mMovingMode:I

    if-ne v0, v6, :cond_9

    iget-object v0, p0, Lcom/android/camera/ui/ObjectView;->mListener:Lcom/android/camera/ui/ObjectView$ObjectViewListener;

    if-eqz v0, :cond_9

    .line 336
    iget v0, p0, Lcom/android/camera/ui/ObjectView;->mZoomAnimState:I

    if-eq v0, v5, :cond_2

    iget v0, p0, Lcom/android/camera/ui/ObjectView;->mZoomAnimState:I

    if-ne v0, v8, :cond_3

    .line 338
    :cond_2
    invoke-virtual {p0}, Lcom/android/camera/ui/ObjectView;->clearAnimation()V

    .line 340
    :cond_3
    iput v3, p0, Lcom/android/camera/ui/ObjectView;->mZoomAnimState:I

    .line 341
    iget-object v0, p0, Lcom/android/camera/ui/ObjectView;->mListener:Lcom/android/camera/ui/ObjectView$ObjectViewListener;

    invoke-interface {v0, v3}, Lcom/android/camera/ui/ObjectView$ObjectViewListener;->stopObjectTracking(Z)V

    .line 342
    invoke-direct {p0, p1}, Lcom/android/camera/ui/ObjectView;->moveObjectView(Landroid/view/MotionEvent;)V

    goto :goto_0

    .line 356
    :pswitch_3
    iget v2, p0, Lcom/android/camera/ui/ObjectView;->mMovingMode:I

    if-eqz v2, :cond_4

    .line 357
    invoke-direct {p0, p1}, Lcom/android/camera/ui/ObjectView;->moveObjectView(Landroid/view/MotionEvent;)V

    .line 359
    :cond_4
    iput v0, p0, Lcom/android/camera/ui/ObjectView;->mLastX:F

    .line 360
    iput v1, p0, Lcom/android/camera/ui/ObjectView;->mLastY:F

    .line 361
    goto :goto_0

    .line 365
    :pswitch_4
    iput v3, p0, Lcom/android/camera/ui/ObjectView;->mMovingMode:I

    .line 366
    invoke-virtual {p0}, Lcom/android/camera/ui/ObjectView;->invalidate()V

    .line 367
    iget-object p1, p0, Lcom/android/camera/ui/ObjectView;->mHandler:Landroid/os/Handler;

    const-wide/16 v0, 0x0

    invoke-virtual {p1, v4, v0, v1}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    goto :goto_0

    .line 314
    :pswitch_5
    iget-object p1, p0, Lcom/android/camera/ui/ObjectView;->mHandler:Landroid/os/Handler;

    invoke-virtual {p1, v4}, Landroid/os/Handler;->hasMessages(I)Z

    move-result p1

    if-nez p1, :cond_8

    .line 315
    iget-object p1, p0, Lcom/android/camera/ui/ObjectView;->mListener:Lcom/android/camera/ui/ObjectView$ObjectViewListener;

    if-eqz p1, :cond_7

    .line 316
    iget p1, p0, Lcom/android/camera/ui/ObjectView;->mZoomAnimState:I

    if-eq p1, v5, :cond_5

    iget p1, p0, Lcom/android/camera/ui/ObjectView;->mZoomAnimState:I

    if-ne p1, v8, :cond_6

    .line 318
    :cond_5
    invoke-virtual {p0}, Lcom/android/camera/ui/ObjectView;->clearAnimation()V

    .line 320
    :cond_6
    iput v3, p0, Lcom/android/camera/ui/ObjectView;->mZoomAnimState:I

    .line 321
    iget-object p1, p0, Lcom/android/camera/ui/ObjectView;->mListener:Lcom/android/camera/ui/ObjectView$ObjectViewListener;

    invoke-interface {p1, v3}, Lcom/android/camera/ui/ObjectView$ObjectViewListener;->stopObjectTracking(Z)V

    .line 323
    :cond_7
    const/4 p1, 0x0

    invoke-virtual {p0, p1, v3}, Lcom/android/camera/ui/ObjectView;->initializeTrackView(Landroid/graphics/RectF;Z)Z

    .line 325
    :cond_8
    iget-object p1, p0, Lcom/android/camera/ui/ObjectView;->mHandler:Landroid/os/Handler;

    invoke-virtual {p1, v4}, Landroid/os/Handler;->removeMessages(I)V

    .line 326
    invoke-direct {p0, v0, v1, v7, v7}, Lcom/android/camera/ui/ObjectView;->detectMovingStyle(FFFF)V

    .line 327
    iput v0, p0, Lcom/android/camera/ui/ObjectView;->mLastX:F

    .line 328
    iput v1, p0, Lcom/android/camera/ui/ObjectView;->mLastY:F

    .line 329
    nop

    .line 371
    :cond_9
    :goto_0
    return v4

    .line 309
    :cond_a
    :goto_1
    return v3

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_4
        :pswitch_0
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method public setDisplaySize(II)V
    .locals 2

    .line 560
    iget-object v0, p0, Lcom/android/camera/ui/ObjectView;->mDisplayBounds:Landroid/graphics/RectF;

    int-to-float p1, p1

    int-to-float p2, p2

    const/4 v1, 0x0

    invoke-virtual {v0, v1, v1, p1, p2}, Landroid/graphics/RectF;->set(FFFF)V

    .line 561
    invoke-direct {p0}, Lcom/android/camera/ui/ObjectView;->setMatrix()V

    .line 562
    return-void
.end method

.method public setObject(Lcom/android/camera2/CameraHardwareFace;)V
    .locals 8

    .line 137
    sget-boolean v0, Lcom/android/camera/Util;->sIsDumpLog:Z

    if-eqz v0, :cond_0

    .line 138
    const-string v0, "ObjectView"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setObject(), mZoomAnimState:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/android/camera/ui/ObjectView;->mZoomAnimState:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " , face.rect:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p1, Lcom/android/camera2/CameraHardwareFace;->rect:Landroid/graphics/Rect;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, " , face.score:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p1, Lcom/android/camera2/CameraHardwareFace;->score:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " , face.t2tStop:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p1, Lcom/android/camera2/CameraHardwareFace;->t2tStop:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " , moving="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/android/camera/ui/ObjectView;->mFilter:Lcom/android/camera/ui/ObjectView$Filter;

    iget v2, v2, Lcom/android/camera/ui/ObjectView$Filter;->mCurrentValue:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " , mPause="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v2, p0, Lcom/android/camera/ui/ObjectView;->mPause:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v2, " , visible="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 141
    invoke-virtual {p0}, Lcom/android/camera/ui/ObjectView;->getVisibility()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " , getWidth()="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 142
    invoke-virtual {p0}, Lcom/android/camera/ui/ObjectView;->getWidth()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " ,mDisplayBounds.width()="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/android/camera/ui/ObjectView;->mDisplayBounds:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->width()F

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v2, " , getHeight()="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 143
    invoke-virtual {p0}, Lcom/android/camera/ui/ObjectView;->getHeight()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " ,mDisplayBounds.height()="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/android/camera/ui/ObjectView;->mDisplayBounds:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->height()F

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 138
    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 145
    :cond_0
    iget v0, p0, Lcom/android/camera/ui/ObjectView;->mZoomAnimState:I

    const/4 v1, 0x2

    if-gt v0, v1, :cond_1

    .line 146
    return-void

    .line 148
    :cond_1
    iget v0, p0, Lcom/android/camera/ui/ObjectView;->mZoomAnimState:I

    const/4 v2, 0x3

    const/4 v3, 0x1

    if-ne v0, v2, :cond_2

    .line 149
    iget p1, p1, Lcom/android/camera2/CameraHardwareFace;->score:I

    if-lt p1, v3, :cond_10

    .line 150
    iget-object p1, p0, Lcom/android/camera/ui/ObjectView;->mHandler:Landroid/os/Handler;

    invoke-virtual {p1, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 151
    invoke-virtual {p0}, Lcom/android/camera/ui/ObjectView;->showSuccess()V

    goto/16 :goto_7

    .line 153
    :cond_2
    iget v0, p0, Lcom/android/camera/ui/ObjectView;->mZoomAnimState:I

    const/4 v1, 0x5

    if-ne v0, v1, :cond_10

    iget-boolean v0, p0, Lcom/android/camera/ui/ObjectView;->mPause:Z

    if-nez v0, :cond_10

    .line 154
    iget v0, p1, Lcom/android/camera2/CameraHardwareFace;->score:I

    const/4 v2, 0x0

    if-ge v0, v3, :cond_8

    .line 155
    iget v0, p0, Lcom/android/camera/ui/ObjectView;->mLostTrackThreshold:I

    if-nez v0, :cond_5

    .line 156
    iget-object v0, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->left:F

    iget-object v4, p0, Lcom/android/camera/ui/ObjectView;->mDisplayBounds:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->left:F

    sub-float/2addr v0, v4

    sget v4, Lcom/android/camera/ui/ObjectView;->NEAR_EDGE:I

    int-to-float v4, v4

    cmpg-float v0, v0, v4

    if-ltz v0, :cond_4

    iget-object v0, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->top:F

    iget-object v4, p0, Lcom/android/camera/ui/ObjectView;->mDisplayBounds:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->top:F

    sub-float/2addr v0, v4

    sget v4, Lcom/android/camera/ui/ObjectView;->NEAR_EDGE:I

    int-to-float v4, v4

    cmpg-float v0, v0, v4

    if-ltz v0, :cond_4

    iget-object v0, p0, Lcom/android/camera/ui/ObjectView;->mDisplayBounds:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->right:F

    iget-object v4, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->right:F

    sub-float/2addr v0, v4

    sget v4, Lcom/android/camera/ui/ObjectView;->NEAR_EDGE:I

    int-to-float v4, v4

    cmpg-float v0, v0, v4

    if-ltz v0, :cond_4

    iget-object v0, p0, Lcom/android/camera/ui/ObjectView;->mDisplayBounds:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->bottom:F

    iget-object v4, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->bottom:F

    sub-float/2addr v0, v4

    sget v4, Lcom/android/camera/ui/ObjectView;->NEAR_EDGE:I

    int-to-float v4, v4

    cmpg-float v0, v0, v4

    if-gez v0, :cond_3

    goto :goto_0

    .line 162
    :cond_3
    const/16 v0, 0x32

    iput v0, p0, Lcom/android/camera/ui/ObjectView;->mLostTrackThreshold:I

    goto :goto_1

    .line 160
    :cond_4
    :goto_0
    const/16 v0, 0x96

    iput v0, p0, Lcom/android/camera/ui/ObjectView;->mLostTrackThreshold:I

    .line 165
    :cond_5
    :goto_1
    iget v0, p0, Lcom/android/camera/ui/ObjectView;->mLostTrackingNum:I

    add-int/2addr v0, v3

    iput v0, p0, Lcom/android/camera/ui/ObjectView;->mLostTrackingNum:I

    .line 166
    iget v0, p0, Lcom/android/camera/ui/ObjectView;->mLostTrackingNum:I

    rem-int/2addr v0, v1

    if-eqz v0, :cond_6

    iget v0, p0, Lcom/android/camera/ui/ObjectView;->mLostTrackingNum:I

    iget v1, p0, Lcom/android/camera/ui/ObjectView;->mLostTrackThreshold:I

    if-ne v0, v1, :cond_7

    .line 167
    :cond_6
    const-string v0, "ObjectView"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "lost "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v4, p0, Lcom/android/camera/ui/ObjectView;->mLostTrackingNum:I

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, " times"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 169
    :cond_7
    iget v0, p0, Lcom/android/camera/ui/ObjectView;->mLostTrackThreshold:I

    iget v1, p0, Lcom/android/camera/ui/ObjectView;->mLostTrackingNum:I

    if-gt v0, v1, :cond_9

    .line 170
    iget-object v0, p0, Lcom/android/camera/ui/ObjectView;->mListener:Lcom/android/camera/ui/ObjectView$ObjectViewListener;

    invoke-interface {v0, v3}, Lcom/android/camera/ui/ObjectView$ObjectViewListener;->stopObjectTracking(Z)V

    goto :goto_2

    .line 173
    :cond_8
    iput v2, p0, Lcom/android/camera/ui/ObjectView;->mLostTrackThreshold:I

    .line 174
    iput v2, p0, Lcom/android/camera/ui/ObjectView;->mLostTrackingNum:I

    .line 178
    :cond_9
    :goto_2
    iget-object v0, p1, Lcom/android/camera2/CameraHardwareFace;->rect:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v0

    int-to-double v0, v0

    iget v4, p0, Lcom/android/camera/ui/ObjectView;->mPreviewWidth:I

    int-to-double v4, v4

    div-double/2addr v0, v4

    const-wide v4, 0x3fd51eb851eb851fL    # 0.33

    cmpl-double v0, v0, v4

    if-gtz v0, :cond_b

    iget-object v0, p1, Lcom/android/camera2/CameraHardwareFace;->rect:Landroid/graphics/Rect;

    .line 179
    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v0

    int-to-double v0, v0

    iget v6, p0, Lcom/android/camera/ui/ObjectView;->mPreviewHeight:I

    int-to-double v6, v6

    div-double/2addr v0, v6

    cmpl-double v0, v0, v4

    if-lez v0, :cond_a

    goto :goto_3

    :cond_a
    move v0, v2

    goto :goto_4

    :cond_b
    :goto_3
    move v0, v3

    :goto_4
    iput-boolean v0, p0, Lcom/android/camera/ui/ObjectView;->mIsBigEnoughRect:Z

    .line 181
    invoke-virtual {p0}, Lcom/android/camera/ui/ObjectView;->getWidth()I

    move-result v0

    int-to-float v0, v0

    iget-object v1, p0, Lcom/android/camera/ui/ObjectView;->mDisplayBounds:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->width()F

    move-result v1

    cmpl-float v0, v0, v1

    if-nez v0, :cond_e

    invoke-virtual {p0}, Lcom/android/camera/ui/ObjectView;->getHeight()I

    move-result v0

    int-to-float v0, v0

    iget-object v1, p0, Lcom/android/camera/ui/ObjectView;->mDisplayBounds:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->height()F

    move-result v1

    cmpl-float v0, v0, v1

    if-eqz v0, :cond_c

    goto :goto_5

    .line 183
    :cond_c
    if-eqz p1, :cond_d

    iget v0, p1, Lcom/android/camera2/CameraHardwareFace;->score:I

    if-lt v0, v3, :cond_d

    .line 184
    iput-object p1, p0, Lcom/android/camera/ui/ObjectView;->mFace:Lcom/android/camera2/CameraHardwareFace;

    .line 185
    iget-object v0, p0, Lcom/android/camera/ui/ObjectView;->mTrackStatusIndicator:[Landroid/graphics/drawable/Drawable;

    aget-object v0, v0, v3

    iput-object v0, p0, Lcom/android/camera/ui/ObjectView;->mTrackIndicator:Landroid/graphics/drawable/Drawable;

    .line 186
    iget-object v0, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    new-instance v1, Landroid/graphics/RectF;

    iget-object v3, p0, Lcom/android/camera/ui/ObjectView;->mFace:Lcom/android/camera2/CameraHardwareFace;

    iget-object v3, v3, Lcom/android/camera2/CameraHardwareFace;->rect:Landroid/graphics/Rect;

    invoke-direct {v1, v3}, Landroid/graphics/RectF;-><init>(Landroid/graphics/Rect;)V

    invoke-direct {p0, v1, v2}, Lcom/android/camera/ui/ObjectView;->mapRect(Landroid/graphics/RectF;Z)Landroid/graphics/RectF;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 187
    iget-object v0, p0, Lcom/android/camera/ui/ObjectView;->mOldObjectRect:Landroid/graphics/RectF;

    iget-object v1, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    invoke-virtual {v0, v1}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 190
    iget-object v0, p0, Lcom/android/camera/ui/ObjectView;->mFilter:Lcom/android/camera/ui/ObjectView$Filter;

    iget p1, p1, Lcom/android/camera2/CameraHardwareFace;->t2tStop:I

    invoke-virtual {v0, p1}, Lcom/android/camera/ui/ObjectView$Filter;->isBecomeStable(I)Z

    move-result p1

    if-eqz p1, :cond_f

    .line 191
    iget-object p1, p0, Lcom/android/camera/ui/ObjectView;->mListener:Lcom/android/camera/ui/ObjectView$ObjectViewListener;

    invoke-interface {p1}, Lcom/android/camera/ui/ObjectView$ObjectViewListener;->onObjectStable()V

    goto :goto_6

    .line 194
    :cond_d
    const/4 p1, 0x0

    iput-object p1, p0, Lcom/android/camera/ui/ObjectView;->mFace:Lcom/android/camera2/CameraHardwareFace;

    goto :goto_6

    .line 182
    :cond_e
    :goto_5
    invoke-direct {p0}, Lcom/android/camera/ui/ObjectView;->resetView()V

    .line 196
    :cond_f
    :goto_6
    invoke-virtual {p0}, Lcom/android/camera/ui/ObjectView;->invalidate()V

    .line 198
    :cond_10
    :goto_7
    return-void
.end method

.method public setObjectViewListener(Lcom/android/camera/ui/ObjectView$ObjectViewListener;)V
    .locals 0

    .line 271
    iput-object p1, p0, Lcom/android/camera/ui/ObjectView;->mListener:Lcom/android/camera/ui/ObjectView$ObjectViewListener;

    .line 272
    return-void
.end method

.method public setPreviewSize(II)V
    .locals 0

    .line 565
    iput p1, p0, Lcom/android/camera/ui/ObjectView;->mPreviewWidth:I

    .line 566
    iput p2, p0, Lcom/android/camera/ui/ObjectView;->mPreviewHeight:I

    .line 567
    invoke-direct {p0}, Lcom/android/camera/ui/ObjectView;->setMatrix()V

    .line 568
    return-void
.end method

.method public showFail()V
    .locals 0

    .line 490
    return-void
.end method

.method public showStart()V
    .locals 3

    .line 467
    const-string v0, "ObjectView"

    const-string v1, "showStart()"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 468
    iget v0, p0, Lcom/android/camera/ui/ObjectView;->mZoomAnimState:I

    if-eqz v0, :cond_0

    return-void

    .line 469
    :cond_0
    const/4 v0, 0x1

    iput v0, p0, Lcom/android/camera/ui/ObjectView;->mZoomAnimState:I

    .line 470
    iget-object v0, p0, Lcom/android/camera/ui/ObjectView;->mTrackStatusIndicator:[Landroid/graphics/drawable/Drawable;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    iput-object v0, p0, Lcom/android/camera/ui/ObjectView;->mTrackIndicator:Landroid/graphics/drawable/Drawable;

    .line 471
    invoke-direct {p0}, Lcom/android/camera/ui/ObjectView;->updateAnimateView()V

    .line 472
    iget-object v0, p0, Lcom/android/camera/ui/ObjectView;->mTrackIndicator:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, v0}, Lcom/android/camera/ui/ObjectView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 473
    invoke-virtual {p0}, Lcom/android/camera/ui/ObjectView;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->withLayer()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const-wide/16 v1, 0x96

    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const v1, 0x3f99999a    # 1.2f

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->scaleX(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    .line 474
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    iget-object v1, p0, Lcom/android/camera/ui/ObjectView;->mStartAction:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;

    .line 475
    return-void
.end method

.method public showSuccess()V
    .locals 3

    .line 479
    const-string v0, "ObjectView"

    const-string v1, "showSuccess()"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 480
    iget v0, p0, Lcom/android/camera/ui/ObjectView;->mZoomAnimState:I

    const/4 v1, 0x3

    if-eq v0, v1, :cond_0

    return-void

    .line 481
    :cond_0
    const/4 v0, 0x4

    iput v0, p0, Lcom/android/camera/ui/ObjectView;->mZoomAnimState:I

    .line 482
    iget-object v0, p0, Lcom/android/camera/ui/ObjectView;->mTrackStatusIndicator:[Landroid/graphics/drawable/Drawable;

    const/4 v1, 0x1

    aget-object v0, v0, v1

    iput-object v0, p0, Lcom/android/camera/ui/ObjectView;->mTrackIndicator:Landroid/graphics/drawable/Drawable;

    .line 483
    invoke-direct {p0}, Lcom/android/camera/ui/ObjectView;->updateAnimateView()V

    .line 484
    iget-object v0, p0, Lcom/android/camera/ui/ObjectView;->mTrackIndicator:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, v0}, Lcom/android/camera/ui/ObjectView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 485
    invoke-virtual {p0}, Lcom/android/camera/ui/ObjectView;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->withLayer()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const-wide/16 v1, 0x50

    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const v1, 0x3f333333    # 0.7f

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->scaleX(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    .line 486
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    iget-object v1, p0, Lcom/android/camera/ui/ObjectView;->mEndAction:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;

    .line 487
    return-void
.end method
