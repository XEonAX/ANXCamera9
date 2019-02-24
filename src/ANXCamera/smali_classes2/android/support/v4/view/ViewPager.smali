.class public Landroid/support/v4/view/ViewPager;
.super Landroid/view/ViewGroup;
.source "ViewPager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v4/view/ViewPager$ViewPositionComparator;,
        Landroid/support/v4/view/ViewPager$LayoutParams;,
        Landroid/support/v4/view/ViewPager$PagerObserver;,
        Landroid/support/v4/view/ViewPager$MyAccessibilityDelegate;,
        Landroid/support/v4/view/ViewPager$SavedState;,
        Landroid/support/v4/view/ViewPager$Decor;,
        Landroid/support/v4/view/ViewPager$OnAdapterChangeListener;,
        Landroid/support/v4/view/ViewPager$PageTransformer;,
        Landroid/support/v4/view/ViewPager$SimpleOnPageChangeListener;,
        Landroid/support/v4/view/ViewPager$OnPageChangeListener;,
        Landroid/support/v4/view/ViewPager$ItemInfo;
    }
.end annotation


# static fields
.field private static final CLOSE_ENOUGH:I = 0x2

.field private static final COMPARATOR:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator<",
            "Landroid/support/v4/view/ViewPager$ItemInfo;",
            ">;"
        }
    .end annotation
.end field

.field private static final DEBUG:Z = false

.field private static final DEFAULT_GUTTER_SIZE:I = 0x10

.field private static final DEFAULT_OFFSCREEN_PAGES:I = 0x1

.field private static final DRAW_ORDER_DEFAULT:I = 0x0

.field private static final DRAW_ORDER_FORWARD:I = 0x1

.field private static final DRAW_ORDER_REVERSE:I = 0x2

.field private static final INVALID_POINTER:I = -0x1

.field private static final LAYOUT_ATTRS:[I

.field private static final MAX_SETTLE_DURATION:I = 0x258

.field private static final MIN_DISTANCE_FOR_FLING:I = 0x19

.field private static final MIN_FLING_VELOCITY:I = 0x190

.field public static final SCROLL_STATE_DRAGGING:I = 0x1

.field public static final SCROLL_STATE_IDLE:I = 0x0

.field public static final SCROLL_STATE_SETTLING:I = 0x2

.field private static final TAG:Ljava/lang/String; = "ViewPager"

.field private static final USE_CACHE:Z = false

.field private static final sInterpolator:Landroid/view/animation/Interpolator;

.field private static final sPositionComparator:Landroid/support/v4/view/ViewPager$ViewPositionComparator;


# instance fields
.field private mActivePointerId:I

.field private mAdapter:Landroid/support/v4/view/PagerAdapter;

.field private mAdapterChangeListener:Landroid/support/v4/view/ViewPager$OnAdapterChangeListener;

.field private mBottomPageBounds:I

.field private mCalledSuper:Z

.field private mChildHeightMeasureSpec:I

.field private mChildWidthMeasureSpec:I

.field private mCloseEnough:I

.field private mCurItem:I

.field private mDecorChildCount:I

.field private mDefaultGutterSize:I

.field private mDrawingOrder:I

.field private mDrawingOrderedChildren:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field private final mEndScrollRunnable:Ljava/lang/Runnable;

.field private mExpectedAdapterCount:I

.field private mFakeDragBeginTime:J

.field private mFakeDragging:Z

.field private mFirstLayout:Z

.field private mFirstOffset:F

.field private mFlingDistance:I

.field private mGutterSize:I

.field private mInLayout:Z

.field private mInitialMotionX:F

.field private mInitialMotionY:F

.field private mInternalPageChangeListener:Landroid/support/v4/view/ViewPager$OnPageChangeListener;

.field private mIsBeingDragged:Z

.field private mIsUnableToDrag:Z

.field private final mItems:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/support/v4/view/ViewPager$ItemInfo;",
            ">;"
        }
    .end annotation
.end field

.field private mLastMotionX:F

.field private mLastMotionY:F

.field private mLastOffset:F

.field private mLeftEdge:Landroid/support/v4/widget/EdgeEffectCompat;

.field private mMarginDrawable:Landroid/graphics/drawable/Drawable;

.field private mMaximumVelocity:I

.field private mMinimumVelocity:I

.field private mNeedCalculatePageOffsets:Z

.field private mObserver:Landroid/support/v4/view/ViewPager$PagerObserver;

.field private mOffscreenPageLimit:I

.field private mOnPageChangeListener:Landroid/support/v4/view/ViewPager$OnPageChangeListener;

.field private mOnPageChangeListeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/support/v4/view/ViewPager$OnPageChangeListener;",
            ">;"
        }
    .end annotation
.end field

.field private mPageMargin:I

.field private mPageTransformer:Landroid/support/v4/view/ViewPager$PageTransformer;

.field private mPopulatePending:Z

.field private mRestoredAdapterState:Landroid/os/Parcelable;

.field private mRestoredClassLoader:Ljava/lang/ClassLoader;

.field private mRestoredCurItem:I

.field private mRightEdge:Landroid/support/v4/widget/EdgeEffectCompat;

.field private mScrollState:I

.field private mScroller:Landroid/widget/Scroller;

.field private mScrollingCacheEnabled:Z

.field private mSetChildrenDrawingOrderEnabled:Ljava/lang/reflect/Method;

.field private final mTempItem:Landroid/support/v4/view/ViewPager$ItemInfo;

.field private final mTempRect:Landroid/graphics/Rect;

.field private mTopPageBounds:I

.field private mTouchSlop:I

.field private mVelocityTracker:Landroid/view/VelocityTracker;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .line 105
    const/4 v0, 0x1

    new-array v0, v0, [I

    const/4 v1, 0x0

    const v2, 0x10100b3

    aput v2, v0, v1

    sput-object v0, Landroid/support/v4/view/ViewPager;->LAYOUT_ATTRS:[I

    .line 123
    new-instance v0, Landroid/support/v4/view/ViewPager$1;

    invoke-direct {v0}, Landroid/support/v4/view/ViewPager$1;-><init>()V

    sput-object v0, Landroid/support/v4/view/ViewPager;->COMPARATOR:Ljava/util/Comparator;

    .line 130
    new-instance v0, Landroid/support/v4/view/ViewPager$2;

    invoke-direct {v0}, Landroid/support/v4/view/ViewPager$2;-><init>()V

    sput-object v0, Landroid/support/v4/view/ViewPager;->sInterpolator:Landroid/view/animation/Interpolator;

    .line 230
    new-instance v0, Landroid/support/v4/view/ViewPager$ViewPositionComparator;

    invoke-direct {v0}, Landroid/support/v4/view/ViewPager$ViewPositionComparator;-><init>()V

    sput-object v0, Landroid/support/v4/view/ViewPager;->sPositionComparator:Landroid/support/v4/view/ViewPager$ViewPositionComparator;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;

    .line 351
    invoke-direct {p0, p1}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;)V

    .line 137
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    .line 138
    new-instance v0, Landroid/support/v4/view/ViewPager$ItemInfo;

    invoke-direct {v0}, Landroid/support/v4/view/ViewPager$ItemInfo;-><init>()V

    iput-object v0, p0, Landroid/support/v4/view/ViewPager;->mTempItem:Landroid/support/v4/view/ViewPager$ItemInfo;

    .line 140
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Landroid/support/v4/view/ViewPager;->mTempRect:Landroid/graphics/Rect;

    .line 144
    const/4 v0, -0x1

    iput v0, p0, Landroid/support/v4/view/ViewPager;->mRestoredCurItem:I

    .line 145
    const/4 v1, 0x0

    iput-object v1, p0, Landroid/support/v4/view/ViewPager;->mRestoredAdapterState:Landroid/os/Parcelable;

    .line 146
    iput-object v1, p0, Landroid/support/v4/view/ViewPager;->mRestoredClassLoader:Ljava/lang/ClassLoader;

    .line 158
    const v1, -0x800001

    iput v1, p0, Landroid/support/v4/view/ViewPager;->mFirstOffset:F

    .line 159
    const v1, 0x7f7fffff    # Float.MAX_VALUE

    iput v1, p0, Landroid/support/v4/view/ViewPager;->mLastOffset:F

    .line 168
    const/4 v1, 0x1

    iput v1, p0, Landroid/support/v4/view/ViewPager;->mOffscreenPageLimit:I

    .line 186
    iput v0, p0, Landroid/support/v4/view/ViewPager;->mActivePointerId:I

    .line 213
    iput-boolean v1, p0, Landroid/support/v4/view/ViewPager;->mFirstLayout:Z

    .line 214
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/v4/view/ViewPager;->mNeedCalculatePageOffsets:Z

    .line 248
    new-instance v1, Landroid/support/v4/view/ViewPager$3;

    invoke-direct {v1, p0}, Landroid/support/v4/view/ViewPager$3;-><init>(Landroid/support/v4/view/ViewPager;)V

    iput-object v1, p0, Landroid/support/v4/view/ViewPager;->mEndScrollRunnable:Ljava/lang/Runnable;

    .line 255
    iput v0, p0, Landroid/support/v4/view/ViewPager;->mScrollState:I

    .line 352
    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->initViewPager()V

    .line 353
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .line 356
    invoke-direct {p0, p1, p2}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 137
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    .line 138
    new-instance v0, Landroid/support/v4/view/ViewPager$ItemInfo;

    invoke-direct {v0}, Landroid/support/v4/view/ViewPager$ItemInfo;-><init>()V

    iput-object v0, p0, Landroid/support/v4/view/ViewPager;->mTempItem:Landroid/support/v4/view/ViewPager$ItemInfo;

    .line 140
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Landroid/support/v4/view/ViewPager;->mTempRect:Landroid/graphics/Rect;

    .line 144
    const/4 v0, -0x1

    iput v0, p0, Landroid/support/v4/view/ViewPager;->mRestoredCurItem:I

    .line 145
    const/4 v1, 0x0

    iput-object v1, p0, Landroid/support/v4/view/ViewPager;->mRestoredAdapterState:Landroid/os/Parcelable;

    .line 146
    iput-object v1, p0, Landroid/support/v4/view/ViewPager;->mRestoredClassLoader:Ljava/lang/ClassLoader;

    .line 158
    const v1, -0x800001

    iput v1, p0, Landroid/support/v4/view/ViewPager;->mFirstOffset:F

    .line 159
    const v1, 0x7f7fffff    # Float.MAX_VALUE

    iput v1, p0, Landroid/support/v4/view/ViewPager;->mLastOffset:F

    .line 168
    const/4 v1, 0x1

    iput v1, p0, Landroid/support/v4/view/ViewPager;->mOffscreenPageLimit:I

    .line 186
    iput v0, p0, Landroid/support/v4/view/ViewPager;->mActivePointerId:I

    .line 213
    iput-boolean v1, p0, Landroid/support/v4/view/ViewPager;->mFirstLayout:Z

    .line 214
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/v4/view/ViewPager;->mNeedCalculatePageOffsets:Z

    .line 248
    new-instance v1, Landroid/support/v4/view/ViewPager$3;

    invoke-direct {v1, p0}, Landroid/support/v4/view/ViewPager$3;-><init>(Landroid/support/v4/view/ViewPager;)V

    iput-object v1, p0, Landroid/support/v4/view/ViewPager;->mEndScrollRunnable:Ljava/lang/Runnable;

    .line 255
    iput v0, p0, Landroid/support/v4/view/ViewPager;->mScrollState:I

    .line 357
    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->initViewPager()V

    .line 358
    return-void
.end method

.method static synthetic access$000(Landroid/support/v4/view/ViewPager;I)V
    .registers 2
    .param p0, "x0"    # Landroid/support/v4/view/ViewPager;
    .param p1, "x1"    # I

    .line 91
    invoke-direct {p0, p1}, Landroid/support/v4/view/ViewPager;->setScrollState(I)V

    return-void
.end method

.method static synthetic access$200(Landroid/support/v4/view/ViewPager;)Landroid/support/v4/view/PagerAdapter;
    .registers 2
    .param p0, "x0"    # Landroid/support/v4/view/ViewPager;

    .line 91
    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    return-object v0
.end method

.method static synthetic access$300(Landroid/support/v4/view/ViewPager;)I
    .registers 2
    .param p0, "x0"    # Landroid/support/v4/view/ViewPager;

    .line 91
    iget v0, p0, Landroid/support/v4/view/ViewPager;->mCurItem:I

    return v0
.end method

.method static synthetic access$400()[I
    .registers 1

    .line 91
    sget-object v0, Landroid/support/v4/view/ViewPager;->LAYOUT_ATTRS:[I

    return-object v0
.end method

.method private calculatePageOffsets(Landroid/support/v4/view/ViewPager$ItemInfo;ILandroid/support/v4/view/ViewPager$ItemInfo;)V
    .registers 15
    .param p1, "curItem"    # Landroid/support/v4/view/ViewPager$ItemInfo;
    .param p2, "curIndex"    # I
    .param p3, "oldCurInfo"    # Landroid/support/v4/view/ViewPager$ItemInfo;

    .line 1160
    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    invoke-virtual {v0}, Landroid/support/v4/view/PagerAdapter;->getCount()I

    move-result v0

    .line 1161
    .local v0, "N":I
    invoke-direct {p0}, Landroid/support/v4/view/ViewPager;->getClientWidth()I

    move-result v1

    .line 1162
    .local v1, "width":I
    if-lez v1, :cond_12

    iget v2, p0, Landroid/support/v4/view/ViewPager;->mPageMargin:I

    int-to-float v2, v2

    int-to-float v3, v1

    div-float/2addr v2, v3

    goto :goto_13

    :cond_12
    const/4 v2, 0x0

    .line 1164
    .local v2, "marginOffset":F
    :goto_13
    if-eqz p3, :cond_b7

    .line 1165
    iget v3, p3, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    .line 1167
    .local v3, "oldCurPosition":I
    iget v4, p1, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    if-ge v3, v4, :cond_6d

    .line 1168
    const/4 v4, 0x0

    .line 1169
    .local v4, "itemIndex":I
    const/4 v5, 0x0

    .line 1170
    .local v5, "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    iget v6, p3, Landroid/support/v4/view/ViewPager$ItemInfo;->offset:F

    iget v7, p3, Landroid/support/v4/view/ViewPager$ItemInfo;->widthFactor:F

    add-float/2addr v6, v7

    add-float/2addr v6, v2

    .line 1171
    .local v6, "offset":F
    add-int/lit8 v7, v3, 0x1

    .line 1172
    .local v7, "pos":I
    :goto_25
    iget v8, p1, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    if-gt v7, v8, :cond_6c

    iget-object v8, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v8

    if-ge v4, v8, :cond_6c

    .line 1173
    iget-object v8, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v8, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    move-object v5, v8

    check-cast v5, Landroid/support/v4/view/ViewPager$ItemInfo;

    .line 1174
    :goto_3a
    iget v8, v5, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    if-le v7, v8, :cond_54

    iget-object v8, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v8

    add-int/lit8 v8, v8, -0x1

    if-ge v4, v8, :cond_54

    .line 1175
    add-int/lit8 v4, v4, 0x1

    .line 1176
    iget-object v8, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v8, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    move-object v5, v8

    check-cast v5, Landroid/support/v4/view/ViewPager$ItemInfo;

    goto :goto_3a

    .line 1178
    :cond_54
    :goto_54
    iget v8, v5, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    if-ge v7, v8, :cond_63

    .line 1181
    iget-object v8, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    invoke-virtual {v8, v7}, Landroid/support/v4/view/PagerAdapter;->getPageWidth(I)F

    move-result v8

    add-float/2addr v8, v2

    add-float/2addr v6, v8

    .line 1182
    add-int/lit8 v7, v7, 0x1

    goto :goto_54

    .line 1184
    :cond_63
    iput v6, v5, Landroid/support/v4/view/ViewPager$ItemInfo;->offset:F

    .line 1185
    iget v8, v5, Landroid/support/v4/view/ViewPager$ItemInfo;->widthFactor:F

    add-float/2addr v8, v2

    add-float/2addr v6, v8

    .line 1172
    add-int/lit8 v7, v7, 0x1

    goto :goto_25

    .line 1187
    .end local v4    # "itemIndex":I
    .end local v5    # "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    .end local v6    # "offset":F
    .end local v7    # "pos":I
    :cond_6c
    goto :goto_b7

    :cond_6d
    iget v4, p1, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    if-le v3, v4, :cond_b7

    .line 1188
    iget-object v4, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    .line 1189
    .restart local v4    # "itemIndex":I
    const/4 v5, 0x0

    .line 1190
    .restart local v5    # "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    iget v6, p3, Landroid/support/v4/view/ViewPager$ItemInfo;->offset:F

    .line 1191
    .restart local v6    # "offset":F
    add-int/lit8 v7, v3, -0x1

    .line 1192
    .restart local v7    # "pos":I
    :goto_7e
    iget v8, p1, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    if-lt v7, v8, :cond_b7

    if-ltz v4, :cond_b7

    .line 1193
    iget-object v8, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v8, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    move-object v5, v8

    check-cast v5, Landroid/support/v4/view/ViewPager$ItemInfo;

    .line 1194
    :goto_8d
    iget v8, v5, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    if-ge v7, v8, :cond_9f

    if-lez v4, :cond_9f

    .line 1195
    add-int/lit8 v4, v4, -0x1

    .line 1196
    iget-object v8, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v8, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    move-object v5, v8

    check-cast v5, Landroid/support/v4/view/ViewPager$ItemInfo;

    goto :goto_8d

    .line 1198
    :cond_9f
    :goto_9f
    iget v8, v5, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    if-le v7, v8, :cond_ae

    .line 1201
    iget-object v8, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    invoke-virtual {v8, v7}, Landroid/support/v4/view/PagerAdapter;->getPageWidth(I)F

    move-result v8

    add-float/2addr v8, v2

    sub-float/2addr v6, v8

    .line 1202
    add-int/lit8 v7, v7, -0x1

    goto :goto_9f

    .line 1204
    :cond_ae
    iget v8, v5, Landroid/support/v4/view/ViewPager$ItemInfo;->widthFactor:F

    add-float/2addr v8, v2

    sub-float/2addr v6, v8

    .line 1205
    iput v6, v5, Landroid/support/v4/view/ViewPager$ItemInfo;->offset:F

    .line 1192
    add-int/lit8 v7, v7, -0x1

    goto :goto_7e

    .line 1211
    .end local v3    # "oldCurPosition":I
    .end local v4    # "itemIndex":I
    .end local v5    # "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    .end local v6    # "offset":F
    .end local v7    # "pos":I
    :cond_b7
    :goto_b7
    iget-object v3, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    .line 1212
    .local v3, "itemCount":I
    iget v4, p1, Landroid/support/v4/view/ViewPager$ItemInfo;->offset:F

    .line 1213
    .local v4, "offset":F
    iget v5, p1, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    add-int/lit8 v5, v5, -0x1

    .line 1214
    .local v5, "pos":I
    iget v6, p1, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    if-nez v6, :cond_ca

    iget v6, p1, Landroid/support/v4/view/ViewPager$ItemInfo;->offset:F

    goto :goto_cd

    :cond_ca
    const v6, -0x800001

    :goto_cd
    iput v6, p0, Landroid/support/v4/view/ViewPager;->mFirstOffset:F

    .line 1215
    iget v6, p1, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    add-int/lit8 v7, v0, -0x1

    const/high16 v8, 0x3f800000    # 1.0f

    if-ne v6, v7, :cond_de

    iget v6, p1, Landroid/support/v4/view/ViewPager$ItemInfo;->offset:F

    iget v7, p1, Landroid/support/v4/view/ViewPager$ItemInfo;->widthFactor:F

    add-float/2addr v6, v7

    sub-float/2addr v6, v8

    goto :goto_e1

    :cond_de
    const v6, 0x7f7fffff    # Float.MAX_VALUE

    :goto_e1
    iput v6, p0, Landroid/support/v4/view/ViewPager;->mLastOffset:F

    .line 1218
    add-int/lit8 v6, p2, -0x1

    .local v6, "i":I
    :goto_e5
    if-ltz v6, :cond_110

    .line 1219
    iget-object v7, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v7, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/support/v4/view/ViewPager$ItemInfo;

    .line 1220
    .local v7, "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    :goto_ef
    iget v9, v7, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    if-le v5, v9, :cond_ff

    .line 1221
    iget-object v9, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    add-int/lit8 v10, v5, -0x1

    .local v10, "pos":I
    invoke-virtual {v9, v5}, Landroid/support/v4/view/PagerAdapter;->getPageWidth(I)F

    move-result v5

    .end local v5    # "pos":I
    add-float/2addr v5, v2

    sub-float/2addr v4, v5

    .line 1219
    move v5, v10

    goto :goto_ef

    .line 1223
    .end local v10    # "pos":I
    .restart local v5    # "pos":I
    :cond_ff
    iget v9, v7, Landroid/support/v4/view/ViewPager$ItemInfo;->widthFactor:F

    add-float/2addr v9, v2

    sub-float/2addr v4, v9

    .line 1224
    iput v4, v7, Landroid/support/v4/view/ViewPager$ItemInfo;->offset:F

    .line 1225
    iget v9, v7, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    if-nez v9, :cond_10b

    iput v4, p0, Landroid/support/v4/view/ViewPager;->mFirstOffset:F

    .line 1218
    .end local v7    # "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    :cond_10b
    add-int/lit8 v6, v6, -0x1

    add-int/lit8 v5, v5, -0x1

    goto :goto_e5

    .line 1227
    .end local v6    # "i":I
    :cond_110
    iget v6, p1, Landroid/support/v4/view/ViewPager$ItemInfo;->offset:F

    iget v7, p1, Landroid/support/v4/view/ViewPager$ItemInfo;->widthFactor:F

    add-float/2addr v6, v7

    add-float/2addr v6, v2

    .line 1228
    .end local v4    # "offset":F
    .local v6, "offset":F
    iget v4, p1, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    add-int/lit8 v4, v4, 0x1

    .line 1230
    .end local v5    # "pos":I
    .local v4, "pos":I
    add-int/lit8 v5, p2, 0x1

    .local v5, "i":I
    :goto_11c
    if-ge v5, v3, :cond_14d

    .line 1231
    iget-object v7, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v7, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/support/v4/view/ViewPager$ItemInfo;

    .line 1232
    .restart local v7    # "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    :goto_126
    iget v9, v7, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    if-ge v4, v9, :cond_136

    .line 1233
    iget-object v9, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    add-int/lit8 v10, v4, 0x1

    .restart local v10    # "pos":I
    invoke-virtual {v9, v4}, Landroid/support/v4/view/PagerAdapter;->getPageWidth(I)F

    move-result v4

    .end local v4    # "pos":I
    add-float/2addr v4, v2

    add-float/2addr v6, v4

    .line 1231
    move v4, v10

    goto :goto_126

    .line 1235
    .end local v10    # "pos":I
    .restart local v4    # "pos":I
    :cond_136
    iget v9, v7, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    add-int/lit8 v10, v0, -0x1

    if-ne v9, v10, :cond_142

    .line 1236
    iget v9, v7, Landroid/support/v4/view/ViewPager$ItemInfo;->widthFactor:F

    add-float/2addr v9, v6

    sub-float/2addr v9, v8

    iput v9, p0, Landroid/support/v4/view/ViewPager;->mLastOffset:F

    .line 1238
    :cond_142
    iput v6, v7, Landroid/support/v4/view/ViewPager$ItemInfo;->offset:F

    .line 1239
    iget v9, v7, Landroid/support/v4/view/ViewPager$ItemInfo;->widthFactor:F

    add-float/2addr v9, v2

    add-float/2addr v6, v9

    .line 1230
    .end local v7    # "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    add-int/lit8 v5, v5, 0x1

    add-int/lit8 v4, v4, 0x1

    goto :goto_11c

    .line 1242
    .end local v5    # "i":I
    :cond_14d
    const/4 v5, 0x0

    iput-boolean v5, p0, Landroid/support/v4/view/ViewPager;->mNeedCalculatePageOffsets:Z

    .line 1243
    return-void
.end method

.method private completeScroll(Z)V
    .registers 8
    .param p1, "postEvents"    # Z

    .line 1821
    iget v0, p0, Landroid/support/v4/view/ViewPager;->mScrollState:I

    const/4 v1, 0x0

    const/4 v2, 0x2

    if-ne v0, v2, :cond_8

    const/4 v0, 0x1

    goto :goto_9

    :cond_8
    move v0, v1

    .line 1822
    .local v0, "needPopulate":Z
    :goto_9
    if-eqz v0, :cond_33

    .line 1824
    invoke-direct {p0, v1}, Landroid/support/v4/view/ViewPager;->setScrollingCacheEnabled(Z)V

    .line 1825
    iget-object v2, p0, Landroid/support/v4/view/ViewPager;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v2}, Landroid/widget/Scroller;->abortAnimation()V

    .line 1826
    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getScrollX()I

    move-result v2

    .line 1827
    .local v2, "oldX":I
    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getScrollY()I

    move-result v3

    .line 1828
    .local v3, "oldY":I
    iget-object v4, p0, Landroid/support/v4/view/ViewPager;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v4}, Landroid/widget/Scroller;->getCurrX()I

    move-result v4

    .line 1829
    .local v4, "x":I
    iget-object v5, p0, Landroid/support/v4/view/ViewPager;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v5}, Landroid/widget/Scroller;->getCurrY()I

    move-result v5

    .line 1830
    .local v5, "y":I
    if-ne v2, v4, :cond_2b

    if-eq v3, v5, :cond_33

    .line 1831
    :cond_2b
    invoke-virtual {p0, v4, v5}, Landroid/support/v4/view/ViewPager;->scrollTo(II)V

    .line 1832
    if-eq v4, v2, :cond_33

    .line 1833
    invoke-direct {p0, v4}, Landroid/support/v4/view/ViewPager;->pageScrolled(I)Z

    .line 1837
    .end local v2    # "oldX":I
    .end local v3    # "oldY":I
    .end local v4    # "x":I
    .end local v5    # "y":I
    :cond_33
    iput-boolean v1, p0, Landroid/support/v4/view/ViewPager;->mPopulatePending:Z

    .line 1838
    move v2, v0

    move v0, v1

    .local v0, "i":I
    .local v2, "needPopulate":Z
    :goto_37
    iget-object v3, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v0, v3, :cond_51

    .line 1839
    iget-object v3, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/support/v4/view/ViewPager$ItemInfo;

    .line 1840
    .local v3, "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    iget-boolean v4, v3, Landroid/support/v4/view/ViewPager$ItemInfo;->scrolling:Z

    if-eqz v4, :cond_4e

    .line 1841
    const/4 v2, 0x1

    .line 1842
    iput-boolean v1, v3, Landroid/support/v4/view/ViewPager$ItemInfo;->scrolling:Z

    .line 1838
    .end local v3    # "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    :cond_4e
    add-int/lit8 v0, v0, 0x1

    goto :goto_37

    .line 1845
    .end local v0    # "i":I
    :cond_51
    if-eqz v2, :cond_60

    .line 1846
    if-eqz p1, :cond_5b

    .line 1847
    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mEndScrollRunnable:Ljava/lang/Runnable;

    invoke-static {p0, v0}, Landroid/support/v4/view/ViewCompat;->postOnAnimation(Landroid/view/View;Ljava/lang/Runnable;)V

    goto :goto_60

    .line 1849
    :cond_5b
    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mEndScrollRunnable:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 1852
    :cond_60
    :goto_60
    return-void
.end method

.method private determineTargetPage(IFII)I
    .registers 10
    .param p1, "currentPage"    # I
    .param p2, "pageOffset"    # F
    .param p3, "velocity"    # I
    .param p4, "deltaX"    # I

    .line 2239
    invoke-static {p4}, Ljava/lang/Math;->abs(I)I

    move-result v0

    iget v1, p0, Landroid/support/v4/view/ViewPager;->mFlingDistance:I

    if-le v0, v1, :cond_17

    invoke-static {p3}, Ljava/lang/Math;->abs(I)I

    move-result v0

    iget v1, p0, Landroid/support/v4/view/ViewPager;->mMinimumVelocity:I

    if-le v0, v1, :cond_17

    .line 2240
    if-lez p3, :cond_14

    move v0, p1

    goto :goto_16

    :cond_14
    add-int/lit8 v0, p1, 0x1

    .local v0, "targetPage":I
    :goto_16
    goto :goto_26

    .line 2242
    .end local v0    # "targetPage":I
    :cond_17
    iget v0, p0, Landroid/support/v4/view/ViewPager;->mCurItem:I

    if-lt p1, v0, :cond_1f

    const v0, 0x3ecccccd    # 0.4f

    goto :goto_22

    :cond_1f
    const v0, 0x3f19999a    # 0.6f

    .line 2243
    .local v0, "truncator":F
    :goto_22
    int-to-float v1, p1

    add-float/2addr v1, p2

    add-float/2addr v1, v0

    float-to-int v0, v1

    .line 2246
    .local v0, "targetPage":I
    :goto_26
    iget-object v1, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_53

    .line 2247
    iget-object v1, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/support/v4/view/ViewPager$ItemInfo;

    .line 2248
    .local v1, "firstItem":Landroid/support/v4/view/ViewPager$ItemInfo;
    iget-object v2, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    iget-object v3, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/v4/view/ViewPager$ItemInfo;

    .line 2251
    .local v2, "lastItem":Landroid/support/v4/view/ViewPager$ItemInfo;
    iget v3, v1, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    iget v4, v2, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    invoke-static {v0, v4}, Ljava/lang/Math;->min(II)I

    move-result v4

    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 2254
    .end local v1    # "firstItem":Landroid/support/v4/view/ViewPager$ItemInfo;
    .end local v2    # "lastItem":Landroid/support/v4/view/ViewPager$ItemInfo;
    :cond_53
    return v0
.end method

.method private dispatchOnPageScrolled(IFI)V
    .registers 7
    .param p1, "position"    # I
    .param p2, "offset"    # F
    .param p3, "offsetPixels"    # I

    .line 1770
    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mOnPageChangeListener:Landroid/support/v4/view/ViewPager$OnPageChangeListener;

    if-eqz v0, :cond_9

    .line 1771
    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mOnPageChangeListener:Landroid/support/v4/view/ViewPager$OnPageChangeListener;

    invoke-interface {v0, p1, p2, p3}, Landroid/support/v4/view/ViewPager$OnPageChangeListener;->onPageScrolled(IFI)V

    .line 1773
    :cond_9
    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mOnPageChangeListeners:Ljava/util/List;

    if-eqz v0, :cond_26

    .line 1774
    const/4 v0, 0x0

    .local v0, "i":I
    iget-object v1, p0, Landroid/support/v4/view/ViewPager;->mOnPageChangeListeners:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    .local v1, "z":I
    :goto_14
    if-ge v0, v1, :cond_26

    .line 1775
    iget-object v2, p0, Landroid/support/v4/view/ViewPager;->mOnPageChangeListeners:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/v4/view/ViewPager$OnPageChangeListener;

    .line 1776
    .local v2, "listener":Landroid/support/v4/view/ViewPager$OnPageChangeListener;
    if-eqz v2, :cond_23

    .line 1777
    invoke-interface {v2, p1, p2, p3}, Landroid/support/v4/view/ViewPager$OnPageChangeListener;->onPageScrolled(IFI)V

    .line 1774
    .end local v2    # "listener":Landroid/support/v4/view/ViewPager$OnPageChangeListener;
    :cond_23
    add-int/lit8 v0, v0, 0x1

    goto :goto_14

    .line 1781
    .end local v0    # "i":I
    .end local v1    # "z":I
    :cond_26
    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mInternalPageChangeListener:Landroid/support/v4/view/ViewPager$OnPageChangeListener;

    if-eqz v0, :cond_2f

    .line 1782
    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mInternalPageChangeListener:Landroid/support/v4/view/ViewPager$OnPageChangeListener;

    invoke-interface {v0, p1, p2, p3}, Landroid/support/v4/view/ViewPager$OnPageChangeListener;->onPageScrolled(IFI)V

    .line 1784
    :cond_2f
    return-void
