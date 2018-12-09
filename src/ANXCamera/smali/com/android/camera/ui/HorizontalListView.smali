.class public Lcom/android/camera/ui/HorizontalListView;
.super Landroid/widget/AdapterView;
.source "HorizontalListView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/ui/HorizontalListView$OnSingleTapDownListener;,
        Lcom/android/camera/ui/HorizontalListView$OnValueChangedListener;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/AdapterView<",
        "Landroid/widget/ListAdapter;",
        ">;"
    }
.end annotation


# static fields
.field private static final MIN_DELTA_FOR_SCROLLING:I = 0xa

.field private static final TAG:Ljava/lang/String;


# instance fields
.field protected mAdapter:Landroid/widget/ListAdapter;

.field private mBlockNotification:Z

.field protected mCurrentX:I

.field private mDataChanged:Z

.field private mDataObserver:Landroid/database/DataSetObserver;

.field private mDisplayOffset:I

.field private mGesture:Landroid/view/GestureDetector;

.field private mIsScrollingPerformed:Z

.field private mItemWidth:I

.field private mLastSelectImageListItem:Landroid/view/View;

.field private mLeftViewIndex:I

.field private mMaxX:I

.field protected mNextX:I

.field private mOnGesture:Landroid/view/GestureDetector$OnGestureListener;

.field private mOnItemClicked:Landroid/widget/AdapterView$OnItemClickListener;

.field private mOnItemLongClicked:Landroid/widget/AdapterView$OnItemLongClickListener;

.field private mOnItemSelected:Landroid/widget/AdapterView$OnItemSelectedListener;

.field private mOnItemSingleTapDowned:Lcom/android/camera/ui/HorizontalListView$OnSingleTapDownListener;

.field private mPaddingWidth:I

.field private mPresetWidth:I

.field private mPreviousSelectViewIndex:I

.field private mRemovedViewQueue:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field private mRightViewIndex:I

.field protected mScroller:Landroid/widget/Scroller;

.field private mSelectCenter:Z

.field private mSelectViewIndex:I

.field private mTouchDown:Z

.field private mTouchMoveEnable:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 25
    const-class v0, Lcom/android/camera/ui/HorizontalListView;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/ui/HorizontalListView;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 64
    invoke-direct {p0, p1, p2}, Landroid/widget/AdapterView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 29
    const/4 p1, -0x1

    iput p1, p0, Lcom/android/camera/ui/HorizontalListView;->mLeftViewIndex:I

    .line 30
    const/4 p1, 0x0

    iput p1, p0, Lcom/android/camera/ui/HorizontalListView;->mRightViewIndex:I

    .line 33
    const p2, 0x7fffffff

    iput p2, p0, Lcom/android/camera/ui/HorizontalListView;->mMaxX:I

    .line 34
    iput p1, p0, Lcom/android/camera/ui/HorizontalListView;->mDisplayOffset:I

    .line 38
    new-instance p2, Ljava/util/LinkedList;

    invoke-direct {p2}, Ljava/util/LinkedList;-><init>()V

    iput-object p2, p0, Lcom/android/camera/ui/HorizontalListView;->mRemovedViewQueue:Ljava/util/Queue;

    .line 43
    iput-boolean p1, p0, Lcom/android/camera/ui/HorizontalListView;->mDataChanged:Z

    .line 44
    const/16 p2, 0xb4

    iput p2, p0, Lcom/android/camera/ui/HorizontalListView;->mItemWidth:I

    .line 45
    iput p1, p0, Lcom/android/camera/ui/HorizontalListView;->mSelectViewIndex:I

    .line 46
    iput p1, p0, Lcom/android/camera/ui/HorizontalListView;->mPreviousSelectViewIndex:I

    .line 48
    iput p1, p0, Lcom/android/camera/ui/HorizontalListView;->mPresetWidth:I

    .line 49
    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/android/camera/ui/HorizontalListView;->mSelectCenter:Z

    .line 53
    iput-boolean p1, p0, Lcom/android/camera/ui/HorizontalListView;->mTouchMoveEnable:Z

    .line 126
    new-instance p1, Lcom/android/camera/ui/HorizontalListView$1;

    invoke-direct {p1, p0}, Lcom/android/camera/ui/HorizontalListView$1;-><init>(Lcom/android/camera/ui/HorizontalListView;)V

    iput-object p1, p0, Lcom/android/camera/ui/HorizontalListView;->mDataObserver:Landroid/database/DataSetObserver;

    .line 523
    new-instance p1, Lcom/android/camera/ui/HorizontalListView$4;

    invoke-direct {p1, p0}, Lcom/android/camera/ui/HorizontalListView$4;-><init>(Lcom/android/camera/ui/HorizontalListView;)V

    iput-object p1, p0, Lcom/android/camera/ui/HorizontalListView;->mOnGesture:Landroid/view/GestureDetector$OnGestureListener;

    .line 65
    invoke-direct {p0}, Lcom/android/camera/ui/HorizontalListView;->initView()V

    .line 66
    return-void
.end method

.method static synthetic access$002(Lcom/android/camera/ui/HorizontalListView;Z)Z
    .locals 0

    .line 24
    iput-boolean p1, p0, Lcom/android/camera/ui/HorizontalListView;->mDataChanged:Z

    return p1
.end method

.method static synthetic access$100(Lcom/android/camera/ui/HorizontalListView;)V
    .locals 0

    .line 24
    invoke-direct {p0}, Lcom/android/camera/ui/HorizontalListView;->reset()V

    return-void
.end method

.method static synthetic access$200(Lcom/android/camera/ui/HorizontalListView;)V
    .locals 0

    .line 24
    invoke-direct {p0}, Lcom/android/camera/ui/HorizontalListView;->justify()V

    return-void
.end method

.method static synthetic access$302(Lcom/android/camera/ui/HorizontalListView;Z)Z
    .locals 0

    .line 24
    iput-boolean p1, p0, Lcom/android/camera/ui/HorizontalListView;->mIsScrollingPerformed:Z

    return p1
.end method

.method static synthetic access$402(Lcom/android/camera/ui/HorizontalListView;Z)Z
    .locals 0

    .line 24
    iput-boolean p1, p0, Lcom/android/camera/ui/HorizontalListView;->mBlockNotification:Z

    return p1
.end method

.method static synthetic access$500(Lcom/android/camera/ui/HorizontalListView;)I
    .locals 0

    .line 24
    iget p0, p0, Lcom/android/camera/ui/HorizontalListView;->mLeftViewIndex:I

    return p0
.end method

.method static synthetic access$600(Lcom/android/camera/ui/HorizontalListView;I)I
    .locals 0

    .line 24
    invoke-direct {p0, p1}, Lcom/android/camera/ui/HorizontalListView;->toDataIndex(I)I

    move-result p0

    return p0
.end method

.method static synthetic access$700(Lcom/android/camera/ui/HorizontalListView;)Landroid/widget/AdapterView$OnItemSelectedListener;
    .locals 0

    .line 24
    iget-object p0, p0, Lcom/android/camera/ui/HorizontalListView;->mOnItemSelected:Landroid/widget/AdapterView$OnItemSelectedListener;

    return-object p0
.end method

.method static synthetic access$800(Lcom/android/camera/ui/HorizontalListView;)Lcom/android/camera/ui/HorizontalListView$OnSingleTapDownListener;
    .locals 0

    .line 24
    iget-object p0, p0, Lcom/android/camera/ui/HorizontalListView;->mOnItemSingleTapDowned:Lcom/android/camera/ui/HorizontalListView$OnSingleTapDownListener;

    return-object p0
