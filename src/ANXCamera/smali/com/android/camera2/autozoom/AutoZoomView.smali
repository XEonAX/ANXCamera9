.class public Lcom/android/camera2/autozoom/AutoZoomView;
.super Landroid/view/View;
.source "AutoZoomView.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;
.implements Lcom/android/camera2/autozoom/IObjectView;


# static fields
.field public static final TOLERATE_Y:F = 10.0f


# instance fields
.field private mAutoZoomActiveObjects:[I

.field private mAutoZoomBound:Landroid/graphics/RectF;

.field private mAutoZoomPausedObjects:[I

.field private mAutoZoomStatus:I

.field private mBeginLost:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private mBoundWidth:F

.field private mEndLost:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private mPathPaint:Landroid/graphics/Paint;

.field private mPreviewSize:Landroid/util/Size;

.field private mRectPaint:Landroid/graphics/Paint;

.field private mTolerateY:I

.field mTrackers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/camera2/autozoom/AutoZoomTracker;",
            ">;"
        }
    .end annotation
.end field

.field private mViewActive:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private mViewEnabled:Ljava/util/concurrent/atomic/AtomicBoolean;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 48
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/android/camera2/autozoom/AutoZoomView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 49
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .line 52
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/android/camera2/autozoom/AutoZoomView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 53
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .line 56
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/android/camera2/autozoom/AutoZoomView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 57
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .line 60
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 36
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/android/camera2/autozoom/AutoZoomView;->mTrackers:Ljava/util/List;

    .line 41
    const/high16 p1, 0x3f800000    # 1.0f

    iput p1, p0, Lcom/android/camera2/autozoom/AutoZoomView;->mBoundWidth:F

    .line 61
    invoke-direct {p0}, Lcom/android/camera2/autozoom/AutoZoomView;->init()V

    .line 62
    return-void
.end method

.method static synthetic access$002(Lcom/android/camera2/autozoom/AutoZoomView;I)I
    .locals 0

    .line 24
    iput p1, p0, Lcom/android/camera2/autozoom/AutoZoomView;->mAutoZoomStatus:I

    return p1
.end method

.method static synthetic access$102(Lcom/android/camera2/autozoom/AutoZoomView;Landroid/graphics/RectF;)Landroid/graphics/RectF;
    .locals 0

    .line 24
    iput-object p1, p0, Lcom/android/camera2/autozoom/AutoZoomView;->mAutoZoomBound:Landroid/graphics/RectF;

    return-object p1
.end method

.method static synthetic access$202(Lcom/android/camera2/autozoom/AutoZoomView;[I)[I
    .locals 0

    .line 24
    iput-object p1, p0, Lcom/android/camera2/autozoom/AutoZoomView;->mAutoZoomPausedObjects:[I

    return-object p1
.end method

.method static synthetic access$302(Lcom/android/camera2/autozoom/AutoZoomView;[I)[I
    .locals 0

    .line 24
    iput-object p1, p0, Lcom/android/camera2/autozoom/AutoZoomView;->mAutoZoomActiveObjects:[I

    return-object p1
.end method

.method private fillBoundsInOverlay(I[F)Landroid/graphics/RectF;
    .locals 5

    .line 279
    iget-object v0, p0, Lcom/android/camera2/autozoom/AutoZoomView;->mPreviewSize:Landroid/util/Size;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 280
    return-object v1

    .line 283
    :cond_0
    if-nez p2, :cond_1

    .line 284
    return-object v1

    .line 287
    :cond_1
    array-length v0, p2

    mul-int/lit8 p1, p1, 0x4

    add-int/lit8 v2, p1, 0x3

    if-gt v0, v2, :cond_2

    .line 288
    return-object v1

    .line 290
    :cond_2
    aget v0, p2, p1

    .line 291
    add-int/lit8 v1, p1, 0x1

    aget v1, p2, v1

    .line 292
    add-int/lit8 p1, p1, 0x2

    aget p1, p2, p1

    .line 293
    aget p2, p2, v2

    .line 295
    new-instance v2, Landroid/graphics/RectF;

    iget-object v3, p0, Lcom/android/camera2/autozoom/AutoZoomView;->mPreviewSize:Landroid/util/Size;

    invoke-virtual {v3}, Landroid/util/Size;->getWidth()I

    move-result v3

    int-to-float v3, v3

    div-float v3, v0, v3

    iget-object v4, p0, Lcom/android/camera2/autozoom/AutoZoomView;->mPreviewSize:Landroid/util/Size;

    .line 296
    invoke-virtual {v4}, Landroid/util/Size;->getHeight()I

    move-result v4

    int-to-float v4, v4

    div-float v4, v1, v4

    add-float/2addr v0, p1

    iget-object p1, p0, Lcom/android/camera2/autozoom/AutoZoomView;->mPreviewSize:Landroid/util/Size;

    .line 297
    invoke-virtual {p1}, Landroid/util/Size;->getWidth()I

    move-result p1

    int-to-float p1, p1

    div-float/2addr v0, p1

    add-float/2addr v1, p2

    iget-object p1, p0, Lcom/android/camera2/autozoom/AutoZoomView;->mPreviewSize:Landroid/util/Size;

    .line 298
    invoke-virtual {p1}, Landroid/util/Size;->getHeight()I

    move-result p1

    int-to-float p1, p1

    div-float/2addr v1, p1

    invoke-direct {v2, v3, v4, v0, v1}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 300
    invoke-static {v2}, Lcom/android/camera2/autozoom/AutoZoomUtils;->fromVidhanceCoordinateSystem(Landroid/graphics/RectF;)V

    .line 301
    invoke-virtual {p0}, Lcom/android/camera2/autozoom/AutoZoomView;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1, v2}, Lcom/android/camera2/autozoom/AutoZoomUtils;->rotateFromVidhance(Landroid/content/Context;Landroid/graphics/RectF;)V

    .line 303
    new-instance p1, Landroid/util/Size;

    invoke-virtual {p0}, Lcom/android/camera2/autozoom/AutoZoomView;->getWidth()I

    move-result p2

    invoke-virtual {p0}, Lcom/android/camera2/autozoom/AutoZoomView;->getHeight()I

    move-result v0

    invoke-direct {p1, p2, v0}, Landroid/util/Size;-><init>(II)V

    .line 305
    invoke-static {v2, p1}, Lcom/android/camera2/autozoom/AutoZoomUtils;->normalizedRectToSize(Landroid/graphics/RectF;Landroid/util/Size;)V

    .line 307
    return-object v2
.end method

.method private getTapedRect(FF)Landroid/graphics/RectF;
    .locals 3

    .line 311
    nop

    .line 312
    nop

    .line 313
    invoke-virtual {p0}, Lcom/android/camera2/autozoom/AutoZoomView;->getWidth()I

    move-result v0

    int-to-float v0, v0

    div-float/2addr p1, v0

    const v0, 0x3dcccccd    # 0.1f

    sub-float/2addr p1, v0

    .line 314
    invoke-virtual {p0}, Lcom/android/camera2/autozoom/AutoZoomView;->getHeight()I

    move-result v1

    int-to-float v1, v1

    div-float/2addr p2, v1

    sub-float/2addr p2, v0

    .line 316
    new-instance v0, Landroid/graphics/RectF;

    const v1, 0x3e4ccccd    # 0.2f

    add-float v2, p1, v1

    add-float/2addr v1, p2

    invoke-direct {v0, p1, p2, v2, v1}, Landroid/graphics/RectF;-><init>(FFFF)V

    return-object v0
.end method

.method private init()V
    .locals 5

    .line 65
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/android/camera2/autozoom/AutoZoomView;->mViewEnabled:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 66
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/android/camera2/autozoom/AutoZoomView;->mViewActive:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 67
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/android/camera2/autozoom/AutoZoomView;->mBeginLost:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 68
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/android/camera2/autozoom/AutoZoomView;->mEndLost:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 70
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/android/camera2/autozoom/AutoZoomView;->mRectPaint:Landroid/graphics/Paint;

    .line 71
    iget-object v0, p0, Lcom/android/camera2/autozoom/AutoZoomView;->mRectPaint:Landroid/graphics/Paint;

    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 72
    iget-object v0, p0, Lcom/android/camera2/autozoom/AutoZoomView;->mRectPaint:Landroid/graphics/Paint;

    new-instance v3, Landroid/graphics/PorterDuffXfermode;

    sget-object v4, Landroid/graphics/PorterDuff$Mode;->CLEAR:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {v3, v4}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 74
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/android/camera2/autozoom/AutoZoomView;->mPathPaint:Landroid/graphics/Paint;

    .line 75
    iget-object v0, p0, Lcom/android/camera2/autozoom/AutoZoomView;->mPathPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 76
    iget-object v0, p0, Lcom/android/camera2/autozoom/AutoZoomView;->mPathPaint:Landroid/graphics/Paint;

    iget v2, p0, Lcom/android/camera2/autozoom/AutoZoomView;->mBoundWidth:F

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 77
    iget-object v0, p0, Lcom/android/camera2/autozoom/AutoZoomView;->mPathPaint:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 78
    iget-object v0, p0, Lcom/android/camera2/autozoom/AutoZoomView;->mPathPaint:Landroid/graphics/Paint;

    invoke-virtual {p0}, Lcom/android/camera2/autozoom/AutoZoomView;->getContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f0b0073

    invoke-virtual {v2, v3}, Landroid/content/Context;->getColor(I)I

    move-result v2

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 80
    invoke-virtual {p0}, Lcom/android/camera2/autozoom/AutoZoomView;->getContext()Landroid/content/Context;

    move-result-object v0

    const/high16 v2, 0x41200000    # 10.0f

    invoke-static {v0, v2}, Lcom/android/camera2/autozoom/AutoZoomUtils;->dp2px(Landroid/content/Context;F)I

    move-result v0

    iput v0, p0, Lcom/android/camera2/autozoom/AutoZoomView;->mTolerateY:I

    .line 82
    invoke-virtual {p0, v1}, Lcom/android/camera2/autozoom/AutoZoomView;->setWillNotDraw(Z)V

    .line 83
    invoke-virtual {p0, p0}, Lcom/android/camera2/autozoom/AutoZoomView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 84
    const/4 v0, 0x2

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/android/camera2/autozoom/AutoZoomView;->setLayerType(ILandroid/graphics/Paint;)V

    .line 85
    return-void
.end method

.method private isLost()Z
    .locals 1

    .line 377
    iget-object v0, p0, Lcom/android/camera2/autozoom/AutoZoomView;->mAutoZoomActiveObjects:[I

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/android/camera2/autozoom/AutoZoomView;->mAutoZoomPausedObjects:[I

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/android/camera2/autozoom/AutoZoomView;->isMoving()Z

    move-result v0

    if-nez v0, :cond_0

    .line 378
    const/4 v0, 0x1

    return v0

    .line 380
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method private isLosting()Z
    .locals 4

    .line 362
    invoke-virtual {p0}, Lcom/android/camera2/autozoom/AutoZoomView;->isMoving()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 363
    iget-object v0, p0, Lcom/android/camera2/autozoom/AutoZoomView;->mAutoZoomActiveObjects:[I

    const/4 v2, 0x1

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera2/autozoom/AutoZoomView;->mAutoZoomPausedObjects:[I

    if-eqz v0, :cond_0

    .line 364
    iget-object v0, p0, Lcom/android/camera2/autozoom/AutoZoomView;->mAutoZoomActiveObjects:[I

    aget v0, v0, v1

    iget-object v3, p0, Lcom/android/camera2/autozoom/AutoZoomView;->mAutoZoomPausedObjects:[I

    aget v3, v3, v1

    if-ne v0, v3, :cond_1

    .line 365
    return v2

    .line 367
    :cond_0
    iget-object v0, p0, Lcom/android/camera2/autozoom/AutoZoomView;->mAutoZoomActiveObjects:[I

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/android/camera2/autozoom/AutoZoomView;->mAutoZoomPausedObjects:[I

    if-nez v0, :cond_1

    .line 368
    return v2

    .line 371
    :cond_1
    return v1
.end method

.method private isTrackingNotLost()Z
    .locals 1

    .line 353
    iget-object v0, p0, Lcom/android/camera2/autozoom/AutoZoomView;->mAutoZoomActiveObjects:[I

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera2/autozoom/AutoZoomView;->mAutoZoomPausedObjects:[I

    if-nez v0, :cond_0

    .line 354
    const/4 v0, 0x1

    return v0

    .line 357
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method private tapAt(FF)V
    .locals 4

    .line 320
    iget-object v0, p0, Lcom/android/camera2/autozoom/AutoZoomView;->mViewEnabled:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-nez v0, :cond_0

    .line 321
    return-void

    .line 324
    :cond_0
    iget-object v0, p0, Lcom/android/camera2/autozoom/AutoZoomView;->mPreviewSize:Landroid/util/Size;

    if-nez v0, :cond_1

    .line 325
    return-void

    .line 329
    :cond_1
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xd7

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$AutoZoomModuleProtocol;

    .line 331
    iget-object v1, p0, Lcom/android/camera2/autozoom/AutoZoomView;->mTrackers:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-lt v1, v3, :cond_2

    if-eqz v0, :cond_2

    .line 332
    invoke-interface {v0, v2}, Lcom/android/camera/protocol/ModeProtocol$AutoZoomModuleProtocol;->setAutoZoomStopCapture(I)V

    .line 335
    :cond_2
    invoke-direct {p0, p1, p2}, Lcom/android/camera2/autozoom/AutoZoomView;->getTapedRect(FF)Landroid/graphics/RectF;

    move-result-object p1

    .line 337
    invoke-virtual {p0}, Lcom/android/camera2/autozoom/AutoZoomView;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2, p1}, Lcom/android/camera2/autozoom/AutoZoomUtils;->rotateToVidhance(Landroid/content/Context;Landroid/graphics/RectF;)V

    .line 338
    invoke-static {p1}, Lcom/android/camera2/autozoom/AutoZoomUtils;->toVidhanceCoordinateSystem(Landroid/graphics/RectF;)V

    .line 339
    iget-object p2, p0, Lcom/android/camera2/autozoom/AutoZoomView;->mPreviewSize:Landroid/util/Size;

    invoke-static {p1, p2}, Lcom/android/camera2/autozoom/AutoZoomUtils;->normalizedRectToSize(Landroid/graphics/RectF;Landroid/util/Size;)V

    .line 341
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p2

    const/16 v0, 0xd6

    invoke-virtual {p2, v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p2

    check-cast p2, Lcom/android/camera/protocol/ModeProtocol$AutoZoomViewProtocol;

    .line 342
    if-eqz p2, :cond_4

    .line 343
    invoke-virtual {p0, v3}, Lcom/android/camera2/autozoom/AutoZoomView;->setViewActive(Z)V

    .line 344
    invoke-virtual {p0}, Lcom/android/camera2/autozoom/AutoZoomView;->isViewVisibile()Z

    move-result v0

    if-nez v0, :cond_3

    .line 345
    invoke-virtual {p0, v2}, Lcom/android/camera2/autozoom/AutoZoomView;->setVisibility(I)V

    .line 347
    :cond_3
    invoke-interface {p2, p1}, Lcom/android/camera/protocol/ModeProtocol$AutoZoomViewProtocol;->onTrackingStarted(Landroid/graphics/RectF;)V

    .line 349
    :cond_4
    return-void
.end method


# virtual methods
.method public clear(I)V
    .locals 1

    .line 127
    const/4 v0, -0x1

    if-eq p1, v0, :cond_0

    .line 128
    new-instance v0, Lcom/android/camera2/autozoom/AutoZoomView$2;

    invoke-direct {v0, p0, p1}, Lcom/android/camera2/autozoom/AutoZoomView$2;-><init>(Lcom/android/camera2/autozoom/AutoZoomView;I)V

    invoke-virtual {p0, v0}, Lcom/android/camera2/autozoom/AutoZoomView;->post(Ljava/lang/Runnable;)Z

    .line 142
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera2/autozoom/AutoZoomView;->postInvalidate()V

    .line 143
    return-void
.end method

.method public feedData(Lcom/android/camera2/autozoom/AutoZoomCaptureResult;)V
    .locals 8

    .line 153
    iget-object v0, p0, Lcom/android/camera2/autozoom/AutoZoomView;->mViewEnabled:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-nez v0, :cond_0

    .line 154
    return-void

    .line 156
    :cond_0
    iget-object v0, p0, Lcom/android/camera2/autozoom/AutoZoomView;->mViewActive:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-nez v0, :cond_1

    .line 157
    return-void

    .line 159
    :cond_1
    iget-object v0, p0, Lcom/android/camera2/autozoom/AutoZoomView;->mPreviewSize:Landroid/util/Size;

    if-nez v0, :cond_2

    .line 160
    return-void

    .line 163
    :cond_2
    invoke-virtual {p1}, Lcom/android/camera2/autozoom/AutoZoomCaptureResult;->getAutoZoomBounds()[F

    move-result-object v0

    .line 165
    if-eqz v0, :cond_6

    .line 166
    invoke-virtual {p1}, Lcom/android/camera2/autozoom/AutoZoomCaptureResult;->getAutoZoomStatus()I

    move-result v1

    iput v1, p0, Lcom/android/camera2/autozoom/AutoZoomView;->mAutoZoomStatus:I

    .line 167
    invoke-virtual {p1}, Lcom/android/camera2/autozoom/AutoZoomCaptureResult;->getAutoZoomActiveObjects()[I

    move-result-object v1

    .line 169
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 170
    const/4 v3, 0x0

    if-eqz v1, :cond_3

    .line 171
    move v4, v3

    :goto_0
    array-length v5, v1

    if-ge v4, v5, :cond_3

    .line 172
    aget v5, v1, v4

    .line 173
    new-instance v6, Lcom/android/camera2/autozoom/AutoZoomTracker;

    invoke-virtual {p1}, Lcom/android/camera2/autozoom/AutoZoomCaptureResult;->getAutoZoomObjectBoundsStabilized()[F

    move-result-object v7

    invoke-direct {p0, v4, v7}, Lcom/android/camera2/autozoom/AutoZoomView;->fillBoundsInOverlay(I[F)Landroid/graphics/RectF;

    move-result-object v7

    invoke-direct {v6, v5, v7}, Lcom/android/camera2/autozoom/AutoZoomTracker;-><init>(ILandroid/graphics/RectF;)V

    invoke-interface {v2, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 171
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 176
    :cond_3
    iput-object v2, p0, Lcom/android/camera2/autozoom/AutoZoomView;->mTrackers:Ljava/util/List;

    .line 178
    invoke-virtual {p1}, Lcom/android/camera2/autozoom/AutoZoomCaptureResult;->getAutoZoomPausedObjects()[I

    move-result-object v1

    iput-object v1, p0, Lcom/android/camera2/autozoom/AutoZoomView;->mAutoZoomPausedObjects:[I

    .line 179
    invoke-virtual {p1}, Lcom/android/camera2/autozoom/AutoZoomCaptureResult;->getAutoZoomActiveObjects()[I

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera2/autozoom/AutoZoomView;->mAutoZoomActiveObjects:[I

    .line 181
    invoke-direct {p0}, Lcom/android/camera2/autozoom/AutoZoomView;->isLosting()Z

    move-result p1

    const/4 v1, 0x1

    if-eqz p1, :cond_4

    iget-object p1, p0, Lcom/android/camera2/autozoom/AutoZoomView;->mBeginLost:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result p1

    if-nez p1, :cond_4

    .line 183
    iget-object p1, p0, Lcom/android/camera2/autozoom/AutoZoomView;->mBeginLost:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {p1, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    .line 187
    :cond_4
    invoke-direct {p0}, Lcom/android/camera2/autozoom/AutoZoomView;->isLost()Z

    move-result p1

    if-eqz p1, :cond_5

    iget-object p1, p0, Lcom/android/camera2/autozoom/AutoZoomView;->mBeginLost:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result p1

    if-eqz p1, :cond_5

    iget-object p1, p0, Lcom/android/camera2/autozoom/AutoZoomView;->mEndLost:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result p1

    if-nez p1, :cond_5

    .line 189
    iget-object p1, p0, Lcom/android/camera2/autozoom/AutoZoomView;->mEndLost:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {p1, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    .line 191
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 v1, 0xd7

    invoke-virtual {p1, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$AutoZoomModuleProtocol;

    .line 192
    if-eqz p1, :cond_5

    .line 193
    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$AutoZoomModuleProtocol;->onTrackLost()V

    .line 197
    :cond_5
    invoke-direct {p0, v3, v0}, Lcom/android/camera2/autozoom/AutoZoomView;->fillBoundsInOverlay(I[F)Landroid/graphics/RectF;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera2/autozoom/AutoZoomView;->mAutoZoomBound:Landroid/graphics/RectF;

    .line 198
    iget-object p1, p0, Lcom/android/camera2/autozoom/AutoZoomView;->mAutoZoomBound:Landroid/graphics/RectF;

    if-eqz p1, :cond_6

    .line 199
    invoke-virtual {p0}, Lcom/android/camera2/autozoom/AutoZoomView;->postInvalidate()V

    .line 202
    :cond_6
    return-void
.end method

.method public getPreviewSize()Landroid/util/Size;
    .locals 1

    .line 211
    iget-object v0, p0, Lcom/android/camera2/autozoom/AutoZoomView;->mPreviewSize:Landroid/util/Size;

    return-object v0
.end method

.method public isMoving()Z
    .locals 2

    .line 147
    nop

    .line 148
    iget v0, p0, Lcom/android/camera2/autozoom/AutoZoomView;->mAutoZoomStatus:I

    const/16 v1, 0x20

    and-int/2addr v0, v1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isViewActive()Z
    .locals 1

    .line 121
    iget-object v0, p0, Lcom/android/camera2/autozoom/AutoZoomView;->mViewActive:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    return v0
.end method

.method public isViewEnabled()Z
    .locals 1

    .line 94
    iget-object v0, p0, Lcom/android/camera2/autozoom/AutoZoomView;->mViewEnabled:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    return v0
.end method

.method public isViewVisibile()Z
    .locals 1

    .line 109
    invoke-virtual {p0}, Lcom/android/camera2/autozoom/AutoZoomView;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 2

    .line 259
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 260
    iget-object v0, p0, Lcom/android/camera2/autozoom/AutoZoomView;->mViewEnabled:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-nez v0, :cond_0

    .line 261
    return-void

    .line 264
    :cond_0
    iget-object v0, p0, Lcom/android/camera2/autozoom/AutoZoomView;->mViewActive:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-nez v0, :cond_1

    .line 265
    return-void

    .line 268
    :cond_1
    iget-object v0, p0, Lcom/android/camera2/autozoom/AutoZoomView;->mAutoZoomBound:Landroid/graphics/RectF;

    if-eqz v0, :cond_2

    .line 269
    invoke-virtual {p0}, Lcom/android/camera2/autozoom/AutoZoomView;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f0b0072

    invoke-virtual {v0, v1}, Landroid/content/Context;->getColor(I)I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->drawColor(I)V

    .line 270
    iget-object v0, p0, Lcom/android/camera2/autozoom/AutoZoomView;->mAutoZoomBound:Landroid/graphics/RectF;

    iget-object v1, p0, Lcom/android/camera2/autozoom/AutoZoomView;->mRectPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 272
    invoke-direct {p0}, Lcom/android/camera2/autozoom/AutoZoomView;->isLost()Z

    move-result v0

    if-nez v0, :cond_2

    .line 273
    iget-object v0, p0, Lcom/android/camera2/autozoom/AutoZoomView;->mAutoZoomBound:Landroid/graphics/RectF;

    iget-object v1, p0, Lcom/android/camera2/autozoom/AutoZoomView;->mPathPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 276
    :cond_2
    return-void
.end method

.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 1

    .line 216
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result p1

    .line 217
    if-nez p1, :cond_0

    .line 219
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 v0, 0xac

    invoke-virtual {p1, v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    .line 220
    if-eqz p1, :cond_0

    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->isExtraMenuShowing()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 221
    const/4 p1, 0x0

    return p1

    .line 224
    :cond_0
    invoke-virtual {p0, p2}, Lcom/android/camera2/autozoom/AutoZoomView;->onViewTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1
.end method

.method public onViewTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 3

    .line 228
    iget-object v0, p0, Lcom/android/camera2/autozoom/AutoZoomView;->mViewEnabled:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 229
    return v1

    .line 232
    :cond_0
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isVideoModule()Z

    move-result v0

    if-nez v0, :cond_1

    .line 233
    return v1

    .line 236
    :cond_1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v0

    .line 237
    iget v2, p0, Lcom/android/camera2/autozoom/AutoZoomView;->mTolerateY:I

    int-to-float v2, v2

    cmpg-float v0, v0, v2

    if-gez v0, :cond_2

    .line 238
    return v1

    .line 241
    :cond_2
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    .line 242
    const/4 v2, 0x1

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    .line 249
    :pswitch_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    invoke-direct {p0, v0, p1}, Lcom/android/camera2/autozoom/AutoZoomView;->tapAt(FF)V

    .line 250
    return v2

    .line 244
    :pswitch_1
    iget-object p1, p0, Lcom/android/camera2/autozoom/AutoZoomView;->mViewEnabled:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result p1

    if-eqz p1, :cond_3

    .line 245
    return v2

    .line 254
    :cond_3
    :goto_0
    return v1

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public setPreviewSize(Landroid/util/Size;)V
    .locals 0

    .line 206
    iput-object p1, p0, Lcom/android/camera2/autozoom/AutoZoomView;->mPreviewSize:Landroid/util/Size;

    .line 207
    return-void
.end method

.method public setViewActive(Z)V
    .locals 2

    .line 114
    iget-object v0, p0, Lcom/android/camera2/autozoom/AutoZoomView;->mBeginLost:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    .line 115
    iget-object v0, p0, Lcom/android/camera2/autozoom/AutoZoomView;->mEndLost:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    .line 116
    iget-object v0, p0, Lcom/android/camera2/autozoom/AutoZoomView;->mViewActive:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    .line 117
    return-void
.end method

.method public setViewEnable(Z)V
    .locals 1

    .line 89
    iget-object v0, p0, Lcom/android/camera2/autozoom/AutoZoomView;->mViewEnabled:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    .line 90
    return-void
.end method

.method public setViewVisibility(I)V
    .locals 1

    .line 99
    new-instance v0, Lcom/android/camera2/autozoom/AutoZoomView$1;

    invoke-direct {v0, p0, p1}, Lcom/android/camera2/autozoom/AutoZoomView$1;-><init>(Lcom/android/camera2/autozoom/AutoZoomView;I)V

    invoke-virtual {p0, v0}, Lcom/android/camera2/autozoom/AutoZoomView;->post(Ljava/lang/Runnable;)Z

    .line 105
    return-void
.end method