.end method

.method private dispatchOnPageSelected(I)V
    .registers 5
    .param p1, "position"    # I

    .line 1787
    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mOnPageChangeListener:Landroid/support/v4/view/ViewPager$OnPageChangeListener;

    if-eqz v0, :cond_9

    .line 1788
    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mOnPageChangeListener:Landroid/support/v4/view/ViewPager$OnPageChangeListener;

    invoke-interface {v0, p1}, Landroid/support/v4/view/ViewPager$OnPageChangeListener;->onPageSelected(I)V

    .line 1790
    :cond_9
    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mOnPageChangeListeners:Ljava/util/List;

    if-eqz v0, :cond_26

    .line 1791
    const/4 v0, 0x0

    .local v0, "i":I
    iget-object v1, p0, Landroid/support/v4/view/ViewPager;->mOnPageChangeListeners:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    .local v1, "z":I
    :goto_14
    if-ge v0, v1, :cond_26

    .line 1792
    iget-object v2, p0, Landroid/support/v4/view/ViewPager;->mOnPageChangeListeners:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/v4/view/ViewPager$OnPageChangeListener;

    .line 1793
    .local v2, "listener":Landroid/support/v4/view/ViewPager$OnPageChangeListener;
    if-eqz v2, :cond_23

    .line 1794
    invoke-interface {v2, p1}, Landroid/support/v4/view/ViewPager$OnPageChangeListener;->onPageSelected(I)V

    .line 1791
    .end local v2    # "listener":Landroid/support/v4/view/ViewPager$OnPageChangeListener;
    :cond_23
    add-int/lit8 v0, v0, 0x1

    goto :goto_14

    .line 1798
    .end local v0    # "i":I
    .end local v1    # "z":I
    :cond_26
    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mInternalPageChangeListener:Landroid/support/v4/view/ViewPager$OnPageChangeListener;

    if-eqz v0, :cond_2f

    .line 1799
    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mInternalPageChangeListener:Landroid/support/v4/view/ViewPager$OnPageChangeListener;

    invoke-interface {v0, p1}, Landroid/support/v4/view/ViewPager$OnPageChangeListener;->onPageSelected(I)V

    .line 1801
    :cond_2f
    return-void
.end method

.method private dispatchOnScrollStateChanged(I)V
    .registers 5
    .param p1, "state"    # I

    .line 1804
    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mOnPageChangeListener:Landroid/support/v4/view/ViewPager$OnPageChangeListener;

    if-eqz v0, :cond_9

    .line 1805
    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mOnPageChangeListener:Landroid/support/v4/view/ViewPager$OnPageChangeListener;

    invoke-interface {v0, p1}, Landroid/support/v4/view/ViewPager$OnPageChangeListener;->onPageScrollStateChanged(I)V

    .line 1807
    :cond_9
    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mOnPageChangeListeners:Ljava/util/List;

    if-eqz v0, :cond_26

    .line 1808
    const/4 v0, 0x0

    .local v0, "i":I
    iget-object v1, p0, Landroid/support/v4/view/ViewPager;->mOnPageChangeListeners:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    .local v1, "z":I
    :goto_14
    if-ge v0, v1, :cond_26

    .line 1809
    iget-object v2, p0, Landroid/support/v4/view/ViewPager;->mOnPageChangeListeners:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/v4/view/ViewPager$OnPageChangeListener;

    .line 1810
    .local v2, "listener":Landroid/support/v4/view/ViewPager$OnPageChangeListener;
    if-eqz v2, :cond_23

    .line 1811
    invoke-interface {v2, p1}, Landroid/support/v4/view/ViewPager$OnPageChangeListener;->onPageScrollStateChanged(I)V

    .line 1808
    .end local v2    # "listener":Landroid/support/v4/view/ViewPager$OnPageChangeListener;
    :cond_23
    add-int/lit8 v0, v0, 0x1

    goto :goto_14

    .line 1815
    .end local v0    # "i":I
    .end local v1    # "z":I
    :cond_26
    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mInternalPageChangeListener:Landroid/support/v4/view/ViewPager$OnPageChangeListener;

    if-eqz v0, :cond_2f

    .line 1816
    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mInternalPageChangeListener:Landroid/support/v4/view/ViewPager$OnPageChangeListener;

    invoke-interface {v0, p1}, Landroid/support/v4/view/ViewPager$OnPageChangeListener;->onPageScrollStateChanged(I)V

    .line 1818
    :cond_2f
    return-void
.end method

.method private enableLayers(Z)V
    .registers 8
    .param p1, "enable"    # Z

    .line 1859
    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getChildCount()I

    move-result v0

    .line 1860
    .local v0, "childCount":I
    const/4 v1, 0x0

    move v2, v1

    .local v2, "i":I
    :goto_6
    if-ge v2, v0, :cond_18

    .line 1861
    if-eqz p1, :cond_c

    const/4 v3, 0x2

    goto :goto_d

    :cond_c
    move v3, v1

    .line 1863
    .local v3, "layerType":I
    :goto_d
    invoke-virtual {p0, v2}, Landroid/support/v4/view/ViewPager;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    const/4 v5, 0x0

    invoke-static {v4, v3, v5}, Landroid/support/v4/view/ViewCompat;->setLayerType(Landroid/view/View;ILandroid/graphics/Paint;)V

    .line 1860
    .end local v3    # "layerType":I
    add-int/lit8 v2, v2, 0x1

    goto :goto_6

    .line 1865
    .end local v2    # "i":I
    :cond_18
    return-void
.end method

.method private endDrag()V
    .registers 2

    .line 2487
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/v4/view/ViewPager;->mIsBeingDragged:Z

    .line 2488
    iput-boolean v0, p0, Landroid/support/v4/view/ViewPager;->mIsUnableToDrag:Z

    .line 2490
    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-eqz v0, :cond_11

    .line 2491
    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v0}, Landroid/view/VelocityTracker;->recycle()V

    .line 2492
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/support/v4/view/ViewPager;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 2494
    :cond_11
    return-void
.end method

.method private getChildRectInPagerCoordinates(Landroid/graphics/Rect;Landroid/view/View;)Landroid/graphics/Rect;
    .registers 7
    .param p1, "outRect"    # Landroid/graphics/Rect;
    .param p2, "child"    # Landroid/view/View;

    .line 2668
    if-nez p1, :cond_8

    .line 2669
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    move-object p1, v0

    .line 2671
    :cond_8
    if-nez p2, :cond_f

    .line 2672
    const/4 v0, 0x0

    invoke-virtual {p1, v0, v0, v0, v0}, Landroid/graphics/Rect;->set(IIII)V

    .line 2673
    return-object p1

    .line 2675
    :cond_f
    invoke-virtual {p2}, Landroid/view/View;->getLeft()I

    move-result v0

    iput v0, p1, Landroid/graphics/Rect;->left:I

    .line 2676
    invoke-virtual {p2}, Landroid/view/View;->getRight()I

    move-result v0

    iput v0, p1, Landroid/graphics/Rect;->right:I

    .line 2677
    invoke-virtual {p2}, Landroid/view/View;->getTop()I

    move-result v0

    iput v0, p1, Landroid/graphics/Rect;->top:I

    .line 2678
    invoke-virtual {p2}, Landroid/view/View;->getBottom()I

    move-result v0

    iput v0, p1, Landroid/graphics/Rect;->bottom:I

    .line 2680
    invoke-virtual {p2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    .line 2681
    .local v0, "parent":Landroid/view/ViewParent;
    :goto_2b
    instance-of v1, v0, Landroid/view/ViewGroup;

    if-eqz v1, :cond_5d

    if-eq v0, p0, :cond_5d

    .line 2682
    move-object v1, v0

    check-cast v1, Landroid/view/ViewGroup;

    .line 2683
    .local v1, "group":Landroid/view/ViewGroup;
    iget v2, p1, Landroid/graphics/Rect;->left:I

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getLeft()I

    move-result v3

    add-int/2addr v2, v3

    iput v2, p1, Landroid/graphics/Rect;->left:I

    .line 2684
    iget v2, p1, Landroid/graphics/Rect;->right:I

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getRight()I

    move-result v3

    add-int/2addr v2, v3

    iput v2, p1, Landroid/graphics/Rect;->right:I

    .line 2685
    iget v2, p1, Landroid/graphics/Rect;->top:I

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getTop()I

    move-result v3

    add-int/2addr v2, v3

    iput v2, p1, Landroid/graphics/Rect;->top:I

    .line 2686
    iget v2, p1, Landroid/graphics/Rect;->bottom:I

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getBottom()I

    move-result v3

    add-int/2addr v2, v3

    iput v2, p1, Landroid/graphics/Rect;->bottom:I

    .line 2688
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    .line 2689
    .end local v1    # "group":Landroid/view/ViewGroup;
    goto :goto_2b

    .line 2690
    :cond_5d
    return-object p1
.end method

.method private getClientWidth()I
    .registers 3

    .line 483
    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getMeasuredWidth()I

    move-result v0

    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getPaddingLeft()I

    move-result v1

    sub-int/2addr v0, v1

    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getPaddingRight()I

    move-result v1

    sub-int/2addr v0, v1

    return v0
.end method

.method private infoForCurrentScrollPosition()Landroid/support/v4/view/ViewPager$ItemInfo;
    .registers 15

    .line 2196
    invoke-direct {p0}, Landroid/support/v4/view/ViewPager;->getClientWidth()I

    move-result v0

    .line 2197
    .local v0, "width":I
    const/4 v1, 0x0

    if-lez v0, :cond_f

    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getScrollX()I

    move-result v2

    int-to-float v2, v2

    int-to-float v3, v0

    div-float/2addr v2, v3

    goto :goto_10

    :cond_f
    move v2, v1

    .line 2198
    .local v2, "scrollOffset":F
    :goto_10
    if-lez v0, :cond_18

    iget v1, p0, Landroid/support/v4/view/ViewPager;->mPageMargin:I

    int-to-float v1, v1

    int-to-float v3, v0

    div-float/2addr v1, v3

    nop

    .line 2199
    .local v1, "marginOffset":F
    :cond_18
    const/4 v3, -0x1

    .line 2200
    .local v3, "lastPos":I
    const/4 v4, 0x0

    .line 2201
    .local v4, "lastOffset":F
    const/4 v5, 0x0

    .line 2202
    .local v5, "lastWidth":F
    const/4 v6, 0x1

    .line 2204
    .local v6, "first":Z
    const/4 v7, 0x0

    .line 2205
    .local v7, "lastItem":Landroid/support/v4/view/ViewPager$ItemInfo;
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_1e
    iget-object v9, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v9

    if-ge v8, v9, :cond_76

    .line 2206
    iget-object v9, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v9, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/support/v4/view/ViewPager$ItemInfo;

    .line 2208
    .local v9, "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    if-nez v6, :cond_4d

    iget v10, v9, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    add-int/lit8 v11, v3, 0x1

    if-eq v10, v11, :cond_4d

    .line 2210
    iget-object v9, p0, Landroid/support/v4/view/ViewPager;->mTempItem:Landroid/support/v4/view/ViewPager$ItemInfo;

    .line 2211
    add-float v10, v4, v5

    add-float/2addr v10, v1

    iput v10, v9, Landroid/support/v4/view/ViewPager$ItemInfo;->offset:F

    .line 2212
    add-int/lit8 v10, v3, 0x1

    iput v10, v9, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    .line 2213
    iget-object v10, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    iget v11, v9, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    invoke-virtual {v10, v11}, Landroid/support/v4/view/PagerAdapter;->getPageWidth(I)F

    move-result v10

    iput v10, v9, Landroid/support/v4/view/ViewPager$ItemInfo;->widthFactor:F

    .line 2214
    add-int/lit8 v8, v8, -0x1

    .line 2216
    :cond_4d
    iget v10, v9, Landroid/support/v4/view/ViewPager$ItemInfo;->offset:F

    .line 2218
    .local v10, "offset":F
    move v11, v10

    .line 2219
    .local v11, "leftBound":F
    iget v12, v9, Landroid/support/v4/view/ViewPager$ItemInfo;->widthFactor:F

    add-float/2addr v12, v10

    add-float/2addr v12, v1

    .line 2220
    .local v12, "rightBound":F
    if-nez v6, :cond_5c

    cmpl-float v13, v2, v11

    if-ltz v13, :cond_5b

    goto :goto_5c

    .line 2225
    :cond_5b
    return-object v7

    .line 2221
    :cond_5c
    :goto_5c
    cmpg-float v13, v2, v12

    if-ltz v13, :cond_75

    iget-object v13, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v13}, Ljava/util/ArrayList;->size()I

    move-result v13

    add-int/lit8 v13, v13, -0x1

    if-ne v8, v13, :cond_6b

    goto :goto_75

    .line 2227
    :cond_6b
    const/4 v6, 0x0

    .line 2228
    iget v3, v9, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    .line 2229
    move v4, v10

    .line 2230
    iget v5, v9, Landroid/support/v4/view/ViewPager$ItemInfo;->widthFactor:F

    .line 2231
    move-object v7, v9

    .line 2205
    .end local v9    # "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    .end local v10    # "offset":F
    .end local v11    # "leftBound":F
    .end local v12    # "rightBound":F
    add-int/lit8 v8, v8, 0x1

    goto :goto_1e

    .line 2222
    .restart local v9    # "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    .restart local v10    # "offset":F
    .restart local v11    # "leftBound":F
    .restart local v12    # "rightBound":F
    :cond_75
    :goto_75
    return-object v9

    .line 2234
    .end local v8    # "i":I
    .end local v9    # "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    .end local v10    # "offset":F
    .end local v11    # "leftBound":F
    .end local v12    # "rightBound":F
    :cond_76
    return-object v7
.end method

.method private isGutterDrag(FF)Z
    .registers 6
    .param p1, "x"    # F
    .param p2, "dx"    # F

    .line 1855
    iget v0, p0, Landroid/support/v4/view/ViewPager;->mGutterSize:I

    int-to-float v0, v0

    cmpg-float v0, p1, v0

    const/4 v1, 0x0

    if-gez v0, :cond_c

    cmpl-float v0, p2, v1

    if-gtz v0, :cond_1c

    :cond_c
    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getWidth()I

    move-result v0

    iget v2, p0, Landroid/support/v4/view/ViewPager;->mGutterSize:I

    sub-int/2addr v0, v2

    int-to-float v0, v0

    cmpl-float v0, p1, v0

    if-lez v0, :cond_1e

    cmpg-float v0, p2, v1

    if-gez v0, :cond_1e

    :cond_1c
    const/4 v0, 0x1

    goto :goto_1f

    :cond_1e
    const/4 v0, 0x0

    :goto_1f
    return v0
.end method

.method private onSecondaryPointerUp(Landroid/view/MotionEvent;)V
    .registers 6
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .line 2472
    invoke-static {p1}, Landroid/support/v4/view/MotionEventCompat;->getActionIndex(Landroid/view/MotionEvent;)I

    move-result v0

    .line 2473
    .local v0, "pointerIndex":I
    invoke-static {p1, v0}, Landroid/support/v4/view/MotionEventCompat;->getPointerId(Landroid/view/MotionEvent;I)I

    move-result v1

    .line 2474
    .local v1, "pointerId":I
    iget v2, p0, Landroid/support/v4/view/ViewPager;->mActivePointerId:I

    if-ne v1, v2, :cond_26

    .line 2477
    if-nez v0, :cond_10

    const/4 v2, 0x1

    goto :goto_11

    :cond_10
    const/4 v2, 0x0

    .line 2478
    .local v2, "newPointerIndex":I
    :goto_11
    invoke-static {p1, v2}, Landroid/support/v4/view/MotionEventCompat;->getX(Landroid/view/MotionEvent;I)F

    move-result v3

    iput v3, p0, Landroid/support/v4/view/ViewPager;->mLastMotionX:F

    .line 2479
    invoke-static {p1, v2}, Landroid/support/v4/view/MotionEventCompat;->getPointerId(Landroid/view/MotionEvent;I)I

    move-result v3

    iput v3, p0, Landroid/support/v4/view/ViewPager;->mActivePointerId:I

    .line 2480
    iget-object v3, p0, Landroid/support/v4/view/ViewPager;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-eqz v3, :cond_26

    .line 2481
    iget-object v3, p0, Landroid/support/v4/view/ViewPager;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v3}, Landroid/view/VelocityTracker;->clear()V

    .line 2484
    .end local v2    # "newPointerIndex":I
    :cond_26
    return-void
.end method

.method private pageScrolled(I)Z
    .registers 11
    .param p1, "xpos"    # I

    .line 1669
    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_1c

    .line 1670
    iput-boolean v1, p0, Landroid/support/v4/view/ViewPager;->mCalledSuper:Z

    .line 1671
    const/4 v0, 0x0

    invoke-virtual {p0, v1, v0, v1}, Landroid/support/v4/view/ViewPager;->onPageScrolled(IFI)V

    .line 1672
    iget-boolean v0, p0, Landroid/support/v4/view/ViewPager;->mCalledSuper:Z

    if-eqz v0, :cond_14

    .line 1676
    return v1

    .line 1673
    :cond_14
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "onPageScrolled did not call superclass implementation"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1678
    :cond_1c
    invoke-direct {p0}, Landroid/support/v4/view/ViewPager;->infoForCurrentScrollPosition()Landroid/support/v4/view/ViewPager$ItemInfo;

    move-result-object v0

    .line 1679
    .local v0, "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    invoke-direct {p0}, Landroid/support/v4/view/ViewPager;->getClientWidth()I

    move-result v2

    .line 1680
    .local v2, "width":I
    iget v3, p0, Landroid/support/v4/view/ViewPager;->mPageMargin:I

    add-int/2addr v3, v2

    .line 1681
    .local v3, "widthWithMargin":I
    iget v4, p0, Landroid/support/v4/view/ViewPager;->mPageMargin:I

    int-to-float v4, v4

    int-to-float v5, v2

    div-float/2addr v4, v5

    .line 1682
    .local v4, "marginOffset":F
    iget v5, v0, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    .line 1683
    .local v5, "currentPage":I
    int-to-float v6, p1

    int-to-float v7, v2

    div-float/2addr v6, v7

    iget v7, v0, Landroid/support/v4/view/ViewPager$ItemInfo;->offset:F

    sub-float/2addr v6, v7

    iget v7, v0, Landroid/support/v4/view/ViewPager$ItemInfo;->widthFactor:F

    add-float/2addr v7, v4

    div-float/2addr v6, v7

    .line 1685
    .local v6, "pageOffset":F
    int-to-float v7, v3

    mul-float/2addr v7, v6

    float-to-int v7, v7

    .line 1687
    .local v7, "offsetPixels":I
    iput-boolean v1, p0, Landroid/support/v4/view/ViewPager;->mCalledSuper:Z

    .line 1688
    invoke-virtual {p0, v5, v6, v7}, Landroid/support/v4/view/ViewPager;->onPageScrolled(IFI)V

    .line 1689
    iget-boolean v1, p0, Landroid/support/v4/view/ViewPager;->mCalledSuper:Z

    if-eqz v1, :cond_46

    .line 1693
    const/4 v1, 0x1

    return v1

    .line 1690
    :cond_46
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v8, "onPageScrolled did not call superclass implementation"

    invoke-direct {v1, v8}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private performDrag(F)Z
    .registers 19
    .param p1, "x"    # F

    move-object/from16 v0, p0

    .line 2145
    move/from16 v1, p1

    const/4 v2, 0x0

    .line 2147
    .local v2, "needsInvalidate":Z
    iget v3, v0, Landroid/support/v4/view/ViewPager;->mLastMotionX:F

    sub-float/2addr v3, v1

    .line 2148
    .local v3, "deltaX":F
    iput v1, v0, Landroid/support/v4/view/ViewPager;->mLastMotionX:F

    .line 2150
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getScrollX()I

    move-result v4

    int-to-float v4, v4

    .line 2151
    .local v4, "oldScrollX":F
    add-float v5, v4, v3

    .line 2152
    .local v5, "scrollX":F
    invoke-direct/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getClientWidth()I

    move-result v6

    .line 2154
    .local v6, "width":I
    int-to-float v7, v6

    iget v8, v0, Landroid/support/v4/view/ViewPager;->mFirstOffset:F

    mul-float/2addr v7, v8

    .line 2155
    .local v7, "leftBound":F
    int-to-float v8, v6

    iget v9, v0, Landroid/support/v4/view/ViewPager;->mLastOffset:F

    mul-float/2addr v8, v9

    .line 2156
    .local v8, "rightBound":F
    const/4 v9, 0x1

    .line 2157
    .local v9, "leftAbsolute":Z
    const/4 v10, 0x1

    .line 2159
    .local v10, "rightAbsolute":Z
    iget-object v11, v0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    const/4 v12, 0x0

    invoke-virtual {v11, v12}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Landroid/support/v4/view/ViewPager$ItemInfo;

    .line 2160
    .local v11, "firstItem":Landroid/support/v4/view/ViewPager$ItemInfo;
    iget-object v12, v0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    iget-object v13, v0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v13}, Ljava/util/ArrayList;->size()I

    move-result v13

    add-int/lit8 v13, v13, -0x1

    invoke-virtual {v12, v13}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Landroid/support/v4/view/ViewPager$ItemInfo;

    .line 2161
    .local v12, "lastItem":Landroid/support/v4/view/ViewPager$ItemInfo;
    iget v13, v11, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    if-eqz v13, :cond_42

    .line 2162
    const/4 v9, 0x0

    .line 2163
    iget v13, v11, Landroid/support/v4/view/ViewPager$ItemInfo;->offset:F

    int-to-float v14, v6

    mul-float v7, v13, v14

    .line 2165
    :cond_42
    iget v13, v12, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    iget-object v14, v0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    invoke-virtual {v14}, Landroid/support/v4/view/PagerAdapter;->getCount()I

    move-result v14

    add-int/lit8 v14, v14, -0x1

    if-eq v13, v14, :cond_54

    .line 2166
    const/4 v10, 0x0

    .line 2167
    iget v13, v12, Landroid/support/v4/view/ViewPager$ItemInfo;->offset:F

    int-to-float v14, v6

    mul-float v8, v13, v14

    .line 2170
    :cond_54
    cmpg-float v13, v5, v7

    if-gez v13, :cond_6b

    .line 2171
    if-eqz v9, :cond_69

    .line 2172
    sub-float v13, v7, v5

    .line 2173
    .local v13, "over":F
    iget-object v14, v0, Landroid/support/v4/view/ViewPager;->mLeftEdge:Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-static {v13}, Ljava/lang/Math;->abs(F)F

    move-result v15

    int-to-float v1, v6

    div-float/2addr v15, v1

    invoke-virtual {v14, v15}, Landroid/support/v4/widget/EdgeEffectCompat;->onPull(F)Z

    move-result v1

    .line 2175
    .end local v2    # "needsInvalidate":Z
    .end local v13    # "over":F
    .local v1, "needsInvalidate":Z
    move v2, v1

    .end local v1    # "needsInvalidate":Z
    .restart local v2    # "needsInvalidate":Z
    :cond_69
    move v5, v7

    goto :goto_81

    .line 2176
    :cond_6b
    cmpl-float v1, v5, v8

    if-lez v1, :cond_81

    .line 2177
    if-eqz v10, :cond_80

    .line 2178
    sub-float v1, v5, v8

    .line 2179
    .local v1, "over":F
    iget-object v13, v0, Landroid/support/v4/view/ViewPager;->mRightEdge:Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v14

    int-to-float v15, v6

    div-float/2addr v14, v15

    invoke-virtual {v13, v14}, Landroid/support/v4/widget/EdgeEffectCompat;->onPull(F)Z

    move-result v1

    .line 2181
    .end local v2    # "needsInvalidate":Z
    .local v1, "needsInvalidate":Z
    move v2, v1

    .end local v1    # "needsInvalidate":Z
    .restart local v2    # "needsInvalidate":Z
    :cond_80
    move v5, v8

    .line 2184
    :cond_81
    :goto_81
    iget v1, v0, Landroid/support/v4/view/ViewPager;->mLastMotionX:F

    float-to-int v13, v5

    int-to-float v13, v13

    sub-float v13, v5, v13

    add-float/2addr v1, v13

    iput v1, v0, Landroid/support/v4/view/ViewPager;->mLastMotionX:F

    .line 2185
    float-to-int v1, v5

    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getScrollY()I

    move-result v13

    invoke-virtual {v0, v1, v13}, Landroid/support/v4/view/ViewPager;->scrollTo(II)V

    .line 2186
    float-to-int v1, v5

    invoke-direct {v0, v1}, Landroid/support/v4/view/ViewPager;->pageScrolled(I)Z

    .line 2188
    return v2
.end method

.method private recomputeScrollPosition(IIII)V
    .registers 22
    .param p1, "width"    # I
    .param p2, "oldWidth"    # I
    .param p3, "margin"    # I
    .param p4, "oldMargin"    # I

    move-object/from16 v0, p0

    move/from16 v1, p1

    .line 1506
    if-lez p2, :cond_66

    iget-object v2, v0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_66

    .line 1507
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getPaddingLeft()I

    move-result v2

    sub-int v2, v1, v2

    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getPaddingRight()I

    move-result v3

    sub-int/2addr v2, v3

    add-int v2, v2, p3

    .line 1508
    .local v2, "widthWithMargin":I
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getPaddingLeft()I

    move-result v4

    sub-int v4, p2, v4

    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getPaddingRight()I

    move-result v5

    sub-int/2addr v4, v5

    add-int v4, v4, p4

    .line 1510
    .local v4, "oldWidthWithMargin":I
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getScrollX()I

    move-result v6

    .line 1511
    .local v6, "xpos":I
    int-to-float v7, v6

    int-to-float v8, v4

    div-float/2addr v7, v8

    .line 1512
    .local v7, "pageOffset":F
    int-to-float v8, v2

    mul-float/2addr v8, v7

    float-to-int v8, v8

    .line 1514
    .local v8, "newOffsetPixels":I
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getScrollY()I

    move-result v9

    invoke-virtual {v0, v8, v9}, Landroid/support/v4/view/ViewPager;->scrollTo(II)V

    .line 1515
    iget-object v9, v0, Landroid/support/v4/view/ViewPager;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v9}, Landroid/widget/Scroller;->isFinished()Z

    move-result v9

    if-nez v9, :cond_65

    .line 1517
    iget-object v9, v0, Landroid/support/v4/view/ViewPager;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v9}, Landroid/widget/Scroller;->getDuration()I

    move-result v9

    iget-object v10, v0, Landroid/support/v4/view/ViewPager;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v10}, Landroid/widget/Scroller;->timePassed()I

    move-result v10

    sub-int v15, v9, v10

    .line 1518
    .local v15, "newDuration":I
    iget v9, v0, Landroid/support/v4/view/ViewPager;->mCurItem:I

    invoke-virtual {v0, v9}, Landroid/support/v4/view/ViewPager;->infoForPosition(I)Landroid/support/v4/view/ViewPager$ItemInfo;

    move-result-object v14

    .line 1519
    .local v14, "targetInfo":Landroid/support/v4/view/ViewPager$ItemInfo;
    iget-object v9, v0, Landroid/support/v4/view/ViewPager;->mScroller:Landroid/widget/Scroller;

    const/4 v11, 0x0

    iget v10, v14, Landroid/support/v4/view/ViewPager$ItemInfo;->offset:F

    int-to-float v12, v1

    mul-float/2addr v10, v12

    float-to-int v12, v10

    const/4 v13, 0x0

    move v10, v8

    move-object/from16 v16, v14

    move v14, v15

    .end local v14    # "targetInfo":Landroid/support/v4/view/ViewPager$ItemInfo;
    .local v16, "targetInfo":Landroid/support/v4/view/ViewPager$ItemInfo;
    invoke-virtual/range {v9 .. v14}, Landroid/widget/Scroller;->startScroll(IIIII)V

    .line 1522
    .end local v2    # "widthWithMargin":I
    .end local v4    # "oldWidthWithMargin":I
    .end local v6    # "xpos":I
    .end local v7    # "pageOffset":F
    .end local v8    # "newOffsetPixels":I
    .end local v15    # "newDuration":I
    .end local v16    # "targetInfo":Landroid/support/v4/view/ViewPager$ItemInfo;
    :cond_65
    goto :goto_97

    .line 1523
    :cond_66
    iget v2, v0, Landroid/support/v4/view/ViewPager;->mCurItem:I

    invoke-virtual {v0, v2}, Landroid/support/v4/view/ViewPager;->infoForPosition(I)Landroid/support/v4/view/ViewPager$ItemInfo;

    move-result-object v2

    .line 1524
    .local v2, "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    if-eqz v2, :cond_77

    iget v4, v2, Landroid/support/v4/view/ViewPager$ItemInfo;->offset:F

    iget v6, v0, Landroid/support/v4/view/ViewPager;->mLastOffset:F

    invoke-static {v4, v6}, Ljava/lang/Math;->min(FF)F

    move-result v4

    goto :goto_78

    :cond_77
    const/4 v4, 0x0

    .line 1525
    .local v4, "scrollOffset":F
    :goto_78
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getPaddingLeft()I

    move-result v6

    sub-int v6, v1, v6

    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getPaddingRight()I

    move-result v7

    sub-int/2addr v6, v7

    int-to-float v6, v6

    mul-float/2addr v6, v4

    float-to-int v6, v6

    .line 1527
    .local v6, "scrollPos":I
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getScrollX()I

    move-result v7

    if-eq v6, v7, :cond_97

    .line 1528
    const/4 v7, 0x0

    invoke-direct {v0, v7}, Landroid/support/v4/view/ViewPager;->completeScroll(Z)V

    .line 1529
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getScrollY()I

    move-result v7

    invoke-virtual {v0, v6, v7}, Landroid/support/v4/view/ViewPager;->scrollTo(II)V

    .line 1532
    .end local v2    # "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    .end local v4    # "scrollOffset":F
    .end local v6    # "scrollPos":I
    :cond_97
    :goto_97
    return-void
.end method

.method private removeNonDecorViews()V
    .registers 5

    .line 459
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_1d

    .line 460
    invoke-virtual {p0, v0}, Landroid/support/v4/view/ViewPager;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 461
    .local v1, "child":Landroid/view/View;
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Landroid/support/v4/view/ViewPager$LayoutParams;

    .line 462
    .local v2, "lp":Landroid/support/v4/view/ViewPager$LayoutParams;
    iget-boolean v3, v2, Landroid/support/v4/view/ViewPager$LayoutParams;->isDecor:Z

    if-nez v3, :cond_1a

    .line 463
    invoke-virtual {p0, v0}, Landroid/support/v4/view/ViewPager;->removeViewAt(I)V

    .line 464
    add-int/lit8 v0, v0, -0x1

    .line 459
    .end local v1    # "child":Landroid/view/View;
    .end local v2    # "lp":Landroid/support/v4/view/ViewPager$LayoutParams;
    :cond_1a
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 467
    .end local v0    # "i":I
    :cond_1d
    return-void
.end method

.method private requestParentDisallowInterceptTouchEvent(Z)V
    .registers 3
    .param p1, "disallowIntercept"    # Z

    .line 2138
    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    .line 2139
    .local v0, "parent":Landroid/view/ViewParent;
    if-eqz v0, :cond_9

    .line 2140
    invoke-interface {v0, p1}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 2142
    :cond_9
    return-void
.end method