.end method

.method static synthetic access$900(Lcom/android/camera/ui/HorizontalListView;)Landroid/widget/AdapterView$OnItemLongClickListener;
    .locals 0

    .line 24
    iget-object p0, p0, Lcom/android/camera/ui/HorizontalListView;->mOnItemLongClicked:Landroid/widget/AdapterView$OnItemLongClickListener;

    return-object p0
.end method

.method private addAndMeasureChild(Landroid/view/View;I)V
    .locals 2

    .line 224
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    .line 225
    if-nez v0, :cond_0

    .line 226
    new-instance v0, Landroid/view/ViewGroup$LayoutParams;

    const/4 v1, -0x1

    invoke-direct {v0, v1, v1}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 229
    :cond_0
    const/4 v1, 0x1

    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/android/camera/ui/HorizontalListView;->addViewInLayout(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;Z)Z

    .line 230
    invoke-virtual {p0}, Lcom/android/camera/ui/HorizontalListView;->getWidth()I

    move-result p2

    const/high16 v0, -0x80000000

    invoke-static {p2, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p2

    .line 231
    invoke-virtual {p0}, Lcom/android/camera/ui/HorizontalListView;->getHeight()I

    move-result v1

    invoke-static {v1, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v0

    .line 230
    invoke-virtual {p1, p2, v0}, Landroid/view/View;->measure(II)V

    .line 232
    return-void
.end method

.method private cacheChildItem(Landroid/view/View;)V
    .locals 2

    .line 403
    iget-object v0, p0, Lcom/android/camera/ui/HorizontalListView;->mRemovedViewQueue:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->size()I

    move-result v0

    const/16 v1, 0xa

    if-ge v0, v1, :cond_0

    .line 404
    iget-object v0, p0, Lcom/android/camera/ui/HorizontalListView;->mRemovedViewQueue:Ljava/util/Queue;

    invoke-interface {v0, p1}, Ljava/util/Queue;->offer(Ljava/lang/Object;)Z

    .line 406
    :cond_0
    return-void
.end method

.method private fillList(I)V
    .locals 2

    .line 304
    nop

    .line 305
    invoke-virtual {p0}, Lcom/android/camera/ui/HorizontalListView;->getChildCount()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {p0, v0}, Lcom/android/camera/ui/HorizontalListView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 306
    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 307
    invoke-virtual {v0}, Landroid/view/View;->getRight()I

    move-result v0

    goto :goto_0

    .line 309
    :cond_0
    move v0, v1

    :goto_0
    invoke-direct {p0, v0, p1}, Lcom/android/camera/ui/HorizontalListView;->fillListRight(II)V

    .line 311
    nop

    .line 312
    invoke-virtual {p0, v1}, Lcom/android/camera/ui/HorizontalListView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 313
    if-eqz v0, :cond_1

    .line 314
    invoke-virtual {v0}, Landroid/view/View;->getLeft()I

    move-result v1

    .line 316
    :cond_1
    invoke-direct {p0, v1, p1}, Lcom/android/camera/ui/HorizontalListView;->fillListLeft(II)V

    .line 317
    return-void
.end method

.method private fillListLeft(II)V
    .locals 5

    .line 358
    :goto_0
    add-int v0, p1, p2

    if-lez v0, :cond_1

    iget v0, p0, Lcom/android/camera/ui/HorizontalListView;->mLeftViewIndex:I

    if-ltz v0, :cond_1

    .line 359
    iget v0, p0, Lcom/android/camera/ui/HorizontalListView;->mLeftViewIndex:I

    invoke-direct {p0, v0}, Lcom/android/camera/ui/HorizontalListView;->toDataIndex(I)I

    move-result v0

    .line 360
    iget-object v1, p0, Lcom/android/camera/ui/HorizontalListView;->mAdapter:Landroid/widget/ListAdapter;

    iget-object v2, p0, Lcom/android/camera/ui/HorizontalListView;->mRemovedViewQueue:Ljava/util/Queue;

    invoke-interface {v2}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    invoke-interface {v1, v0, v2, p0}, Landroid/widget/ListAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 361
    iget-boolean v1, p0, Lcom/android/camera/ui/HorizontalListView;->mSelectCenter:Z

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-nez v1, :cond_0

    iget v1, p0, Lcom/android/camera/ui/HorizontalListView;->mLeftViewIndex:I

    iget v4, p0, Lcom/android/camera/ui/HorizontalListView;->mSelectViewIndex:I

    if-ne v1, v4, :cond_0

    .line 362
    iput-object v0, p0, Lcom/android/camera/ui/HorizontalListView;->mLastSelectImageListItem:Landroid/view/View;

    .line 363
    invoke-virtual {v0, v3}, Landroid/view/View;->setActivated(Z)V

    goto :goto_1

    .line 365
    :cond_0
    invoke-virtual {v0, v2}, Landroid/view/View;->setActivated(Z)V

    .line 367
    :goto_1
    invoke-direct {p0, v0, v2}, Lcom/android/camera/ui/HorizontalListView;->addAndMeasureChild(Landroid/view/View;I)V

    .line 368
    invoke-direct {p0}, Lcom/android/camera/ui/HorizontalListView;->getChildWidth()I

    move-result v0

    sub-int/2addr p1, v0

    .line 369
    iget v0, p0, Lcom/android/camera/ui/HorizontalListView;->mLeftViewIndex:I

    sub-int/2addr v0, v3

    iput v0, p0, Lcom/android/camera/ui/HorizontalListView;->mLeftViewIndex:I

    .line 370
    iget v0, p0, Lcom/android/camera/ui/HorizontalListView;->mDisplayOffset:I

    invoke-direct {p0}, Lcom/android/camera/ui/HorizontalListView;->getChildWidth()I

    move-result v1

    sub-int/2addr v0, v1

    iput v0, p0, Lcom/android/camera/ui/HorizontalListView;->mDisplayOffset:I

    .line 371
    goto :goto_0

    .line 372
    :cond_1
    return-void
.end method

.method private fillListRight(II)V
    .locals 5

    .line 320
    :goto_0
    add-int v0, p1, p2

    invoke-virtual {p0}, Lcom/android/camera/ui/HorizontalListView;->getWidth()I

    move-result v1

    if-ge v0, v1, :cond_3

    iget v0, p0, Lcom/android/camera/ui/HorizontalListView;->mRightViewIndex:I

    iget-object v1, p0, Lcom/android/camera/ui/HorizontalListView;->mAdapter:Landroid/widget/ListAdapter;

    invoke-interface {v1}, Landroid/widget/ListAdapter;->getCount()I

    move-result v1

    if-ge v0, v1, :cond_3

    .line 321
    iget v0, p0, Lcom/android/camera/ui/HorizontalListView;->mRightViewIndex:I

    invoke-direct {p0, v0}, Lcom/android/camera/ui/HorizontalListView;->toDataIndex(I)I

    move-result v0

    .line 322
    iget-object v1, p0, Lcom/android/camera/ui/HorizontalListView;->mAdapter:Landroid/widget/ListAdapter;

    iget-object v2, p0, Lcom/android/camera/ui/HorizontalListView;->mRemovedViewQueue:Ljava/util/Queue;

    invoke-interface {v2}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    invoke-interface {v1, v0, v2, p0}, Landroid/widget/ListAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 323
    iget-boolean v1, p0, Lcom/android/camera/ui/HorizontalListView;->mSelectCenter:Z

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-nez v1, :cond_0

    iget v1, p0, Lcom/android/camera/ui/HorizontalListView;->mRightViewIndex:I

    iget v4, p0, Lcom/android/camera/ui/HorizontalListView;->mSelectViewIndex:I

    if-ne v1, v4, :cond_0

    .line 324
    iput-object v0, p0, Lcom/android/camera/ui/HorizontalListView;->mLastSelectImageListItem:Landroid/view/View;

    .line 325
    invoke-virtual {v0, v3}, Landroid/view/View;->setActivated(Z)V

    goto :goto_1

    .line 327
    :cond_0
    invoke-virtual {v0, v2}, Landroid/view/View;->setActivated(Z)V

    .line 329
    :goto_1
    const/4 v1, -0x1

    invoke-direct {p0, v0, v1}, Lcom/android/camera/ui/HorizontalListView;->addAndMeasureChild(Landroid/view/View;I)V

    .line 330
    invoke-direct {p0}, Lcom/android/camera/ui/HorizontalListView;->getChildWidth()I

    move-result v0

    add-int/2addr p1, v0

    .line 332
    iget v0, p0, Lcom/android/camera/ui/HorizontalListView;->mRightViewIndex:I

    iget-object v1, p0, Lcom/android/camera/ui/HorizontalListView;->mAdapter:Landroid/widget/ListAdapter;

    invoke-interface {v1}, Landroid/widget/ListAdapter;->getCount()I

    move-result v1

    sub-int/2addr v1, v3

    if-ne v0, v1, :cond_1

    .line 333
    iget v0, p0, Lcom/android/camera/ui/HorizontalListView;->mPaddingWidth:I

    mul-int/lit8 v0, v0, 0x2

    invoke-direct {p0}, Lcom/android/camera/ui/HorizontalListView;->getChildWidth()I

    move-result v1

    iget-object v4, p0, Lcom/android/camera/ui/HorizontalListView;->mAdapter:Landroid/widget/ListAdapter;

    invoke-interface {v4}, Landroid/widget/ListAdapter;->getCount()I

    move-result v4

    mul-int/2addr v1, v4

    add-int/2addr v0, v1

    invoke-virtual {p0}, Lcom/android/camera/ui/HorizontalListView;->getWidth()I

    move-result v1

    sub-int/2addr v0, v1

    iput v0, p0, Lcom/android/camera/ui/HorizontalListView;->mMaxX:I

    .line 336
    :cond_1
    iget v0, p0, Lcom/android/camera/ui/HorizontalListView;->mMaxX:I

    if-gez v0, :cond_2

    .line 337
    iput v2, p0, Lcom/android/camera/ui/HorizontalListView;->mMaxX:I

    .line 339
    :cond_2
    iget v0, p0, Lcom/android/camera/ui/HorizontalListView;->mRightViewIndex:I

    add-int/2addr v0, v3

    iput v0, p0, Lcom/android/camera/ui/HorizontalListView;->mRightViewIndex:I

    .line 340
    goto :goto_0

    .line 341
    :cond_3
    return-void
.end method

.method private getChildWidth()I
    .locals 1

    .line 520
    iget v0, p0, Lcom/android/camera/ui/HorizontalListView;->mItemWidth:I

    return v0
.end method

.method private declared-synchronized initView()V
    .locals 4

    monitor-enter p0

    .line 81
    :try_start_0
    invoke-virtual {p0}, Lcom/android/camera/ui/HorizontalListView;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "window"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/WindowManager;

    .line 82
    new-instance v1, Landroid/util/DisplayMetrics;

    invoke-direct {v1}, Landroid/util/DisplayMetrics;-><init>()V

    .line 83
    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    .line 84
    iget v0, v1, Landroid/util/DisplayMetrics;->widthPixels:I

    iput v0, p0, Lcom/android/camera/ui/HorizontalListView;->mPresetWidth:I

    .line 86
    const/4 v0, -0x1

    iput v0, p0, Lcom/android/camera/ui/HorizontalListView;->mLeftViewIndex:I

    .line 87
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera/ui/HorizontalListView;->mRightViewIndex:I

    .line 88
    iput v0, p0, Lcom/android/camera/ui/HorizontalListView;->mCurrentX:I

    .line 89
    iput v0, p0, Lcom/android/camera/ui/HorizontalListView;->mNextX:I

    .line 90
    const v1, 0x7fffffff

    iput v1, p0, Lcom/android/camera/ui/HorizontalListView;->mMaxX:I

    .line 91
    iget-boolean v1, p0, Lcom/android/camera/ui/HorizontalListView;->mSelectCenter:Z

    if-eqz v1, :cond_0

    .line 92
    iget v1, p0, Lcom/android/camera/ui/HorizontalListView;->mPresetWidth:I

    iget v2, p0, Lcom/android/camera/ui/HorizontalListView;->mItemWidth:I

    sub-int/2addr v1, v2

    div-int/lit8 v1, v1, 0x2

    iput v1, p0, Lcom/android/camera/ui/HorizontalListView;->mPaddingWidth:I

    .line 93
    iget v1, p0, Lcom/android/camera/ui/HorizontalListView;->mPaddingWidth:I

    iput v1, p0, Lcom/android/camera/ui/HorizontalListView;->mDisplayOffset:I

    goto :goto_0

    .line 95
    :cond_0
    iput v0, p0, Lcom/android/camera/ui/HorizontalListView;->mDisplayOffset:I

    .line 97
    :goto_0
    new-instance v1, Landroid/widget/Scroller;

    invoke-virtual {p0}, Lcom/android/camera/ui/HorizontalListView;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/widget/Scroller;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/android/camera/ui/HorizontalListView;->mScroller:Landroid/widget/Scroller;

    .line 98
    new-instance v1, Landroid/view/GestureDetector;

    invoke-virtual {p0}, Lcom/android/camera/ui/HorizontalListView;->getContext()Landroid/content/Context;

    move-result-object v2

    iget-object v3, p0, Lcom/android/camera/ui/HorizontalListView;->mOnGesture:Landroid/view/GestureDetector$OnGestureListener;

    invoke-direct {v1, v2, v3}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    iput-object v1, p0, Lcom/android/camera/ui/HorizontalListView;->mGesture:Landroid/view/GestureDetector;

    .line 99
    iget-object v1, p0, Lcom/android/camera/ui/HorizontalListView;->mLastSelectImageListItem:Landroid/view/View;

    if-eqz v1, :cond_1

    .line 100
    iget-object v1, p0, Lcom/android/camera/ui/HorizontalListView;->mLastSelectImageListItem:Landroid/view/View;

    invoke-virtual {v1, v0}, Landroid/view/View;->setActivated(Z)V

    .line 101
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera/ui/HorizontalListView;->mLastSelectImageListItem:Landroid/view/View;

    .line 103
    :cond_1
    invoke-virtual {p0}, Lcom/android/camera/ui/HorizontalListView;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/android/camera/ActivityBase;

    const/4 v1, 0x6

    invoke-virtual {v0, v1}, Lcom/android/camera/ActivityBase;->loadCameraSound(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 104
    monitor-exit p0

    return-void

    .line 80
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private justify()V
    .locals 4

    .line 200
    nop

    .line 201
    iget v0, p0, Lcom/android/camera/ui/HorizontalListView;->mSelectViewIndex:I

    iget v1, p0, Lcom/android/camera/ui/HorizontalListView;->mLeftViewIndex:I

    const/4 v2, 0x1

    if-le v0, v1, :cond_1

    iget v0, p0, Lcom/android/camera/ui/HorizontalListView;->mSelectViewIndex:I

    iget v1, p0, Lcom/android/camera/ui/HorizontalListView;->mRightViewIndex:I

    if-ge v0, v1, :cond_1

    .line 202
    iget v0, p0, Lcom/android/camera/ui/HorizontalListView;->mSelectViewIndex:I

    iget v1, p0, Lcom/android/camera/ui/HorizontalListView;->mLeftViewIndex:I

    sub-int/2addr v0, v1

    sub-int/2addr v0, v2

    invoke-virtual {p0, v0}, Lcom/android/camera/ui/HorizontalListView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 203
    invoke-virtual {v0}, Landroid/view/View;->getLeft()I

    move-result v0

    iget v1, p0, Lcom/android/camera/ui/HorizontalListView;->mItemWidth:I

    div-int/lit8 v1, v1, 0x2

    add-int/2addr v0, v1

    iget v1, p0, Lcom/android/camera/ui/HorizontalListView;->mPresetWidth:I

    div-int/lit8 v1, v1, 0x2

    sub-int/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    move-result v0

    const/16 v1, 0xa

    if-le v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 206
    move v2, v0

    :cond_1
    :goto_0
    if-nez v2, :cond_2

    return-void

    .line 208
    :cond_2
    iget v0, p0, Lcom/android/camera/ui/HorizontalListView;->mPaddingWidth:I

    iget v1, p0, Lcom/android/camera/ui/HorizontalListView;->mItemWidth:I

    iget v2, p0, Lcom/android/camera/ui/HorizontalListView;->mSelectViewIndex:I

    mul-int/2addr v1, v2

    add-int/2addr v0, v1

    iget v1, p0, Lcom/android/camera/ui/HorizontalListView;->mItemWidth:I

    div-int/lit8 v1, v1, 0x2

    add-int/2addr v0, v1

    iget v1, p0, Lcom/android/camera/ui/HorizontalListView;->mPresetWidth:I

    div-int/lit8 v1, v1, 0x2

    sub-int/2addr v0, v1

    .line 209
    iget v1, p0, Lcom/android/camera/ui/HorizontalListView;->mPaddingWidth:I

    mul-int/lit8 v1, v1, 0x2

    iget v2, p0, Lcom/android/camera/ui/HorizontalListView;->mItemWidth:I

    iget-object v3, p0, Lcom/android/camera/ui/HorizontalListView;->mAdapter:Landroid/widget/ListAdapter;

    invoke-interface {v3}, Landroid/widget/ListAdapter;->getCount()I

    move-result v3

    mul-int/2addr v2, v3

    add-int/2addr v1, v2

    iget v2, p0, Lcom/android/camera/ui/HorizontalListView;->mPresetWidth:I

    sub-int/2addr v1, v2

    iput v1, p0, Lcom/android/camera/ui/HorizontalListView;->mMaxX:I

    .line 210
    iget v1, p0, Lcom/android/camera/ui/HorizontalListView;->mMaxX:I

    if-le v0, v1, :cond_3

    .line 211
    iget v0, p0, Lcom/android/camera/ui/HorizontalListView;->mMaxX:I

    .line 213
    :cond_3
    iget v1, p0, Lcom/android/camera/ui/HorizontalListView;->mCurrentX:I

    if-eq v0, v1, :cond_5

    .line 214
    invoke-virtual {p0}, Lcom/android/camera/ui/HorizontalListView;->isShown()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 215
    invoke-virtual {p0, v0}, Lcom/android/camera/ui/HorizontalListView;->scrollTo(I)V

    goto :goto_1

    .line 217
    :cond_4
    iput v0, p0, Lcom/android/camera/ui/HorizontalListView;->mNextX:I

    .line 218
    invoke-virtual {p0}, Lcom/android/camera/ui/HorizontalListView;->requestLayout()V

    .line 221
    :cond_5
    :goto_1
    return-void
.end method

.method private loadItems()V
    .locals 2

    .line 436
    const/4 v0, 0x0

    :goto_0
    invoke-virtual {p0}, Lcom/android/camera/ui/HorizontalListView;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 437
    invoke-virtual {p0, v0}, Lcom/android/camera/ui/HorizontalListView;->getChildAt(I)Landroid/view/View;

    .line 436
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 439
    :cond_0
    return-void
.end method

.method private notifyItemSelect(Landroid/view/View;IJ)V
    .locals 9

    .line 490
    if-nez p1, :cond_0

    .line 491
    return-void

    .line 493
    :cond_0
    iget-boolean v0, p0, Lcom/android/camera/ui/HorizontalListView;->mBlockNotification:Z

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-nez v0, :cond_4

    .line 494
    iget-object v0, p0, Lcom/android/camera/ui/HorizontalListView;->mOnItemClicked:Landroid/widget/AdapterView$OnItemClickListener;

    if-eqz v0, :cond_1

    .line 495
    iget-object v3, p0, Lcom/android/camera/ui/HorizontalListView;->mOnItemClicked:Landroid/widget/AdapterView$OnItemClickListener;

    move-object v4, p0

    move-object v5, p1

    move v6, p2

    move-wide v7, p3

    invoke-interface/range {v3 .. v8}, Landroid/widget/AdapterView$OnItemClickListener;->onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V

    .line 497
    :cond_1
    iget-object v0, p0, Lcom/android/camera/ui/HorizontalListView;->mOnItemSelected:Landroid/widget/AdapterView$OnItemSelectedListener;

    if-eqz v0, :cond_2

    .line 498
    iget-object v3, p0, Lcom/android/camera/ui/HorizontalListView;->mOnItemSelected:Landroid/widget/AdapterView$OnItemSelectedListener;

    move-object v4, p0

    move-object v5, p1

    move v6, p2

    move-wide v7, p3

    invoke-interface/range {v3 .. v8}, Landroid/widget/AdapterView$OnItemSelectedListener;->onItemSelected(Landroid/widget/AdapterView;Landroid/view/View;IJ)V

    .line 501
    :cond_2
    iget-object p2, p0, Lcom/android/camera/ui/HorizontalListView;->mLastSelectImageListItem:Landroid/view/View;

    if-eqz p2, :cond_3

    .line 502
    iget-object p2, p0, Lcom/android/camera/ui/HorizontalListView;->mLastSelectImageListItem:Landroid/view/View;

    invoke-virtual {p2, v2}, Landroid/view/View;->setActivated(Z)V

    .line 504
    :cond_3
    iput-object p1, p0, Lcom/android/camera/ui/HorizontalListView;->mLastSelectImageListItem:Landroid/view/View;

    .line 505
    invoke-virtual {p1, v1}, Landroid/view/View;->setActivated(Z)V

    goto :goto_0

    .line 509
    :cond_4
    iget p3, p0, Lcom/android/camera/ui/HorizontalListView;->mSelectViewIndex:I

    invoke-direct {p0, p3}, Lcom/android/camera/ui/HorizontalListView;->toDataIndex(I)I

    move-result p3

    if-ne p2, p3, :cond_6

    .line 510
    iget-object p2, p0, Lcom/android/camera/ui/HorizontalListView;->mLastSelectImageListItem:Landroid/view/View;

    if-eqz p2, :cond_5

    .line 511
    iget-object p2, p0, Lcom/android/camera/ui/HorizontalListView;->mLastSelectImageListItem:Landroid/view/View;

    invoke-virtual {p2, v2}, Landroid/view/View;->setActivated(Z)V

    .line 513
    :cond_5
    iput-object p1, p0, Lcom/android/camera/ui/HorizontalListView;->mLastSelectImageListItem:Landroid/view/View;

    .line 514
    invoke-virtual {p1, v1}, Landroid/view/View;->setActivated(Z)V

    .line 517
    :cond_6
    :goto_0
    return-void
.end method

.method private positionItems(I)V
    .locals 12

    .line 409
    invoke-virtual {p0}, Lcom/android/camera/ui/HorizontalListView;->getChildCount()I

    move-result v0

    if-lez v0, :cond_3

    .line 410
    iget v0, p0, Lcom/android/camera/ui/HorizontalListView;->mDisplayOffset:I

    add-int/2addr v0, p1

    iput v0, p0, Lcom/android/camera/ui/HorizontalListView;->mDisplayOffset:I

    .line 411
    iget p1, p0, Lcom/android/camera/ui/HorizontalListView;->mDisplayOffset:I

    .line 412
    invoke-direct {p0}, Lcom/android/camera/ui/HorizontalListView;->getChildWidth()I

    move-result v0

    .line 413
    invoke-virtual {p0}, Lcom/android/camera/ui/HorizontalListView;->getHeight()I

    move-result v1

    .line 414
    iget v2, p0, Lcom/android/camera/ui/HorizontalListView;->mPresetWidth:I

    div-int/lit8 v2, v2, 0x2

    .line 415
    iget v3, p0, Lcom/android/camera/ui/HorizontalListView;->mLeftViewIndex:I

    const/4 v4, 0x1

    add-int/2addr v3, v4

    .line 416
    const/4 v5, 0x0

    move v6, v3

    move v3, p1

    move p1, v5

    :goto_0
    invoke-virtual {p0}, Lcom/android/camera/ui/HorizontalListView;->getChildCount()I

    move-result v7

    if-ge p1, v7, :cond_3

    .line 417
    invoke-virtual {p0, p1}, Lcom/android/camera/ui/HorizontalListView;->getChildAt(I)Landroid/view/View;

    move-result-object v7

    .line 418
    invoke-virtual {v7}, Landroid/view/View;->getLeft()I

    move-result v8

    if-ge v8, v2, :cond_0

    invoke-virtual {v7}, Landroid/view/View;->getRight()I

    move-result v8

    if-le v8, v2, :cond_0

    .line 419
    move v8, v4

    goto :goto_1

    .line 418
    :cond_0
    nop

    .line 419
    move v8, v5

    :goto_1
    add-int v9, v3, v0

    invoke-virtual {v7, v3, v5, v9, v1}, Landroid/view/View;->layout(IIII)V

    .line 420
    if-ge v3, v2, :cond_1

    if-le v9, v2, :cond_1

    .line 424
    move v3, v4

    goto :goto_2

    .line 420
    :cond_1
    nop

    .line 424
    move v3, v5

    :goto_2
    invoke-virtual {v7, v3}, Landroid/view/View;->setActivated(Z)V

    .line 425
    iget-boolean v10, p0, Lcom/android/camera/ui/HorizontalListView;->mSelectCenter:Z

    if-eqz v10, :cond_2

    if-eqz v3, :cond_2

    if-nez v8, :cond_2

    .line 426
    invoke-direct {p0, v6}, Lcom/android/camera/ui/HorizontalListView;->toDataIndex(I)I

    move-result v3

    .line 427
    iget-object v8, p0, Lcom/android/camera/ui/HorizontalListView;->mAdapter:Landroid/widget/ListAdapter;

    invoke-interface {v8, v3}, Landroid/widget/ListAdapter;->getItemId(I)J

    move-result-wide v10

    invoke-direct {p0, v7, v3, v10, v11}, Lcom/android/camera/ui/HorizontalListView;->notifyItemSelect(Landroid/view/View;IJ)V

    .line 429
    :cond_2
    add-int/lit8 v6, v6, 0x1

    .line 430
    nop

    .line 416
    add-int/lit8 p1, p1, 0x1

    move v3, v9

    goto :goto_0

    .line 433
    :cond_3
    return-void
.end method

.method private removeNonVisibleItems(I)V
    .locals 5

    .line 375
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/camera/ui/HorizontalListView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 376
    nop

    .line 377
    move v2, v0

    :goto_0
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Landroid/view/View;->getRight()I

    move-result v3

    add-int/2addr v3, p1

    if-gtz v3, :cond_0

    .line 378
    iget v3, p0, Lcom/android/camera/ui/HorizontalListView;->mDisplayOffset:I

    invoke-direct {p0}, Lcom/android/camera/ui/HorizontalListView;->getChildWidth()I

    move-result v4

    add-int/2addr v3, v4

    iput v3, p0, Lcom/android/camera/ui/HorizontalListView;->mDisplayOffset:I

    .line 379
    invoke-direct {p0, v1}, Lcom/android/camera/ui/HorizontalListView;->cacheChildItem(Landroid/view/View;)V

    .line 380
    iget v1, p0, Lcom/android/camera/ui/HorizontalListView;->mLeftViewIndex:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/android/camera/ui/HorizontalListView;->mLeftViewIndex:I

    .line 381
    add-int/lit8 v2, v2, 0x1

    .line 382
    invoke-virtual {p0, v2}, Lcom/android/camera/ui/HorizontalListView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    goto :goto_0

    .line 384
    :cond_0
    if-lez v2, :cond_1

    .line 385
    sub-int/2addr v2, v0

    invoke-virtual {p0, v0, v2}, Lcom/android/camera/ui/HorizontalListView;->removeViewsInLayout(II)V

    .line 388
    :cond_1
    invoke-virtual {p0}, Lcom/android/camera/ui/HorizontalListView;->getChildCount()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    .line 389
    nop

    .line 390
    invoke-virtual {p0}, Lcom/android/camera/ui/HorizontalListView;->getChildCount()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {p0, v1}, Lcom/android/camera/ui/HorizontalListView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 391
    move v2, v0

    :goto_1
    if-eqz v1, :cond_2

    invoke-virtual {v1}, Landroid/view/View;->getLeft()I

    move-result v3

    add-int/2addr v3, p1

    invoke-virtual {p0}, Lcom/android/camera/ui/HorizontalListView;->getWidth()I

    move-result v4

    if-lt v3, v4, :cond_2

    .line 392
    invoke-direct {p0, v1}, Lcom/android/camera/ui/HorizontalListView;->cacheChildItem(Landroid/view/View;)V

    .line 393
    iget v1, p0, Lcom/android/camera/ui/HorizontalListView;->mRightViewIndex:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lcom/android/camera/ui/HorizontalListView;->mRightViewIndex:I

    .line 394
    add-int/lit8 v2, v2, -0x1

    .line 395
    invoke-virtual {p0, v2}, Lcom/android/camera/ui/HorizontalListView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    goto :goto_1

    .line 397
    :cond_2
    if-le v0, v2, :cond_3

    .line 398
    add-int/lit8 p1, v2, 0x1

    sub-int/2addr v0, v2

    invoke-virtual {p0, p1, v0}, Lcom/android/camera/ui/HorizontalListView;->removeViewsInLayout(II)V

    .line 400
    :cond_3
    return-void
.end method

.method private declared-synchronized reset()V
    .locals 1

    monitor-enter p0

    .line 171
    :try_start_0
    invoke-direct {p0}, Lcom/android/camera/ui/HorizontalListView;->initView()V

    .line 172
    invoke-virtual {p0}, Lcom/android/camera/ui/HorizontalListView;->removeAllViewsInLayout()V

    .line 173
    invoke-virtual {p0}, Lcom/android/camera/ui/HorizontalListView;->requestLayout()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 174
    monitor-exit p0

    return-void

    .line 170
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private toDataIndex(I)I
    .locals 1

    .line 344
    invoke-virtual {p0}, Lcom/android/camera/ui/HorizontalListView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/android/camera/Util;->isLayoutRTL(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 345
    iget-object v0, p0, Lcom/android/camera/ui/HorizontalListView;->mAdapter:Landroid/widget/ListAdapter;

    invoke-interface {v0}, Landroid/widget/ListAdapter;->getCount()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    sub-int/2addr v0, p1

    return v0

    .line 347
    :cond_0
    return p1
.end method

.method private toViewIndex(I)I
    .locals 1

    .line 351
    invoke-virtual {p0}, Lcom/android/camera/ui/HorizontalListView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/android/camera/Util;->isLayoutRTL(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 352
    iget-object v0, p0, Lcom/android/camera/ui/HorizontalListView;->mAdapter:Landroid/widget/ListAdapter;

    invoke-interface {v0}, Landroid/widget/ListAdapter;->getCount()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    sub-int/2addr v0, p1

    return v0

    .line 354
    :cond_0
    return p1
.end method


# virtual methods
.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 3

    .line 449
    invoke-virtual {p0}, Lcom/android/camera/ui/HorizontalListView;->isEnabled()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 450
    return v1

    .line 452
    :cond_0
    invoke-super {p0, p1}, Landroid/widget/AdapterView;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    .line 453
    iget-object v2, p0, Lcom/android/camera/ui/HorizontalListView;->mGesture:Landroid/view/GestureDetector;

    invoke-virtual {v2, p1}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v2

    or-int/2addr v0, v2

    .line 454
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result p1

    const/4 v2, 0x3

    if-eq p1, v2, :cond_1

    packed-switch p1, :pswitch_data_0

    goto :goto_0

    .line 456
    :pswitch_0
    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/android/camera/ui/HorizontalListView;->mTouchDown:Z

    .line 457
    iput-boolean v1, p0, Lcom/android/camera/ui/HorizontalListView;->mBlockNotification:Z

    .line 458
    goto :goto_0

    .line 461
    :cond_1
    :pswitch_1
    iget-object p1, p0, Lcom/android/camera/ui/HorizontalListView;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {p1}, Landroid/widget/Scroller;->isFinished()Z

    move-result p1

    if-eqz p1, :cond_2

    .line 462
    iput-boolean v1, p0, Lcom/android/camera/ui/HorizontalListView;->mIsScrollingPerformed:Z

    .line 463
    invoke-direct {p0}, Lcom/android/camera/ui/HorizontalListView;->justify()V

    .line 465
    :cond_2
    iput-boolean v1, p0, Lcom/android/camera/ui/HorizontalListView;->mTouchDown:Z

    .line 468
    :goto_0
    return v0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public bridge synthetic getAdapter()Landroid/widget/Adapter;
    .locals 1

    .line 24
    invoke-virtual {p0}, Lcom/android/camera/ui/HorizontalListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v0

    return-object v0
.end method

.method public getAdapter()Landroid/widget/ListAdapter;
    .locals 1

    .line 148
    iget-object v0, p0, Lcom/android/camera/ui/HorizontalListView;->mAdapter:Landroid/widget/ListAdapter;

    return-object v0
.end method

.method public getSelectedView()Landroid/view/View;
    .locals 1

    .line 154
    const/4 v0, 0x0

    return-object v0
.end method

.method public isScrolling()Z
    .locals 1

    .line 486
    iget-boolean v0, p0, Lcom/android/camera/ui/HorizontalListView;->mIsScrollingPerformed:Z

    return v0
.end method

.method public isTouchMoveEnable()Z
    .locals 1

    .line 607
    iget-boolean v0, p0, Lcom/android/camera/ui/HorizontalListView;->mTouchMoveEnable:Z

    return v0
.end method

.method protected onDown(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 481
    iget-object p1, p0, Lcom/android/camera/ui/HorizontalListView;->mScroller:Landroid/widget/Scroller;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/widget/Scroller;->forceFinished(Z)V

    .line 482
    return v0
.end method

.method protected onFling(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .locals 9

    .line 472
    monitor-enter p0

    .line 473
    :try_start_0
    iget-object v0, p0, Lcom/android/camera/ui/HorizontalListView;->mScroller:Landroid/widget/Scroller;

    iget v1, p0, Lcom/android/camera/ui/HorizontalListView;->mNextX:I

    const/4 v2, 0x0

    neg-float p1, p3

    float-to-int v3, p1

    const/4 v4, 0x0

    const/4 v5, 0x0

    iget v6, p0, Lcom/android/camera/ui/HorizontalListView;->mMaxX:I

    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-virtual/range {v0 .. v8}, Landroid/widget/Scroller;->fling(IIIIIIII)V

    .line 474
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 475
    invoke-virtual {p0}, Lcom/android/camera/ui/HorizontalListView;->requestLayout()V

    .line 477
    const/4 p1, 0x1

    return p1

    .line 474
    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method protected declared-synchronized onLayout(ZIIII)V
    .locals 0

    monitor-enter p0

    .line 236
    :try_start_0
    invoke-super/range {p0 .. p5}, Landroid/widget/AdapterView;->onLayout(ZIIII)V

    .line 238
    iget-object p1, p0, Lcom/android/camera/ui/HorizontalListView;->mAdapter:Landroid/widget/ListAdapter;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez p1, :cond_0

    .line 239
    monitor-exit p0

    return-void

    .line 242
    :cond_0
    nop

    .line 243
    :try_start_1
    iget-boolean p1, p0, Lcom/android/camera/ui/HorizontalListView;->mDataChanged:Z

    const/4 p2, 0x1

    const/4 p3, 0x0

    if-eqz p1, :cond_1

    .line 244
    iget p1, p0, Lcom/android/camera/ui/HorizontalListView;->mCurrentX:I

    .line 245
    invoke-direct {p0}, Lcom/android/camera/ui/HorizontalListView;->initView()V

    .line 246
    invoke-virtual {p0}, Lcom/android/camera/ui/HorizontalListView;->removeAllViewsInLayout()V

    .line 247
    iput p1, p0, Lcom/android/camera/ui/HorizontalListView;->mNextX:I

    .line 248
    iput-boolean p3, p0, Lcom/android/camera/ui/HorizontalListView;->mDataChanged:Z

    .line 249
    nop

    .line 252
    move p1, p2

    goto :goto_0

    :cond_1
    move p1, p3

    :goto_0
    iget-object p4, p0, Lcom/android/camera/ui/HorizontalListView;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {p4}, Landroid/widget/Scroller;->computeScrollOffset()Z

    move-result p4

    if-eqz p4, :cond_2

    .line 253
    iget-object p4, p0, Lcom/android/camera/ui/HorizontalListView;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {p4}, Landroid/widget/Scroller;->getCurrX()I

    move-result p4

    .line 254
    iput p4, p0, Lcom/android/camera/ui/HorizontalListView;->mNextX:I

    .line 257
    :cond_2
    iget p4, p0, Lcom/android/camera/ui/HorizontalListView;->mNextX:I

    if-gtz p4, :cond_3

    .line 258
    iput p3, p0, Lcom/android/camera/ui/HorizontalListView;->mNextX:I

    .line 259
    iget-object p4, p0, Lcom/android/camera/ui/HorizontalListView;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {p4, p2}, Landroid/widget/Scroller;->forceFinished(Z)V

    .line 261
    :cond_3
    iget p4, p0, Lcom/android/camera/ui/HorizontalListView;->mNextX:I

    iget p5, p0, Lcom/android/camera/ui/HorizontalListView;->mMaxX:I

    if-lt p4, p5, :cond_4

    .line 262
    iget p4, p0, Lcom/android/camera/ui/HorizontalListView;->mMaxX:I

    iput p4, p0, Lcom/android/camera/ui/HorizontalListView;->mNextX:I

    .line 263
    iget-object p4, p0, Lcom/android/camera/ui/HorizontalListView;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {p4, p2}, Landroid/widget/Scroller;->forceFinished(Z)V

    .line 266
    :cond_4
    iget p4, p0, Lcom/android/camera/ui/HorizontalListView;->mCurrentX:I

    iget p5, p0, Lcom/android/camera/ui/HorizontalListView;->mNextX:I

    sub-int/2addr p4, p5

    .line 267
    iget p5, p0, Lcom/android/camera/ui/HorizontalListView;->mNextX:I

    iput p5, p0, Lcom/android/camera/ui/HorizontalListView;->mCurrentX:I

    .line 268
    invoke-direct {p0, p4}, Lcom/android/camera/ui/HorizontalListView;->removeNonVisibleItems(I)V

    .line 269
    invoke-direct {p0, p4}, Lcom/android/camera/ui/HorizontalListView;->fillList(I)V

    .line 270
    invoke-direct {p0, p4}, Lcom/android/camera/ui/HorizontalListView;->positionItems(I)V

    .line 272
    iget-object p4, p0, Lcom/android/camera/ui/HorizontalListView;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {p4}, Landroid/widget/Scroller;->isFinished()Z

    move-result p4

    if-eqz p4, :cond_8

    if-eqz p1, :cond_5

    goto :goto_1

    .line 280
    :cond_5
    invoke-direct {p0}, Lcom/android/camera/ui/HorizontalListView;->loadItems()V

    .line 281
    iget-object p1, p0, Lcom/android/camera/ui/HorizontalListView;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {p1}, Landroid/widget/Scroller;->isFinished()Z

    move-result p1

    if-eqz p1, :cond_9

    iget-boolean p1, p0, Lcom/android/camera/ui/HorizontalListView;->mTouchDown:Z

    if-nez p1, :cond_9

    .line 282
    iput-boolean p3, p0, Lcom/android/camera/ui/HorizontalListView;->mIsScrollingPerformed:Z

    .line 283
    iget-boolean p1, p0, Lcom/android/camera/ui/HorizontalListView;->mSelectCenter:Z

    if-eqz p1, :cond_6

    .line 284
    new-instance p1, Lcom/android/camera/ui/HorizontalListView$3;

    invoke-direct {p1, p0}, Lcom/android/camera/ui/HorizontalListView$3;-><init>(Lcom/android/camera/ui/HorizontalListView;)V

    invoke-virtual {p0, p1}, Lcom/android/camera/ui/HorizontalListView;->post(Ljava/lang/Runnable;)Z

    .line 291
    :cond_6
    iget p1, p0, Lcom/android/camera/ui/HorizontalListView;->mSelectViewIndex:I

    iget p3, p0, Lcom/android/camera/ui/HorizontalListView;->mPreviousSelectViewIndex:I

    if-eq p1, p3, :cond_9

    .line 292
    iget p1, p0, Lcom/android/camera/ui/HorizontalListView;->mSelectViewIndex:I

    iget p3, p0, Lcom/android/camera/ui/HorizontalListView;->mLeftViewIndex:I

    if-le p1, p3, :cond_7

    iget p1, p0, Lcom/android/camera/ui/HorizontalListView;->mSelectViewIndex:I

    iget p3, p0, Lcom/android/camera/ui/HorizontalListView;->mRightViewIndex:I

    if-gt p1, p3, :cond_7

    .line 293
    iget p1, p0, Lcom/android/camera/ui/HorizontalListView;->mSelectViewIndex:I

    invoke-direct {p0, p1}, Lcom/android/camera/ui/HorizontalListView;->toDataIndex(I)I

    move-result p1

    .line 294
    iget p3, p0, Lcom/android/camera/ui/HorizontalListView;->mSelectViewIndex:I

    iget p4, p0, Lcom/android/camera/ui/HorizontalListView;->mLeftViewIndex:I

    sub-int/2addr p3, p4

    sub-int/2addr p3, p2

    invoke-virtual {p0, p3}, Lcom/android/camera/ui/HorizontalListView;->getChildAt(I)Landroid/view/View;

    move-result-object p2

    .line 295
    iget-object p3, p0, Lcom/android/camera/ui/HorizontalListView;->mAdapter:Landroid/widget/ListAdapter;

    invoke-interface {p3, p1}, Landroid/widget/ListAdapter;->getItemId(I)J

    move-result-wide p3

    invoke-direct {p0, p2, p1, p3, p4}, Lcom/android/camera/ui/HorizontalListView;->notifyItemSelect(Landroid/view/View;IJ)V

    .line 297
    :cond_7
    iget p1, p0, Lcom/android/camera/ui/HorizontalListView;->mSelectViewIndex:I

    iput p1, p0, Lcom/android/camera/ui/HorizontalListView;->mPreviousSelectViewIndex:I

    goto :goto_2

    .line 273
    :cond_8
    :goto_1
    new-instance p1, Lcom/android/camera/ui/HorizontalListView$2;

    invoke-direct {p1, p0}, Lcom/android/camera/ui/HorizontalListView$2;-><init>(Lcom/android/camera/ui/HorizontalListView;)V

    invoke-virtual {p0, p1}, Lcom/android/camera/ui/HorizontalListView;->post(Ljava/lang/Runnable;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 301
    :cond_9
    :goto_2
    monitor-exit p0

    return-void

    .line 235
    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized scrollTo(I)V
    .locals 3

    monitor-enter p0

    .line 442
    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p0, Lcom/android/camera/ui/HorizontalListView;->mIsScrollingPerformed:Z

    .line 443
    iget-object v0, p0, Lcom/android/camera/ui/HorizontalListView;->mScroller:Landroid/widget/Scroller;

    iget v1, p0, Lcom/android/camera/ui/HorizontalListView;->mNextX:I

    iget v2, p0, Lcom/android/camera/ui/HorizontalListView;->mNextX:I

    sub-int/2addr p1, v2

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2, p1, v2}, Landroid/widget/Scroller;->startScroll(IIII)V

    .line 444
    invoke-virtual {p0}, Lcom/android/camera/ui/HorizontalListView;->requestLayout()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 445
    monitor-exit p0

    return-void

    .line 441
    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public bridge synthetic setAdapter(Landroid/widget/Adapter;)V
    .locals 0

    .line 24
    check-cast p1, Landroid/widget/ListAdapter;

    invoke-virtual {p0, p1}, Lcom/android/camera/ui/HorizontalListView;->setAdapter(Landroid/widget/ListAdapter;)V

    return-void
.end method

.method public setAdapter(Landroid/widget/ListAdapter;)V
    .locals 2

    .line 159
    iget-object v0, p0, Lcom/android/camera/ui/HorizontalListView;->mAdapter:Landroid/widget/ListAdapter;

    if-eqz v0, :cond_0

    .line 160
    iget-object v0, p0, Lcom/android/camera/ui/HorizontalListView;->mAdapter:Landroid/widget/ListAdapter;

    iget-object v1, p0, Lcom/android/camera/ui/HorizontalListView;->mDataObserver:Landroid/database/DataSetObserver;

    invoke-interface {v0, v1}, Landroid/widget/ListAdapter;->unregisterDataSetObserver(Landroid/database/DataSetObserver;)V

    .line 161
    iget-object v0, p0, Lcom/android/camera/ui/HorizontalListView;->mRemovedViewQueue:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->clear()V

    .line 164
    :cond_0
    iput-object p1, p0, Lcom/android/camera/ui/HorizontalListView;->mAdapter:Landroid/widget/ListAdapter;

    .line 165
    iget-object p1, p0, Lcom/android/camera/ui/HorizontalListView;->mAdapter:Landroid/widget/ListAdapter;

    iget-object v0, p0, Lcom/android/camera/ui/HorizontalListView;->mDataObserver:Landroid/database/DataSetObserver;

    invoke-interface {p1, v0}, Landroid/widget/ListAdapter;->registerDataSetObserver(Landroid/database/DataSetObserver;)V

    .line 167
    invoke-direct {p0}, Lcom/android/camera/ui/HorizontalListView;->reset()V

    .line 168
    return-void
.end method

.method public setItemWidth(I)V
    .locals 1

    .line 69
    iput p1, p0, Lcom/android/camera/ui/HorizontalListView;->mItemWidth:I

    .line 70
    iget-boolean p1, p0, Lcom/android/camera/ui/HorizontalListView;->mSelectCenter:Z

    if-eqz p1, :cond_0

    .line 71
    iget p1, p0, Lcom/android/camera/ui/HorizontalListView;->mPresetWidth:I

    iget v0, p0, Lcom/android/camera/ui/HorizontalListView;->mItemWidth:I

    sub-int/2addr p1, v0

    div-int/lit8 p1, p1, 0x2

    iput p1, p0, Lcom/android/camera/ui/HorizontalListView;->mPaddingWidth:I

    .line 72
    iget p1, p0, Lcom/android/camera/ui/HorizontalListView;->mPaddingWidth:I

    iput p1, p0, Lcom/android/camera/ui/HorizontalListView;->mDisplayOffset:I

    .line 74
    :cond_0
    return-void
.end method

.method public setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V
    .locals 0

    .line 113
    iput-object p1, p0, Lcom/android/camera/ui/HorizontalListView;->mOnItemClicked:Landroid/widget/AdapterView$OnItemClickListener;

    .line 114
    return-void
.end method

.method public setOnItemLongClickListener(Landroid/widget/AdapterView$OnItemLongClickListener;)V
    .locals 0

    .line 118
    iput-object p1, p0, Lcom/android/camera/ui/HorizontalListView;->mOnItemLongClicked:Landroid/widget/AdapterView$OnItemLongClickListener;

    .line 119
    return-void
.end method

.method public setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V
    .locals 0

    .line 108
    iput-object p1, p0, Lcom/android/camera/ui/HorizontalListView;->mOnItemSelected:Landroid/widget/AdapterView$OnItemSelectedListener;

    .line 109
    return-void
.end method

.method public setOnItemSingleTapDownListener(Lcom/android/camera/ui/HorizontalListView$OnSingleTapDownListener;)V
    .locals 0

    .line 122
    iput-object p1, p0, Lcom/android/camera/ui/HorizontalListView;->mOnItemSingleTapDowned:Lcom/android/camera/ui/HorizontalListView$OnSingleTapDownListener;

    .line 124
    return-void
.end method

.method public setPresetWidth(I)V
    .locals 0

    .line 77
    iput p1, p0, Lcom/android/camera/ui/HorizontalListView;->mPresetWidth:I

    .line 78
    return-void
.end method

.method public setSelection(I)V
    .locals 3

    .line 178
    invoke-direct {p0, p1}, Lcom/android/camera/ui/HorizontalListView;->toViewIndex(I)I

    move-result p1

    .line 179
    iget v0, p0, Lcom/android/camera/ui/HorizontalListView;->mSelectViewIndex:I

    if-ne v0, p1, :cond_0

    return-void

    .line 180
    :cond_0
    iget v0, p0, Lcom/android/camera/ui/HorizontalListView;->mSelectViewIndex:I

    iput v0, p0, Lcom/android/camera/ui/HorizontalListView;->mPreviousSelectViewIndex:I

    .line 181
    iput p1, p0, Lcom/android/camera/ui/HorizontalListView;->mSelectViewIndex:I

    .line 182
    invoke-virtual {p0}, Lcom/android/camera/ui/HorizontalListView;->isShown()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 183
    invoke-virtual {p0}, Lcom/android/camera/ui/HorizontalListView;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/android/camera/ActivityBase;

    const/4 v1, 0x6

    invoke-virtual {v0, v1}, Lcom/android/camera/ActivityBase;->playCameraSound(I)V

    .line 186
    :cond_1
    iget v0, p0, Lcom/android/camera/ui/HorizontalListView;->mLeftViewIndex:I

    if-le p1, v0, :cond_2

    iget v0, p0, Lcom/android/camera/ui/HorizontalListView;->mRightViewIndex:I

    if-ge p1, v0, :cond_2

    .line 187
    iget v0, p0, Lcom/android/camera/ui/HorizontalListView;->mLeftViewIndex:I

    sub-int v0, p1, v0

    add-int/lit8 v0, v0, -0x1

    .line 188
    invoke-virtual {p0, v0}, Lcom/android/camera/ui/HorizontalListView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 189
    invoke-direct {p0, p1}, Lcom/android/camera/ui/HorizontalListView;->toDataIndex(I)I

    move-result p1

    .line 190
    iget-object v1, p0, Lcom/android/camera/ui/HorizontalListView;->mAdapter:Landroid/widget/ListAdapter;

    invoke-interface {v1, p1}, Landroid/widget/ListAdapter;->getItemId(I)J

    move-result-wide v1

    invoke-direct {p0, v0, p1, v1, v2}, Lcom/android/camera/ui/HorizontalListView;->notifyItemSelect(Landroid/view/View;IJ)V

    .line 193
    :cond_2
    iget-boolean p1, p0, Lcom/android/camera/ui/HorizontalListView;->mIsScrollingPerformed:Z

    if-nez p1, :cond_3

    .line 194
    invoke-direct {p0}, Lcom/android/camera/ui/HorizontalListView;->justify()V

    .line 196
    :cond_3
    return-void
.end method

.method public setTouchMoveEnable(Z)V
    .locals 0

    .line 611
    iput-boolean p1, p0, Lcom/android/camera/ui/HorizontalListView;->mTouchMoveEnable:Z

    .line 612
    return-void
.end method