.method private scrollToItem(IZIZ)V
    .registers 12
    .param p1, "item"    # I
    .param p2, "smoothScroll"    # Z
    .param p3, "velocity"    # I
    .param p4, "dispatchSelected"    # Z

    .line 559
    invoke-virtual {p0, p1}, Landroid/support/v4/view/ViewPager;->infoForPosition(I)Landroid/support/v4/view/ViewPager$ItemInfo;

    move-result-object v0

    .line 560
    .local v0, "curInfo":Landroid/support/v4/view/ViewPager$ItemInfo;
    const/4 v1, 0x0

    .line 561
    .local v1, "destX":I
    if-eqz v0, :cond_1c

    .line 562
    invoke-direct {p0}, Landroid/support/v4/view/ViewPager;->getClientWidth()I

    move-result v2

    .line 563
    .local v2, "width":I
    int-to-float v3, v2

    iget v4, p0, Landroid/support/v4/view/ViewPager;->mFirstOffset:F

    iget v5, v0, Landroid/support/v4/view/ViewPager$ItemInfo;->offset:F

    iget v6, p0, Landroid/support/v4/view/ViewPager;->mLastOffset:F

    invoke-static {v5, v6}, Ljava/lang/Math;->min(FF)F

    move-result v5

    invoke-static {v4, v5}, Ljava/lang/Math;->max(FF)F

    move-result v4

    mul-float/2addr v3, v4

    float-to-int v1, v3

    .line 566
    .end local v2    # "width":I
    :cond_1c
    const/4 v2, 0x0

    if-eqz p2, :cond_28

    .line 567
    invoke-virtual {p0, v1, v2, p3}, Landroid/support/v4/view/ViewPager;->smoothScrollTo(III)V

    .line 568
    if-eqz p4, :cond_36

    .line 569
    invoke-direct {p0, p1}, Landroid/support/v4/view/ViewPager;->dispatchOnPageSelected(I)V

    goto :goto_36

    .line 572
    :cond_28
    if-eqz p4, :cond_2d

    .line 573
    invoke-direct {p0, p1}, Landroid/support/v4/view/ViewPager;->dispatchOnPageSelected(I)V

    .line 575
    :cond_2d
    invoke-direct {p0, v2}, Landroid/support/v4/view/ViewPager;->completeScroll(Z)V

    .line 576
    invoke-virtual {p0, v1, v2}, Landroid/support/v4/view/ViewPager;->scrollTo(II)V

    .line 577
    invoke-direct {p0, v1}, Landroid/support/v4/view/ViewPager;->pageScrolled(I)Z

    .line 579
    :cond_36
    :goto_36
    return-void
.end method

.method private setScrollState(I)V
    .registers 3
    .param p1, "newState"    # I

    .line 395
    iget v0, p0, Landroid/support/v4/view/ViewPager;->mScrollState:I

    if-ne v0, p1, :cond_5

    .line 396
    return-void

    .line 399
    :cond_5
    iput p1, p0, Landroid/support/v4/view/ViewPager;->mScrollState:I

    .line 400
    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mPageTransformer:Landroid/support/v4/view/ViewPager$PageTransformer;

    if-eqz v0, :cond_13

    .line 402
    if-eqz p1, :cond_f

    const/4 v0, 0x1

    goto :goto_10

    :cond_f
    const/4 v0, 0x0

    :goto_10
    invoke-direct {p0, v0}, Landroid/support/v4/view/ViewPager;->enableLayers(Z)V

    .line 404
    :cond_13
    invoke-direct {p0, p1}, Landroid/support/v4/view/ViewPager;->dispatchOnScrollStateChanged(I)V

    .line 405
    return-void
.end method

.method private setScrollingCacheEnabled(Z)V
    .registers 3
    .param p1, "enabled"    # Z

    .line 2497
    iget-boolean v0, p0, Landroid/support/v4/view/ViewPager;->mScrollingCacheEnabled:Z

    if-eq v0, p1, :cond_6

    .line 2498
    iput-boolean p1, p0, Landroid/support/v4/view/ViewPager;->mScrollingCacheEnabled:Z

    .line 2509
    :cond_6
    return-void
.end method

.method private sortChildDrawingOrder()V
    .registers 5

    .line 1144
    iget v0, p0, Landroid/support/v4/view/ViewPager;->mDrawingOrder:I

    if-eqz v0, :cond_2f

    .line 1145
    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mDrawingOrderedChildren:Ljava/util/ArrayList;

    if-nez v0, :cond_10

    .line 1146
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroid/support/v4/view/ViewPager;->mDrawingOrderedChildren:Ljava/util/ArrayList;

    goto :goto_15

    .line 1148
    :cond_10
    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mDrawingOrderedChildren:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 1150
    :goto_15
    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getChildCount()I

    move-result v0

    .line 1151
    .local v0, "childCount":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1a
    if-ge v1, v0, :cond_28

    .line 1152
    invoke-virtual {p0, v1}, Landroid/support/v4/view/ViewPager;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 1153
    .local v2, "child":Landroid/view/View;
    iget-object v3, p0, Landroid/support/v4/view/ViewPager;->mDrawingOrderedChildren:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1151
    .end local v2    # "child":Landroid/view/View;
    add-int/lit8 v1, v1, 0x1

    goto :goto_1a

    .line 1155
    .end local v1    # "i":I
    :cond_28
    iget-object v1, p0, Landroid/support/v4/view/ViewPager;->mDrawingOrderedChildren:Ljava/util/ArrayList;

    sget-object v2, Landroid/support/v4/view/ViewPager;->sPositionComparator:Landroid/support/v4/view/ViewPager$ViewPositionComparator;

    invoke-static {v1, v2}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 1157
    .end local v0    # "childCount":I
    :cond_2f
    return-void
.end method


# virtual methods
.method public addFocusables(Ljava/util/ArrayList;II)V
    .registers 11
    .param p2, "direction"    # I
    .param p3, "focusableMode"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;II)V"
        }
    .end annotation

    .line 2714
    .local p1, "views":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 2716
    .local v0, "focusableCount":I
    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getDescendantFocusability()I

    move-result v1

    .line 2718
    .local v1, "descendantFocusability":I
    const/high16 v2, 0x60000

    if-eq v1, v2, :cond_2f

    .line 2719
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_d
    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getChildCount()I

    move-result v3

    if-ge v2, v3, :cond_2f

    .line 2720
    invoke-virtual {p0, v2}, Landroid/support/v4/view/ViewPager;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    .line 2721
    .local v3, "child":Landroid/view/View;
    invoke-virtual {v3}, Landroid/view/View;->getVisibility()I

    move-result v4

    if-nez v4, :cond_2c

    .line 2722
    invoke-virtual {p0, v3}, Landroid/support/v4/view/ViewPager;->infoForChild(Landroid/view/View;)Landroid/support/v4/view/ViewPager$ItemInfo;

    move-result-object v4

    .line 2723
    .local v4, "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    if-eqz v4, :cond_2c

    iget v5, v4, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    iget v6, p0, Landroid/support/v4/view/ViewPager;->mCurItem:I

    if-ne v5, v6, :cond_2c

    .line 2724
    invoke-virtual {v3, p1, p2, p3}, Landroid/view/View;->addFocusables(Ljava/util/ArrayList;II)V

    .line 2719
    .end local v3    # "child":Landroid/view/View;
    .end local v4    # "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    :cond_2c
    add-int/lit8 v2, v2, 0x1

    goto :goto_d

    .line 2734
    .end local v2    # "i":I
    :cond_2f
    const/high16 v2, 0x40000

    if-ne v1, v2, :cond_39

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ne v0, v2, :cond_57

    .line 2740
    :cond_39
    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->isFocusable()Z

    move-result v2

    if-nez v2, :cond_40

    .line 2741
    return-void

    .line 2743
    :cond_40
    and-int/lit8 v2, p3, 0x1

    const/4 v3, 0x1

    if-ne v2, v3, :cond_52

    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->isInTouchMode()Z

    move-result v2

    if-eqz v2, :cond_52

    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->isFocusableInTouchMode()Z

    move-result v2

    if-nez v2, :cond_52

    .line 2745
    return-void

    .line 2747
    :cond_52
    if-eqz p1, :cond_57

    .line 2748
    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2751
    :cond_57
    return-void
.end method

.method addNewItem(II)Landroid/support/v4/view/ViewPager$ItemInfo;
    .registers 5
    .param p1, "position"    # I
    .param p2, "index"    # I

    .line 868
    new-instance v0, Landroid/support/v4/view/ViewPager$ItemInfo;

    invoke-direct {v0}, Landroid/support/v4/view/ViewPager$ItemInfo;-><init>()V

    .line 869
    .local v0, "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    iput p1, v0, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    .line 870
    iget-object v1, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    invoke-virtual {v1, p0, p1}, Landroid/support/v4/view/PagerAdapter;->instantiateItem(Landroid/view/ViewGroup;I)Ljava/lang/Object;

    move-result-object v1

    iput-object v1, v0, Landroid/support/v4/view/ViewPager$ItemInfo;->object:Ljava/lang/Object;

    .line 871
    iget-object v1, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    invoke-virtual {v1, p1}, Landroid/support/v4/view/PagerAdapter;->getPageWidth(I)F

    move-result v1

    iput v1, v0, Landroid/support/v4/view/ViewPager$ItemInfo;->widthFactor:F

    .line 872
    if-ltz p2, :cond_28

    iget-object v1, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lt p2, v1, :cond_22

    goto :goto_28

    .line 875
    :cond_22
    iget-object v1, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v1, p2, v0}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    goto :goto_2d

    .line 873
    :cond_28
    :goto_28
    iget-object v1, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 877
    :goto_2d
    return-object v0
.end method

.method public addOnPageChangeListener(Landroid/support/v4/view/ViewPager$OnPageChangeListener;)V
    .registers 3
    .param p1, "listener"    # Landroid/support/v4/view/ViewPager$OnPageChangeListener;

    .line 606
    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mOnPageChangeListeners:Ljava/util/List;

    if-nez v0, :cond_b

    .line 607
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroid/support/v4/view/ViewPager;->mOnPageChangeListeners:Ljava/util/List;

    .line 609
    :cond_b
    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mOnPageChangeListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 610
    return-void
.end method

.method public addTouchables(Ljava/util/ArrayList;)V
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;)V"
        }
    .end annotation

    .line 2761
    .local p1, "views":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_23

    .line 2762
    invoke-virtual {p0, v0}, Landroid/support/v4/view/ViewPager;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 2763
    .local v1, "child":Landroid/view/View;
    invoke-virtual {v1}, Landroid/view/View;->getVisibility()I

    move-result v2

    if-nez v2, :cond_20

    .line 2764
    invoke-virtual {p0, v1}, Landroid/support/v4/view/ViewPager;->infoForChild(Landroid/view/View;)Landroid/support/v4/view/ViewPager$ItemInfo;

    move-result-object v2

    .line 2765
    .local v2, "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    if-eqz v2, :cond_20

    iget v3, v2, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    iget v4, p0, Landroid/support/v4/view/ViewPager;->mCurItem:I

    if-ne v3, v4, :cond_20

    .line 2766
    invoke-virtual {v1, p1}, Landroid/view/View;->addTouchables(Ljava/util/ArrayList;)V

    .line 2761
    .end local v1    # "child":Landroid/view/View;
    .end local v2    # "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    :cond_20
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 2770
    .end local v0    # "i":I
    :cond_23
    return-void
.end method

.method public addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V
    .registers 7
    .param p1, "child"    # Landroid/view/View;
    .param p2, "index"    # I
    .param p3, "params"    # Landroid/view/ViewGroup$LayoutParams;

    .line 1330
    invoke-virtual {p0, p3}, Landroid/support/v4/view/ViewPager;->checkLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Z

    move-result v0

    if-nez v0, :cond_a

    .line 1331
    invoke-virtual {p0, p3}, Landroid/support/v4/view/ViewPager;->generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;

    move-result-object p3

    .line 1333
    :cond_a
    move-object v0, p3

    check-cast v0, Landroid/support/v4/view/ViewPager$LayoutParams;

    .line 1334
    .local v0, "lp":Landroid/support/v4/view/ViewPager$LayoutParams;
    iget-boolean v1, v0, Landroid/support/v4/view/ViewPager$LayoutParams;->isDecor:Z

    instance-of v2, p1, Landroid/support/v4/view/ViewPager$Decor;

    or-int/2addr v1, v2

    iput-boolean v1, v0, Landroid/support/v4/view/ViewPager$LayoutParams;->isDecor:Z

    .line 1335
    iget-boolean v1, p0, Landroid/support/v4/view/ViewPager;->mInLayout:Z

    if-eqz v1, :cond_2e

    .line 1336
    if-eqz v0, :cond_27

    iget-boolean v1, v0, Landroid/support/v4/view/ViewPager$LayoutParams;->isDecor:Z

    if-nez v1, :cond_1f

    goto :goto_27

    .line 1337
    :cond_1f
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Cannot add pager decor view during layout"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1339
    :cond_27
    :goto_27
    const/4 v1, 0x1

    iput-boolean v1, v0, Landroid/support/v4/view/ViewPager$LayoutParams;->needsMeasure:Z

    .line 1340
    invoke-virtual {p0, p1, p2, p3}, Landroid/support/v4/view/ViewPager;->addViewInLayout(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)Z

    goto :goto_31

    .line 1342
    :cond_2e
    invoke-super {p0, p1, p2, p3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 1352
    :goto_31
    return-void
.end method

.method public arrowScroll(I)Z
    .registers 8
    .param p1, "direction"    # I

    .line 2602
    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->findFocus()Landroid/view/View;

    move-result-object v0

    .line 2603
    .local v0, "currentFocused":Landroid/view/View;
    if-ne v0, p0, :cond_8

    .line 2604
    const/4 v0, 0x0

    goto :goto_66

    .line 2605
    :cond_8
    if-eqz v0, :cond_66

    .line 2606
    const/4 v1, 0x0

    .line 2607
    .local v1, "isChild":Z
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    .local v2, "parent":Landroid/view/ViewParent;
    :goto_f
    instance-of v3, v2, Landroid/view/ViewGroup;

    if-eqz v3, :cond_1c

    .line 2609
    if-ne v2, p0, :cond_17

    .line 2610
    const/4 v1, 0x1

    .line 2611
    goto :goto_1c

    .line 2608
    :cond_17
    invoke-interface {v2}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    goto :goto_f

    .line 2614
    .end local v2    # "parent":Landroid/view/ViewParent;
    :cond_1c
    :goto_1c
    if-nez v1, :cond_66

    .line 2616
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 2617
    .local v2, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2618
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    .local v3, "parent":Landroid/view/ViewParent;
    :goto_32
    instance-of v4, v3, Landroid/view/ViewGroup;

    if-eqz v4, :cond_4b

    .line 2620
    const-string v4, " => "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2619
    invoke-interface {v3}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    goto :goto_32

    .line 2622
    .end local v3    # "parent":Landroid/view/ViewParent;
    :cond_4b
    const-string v3, "ViewPager"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "arrowScroll tried to find focus based on non-child current focused view "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 2624
    const/4 v0, 0x0

    .line 2628
    .end local v1    # "isChild":Z
    .end local v2    # "sb":Ljava/lang/StringBuilder;
    :cond_66
    :goto_66
    const/4 v1, 0x0

    .line 2630
    .local v1, "handled":Z
    invoke-static {}, Landroid/view/FocusFinder;->getInstance()Landroid/view/FocusFinder;

    move-result-object v2

    invoke-virtual {v2, p0, v0, p1}, Landroid/view/FocusFinder;->findNextFocus(Landroid/view/ViewGroup;Landroid/view/View;I)Landroid/view/View;

    move-result-object v2

    .line 2632
    .local v2, "nextFocused":Landroid/view/View;
    const/16 v3, 0x42

    const/16 v4, 0x11

    if-eqz v2, :cond_b7

    if-eq v2, v0, :cond_b7

    .line 2633
    if-ne p1, v4, :cond_97

    .line 2636
    iget-object v3, p0, Landroid/support/v4/view/ViewPager;->mTempRect:Landroid/graphics/Rect;

    invoke-direct {p0, v3, v2}, Landroid/support/v4/view/ViewPager;->getChildRectInPagerCoordinates(Landroid/graphics/Rect;Landroid/view/View;)Landroid/graphics/Rect;

    move-result-object v3

    iget v3, v3, Landroid/graphics/Rect;->left:I

    .line 2637
    .local v3, "nextLeft":I
    iget-object v4, p0, Landroid/support/v4/view/ViewPager;->mTempRect:Landroid/graphics/Rect;

    invoke-direct {p0, v4, v0}, Landroid/support/v4/view/ViewPager;->getChildRectInPagerCoordinates(Landroid/graphics/Rect;Landroid/view/View;)Landroid/graphics/Rect;

    move-result-object v4

    iget v4, v4, Landroid/graphics/Rect;->left:I

    .line 2638
    .local v4, "currLeft":I
    if-eqz v0, :cond_92

    if-lt v3, v4, :cond_92

    .line 2639
    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->pageLeft()Z

    move-result v1

    goto :goto_96

    .line 2641
    :cond_92
    invoke-virtual {v2}, Landroid/view/View;->requestFocus()Z

    move-result v1

    .line 2643
    .end local v3    # "nextLeft":I
    .end local v4    # "currLeft":I
    :goto_96
    goto :goto_cb

    :cond_97
    if-ne p1, v3, :cond_cb

    .line 2646
    iget-object v3, p0, Landroid/support/v4/view/ViewPager;->mTempRect:Landroid/graphics/Rect;

    invoke-direct {p0, v3, v2}, Landroid/support/v4/view/ViewPager;->getChildRectInPagerCoordinates(Landroid/graphics/Rect;Landroid/view/View;)Landroid/graphics/Rect;

    move-result-object v3

    iget v3, v3, Landroid/graphics/Rect;->left:I

    .line 2647
    .restart local v3    # "nextLeft":I
    iget-object v4, p0, Landroid/support/v4/view/ViewPager;->mTempRect:Landroid/graphics/Rect;

    invoke-direct {p0, v4, v0}, Landroid/support/v4/view/ViewPager;->getChildRectInPagerCoordinates(Landroid/graphics/Rect;Landroid/view/View;)Landroid/graphics/Rect;

    move-result-object v4

    iget v4, v4, Landroid/graphics/Rect;->left:I

    .line 2648
    .restart local v4    # "currLeft":I
    if-eqz v0, :cond_b2

    if-gt v3, v4, :cond_b2

    .line 2649
    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->pageRight()Z

    move-result v1

    goto :goto_b6

    .line 2651
    :cond_b2
    invoke-virtual {v2}, Landroid/view/View;->requestFocus()Z

    move-result v1

    .line 2653
    .end local v3    # "nextLeft":I
    .end local v4    # "currLeft":I
    :goto_b6
    goto :goto_cb

    .line 2654
    :cond_b7
    if-eq p1, v4, :cond_c7

    const/4 v4, 0x1

    if-ne p1, v4, :cond_bd

    goto :goto_c7

    .line 2657
    :cond_bd
    if-eq p1, v3, :cond_c2

    const/4 v3, 0x2

    if-ne p1, v3, :cond_cb

    .line 2659
    :cond_c2
    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->pageRight()Z

    move-result v1

    goto :goto_cb

    .line 2656
    :cond_c7
    :goto_c7
    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->pageLeft()Z

    move-result v1

    .line 2661
    :cond_cb
    :goto_cb
    if-eqz v1, :cond_d4

    .line 2662
    invoke-static {p1}, Landroid/view/SoundEffectConstants;->getContantForFocusDirection(I)I

    move-result v3

    invoke-virtual {p0, v3}, Landroid/support/v4/view/ViewPager;->playSoundEffect(I)V

    .line 2664
    :cond_d4
    return v1
.end method

.method public beginFakeDrag()Z
    .registers 13

    .line 2361
    iget-boolean v0, p0, Landroid/support/v4/view/ViewPager;->mIsBeingDragged:Z

    if-eqz v0, :cond_6

    .line 2362
    const/4 v0, 0x0

    return v0

    .line 2364
    :cond_6
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v4/view/ViewPager;->mFakeDragging:Z

    .line 2365
    invoke-direct {p0, v0}, Landroid/support/v4/view/ViewPager;->setScrollState(I)V

    .line 2366
    const/4 v1, 0x0

    iput v1, p0, Landroid/support/v4/view/ViewPager;->mLastMotionX:F

    iput v1, p0, Landroid/support/v4/view/ViewPager;->mInitialMotionX:F

    .line 2367
    iget-object v1, p0, Landroid/support/v4/view/ViewPager;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-nez v1, :cond_1c

    .line 2368
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    move-result-object v1

    iput-object v1, p0, Landroid/support/v4/view/ViewPager;->mVelocityTracker:Landroid/view/VelocityTracker;

    goto :goto_21

    .line 2370
    :cond_1c
    iget-object v1, p0, Landroid/support/v4/view/ViewPager;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v1}, Landroid/view/VelocityTracker;->clear()V

    .line 2372
    :goto_21
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v10

    .line 2373
    .local v10, "time":J
    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    move-wide v2, v10

    move-wide v4, v10

    invoke-static/range {v2 .. v9}, Landroid/view/MotionEvent;->obtain(JJIFFI)Landroid/view/MotionEvent;

    move-result-object v1

    .line 2374
    .local v1, "ev":Landroid/view/MotionEvent;
    iget-object v2, p0, Landroid/support/v4/view/ViewPager;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v2, v1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 2375
    invoke-virtual {v1}, Landroid/view/MotionEvent;->recycle()V

    .line 2376
    iput-wide v10, p0, Landroid/support/v4/view/ViewPager;->mFakeDragBeginTime:J

    .line 2377
    return v0
.end method

.method protected canScroll(Landroid/view/View;ZIII)Z
    .registers 20
    .param p1, "v"    # Landroid/view/View;
    .param p2, "checkV"    # Z
    .param p3, "dx"    # I
    .param p4, "x"    # I
    .param p5, "y"    # I

    move-object v0, p1

    .line 2539
    instance-of v1, v0, Landroid/view/ViewGroup;

    const/4 v2, 0x1

    if-eqz v1, :cond_5c

    .line 2540
    move-object v1, v0

    check-cast v1, Landroid/view/ViewGroup;

    .line 2541
    .local v1, "group":Landroid/view/ViewGroup;
    invoke-virtual {v0}, Landroid/view/View;->getScrollX()I

    move-result v3

    .line 2542
    .local v3, "scrollX":I
    invoke-virtual {v0}, Landroid/view/View;->getScrollY()I

    move-result v4

    .line 2543
    .local v4, "scrollY":I
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v5

    .line 2545
    .local v5, "count":I
    add-int/lit8 v6, v5, -0x1

    .local v6, "i":I
    :goto_17
    if-ltz v6, :cond_5c

    .line 2548
    invoke-virtual {v1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v13

    .line 2549
    .local v13, "child":Landroid/view/View;
    add-int v7, p4, v3

    invoke-virtual {v13}, Landroid/view/View;->getLeft()I

    move-result v8

    if-lt v7, v8, :cond_59

    add-int v7, p4, v3

    invoke-virtual {v13}, Landroid/view/View;->getRight()I

    move-result v8

    if-ge v7, v8, :cond_59

    add-int v7, p5, v4

    invoke-virtual {v13}, Landroid/view/View;->getTop()I

    move-result v8

    if-lt v7, v8, :cond_59

    add-int v7, p5, v4

    invoke-virtual {v13}, Landroid/view/View;->getBottom()I

    move-result v8

    if-ge v7, v8, :cond_59

    const/4 v9, 0x1

    add-int v7, p4, v3

    invoke-virtual {v13}, Landroid/view/View;->getLeft()I

    move-result v8

    sub-int v11, v7, v8

    add-int v7, p5, v4

    invoke-virtual {v13}, Landroid/view/View;->getTop()I

    move-result v8

    sub-int v12, v7, v8

    move-object v7, p0

    move-object v8, v13

    move/from16 v10, p3

    invoke-virtual/range {v7 .. v12}, Landroid/support/v4/view/ViewPager;->canScroll(Landroid/view/View;ZIII)Z

    move-result v7

    if-eqz v7, :cond_59

    .line 2553
    return v2

    .line 2545
    .end local v13    # "child":Landroid/view/View;
    :cond_59
    add-int/lit8 v6, v6, -0x1

    goto :goto_17

    .line 2558
    .end local v1    # "group":Landroid/view/ViewGroup;
    .end local v3    # "scrollX":I
    .end local v4    # "scrollY":I
    .end local v5    # "count":I
    .end local v6    # "i":I
    :cond_5c
    if-eqz p2, :cond_68

    move/from16 v3, p3

    neg-int v4, v3

    invoke-static {v0, v4}, Landroid/support/v4/view/ViewCompat;->canScrollHorizontally(Landroid/view/View;I)Z

    move-result v4

    if-eqz v4, :cond_6a

    goto :goto_6b

    :cond_68
    move/from16 v3, p3

    :cond_6a
    const/4 v2, 0x0

    :goto_6b
    return v2
.end method

.method public canScrollHorizontally(I)Z
    .registers 8
    .param p1, "direction"    # I

    .line 2512
    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    const/4 v1, 0x0

    if-nez v0, :cond_6

    .line 2513
    return v1

    .line 2516
    :cond_6
    invoke-direct {p0}, Landroid/support/v4/view/ViewPager;->getClientWidth()I

    move-result v0

    .line 2517
    .local v0, "width":I
    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getScrollX()I

    move-result v2

    .line 2518
    .local v2, "scrollX":I
    const/4 v3, 0x1

    if-gez p1, :cond_1b

    .line 2519
    int-to-float v4, v0

    iget v5, p0, Landroid/support/v4/view/ViewPager;->mFirstOffset:F

    mul-float/2addr v4, v5

    float-to-int v4, v4

    if-le v2, v4, :cond_1a

    move v1, v3

    nop

    :cond_1a
    return v1

    .line 2520
    :cond_1b
    if-lez p1, :cond_27

    .line 2521
    int-to-float v4, v0

    iget v5, p0, Landroid/support/v4/view/ViewPager;->mLastOffset:F

    mul-float/2addr v4, v5

    float-to-int v4, v4

    if-ge v2, v4, :cond_26

    move v1, v3

    nop

    :cond_26
    return v1

    .line 2523
    :cond_27
    return v1
.end method

.method protected checkLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Z
    .registers 3
    .param p1, "p"    # Landroid/view/ViewGroup$LayoutParams;

    .line 2840
    instance-of v0, p1, Landroid/support/v4/view/ViewPager$LayoutParams;

    if-eqz v0, :cond_c

    invoke-super {p0, p1}, Landroid/view/ViewGroup;->checkLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Z

    move-result v0

    if-eqz v0, :cond_c

    const/4 v0, 0x1

    goto :goto_d

    :cond_c
    const/4 v0, 0x0

    :goto_d
    return v0
.end method

.method public clearOnPageChangeListeners()V
    .registers 2

    .line 628
    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mOnPageChangeListeners:Ljava/util/List;

    if-eqz v0, :cond_9

    .line 629
    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mOnPageChangeListeners:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 631
    :cond_9
    return-void
.end method

.method public computeScroll()V
    .registers 6

    .line 1645
    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->isFinished()Z

    move-result v0

    if-nez v0, :cond_3e

    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->computeScrollOffset()Z

    move-result v0

    if-eqz v0, :cond_3e

    .line 1646
    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getScrollX()I

    move-result v0

    .line 1647
    .local v0, "oldX":I
    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getScrollY()I

    move-result v1

    .line 1648
    .local v1, "oldY":I
    iget-object v2, p0, Landroid/support/v4/view/ViewPager;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v2}, Landroid/widget/Scroller;->getCurrX()I

    move-result v2

    .line 1649
    .local v2, "x":I
    iget-object v3, p0, Landroid/support/v4/view/ViewPager;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v3}, Landroid/widget/Scroller;->getCurrY()I

    move-result v3

    .line 1651
    .local v3, "y":I
    if-ne v0, v2, :cond_28

    if-eq v1, v3, :cond_3a

    .line 1652
    :cond_28
    invoke-virtual {p0, v2, v3}, Landroid/support/v4/view/ViewPager;->scrollTo(II)V

    .line 1653
    invoke-direct {p0, v2}, Landroid/support/v4/view/ViewPager;->pageScrolled(I)Z

    move-result v4

    if-nez v4, :cond_3a

    .line 1654
    iget-object v4, p0, Landroid/support/v4/view/ViewPager;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v4}, Landroid/widget/Scroller;->abortAnimation()V

    .line 1655
    const/4 v4, 0x0

    invoke-virtual {p0, v4, v3}, Landroid/support/v4/view/ViewPager;->scrollTo(II)V

    .line 1660
    :cond_3a
    invoke-static {p0}, Landroid/support/v4/view/ViewCompat;->postInvalidateOnAnimation(Landroid/view/View;)V

    .line 1661
    return-void

    .line 1665
    .end local v0    # "oldX":I
    .end local v1    # "oldY":I
    .end local v2    # "x":I
    .end local v3    # "y":I
    :cond_3e
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Landroid/support/v4/view/ViewPager;->completeScroll(Z)V

    .line 1666
    return-void
.end method

.method dataSetChanged()V
    .registers 13

    .line 883
    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    invoke-virtual {v0}, Landroid/support/v4/view/PagerAdapter;->getCount()I

    move-result v0

    .line 884
    .local v0, "adapterCount":I
    iput v0, p0, Landroid/support/v4/view/ViewPager;->mExpectedAdapterCount:I

    .line 885
    iget-object v1, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    iget v2, p0, Landroid/support/v4/view/ViewPager;->mOffscreenPageLimit:I

    mul-int/lit8 v2, v2, 0x2

    const/4 v3, 0x1

    add-int/2addr v2, v3

    const/4 v4, 0x0

    if-ge v1, v2, :cond_21

    iget-object v1, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v1, v0, :cond_21

    move v1, v3

    goto :goto_22

    :cond_21
    move v1, v4

    .line 887
    .local v1, "needPopulate":Z
    :goto_22
    iget v2, p0, Landroid/support/v4/view/ViewPager;->mCurItem:I

    .line 889
    .local v2, "newCurrItem":I
    const/4 v5, 0x0

    .line 890
    .local v5, "isUpdating":Z
    move v6, v2

    move v2, v1

    move v1, v4

    .local v1, "i":I
    .local v2, "needPopulate":Z
    .local v6, "newCurrItem":I
    :goto_28
    iget-object v7, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v7

    if-ge v1, v7, :cond_84

    .line 891
    iget-object v7, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v7, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/support/v4/view/ViewPager$ItemInfo;

    .line 892
    .local v7, "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    iget-object v8, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    iget-object v9, v7, Landroid/support/v4/view/ViewPager$ItemInfo;->object:Ljava/lang/Object;

    invoke-virtual {v8, v9}, Landroid/support/v4/view/PagerAdapter;->getItemPosition(Ljava/lang/Object;)I

    move-result v8

    .line 894
    .local v8, "newPos":I
    const/4 v9, -0x1

    if-ne v8, v9, :cond_44

    .line 895
    goto :goto_82

    .line 898
    :cond_44
    const/4 v9, -0x2

    if-ne v8, v9, :cond_74

    .line 899
    iget-object v9, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v9, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 900
    add-int/lit8 v1, v1, -0x1

    .line 902
    if-nez v5, :cond_56

    .line 903
    iget-object v9, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    invoke-virtual {v9, p0}, Landroid/support/v4/view/PagerAdapter;->startUpdate(Landroid/view/ViewGroup;)V

    .line 904
    const/4 v5, 0x1

    .line 907
    :cond_56
    iget-object v9, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    iget v10, v7, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    iget-object v11, v7, Landroid/support/v4/view/ViewPager$ItemInfo;->object:Ljava/lang/Object;

    invoke-virtual {v9, p0, v10, v11}, Landroid/support/v4/view/PagerAdapter;->destroyItem(Landroid/view/ViewGroup;ILjava/lang/Object;)V

    .line 908
    const/4 v2, 0x1

    .line 910
    iget v9, p0, Landroid/support/v4/view/ViewPager;->mCurItem:I

    iget v10, v7, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    if-ne v9, v10, :cond_82

    .line 912
    iget v9, p0, Landroid/support/v4/view/ViewPager;->mCurItem:I

    add-int/lit8 v10, v0, -0x1

    invoke-static {v9, v10}, Ljava/lang/Math;->min(II)I

    move-result v9

    invoke-static {v4, v9}, Ljava/lang/Math;->max(II)I

    move-result v6

    .line 913
    const/4 v2, 0x1

    goto :goto_82

    .line 918
    :cond_74
    iget v9, v7, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    if-eq v9, v8, :cond_82

    .line 919
    iget v9, v7, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    iget v10, p0, Landroid/support/v4/view/ViewPager;->mCurItem:I

    if-ne v9, v10, :cond_7f

    .line 921
    move v6, v8

    .line 924
    :cond_7f
    iput v8, v7, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    .line 925
    const/4 v2, 0x1

    .line 890
    .end local v7    # "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    .end local v8    # "newPos":I
    :cond_82
    :goto_82
    add-int/2addr v1, v3

    goto :goto_28

    .line 929
    .end local v1    # "i":I
    :cond_84
    if-eqz v5, :cond_8b

    .line 930
    iget-object v1, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    invoke-virtual {v1, p0}, Landroid/support/v4/view/PagerAdapter;->finishUpdate(Landroid/view/ViewGroup;)V

    .line 933
    :cond_8b
    iget-object v1, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    sget-object v7, Landroid/support/v4/view/ViewPager;->COMPARATOR:Ljava/util/Comparator;

    invoke-static {v1, v7}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 935
    if-eqz v2, :cond_b5

    .line 937
    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getChildCount()I

    move-result v1

    .line 938
    .local v1, "childCount":I
    move v7, v4

    .local v7, "i":I
    :goto_99
    if-ge v7, v1, :cond_af

    .line 939
    invoke-virtual {p0, v7}, Landroid/support/v4/view/ViewPager;->getChildAt(I)Landroid/view/View;

    move-result-object v8

    .line 940
    .local v8, "child":Landroid/view/View;
    invoke-virtual {v8}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v9

    check-cast v9, Landroid/support/v4/view/ViewPager$LayoutParams;

    .line 941
    .local v9, "lp":Landroid/support/v4/view/ViewPager$LayoutParams;
    iget-boolean v10, v9, Landroid/support/v4/view/ViewPager$LayoutParams;->isDecor:Z

    if-nez v10, :cond_ac

    .line 942
    const/4 v10, 0x0

    iput v10, v9, Landroid/support/v4/view/ViewPager$LayoutParams;->widthFactor:F

    .line 938
    .end local v8    # "child":Landroid/view/View;
    .end local v9    # "lp":Landroid/support/v4/view/ViewPager$LayoutParams;
    :cond_ac
    add-int/lit8 v7, v7, 0x1

    goto :goto_99

    .line 946
    .end local v7    # "i":I
    :cond_af
    invoke-virtual {p0, v6, v4, v3}, Landroid/support/v4/view/ViewPager;->setCurrentItemInternal(IZZ)V

    .line 947
    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->requestLayout()V

    .line 949
    .end local v1    # "childCount":I
    :cond_b5
    return-void
.end method

.method public dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .registers 3
    .param p1, "event"    # Landroid/view/KeyEvent;

    .line 2564
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result v0

    if-nez v0, :cond_f

    invoke-virtual {p0, p1}, Landroid/support/v4/view/ViewPager;->executeKeyEvent(Landroid/view/KeyEvent;)Z

    move-result v0

    if-eqz v0, :cond_d

    goto :goto_f

    :cond_d
    const/4 v0, 0x0

    goto :goto_10

    :cond_f
    :goto_f
    const/4 v0, 0x1

    :goto_10
    return v0
.end method

.method public dispatchPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)Z
    .registers 9
    .param p1, "event"    # Landroid/view/accessibility/AccessibilityEvent;

    .line 2808
    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityEvent;->getEventType()I

    move-result v0

    const/16 v1, 0x1000

    if-ne v0, v1, :cond_d

    .line 2809
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->dispatchPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)Z

    move-result v0

    return v0

    .line 2813
    :cond_d
    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getChildCount()I

    move-result v0

    .line 2814
    .local v0, "childCount":I
    const/4 v1, 0x0

    move v2, v1

    .local v2, "i":I
    :goto_13
    if-ge v2, v0, :cond_36

    .line 2815
    invoke-virtual {p0, v2}, Landroid/support/v4/view/ViewPager;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    .line 2816
    .local v3, "child":Landroid/view/View;
    invoke-virtual {v3}, Landroid/view/View;->getVisibility()I

    move-result v4

    if-nez v4, :cond_33

    .line 2817
    invoke-virtual {p0, v3}, Landroid/support/v4/view/ViewPager;->infoForChild(Landroid/view/View;)Landroid/support/v4/view/ViewPager$ItemInfo;

    move-result-object v4

    .line 2818
    .local v4, "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    if-eqz v4, :cond_33

    iget v5, v4, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    iget v6, p0, Landroid/support/v4/view/ViewPager;->mCurItem:I

    if-ne v5, v6, :cond_33

    invoke-virtual {v3, p1}, Landroid/view/View;->dispatchPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)Z

    move-result v5

    if-eqz v5, :cond_33

    .line 2820
    const/4 v1, 0x1

    return v1

    .line 2814
    .end local v3    # "child":Landroid/view/View;
    .end local v4    # "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    :cond_33
    add-int/lit8 v2, v2, 0x1

    goto :goto_13

    .line 2825
    .end local v2    # "i":I
    :cond_36
    return v1
.end method

.method distanceInfluenceForSnapDuration(F)F
    .registers 6
    .param p1, "f"    # F

    .line 804
    const/high16 v0, 0x3f000000    # 0.5f

    sub-float/2addr p1, v0

    .line 805
    float-to-double v0, p1

    const-wide v2, 0x3fde28c7460698c7L    # 0.4712389167638204

    mul-double/2addr v0, v2

    double-to-float p1, v0

    .line 806
    float-to-double v0, p1

    invoke-static {v0, v1}, Ljava/lang/Math;->sin(D)D

    move-result-wide v0

    double-to-float v0, v0

    return v0
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .registers 10
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .line 2259
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->draw(Landroid/graphics/Canvas;)V

    .line 2260
    const/4 v0, 0x0

    .line 2262
    .local v0, "needsInvalidate":Z
    invoke-static {p0}, Landroid/support/v4/view/ViewCompat;->getOverScrollMode(Landroid/view/View;)I

    move-result v1

    .line 2263
    .local v1, "overScrollMode":I
    if-eqz v1, :cond_26

    const/4 v2, 0x1

    if-ne v1, v2, :cond_1a

    iget-object v3, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    if-eqz v3, :cond_1a

    iget-object v3, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    invoke-virtual {v3}, Landroid/support/v4/view/PagerAdapter;->getCount()I

    move-result v3

    if-le v3, v2, :cond_1a

    goto :goto_26

    .line 2289
    :cond_1a
    iget-object v2, p0, Landroid/support/v4/view/ViewPager;->mLeftEdge:Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-virtual {v2}, Landroid/support/v4/widget/EdgeEffectCompat;->finish()V

    .line 2290
    iget-object v2, p0, Landroid/support/v4/view/ViewPager;->mRightEdge:Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-virtual {v2}, Landroid/support/v4/widget/EdgeEffectCompat;->finish()V

    goto/16 :goto_aa

    .line 2266
    :cond_26
    :goto_26
    iget-object v2, p0, Landroid/support/v4/view/ViewPager;->mLeftEdge:Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-virtual {v2}, Landroid/support/v4/widget/EdgeEffectCompat;->isFinished()Z

    move-result v2

    if-nez v2, :cond_66

    .line 2267
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    move-result v2

    .line 2268
    .local v2, "restoreCount":I
    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getHeight()I

    move-result v3

    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getPaddingTop()I

    move-result v4

    sub-int/2addr v3, v4

    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getPaddingBottom()I

    move-result v4

    sub-int/2addr v3, v4

    .line 2269
    .local v3, "height":I
    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getWidth()I

    move-result v4

    .line 2271
    .local v4, "width":I
    const/high16 v5, 0x43870000    # 270.0f

    invoke-virtual {p1, v5}, Landroid/graphics/Canvas;->rotate(F)V

    .line 2272
    neg-int v5, v3

    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getPaddingTop()I

    move-result v6

    add-int/2addr v5, v6

    int-to-float v5, v5

    iget v6, p0, Landroid/support/v4/view/ViewPager;->mFirstOffset:F

    int-to-float v7, v4

    mul-float/2addr v6, v7

    invoke-virtual {p1, v5, v6}, Landroid/graphics/Canvas;->translate(FF)V

    .line 2273
    iget-object v5, p0, Landroid/support/v4/view/ViewPager;->mLeftEdge:Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-virtual {v5, v3, v4}, Landroid/support/v4/widget/EdgeEffectCompat;->setSize(II)V

    .line 2274
    iget-object v5, p0, Landroid/support/v4/view/ViewPager;->mLeftEdge:Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-virtual {v5, p1}, Landroid/support/v4/widget/EdgeEffectCompat;->draw(Landroid/graphics/Canvas;)Z

    move-result v5

    or-int/2addr v0, v5

    .line 2275
    invoke-virtual {p1, v2}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 2277
    .end local v2    # "restoreCount":I
    .end local v3    # "height":I
    .end local v4    # "width":I
    :cond_66
    iget-object v2, p0, Landroid/support/v4/view/ViewPager;->mRightEdge:Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-virtual {v2}, Landroid/support/v4/widget/EdgeEffectCompat;->isFinished()Z

    move-result v2

    if-nez v2, :cond_aa

    .line 2278
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    move-result v2

    .line 2279
    .restart local v2    # "restoreCount":I
    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getWidth()I

    move-result v3

    .line 2280
    .local v3, "width":I
    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getHeight()I

    move-result v4

    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getPaddingTop()I

    move-result v5

    sub-int/2addr v4, v5

    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getPaddingBottom()I

    move-result v5

    sub-int/2addr v4, v5

    .line 2282
    .local v4, "height":I
    const/high16 v5, 0x42b40000    # 90.0f

    invoke-virtual {p1, v5}, Landroid/graphics/Canvas;->rotate(F)V

    .line 2283
    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getPaddingTop()I

    move-result v5

    neg-int v5, v5

    int-to-float v5, v5

    iget v6, p0, Landroid/support/v4/view/ViewPager;->mLastOffset:F

    const/high16 v7, 0x3f800000    # 1.0f

    add-float/2addr v6, v7

    neg-float v6, v6

    int-to-float v7, v3

    mul-float/2addr v6, v7

    invoke-virtual {p1, v5, v6}, Landroid/graphics/Canvas;->translate(FF)V

    .line 2284
    iget-object v5, p0, Landroid/support/v4/view/ViewPager;->mRightEdge:Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-virtual {v5, v4, v3}, Landroid/support/v4/widget/EdgeEffectCompat;->setSize(II)V

    .line 2285
    iget-object v5, p0, Landroid/support/v4/view/ViewPager;->mRightEdge:Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-virtual {v5, p1}, Landroid/support/v4/widget/EdgeEffectCompat;->draw(Landroid/graphics/Canvas;)Z

    move-result v5

    or-int/2addr v0, v5

    .line 2286
    invoke-virtual {p1, v2}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 2287
    .end local v2    # "restoreCount":I
    .end local v3    # "width":I
    .end local v4    # "height":I
    nop

    .line 2293
    :cond_aa
    :goto_aa
    if-eqz v0, :cond_af

    .line 2295
    invoke-static {p0}, Landroid/support/v4/view/ViewCompat;->postInvalidateOnAnimation(Landroid/view/View;)V

    .line 2297
    :cond_af
    return-void
.end method

.method protected drawableStateChanged()V
    .registers 3

    .line 792
    invoke-super {p0}, Landroid/view/ViewGroup;->drawableStateChanged()V

    .line 793
    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mMarginDrawable:Landroid/graphics/drawable/Drawable;

    .line 794
    .local v0, "d":Landroid/graphics/drawable/Drawable;
    if-eqz v0, :cond_14

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->isStateful()Z

    move-result v1

    if-eqz v1, :cond_14

    .line 795
    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getDrawableState()[I

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    .line 797
    :cond_14
    return-void
.end method

.method public endFakeDrag()V
    .registers 11

    .line 2387
    iget-boolean v0, p0, Landroid/support/v4/view/ViewPager;->mFakeDragging:Z

    if-eqz v0, :cond_43

    .line 2391
    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 2392
    .local v0, "velocityTracker":Landroid/view/VelocityTracker;
    const/16 v1, 0x3e8

    iget v2, p0, Landroid/support/v4/view/ViewPager;->mMaximumVelocity:I

    int-to-float v2, v2

    invoke-virtual {v0, v1, v2}, Landroid/view/VelocityTracker;->computeCurrentVelocity(IF)V

    .line 2393
    iget v1, p0, Landroid/support/v4/view/ViewPager;->mActivePointerId:I

    invoke-static {v0, v1}, Landroid/support/v4/view/VelocityTrackerCompat;->getXVelocity(Landroid/view/VelocityTracker;I)F

    move-result v1

    float-to-int v1, v1

    .line 2395
    .local v1, "initialVelocity":I
    const/4 v2, 0x1

    iput-boolean v2, p0, Landroid/support/v4/view/ViewPager;->mPopulatePending:Z

    .line 2396
    invoke-direct {p0}, Landroid/support/v4/view/ViewPager;->getClientWidth()I

    move-result v3

    .line 2397
    .local v3, "width":I
    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getScrollX()I

    move-result v4

    .line 2398
    .local v4, "scrollX":I
    invoke-direct {p0}, Landroid/support/v4/view/ViewPager;->infoForCurrentScrollPosition()Landroid/support/v4/view/ViewPager$ItemInfo;

    move-result-object v5

    .line 2399
    .local v5, "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    iget v6, v5, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    .line 2400
    .local v6, "currentPage":I
    int-to-float v7, v4

    int-to-float v8, v3

    div-float/2addr v7, v8

    iget v8, v5, Landroid/support/v4/view/ViewPager$ItemInfo;->offset:F

    sub-float/2addr v7, v8

    iget v8, v5, Landroid/support/v4/view/ViewPager$ItemInfo;->widthFactor:F

    div-float/2addr v7, v8

    .line 2401
    .local v7, "pageOffset":F
    iget v8, p0, Landroid/support/v4/view/ViewPager;->mLastMotionX:F

    iget v9, p0, Landroid/support/v4/view/ViewPager;->mInitialMotionX:F

    sub-float/2addr v8, v9

    float-to-int v8, v8

    .line 2402
    .local v8, "totalDelta":I
    invoke-direct {p0, v6, v7, v1, v8}, Landroid/support/v4/view/ViewPager;->determineTargetPage(IFII)I

    move-result v9

    .line 2404
    .local v9, "nextPage":I
    invoke-virtual {p0, v9, v2, v2, v1}, Landroid/support/v4/view/ViewPager;->setCurrentItemInternal(IZZI)V

    .line 2405
    invoke-direct {p0}, Landroid/support/v4/view/ViewPager;->endDrag()V

    .line 2407
    const/4 v2, 0x0

    iput-boolean v2, p0, Landroid/support/v4/view/ViewPager;->mFakeDragging:Z

    .line 2408
    return-void

    .line 2388
    .end local v0    # "velocityTracker":Landroid/view/VelocityTracker;
    .end local v1    # "initialVelocity":I
    .end local v3    # "width":I
    .end local v4    # "scrollX":I
    .end local v5    # "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    .end local v6    # "currentPage":I
    .end local v7    # "pageOffset":F
    .end local v8    # "totalDelta":I
    .end local v9    # "nextPage":I
    :cond_43
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "No fake drag in progress. Call beginFakeDrag first."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public executeKeyEvent(Landroid/view/KeyEvent;)Z
    .registers 5
    .param p1, "event"    # Landroid/view/KeyEvent;

    .line 2576
    const/4 v0, 0x0

    .line 2577
    .local v0, "handled":Z
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result v1

    if-nez v1, :cond_3e

    .line 2578
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v1

    const/16 v2, 0x3d

    if-eq v1, v2, :cond_21

    packed-switch v1, :pswitch_data_40

    goto :goto_3e

    .line 2583
    :pswitch_13
    const/16 v1, 0x42

    invoke-virtual {p0, v1}, Landroid/support/v4/view/ViewPager;->arrowScroll(I)Z

    move-result v0

    .line 2584
    goto :goto_3e

    .line 2580
    :pswitch_1a
    const/16 v1, 0x11

    invoke-virtual {p0, v1}, Landroid/support/v4/view/ViewPager;->arrowScroll(I)Z

    move-result v0

    .line 2581
    goto :goto_3e

    .line 2586
    :cond_21
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0xb

    if-lt v1, v2, :cond_3e

    .line 2589
    invoke-static {p1}, Landroid/support/v4/view/KeyEventCompat;->hasNoModifiers(Landroid/view/KeyEvent;)Z

    move-result v1

    if-eqz v1, :cond_33

    .line 2590
    const/4 v1, 0x2

    invoke-virtual {p0, v1}, Landroid/support/v4/view/ViewPager;->arrowScroll(I)Z

    move-result v0

    goto :goto_3e

    .line 2591
    :cond_33
    const/4 v1, 0x1

    invoke-static {p1, v1}, Landroid/support/v4/view/KeyEventCompat;->hasModifiers(Landroid/view/KeyEvent;I)Z

    move-result v2

    if-eqz v2, :cond_3e

    .line 2592
    invoke-virtual {p0, v1}, Landroid/support/v4/view/ViewPager;->arrowScroll(I)Z

    move-result v0

    .line 2598
    :cond_3e
    :goto_3e
    return v0

    nop

    :pswitch_data_40
    .packed-switch 0x15
        :pswitch_1a
        :pswitch_13
    .end packed-switch
.end method

.method public fakeDragBy(F)V
    .registers 21
    .param p1, "xOffset"    # F

    move-object/from16 v0, p0

    .line 2418
    iget-boolean v1, v0, Landroid/support/v4/view/ViewPager;->mFakeDragging:Z

    if-eqz v1, :cond_8d

    .line 2422
    iget v1, v0, Landroid/support/v4/view/ViewPager;->mLastMotionX:F

    add-float v1, v1, p1

    iput v1, v0, Landroid/support/v4/view/ViewPager;->mLastMotionX:F

    .line 2424
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getScrollX()I

    move-result v1

    int-to-float v1, v1

    .line 2425
    .local v1, "oldScrollX":F
    sub-float v2, v1, p1

    .line 2426
    .local v2, "scrollX":F
    invoke-direct/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getClientWidth()I

    move-result v3

    .line 2428
    .local v3, "width":I
    int-to-float v4, v3

    iget v5, v0, Landroid/support/v4/view/ViewPager;->mFirstOffset:F

    mul-float/2addr v4, v5

    .line 2429
    .local v4, "leftBound":F
    int-to-float v5, v3

    iget v6, v0, Landroid/support/v4/view/ViewPager;->mLastOffset:F

    mul-float/2addr v5, v6

    .line 2431
    .local v5, "rightBound":F
    iget-object v6, v0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    const/4 v7, 0x0

    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/support/v4/view/ViewPager$ItemInfo;

    .line 2432
    .local v6, "firstItem":Landroid/support/v4/view/ViewPager$ItemInfo;
    iget-object v7, v0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    iget-object v8, v0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v8

    add-int/lit8 v8, v8, -0x1

    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/support/v4/view/ViewPager$ItemInfo;

    .line 2433
    .local v7, "lastItem":Landroid/support/v4/view/ViewPager$ItemInfo;
    iget v8, v6, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    if-eqz v8, :cond_41

    .line 2434
    iget v8, v6, Landroid/support/v4/view/ViewPager$ItemInfo;->offset:F

    int-to-float v9, v3

    mul-float v4, v8, v9

    .line 2436
    :cond_41
    iget v8, v7, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    iget-object v9, v0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    invoke-virtual {v9}, Landroid/support/v4/view/PagerAdapter;->getCount()I

    move-result v9

    add-int/lit8 v9, v9, -0x1

    if-eq v8, v9, :cond_52

    .line 2437
    iget v8, v7, Landroid/support/v4/view/ViewPager$ItemInfo;->offset:F

    int-to-float v9, v3

    mul-float v5, v8, v9

    .line 2440
    :cond_52
    cmpg-float v8, v2, v4

    if-gez v8, :cond_58

    .line 2441
    move v2, v4

    goto :goto_5d

    .line 2442
    :cond_58
    cmpl-float v8, v2, v5

    if-lez v8, :cond_5d

    .line 2443
    move v2, v5

    .line 2446
    :cond_5d
    :goto_5d
    iget v8, v0, Landroid/support/v4/view/ViewPager;->mLastMotionX:F

    float-to-int v9, v2

    int-to-float v9, v9

    sub-float v9, v2, v9

    add-float/2addr v8, v9

    iput v8, v0, Landroid/support/v4/view/ViewPager;->mLastMotionX:F

    .line 2447
    float-to-int v8, v2

    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getScrollY()I

    move-result v9

    invoke-virtual {v0, v8, v9}, Landroid/support/v4/view/ViewPager;->scrollTo(II)V

    .line 2448
    float-to-int v8, v2

    invoke-direct {v0, v8}, Landroid/support/v4/view/ViewPager;->pageScrolled(I)Z

    .line 2451
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v17

    .line 2452
    .local v17, "time":J
    iget-wide v9, v0, Landroid/support/v4/view/ViewPager;->mFakeDragBeginTime:J

    const/4 v13, 0x2

    iget v14, v0, Landroid/support/v4/view/ViewPager;->mLastMotionX:F

    const/4 v15, 0x0

    const/16 v16, 0x0

    move-wide/from16 v11, v17

    invoke-static/range {v9 .. v16}, Landroid/view/MotionEvent;->obtain(JJIFFI)Landroid/view/MotionEvent;

    move-result-object v8

    .line 2454
    .local v8, "ev":Landroid/view/MotionEvent;
    iget-object v9, v0, Landroid/support/v4/view/ViewPager;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v9, v8}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 2455
    invoke-virtual {v8}, Landroid/view/MotionEvent;->recycle()V

    .line 2456
    return-void

    .line 2419
    .end local v1    # "oldScrollX":F
    .end local v2    # "scrollX":F
    .end local v3    # "width":I
    .end local v4    # "leftBound":F
    .end local v5    # "rightBound":F
    .end local v6    # "firstItem":Landroid/support/v4/view/ViewPager$ItemInfo;
    .end local v7    # "lastItem":Landroid/support/v4/view/ViewPager$ItemInfo;
    .end local v8    # "ev":Landroid/view/MotionEvent;
    .end local v17    # "time":J
    :cond_8d
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "No fake drag in progress. Call beginFakeDrag first."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method protected generateDefaultLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    .registers 2

    .line 2830
    new-instance v0, Landroid/support/v4/view/ViewPager$LayoutParams;

    invoke-direct {v0}, Landroid/support/v4/view/ViewPager$LayoutParams;-><init>()V

    return-object v0
.end method

.method public generateLayoutParams(Landroid/util/AttributeSet;)Landroid/view/ViewGroup$LayoutParams;
    .registers 4
    .param p1, "attrs"    # Landroid/util/AttributeSet;

    .line 2845
    new-instance v0, Landroid/support/v4/view/ViewPager$LayoutParams;

    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Landroid/support/v4/view/ViewPager$LayoutParams;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-object v0
.end method

.method protected generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;
    .registers 3
    .param p1, "p"    # Landroid/view/ViewGroup$LayoutParams;

    .line 2835
    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->generateDefaultLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    return-object v0
.end method

.method public getAdapter()Landroid/support/v4/view/PagerAdapter;
    .registers 2

    .line 475
    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    return-object v0
.end method

.method protected getChildDrawingOrder(II)I
    .registers 5
    .param p1, "childCount"    # I
    .param p2, "i"    # I

    .line 680
    iget v0, p0, Landroid/support/v4/view/ViewPager;->mDrawingOrder:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_9

    add-int/lit8 v0, p1, -0x1

    sub-int/2addr v0, p2

    goto :goto_a

    :cond_9
    move v0, p2

    .line 681
    .local v0, "index":I
    :goto_a
    iget-object v1, p0, Landroid/support/v4/view/ViewPager;->mDrawingOrderedChildren:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Landroid/support/v4/view/ViewPager$LayoutParams;

    iget v1, v1, Landroid/support/v4/view/ViewPager$LayoutParams;->childIndex:I

    .line 682
    .local v1, "result":I
    return v1
.end method

.method public getCurrentItem()I
    .registers 2

    .line 510
    iget v0, p0, Landroid/support/v4/view/ViewPager;->mCurItem:I

    return v0
.end method

.method public getOffscreenPageLimit()I
    .registers 2

    .line 705
    iget v0, p0, Landroid/support/v4/view/ViewPager;->mOffscreenPageLimit:I

    return v0
.end method

.method public getPageMargin()I
    .registers 2

    .line 761
    iget v0, p0, Landroid/support/v4/view/ViewPager;->mPageMargin:I

    return v0
.end method

.method infoForAnyChild(Landroid/view/View;)Landroid/support/v4/view/ViewPager$ItemInfo;
    .registers 4
    .param p1, "child"    # Landroid/view/View;

    .line 1375
    :goto_0
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    move-object v1, v0

    .local v1, "parent":Landroid/view/ViewParent;
    if-eq v0, p0, :cond_14

    .line 1376
    if-eqz v1, :cond_12

    instance-of v0, v1, Landroid/view/View;

    if-nez v0, :cond_e

    goto :goto_12

    .line 1379
    :cond_e
    move-object p1, v1

    check-cast p1, Landroid/view/View;

    goto :goto_0

    .line 1377
    :cond_12
    :goto_12
    const/4 v0, 0x0

    return-object v0

    .line 1381
    :cond_14
    invoke-virtual {p0, p1}, Landroid/support/v4/view/ViewPager;->infoForChild(Landroid/view/View;)Landroid/support/v4/view/ViewPager$ItemInfo;

    move-result-object v0

    return-object v0
.end method

.method infoForChild(Landroid/view/View;)Landroid/support/v4/view/ViewPager$ItemInfo;
    .registers 6
    .param p1, "child"    # Landroid/view/View;

    .line 1364
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    iget-object v1, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_1f

    .line 1365
    iget-object v1, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/support/v4/view/ViewPager$ItemInfo;

    .line 1366
    .local v1, "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    iget-object v2, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    iget-object v3, v1, Landroid/support/v4/view/ViewPager$ItemInfo;->object:Ljava/lang/Object;

    invoke-virtual {v2, p1, v3}, Landroid/support/v4/view/PagerAdapter;->isViewFromObject(Landroid/view/View;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1c

    .line 1367
    return-object v1

    .line 1364
    .end local v1    # "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    :cond_1c
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 1370
    .end local v0    # "i":I
    :cond_1f
    const/4 v0, 0x0

    return-object v0
.end method

.method infoForPosition(I)Landroid/support/v4/view/ViewPager$ItemInfo;
    .registers 5
    .param p1, "position"    # I

    .line 1385
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    iget-object v1, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_19

    .line 1386
    iget-object v1, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/support/v4/view/ViewPager$ItemInfo;

    .line 1387
    .local v1, "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    iget v2, v1, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    if-ne v2, p1, :cond_16

    .line 1388
    return-object v1

    .line 1385
    .end local v1    # "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    :cond_16
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 1391
    .end local v0    # "i":I
    :cond_19
    const/4 v0, 0x0

    return-object v0
.end method

.method initViewPager()V
    .registers 6

    .line 361
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/support/v4/view/ViewPager;->setWillNotDraw(Z)V

    .line 362
    const/high16 v0, 0x40000

    invoke-virtual {p0, v0}, Landroid/support/v4/view/ViewPager;->setDescendantFocusability(I)V

    .line 363
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Landroid/support/v4/view/ViewPager;->setFocusable(Z)V

    .line 364
    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getContext()Landroid/content/Context;

    move-result-object v1

    .line 365
    .local v1, "context":Landroid/content/Context;
    new-instance v2, Landroid/widget/Scroller;

    sget-object v3, Landroid/support/v4/view/ViewPager;->sInterpolator:Landroid/view/animation/Interpolator;

    invoke-direct {v2, v1, v3}, Landroid/widget/Scroller;-><init>(Landroid/content/Context;Landroid/view/animation/Interpolator;)V

    iput-object v2, p0, Landroid/support/v4/view/ViewPager;->mScroller:Landroid/widget/Scroller;

    .line 366
    invoke-static {v1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v2

    .line 367
    .local v2, "configuration":Landroid/view/ViewConfiguration;
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    iget v3, v3, Landroid/util/DisplayMetrics;->density:F

    .line 369
    .local v3, "density":F
    invoke-static {v2}, Landroid/support/v4/view/ViewConfigurationCompat;->getScaledPagingTouchSlop(Landroid/view/ViewConfiguration;)I

    move-result v4

    iput v4, p0, Landroid/support/v4/view/ViewPager;->mTouchSlop:I

    .line 370
    const/high16 v4, 0x43c80000    # 400.0f

    mul-float/2addr v4, v3

    float-to-int v4, v4

    iput v4, p0, Landroid/support/v4/view/ViewPager;->mMinimumVelocity:I

    .line 371
    invoke-virtual {v2}, Landroid/view/ViewConfiguration;->getScaledMaximumFlingVelocity()I

    move-result v4

    iput v4, p0, Landroid/support/v4/view/ViewPager;->mMaximumVelocity:I

    .line 372
    new-instance v4, Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-direct {v4, v1}, Landroid/support/v4/widget/EdgeEffectCompat;-><init>(Landroid/content/Context;)V

    iput-object v4, p0, Landroid/support/v4/view/ViewPager;->mLeftEdge:Landroid/support/v4/widget/EdgeEffectCompat;

    .line 373
    new-instance v4, Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-direct {v4, v1}, Landroid/support/v4/widget/EdgeEffectCompat;-><init>(Landroid/content/Context;)V

    iput-object v4, p0, Landroid/support/v4/view/ViewPager;->mRightEdge:Landroid/support/v4/widget/EdgeEffectCompat;

    .line 375
    const/high16 v4, 0x41c80000    # 25.0f

    mul-float/2addr v4, v3

    float-to-int v4, v4

    iput v4, p0, Landroid/support/v4/view/ViewPager;->mFlingDistance:I

    .line 376
    const/high16 v4, 0x40000000    # 2.0f

    mul-float/2addr v4, v3

    float-to-int v4, v4

    iput v4, p0, Landroid/support/v4/view/ViewPager;->mCloseEnough:I

    .line 377
    const/high16 v4, 0x41800000    # 16.0f

    mul-float/2addr v4, v3

    float-to-int v4, v4

    iput v4, p0, Landroid/support/v4/view/ViewPager;->mDefaultGutterSize:I

    .line 379
    new-instance v4, Landroid/support/v4/view/ViewPager$MyAccessibilityDelegate;

    invoke-direct {v4, p0}, Landroid/support/v4/view/ViewPager$MyAccessibilityDelegate;-><init>(Landroid/support/v4/view/ViewPager;)V

    invoke-static {p0, v4}, Landroid/support/v4/view/ViewCompat;->setAccessibilityDelegate(Landroid/view/View;Landroid/support/v4/view/AccessibilityDelegateCompat;)V

    .line 381
    invoke-static {p0}, Landroid/support/v4/view/ViewCompat;->getImportantForAccessibility(Landroid/view/View;)I

    move-result v4

    if-nez v4, :cond_6b

    .line 383
    invoke-static {p0, v0}, Landroid/support/v4/view/ViewCompat;->setImportantForAccessibility(Landroid/view/View;I)V

    .line 386
    :cond_6b
    return-void
.end method

.method public isFakeDragging()Z
    .registers 2

    .line 2468
    iget-boolean v0, p0, Landroid/support/v4/view/ViewPager;->mFakeDragging:Z

    return v0
.end method

.method protected onAttachedToWindow()V
    .registers 2

    .line 1396
    invoke-super {p0}, Landroid/view/ViewGroup;->onAttachedToWindow()V

    .line 1397
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v4/view/ViewPager;->mFirstLayout:Z

    .line 1398
    return-void
.end method

.method protected onDetachedFromWindow()V
    .registers 2

    .line 390
    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mEndScrollRunnable:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Landroid/support/v4/view/ViewPager;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 391
    invoke-super {p0}, Landroid/view/ViewGroup;->onDetachedFromWindow()V

    .line 392
    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .registers 20
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    move-object/from16 v0, p0

    .line 2301
    invoke-super/range {p0 .. p1}, Landroid/view/ViewGroup;->onDraw(Landroid/graphics/Canvas;)V

    .line 2304
    iget v1, v0, Landroid/support/v4/view/ViewPager;->mPageMargin:I

    if-lez v1, :cond_b5

    iget-object v1, v0, Landroid/support/v4/view/ViewPager;->mMarginDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_b5

    iget-object v1, v0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_b5

    iget-object v1, v0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    if-eqz v1, :cond_b5

    .line 2305
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getScrollX()I

    move-result v1

    .line 2306
    .local v1, "scrollX":I
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getWidth()I

    move-result v2

    .line 2308
    .local v2, "width":I
    iget v3, v0, Landroid/support/v4/view/ViewPager;->mPageMargin:I

    int-to-float v3, v3

    int-to-float v4, v2

    div-float/2addr v3, v4

    .line 2309
    .local v3, "marginOffset":F
    const/4 v4, 0x0

    .line 2310
    .local v4, "itemIndex":I
    iget-object v5, v0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    const/4 v6, 0x0

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/support/v4/view/ViewPager$ItemInfo;

    .line 2311
    .local v5, "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    iget v6, v5, Landroid/support/v4/view/ViewPager$ItemInfo;->offset:F

    .line 2312
    .local v6, "offset":F
    iget-object v7, v0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v7

    .line 2313
    .local v7, "itemCount":I
    iget v8, v5, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    .line 2314
    .local v8, "firstPos":I
    iget-object v9, v0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    add-int/lit8 v10, v7, -0x1

    invoke-virtual {v9, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/support/v4/view/ViewPager$ItemInfo;

    iget v9, v9, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    .line 2315
    .local v9, "lastPos":I
    move v10, v6

    move v6, v4

    move v4, v8

    .local v4, "pos":I
    .local v6, "itemIndex":I
    .local v10, "offset":F
    :goto_49
    if-ge v4, v9, :cond_b5

    .line 2316
    :goto_4b
    iget v11, v5, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    if-le v4, v11, :cond_5d

    if-ge v6, v7, :cond_5d

    .line 2317
    iget-object v11, v0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    add-int/lit8 v6, v6, 0x1

    invoke-virtual {v11, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v11

    move-object v5, v11

    check-cast v5, Landroid/support/v4/view/ViewPager$ItemInfo;

    goto :goto_4b

    .line 2321
    :cond_5d
    iget v11, v5, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    if-ne v4, v11, :cond_71

    .line 2322
    iget v11, v5, Landroid/support/v4/view/ViewPager$ItemInfo;->offset:F

    iget v12, v5, Landroid/support/v4/view/ViewPager$ItemInfo;->widthFactor:F

    add-float/2addr v11, v12

    int-to-float v12, v2

    mul-float/2addr v11, v12

    .line 2323
    .local v11, "drawAt":F
    iget v12, v5, Landroid/support/v4/view/ViewPager$ItemInfo;->offset:F

    iget v13, v5, Landroid/support/v4/view/ViewPager$ItemInfo;->widthFactor:F

    add-float/2addr v12, v13

    add-float/2addr v12, v3

    .line 2330
    .end local v10    # "offset":F
    .local v12, "offset":F
    move v10, v12

    move v12, v11

    goto :goto_7e

    .line 2325
    .end local v11    # "drawAt":F
    .end local v12    # "offset":F
    .restart local v10    # "offset":F
    :cond_71
    iget-object v11, v0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    invoke-virtual {v11, v4}, Landroid/support/v4/view/PagerAdapter;->getPageWidth(I)F

    move-result v11

    .line 2326
    .local v11, "widthFactor":F
    add-float v12, v10, v11

    int-to-float v13, v2

    mul-float/2addr v12, v13

    .line 2327
    .local v12, "drawAt":F
    add-float v13, v11, v3

    add-float/2addr v10, v13

    .line 2330
    .end local v11    # "widthFactor":F
    :goto_7e
    iget v11, v0, Landroid/support/v4/view/ViewPager;->mPageMargin:I

    int-to-float v11, v11

    add-float/2addr v11, v12

    int-to-float v13, v1

    cmpl-float v11, v11, v13

    if-lez v11, :cond_a4

    .line 2331
    iget-object v11, v0, Landroid/support/v4/view/ViewPager;->mMarginDrawable:Landroid/graphics/drawable/Drawable;

    float-to-int v13, v12

    iget v14, v0, Landroid/support/v4/view/ViewPager;->mTopPageBounds:I

    iget v15, v0, Landroid/support/v4/view/ViewPager;->mPageMargin:I

    int-to-float v15, v15

    add-float/2addr v15, v12

    const/high16 v16, 0x3f000000    # 0.5f

    add-float v15, v15, v16

    float-to-int v15, v15

    move/from16 v17, v3

    iget v3, v0, Landroid/support/v4/view/ViewPager;->mBottomPageBounds:I

    .end local v3    # "marginOffset":F
    .local v17, "marginOffset":F
    invoke-virtual {v11, v13, v14, v15, v3}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 2333
    iget-object v3, v0, Landroid/support/v4/view/ViewPager;->mMarginDrawable:Landroid/graphics/drawable/Drawable;

    move-object/from16 v11, p1

    invoke-virtual {v3, v11}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    goto :goto_a8

    .line 2336
    .end local v17    # "marginOffset":F
    .restart local v3    # "marginOffset":F
    :cond_a4
    move-object/from16 v11, p1

    move/from16 v17, v3

    .end local v3    # "marginOffset":F
    .restart local v17    # "marginOffset":F
    :goto_a8
    add-int v3, v1, v2

    int-to-float v3, v3

    cmpl-float v3, v12, v3

    if-lez v3, :cond_b0

    .line 2337
    goto :goto_b7

    .line 2315
    .end local v12    # "drawAt":F
    :cond_b0
    add-int/lit8 v4, v4, 0x1

    move/from16 v3, v17

    goto :goto_49

    .line 2341
    .end local v1    # "scrollX":I
    .end local v2    # "width":I
    .end local v4    # "pos":I
    .end local v5    # "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    .end local v6    # "itemIndex":I
    .end local v7    # "itemCount":I
    .end local v8    # "firstPos":I
    .end local v9    # "lastPos":I
    .end local v10    # "offset":F
    .end local v17    # "marginOffset":F
    :cond_b5
    move-object/from16 v11, p1

    :goto_b7
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 22
    .param p1, "ev"    # Landroid/view/MotionEvent;

    move-object/from16 v6, p0

    .line 1875
    move-object/from16 v7, p1

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    and-int/lit16 v8, v0, 0xff

    .line 1878
    .local v8, "action":I
    const/4 v0, -0x1

    const/4 v9, 0x0

    const/4 v1, 0x3

    if-eq v8, v1, :cond_123

    const/4 v10, 0x1

    if-ne v8, v10, :cond_14

    goto/16 :goto_123

    .line 1893
    :cond_14
    if-eqz v8, :cond_20

    .line 1894
    iget-boolean v1, v6, Landroid/support/v4/view/ViewPager;->mIsBeingDragged:Z

    if-eqz v1, :cond_1b

    .line 1896
    return v10

    .line 1898
    :cond_1b
    iget-boolean v1, v6, Landroid/support/v4/view/ViewPager;->mIsUnableToDrag:Z

    if-eqz v1, :cond_20

    .line 1900
    return v9

    .line 1904
    :cond_20
    const/4 v1, 0x2

    if-eqz v8, :cond_bf

    if-eq v8, v1, :cond_2f

    const/4 v0, 0x6

    if-eq v8, v0, :cond_2a

    goto/16 :goto_111

    .line 1995
    :cond_2a
    invoke-direct/range {p0 .. p1}, Landroid/support/v4/view/ViewPager;->onSecondaryPointerUp(Landroid/view/MotionEvent;)V

    goto/16 :goto_111

    .line 1915
    :cond_2f
    iget v11, v6, Landroid/support/v4/view/ViewPager;->mActivePointerId:I

    .line 1916
    .local v11, "activePointerId":I
    if-ne v11, v0, :cond_35

    .line 1918
    goto/16 :goto_111

    .line 1921
    :cond_35
    invoke-static {v7, v11}, Landroid/support/v4/view/MotionEventCompat;->findPointerIndex(Landroid/view/MotionEvent;I)I

    move-result v12

    .line 1922
    .local v12, "pointerIndex":I
    invoke-static {v7, v12}, Landroid/support/v4/view/MotionEventCompat;->getX(Landroid/view/MotionEvent;I)F

    move-result v13

    .line 1923
    .local v13, "x":F
    iget v0, v6, Landroid/support/v4/view/ViewPager;->mLastMotionX:F

    sub-float v14, v13, v0

    .line 1924
    .local v14, "dx":F
    invoke-static {v14}, Ljava/lang/Math;->abs(F)F

    move-result v15

    .line 1925
    .local v15, "xDiff":F
    invoke-static {v7, v12}, Landroid/support/v4/view/MotionEventCompat;->getY(Landroid/view/MotionEvent;I)F

    move-result v5

    .line 1926
    .local v5, "y":F
    iget v0, v6, Landroid/support/v4/view/ViewPager;->mInitialMotionY:F

    sub-float v0, v5, v0

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v16

    .line 1929
    .local v16, "yDiff":F
    const/16 v17, 0x0

    cmpl-float v0, v14, v17

    if-eqz v0, :cond_78

    iget v0, v6, Landroid/support/v4/view/ViewPager;->mLastMotionX:F

    invoke-direct {v6, v0, v14}, Landroid/support/v4/view/ViewPager;->isGutterDrag(FF)Z

    move-result v0

    if-nez v0, :cond_78

    const/4 v2, 0x0

    float-to-int v3, v14

    float-to-int v4, v13

    float-to-int v1, v5

    move-object v0, v6

    move/from16 v18, v1

    move-object v1, v6

    move v9, v5

    move/from16 v5, v18

    .end local v5    # "y":F
    .local v9, "y":F
    invoke-virtual/range {v0 .. v5}, Landroid/support/v4/view/ViewPager;->canScroll(Landroid/view/View;ZIII)Z

    move-result v0

    if-eqz v0, :cond_79

    .line 1932
    iput v13, v6, Landroid/support/v4/view/ViewPager;->mLastMotionX:F

    .line 1933
    iput v9, v6, Landroid/support/v4/view/ViewPager;->mLastMotionY:F

    .line 1934
    iput-boolean v10, v6, Landroid/support/v4/view/ViewPager;->mIsUnableToDrag:Z

    .line 1935
    const/4 v0, 0x0

    return v0

    .line 1937
    .end local v9    # "y":F
    .restart local v5    # "y":F
    :cond_78
    move v9, v5

    .end local v5    # "y":F
    .restart local v9    # "y":F
    :cond_79
    iget v0, v6, Landroid/support/v4/view/ViewPager;->mTouchSlop:I

    int-to-float v0, v0

    cmpl-float v0, v15, v0

    if-lez v0, :cond_a8

    const/high16 v0, 0x3f000000    # 0.5f

    mul-float/2addr v0, v15

    cmpl-float v0, v0, v16

    if-lez v0, :cond_a8

    .line 1939
    iput-boolean v10, v6, Landroid/support/v4/view/ViewPager;->mIsBeingDragged:Z

    .line 1940
    invoke-direct {v6, v10}, Landroid/support/v4/view/ViewPager;->requestParentDisallowInterceptTouchEvent(Z)V

    .line 1941
    invoke-direct {v6, v10}, Landroid/support/v4/view/ViewPager;->setScrollState(I)V

    .line 1942
    cmpl-float v0, v14, v17

    if-lez v0, :cond_9a

    iget v0, v6, Landroid/support/v4/view/ViewPager;->mInitialMotionX:F

    iget v1, v6, Landroid/support/v4/view/ViewPager;->mTouchSlop:I

    int-to-float v1, v1

    add-float/2addr v0, v1

    goto :goto_a0

    :cond_9a
    iget v0, v6, Landroid/support/v4/view/ViewPager;->mInitialMotionX:F

    iget v1, v6, Landroid/support/v4/view/ViewPager;->mTouchSlop:I

    int-to-float v1, v1

    sub-float/2addr v0, v1

    :goto_a0
    iput v0, v6, Landroid/support/v4/view/ViewPager;->mLastMotionX:F

    .line 1944
    iput v9, v6, Landroid/support/v4/view/ViewPager;->mLastMotionY:F

    .line 1945
    invoke-direct {v6, v10}, Landroid/support/v4/view/ViewPager;->setScrollingCacheEnabled(Z)V

    goto :goto_b1

    .line 1946
    :cond_a8
    iget v0, v6, Landroid/support/v4/view/ViewPager;->mTouchSlop:I

    int-to-float v0, v0

    cmpl-float v0, v16, v0

    if-lez v0, :cond_b1

    .line 1952
    iput-boolean v10, v6, Landroid/support/v4/view/ViewPager;->mIsUnableToDrag:Z

    .line 1954
    :cond_b1
    :goto_b1
    iget-boolean v0, v6, Landroid/support/v4/view/ViewPager;->mIsBeingDragged:Z

    if-eqz v0, :cond_111

    .line 1956
    invoke-direct {v6, v13}, Landroid/support/v4/view/ViewPager;->performDrag(F)Z

    move-result v0

    if-eqz v0, :cond_111

    .line 1957
    invoke-static/range {p0 .. p0}, Landroid/support/v4/view/ViewCompat;->postInvalidateOnAnimation(Landroid/view/View;)V

    goto :goto_111

    .line 1968
    .end local v9    # "y":F
    .end local v11    # "activePointerId":I
    .end local v12    # "pointerIndex":I
    .end local v13    # "x":F
    .end local v14    # "dx":F
    .end local v15    # "xDiff":F
    .end local v16    # "yDiff":F
    :cond_bf
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    iput v0, v6, Landroid/support/v4/view/ViewPager;->mInitialMotionX:F

    iput v0, v6, Landroid/support/v4/view/ViewPager;->mLastMotionX:F

    .line 1969
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getY()F

    move-result v0

    iput v0, v6, Landroid/support/v4/view/ViewPager;->mInitialMotionY:F

    iput v0, v6, Landroid/support/v4/view/ViewPager;->mLastMotionY:F

    .line 1970
    const/4 v0, 0x0

    invoke-static {v7, v0}, Landroid/support/v4/view/MotionEventCompat;->getPointerId(Landroid/view/MotionEvent;I)I

    move-result v2

    iput v2, v6, Landroid/support/v4/view/ViewPager;->mActivePointerId:I

    .line 1971
    iput-boolean v0, v6, Landroid/support/v4/view/ViewPager;->mIsUnableToDrag:Z

    .line 1973
    iget-object v0, v6, Landroid/support/v4/view/ViewPager;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->computeScrollOffset()Z

    .line 1974
    iget v0, v6, Landroid/support/v4/view/ViewPager;->mScrollState:I

    if-ne v0, v1, :cond_10a

    iget-object v0, v6, Landroid/support/v4/view/ViewPager;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->getFinalX()I

    move-result v0

    iget-object v1, v6, Landroid/support/v4/view/ViewPager;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v1}, Landroid/widget/Scroller;->getCurrX()I

    move-result v1

    sub-int/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    move-result v0

    iget v1, v6, Landroid/support/v4/view/ViewPager;->mCloseEnough:I

    if-le v0, v1, :cond_10a

    .line 1977
    iget-object v0, v6, Landroid/support/v4/view/ViewPager;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->abortAnimation()V

    .line 1978
    const/4 v0, 0x0

    iput-boolean v0, v6, Landroid/support/v4/view/ViewPager;->mPopulatePending:Z

    .line 1979
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->populate()V

    .line 1980
    iput-boolean v10, v6, Landroid/support/v4/view/ViewPager;->mIsBeingDragged:Z

    .line 1981
    invoke-direct {v6, v10}, Landroid/support/v4/view/ViewPager;->requestParentDisallowInterceptTouchEvent(Z)V

    .line 1982
    invoke-direct {v6, v10}, Landroid/support/v4/view/ViewPager;->setScrollState(I)V

    goto :goto_111

    .line 1984
    :cond_10a
    const/4 v0, 0x0

    invoke-direct {v6, v0}, Landroid/support/v4/view/ViewPager;->completeScroll(Z)V

    .line 1985
    iput-boolean v0, v6, Landroid/support/v4/view/ViewPager;->mIsBeingDragged:Z

    .line 1991
    nop

    .line 1999
    :cond_111
    :goto_111
    iget-object v0, v6, Landroid/support/v4/view/ViewPager;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-nez v0, :cond_11b

    .line 2000
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    move-result-object v0

    iput-object v0, v6, Landroid/support/v4/view/ViewPager;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 2002
    :cond_11b
    iget-object v0, v6, Landroid/support/v4/view/ViewPager;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v0, v7}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 2008
    iget-boolean v0, v6, Landroid/support/v4/view/ViewPager;->mIsBeingDragged:Z

    return v0

    .line 1881
    :cond_123
    :goto_123
    const/4 v1, 0x0

    iput-boolean v1, v6, Landroid/support/v4/view/ViewPager;->mIsBeingDragged:Z

    .line 1882
    iput-boolean v1, v6, Landroid/support/v4/view/ViewPager;->mIsUnableToDrag:Z

    .line 1883
    iput v0, v6, Landroid/support/v4/view/ViewPager;->mActivePointerId:I

    .line 1884
    iget-object v0, v6, Landroid/support/v4/view/ViewPager;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-eqz v0, :cond_136

    .line 1885
    iget-object v0, v6, Landroid/support/v4/view/ViewPager;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v0}, Landroid/view/VelocityTracker;->recycle()V

    .line 1886
    const/4 v0, 0x0

    iput-object v0, v6, Landroid/support/v4/view/ViewPager;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 1888
    :cond_136
    const/4 v0, 0x0

    return v0
.end method

.method protected onLayout(ZIIII)V
    .registers 34
    .param p1, "changed"    # Z
    .param p2, "l"    # I
    .param p3, "t"    # I
    .param p4, "r"    # I
    .param p5, "b"    # I

    move-object/from16 v0, p0

    .line 1536
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getChildCount()I

    move-result v1

    .line 1537
    .local v1, "count":I
    sub-int v4, p4, p2

    .line 1538
    .local v4, "width":I
    sub-int v7, p5, p3

    .line 1539
    .local v7, "height":I
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getPaddingLeft()I

    move-result v8

    .line 1540
    .local v8, "paddingLeft":I
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getPaddingTop()I

    move-result v9

    .line 1541
    .local v9, "paddingTop":I
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getPaddingRight()I

    move-result v10

    .line 1542
    .local v10, "paddingRight":I
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getPaddingBottom()I

    move-result v11

    .line 1543
    .local v11, "paddingBottom":I
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getScrollX()I

    move-result v12

    .line 1545
    .local v12, "scrollX":I
    const/4 v13, 0x0

    .line 1549
    .local v13, "decorCount":I
    move v15, v13

    move v13, v11

    move v11, v9

    move v9, v8

    const/4 v8, 0x0

    .local v8, "i":I
    .local v9, "paddingLeft":I
    .local v11, "paddingTop":I
    .local v13, "paddingBottom":I
    .local v15, "decorCount":I
    :goto_24
    if-ge v8, v1, :cond_c6

    .line 1550
    invoke-virtual {v0, v8}, Landroid/support/v4/view/ViewPager;->getChildAt(I)Landroid/view/View;

    move-result-object v14

    .line 1551
    .local v14, "child":Landroid/view/View;
    invoke-virtual {v14}, Landroid/view/View;->getVisibility()I

    move-result v2

    const/16 v3, 0x8

    if-eq v2, v3, :cond_c2

    .line 1552
    invoke-virtual {v14}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Landroid/support/v4/view/ViewPager$LayoutParams;

    .line 1553
    .local v2, "lp":Landroid/support/v4/view/ViewPager$LayoutParams;
    const/4 v3, 0x0

    .line 1554
    .local v3, "childLeft":I
    const/16 v16, 0x0

    .line 1555
    .local v16, "childTop":I
    move/from16 v17, v3

    iget-boolean v3, v2, Landroid/support/v4/view/ViewPager$LayoutParams;->isDecor:Z

    .end local v3    # "childLeft":I
    .local v17, "childLeft":I
    if-eqz v3, :cond_c2

    .line 1556
    iget v3, v2, Landroid/support/v4/view/ViewPager$LayoutParams;->gravity:I

    and-int/lit8 v3, v3, 0x7

    .line 1557
    .local v3, "hgrav":I
    iget v5, v2, Landroid/support/v4/view/ViewPager$LayoutParams;->gravity:I

    and-int/lit8 v5, v5, 0x70

    .line 1558
    .local v5, "vgrav":I
    move-object/from16 v18, v2

    const/4 v2, 0x1

    .end local v2    # "lp":Landroid/support/v4/view/ViewPager$LayoutParams;
    .local v18, "lp":Landroid/support/v4/view/ViewPager$LayoutParams;
    if-eq v3, v2, :cond_6d

    const/4 v2, 0x3

    if-eq v3, v2, :cond_65

    const/4 v2, 0x5

    if-eq v3, v2, :cond_56

    .line 1560
    move v2, v9

    .line 1561
    .end local v17    # "childLeft":I
    .local v2, "childLeft":I
    goto :goto_7a

    .line 1571
    .end local v2    # "childLeft":I
    .restart local v17    # "childLeft":I
    :cond_56
    sub-int v2, v4, v10

    invoke-virtual {v14}, Landroid/view/View;->getMeasuredWidth()I

    move-result v19

    sub-int v2, v2, v19

    .line 1572
    .end local v17    # "childLeft":I
    .restart local v2    # "childLeft":I
    invoke-virtual {v14}, Landroid/view/View;->getMeasuredWidth()I

    move-result v17

    add-int v10, v10, v17

    goto :goto_7a

    .line 1563
    .end local v2    # "childLeft":I
    .restart local v17    # "childLeft":I
    :cond_65
    move v2, v9

    .line 1564
    .end local v17    # "childLeft":I
    .restart local v2    # "childLeft":I
    invoke-virtual {v14}, Landroid/view/View;->getMeasuredWidth()I

    move-result v17

    add-int v9, v9, v17

    .line 1565
    goto :goto_7a

    .line 1567
    .end local v2    # "childLeft":I
    .restart local v17    # "childLeft":I
    :cond_6d
    invoke-virtual {v14}, Landroid/view/View;->getMeasuredWidth()I

    move-result v2

    sub-int v2, v4, v2

    div-int/lit8 v2, v2, 0x2

    invoke-static {v2, v9}, Ljava/lang/Math;->max(II)I

    move-result v2

    .line 1569
    .end local v17    # "childLeft":I
    .restart local v2    # "childLeft":I
    nop

    .line 1575
    :goto_7a
    move/from16 v20, v3

    .end local v3    # "hgrav":I
    .local v20, "hgrav":I
    const/16 v3, 0x10

    if-eq v5, v3, :cond_a1

    const/16 v3, 0x30

    if-eq v5, v3, :cond_99

    const/16 v3, 0x50

    if-eq v5, v3, :cond_8a

    .line 1577
    move v3, v11

    .line 1578
    .end local v16    # "childTop":I
    .local v3, "childTop":I
    goto :goto_ae

    .line 1588
    .end local v3    # "childTop":I
    .restart local v16    # "childTop":I
    :cond_8a
    sub-int v3, v7, v13

    invoke-virtual {v14}, Landroid/view/View;->getMeasuredHeight()I

    move-result v17

    sub-int v3, v3, v17

    .line 1589
    .end local v16    # "childTop":I
    .restart local v3    # "childTop":I
    invoke-virtual {v14}, Landroid/view/View;->getMeasuredHeight()I

    move-result v16

    add-int v13, v13, v16

    goto :goto_ae

    .line 1580
    .end local v3    # "childTop":I
    .restart local v16    # "childTop":I
    :cond_99
    move v3, v11

    .line 1581
    .end local v16    # "childTop":I
    .restart local v3    # "childTop":I
    invoke-virtual {v14}, Landroid/view/View;->getMeasuredHeight()I

    move-result v16

    add-int v11, v11, v16

    .line 1582
    goto :goto_ae

    .line 1584
    .end local v3    # "childTop":I
    .restart local v16    # "childTop":I
    :cond_a1
    invoke-virtual {v14}, Landroid/view/View;->getMeasuredHeight()I

    move-result v3

    sub-int v3, v7, v3

    div-int/lit8 v3, v3, 0x2

    invoke-static {v3, v11}, Ljava/lang/Math;->max(II)I

    move-result v3

    .line 1586
    .end local v16    # "childTop":I
    .restart local v3    # "childTop":I
    nop

    .line 1592
    :goto_ae
    add-int/2addr v2, v12

    .line 1593
    invoke-virtual {v14}, Landroid/view/View;->getMeasuredWidth()I

    move-result v16

    move/from16 v21, v5

    add-int v5, v2, v16

    .end local v5    # "vgrav":I
    .local v21, "vgrav":I
    invoke-virtual {v14}, Landroid/view/View;->getMeasuredHeight()I

    move-result v16

    add-int v6, v3, v16

    invoke-virtual {v14, v2, v3, v5, v6}, Landroid/view/View;->layout(IIII)V

    .line 1596
    add-int/lit8 v15, v15, 0x1

    .line 1549
    .end local v2    # "childLeft":I
    .end local v3    # "childTop":I
    .end local v14    # "child":Landroid/view/View;
    .end local v18    # "lp":Landroid/support/v4/view/ViewPager$LayoutParams;
    .end local v20    # "hgrav":I
    .end local v21    # "vgrav":I
    :cond_c2
    add-int/lit8 v8, v8, 0x1

    goto/16 :goto_24

    .line 1601
    .end local v8    # "i":I
    :cond_c6
    sub-int v2, v4, v9

    sub-int/2addr v2, v10

    .line 1603
    .local v2, "childWidth":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_ca
    if-ge v3, v1, :cond_13e

    .line 1604
    invoke-virtual {v0, v3}, Landroid/support/v4/view/ViewPager;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    .line 1605
    .local v5, "child":Landroid/view/View;
    invoke-virtual {v5}, Landroid/view/View;->getVisibility()I

    move-result v6

    const/16 v8, 0x8

    if-eq v6, v8, :cond_12f

    .line 1606
    invoke-virtual {v5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v6

    check-cast v6, Landroid/support/v4/view/ViewPager$LayoutParams;

    .line 1608
    .local v6, "lp":Landroid/support/v4/view/ViewPager$LayoutParams;
    iget-boolean v14, v6, Landroid/support/v4/view/ViewPager$LayoutParams;->isDecor:Z

    if-nez v14, :cond_12f

    invoke-virtual {v0, v5}, Landroid/support/v4/view/ViewPager;->infoForChild(Landroid/view/View;)Landroid/support/v4/view/ViewPager$ItemInfo;

    move-result-object v14

    move-object/from16 v22, v14

    .local v22, "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    if-eqz v14, :cond_12f

    .line 1609
    int-to-float v14, v2

    move/from16 v23, v1

    move-object/from16 v8, v22

    iget v1, v8, Landroid/support/v4/view/ViewPager$ItemInfo;->offset:F

    .end local v1    # "count":I
    .end local v22    # "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    .local v8, "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    .local v23, "count":I
    mul-float/2addr v14, v1

    float-to-int v1, v14

    .line 1610
    .local v1, "loff":I
    add-int v14, v9, v1

    .line 1611
    .local v14, "childLeft":I
    move/from16 v24, v11

    .line 1612
    .local v24, "childTop":I
    move/from16 v25, v1

    iget-boolean v1, v6, Landroid/support/v4/view/ViewPager$LayoutParams;->needsMeasure:Z

    .end local v1    # "loff":I
    .local v25, "loff":I
    if-eqz v1, :cond_11b

    .line 1615
    const/4 v1, 0x0

    iput-boolean v1, v6, Landroid/support/v4/view/ViewPager$LayoutParams;->needsMeasure:Z

    .line 1616
    int-to-float v1, v2

    move/from16 v26, v2

    iget v2, v6, Landroid/support/v4/view/ViewPager$LayoutParams;->widthFactor:F

    .end local v2    # "childWidth":I
    .local v26, "childWidth":I
    mul-float/2addr v1, v2

    float-to-int v1, v1

    const/high16 v2, 0x40000000    # 2.0f

    invoke-static {v1, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v1

    .line 1619
    .local v1, "widthSpec":I
    sub-int v16, v7, v11

    move/from16 v27, v4

    sub-int v4, v16, v13

    .end local v4    # "width":I
    .local v27, "width":I
    invoke-static {v4, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v2

    .line 1622
    .local v2, "heightSpec":I
    invoke-virtual {v5, v1, v2}, Landroid/view/View;->measure(II)V

    .end local v1    # "widthSpec":I
    .end local v2    # "heightSpec":I
    goto :goto_11f

    .line 1627
    .end local v26    # "childWidth":I
    .end local v27    # "width":I
    .local v2, "childWidth":I
    .restart local v4    # "width":I
    :cond_11b
    move/from16 v26, v2

    move/from16 v27, v4

    .end local v2    # "childWidth":I
    .end local v4    # "width":I
    .restart local v26    # "childWidth":I
    .restart local v27    # "width":I
    :goto_11f
    invoke-virtual {v5}, Landroid/view/View;->getMeasuredWidth()I

    move-result v1

    add-int/2addr v1, v14

    invoke-virtual {v5}, Landroid/view/View;->getMeasuredHeight()I

    move-result v2

    move/from16 v4, v24

    add-int/2addr v2, v4

    .end local v24    # "childTop":I
    .local v4, "childTop":I
    invoke-virtual {v5, v14, v4, v1, v2}, Landroid/view/View;->layout(IIII)V

    .end local v4    # "childTop":I
    .end local v5    # "child":Landroid/view/View;
    .end local v6    # "lp":Landroid/support/v4/view/ViewPager$LayoutParams;
    .end local v8    # "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    .end local v14    # "childLeft":I
    .end local v25    # "loff":I
    goto :goto_135

    .line 1603
    .end local v23    # "count":I
    .end local v26    # "childWidth":I
    .end local v27    # "width":I
    .local v1, "count":I
    .restart local v2    # "childWidth":I
    .local v4, "width":I
    :cond_12f
    move/from16 v23, v1

    move/from16 v26, v2

    move/from16 v27, v4

    .end local v1    # "count":I
    .end local v2    # "childWidth":I
    .end local v4    # "width":I
    .restart local v23    # "count":I
    .restart local v26    # "childWidth":I
    .restart local v27    # "width":I
    :goto_135
    add-int/lit8 v3, v3, 0x1

    move/from16 v1, v23

    move/from16 v2, v26

    move/from16 v4, v27

    goto :goto_ca

    .line 1633
    .end local v3    # "i":I
    .end local v23    # "count":I
    .end local v26    # "childWidth":I
    .end local v27    # "width":I
    .restart local v1    # "count":I
    .restart local v2    # "childWidth":I
    .restart local v4    # "width":I
    :cond_13e
    move/from16 v23, v1

    move/from16 v26, v2

    move/from16 v27, v4

    .end local v1    # "count":I
    .end local v2    # "childWidth":I
    .end local v4    # "width":I
    .restart local v23    # "count":I
    .restart local v26    # "childWidth":I
    .restart local v27    # "width":I
    iput v11, v0, Landroid/support/v4/view/ViewPager;->mTopPageBounds:I

    .line 1634
    sub-int v1, v7, v13

    iput v1, v0, Landroid/support/v4/view/ViewPager;->mBottomPageBounds:I

    .line 1635
    iput v15, v0, Landroid/support/v4/view/ViewPager;->mDecorChildCount:I

    .line 1637
    iget-boolean v1, v0, Landroid/support/v4/view/ViewPager;->mFirstLayout:Z

    if-eqz v1, :cond_157

    .line 1638
    iget v1, v0, Landroid/support/v4/view/ViewPager;->mCurItem:I

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2, v2}, Landroid/support/v4/view/ViewPager;->scrollToItem(IZIZ)V

    goto :goto_158

    .line 1640
    :cond_157
    const/4 v2, 0x0

    :goto_158
    iput-boolean v2, v0, Landroid/support/v4/view/ViewPager;->mFirstLayout:Z

    .line 1641
    return-void
.end method

.method protected onMeasure(II)V
    .registers 25
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    move-object/from16 v0, p0

    .line 1407
    const/4 v1, 0x0

    move/from16 v2, p1

    invoke-static {v1, v2}, Landroid/support/v4/view/ViewPager;->getDefaultSize(II)I

    move-result v3

    move/from16 v4, p2

    invoke-static {v1, v4}, Landroid/support/v4/view/ViewPager;->getDefaultSize(II)I

    move-result v5

    invoke-virtual {v0, v3, v5}, Landroid/support/v4/view/ViewPager;->setMeasuredDimension(II)V

    .line 1410
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getMeasuredWidth()I

    move-result v3

    .line 1411
    .local v3, "measuredWidth":I
    div-int/lit8 v5, v3, 0xa

    .line 1412
    .local v5, "maxGutterSize":I
    iget v6, v0, Landroid/support/v4/view/ViewPager;->mDefaultGutterSize:I

    invoke-static {v5, v6}, Ljava/lang/Math;->min(II)I

    move-result v6

    iput v6, v0, Landroid/support/v4/view/ViewPager;->mGutterSize:I

    .line 1415
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getPaddingLeft()I

    move-result v6

    sub-int v6, v3, v6

    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getPaddingRight()I

    move-result v7

    sub-int/2addr v6, v7

    .line 1416
    .local v6, "childWidthSize":I
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getMeasuredHeight()I

    move-result v7

    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getPaddingTop()I

    move-result v8

    sub-int/2addr v7, v8

    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getPaddingBottom()I

    move-result v8

    sub-int/2addr v7, v8

    .line 1423
    .local v7, "childHeightSize":I
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getChildCount()I

    move-result v8

    .line 1424
    .local v8, "size":I
    move v9, v7

    move v7, v6

    move v6, v1

    .local v6, "i":I
    .local v7, "childWidthSize":I
    .local v9, "childHeightSize":I
    :goto_40
    const/16 v10, 0x8

    if-ge v6, v8, :cond_e7

    .line 1425
    invoke-virtual {v0, v6}, Landroid/support/v4/view/ViewPager;->getChildAt(I)Landroid/view/View;

    move-result-object v12

    .line 1426
    .local v12, "child":Landroid/view/View;
    invoke-virtual {v12}, Landroid/view/View;->getVisibility()I

    move-result v13

    if-eq v13, v10, :cond_d6

    .line 1427
    invoke-virtual {v12}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v10

    check-cast v10, Landroid/support/v4/view/ViewPager$LayoutParams;

    .line 1428
    .local v10, "lp":Landroid/support/v4/view/ViewPager$LayoutParams;
    if-eqz v10, :cond_d6

    iget-boolean v13, v10, Landroid/support/v4/view/ViewPager$LayoutParams;->isDecor:Z

    if-eqz v13, :cond_d6

    .line 1429
    iget v13, v10, Landroid/support/v4/view/ViewPager$LayoutParams;->gravity:I

    and-int/lit8 v13, v13, 0x7

    .line 1430
    .local v13, "hgrav":I
    iget v14, v10, Landroid/support/v4/view/ViewPager$LayoutParams;->gravity:I

    and-int/lit8 v14, v14, 0x70

    .line 1431
    .local v14, "vgrav":I
    const/high16 v15, -0x80000000

    .line 1432
    .local v15, "widthMode":I
    const/high16 v16, -0x80000000

    .line 1433
    .local v16, "heightMode":I
    const/16 v1, 0x30

    if-eq v14, v1, :cond_71

    const/16 v1, 0x50

    if-ne v14, v1, :cond_6f

    goto :goto_71

    :cond_6f
    const/4 v1, 0x0

    goto :goto_72

    :cond_71
    :goto_71
    const/4 v1, 0x1

    .line 1434
    .local v1, "consumeVertical":Z
    :goto_72
    const/4 v11, 0x3

    if-eq v13, v11, :cond_7c

    const/4 v11, 0x5

    if-ne v13, v11, :cond_79

    goto :goto_7c

    :cond_79
    const/16 v17, 0x0

    goto :goto_7e

    :cond_7c
    :goto_7c
    const/16 v17, 0x1

    :goto_7e
    move/from16 v11, v17

    .line 1436
    .local v11, "consumeHorizontal":Z
    if-eqz v1, :cond_85

    .line 1437
    const/high16 v15, 0x40000000    # 2.0f

    goto :goto_89

    .line 1438
    :cond_85
    if-eqz v11, :cond_89

    .line 1439
    const/high16 v16, 0x40000000    # 2.0f

    .line 1442
    :cond_89
    :goto_89
    move/from16 v17, v7

    .line 1443
    .local v17, "widthSize":I
    move/from16 v18, v9

    .line 1444
    .local v18, "heightSize":I
    iget v2, v10, Landroid/support/v4/view/ViewPager$LayoutParams;->width:I

    move/from16 v19, v3

    .end local v3    # "measuredWidth":I
    .local v19, "measuredWidth":I
    const/4 v3, -0x2

    if-eq v2, v3, :cond_9e

    .line 1445
    const/high16 v15, 0x40000000    # 2.0f

    .line 1446
    iget v2, v10, Landroid/support/v4/view/ViewPager$LayoutParams;->width:I

    const/4 v3, -0x1

    if-eq v2, v3, :cond_9e

    .line 1447
    iget v2, v10, Landroid/support/v4/view/ViewPager$LayoutParams;->width:I

    .end local v17    # "widthSize":I
    .local v2, "widthSize":I
    goto :goto_a0

    .line 1450
    .end local v2    # "widthSize":I
    .restart local v17    # "widthSize":I
    :cond_9e
    move/from16 v2, v17

    .end local v17    # "widthSize":I
    .restart local v2    # "widthSize":I
    :goto_a0
    iget v3, v10, Landroid/support/v4/view/ViewPager$LayoutParams;->height:I

    const/4 v4, -0x2

    if-eq v3, v4, :cond_b1

    .line 1451
    const/high16 v16, 0x40000000    # 2.0f

    .line 1452
    iget v3, v10, Landroid/support/v4/view/ViewPager$LayoutParams;->height:I

    const/4 v4, -0x1

    if-eq v3, v4, :cond_b1

    .line 1453
    iget v3, v10, Landroid/support/v4/view/ViewPager$LayoutParams;->height:I

    .line 1456
    .end local v18    # "heightSize":I
    .local v3, "heightSize":I
    move/from16 v4, v16

    goto :goto_b5

    .end local v3    # "heightSize":I
    .restart local v18    # "heightSize":I
    :cond_b1
    move/from16 v4, v16

    move/from16 v3, v18

    .end local v16    # "heightMode":I
    .end local v18    # "heightSize":I
    .restart local v3    # "heightSize":I
    .local v4, "heightMode":I
    :goto_b5
    move/from16 v20, v5

    invoke-static {v2, v15}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v5

    .line 1457
    .local v5, "widthSpec":I
    .local v20, "maxGutterSize":I
    move/from16 v21, v2

    invoke-static {v3, v4}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v2

    .line 1458
    .local v2, "heightSpec":I
    .local v21, "widthSize":I
    invoke-virtual {v12, v5, v2}, Landroid/view/View;->measure(II)V

    .line 1460
    if-eqz v1, :cond_cd

    .line 1461
    invoke-virtual {v12}, Landroid/view/View;->getMeasuredHeight()I

    move-result v16

    sub-int v9, v9, v16

    goto :goto_da

    .line 1462
    :cond_cd
    if-eqz v11, :cond_da

    .line 1463
    invoke-virtual {v12}, Landroid/view/View;->getMeasuredWidth()I

    move-result v16

    sub-int v7, v7, v16

    .end local v1    # "consumeVertical":Z
    .end local v2    # "heightSpec":I
    .end local v3    # "heightSize":I
    .end local v4    # "heightMode":I
    .end local v5    # "widthSpec":I
    .end local v10    # "lp":Landroid/support/v4/view/ViewPager$LayoutParams;
    .end local v11    # "consumeHorizontal":Z
    .end local v12    # "child":Landroid/view/View;
    .end local v13    # "hgrav":I
    .end local v14    # "vgrav":I
    .end local v15    # "widthMode":I
    .end local v21    # "widthSize":I
    goto :goto_da

    .line 1424
    .end local v19    # "measuredWidth":I
    .end local v20    # "maxGutterSize":I
    .local v3, "measuredWidth":I
    .local v5, "maxGutterSize":I
    :cond_d6
    move/from16 v19, v3

    move/from16 v20, v5

    .end local v3    # "measuredWidth":I
    .end local v5    # "maxGutterSize":I
    .restart local v19    # "measuredWidth":I
    .restart local v20    # "maxGutterSize":I
    :cond_da
    :goto_da
    add-int/lit8 v6, v6, 0x1

    move/from16 v3, v19

    move/from16 v5, v20

    const/4 v1, 0x0

    move/from16 v2, p1

    move/from16 v4, p2

    goto/16 :goto_40

    .line 1469
    .end local v6    # "i":I
    .end local v19    # "measuredWidth":I
    .end local v20    # "maxGutterSize":I
    .restart local v3    # "measuredWidth":I
    .restart local v5    # "maxGutterSize":I
    :cond_e7
    move/from16 v19, v3

    move/from16 v20, v5

    .end local v3    # "measuredWidth":I
    .end local v5    # "maxGutterSize":I
    .restart local v19    # "measuredWidth":I
    .restart local v20    # "maxGutterSize":I
    const/high16 v1, 0x40000000    # 2.0f

    invoke-static {v7, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v2

    iput v2, v0, Landroid/support/v4/view/ViewPager;->mChildWidthMeasureSpec:I

    .line 1470
    invoke-static {v9, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v2

    iput v2, v0, Landroid/support/v4/view/ViewPager;->mChildHeightMeasureSpec:I

    .line 1473
    const/4 v2, 0x1

    iput-boolean v2, v0, Landroid/support/v4/view/ViewPager;->mInLayout:Z

    .line 1474
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->populate()V

    .line 1475
    const/4 v2, 0x0

    iput-boolean v2, v0, Landroid/support/v4/view/ViewPager;->mInLayout:Z

    .line 1478
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getChildCount()I

    move-result v3

    .line 1479
    .end local v8    # "size":I
    .local v3, "size":I
    nop

    .local v2, "i":I
    :goto_107
    if-ge v2, v3, :cond_130

    .line 1480
    invoke-virtual {v0, v2}, Landroid/support/v4/view/ViewPager;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    .line 1481
    .local v4, "child":Landroid/view/View;
    invoke-virtual {v4}, Landroid/view/View;->getVisibility()I

    move-result v5

    if-eq v5, v10, :cond_12d

    .line 1485
    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    check-cast v5, Landroid/support/v4/view/ViewPager$LayoutParams;

    .line 1486
    .local v5, "lp":Landroid/support/v4/view/ViewPager$LayoutParams;
    if-eqz v5, :cond_11f

    iget-boolean v6, v5, Landroid/support/v4/view/ViewPager$LayoutParams;->isDecor:Z

    if-nez v6, :cond_12d

    .line 1487
    :cond_11f
    int-to-float v6, v7

    iget v8, v5, Landroid/support/v4/view/ViewPager$LayoutParams;->widthFactor:F

    mul-float/2addr v6, v8

    float-to-int v6, v6

    invoke-static {v6, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v6

    .line 1489
    .local v6, "widthSpec":I
    iget v8, v0, Landroid/support/v4/view/ViewPager;->mChildHeightMeasureSpec:I

    invoke-virtual {v4, v6, v8}, Landroid/view/View;->measure(II)V

    .line 1479
    .end local v4    # "child":Landroid/view/View;
    .end local v5    # "lp":Landroid/support/v4/view/ViewPager$LayoutParams;
    .end local v6    # "widthSpec":I
    :cond_12d
    add-int/lit8 v2, v2, 0x1

    goto :goto_107

    .line 1493
    .end local v2    # "i":I
    :cond_130
    return-void
.end method

.method protected onPageScrolled(IFI)V
    .registers 19
    .param p1, "position"    # I
    .param p2, "offset"    # F
    .param p3, "offsetPixels"    # I
    .annotation build Landroid/support/annotation/CallSuper;
    .end annotation

    move-object v0, p0

    .line 1711
    iget v1, v0, Landroid/support/v4/view/ViewPager;->mDecorChildCount:I

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-lez v1, :cond_6f

    .line 1712
    invoke-virtual {v0}, Landroid/support/v4/view/ViewPager;->getScrollX()I

    move-result v1

    .line 1713
    .local v1, "scrollX":I
    invoke-virtual {v0}, Landroid/support/v4/view/ViewPager;->getPaddingLeft()I

    move-result v4

    .line 1714
    .local v4, "paddingLeft":I
    invoke-virtual {v0}, Landroid/support/v4/view/ViewPager;->getPaddingRight()I

    move-result v5

    .line 1715
    .local v5, "paddingRight":I
    invoke-virtual {v0}, Landroid/support/v4/view/ViewPager;->getWidth()I

    move-result v6

    .line 1716
    .local v6, "width":I
    invoke-virtual {v0}, Landroid/support/v4/view/ViewPager;->getChildCount()I

    move-result v7

    .line 1717
    .local v7, "childCount":I
    move v8, v5

    move v5, v4

    move v4, v2

    .local v4, "i":I
    .local v5, "paddingLeft":I
    .local v8, "paddingRight":I
    :goto_1e
    if-ge v4, v7, :cond_6f

    .line 1718
    invoke-virtual {v0, v4}, Landroid/support/v4/view/ViewPager;->getChildAt(I)Landroid/view/View;

    move-result-object v9

    .line 1719
    .local v9, "child":Landroid/view/View;
    invoke-virtual {v9}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v10

    check-cast v10, Landroid/support/v4/view/ViewPager$LayoutParams;

    .line 1720
    .local v10, "lp":Landroid/support/v4/view/ViewPager$LayoutParams;
    iget-boolean v11, v10, Landroid/support/v4/view/ViewPager$LayoutParams;->isDecor:Z

    if-nez v11, :cond_2f

    .end local v9    # "child":Landroid/view/View;
    .end local v10    # "lp":Landroid/support/v4/view/ViewPager$LayoutParams;
    goto :goto_6c

    .line 1722
    .restart local v9    # "child":Landroid/view/View;
    .restart local v10    # "lp":Landroid/support/v4/view/ViewPager$LayoutParams;
    :cond_2f
    iget v11, v10, Landroid/support/v4/view/ViewPager$LayoutParams;->gravity:I

    and-int/lit8 v11, v11, 0x7

    .line 1723
    .local v11, "hgrav":I
    const/4 v12, 0x0

    .line 1724
    .local v12, "childLeft":I
    if-eq v11, v3, :cond_53

    const/4 v13, 0x3

    if-eq v11, v13, :cond_4c

    const/4 v13, 0x5

    if-eq v11, v13, :cond_3e

    .line 1726
    move v12, v5

    .line 1727
    goto :goto_60

    .line 1737
    :cond_3e
    sub-int v13, v6, v8

    invoke-virtual {v9}, Landroid/view/View;->getMeasuredWidth()I

    move-result v14

    sub-int v12, v13, v14

    .line 1738
    invoke-virtual {v9}, Landroid/view/View;->getMeasuredWidth()I

    move-result v13

    add-int/2addr v8, v13

    goto :goto_60

    .line 1729
    :cond_4c
    move v12, v5

    .line 1730
    invoke-virtual {v9}, Landroid/view/View;->getWidth()I

    move-result v13

    add-int/2addr v5, v13

    .line 1731
    goto :goto_60

    .line 1733
    :cond_53
    invoke-virtual {v9}, Landroid/view/View;->getMeasuredWidth()I

    move-result v13

    sub-int v13, v6, v13

    div-int/lit8 v13, v13, 0x2

    invoke-static {v13, v5}, Ljava/lang/Math;->max(II)I

    move-result v12

    .line 1735
    nop

    .line 1741
    :goto_60
    add-int/2addr v12, v1

    .line 1743
    invoke-virtual {v9}, Landroid/view/View;->getLeft()I

    move-result v13

    sub-int v13, v12, v13

    .line 1744
    .local v13, "childOffset":I
    if-eqz v13, :cond_6c

    .line 1745
    invoke-virtual {v9, v13}, Landroid/view/View;->offsetLeftAndRight(I)V

    .line 1717
    .end local v9    # "child":Landroid/view/View;
    .end local v10    # "lp":Landroid/support/v4/view/ViewPager$LayoutParams;
    .end local v11    # "hgrav":I
    .end local v12    # "childLeft":I
    .end local v13    # "childOffset":I
    :cond_6c
    :goto_6c
    add-int/lit8 v4, v4, 0x1

    goto :goto_1e

    .line 1750
    .end local v1    # "scrollX":I
    .end local v4    # "i":I
    .end local v5    # "paddingLeft":I
    .end local v6    # "width":I
    .end local v7    # "childCount":I
    .end local v8    # "paddingRight":I
    :cond_6f
    invoke-direct/range {p0 .. p3}, Landroid/support/v4/view/ViewPager;->dispatchOnPageScrolled(IFI)V

    .line 1752
    iget-object v1, v0, Landroid/support/v4/view/ViewPager;->mPageTransformer:Landroid/support/v4/view/ViewPager$PageTransformer;

    if-eqz v1, :cond_a4

    .line 1753
    invoke-virtual {v0}, Landroid/support/v4/view/ViewPager;->getScrollX()I

    move-result v1

    .line 1754
    .restart local v1    # "scrollX":I
    invoke-virtual {v0}, Landroid/support/v4/view/ViewPager;->getChildCount()I

    move-result v4

    .line 1755
    .local v4, "childCount":I
    nop

    .local v2, "i":I
    :goto_7f
    if-ge v2, v4, :cond_a4

    .line 1756
    invoke-virtual {v0, v2}, Landroid/support/v4/view/ViewPager;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    .line 1757
    .local v5, "child":Landroid/view/View;
    invoke-virtual {v5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v6

    check-cast v6, Landroid/support/v4/view/ViewPager$LayoutParams;

    .line 1759
    .local v6, "lp":Landroid/support/v4/view/ViewPager$LayoutParams;
    iget-boolean v7, v6, Landroid/support/v4/view/ViewPager$LayoutParams;->isDecor:Z

    if-eqz v7, :cond_90

    .end local v5    # "child":Landroid/view/View;
    .end local v6    # "lp":Landroid/support/v4/view/ViewPager$LayoutParams;
    goto :goto_a1

    .line 1761
    .restart local v5    # "child":Landroid/view/View;
    .restart local v6    # "lp":Landroid/support/v4/view/ViewPager$LayoutParams;
    :cond_90
    invoke-virtual {v5}, Landroid/view/View;->getLeft()I

    move-result v7

    sub-int/2addr v7, v1

    int-to-float v7, v7

    invoke-direct {v0}, Landroid/support/v4/view/ViewPager;->getClientWidth()I

    move-result v8

    int-to-float v8, v8

    div-float/2addr v7, v8

    .line 1762
    .local v7, "transformPos":F
    iget-object v8, v0, Landroid/support/v4/view/ViewPager;->mPageTransformer:Landroid/support/v4/view/ViewPager$PageTransformer;

    invoke-interface {v8, v5, v7}, Landroid/support/v4/view/ViewPager$PageTransformer;->transformPage(Landroid/view/View;F)V

    .line 1755
    .end local v5    # "child":Landroid/view/View;
    .end local v6    # "lp":Landroid/support/v4/view/ViewPager$LayoutParams;
    .end local v7    # "transformPos":F
    :goto_a1
    add-int/lit8 v2, v2, 0x1

    goto :goto_7f

    .line 1766
    .end local v1    # "scrollX":I
    .end local v2    # "i":I
    .end local v4    # "childCount":I
    :cond_a4
    iput-boolean v3, v0, Landroid/support/v4/view/ViewPager;->mCalledSuper:Z

    .line 1767
    return-void
.end method

.method protected onRequestFocusInDescendants(ILandroid/graphics/Rect;)Z
    .registers 12
    .param p1, "direction"    # I
    .param p2, "previouslyFocusedRect"    # Landroid/graphics/Rect;

    .line 2781
    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getChildCount()I

    move-result v0

    .line 2782
    .local v0, "count":I
    and-int/lit8 v1, p1, 0x2

    if-eqz v1, :cond_c

    .line 2783
    const/4 v1, 0x0

    .line 2784
    .local v1, "index":I
    const/4 v2, 0x1

    .line 2785
    .local v2, "increment":I
    move v3, v0

    .local v3, "end":I
    goto :goto_10

    .line 2787
    .end local v1    # "index":I
    .end local v2    # "increment":I
    .end local v3    # "end":I
    :cond_c
    add-int/lit8 v1, v0, -0x1

    .line 2788
    .restart local v1    # "index":I
    const/4 v2, -0x1

    .line 2789
    .restart local v2    # "increment":I
    const/4 v3, -0x1

    .line 2791
    .restart local v3    # "end":I
    :goto_10
    move v4, v1

    .local v4, "i":I
    :goto_11
    if-eq v4, v3, :cond_33

    .line 2792
    invoke-virtual {p0, v4}, Landroid/support/v4/view/ViewPager;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    .line 2793
    .local v5, "child":Landroid/view/View;
    invoke-virtual {v5}, Landroid/view/View;->getVisibility()I

    move-result v6

    if-nez v6, :cond_31

    .line 2794
    invoke-virtual {p0, v5}, Landroid/support/v4/view/ViewPager;->infoForChild(Landroid/view/View;)Landroid/support/v4/view/ViewPager$ItemInfo;

    move-result-object v6

    .line 2795
    .local v6, "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    if-eqz v6, :cond_31

    iget v7, v6, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    iget v8, p0, Landroid/support/v4/view/ViewPager;->mCurItem:I

    if-ne v7, v8, :cond_31

    .line 2796
    invoke-virtual {v5, p1, p2}, Landroid/view/View;->requestFocus(ILandroid/graphics/Rect;)Z

    move-result v7

    if-eqz v7, :cond_31

    .line 2797
    const/4 v7, 0x1

    return v7

    .line 2791
    .end local v5    # "child":Landroid/view/View;
    .end local v6    # "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    :cond_31
    add-int/2addr v4, v2

    goto :goto_11

    .line 2802
    .end local v4    # "i":I
    :cond_33
    const/4 v4, 0x0

    return v4
.end method

.method public onRestoreInstanceState(Landroid/os/Parcelable;)V
    .registers 6
    .param p1, "state"    # Landroid/os/Parcelable;

    .line 1310
    instance-of v0, p1, Landroid/support/v4/view/ViewPager$SavedState;

    if-nez v0, :cond_8

    .line 1311
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 1312
    return-void

    .line 1315
    :cond_8
    move-object v0, p1

    check-cast v0, Landroid/support/v4/view/ViewPager$SavedState;

    .line 1316
    .local v0, "ss":Landroid/support/v4/view/ViewPager$SavedState;
    invoke-virtual {v0}, Landroid/support/v4/view/ViewPager$SavedState;->getSuperState()Landroid/os/Parcelable;

    move-result-object v1

    invoke-super {p0, v1}, Landroid/view/ViewGroup;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 1318
    iget-object v1, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    if-eqz v1, :cond_27

    .line 1319
    iget-object v1, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    iget-object v2, v0, Landroid/support/v4/view/ViewPager$SavedState;->adapterState:Landroid/os/Parcelable;

    iget-object v3, v0, Landroid/support/v4/view/ViewPager$SavedState;->loader:Ljava/lang/ClassLoader;

    invoke-virtual {v1, v2, v3}, Landroid/support/v4/view/PagerAdapter;->restoreState(Landroid/os/Parcelable;Ljava/lang/ClassLoader;)V

    .line 1320
    iget v1, v0, Landroid/support/v4/view/ViewPager$SavedState;->position:I

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-virtual {p0, v1, v2, v3}, Landroid/support/v4/view/ViewPager;->setCurrentItemInternal(IZZ)V

    goto :goto_33

    .line 1322
    :cond_27
    iget v1, v0, Landroid/support/v4/view/ViewPager$SavedState;->position:I

    iput v1, p0, Landroid/support/v4/view/ViewPager;->mRestoredCurItem:I

    .line 1323
    iget-object v1, v0, Landroid/support/v4/view/ViewPager$SavedState;->adapterState:Landroid/os/Parcelable;

    iput-object v1, p0, Landroid/support/v4/view/ViewPager;->mRestoredAdapterState:Landroid/os/Parcelable;

    .line 1324
    iget-object v1, v0, Landroid/support/v4/view/ViewPager$SavedState;->loader:Ljava/lang/ClassLoader;

    iput-object v1, p0, Landroid/support/v4/view/ViewPager;->mRestoredClassLoader:Ljava/lang/ClassLoader;

    .line 1326
    :goto_33
    return-void
.end method

.method public onSaveInstanceState()Landroid/os/Parcelable;
    .registers 4

    .line 1299
    invoke-super {p0}, Landroid/view/ViewGroup;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v0

    .line 1300
    .local v0, "superState":Landroid/os/Parcelable;
    new-instance v1, Landroid/support/v4/view/ViewPager$SavedState;

    invoke-direct {v1, v0}, Landroid/support/v4/view/ViewPager$SavedState;-><init>(Landroid/os/Parcelable;)V

    .line 1301
    .local v1, "ss":Landroid/support/v4/view/ViewPager$SavedState;
    iget v2, p0, Landroid/support/v4/view/ViewPager;->mCurItem:I

    iput v2, v1, Landroid/support/v4/view/ViewPager$SavedState;->position:I

    .line 1302
    iget-object v2, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    if-eqz v2, :cond_19

    .line 1303
    iget-object v2, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    invoke-virtual {v2}, Landroid/support/v4/view/PagerAdapter;->saveState()Landroid/os/Parcelable;

    move-result-object v2

    iput-object v2, v1, Landroid/support/v4/view/ViewPager$SavedState;->adapterState:Landroid/os/Parcelable;

    .line 1305
    :cond_19
    return-object v1
.end method

.method protected onSizeChanged(IIII)V
    .registers 7
    .param p1, "w"    # I
    .param p2, "h"    # I
    .param p3, "oldw"    # I
    .param p4, "oldh"    # I

    .line 1497
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/ViewGroup;->onSizeChanged(IIII)V

    .line 1500
    if-eq p1, p3, :cond_c

    .line 1501
    iget v0, p0, Landroid/support/v4/view/ViewPager;->mPageMargin:I

    iget v1, p0, Landroid/support/v4/view/ViewPager;->mPageMargin:I

    invoke-direct {p0, p1, p3, v0, v1}, Landroid/support/v4/view/ViewPager;->recomputeScrollPosition(IIII)V

    .line 1503
    :cond_c
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 19
    .param p1, "ev"    # Landroid/view/MotionEvent;

    move-object/from16 v0, p0

    .line 2013
    move-object/from16 v1, p1

    iget-boolean v2, v0, Landroid/support/v4/view/ViewPager;->mFakeDragging:Z

    const/4 v3, 0x1

    if-eqz v2, :cond_a

    .line 2017
    return v3

    .line 2020
    :cond_a
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v2

    const/4 v4, 0x0

    if-nez v2, :cond_18

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getEdgeFlags()I

    move-result v2

    if-eqz v2, :cond_18

    .line 2023
    return v4

    .line 2026
    :cond_18
    iget-object v2, v0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    if-eqz v2, :cond_179

    iget-object v2, v0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    invoke-virtual {v2}, Landroid/support/v4/view/PagerAdapter;->getCount()I

    move-result v2

    if-nez v2, :cond_26

    goto/16 :goto_179

    .line 2031
    :cond_26
    iget-object v2, v0, Landroid/support/v4/view/ViewPager;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-nez v2, :cond_30

    .line 2032
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    move-result-object v2

    iput-object v2, v0, Landroid/support/v4/view/ViewPager;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 2034
    :cond_30
    iget-object v2, v0, Landroid/support/v4/view/ViewPager;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v2, v1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 2036
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v2

    .line 2037
    .local v2, "action":I
    const/4 v5, 0x0

    .line 2039
    .local v5, "needsInvalidate":Z
    and-int/lit16 v6, v2, 0xff

    const/4 v7, -0x1

    packed-switch v6, :pswitch_data_17a

    .line 2131
    :cond_40
    :pswitch_40
    move/from16 v16, v2

    .end local v2    # "action":I
    .local v16, "action":I
    goto/16 :goto_172

    .line 2126
    .end local v16    # "action":I
    .restart local v2    # "action":I
    :pswitch_44
    invoke-direct/range {p0 .. p1}, Landroid/support/v4/view/ViewPager;->onSecondaryPointerUp(Landroid/view/MotionEvent;)V

    .line 2127
    iget v4, v0, Landroid/support/v4/view/ViewPager;->mActivePointerId:I

    invoke-static {v1, v4}, Landroid/support/v4/view/MotionEventCompat;->findPointerIndex(Landroid/view/MotionEvent;I)I

    move-result v4

    invoke-static {v1, v4}, Landroid/support/v4/view/MotionEventCompat;->getX(Landroid/view/MotionEvent;I)F

    move-result v4

    iput v4, v0, Landroid/support/v4/view/ViewPager;->mLastMotionX:F

    goto :goto_81

    .line 2119
    :pswitch_54
    invoke-static/range {p1 .. p1}, Landroid/support/v4/view/MotionEventCompat;->getActionIndex(Landroid/view/MotionEvent;)I

    move-result v4

    .line 2120
    .local v4, "index":I
    invoke-static {v1, v4}, Landroid/support/v4/view/MotionEventCompat;->getX(Landroid/view/MotionEvent;I)F

    move-result v6

    .line 2121
    .local v6, "x":F
    iput v6, v0, Landroid/support/v4/view/ViewPager;->mLastMotionX:F

    .line 2122
    invoke-static {v1, v4}, Landroid/support/v4/view/MotionEventCompat;->getPointerId(Landroid/view/MotionEvent;I)I

    move-result v7

    iput v7, v0, Landroid/support/v4/view/ViewPager;->mActivePointerId:I

    .line 2123
    goto :goto_81

    .line 2111
    .end local v4    # "index":I
    .end local v6    # "x":F
    :pswitch_65
    iget-boolean v6, v0, Landroid/support/v4/view/ViewPager;->mIsBeingDragged:Z

    if-eqz v6, :cond_81

    .line 2112
    iget v6, v0, Landroid/support/v4/view/ViewPager;->mCurItem:I

    invoke-direct {v0, v6, v3, v4, v4}, Landroid/support/v4/view/ViewPager;->scrollToItem(IZIZ)V

    .line 2113
    iput v7, v0, Landroid/support/v4/view/ViewPager;->mActivePointerId:I

    .line 2114
    invoke-direct/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->endDrag()V

    .line 2115
    iget-object v4, v0, Landroid/support/v4/view/ViewPager;->mLeftEdge:Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-virtual {v4}, Landroid/support/v4/widget/EdgeEffectCompat;->onRelease()Z

    move-result v4

    iget-object v6, v0, Landroid/support/v4/view/ViewPager;->mRightEdge:Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-virtual {v6}, Landroid/support/v4/widget/EdgeEffectCompat;->onRelease()Z

    move-result v6

    or-int v5, v4, v6

    .line 2131
    .end local v2    # "action":I
    .restart local v16    # "action":I
    :cond_81
    :goto_81
    move/from16 v16, v2

    goto/16 :goto_172

    .line 2052
    .end local v16    # "action":I
    .restart local v2    # "action":I
    :pswitch_85
    iget-boolean v4, v0, Landroid/support/v4/view/ViewPager;->mIsBeingDragged:Z

    if-nez v4, :cond_e0

    .line 2053
    iget v4, v0, Landroid/support/v4/view/ViewPager;->mActivePointerId:I

    invoke-static {v1, v4}, Landroid/support/v4/view/MotionEventCompat;->findPointerIndex(Landroid/view/MotionEvent;I)I

    move-result v4

    .line 2054
    .local v4, "pointerIndex":I
    invoke-static {v1, v4}, Landroid/support/v4/view/MotionEventCompat;->getX(Landroid/view/MotionEvent;I)F

    move-result v6

    .line 2055
    .restart local v6    # "x":F
    iget v7, v0, Landroid/support/v4/view/ViewPager;->mLastMotionX:F

    sub-float v7, v6, v7

    invoke-static {v7}, Ljava/lang/Math;->abs(F)F

    move-result v7

    .line 2056
    .local v7, "xDiff":F
    invoke-static {v1, v4}, Landroid/support/v4/view/MotionEventCompat;->getY(Landroid/view/MotionEvent;I)F

    move-result v8

    .line 2057
    .local v8, "y":F
    iget v9, v0, Landroid/support/v4/view/ViewPager;->mLastMotionY:F

    sub-float v9, v8, v9

    invoke-static {v9}, Ljava/lang/Math;->abs(F)F

    move-result v9

    .line 2059
    .local v9, "yDiff":F
    iget v10, v0, Landroid/support/v4/view/ViewPager;->mTouchSlop:I

    int-to-float v10, v10

    cmpl-float v10, v7, v10

    if-lez v10, :cond_e0

    cmpl-float v10, v7, v9

    if-lez v10, :cond_e0

    .line 2061
    iput-boolean v3, v0, Landroid/support/v4/view/ViewPager;->mIsBeingDragged:Z

    .line 2062
    invoke-direct {v0, v3}, Landroid/support/v4/view/ViewPager;->requestParentDisallowInterceptTouchEvent(Z)V

    .line 2063
    iget v10, v0, Landroid/support/v4/view/ViewPager;->mInitialMotionX:F

    sub-float v10, v6, v10

    const/4 v11, 0x0

    cmpl-float v10, v10, v11

    if-lez v10, :cond_c7

    iget v10, v0, Landroid/support/v4/view/ViewPager;->mInitialMotionX:F

    iget v11, v0, Landroid/support/v4/view/ViewPager;->mTouchSlop:I

    int-to-float v11, v11

    add-float/2addr v10, v11

    goto :goto_cd

    :cond_c7
    iget v10, v0, Landroid/support/v4/view/ViewPager;->mInitialMotionX:F

    iget v11, v0, Landroid/support/v4/view/ViewPager;->mTouchSlop:I

    int-to-float v11, v11

    sub-float/2addr v10, v11

    :goto_cd
    iput v10, v0, Landroid/support/v4/view/ViewPager;->mLastMotionX:F

    .line 2065
    iput v8, v0, Landroid/support/v4/view/ViewPager;->mLastMotionY:F

    .line 2066
    invoke-direct {v0, v3}, Landroid/support/v4/view/ViewPager;->setScrollState(I)V

    .line 2067
    invoke-direct {v0, v3}, Landroid/support/v4/view/ViewPager;->setScrollingCacheEnabled(Z)V

    .line 2070
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getParent()Landroid/view/ViewParent;

    move-result-object v10

    .line 2071
    .local v10, "parent":Landroid/view/ViewParent;
    if-eqz v10, :cond_e0

    .line 2072
    invoke-interface {v10, v3}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 2077
    .end local v4    # "pointerIndex":I
    .end local v6    # "x":F
    .end local v7    # "xDiff":F
    .end local v8    # "y":F
    .end local v9    # "yDiff":F
    .end local v10    # "parent":Landroid/view/ViewParent;
    :cond_e0
    iget-boolean v4, v0, Landroid/support/v4/view/ViewPager;->mIsBeingDragged:Z

    if-eqz v4, :cond_81

    .line 2079
    iget v4, v0, Landroid/support/v4/view/ViewPager;->mActivePointerId:I

    invoke-static {v1, v4}, Landroid/support/v4/view/MotionEventCompat;->findPointerIndex(Landroid/view/MotionEvent;I)I

    move-result v4

    .line 2081
    .local v4, "activePointerIndex":I
    invoke-static {v1, v4}, Landroid/support/v4/view/MotionEventCompat;->getX(Landroid/view/MotionEvent;I)F

    move-result v6

    .line 2082
    .restart local v6    # "x":F
    invoke-direct {v0, v6}, Landroid/support/v4/view/ViewPager;->performDrag(F)Z

    move-result v7

    or-int/2addr v5, v7

    .line 2083
    .end local v4    # "activePointerIndex":I
    .end local v6    # "x":F
    goto :goto_81

    .line 2086
    :pswitch_f4
    iget-boolean v4, v0, Landroid/support/v4/view/ViewPager;->mIsBeingDragged:Z

    if-eqz v4, :cond_40

    .line 2087
    iget-object v4, v0, Landroid/support/v4/view/ViewPager;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 2088
    .local v4, "velocityTracker":Landroid/view/VelocityTracker;
    const/16 v6, 0x3e8

    iget v8, v0, Landroid/support/v4/view/ViewPager;->mMaximumVelocity:I

    int-to-float v8, v8

    invoke-virtual {v4, v6, v8}, Landroid/view/VelocityTracker;->computeCurrentVelocity(IF)V

    .line 2089
    iget v6, v0, Landroid/support/v4/view/ViewPager;->mActivePointerId:I

    invoke-static {v4, v6}, Landroid/support/v4/view/VelocityTrackerCompat;->getXVelocity(Landroid/view/VelocityTracker;I)F

    move-result v6

    float-to-int v6, v6

    .line 2091
    .local v6, "initialVelocity":I
    iput-boolean v3, v0, Landroid/support/v4/view/ViewPager;->mPopulatePending:Z

    .line 2092
    invoke-direct/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getClientWidth()I

    move-result v8

    .line 2093
    .local v8, "width":I
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getScrollX()I

    move-result v9

    .line 2094
    .local v9, "scrollX":I
    invoke-direct/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->infoForCurrentScrollPosition()Landroid/support/v4/view/ViewPager$ItemInfo;

    move-result-object v10

    .line 2095
    .local v10, "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    iget v11, v10, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    .line 2096
    .local v11, "currentPage":I
    int-to-float v12, v9

    int-to-float v13, v8

    div-float/2addr v12, v13

    iget v13, v10, Landroid/support/v4/view/ViewPager$ItemInfo;->offset:F

    sub-float/2addr v12, v13

    iget v13, v10, Landroid/support/v4/view/ViewPager$ItemInfo;->widthFactor:F

    div-float/2addr v12, v13

    .line 2097
    .local v12, "pageOffset":F
    iget v13, v0, Landroid/support/v4/view/ViewPager;->mActivePointerId:I

    invoke-static {v1, v13}, Landroid/support/v4/view/MotionEventCompat;->findPointerIndex(Landroid/view/MotionEvent;I)I

    move-result v13

    .line 2099
    .local v13, "activePointerIndex":I
    invoke-static {v1, v13}, Landroid/support/v4/view/MotionEventCompat;->getX(Landroid/view/MotionEvent;I)F

    move-result v14

    .line 2100
    .local v14, "x":F
    iget v15, v0, Landroid/support/v4/view/ViewPager;->mInitialMotionX:F

    sub-float v15, v14, v15

    float-to-int v15, v15

    .line 2101
    .local v15, "totalDelta":I
    invoke-direct {v0, v11, v12, v6, v15}, Landroid/support/v4/view/ViewPager;->determineTargetPage(IFII)I

    move-result v7

    .line 2103
    .local v7, "nextPage":I
    invoke-virtual {v0, v7, v3, v3, v6}, Landroid/support/v4/view/ViewPager;->setCurrentItemInternal(IZZI)V

    .line 2105
    const/4 v3, -0x1

    iput v3, v0, Landroid/support/v4/view/ViewPager;->mActivePointerId:I

    .line 2106
    invoke-direct/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->endDrag()V

    .line 2107
    iget-object v3, v0, Landroid/support/v4/view/ViewPager;->mLeftEdge:Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-virtual {v3}, Landroid/support/v4/widget/EdgeEffectCompat;->onRelease()Z

    move-result v3

    move/from16 v16, v2

    iget-object v2, v0, Landroid/support/v4/view/ViewPager;->mRightEdge:Landroid/support/v4/widget/EdgeEffectCompat;

    .end local v2    # "action":I
    .restart local v16    # "action":I
    invoke-virtual {v2}, Landroid/support/v4/widget/EdgeEffectCompat;->onRelease()Z

    move-result v2

    or-int v5, v3, v2

    .line 2108
    .end local v4    # "velocityTracker":Landroid/view/VelocityTracker;
    .end local v6    # "initialVelocity":I
    .end local v7    # "nextPage":I
    .end local v8    # "width":I
    .end local v9    # "scrollX":I
    .end local v10    # "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    .end local v11    # "currentPage":I
    .end local v12    # "pageOffset":F
    .end local v13    # "activePointerIndex":I
    .end local v14    # "x":F
    .end local v15    # "totalDelta":I
    goto :goto_172

    .line 2041
    .end local v16    # "action":I
    .restart local v2    # "action":I
    :pswitch_14f
    move/from16 v16, v2

    .end local v2    # "action":I
    .restart local v16    # "action":I
    iget-object v2, v0, Landroid/support/v4/view/ViewPager;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v2}, Landroid/widget/Scroller;->abortAnimation()V

    .line 2042
    iput-boolean v4, v0, Landroid/support/v4/view/ViewPager;->mPopulatePending:Z

    .line 2043
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->populate()V

    .line 2046
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    iput v2, v0, Landroid/support/v4/view/ViewPager;->mInitialMotionX:F

    iput v2, v0, Landroid/support/v4/view/ViewPager;->mLastMotionX:F

    .line 2047
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getY()F

    move-result v2

    iput v2, v0, Landroid/support/v4/view/ViewPager;->mInitialMotionY:F

    iput v2, v0, Landroid/support/v4/view/ViewPager;->mLastMotionY:F

    .line 2048
    invoke-static {v1, v4}, Landroid/support/v4/view/MotionEventCompat;->getPointerId(Landroid/view/MotionEvent;I)I

    move-result v2

    iput v2, v0, Landroid/support/v4/view/ViewPager;->mActivePointerId:I

    .line 2049
    nop

    .line 2131
    :goto_172
    if-eqz v5, :cond_177

    .line 2132
    invoke-static/range {p0 .. p0}, Landroid/support/v4/view/ViewCompat;->postInvalidateOnAnimation(Landroid/view/View;)V

    .line 2134
    :cond_177
    const/4 v2, 0x1

    return v2

    .line 2028
    .end local v5    # "needsInvalidate":Z
    .end local v16    # "action":I
    :cond_179
    :goto_179
    return v4

    :pswitch_data_17a
    .packed-switch 0x0
        :pswitch_14f
        :pswitch_f4
        :pswitch_85
        :pswitch_65
        :pswitch_40
        :pswitch_54
        :pswitch_44
    .end packed-switch
.end method

.method pageLeft()Z
    .registers 3

    .line 2694
    iget v0, p0, Landroid/support/v4/view/ViewPager;->mCurItem:I

    if-lez v0, :cond_c

    .line 2695
    iget v0, p0, Landroid/support/v4/view/ViewPager;->mCurItem:I

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    invoke-virtual {p0, v0, v1}, Landroid/support/v4/view/ViewPager;->setCurrentItem(IZ)V

    .line 2696
    return v1

    .line 2698
    :cond_c
    const/4 v0, 0x0

    return v0
.end method

.method pageRight()Z
    .registers 4

    .line 2702
    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    if-eqz v0, :cond_17

    iget v0, p0, Landroid/support/v4/view/ViewPager;->mCurItem:I

    iget-object v1, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    invoke-virtual {v1}, Landroid/support/v4/view/PagerAdapter;->getCount()I

    move-result v1

    const/4 v2, 0x1

    sub-int/2addr v1, v2

    if-ge v0, v1, :cond_17

    .line 2703
    iget v0, p0, Landroid/support/v4/view/ViewPager;->mCurItem:I

    add-int/2addr v0, v2

    invoke-virtual {p0, v0, v2}, Landroid/support/v4/view/ViewPager;->setCurrentItem(IZ)V

    .line 2704
    return v2

    .line 2706
    :cond_17
    const/4 v0, 0x0

    return v0
.end method

.method populate()V
    .registers 2

    .line 952
    iget v0, p0, Landroid/support/v4/view/ViewPager;->mCurItem:I

    invoke-virtual {p0, v0}, Landroid/support/v4/view/ViewPager;->populate(I)V

    .line 953
    return-void
.end method

.method populate(I)V
    .registers 25
    .param p1, "newCurrentItem"    # I

    move-object/from16 v1, p0

    .line 956
    move/from16 v2, p1

    const/4 v0, 0x0

    .line 957
    .local v0, "oldCurInfo":Landroid/support/v4/view/ViewPager$ItemInfo;
    const/4 v3, 0x2

    .line 958
    .local v3, "focusDirection":I
    iget v4, v1, Landroid/support/v4/view/ViewPager;->mCurItem:I

    if-eq v4, v2, :cond_1c

    .line 959
    iget v4, v1, Landroid/support/v4/view/ViewPager;->mCurItem:I

    if-ge v4, v2, :cond_11

    const/16 v4, 0x42

    goto :goto_13

    :cond_11
    const/16 v4, 0x11

    :goto_13
    move v3, v4

    .line 960
    iget v4, v1, Landroid/support/v4/view/ViewPager;->mCurItem:I

    invoke-virtual {v1, v4}, Landroid/support/v4/view/ViewPager;->infoForPosition(I)Landroid/support/v4/view/ViewPager$ItemInfo;

    move-result-object v0

    .line 961
    iput v2, v1, Landroid/support/v4/view/ViewPager;->mCurItem:I

    .line 964
    .end local v0    # "oldCurInfo":Landroid/support/v4/view/ViewPager$ItemInfo;
    .local v3, "oldCurInfo":Landroid/support/v4/view/ViewPager$ItemInfo;
    .local v4, "focusDirection":I
    :cond_1c
    move v4, v3

    move-object v3, v0

    iget-object v0, v1, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    if-nez v0, :cond_26

    .line 965
    invoke-direct/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->sortChildDrawingOrder()V

    .line 966
    return-void

    .line 973
    :cond_26
    iget-boolean v0, v1, Landroid/support/v4/view/ViewPager;->mPopulatePending:Z

    if-eqz v0, :cond_2e

    .line 975
    invoke-direct/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->sortChildDrawingOrder()V

    .line 976
    return-void

    .line 982
    :cond_2e
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getWindowToken()Landroid/os/IBinder;

    move-result-object v0

    if-nez v0, :cond_35

    .line 983
    return-void

    .line 986
    :cond_35
    iget-object v0, v1, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    invoke-virtual {v0, v1}, Landroid/support/v4/view/PagerAdapter;->startUpdate(Landroid/view/ViewGroup;)V

    .line 988
    iget v5, v1, Landroid/support/v4/view/ViewPager;->mOffscreenPageLimit:I

    .line 989
    .local v5, "pageLimit":I
    iget v0, v1, Landroid/support/v4/view/ViewPager;->mCurItem:I

    sub-int/2addr v0, v5

    const/4 v6, 0x0

    invoke-static {v6, v0}, Ljava/lang/Math;->max(II)I

    move-result v7

    .line 990
    .local v7, "startPos":I
    iget-object v0, v1, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    invoke-virtual {v0}, Landroid/support/v4/view/PagerAdapter;->getCount()I

    move-result v8

    .line 991
    .local v8, "N":I
    add-int/lit8 v0, v8, -0x1

    iget v9, v1, Landroid/support/v4/view/ViewPager;->mCurItem:I

    add-int/2addr v9, v5

    invoke-static {v0, v9}, Ljava/lang/Math;->min(II)I

    move-result v9

    .line 993
    .local v9, "endPos":I
    iget v0, v1, Landroid/support/v4/view/ViewPager;->mExpectedAdapterCount:I

    if-ne v8, v0, :cond_279

    .line 1009
    const/4 v0, -0x1

    .line 1010
    .local v0, "curIndex":I
    const/4 v10, 0x0

    .line 1011
    .local v10, "curItem":Landroid/support/v4/view/ViewPager$ItemInfo;
    const/4 v0, 0x0

    :goto_5a
    iget-object v11, v1, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v11

    if-ge v0, v11, :cond_7b

    .line 1012
    iget-object v11, v1, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v11, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Landroid/support/v4/view/ViewPager$ItemInfo;

    .line 1013
    .local v11, "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    iget v12, v11, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    iget v13, v1, Landroid/support/v4/view/ViewPager;->mCurItem:I

    if-lt v12, v13, :cond_78

    .line 1014
    iget v12, v11, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    iget v13, v1, Landroid/support/v4/view/ViewPager;->mCurItem:I

    if-ne v12, v13, :cond_7b

    move-object v10, v11

    goto :goto_7b

    .line 1011
    .end local v11    # "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    :cond_78
    add-int/lit8 v0, v0, 0x1

    goto :goto_5a

    .line 1019
    :cond_7b
    :goto_7b
    if-nez v10, :cond_85

    if-lez v8, :cond_85

    .line 1020
    iget v11, v1, Landroid/support/v4/view/ViewPager;->mCurItem:I

    invoke-virtual {v1, v11, v0}, Landroid/support/v4/view/ViewPager;->addNewItem(II)Landroid/support/v4/view/ViewPager$ItemInfo;

    move-result-object v10

    .line 1026
    :cond_85
    if-eqz v10, :cond_1e9

    .line 1027
    const/4 v13, 0x0

    .line 1028
    .local v13, "extraWidthLeft":F
    add-int/lit8 v14, v0, -0x1

    .line 1029
    .local v14, "itemIndex":I
    if-ltz v14, :cond_95

    iget-object v15, v1, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v15, v14}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Landroid/support/v4/view/ViewPager$ItemInfo;

    goto :goto_96

    :cond_95
    const/4 v15, 0x0

    .line 1030
    .local v15, "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    :goto_96
    invoke-direct/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getClientWidth()I

    move-result v6

    .line 1031
    .local v6, "clientWidth":I
    const/high16 v17, 0x40000000    # 2.0f

    if-gtz v6, :cond_a2

    move/from16 v19, v0

    const/4 v11, 0x0

    goto :goto_b0

    :cond_a2
    iget v12, v10, Landroid/support/v4/view/ViewPager$ItemInfo;->widthFactor:F

    sub-float v12, v17, v12

    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getPaddingLeft()I

    move-result v11

    int-to-float v11, v11

    move/from16 v19, v0

    int-to-float v0, v6

    .end local v0    # "curIndex":I
    .local v19, "curIndex":I
    div-float/2addr v11, v0

    add-float/2addr v11, v12

    :goto_b0
    move v0, v11

    .line 1033
    .local v0, "leftWidthNeeded":F
    iget v11, v1, Landroid/support/v4/view/ViewPager;->mCurItem:I

    add-int/lit8 v11, v11, -0x1

    move/from16 v12, v19

    .end local v19    # "curIndex":I
    .local v11, "pos":I
    .local v12, "curIndex":I
    :goto_b7
    if-ltz v11, :cond_127

    .line 1034
    cmpl-float v19, v13, v0

    if-ltz v19, :cond_ed

    if-ge v11, v7, :cond_ed

    .line 1035
    if-nez v15, :cond_c6

    .line 1036
    nop

    .line 1061
    move/from16 v20, v0

    goto/16 :goto_129

    .line 1038
    :cond_c6
    move/from16 v20, v0

    iget v0, v15, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    .end local v0    # "leftWidthNeeded":F
    .local v20, "leftWidthNeeded":F
    if-ne v11, v0, :cond_120

    iget-boolean v0, v15, Landroid/support/v4/view/ViewPager$ItemInfo;->scrolling:Z

    if-nez v0, :cond_120

    .line 1039
    iget-object v0, v1, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v0, v14}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 1040
    iget-object v0, v1, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    iget-object v2, v15, Landroid/support/v4/view/ViewPager$ItemInfo;->object:Ljava/lang/Object;

    invoke-virtual {v0, v1, v11, v2}, Landroid/support/v4/view/PagerAdapter;->destroyItem(Landroid/view/ViewGroup;ILjava/lang/Object;)V

    .line 1045
    add-int/lit8 v14, v14, -0x1

    .line 1046
    add-int/lit8 v12, v12, -0x1

    .line 1047
    if-ltz v14, :cond_eb

    iget-object v0, v1, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v0, v14}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/v4/view/ViewPager$ItemInfo;

    goto :goto_ec

    :cond_eb
    const/4 v0, 0x0

    :goto_ec
    goto :goto_106

    .line 1049
    .end local v20    # "leftWidthNeeded":F
    .restart local v0    # "leftWidthNeeded":F
    :cond_ed
    move/from16 v20, v0

    .end local v0    # "leftWidthNeeded":F
    .restart local v20    # "leftWidthNeeded":F
    if-eqz v15, :cond_107

    iget v0, v15, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    if-ne v11, v0, :cond_107

    .line 1050
    iget v0, v15, Landroid/support/v4/view/ViewPager$ItemInfo;->widthFactor:F

    add-float/2addr v13, v0

    .line 1051
    add-int/lit8 v14, v14, -0x1

    .line 1052
    if-ltz v14, :cond_105

    iget-object v0, v1, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v0, v14}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/v4/view/ViewPager$ItemInfo;

    goto :goto_106

    :cond_105
    const/4 v0, 0x0

    .end local v15    # "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    .local v0, "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    :goto_106
    goto :goto_11f

    .line 1054
    .end local v0    # "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    .restart local v15    # "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    :cond_107
    add-int/lit8 v0, v14, 0x1

    invoke-virtual {v1, v11, v0}, Landroid/support/v4/view/ViewPager;->addNewItem(II)Landroid/support/v4/view/ViewPager$ItemInfo;

    move-result-object v0

    .line 1055
    .end local v15    # "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    .restart local v0    # "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    iget v2, v0, Landroid/support/v4/view/ViewPager$ItemInfo;->widthFactor:F

    add-float/2addr v13, v2

    .line 1056
    add-int/lit8 v12, v12, 0x1

    .line 1057
    if-ltz v14, :cond_11d

    iget-object v2, v1, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v2, v14}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/v4/view/ViewPager$ItemInfo;

    goto :goto_11e

    :cond_11d
    const/4 v2, 0x0

    :goto_11e
    move-object v0, v2

    .line 1033
    .end local v0    # "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    .restart local v15    # "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    :goto_11f
    move-object v15, v0

    :cond_120
    add-int/lit8 v11, v11, -0x1

    move/from16 v0, v20

    move/from16 v2, p1

    goto :goto_b7

    .line 1061
    .end local v11    # "pos":I
    .end local v20    # "leftWidthNeeded":F
    .local v0, "leftWidthNeeded":F
    :cond_127
    move/from16 v20, v0

    .end local v0    # "leftWidthNeeded":F
    .restart local v20    # "leftWidthNeeded":F
    :goto_129
    iget v0, v10, Landroid/support/v4/view/ViewPager$ItemInfo;->widthFactor:F

    .line 1062
    .local v0, "extraWidthRight":F
    add-int/lit8 v2, v12, 0x1

    .line 1063
    .end local v14    # "itemIndex":I
    .local v2, "itemIndex":I
    cmpg-float v11, v0, v17

    if-gez v11, :cond_1e1

    .line 1064
    iget-object v11, v1, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v11

    if-ge v2, v11, :cond_142

    iget-object v11, v1, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v11, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Landroid/support/v4/view/ViewPager$ItemInfo;

    goto :goto_143

    :cond_142
    const/4 v11, 0x0

    .line 1065
    .end local v15    # "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    .local v11, "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    :goto_143
    if-gtz v6, :cond_147

    const/4 v14, 0x0

    goto :goto_150

    :cond_147
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getPaddingRight()I

    move-result v14

    int-to-float v14, v14

    int-to-float v15, v6

    div-float/2addr v14, v15

    add-float v14, v14, v17

    .line 1067
    .local v14, "rightWidthNeeded":F
    :goto_150
    iget v15, v1, Landroid/support/v4/view/ViewPager;->mCurItem:I

    add-int/lit8 v15, v15, 0x1

    .local v15, "pos":I
    :goto_154
    if-ge v15, v8, :cond_1db

    .line 1068
    cmpl-float v17, v0, v14

    if-ltz v17, :cond_194

    if-le v15, v9, :cond_194

    .line 1069
    if-nez v11, :cond_165

    .line 1070
    nop

    .line 1094
    move/from16 v21, v5

    move/from16 v22, v6

    goto/16 :goto_1df

    .line 1072
    :cond_165
    move/from16 v21, v5

    iget v5, v11, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    .end local v5    # "pageLimit":I
    .local v21, "pageLimit":I
    if-ne v15, v5, :cond_191

    iget-boolean v5, v11, Landroid/support/v4/view/ViewPager$ItemInfo;->scrolling:Z

    if-nez v5, :cond_191

    .line 1073
    iget-object v5, v1, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v5, v2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 1074
    iget-object v5, v1, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    move/from16 v22, v6

    iget-object v6, v11, Landroid/support/v4/view/ViewPager$ItemInfo;->object:Ljava/lang/Object;

    .end local v6    # "clientWidth":I
    .local v22, "clientWidth":I
    invoke-virtual {v5, v1, v15, v6}, Landroid/support/v4/view/PagerAdapter;->destroyItem(Landroid/view/ViewGroup;ILjava/lang/Object;)V

    .line 1079
    iget-object v5, v1, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-ge v2, v5, :cond_18e

    iget-object v5, v1, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v5, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/support/v4/view/ViewPager$ItemInfo;

    goto :goto_18f

    :cond_18e
    const/4 v5, 0x0

    :goto_18f
    move-object v11, v5

    goto :goto_1d3

    .line 1067
    .end local v22    # "clientWidth":I
    .restart local v6    # "clientWidth":I
    :cond_191
    move/from16 v22, v6

    .end local v6    # "clientWidth":I
    .restart local v22    # "clientWidth":I
    goto :goto_1d3

    .line 1081
    .end local v21    # "pageLimit":I
    .end local v22    # "clientWidth":I
    .restart local v5    # "pageLimit":I
    .restart local v6    # "clientWidth":I
    :cond_194
    move/from16 v21, v5

    move/from16 v22, v6

    .end local v5    # "pageLimit":I
    .end local v6    # "clientWidth":I
    .restart local v21    # "pageLimit":I
    .restart local v22    # "clientWidth":I
    if-eqz v11, :cond_1b7

    iget v5, v11, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    if-ne v15, v5, :cond_1b7

    .line 1082
    iget v5, v11, Landroid/support/v4/view/ViewPager$ItemInfo;->widthFactor:F

    add-float/2addr v0, v5

    .line 1083
    add-int/lit8 v2, v2, 0x1

    .line 1084
    iget-object v5, v1, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-ge v2, v5, :cond_1b4

    iget-object v5, v1, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v5, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/support/v4/view/ViewPager$ItemInfo;

    goto :goto_1b5

    :cond_1b4
    const/4 v5, 0x0

    :goto_1b5
    move-object v11, v5

    goto :goto_1d3

    .line 1086
    :cond_1b7
    invoke-virtual {v1, v15, v2}, Landroid/support/v4/view/ViewPager;->addNewItem(II)Landroid/support/v4/view/ViewPager$ItemInfo;

    move-result-object v5

    .line 1087
    .end local v11    # "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    .local v5, "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    add-int/lit8 v2, v2, 0x1

    .line 1088
    iget v6, v5, Landroid/support/v4/view/ViewPager$ItemInfo;->widthFactor:F

    add-float/2addr v0, v6

    .line 1089
    iget-object v6, v1, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-ge v2, v6, :cond_1d1

    iget-object v6, v1, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v6, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/support/v4/view/ViewPager$ItemInfo;

    goto :goto_1d2

    :cond_1d1
    const/4 v6, 0x0

    :goto_1d2
    move-object v11, v6

    .line 1067
    .end local v5    # "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    .restart local v11    # "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    :goto_1d3
    add-int/lit8 v15, v15, 0x1

    move/from16 v5, v21

    move/from16 v6, v22

    goto/16 :goto_154

    .line 1094
    .end local v14    # "rightWidthNeeded":F
    .end local v15    # "pos":I
    .end local v21    # "pageLimit":I
    .end local v22    # "clientWidth":I
    .local v5, "pageLimit":I
    .restart local v6    # "clientWidth":I
    :cond_1db
    move/from16 v21, v5

    move/from16 v22, v6

    .end local v5    # "pageLimit":I
    .end local v6    # "clientWidth":I
    .restart local v21    # "pageLimit":I
    .restart local v22    # "clientWidth":I
    :goto_1df
    move-object v15, v11

    goto :goto_1e5

    .end local v11    # "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    .end local v21    # "pageLimit":I
    .end local v22    # "clientWidth":I
    .restart local v5    # "pageLimit":I
    .restart local v6    # "clientWidth":I
    .local v15, "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    :cond_1e1
    move/from16 v21, v5

    move/from16 v22, v6

    .end local v5    # "pageLimit":I
    .end local v6    # "clientWidth":I
    .restart local v21    # "pageLimit":I
    .restart local v22    # "clientWidth":I
    :goto_1e5
    invoke-direct {v1, v10, v12, v3}, Landroid/support/v4/view/ViewPager;->calculatePageOffsets(Landroid/support/v4/view/ViewPager$ItemInfo;ILandroid/support/v4/view/ViewPager$ItemInfo;)V

    .end local v0    # "extraWidthRight":F
    .end local v2    # "itemIndex":I
    .end local v13    # "extraWidthLeft":F
    .end local v15    # "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    .end local v20    # "leftWidthNeeded":F
    .end local v22    # "clientWidth":I
    goto :goto_1ef

    .line 1104
    .end local v12    # "curIndex":I
    .end local v21    # "pageLimit":I
    .local v0, "curIndex":I
    .restart local v5    # "pageLimit":I
    :cond_1e9
    move/from16 v19, v0

    move/from16 v21, v5

    move/from16 v12, v19

    .end local v0    # "curIndex":I
    .end local v5    # "pageLimit":I
    .restart local v12    # "curIndex":I
    .restart local v21    # "pageLimit":I
    :goto_1ef
    iget-object v0, v1, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    iget v2, v1, Landroid/support/v4/view/ViewPager;->mCurItem:I

    if-eqz v10, :cond_1f8

    iget-object v5, v10, Landroid/support/v4/view/ViewPager$ItemInfo;->object:Ljava/lang/Object;

    goto :goto_1f9

    :cond_1f8
    const/4 v5, 0x0

    :goto_1f9
    invoke-virtual {v0, v1, v2, v5}, Landroid/support/v4/view/PagerAdapter;->setPrimaryItem(Landroid/view/ViewGroup;ILjava/lang/Object;)V

    .line 1106
    iget-object v0, v1, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    invoke-virtual {v0, v1}, Landroid/support/v4/view/PagerAdapter;->finishUpdate(Landroid/view/ViewGroup;)V

    .line 1110
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getChildCount()I

    move-result v0

    .line 1111
    .local v0, "childCount":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_206
    if-ge v2, v0, :cond_232

    .line 1112
    invoke-virtual {v1, v2}, Landroid/support/v4/view/ViewPager;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    .line 1113
    .local v5, "child":Landroid/view/View;
    invoke-virtual {v5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v6

    check-cast v6, Landroid/support/v4/view/ViewPager$LayoutParams;

    .line 1114
    .local v6, "lp":Landroid/support/v4/view/ViewPager$LayoutParams;
    iput v2, v6, Landroid/support/v4/view/ViewPager$LayoutParams;->childIndex:I

    .line 1115
    iget-boolean v11, v6, Landroid/support/v4/view/ViewPager$LayoutParams;->isDecor:Z

    if-nez v11, :cond_22e

    iget v11, v6, Landroid/support/v4/view/ViewPager$LayoutParams;->widthFactor:F

    const/4 v13, 0x0

    cmpl-float v11, v11, v13

    if-nez v11, :cond_22f

    .line 1117
    invoke-virtual {v1, v5}, Landroid/support/v4/view/ViewPager;->infoForChild(Landroid/view/View;)Landroid/support/v4/view/ViewPager$ItemInfo;

    move-result-object v11

    .line 1118
    .restart local v11    # "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    if-eqz v11, :cond_22f

    .line 1119
    iget v14, v11, Landroid/support/v4/view/ViewPager$ItemInfo;->widthFactor:F

    iput v14, v6, Landroid/support/v4/view/ViewPager$LayoutParams;->widthFactor:F

    .line 1120
    iget v14, v11, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    iput v14, v6, Landroid/support/v4/view/ViewPager$LayoutParams;->position:I

    .end local v5    # "child":Landroid/view/View;
    .end local v6    # "lp":Landroid/support/v4/view/ViewPager$LayoutParams;
    .end local v11    # "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    goto :goto_22f

    .line 1111
    :cond_22e
    const/4 v13, 0x0

    :cond_22f
    :goto_22f
    add-int/lit8 v2, v2, 0x1

    goto :goto_206

    .line 1124
    .end local v2    # "i":I
    :cond_232
    invoke-direct/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->sortChildDrawingOrder()V

    .line 1126
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->hasFocus()Z

    move-result v2

    if-eqz v2, :cond_278

    .line 1127
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->findFocus()Landroid/view/View;

    move-result-object v2

    .line 1128
    .local v2, "currentFocused":Landroid/view/View;
    if-eqz v2, :cond_248

    invoke-virtual {v1, v2}, Landroid/support/v4/view/ViewPager;->infoForAnyChild(Landroid/view/View;)Landroid/support/v4/view/ViewPager$ItemInfo;

    move-result-object v5

    move-object/from16 v18, v5

    goto :goto_24a

    :cond_248
    const/16 v18, 0x0

    :goto_24a
    move-object/from16 v5, v18

    .line 1129
    .local v5, "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    if-eqz v5, :cond_254

    iget v6, v5, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    iget v11, v1, Landroid/support/v4/view/ViewPager;->mCurItem:I

    if-eq v6, v11, :cond_278

    .line 1130
    :cond_254
    const/16 v16, 0x0

    .local v16, "i":I
    :goto_256
    move/from16 v6, v16

    .end local v16    # "i":I
    .local v6, "i":I
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getChildCount()I

    move-result v11

    if-ge v6, v11, :cond_278

    .line 1131
    invoke-virtual {v1, v6}, Landroid/support/v4/view/ViewPager;->getChildAt(I)Landroid/view/View;

    move-result-object v11

    .line 1132
    .local v11, "child":Landroid/view/View;
    invoke-virtual {v1, v11}, Landroid/support/v4/view/ViewPager;->infoForChild(Landroid/view/View;)Landroid/support/v4/view/ViewPager$ItemInfo;

    move-result-object v5

    .line 1133
    if-eqz v5, :cond_275

    iget v13, v5, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    iget v14, v1, Landroid/support/v4/view/ViewPager;->mCurItem:I

    if-ne v13, v14, :cond_275

    .line 1134
    invoke-virtual {v11, v4}, Landroid/view/View;->requestFocus(I)Z

    move-result v13

    if-eqz v13, :cond_275

    .line 1135
    goto :goto_278

    .line 1130
    .end local v11    # "child":Landroid/view/View;
    :cond_275
    add-int/lit8 v16, v6, 0x1

    .end local v6    # "i":I
    .restart local v16    # "i":I
    goto :goto_256

    .line 1141
    .end local v2    # "currentFocused":Landroid/view/View;
    .end local v5    # "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    .end local v16    # "i":I
    :cond_278
    :goto_278
    return-void

    .line 996
    .end local v0    # "childCount":I
    .end local v10    # "curItem":Landroid/support/v4/view/ViewPager$ItemInfo;
    .end local v12    # "curIndex":I
    .end local v21    # "pageLimit":I
    .local v5, "pageLimit":I
    :cond_279
    move/from16 v21, v5

    .end local v5    # "pageLimit":I
    .restart local v21    # "pageLimit":I
    :try_start_27b
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getId()I

    move-result v2

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0
    :try_end_287
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_27b .. :try_end_287} :catch_288

    .line 999
    .local v0, "resName":Ljava/lang/String;
    goto :goto_291

    .line 997
    .end local v0    # "resName":Ljava/lang/String;
    :catch_288
    move-exception v0

    .line 998
    .local v0, "e":Landroid/content/res/Resources$NotFoundException;
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getId()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v0

    .line 1000
    .local v0, "resName":Ljava/lang/String;
    :goto_291
    new-instance v2, Ljava/lang/IllegalStateException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "The application\'s PagerAdapter changed the adapter\'s contents without calling PagerAdapter#notifyDataSetChanged! Expected adapter item count: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v6, v1, Landroid/support/v4/view/ViewPager;->mExpectedAdapterCount:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v6, ", found: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v6, " Pager id: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, " Pager class: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v6, " Problematic adapter: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v6, v1, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v2, v5}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public removeOnPageChangeListener(Landroid/support/v4/view/ViewPager$OnPageChangeListener;)V
    .registers 3
    .param p1, "listener"    # Landroid/support/v4/view/ViewPager$OnPageChangeListener;

    .line 619
    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mOnPageChangeListeners:Ljava/util/List;

    if-eqz v0, :cond_9

    .line 620
    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mOnPageChangeListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 622
    :cond_9
    return-void
.end method

.method public removeView(Landroid/view/View;)V
    .registers 3
    .param p1, "view"    # Landroid/view/View;

    .line 1356
    iget-boolean v0, p0, Landroid/support/v4/view/ViewPager;->mInLayout:Z

    if-eqz v0, :cond_8

    .line 1357
    invoke-virtual {p0, p1}, Landroid/support/v4/view/ViewPager;->removeViewInLayout(Landroid/view/View;)V

    goto :goto_b

    .line 1359
    :cond_8
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 1361
    :goto_b
    return-void
.end method

.method public setAdapter(Landroid/support/v4/view/PagerAdapter;)V
    .registers 10
    .param p1, "adapter"    # Landroid/support/v4/view/PagerAdapter;

    .line 413
    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    const/4 v1, 0x0

    if-eqz v0, :cond_40

    .line 414
    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    iget-object v2, p0, Landroid/support/v4/view/ViewPager;->mObserver:Landroid/support/v4/view/ViewPager$PagerObserver;

    invoke-virtual {v0, v2}, Landroid/support/v4/view/PagerAdapter;->unregisterDataSetObserver(Landroid/database/DataSetObserver;)V

    .line 415
    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    invoke-virtual {v0, p0}, Landroid/support/v4/view/PagerAdapter;->startUpdate(Landroid/view/ViewGroup;)V

    .line 416
    move v0, v1

    .local v0, "i":I
    :goto_12
    iget-object v2, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v0, v2, :cond_2e

    .line 417
    iget-object v2, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/v4/view/ViewPager$ItemInfo;

    .line 418
    .local v2, "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    iget-object v3, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    iget v4, v2, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    iget-object v5, v2, Landroid/support/v4/view/ViewPager$ItemInfo;->object:Ljava/lang/Object;

    invoke-virtual {v3, p0, v4, v5}, Landroid/support/v4/view/PagerAdapter;->destroyItem(Landroid/view/ViewGroup;ILjava/lang/Object;)V

    .line 416
    .end local v2    # "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    add-int/lit8 v0, v0, 0x1

    goto :goto_12

    .line 420
    .end local v0    # "i":I
    :cond_2e
    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    invoke-virtual {v0, p0}, Landroid/support/v4/view/PagerAdapter;->finishUpdate(Landroid/view/ViewGroup;)V

    .line 421
    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 422
    invoke-direct {p0}, Landroid/support/v4/view/ViewPager;->removeNonDecorViews()V

    .line 423
    iput v1, p0, Landroid/support/v4/view/ViewPager;->mCurItem:I

    .line 424
    invoke-virtual {p0, v1, v1}, Landroid/support/v4/view/ViewPager;->scrollTo(II)V

    .line 427
    :cond_40
    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    .line 428
    .local v0, "oldAdapter":Landroid/support/v4/view/PagerAdapter;
    iput-object p1, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    .line 429
    iput v1, p0, Landroid/support/v4/view/ViewPager;->mExpectedAdapterCount:I

    .line 431
    iget-object v2, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    if-eqz v2, :cond_8f

    .line 432
    iget-object v2, p0, Landroid/support/v4/view/ViewPager;->mObserver:Landroid/support/v4/view/ViewPager$PagerObserver;

    const/4 v3, 0x0

    if-nez v2, :cond_56

    .line 433
    new-instance v2, Landroid/support/v4/view/ViewPager$PagerObserver;

    invoke-direct {v2, p0, v3}, Landroid/support/v4/view/ViewPager$PagerObserver;-><init>(Landroid/support/v4/view/ViewPager;Landroid/support/v4/view/ViewPager$1;)V

    iput-object v2, p0, Landroid/support/v4/view/ViewPager;->mObserver:Landroid/support/v4/view/ViewPager$PagerObserver;

    .line 435
    :cond_56
    iget-object v2, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    iget-object v4, p0, Landroid/support/v4/view/ViewPager;->mObserver:Landroid/support/v4/view/ViewPager$PagerObserver;

    invoke-virtual {v2, v4}, Landroid/support/v4/view/PagerAdapter;->registerDataSetObserver(Landroid/database/DataSetObserver;)V

    .line 436
    iput-boolean v1, p0, Landroid/support/v4/view/ViewPager;->mPopulatePending:Z

    .line 437
    iget-boolean v2, p0, Landroid/support/v4/view/ViewPager;->mFirstLayout:Z

    .line 438
    .local v2, "wasFirstLayout":Z
    const/4 v4, 0x1

    iput-boolean v4, p0, Landroid/support/v4/view/ViewPager;->mFirstLayout:Z

    .line 439
    iget-object v5, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    invoke-virtual {v5}, Landroid/support/v4/view/PagerAdapter;->getCount()I

    move-result v5

    iput v5, p0, Landroid/support/v4/view/ViewPager;->mExpectedAdapterCount:I

    .line 440
    iget v5, p0, Landroid/support/v4/view/ViewPager;->mRestoredCurItem:I

    if-ltz v5, :cond_86

    .line 441
    iget-object v5, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    iget-object v6, p0, Landroid/support/v4/view/ViewPager;->mRestoredAdapterState:Landroid/os/Parcelable;

    iget-object v7, p0, Landroid/support/v4/view/ViewPager;->mRestoredClassLoader:Ljava/lang/ClassLoader;

    invoke-virtual {v5, v6, v7}, Landroid/support/v4/view/PagerAdapter;->restoreState(Landroid/os/Parcelable;Ljava/lang/ClassLoader;)V

    .line 442
    iget v5, p0, Landroid/support/v4/view/ViewPager;->mRestoredCurItem:I

    invoke-virtual {p0, v5, v1, v4}, Landroid/support/v4/view/ViewPager;->setCurrentItemInternal(IZZ)V

    .line 443
    const/4 v1, -0x1

    iput v1, p0, Landroid/support/v4/view/ViewPager;->mRestoredCurItem:I

    .line 444
    iput-object v3, p0, Landroid/support/v4/view/ViewPager;->mRestoredAdapterState:Landroid/os/Parcelable;

    .line 445
    iput-object v3, p0, Landroid/support/v4/view/ViewPager;->mRestoredClassLoader:Ljava/lang/ClassLoader;

    goto :goto_8f

    .line 446
    :cond_86
    if-nez v2, :cond_8c

    .line 447
    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->populate()V

    goto :goto_8f

    .line 449
    :cond_8c
    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->requestLayout()V

    .line 453
    .end local v2    # "wasFirstLayout":Z
    :cond_8f
    :goto_8f
    iget-object v1, p0, Landroid/support/v4/view/ViewPager;->mAdapterChangeListener:Landroid/support/v4/view/ViewPager$OnAdapterChangeListener;

    if-eqz v1, :cond_9a

    if-eq v0, p1, :cond_9a

    .line 454
    iget-object v1, p0, Landroid/support/v4/view/ViewPager;->mAdapterChangeListener:Landroid/support/v4/view/ViewPager$OnAdapterChangeListener;

    invoke-interface {v1, v0, p1}, Landroid/support/v4/view/ViewPager$OnAdapterChangeListener;->onAdapterChanged(Landroid/support/v4/view/PagerAdapter;Landroid/support/v4/view/PagerAdapter;)V

    .line 456
    :cond_9a
    return-void
.end method

.method setChildrenDrawingOrderEnabledCompat(Z)V
    .registers 8
    .param p1, "enable"    # Z

    .line 661
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/4 v1, 0x7

    if-lt v0, v1, :cond_3a

    .line 662
    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mSetChildrenDrawingOrderEnabled:Ljava/lang/reflect/Method;

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-nez v0, :cond_24

    .line 664
    :try_start_b
    const-class v0, Landroid/view/ViewGroup;

    const-string v3, "setChildrenDrawingOrderEnabled"

    new-array v4, v2, [Ljava/lang/Class;

    sget-object v5, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v5, v4, v1

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v4/view/ViewPager;->mSetChildrenDrawingOrderEnabled:Ljava/lang/reflect/Method;
    :try_end_1b
    .catch Ljava/lang/NoSuchMethodException; {:try_start_b .. :try_end_1b} :catch_1c

    .line 668
    goto :goto_24

    .line 666
    :catch_1c
    move-exception v0

    .line 667
    .local v0, "e":Ljava/lang/NoSuchMethodException;
    const-string v3, "ViewPager"

    const-string v4, "Can\'t find setChildrenDrawingOrderEnabled"

    invoke-static {v3, v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 671
    .end local v0    # "e":Ljava/lang/NoSuchMethodException;
    :cond_24
    :goto_24
    :try_start_24
    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mSetChildrenDrawingOrderEnabled:Ljava/lang/reflect/Method;

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    aput-object v3, v2, v1

    invoke-virtual {v0, p0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_31
    .catch Ljava/lang/Exception; {:try_start_24 .. :try_end_31} :catch_32

    .line 674
    goto :goto_3a

    .line 672
    :catch_32
    move-exception v0

    .line 673
    .local v0, "e":Ljava/lang/Exception;
    const-string v1, "ViewPager"

    const-string v2, "Error changing children drawing order"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 676
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_3a
    :goto_3a
    return-void
.end method

.method public setCurrentItem(I)V
    .registers 4
    .param p1, "item"    # I

    .line 494
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/v4/view/ViewPager;->mPopulatePending:Z

    .line 495
    iget-boolean v1, p0, Landroid/support/v4/view/ViewPager;->mFirstLayout:Z

    xor-int/lit8 v1, v1, 0x1

    invoke-virtual {p0, p1, v1, v0}, Landroid/support/v4/view/ViewPager;->setCurrentItemInternal(IZZ)V

    .line 496
    return-void
.end method

.method public setCurrentItem(IZ)V
    .registers 4
    .param p1, "item"    # I
    .param p2, "smoothScroll"    # Z

    .line 505
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/v4/view/ViewPager;->mPopulatePending:Z

    .line 506
    invoke-virtual {p0, p1, p2, v0}, Landroid/support/v4/view/ViewPager;->setCurrentItemInternal(IZZ)V

    .line 507
    return-void
.end method

.method setCurrentItemInternal(IZZ)V
    .registers 5
    .param p1, "item"    # I
    .param p2, "smoothScroll"    # Z
    .param p3, "always"    # Z

    .line 514
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Landroid/support/v4/view/ViewPager;->setCurrentItemInternal(IZZI)V

    .line 515
    return-void
.end method

.method setCurrentItemInternal(IZZI)V
    .registers 10
    .param p1, "item"    # I
    .param p2, "smoothScroll"    # Z
    .param p3, "always"    # Z
    .param p4, "velocity"    # I

    .line 518
    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    const/4 v1, 0x0

    if-eqz v0, :cond_73

    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    invoke-virtual {v0}, Landroid/support/v4/view/PagerAdapter;->getCount()I

    move-result v0

    if-gtz v0, :cond_e

    goto :goto_73

    .line 522
    :cond_e
    if-nez p3, :cond_20

    iget v0, p0, Landroid/support/v4/view/ViewPager;->mCurItem:I

    if-ne v0, p1, :cond_20

    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-eqz v0, :cond_20

    .line 523
    invoke-direct {p0, v1}, Landroid/support/v4/view/ViewPager;->setScrollingCacheEnabled(Z)V

    .line 524
    return-void

    .line 527
    :cond_20
    const/4 v0, 0x1

    if-gez p1, :cond_25

    .line 528
    const/4 p1, 0x0

    goto :goto_35

    .line 529
    :cond_25
    iget-object v2, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    invoke-virtual {v2}, Landroid/support/v4/view/PagerAdapter;->getCount()I

    move-result v2

    if-lt p1, v2, :cond_35

    .line 530
    iget-object v2, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    invoke-virtual {v2}, Landroid/support/v4/view/PagerAdapter;->getCount()I

    move-result v2

    add-int/lit8 p1, v2, -0x1

    .line 532
    :cond_35
    :goto_35
    iget v2, p0, Landroid/support/v4/view/ViewPager;->mOffscreenPageLimit:I

    .line 533
    .local v2, "pageLimit":I
    iget v3, p0, Landroid/support/v4/view/ViewPager;->mCurItem:I

    add-int/2addr v3, v2

    if-gt p1, v3, :cond_41

    iget v3, p0, Landroid/support/v4/view/ViewPager;->mCurItem:I

    sub-int/2addr v3, v2

    if-ge p1, v3, :cond_57

    .line 537
    :cond_41
    move v3, v1

    .local v3, "i":I
    :goto_42
    iget-object v4, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ge v3, v4, :cond_57

    .line 538
    iget-object v4, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/support/v4/view/ViewPager$ItemInfo;

    iput-boolean v0, v4, Landroid/support/v4/view/ViewPager$ItemInfo;->scrolling:Z

    .line 537
    add-int/lit8 v3, v3, 0x1

    goto :goto_42

    .line 541
    .end local v3    # "i":I
    :cond_57
    iget v3, p0, Landroid/support/v4/view/ViewPager;->mCurItem:I

    if-eq v3, p1, :cond_5c

    goto :goto_5d

    :cond_5c
    move v0, v1

    .line 543
    .local v0, "dispatchSelected":Z
    :goto_5d
    iget-boolean v1, p0, Landroid/support/v4/view/ViewPager;->mFirstLayout:Z

    if-eqz v1, :cond_6c

    .line 546
    iput p1, p0, Landroid/support/v4/view/ViewPager;->mCurItem:I

    .line 547
    if-eqz v0, :cond_68

    .line 548
    invoke-direct {p0, p1}, Landroid/support/v4/view/ViewPager;->dispatchOnPageSelected(I)V

    .line 550
    :cond_68
    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->requestLayout()V

    goto :goto_72

    .line 552
    :cond_6c
    invoke-virtual {p0, p1}, Landroid/support/v4/view/ViewPager;->populate(I)V

    .line 553
    invoke-direct {p0, p1, p2, p4, v0}, Landroid/support/v4/view/ViewPager;->scrollToItem(IZIZ)V

    .line 555
    :goto_72
    return-void

    .line 519
    .end local v0    # "dispatchSelected":Z
    .end local v2    # "pageLimit":I
    :cond_73
    :goto_73
    invoke-direct {p0, v1}, Landroid/support/v4/view/ViewPager;->setScrollingCacheEnabled(Z)V

    .line 520
    return-void
.end method

.method setInternalPageChangeListener(Landroid/support/v4/view/ViewPager$OnPageChangeListener;)Landroid/support/v4/view/ViewPager$OnPageChangeListener;
    .registers 3
    .param p1, "listener"    # Landroid/support/v4/view/ViewPager$OnPageChangeListener;

    .line 692
    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mInternalPageChangeListener:Landroid/support/v4/view/ViewPager$OnPageChangeListener;

    .line 693
    .local v0, "oldListener":Landroid/support/v4/view/ViewPager$OnPageChangeListener;
    iput-object p1, p0, Landroid/support/v4/view/ViewPager;->mInternalPageChangeListener:Landroid/support/v4/view/ViewPager$OnPageChangeListener;

    .line 694
    return-object v0
.end method

.method public setOffscreenPageLimit(I)V
    .registers 6
    .param p1, "limit"    # I

    .line 726
    const/4 v0, 0x1

    if-ge p1, v0, :cond_22

    .line 727
    const-string v1, "ViewPager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Requested offscreen page limit "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " too small; defaulting to "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 729
    const/4 p1, 0x1

    .line 731
    :cond_22
    iget v0, p0, Landroid/support/v4/view/ViewPager;->mOffscreenPageLimit:I

    if-eq p1, v0, :cond_2b

    .line 732
    iput p1, p0, Landroid/support/v4/view/ViewPager;->mOffscreenPageLimit:I

    .line 733
    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->populate()V

    .line 735
    :cond_2b
    return-void
.end method

.method setOnAdapterChangeListener(Landroid/support/v4/view/ViewPager$OnAdapterChangeListener;)V
    .registers 2
    .param p1, "listener"    # Landroid/support/v4/view/ViewPager$OnAdapterChangeListener;

    .line 479
    iput-object p1, p0, Landroid/support/v4/view/ViewPager;->mAdapterChangeListener:Landroid/support/v4/view/ViewPager$OnAdapterChangeListener;

    .line 480
    return-void
.end method

.method public setOnPageChangeListener(Landroid/support/v4/view/ViewPager$OnPageChangeListener;)V
    .registers 2
    .param p1, "listener"    # Landroid/support/v4/view/ViewPager$OnPageChangeListener;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 592
    iput-object p1, p0, Landroid/support/v4/view/ViewPager;->mOnPageChangeListener:Landroid/support/v4/view/ViewPager$OnPageChangeListener;

    .line 593
    return-void
.end method

.method public setPageMargin(I)V
    .registers 4
    .param p1, "marginPixels"    # I

    .line 746
    iget v0, p0, Landroid/support/v4/view/ViewPager;->mPageMargin:I

    .line 747
    .local v0, "oldMargin":I
    iput p1, p0, Landroid/support/v4/view/ViewPager;->mPageMargin:I

    .line 749
    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getWidth()I

    move-result v1

    .line 750
    .local v1, "width":I
    invoke-direct {p0, v1, v1, p1, v0}, Landroid/support/v4/view/ViewPager;->recomputeScrollPosition(IIII)V

    .line 752
    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->requestLayout()V

    .line 753
    return-void
.end method

.method public setPageMarginDrawable(I)V
    .registers 3
    .param p1, "resId"    # I
        .annotation build Landroid/support/annotation/DrawableRes;
        .end annotation
    .end param

    .line 782
    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/support/v4/view/ViewPager;->setPageMarginDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 783
    return-void
.end method

.method public setPageMarginDrawable(Landroid/graphics/drawable/Drawable;)V
    .registers 3
    .param p1, "d"    # Landroid/graphics/drawable/Drawable;

    .line 770
    iput-object p1, p0, Landroid/support/v4/view/ViewPager;->mMarginDrawable:Landroid/graphics/drawable/Drawable;

    .line 771
    if-eqz p1, :cond_7

    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->refreshDrawableState()V

    .line 772
    :cond_7
    if-nez p1, :cond_b

    const/4 v0, 0x1

    goto :goto_c

    :cond_b
    const/4 v0, 0x0

    :goto_c
    invoke-virtual {p0, v0}, Landroid/support/v4/view/ViewPager;->setWillNotDraw(Z)V

    .line 773
    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->invalidate()V

    .line 774
    return-void
.end method

.method public setPageTransformer(ZLandroid/support/v4/view/ViewPager$PageTransformer;)V
    .registers 7
    .param p1, "reverseDrawingOrder"    # Z
    .param p2, "transformer"    # Landroid/support/v4/view/ViewPager$PageTransformer;

    .line 646
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xb

    if-lt v0, v1, :cond_2e

    .line 647
    const/4 v0, 0x0

    const/4 v1, 0x1

    if-eqz p2, :cond_c

    move v2, v1

    goto :goto_d

    :cond_c
    move v2, v0

    .line 648
    .local v2, "hasTransformer":Z
    :goto_d
    iget-object v3, p0, Landroid/support/v4/view/ViewPager;->mPageTransformer:Landroid/support/v4/view/ViewPager$PageTransformer;

    if-eqz v3, :cond_13

    move v3, v1

    goto :goto_14

    :cond_13
    move v3, v0

    :goto_14
    if-eq v2, v3, :cond_18

    move v3, v1

    goto :goto_19

    :cond_18
    move v3, v0

    .line 649
    .local v3, "needsPopulate":Z
    :goto_19
    iput-object p2, p0, Landroid/support/v4/view/ViewPager;->mPageTransformer:Landroid/support/v4/view/ViewPager$PageTransformer;

    .line 650
    invoke-virtual {p0, v2}, Landroid/support/v4/view/ViewPager;->setChildrenDrawingOrderEnabledCompat(Z)V

    .line 651
    if-eqz v2, :cond_27

    .line 652
    if-eqz p1, :cond_24

    const/4 v1, 0x2

    nop

    :cond_24
    iput v1, p0, Landroid/support/v4/view/ViewPager;->mDrawingOrder:I

    goto :goto_29

    .line 654
    :cond_27
    iput v0, p0, Landroid/support/v4/view/ViewPager;->mDrawingOrder:I

    .line 656
    :goto_29
    if-eqz v3, :cond_2e

    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->populate()V

    .line 658
    .end local v2    # "hasTransformer":Z
    .end local v3    # "needsPopulate":Z
    :cond_2e
    return-void
.end method

.method smoothScrollTo(II)V
    .registers 4
    .param p1, "x"    # I
    .param p2, "y"    # I

    .line 816
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Landroid/support/v4/view/ViewPager;->smoothScrollTo(III)V

    .line 817
    return-void
.end method

.method smoothScrollTo(III)V
    .registers 21
    .param p1, "x"    # I
    .param p2, "y"    # I
    .param p3, "velocity"    # I

    move-object/from16 v0, p0

    .line 827
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getChildCount()I

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_d

    .line 829
    invoke-direct {v0, v2}, Landroid/support/v4/view/ViewPager;->setScrollingCacheEnabled(Z)V

    .line 830
    return-void

    .line 832
    :cond_d
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getScrollX()I

    move-result v1

    .line 833
    .local v1, "sx":I
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getScrollY()I

    move-result v9

    .line 834
    .local v9, "sy":I
    sub-int v10, p1, v1

    .line 835
    .local v10, "dx":I
    sub-int v11, p2, v9

    .line 836
    .local v11, "dy":I
    if-nez v10, :cond_27

    if-nez v11, :cond_27

    .line 837
    invoke-direct {v0, v2}, Landroid/support/v4/view/ViewPager;->completeScroll(Z)V

    .line 838
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->populate()V

    .line 839
    invoke-direct {v0, v2}, Landroid/support/v4/view/ViewPager;->setScrollState(I)V

    .line 840
    return-void

    .line 843
    :cond_27
    const/4 v2, 0x1

    invoke-direct {v0, v2}, Landroid/support/v4/view/ViewPager;->setScrollingCacheEnabled(Z)V

    .line 844
    const/4 v2, 0x2

    invoke-direct {v0, v2}, Landroid/support/v4/view/ViewPager;->setScrollState(I)V

    .line 846
    invoke-direct/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getClientWidth()I

    move-result v2

    .line 847
    .local v2, "width":I
    div-int/lit8 v12, v2, 0x2

    .line 848
    .local v12, "halfWidth":I
    invoke-static {v10}, Ljava/lang/Math;->abs(I)I

    move-result v3

    int-to-float v3, v3

    const/high16 v4, 0x3f800000    # 1.0f

    mul-float/2addr v3, v4

    int-to-float v5, v2

    div-float/2addr v3, v5

    invoke-static {v4, v3}, Ljava/lang/Math;->min(FF)F

    move-result v13

    .line 849
    .local v13, "distanceRatio":F
    int-to-float v3, v12

    int-to-float v5, v12

    invoke-virtual {v0, v13}, Landroid/support/v4/view/ViewPager;->distanceInfluenceForSnapDuration(F)F

    move-result v6

    mul-float/2addr v5, v6

    add-float v14, v3, v5

    .line 852
    .local v14, "distance":F
    const/4 v3, 0x0

    .line 853
    .local v3, "duration":I
    invoke-static/range {p3 .. p3}, Ljava/lang/Math;->abs(I)I

    move-result v8

    .line 854
    .end local p3    # "velocity":I
    .local v8, "velocity":I
    if-lez v8, :cond_64

    .line 855
    const/4 v4, 0x4

    const/high16 v5, 0x447a0000    # 1000.0f

    int-to-float v6, v8

    div-float v6, v14, v6

    invoke-static {v6}, Ljava/lang/Math;->abs(F)F

    move-result v6

    mul-float/2addr v5, v6

    invoke-static {v5}, Ljava/lang/Math;->round(F)I

    move-result v5

    mul-int/2addr v4, v5

    .end local v3    # "duration":I
    .local v4, "duration":I
    goto :goto_7d

    .line 857
    .end local v4    # "duration":I
    .restart local v3    # "duration":I
    :cond_64
    int-to-float v5, v2

    iget-object v6, v0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    iget v7, v0, Landroid/support/v4/view/ViewPager;->mCurItem:I

    invoke-virtual {v6, v7}, Landroid/support/v4/view/PagerAdapter;->getPageWidth(I)F

    move-result v6

    mul-float/2addr v5, v6

    .line 858
    .local v5, "pageWidth":F
    invoke-static {v10}, Ljava/lang/Math;->abs(I)I

    move-result v6

    int-to-float v6, v6

    iget v7, v0, Landroid/support/v4/view/ViewPager;->mPageMargin:I

    int-to-float v7, v7

    add-float/2addr v7, v5

    div-float/2addr v6, v7

    .line 859
    .local v6, "pageDelta":F
    add-float/2addr v4, v6

    const/high16 v7, 0x42c80000    # 100.0f

    mul-float/2addr v4, v7

    float-to-int v4, v4

    .line 861
    .end local v3    # "duration":I
    .end local v5    # "pageWidth":F
    .end local v6    # "pageDelta":F
    .restart local v4    # "duration":I
    :goto_7d
    const/16 v3, 0x258

    invoke-static {v4, v3}, Ljava/lang/Math;->min(II)I

    move-result v15

    .line 863
    .end local v4    # "duration":I
    .local v15, "duration":I
    iget-object v3, v0, Landroid/support/v4/view/ViewPager;->mScroller:Landroid/widget/Scroller;

    move v4, v1

    move v5, v9

    move v6, v10

    move v7, v11

    move/from16 v16, v8

    move v8, v15

    .end local v8    # "velocity":I
    .local v16, "velocity":I
    invoke-virtual/range {v3 .. v8}, Landroid/widget/Scroller;->startScroll(IIIII)V

    .line 864
    invoke-static/range {p0 .. p0}, Landroid/support/v4/view/ViewCompat;->postInvalidateOnAnimation(Landroid/view/View;)V

    .line 865
    return-void
.end method

.method protected verifyDrawable(Landroid/graphics/drawable/Drawable;)Z
    .registers 3
    .param p1, "who"    # Landroid/graphics/drawable/Drawable;

    .line 787
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->verifyDrawable(Landroid/graphics/drawable/Drawable;)Z

    move-result v0

    if-nez v0, :cond_d

    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mMarginDrawable:Landroid/graphics/drawable/Drawable;

    if-ne p1, v0, :cond_b

    goto :goto_d

    :cond_b
    const/4 v0, 0x0

    goto :goto_e

    :cond_d
    :goto_d
    const/4 v0, 0x1

    :goto_e
    return v0
.end method
