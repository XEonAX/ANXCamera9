.class public Landroid/support/v7/widget/StaggeredGridLayoutManager;
.super Landroid/support/v7/widget/RecyclerView$LayoutManager;
.source "StaggeredGridLayoutManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;,
        Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;,
        Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;,
        Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;,
        Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;
    }
.end annotation


# static fields
.field private static final DEBUG:Z = false

.field public static final GAP_HANDLING_LAZY:I = 0x1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final GAP_HANDLING_MOVE_ITEMS_BETWEEN_SPANS:I = 0x2

.field public static final GAP_HANDLING_NONE:I = 0x0

.field public static final HORIZONTAL:I = 0x0

.field private static final INVALID_OFFSET:I = -0x80000000

.field public static final TAG:Ljava/lang/String; = "StaggeredGridLayoutManager"

.field public static final VERTICAL:I = 0x1


# instance fields
.field private final mAnchorInfo:Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;

.field private final mCheckForGapsRunnable:Ljava/lang/Runnable;

.field private mFullSizeSpec:I

.field private mGapStrategy:I

.field private mHeightSpec:I

.field private mLaidOutInvalidFullSpan:Z

.field private mLastLayoutFromEnd:Z

.field private mLastLayoutRTL:Z

.field private mLayoutState:Landroid/support/v7/widget/LayoutState;

.field mLazySpanLookup:Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;

.field private mOrientation:I

.field private mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

.field mPendingScrollPosition:I

.field mPendingScrollPositionOffset:I

.field mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

.field private mRemainingSpans:Ljava/util/BitSet;

.field private mReverseLayout:Z

.field mSecondaryOrientation:Landroid/support/v7/widget/OrientationHelper;

.field mShouldReverseLayout:Z

.field private mSizePerSpan:I

.field private mSmoothScrollbarEnabled:Z

.field private mSpanCount:I

.field private mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

.field private final mTmpRect:Landroid/graphics/Rect;

.field private mWidthSpec:I


# direct methods
.method public constructor <init>(II)V
    .registers 6
    .param p1, "spanCount"    # I
    .param p2, "orientation"    # I

    .line 223
    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$LayoutManager;-><init>()V

    .line 97
    const/4 v0, -0x1

    iput v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    .line 117
    const/4 v1, 0x0

    iput-boolean v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mReverseLayout:Z

    .line 122
    iput-boolean v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mShouldReverseLayout:Z

    .line 133
    iput v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingScrollPosition:I

    .line 139
    const/high16 v0, -0x80000000

    iput v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingScrollPositionOffset:I

    .line 145
    new-instance v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;

    invoke-direct {v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;-><init>()V

    iput-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLazySpanLookup:Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;

    .line 150
    const/4 v0, 0x2

    iput v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mGapStrategy:I

    .line 176
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mTmpRect:Landroid/graphics/Rect;

    .line 181
    new-instance v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;

    const/4 v2, 0x0

    invoke-direct {v0, p0, v2}, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;-><init>(Landroid/support/v7/widget/StaggeredGridLayoutManager;Landroid/support/v7/widget/StaggeredGridLayoutManager$1;)V

    iput-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mAnchorInfo:Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;

    .line 189
    iput-boolean v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLaidOutInvalidFullSpan:Z

    .line 195
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSmoothScrollbarEnabled:Z

    .line 197
    new-instance v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$1;

    invoke-direct {v0, p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager$1;-><init>(Landroid/support/v7/widget/StaggeredGridLayoutManager;)V

    iput-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mCheckForGapsRunnable:Ljava/lang/Runnable;

    .line 224
    iput p2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mOrientation:I

    .line 225
    invoke-virtual {p0, p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->setSpanCount(I)V

    .line 226
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I

    .line 209
    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$LayoutManager;-><init>()V

    .line 97
    const/4 v0, -0x1

    iput v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    .line 117
    const/4 v1, 0x0

    iput-boolean v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mReverseLayout:Z

    .line 122
    iput-boolean v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mShouldReverseLayout:Z

    .line 133
    iput v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingScrollPosition:I

    .line 139
    const/high16 v0, -0x80000000

    iput v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingScrollPositionOffset:I

    .line 145
    new-instance v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;

    invoke-direct {v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;-><init>()V

    iput-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLazySpanLookup:Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;

    .line 150
    const/4 v0, 0x2

    iput v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mGapStrategy:I

    .line 176
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mTmpRect:Landroid/graphics/Rect;

    .line 181
    new-instance v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;

    const/4 v2, 0x0

    invoke-direct {v0, p0, v2}, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;-><init>(Landroid/support/v7/widget/StaggeredGridLayoutManager;Landroid/support/v7/widget/StaggeredGridLayoutManager$1;)V

    iput-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mAnchorInfo:Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;

    .line 189
    iput-boolean v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLaidOutInvalidFullSpan:Z

    .line 195
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSmoothScrollbarEnabled:Z

    .line 197
    new-instance v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$1;

    invoke-direct {v0, p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager$1;-><init>(Landroid/support/v7/widget/StaggeredGridLayoutManager;)V

    iput-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mCheckForGapsRunnable:Ljava/lang/Runnable;

    .line 210
    invoke-static {p1, p2, p3, p4}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getProperties(Landroid/content/Context;Landroid/util/AttributeSet;II)Landroid/support/v7/widget/RecyclerView$LayoutManager$Properties;

    move-result-object v0

    .line 211
    .local v0, "properties":Landroid/support/v7/widget/RecyclerView$LayoutManager$Properties;
    iget v1, v0, Landroid/support/v7/widget/RecyclerView$LayoutManager$Properties;->orientation:I

    invoke-virtual {p0, v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->setOrientation(I)V

    .line 212
    iget v1, v0, Landroid/support/v7/widget/RecyclerView$LayoutManager$Properties;->spanCount:I

    invoke-virtual {p0, v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->setSpanCount(I)V

    .line 213
    iget-boolean v1, v0, Landroid/support/v7/widget/RecyclerView$LayoutManager$Properties;->reverseLayout:Z

    invoke-virtual {p0, v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->setReverseLayout(Z)V

    .line 214
    return-void
.end method

.method static synthetic access$100(Landroid/support/v7/widget/StaggeredGridLayoutManager;)Z
    .registers 2
    .param p0, "x0"    # Landroid/support/v7/widget/StaggeredGridLayoutManager;

    .line 53
    invoke-direct {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->checkForGaps()Z

    move-result v0

    return v0
.end method

.method static synthetic access$400(Landroid/support/v7/widget/StaggeredGridLayoutManager;I)I
    .registers 3
    .param p0, "x0"    # Landroid/support/v7/widget/StaggeredGridLayoutManager;
    .param p1, "x1"    # I

    .line 53
    invoke-direct {p0, p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->calculateScrollDirectionForPosition(I)I

    move-result v0

    return v0
.end method

.method static synthetic access$500(Landroid/support/v7/widget/StaggeredGridLayoutManager;)I
    .registers 2
    .param p0, "x0"    # Landroid/support/v7/widget/StaggeredGridLayoutManager;

    .line 53
    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mOrientation:I

    return v0
.end method

.method static synthetic access$600(Landroid/support/v7/widget/StaggeredGridLayoutManager;)Z
    .registers 2
    .param p0, "x0"    # Landroid/support/v7/widget/StaggeredGridLayoutManager;

    .line 53
    iget-boolean v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mReverseLayout:Z

    return v0
.end method

.method private appendViewToAllSpans(Landroid/view/View;)V
    .registers 4
    .param p1, "view"    # Landroid/view/View;

    .line 1603
    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    add-int/lit8 v0, v0, -0x1

    .local v0, "i":I
    :goto_4
    if-ltz v0, :cond_10

    .line 1604
    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    aget-object v1, v1, v0

    invoke-virtual {v1, p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->appendToSpan(Landroid/view/View;)V

    .line 1603
    add-int/lit8 v0, v0, -0x1

    goto :goto_4

    .line 1606
    .end local v0    # "i":I
    :cond_10
    return-void
.end method

.method private applyPendingSavedState(Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;)V
    .registers 5
    .param p1, "anchorInfo"    # Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;

    .line 647
    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    iget v0, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->mSpanOffsetsSize:I

    if-lez v0, :cond_50

    .line 648
    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    iget v0, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->mSpanOffsetsSize:I

    iget v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    if-ne v0, v1, :cond_43

    .line 649
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_f
    iget v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    if-ge v0, v1, :cond_50

    .line 650
    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    aget-object v1, v1, v0

    invoke-virtual {v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->clear()V

    .line 651
    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    iget-object v1, v1, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->mSpanOffsets:[I

    aget v1, v1, v0

    .line 652
    .local v1, "line":I
    const/high16 v2, -0x80000000

    if-eq v1, v2, :cond_39

    .line 653
    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    iget-boolean v2, v2, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->mAnchorLayoutFromEnd:Z

    if-eqz v2, :cond_32

    .line 654
    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v2}, Landroid/support/v7/widget/OrientationHelper;->getEndAfterPadding()I

    move-result v2

    add-int/2addr v1, v2

    goto :goto_39

    .line 656
    :cond_32
    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v2}, Landroid/support/v7/widget/OrientationHelper;->getStartAfterPadding()I

    move-result v2

    add-int/2addr v1, v2

    .line 659
    :cond_39
    :goto_39
    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    aget-object v2, v2, v0

    invoke-virtual {v2, v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->setLine(I)V

    .line 649
    .end local v1    # "line":I
    add-int/lit8 v0, v0, 0x1

    goto :goto_f

    .line 662
    .end local v0    # "i":I
    :cond_43
    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    invoke-virtual {v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->invalidateSpanInfo()V

    .line 663
    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    iget v1, v1, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->mVisibleAnchorPosition:I

    iput v1, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->mAnchorPosition:I

    .line 666
    :cond_50
    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    iget-boolean v0, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->mLastLayoutRTL:Z

    iput-boolean v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLastLayoutRTL:Z

    .line 667
    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    iget-boolean v0, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->mReverseLayout:Z

    invoke-virtual {p0, v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->setReverseLayout(Z)V

    .line 668
    invoke-direct {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->resolveShouldLayoutReverse()V

    .line 670
    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    iget v0, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->mAnchorPosition:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_74

    .line 671
    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    iget v0, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->mAnchorPosition:I

    iput v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingScrollPosition:I

    .line 672
    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    iget-boolean v0, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->mAnchorLayoutFromEnd:Z

    iput-boolean v0, p1, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->mLayoutFromEnd:Z

    goto :goto_78

    .line 674
    :cond_74
    iget-boolean v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mShouldReverseLayout:Z

    iput-boolean v0, p1, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->mLayoutFromEnd:Z

    .line 676
    :goto_78
    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    iget v0, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->mSpanLookupSize:I

    const/4 v1, 0x1

    if-le v0, v1, :cond_8f

    .line 677
    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLazySpanLookup:Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;

    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    iget-object v1, v1, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->mSpanLookup:[I

    iput-object v1, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;->mData:[I

    .line 678
    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLazySpanLookup:Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;

    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    iget-object v1, v1, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->mFullSpanItems:Ljava/util/List;

    iput-object v1, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;->mFullSpanItems:Ljava/util/List;

    .line 680
    :cond_8f
    return-void
.end method

.method private attachViewToSpans(Landroid/view/View;Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;Landroid/support/v7/widget/LayoutState;)V
    .registers 6
    .param p1, "view"    # Landroid/view/View;
    .param p2, "lp"    # Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;
    .param p3, "layoutState"    # Landroid/support/v7/widget/LayoutState;

    .line 1550
    iget v0, p3, Landroid/support/v7/widget/LayoutState;->mLayoutDirection:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_13

    .line 1551
    iget-boolean v0, p2, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->mFullSpan:Z

    if-eqz v0, :cond_d

    .line 1552
    invoke-direct {p0, p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->appendViewToAllSpans(Landroid/view/View;)V

    goto :goto_20

    .line 1554
    :cond_d
    iget-object v0, p2, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->mSpan:Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->appendToSpan(Landroid/view/View;)V

    goto :goto_20

    .line 1557
    :cond_13
    iget-boolean v0, p2, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->mFullSpan:Z

    if-eqz v0, :cond_1b

    .line 1558
    invoke-direct {p0, p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->prependViewToAllSpans(Landroid/view/View;)V

    goto :goto_20

    .line 1560
    :cond_1b
    iget-object v0, p2, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->mSpan:Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->prependToSpan(Landroid/view/View;)V

    .line 1563
    :goto_20
    return-void
.end method

.method private calculateScrollDirectionForPosition(I)I
    .registers 7
    .param p1, "position"    # I

    .line 1850
    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getChildCount()I

    move-result v0

    const/4 v1, -0x1

    const/4 v2, 0x1

    if-nez v0, :cond_f

    .line 1851
    iget-boolean v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mShouldReverseLayout:Z

    if-eqz v0, :cond_e

    move v1, v2

    nop

    :cond_e
    return v1

    .line 1853
    :cond_f
    invoke-direct {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getFirstChildPosition()I

    move-result v0

    .line 1854
    .local v0, "firstChildPos":I
    if-ge p1, v0, :cond_17

    move v3, v2

    goto :goto_18

    :cond_17
    const/4 v3, 0x0

    :goto_18
    iget-boolean v4, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mShouldReverseLayout:Z

    if-eq v3, v4, :cond_1d

    goto :goto_1e

    :cond_1d
    move v1, v2

    :goto_1e
    return v1
.end method

.method private checkForGaps()Z
    .registers 9

    .line 235
    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_7f

    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mGapStrategy:I

    if-eqz v0, :cond_7f

    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->isAttachedToWindow()Z

    move-result v0

    if-nez v0, :cond_12

    goto :goto_7f

    .line 239
    :cond_12
    iget-boolean v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mShouldReverseLayout:Z

    if-eqz v0, :cond_1f

    .line 240
    invoke-direct {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getLastChildPosition()I

    move-result v0

    .line 241
    .local v0, "minPos":I
    invoke-direct {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getFirstChildPosition()I

    move-result v2

    .local v2, "maxPos":I
    goto :goto_27

    .line 243
    .end local v0    # "minPos":I
    .end local v2    # "maxPos":I
    :cond_1f
    invoke-direct {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getFirstChildPosition()I

    move-result v0

    .line 244
    .restart local v0    # "minPos":I
    invoke-direct {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getLastChildPosition()I

    move-result v2

    .line 246
    .restart local v2    # "maxPos":I
    :goto_27
    const/4 v3, 0x1

    if-nez v0, :cond_3c

    .line 247
    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->hasGapsToFix()Landroid/view/View;

    move-result-object v4

    .line 248
    .local v4, "gapView":Landroid/view/View;
    if-eqz v4, :cond_3c

    .line 249
    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLazySpanLookup:Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;

    invoke-virtual {v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;->clear()V

    .line 250
    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->requestSimpleAnimationsInNextLayout()V

    .line 251
    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->requestLayout()V

    .line 252
    return v3

    .line 255
    .end local v4    # "gapView":Landroid/view/View;
    :cond_3c
    iget-boolean v4, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLaidOutInvalidFullSpan:Z

    if-nez v4, :cond_41

    .line 256
    return v1

    .line 258
    :cond_41
    iget-boolean v4, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mShouldReverseLayout:Z

    if-eqz v4, :cond_47

    const/4 v4, -0x1

    goto :goto_48

    :cond_47
    move v4, v3

    .line 259
    .local v4, "invalidGapDir":I
    :goto_48
    iget-object v5, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLazySpanLookup:Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;

    add-int/lit8 v6, v2, 0x1

    invoke-virtual {v5, v0, v6, v4, v3}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;->getFirstFullSpanItemInRange(IIIZ)Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;

    move-result-object v5

    .line 261
    .local v5, "invalidFsi":Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;
    if-nez v5, :cond_5c

    .line 262
    iput-boolean v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLaidOutInvalidFullSpan:Z

    .line 263
    iget-object v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLazySpanLookup:Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;

    add-int/lit8 v6, v2, 0x1

    invoke-virtual {v3, v6}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;->forceInvalidateAfter(I)I

    .line 264
    return v1

    .line 266
    :cond_5c
    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLazySpanLookup:Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;

    iget v6, v5, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;->mPosition:I

    mul-int/lit8 v7, v4, -0x1

    invoke-virtual {v1, v0, v6, v7, v3}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;->getFirstFullSpanItemInRange(IIIZ)Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;

    move-result-object v1

    .line 269
    .local v1, "validFsi":Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;
    if-nez v1, :cond_70

    .line 270
    iget-object v6, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLazySpanLookup:Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;

    iget v7, v5, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;->mPosition:I

    invoke-virtual {v6, v7}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;->forceInvalidateAfter(I)I

    goto :goto_78

    .line 272
    :cond_70
    iget-object v6, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLazySpanLookup:Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;

    iget v7, v1, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;->mPosition:I

    add-int/2addr v7, v3

    invoke-virtual {v6, v7}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;->forceInvalidateAfter(I)I

    .line 274
    :goto_78
    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->requestSimpleAnimationsInNextLayout()V

    .line 275
    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->requestLayout()V

    .line 276
    return v3

    .line 236
    .end local v0    # "minPos":I
    .end local v1    # "validFsi":Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;
    .end local v2    # "maxPos":I
    .end local v4    # "invalidGapDir":I
    .end local v5    # "invalidFsi":Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;
    :cond_7f
    :goto_7f
    return v1
.end method

.method private checkSpanForGap(Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;)Z
    .registers 5
    .param p1, "span"    # Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    .line 364
    iget-boolean v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mShouldReverseLayout:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_12

    .line 365
    invoke-virtual {p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->getEndLine()I

    move-result v0

    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v2}, Landroid/support/v7/widget/OrientationHelper;->getEndAfterPadding()I

    move-result v2

    if-ge v0, v2, :cond_1f

    .line 366
    return v1

    .line 368
    :cond_12
    invoke-virtual {p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->getStartLine()I

    move-result v0

    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v2}, Landroid/support/v7/widget/OrientationHelper;->getStartAfterPadding()I

    move-result v2

    if-le v0, v2, :cond_1f

    .line 369
    return v1

    .line 371
    :cond_1f
    const/4 v0, 0x0

    return v0
.end method

.method private computeScrollExtent(Landroid/support/v7/widget/RecyclerView$State;)I
    .registers 9
    .param p1, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .line 961
    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getChildCount()I

    move-result v0

    if-nez v0, :cond_8

    .line 962
    const/4 v0, 0x0

    return v0

    .line 964
    :cond_8
    invoke-direct {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->ensureOrientationHelper()V

    .line 965
    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    iget-boolean v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSmoothScrollbarEnabled:Z

    const/4 v1, 0x1

    xor-int/2addr v0, v1

    invoke-virtual {p0, v0, v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->findFirstVisibleItemClosestToStart(ZZ)Landroid/view/View;

    move-result-object v3

    iget-boolean v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSmoothScrollbarEnabled:Z

    xor-int/2addr v0, v1

    invoke-virtual {p0, v0, v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->findFirstVisibleItemClosestToEnd(ZZ)Landroid/view/View;

    move-result-object v4

    iget-boolean v6, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSmoothScrollbarEnabled:Z

    move-object v1, p1

    move-object v5, p0

    invoke-static/range {v1 .. v6}, Landroid/support/v7/widget/ScrollbarHelper;->computeScrollExtent(Landroid/support/v7/widget/RecyclerView$State;Landroid/support/v7/widget/OrientationHelper;Landroid/view/View;Landroid/view/View;Landroid/support/v7/widget/RecyclerView$LayoutManager;Z)I

    move-result v0

    return v0
.end method

.method private computeScrollOffset(Landroid/support/v7/widget/RecyclerView$State;)I
    .registers 10
    .param p1, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .line 940
    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getChildCount()I

    move-result v0

    if-nez v0, :cond_8

    .line 941
    const/4 v0, 0x0

    return v0

    .line 943
    :cond_8
    invoke-direct {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->ensureOrientationHelper()V

    .line 944
    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    iget-boolean v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSmoothScrollbarEnabled:Z

    const/4 v1, 0x1

    xor-int/2addr v0, v1

    invoke-virtual {p0, v0, v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->findFirstVisibleItemClosestToStart(ZZ)Landroid/view/View;

    move-result-object v3

    iget-boolean v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSmoothScrollbarEnabled:Z

    xor-int/2addr v0, v1

    invoke-virtual {p0, v0, v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->findFirstVisibleItemClosestToEnd(ZZ)Landroid/view/View;

    move-result-object v4

    iget-boolean v6, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSmoothScrollbarEnabled:Z

    iget-boolean v7, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mShouldReverseLayout:Z

    move-object v1, p1

    move-object v5, p0

    invoke-static/range {v1 .. v7}, Landroid/support/v7/widget/ScrollbarHelper;->computeScrollOffset(Landroid/support/v7/widget/RecyclerView$State;Landroid/support/v7/widget/OrientationHelper;Landroid/view/View;Landroid/view/View;Landroid/support/v7/widget/RecyclerView$LayoutManager;ZZ)I

    move-result v0

    return v0
.end method

.method private computeScrollRange(Landroid/support/v7/widget/RecyclerView$State;)I
    .registers 9
    .param p1, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .line 982
    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getChildCount()I

    move-result v0

    if-nez v0, :cond_8

    .line 983
    const/4 v0, 0x0

    return v0

    .line 985
    :cond_8
    invoke-direct {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->ensureOrientationHelper()V

    .line 986
    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    iget-boolean v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSmoothScrollbarEnabled:Z

    const/4 v1, 0x1

    xor-int/2addr v0, v1

    invoke-virtual {p0, v0, v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->findFirstVisibleItemClosestToStart(ZZ)Landroid/view/View;

    move-result-object v3

    iget-boolean v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSmoothScrollbarEnabled:Z

    xor-int/2addr v0, v1

    invoke-virtual {p0, v0, v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->findFirstVisibleItemClosestToEnd(ZZ)Landroid/view/View;

    move-result-object v4

    iget-boolean v6, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSmoothScrollbarEnabled:Z

    move-object v1, p1

    move-object v5, p0

    invoke-static/range {v1 .. v6}, Landroid/support/v7/widget/ScrollbarHelper;->computeScrollRange(Landroid/support/v7/widget/RecyclerView$State;Landroid/support/v7/widget/OrientationHelper;Landroid/view/View;Landroid/view/View;Landroid/support/v7/widget/RecyclerView$LayoutManager;Z)I

    move-result v0

    return v0
.end method

.method private createFullSpanItemFromEnd(I)Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;
    .registers 6
    .param p1, "newItemTop"    # I

    .line 1532
    new-instance v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;

    invoke-direct {v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;-><init>()V

    .line 1533
    .local v0, "fsi":Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;
    iget v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    new-array v1, v1, [I

    iput-object v1, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;->mGapPerSpan:[I

    .line 1534
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_c
    iget v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    if-ge v1, v2, :cond_21

    .line 1535
    iget-object v2, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;->mGapPerSpan:[I

    iget-object v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    aget-object v3, v3, v1

    invoke-virtual {v3, p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->getEndLine(I)I

    move-result v3

    sub-int v3, p1, v3

    aput v3, v2, v1

    .line 1534
    add-int/lit8 v1, v1, 0x1

    goto :goto_c

    .line 1537
    .end local v1    # "i":I
    :cond_21
    return-object v0
.end method

.method private createFullSpanItemFromStart(I)Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;
    .registers 6
    .param p1, "newItemBottom"    # I

    .line 1541
    new-instance v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;

    invoke-direct {v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;-><init>()V

    .line 1542
    .local v0, "fsi":Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;
    iget v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    new-array v1, v1, [I

    iput-object v1, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;->mGapPerSpan:[I

    .line 1543
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_c
    iget v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    if-ge v1, v2, :cond_20

    .line 1544
    iget-object v2, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;->mGapPerSpan:[I

    iget-object v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    aget-object v3, v3, v1

    invoke-virtual {v3, p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->getStartLine(I)I

    move-result v3

    sub-int/2addr v3, p1

    aput v3, v2, v1

    .line 1543
    add-int/lit8 v1, v1, 0x1

    goto :goto_c

    .line 1546
    .end local v1    # "i":I
    :cond_20
    return-object v0
.end method

.method private ensureOrientationHelper()V
    .registers 2

    .line 512
    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    if-nez v0, :cond_1d

    .line 513
    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mOrientation:I

    invoke-static {p0, v0}, Landroid/support/v7/widget/OrientationHelper;->createOrientationHelper(Landroid/support/v7/widget/RecyclerView$LayoutManager;I)Landroid/support/v7/widget/OrientationHelper;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    .line 514
    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mOrientation:I

    rsub-int/lit8 v0, v0, 0x1

    invoke-static {p0, v0}, Landroid/support/v7/widget/OrientationHelper;->createOrientationHelper(Landroid/support/v7/widget/RecyclerView$LayoutManager;I)Landroid/support/v7/widget/OrientationHelper;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSecondaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    .line 516
    new-instance v0, Landroid/support/v7/widget/LayoutState;

    invoke-direct {v0}, Landroid/support/v7/widget/LayoutState;-><init>()V

    iput-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLayoutState:Landroid/support/v7/widget/LayoutState;

    .line 518
    :cond_1d
    return-void
.end method

.method private fill(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/LayoutState;Landroid/support/v7/widget/RecyclerView$State;)I
    .registers 27
    .param p1, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;
    .param p2, "layoutState"    # Landroid/support/v7/widget/LayoutState;
    .param p3, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    move-object/from16 v6, p0

    move-object/from16 v7, p1

    move-object/from16 v8, p2

    .line 1400
    iget-object v0, v6, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mRemainingSpans:Ljava/util/BitSet;

    iget v1, v6, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    const/4 v9, 0x0

    const/4 v10, 0x1

    invoke-virtual {v0, v9, v1, v10}, Ljava/util/BitSet;->set(IIZ)V

    .line 1405
    iget v0, v8, Landroid/support/v7/widget/LayoutState;->mLayoutDirection:I

    if-ne v0, v10, :cond_19

    .line 1406
    iget v0, v8, Landroid/support/v7/widget/LayoutState;->mEndLine:I

    iget v1, v8, Landroid/support/v7/widget/LayoutState;->mAvailable:I

    add-int/2addr v0, v1

    .local v0, "targetLine":I
    goto :goto_1e

    .line 1408
    .end local v0    # "targetLine":I
    :cond_19
    iget v0, v8, Landroid/support/v7/widget/LayoutState;->mStartLine:I

    iget v1, v8, Landroid/support/v7/widget/LayoutState;->mAvailable:I

    sub-int/2addr v0, v1

    .restart local v0    # "targetLine":I
    :goto_1e
    move v11, v0

    .line 1411
    .end local v0    # "targetLine":I
    .local v11, "targetLine":I
    iget v0, v8, Landroid/support/v7/widget/LayoutState;->mLayoutDirection:I

    invoke-direct {v6, v0, v11}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->updateAllRemainingSpans(II)V

    .line 1418
    iget-boolean v0, v6, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mShouldReverseLayout:Z

    if-eqz v0, :cond_2f

    iget-object v0, v6, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v0}, Landroid/support/v7/widget/OrientationHelper;->getEndAfterPadding()I

    move-result v0

    goto :goto_35

    :cond_2f
    iget-object v0, v6, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v0}, Landroid/support/v7/widget/OrientationHelper;->getStartAfterPadding()I

    move-result v0

    :goto_35
    move v12, v0

    .line 1421
    .local v12, "defaultNewViewLine":I
    move v0, v9

    .local v0, "added":Z
    :goto_37
    move v13, v0

    .line 1422
    .end local v0    # "added":Z
    .local v13, "added":Z
    invoke-virtual/range {p2 .. p3}, Landroid/support/v7/widget/LayoutState;->hasMore(Landroid/support/v7/widget/RecyclerView$State;)Z

    move-result v0

    const/4 v1, -0x1

    if-eqz v0, :cond_17c

    iget-object v0, v6, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mRemainingSpans:Ljava/util/BitSet;

    invoke-virtual {v0}, Ljava/util/BitSet;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_17c

    .line 1423
    invoke-virtual {v8, v7}, Landroid/support/v7/widget/LayoutState;->next(Landroid/support/v7/widget/RecyclerView$Recycler;)Landroid/view/View;

    move-result-object v14

    .line 1424
    .local v14, "view":Landroid/view/View;
    invoke-virtual {v14}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    move-object v15, v0

    check-cast v15, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;

    .line 1425
    .local v15, "lp":Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;
    invoke-virtual {v15}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->getViewLayoutPosition()I

    move-result v5

    .line 1426
    .local v5, "position":I
    iget-object v0, v6, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLazySpanLookup:Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;

    invoke-virtual {v0, v5}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;->getSpan(I)I

    move-result v4

    .line 1428
    .local v4, "spanIndex":I
    if-ne v4, v1, :cond_60

    move v0, v10

    goto :goto_61

    :cond_60
    move v0, v9

    :goto_61
    move/from16 v16, v0

    .line 1429
    .local v16, "assignSpan":Z
    if-eqz v16, :cond_78

    .line 1430
    iget-boolean v0, v15, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->mFullSpan:Z

    if-eqz v0, :cond_6e

    iget-object v0, v6, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    aget-object v0, v0, v9

    goto :goto_72

    :cond_6e
    invoke-direct {v6, v8}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getNextSpan(Landroid/support/v7/widget/LayoutState;)Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    move-result-object v0

    .line 1431
    .local v0, "currentSpan":Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;
    :goto_72
    iget-object v2, v6, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLazySpanLookup:Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;

    invoke-virtual {v2, v5, v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;->setSpan(ILandroid/support/v7/widget/StaggeredGridLayoutManager$Span;)V

    goto :goto_7c

    .line 1439
    .end local v0    # "currentSpan":Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;
    :cond_78
    iget-object v0, v6, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    aget-object v0, v0, v4

    .restart local v0    # "currentSpan":Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;
    :goto_7c
    move-object v3, v0

    .line 1442
    .end local v0    # "currentSpan":Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;
    .local v3, "currentSpan":Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;
    iput-object v3, v15, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->mSpan:Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    .line 1443
    iget v0, v8, Landroid/support/v7/widget/LayoutState;->mLayoutDirection:I

    if-ne v0, v10, :cond_87

    .line 1444
    invoke-virtual {v6, v14}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->addView(Landroid/view/View;)V

    goto :goto_8a

    .line 1446
    :cond_87
    invoke-virtual {v6, v14, v9}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->addView(Landroid/view/View;I)V

    .line 1448
    :goto_8a
    invoke-direct {v6, v14, v15}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->measureChildWithDecorationsAndMargin(Landroid/view/View;Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;)V

    .line 1452
    iget v0, v8, Landroid/support/v7/widget/LayoutState;->mLayoutDirection:I

    if-ne v0, v10, :cond_bd

    .line 1453
    iget-boolean v0, v15, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->mFullSpan:Z

    if-eqz v0, :cond_9a

    invoke-direct {v6, v12}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getMaxEnd(I)I

    move-result v0

    goto :goto_9e

    :cond_9a
    invoke-virtual {v3, v12}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->getEndLine(I)I

    move-result v0

    .line 1455
    .local v0, "start":I
    :goto_9e
    iget-object v2, v6, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v2, v14}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedMeasurement(Landroid/view/View;)I

    move-result v2

    add-int/2addr v2, v0

    .line 1456
    .local v2, "end":I
    if-eqz v16, :cond_b9

    iget-boolean v9, v15, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->mFullSpan:Z

    if-eqz v9, :cond_b9

    .line 1458
    invoke-direct {v6, v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->createFullSpanItemFromEnd(I)Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;

    move-result-object v9

    .line 1459
    .local v9, "fullSpanItem":Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;
    iput v1, v9, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;->mGapDir:I

    .line 1460
    iput v5, v9, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;->mPosition:I

    .line 1461
    iget-object v1, v6, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLazySpanLookup:Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;

    invoke-virtual {v1, v9}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;->addFullSpanItem(Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;)V

    .line 1462
    .end local v9    # "fullSpanItem":Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;
    nop

    .line 1477
    :cond_b9
    move v9, v0

    move/from16 v19, v2

    goto :goto_e8

    .line 1464
    .end local v0    # "start":I
    .end local v2    # "end":I
    :cond_bd
    iget-boolean v0, v15, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->mFullSpan:Z

    if-eqz v0, :cond_c6

    invoke-direct {v6, v12}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getMinStart(I)I

    move-result v0

    goto :goto_ca

    :cond_c6
    invoke-virtual {v3, v12}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->getStartLine(I)I

    move-result v0

    .line 1466
    .local v0, "end":I
    :goto_ca
    iget-object v1, v6, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v1, v14}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedMeasurement(Landroid/view/View;)I

    move-result v1

    sub-int v1, v0, v1

    .line 1467
    .local v1, "start":I
    if-eqz v16, :cond_e5

    iget-boolean v2, v15, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->mFullSpan:Z

    if-eqz v2, :cond_e5

    .line 1469
    invoke-direct {v6, v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->createFullSpanItemFromStart(I)Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;

    move-result-object v2

    .line 1470
    .local v2, "fullSpanItem":Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;
    iput v10, v2, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;->mGapDir:I

    .line 1471
    iput v5, v2, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;->mPosition:I

    .line 1472
    iget-object v9, v6, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLazySpanLookup:Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;

    invoke-virtual {v9, v2}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;->addFullSpanItem(Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;)V

    .line 1477
    .end local v2    # "fullSpanItem":Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;
    :cond_e5
    move/from16 v19, v0

    move v9, v1

    .end local v0    # "end":I
    .end local v1    # "start":I
    .local v9, "start":I
    .local v19, "end":I
    :goto_e8
    iget-boolean v0, v15, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->mFullSpan:Z

    if-eqz v0, :cond_113

    iget v0, v8, Landroid/support/v7/widget/LayoutState;->mItemDirection:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_113

    .line 1478
    if-eqz v16, :cond_f6

    .line 1479
    iput-boolean v10, v6, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLaidOutInvalidFullSpan:Z

    goto :goto_113

    .line 1482
    :cond_f6
    iget v0, v8, Landroid/support/v7/widget/LayoutState;->mLayoutDirection:I

    if-ne v0, v10, :cond_100

    .line 1483
    invoke-virtual/range {p0 .. p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->areAllEndsEqual()Z

    move-result v0

    xor-int/2addr v0, v10

    .local v0, "hasInvalidGap":Z
    goto :goto_105

    .line 1485
    .end local v0    # "hasInvalidGap":Z
    :cond_100
    invoke-virtual/range {p0 .. p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->areAllStartsEqual()Z

    move-result v0

    xor-int/2addr v0, v10

    .line 1487
    .restart local v0    # "hasInvalidGap":Z
    :goto_105
    if-eqz v0, :cond_113

    .line 1488
    iget-object v1, v6, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLazySpanLookup:Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;

    invoke-virtual {v1, v5}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;->getFullSpanItem(I)Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;

    move-result-object v1

    .line 1490
    .local v1, "fullSpanItem":Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;
    if-eqz v1, :cond_111

    .line 1491
    iput-boolean v10, v1, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;->mHasUnwantedGapAfter:Z

    .line 1493
    :cond_111
    iput-boolean v10, v6, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLaidOutInvalidFullSpan:Z

    .line 1498
    .end local v0    # "hasInvalidGap":Z
    .end local v1    # "fullSpanItem":Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;
    :cond_113
    :goto_113
    invoke-direct {v6, v14, v15, v8}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->attachViewToSpans(Landroid/view/View;Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;Landroid/support/v7/widget/LayoutState;)V

    .line 1499
    iget-boolean v0, v15, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->mFullSpan:Z

    if-eqz v0, :cond_121

    iget-object v0, v6, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSecondaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v0}, Landroid/support/v7/widget/OrientationHelper;->getStartAfterPadding()I

    move-result v0

    goto :goto_12d

    :cond_121
    iget v0, v3, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mIndex:I

    iget v1, v6, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSizePerSpan:I

    mul-int/2addr v0, v1

    iget-object v1, v6, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSecondaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v1}, Landroid/support/v7/widget/OrientationHelper;->getStartAfterPadding()I

    move-result v1

    add-int/2addr v0, v1

    :goto_12d
    move/from16 v18, v0

    .line 1502
    .local v18, "otherStart":I
    iget-object v0, v6, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSecondaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v0, v14}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedMeasurement(Landroid/view/View;)I

    move-result v0

    add-int v20, v18, v0

    .line 1503
    .local v20, "otherEnd":I
    iget v0, v6, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mOrientation:I

    if-ne v0, v10, :cond_14d

    .line 1504
    move-object v0, v6

    move-object v1, v14

    move/from16 v2, v18

    move-object v10, v3

    move v3, v9

    .end local v3    # "currentSpan":Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;
    .local v10, "currentSpan":Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;
    move/from16 v21, v4

    move/from16 v4, v20

    .end local v4    # "spanIndex":I
    .local v21, "spanIndex":I
    move/from16 v22, v5

    move/from16 v5, v19

    .end local v5    # "position":I
    .local v22, "position":I
    invoke-direct/range {v0 .. v5}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->layoutDecoratedWithMargins(Landroid/view/View;IIII)V

    goto :goto_15e

    .line 1506
    .end local v10    # "currentSpan":Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;
    .end local v21    # "spanIndex":I
    .end local v22    # "position":I
    .restart local v3    # "currentSpan":Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;
    .restart local v4    # "spanIndex":I
    .restart local v5    # "position":I
    :cond_14d
    move-object v10, v3

    move/from16 v21, v4

    move/from16 v22, v5

    .end local v3    # "currentSpan":Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;
    .end local v4    # "spanIndex":I
    .end local v5    # "position":I
    .restart local v10    # "currentSpan":Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;
    .restart local v21    # "spanIndex":I
    .restart local v22    # "position":I
    move-object v0, v6

    move-object v1, v14

    move v2, v9

    move/from16 v3, v18

    move/from16 v4, v19

    move/from16 v5, v20

    invoke-direct/range {v0 .. v5}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->layoutDecoratedWithMargins(Landroid/view/View;IIII)V

    .line 1509
    :goto_15e
    iget-boolean v0, v15, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->mFullSpan:Z

    if-eqz v0, :cond_16a

    .line 1510
    iget-object v0, v6, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLayoutState:Landroid/support/v7/widget/LayoutState;

    iget v0, v0, Landroid/support/v7/widget/LayoutState;->mLayoutDirection:I

    invoke-direct {v6, v0, v11}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->updateAllRemainingSpans(II)V

    goto :goto_171

    .line 1512
    :cond_16a
    iget-object v0, v6, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLayoutState:Landroid/support/v7/widget/LayoutState;

    iget v0, v0, Landroid/support/v7/widget/LayoutState;->mLayoutDirection:I

    invoke-direct {v6, v10, v0, v11}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->updateRemainingSpans(Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;II)V

    .line 1514
    :goto_171
    iget-object v0, v6, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLayoutState:Landroid/support/v7/widget/LayoutState;

    invoke-direct {v6, v7, v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->recycle(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/LayoutState;)V

    .line 1515
    const/4 v0, 0x1

    .line 1516
    .end local v9    # "start":I
    .end local v10    # "currentSpan":Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;
    .end local v13    # "added":Z
    .end local v14    # "view":Landroid/view/View;
    .end local v15    # "lp":Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;
    .end local v16    # "assignSpan":Z
    .end local v18    # "otherStart":I
    .end local v19    # "end":I
    .end local v20    # "otherEnd":I
    .end local v21    # "spanIndex":I
    .end local v22    # "position":I
    .local v0, "added":Z
    nop

    .line 1421
    const/4 v9, 0x0

    const/4 v10, 0x1

    goto/16 :goto_37

    .line 1517
    .end local v0    # "added":Z
    .restart local v13    # "added":Z
    :cond_17c
    if-nez v13, :cond_183

    .line 1518
    iget-object v0, v6, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLayoutState:Landroid/support/v7/widget/LayoutState;

    invoke-direct {v6, v7, v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->recycle(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/LayoutState;)V

    .line 1521
    :cond_183
    iget-object v0, v6, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLayoutState:Landroid/support/v7/widget/LayoutState;

    iget v0, v0, Landroid/support/v7/widget/LayoutState;->mLayoutDirection:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_19c

    .line 1522
    iget-object v0, v6, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v0}, Landroid/support/v7/widget/OrientationHelper;->getStartAfterPadding()I

    move-result v0

    invoke-direct {v6, v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getMinStart(I)I

    move-result v0

    .line 1523
    .local v0, "minStart":I
    iget-object v1, v6, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v1}, Landroid/support/v7/widget/OrientationHelper;->getStartAfterPadding()I

    move-result v1

    sub-int/2addr v1, v0

    .line 1524
    .end local v0    # "minStart":I
    .local v1, "diff":I
    goto :goto_1ae

    .line 1525
    .end local v1    # "diff":I
    :cond_19c
    iget-object v0, v6, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v0}, Landroid/support/v7/widget/OrientationHelper;->getEndAfterPadding()I

    move-result v0

    invoke-direct {v6, v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getMaxEnd(I)I

    move-result v0

    .line 1526
    .local v0, "maxEnd":I
    iget-object v1, v6, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v1}, Landroid/support/v7/widget/OrientationHelper;->getEndAfterPadding()I

    move-result v1

    sub-int v1, v0, v1

    .end local v0    # "maxEnd":I
    .restart local v1    # "diff":I
    :goto_1ae
    move v0, v1

    .line 1528
    .end local v1    # "diff":I
    .local v0, "diff":I
    if-lez v0, :cond_1ba

    iget v1, v8, Landroid/support/v7/widget/LayoutState;->mAvailable:I

    invoke-static {v1, v0}, Ljava/lang/Math;->min(II)I

    move-result v9

    move/from16 v17, v9

    goto :goto_1bc

    :cond_1ba
    const/16 v17, 0x0

    :goto_1bc
    return v17
.end method

.method private findFirstReferenceChildPosition(I)I
    .registers 7
    .param p1, "itemCount"    # I

    .line 1961
    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getChildCount()I

    move-result v0

    .line 1962
    .local v0, "limit":I
    const/4 v1, 0x0

    move v2, v1

    .local v2, "i":I
    :goto_6
    if-ge v2, v0, :cond_18

    .line 1963
    invoke-virtual {p0, v2}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    .line 1964
    .local v3, "view":Landroid/view/View;
    invoke-virtual {p0, v3}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getPosition(Landroid/view/View;)I

    move-result v4

    .line 1965
    .local v4, "position":I
    if-ltz v4, :cond_15

    if-ge v4, p1, :cond_15

    .line 1966
    return v4

    .line 1962
    .end local v3    # "view":Landroid/view/View;
    .end local v4    # "position":I
    :cond_15
    add-int/lit8 v2, v2, 0x1

    goto :goto_6

    .line 1969
    .end local v2    # "i":I
    :cond_18
    return v1
.end method

.method private findLastReferenceChildPosition(I)I
    .registers 5
    .param p1, "itemCount"    # I

    .line 1978
    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getChildCount()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    .local v0, "i":I
    :goto_6
    if-ltz v0, :cond_18

    .line 1979
    invoke-virtual {p0, v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 1980
    .local v1, "view":Landroid/view/View;
    invoke-virtual {p0, v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getPosition(Landroid/view/View;)I

    move-result v2

    .line 1981
    .local v2, "position":I
    if-ltz v2, :cond_15

    if-ge v2, p1, :cond_15

    .line 1982
    return v2

    .line 1978
    .end local v1    # "view":Landroid/view/View;
    .end local v2    # "position":I
    :cond_15
    add-int/lit8 v0, v0, -0x1

    goto :goto_6

    .line 1985
    .end local v0    # "i":I
    :cond_18
    const/4 v0, 0x0

    return v0
.end method

.method private fixEndGap(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;Z)V
    .registers 8
    .param p1, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;
    .param p2, "state"    # Landroid/support/v7/widget/RecyclerView$State;
    .param p3, "canOffsetChildren"    # Z

    .line 1246
    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v0}, Landroid/support/v7/widget/OrientationHelper;->getEndAfterPadding()I

    move-result v0

    invoke-direct {p0, v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getMaxEnd(I)I

    move-result v0

    .line 1247
    .local v0, "maxEndLine":I
    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v1}, Landroid/support/v7/widget/OrientationHelper;->getEndAfterPadding()I

    move-result v1

    sub-int/2addr v1, v0

    .line 1249
    .local v1, "gap":I
    if-lez v1, :cond_25

    .line 1250
    neg-int v2, v1

    invoke-virtual {p0, v2, p1, p2}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->scrollBy(ILandroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;)I

    move-result v2

    neg-int v2, v2

    .line 1252
    .local v2, "fixOffset":I
    nop

    .line 1254
    sub-int/2addr v1, v2

    .line 1255
    if-eqz p3, :cond_24

    if-lez v1, :cond_24

    .line 1256
    iget-object v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v3, v1}, Landroid/support/v7/widget/OrientationHelper;->offsetChildren(I)V

    .line 1258
    :cond_24
    return-void

    .line 1252
    .end local v2    # "fixOffset":I
    :cond_25
    return-void
.end method

.method private fixStartGap(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;Z)V
    .registers 9
    .param p1, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;
    .param p2, "state"    # Landroid/support/v7/widget/RecyclerView$State;
    .param p3, "canOffsetChildren"    # Z

    .line 1262
    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v0}, Landroid/support/v7/widget/OrientationHelper;->getStartAfterPadding()I

    move-result v0

    invoke-direct {p0, v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getMinStart(I)I

    move-result v0

    .line 1263
    .local v0, "minStartLine":I
    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v1}, Landroid/support/v7/widget/OrientationHelper;->getStartAfterPadding()I

    move-result v1

    sub-int v1, v0, v1

    .line 1265
    .local v1, "gap":I
    if-lez v1, :cond_25

    .line 1266
    invoke-virtual {p0, v1, p1, p2}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->scrollBy(ILandroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;)I

    move-result v2

    .line 1268
    .local v2, "fixOffset":I
    nop

    .line 1270
    sub-int/2addr v1, v2

    .line 1271
    if-eqz p3, :cond_24

    if-lez v1, :cond_24

    .line 1272
    iget-object v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    neg-int v4, v1

    invoke-virtual {v3, v4}, Landroid/support/v7/widget/OrientationHelper;->offsetChildren(I)V

    .line 1274
    :cond_24
    return-void

    .line 1268
    .end local v2    # "fixOffset":I
    :cond_25
    return-void
.end method

.method private getFirstChildPosition()I
    .registers 3

    .line 1951
    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getChildCount()I

    move-result v0

    .line 1952
    .local v0, "childCount":I
    const/4 v1, 0x0

    if-nez v0, :cond_8

    goto :goto_10

    :cond_8
    invoke-virtual {p0, v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {p0, v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getPosition(Landroid/view/View;)I

    move-result v1

    :goto_10
    return v1
.end method

.method private getLastChildPosition()I
    .registers 3

    .line 1946
    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getChildCount()I

    move-result v0

    .line 1947
    .local v0, "childCount":I
    if-nez v0, :cond_8

    const/4 v1, 0x0

    goto :goto_12

    :cond_8
    add-int/lit8 v1, v0, -0x1

    invoke-virtual {p0, v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {p0, v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getPosition(Landroid/view/View;)I

    move-result v1

    :goto_12
    return v1
.end method

.method private getMaxEnd(I)I
    .registers 5
    .param p1, "def"    # I

    .line 1694
    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->getEndLine(I)I

    move-result v0

    .line 1695
    .local v0, "maxEnd":I
    const/4 v1, 0x1

    .local v1, "i":I
    :goto_a
    iget v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    if-ge v1, v2, :cond_1c

    .line 1696
    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    aget-object v2, v2, v1

    invoke-virtual {v2, p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->getEndLine(I)I

    move-result v2

    .line 1697
    .local v2, "spanEnd":I
    if-le v2, v0, :cond_19

    .line 1698
    move v0, v2

    .line 1695
    .end local v2    # "spanEnd":I
    :cond_19
    add-int/lit8 v1, v1, 0x1

    goto :goto_a

    .line 1701
    .end local v1    # "i":I
    :cond_1c
    return v0
.end method

.method private getMaxStart(I)I
    .registers 5
    .param p1, "def"    # I

    .line 1652
    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->getStartLine(I)I

    move-result v0

    .line 1653
    .local v0, "maxStart":I
    const/4 v1, 0x1

    .local v1, "i":I
    :goto_a
    iget v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    if-ge v1, v2, :cond_1c

    .line 1654
    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    aget-object v2, v2, v1

    invoke-virtual {v2, p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->getStartLine(I)I

    move-result v2

    .line 1655
    .local v2, "spanStart":I
    if-le v2, v0, :cond_19

    .line 1656
    move v0, v2

    .line 1653
    .end local v2    # "spanStart":I
    :cond_19
    add-int/lit8 v1, v1, 0x1

    goto :goto_a

    .line 1659
    .end local v1    # "i":I
    :cond_1c
    return v0
.end method

.method private getMinEnd(I)I
    .registers 5
    .param p1, "def"    # I

    .line 1705
    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->getEndLine(I)I

    move-result v0

    .line 1706
    .local v0, "minEnd":I
    const/4 v1, 0x1

    .local v1, "i":I
    :goto_a
    iget v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    if-ge v1, v2, :cond_1c

    .line 1707
    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    aget-object v2, v2, v1

    invoke-virtual {v2, p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->getEndLine(I)I

    move-result v2

    .line 1708
    .local v2, "spanEnd":I
    if-ge v2, v0, :cond_19

    .line 1709
    move v0, v2

    .line 1706
    .end local v2    # "spanEnd":I
    :cond_19
    add-int/lit8 v1, v1, 0x1

    goto :goto_a

    .line 1712
    .end local v1    # "i":I
    :cond_1c
    return v0
.end method

.method private getMinStart(I)I
    .registers 5
    .param p1, "def"    # I

    .line 1663
    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->getStartLine(I)I

    move-result v0

    .line 1664
    .local v0, "minStart":I
    const/4 v1, 0x1

    .local v1, "i":I
    :goto_a
    iget v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    if-ge v1, v2, :cond_1c

    .line 1665
    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    aget-object v2, v2, v1

    invoke-virtual {v2, p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->getStartLine(I)I

    move-result v2

    .line 1666
    .local v2, "spanStart":I
    if-ge v2, v0, :cond_19

    .line 1667
    move v0, v2

    .line 1664
    .end local v2    # "spanStart":I
    :cond_19
    add-int/lit8 v1, v1, 0x1

    goto :goto_a

    .line 1670
    .end local v1    # "i":I
    :cond_1c
    return v0
.end method

.method private getNextSpan(Landroid/support/v7/widget/LayoutState;)Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;
    .registers 12
    .param p1, "layoutState"    # Landroid/support/v7/widget/LayoutState;

    .line 1787
    iget v0, p1, Landroid/support/v7/widget/LayoutState;->mLayoutDirection:I

    invoke-direct {p0, v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->preferLastSpan(I)Z

    move-result v0

    .line 1789
    .local v0, "preferLastSpan":Z
    const/4 v1, 0x1

    if-eqz v0, :cond_f

    .line 1790
    iget v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    sub-int/2addr v2, v1

    .line 1791
    .local v2, "startIndex":I
    const/4 v3, -0x1

    .line 1792
    .local v3, "endIndex":I
    const/4 v4, -0x1

    .local v4, "diff":I
    goto :goto_13

    .line 1794
    .end local v2    # "startIndex":I
    .end local v3    # "endIndex":I
    .end local v4    # "diff":I
    :cond_f
    const/4 v2, 0x0

    .line 1795
    .restart local v2    # "startIndex":I
    iget v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    .line 1796
    .restart local v3    # "endIndex":I
    move v4, v1

    .line 1798
    .restart local v4    # "diff":I
    :goto_13
    iget v5, p1, Landroid/support/v7/widget/LayoutState;->mLayoutDirection:I

    if-ne v5, v1, :cond_34

    .line 1799
    const/4 v1, 0x0

    .line 1800
    .local v1, "min":Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;
    const v5, 0x7fffffff

    .line 1801
    .local v5, "minLine":I
    iget-object v6, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v6}, Landroid/support/v7/widget/OrientationHelper;->getStartAfterPadding()I

    move-result v6

    .line 1802
    .local v6, "defaultLine":I
    move-object v7, v1

    move v1, v2

    .local v1, "i":I
    .local v7, "min":Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;
    :goto_23
    if-eq v1, v3, :cond_33

    .line 1803
    iget-object v8, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    aget-object v8, v8, v1

    .line 1804
    .local v8, "other":Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;
    invoke-virtual {v8, v6}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->getEndLine(I)I

    move-result v9

    .line 1805
    .local v9, "otherLine":I
    if-ge v9, v5, :cond_31

    .line 1806
    move-object v7, v8

    .line 1807
    move v5, v9

    .line 1802
    .end local v8    # "other":Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;
    .end local v9    # "otherLine":I
    :cond_31
    add-int/2addr v1, v4

    goto :goto_23

    .line 1810
    .end local v1    # "i":I
    :cond_33
    return-object v7

    .line 1812
    .end local v5    # "minLine":I
    .end local v6    # "defaultLine":I
    .end local v7    # "min":Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;
    :cond_34
    const/4 v1, 0x0

    .line 1813
    .local v1, "max":Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;
    const/high16 v5, -0x80000000

    .line 1814
    .local v5, "maxLine":I
    iget-object v6, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v6}, Landroid/support/v7/widget/OrientationHelper;->getEndAfterPadding()I

    move-result v6

    .line 1815
    .restart local v6    # "defaultLine":I
    move-object v7, v1

    move v1, v2

    .local v1, "i":I
    .local v7, "max":Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;
    :goto_3f
    if-eq v1, v3, :cond_4f

    .line 1816
    iget-object v8, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    aget-object v8, v8, v1

    .line 1817
    .restart local v8    # "other":Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;
    invoke-virtual {v8, v6}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->getStartLine(I)I

    move-result v9

    .line 1818
    .restart local v9    # "otherLine":I
    if-le v9, v5, :cond_4d

    .line 1819
    move-object v7, v8

    .line 1820
    move v5, v9

    .line 1815
    .end local v8    # "other":Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;
    .end local v9    # "otherLine":I
    :cond_4d
    add-int/2addr v1, v4

    goto :goto_3f

    .line 1823
    .end local v1    # "i":I
    :cond_4f
    return-object v7
.end method

.method private getSpecForDimension(II)I
    .registers 4
    .param p1, "dim"    # I
    .param p2, "defaultSpec"    # I

    .line 1018
    if-gez p1, :cond_3

    .line 1019
    return p2

    .line 1021
    :cond_3
    const/high16 v0, 0x40000000    # 2.0f

    invoke-static {p1, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v0

    return v0
.end method

.method private handleUpdate(III)V
    .registers 9
    .param p1, "positionStart"    # I
    .param p2, "itemCountOrToPosition"    # I
    .param p3, "cmd"    # I

    .line 1356
    iget-boolean v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mShouldReverseLayout:Z

    if-eqz v0, :cond_9

    invoke-direct {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getLastChildPosition()I

    move-result v0

    goto :goto_d

    :cond_9
    invoke-direct {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getFirstChildPosition()I

    move-result v0

    .line 1360
    .local v0, "minPosition":I
    :goto_d
    const/4 v1, 0x3

    if-ne p3, v1, :cond_1a

    .line 1361
    if-ge p1, p2, :cond_16

    .line 1362
    add-int/lit8 v2, p2, 0x1

    .line 1363
    .local v2, "affectedRangeEnd":I
    move v3, p1

    .local v3, "affectedRangeStart":I
    :goto_15
    goto :goto_1d

    .line 1365
    .end local v2    # "affectedRangeEnd":I
    .end local v3    # "affectedRangeStart":I
    :cond_16
    add-int/lit8 v2, p1, 0x1

    .line 1366
    .restart local v2    # "affectedRangeEnd":I
    move v3, p2

    goto :goto_15

    .line 1369
    .end local v2    # "affectedRangeEnd":I
    :cond_1a
    move v3, p1

    .line 1370
    .restart local v3    # "affectedRangeStart":I
    add-int v2, p1, p2

    .line 1373
    .restart local v2    # "affectedRangeEnd":I
    :goto_1d
    iget-object v4, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLazySpanLookup:Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;

    invoke-virtual {v4, v3}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;->invalidateAfter(I)I

    .line 1374
    if-eq p3, v1, :cond_34

    packed-switch p3, :pswitch_data_56

    goto :goto_3f

    .line 1379
    :pswitch_28
    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLazySpanLookup:Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;

    invoke-virtual {v1, p1, p2}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;->offsetForRemoval(II)V

    .line 1380
    goto :goto_3f

    .line 1376
    :pswitch_2e
    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLazySpanLookup:Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;

    invoke-virtual {v1, p1, p2}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;->offsetForAddition(II)V

    .line 1377
    goto :goto_3f

    .line 1383
    :cond_34
    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLazySpanLookup:Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;

    const/4 v4, 0x1

    invoke-virtual {v1, p1, v4}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;->offsetForRemoval(II)V

    .line 1384
    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLazySpanLookup:Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;

    invoke-virtual {v1, p2, v4}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;->offsetForAddition(II)V

    .line 1388
    :goto_3f
    if-gt v2, v0, :cond_42

    .line 1389
    return-void

    .line 1392
    :cond_42
    iget-boolean v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mShouldReverseLayout:Z

    if-eqz v1, :cond_4b

    invoke-direct {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getFirstChildPosition()I

    move-result v1

    goto :goto_4f

    :cond_4b
    invoke-direct {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getLastChildPosition()I

    move-result v1

    .line 1393
    .local v1, "maxPosition":I
    :goto_4f
    if-gt v3, v1, :cond_54

    .line 1394
    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->requestLayout()V

    .line 1396
    :cond_54
    return-void

    nop

    :pswitch_data_56
    .packed-switch 0x0
        :pswitch_2e
        :pswitch_28
    .end packed-switch
.end method

.method private layoutDecoratedWithMargins(Landroid/view/View;IIII)V
    .registers 14
    .param p1, "child"    # Landroid/view/View;
    .param p2, "left"    # I
    .param p3, "top"    # I
    .param p4, "right"    # I
    .param p5, "bottom"    # I

    .line 1616
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;

    .line 1623
    .local v0, "lp":Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;
    iget v1, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->leftMargin:I

    add-int v4, p2, v1

    iget v1, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->topMargin:I

    add-int v5, p3, v1

    iget v1, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->rightMargin:I

    sub-int v6, p4, v1

    iget v1, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->bottomMargin:I

    sub-int v7, p5, v1

    move-object v2, p0

    move-object v3, p1

    invoke-virtual/range {v2 .. v7}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->layoutDecorated(Landroid/view/View;IIII)V

    .line 1625
    return-void
.end method

.method private measureChildWithDecorationsAndMargin(Landroid/view/View;II)V
    .registers 8
    .param p1, "child"    # Landroid/view/View;
    .param p2, "widthSpec"    # I
    .param p3, "heightSpec"    # I

    .line 1027
    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mTmpRect:Landroid/graphics/Rect;

    invoke-virtual {p0, p1, v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->calculateItemDecorationsForChild(Landroid/view/View;Landroid/graphics/Rect;)V

    .line 1028
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;

    .line 1029
    .local v0, "lp":Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;
    iget v1, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->leftMargin:I

    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mTmpRect:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->left:I

    add-int/2addr v1, v2

    iget v2, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->rightMargin:I

    iget-object v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mTmpRect:Landroid/graphics/Rect;

    iget v3, v3, Landroid/graphics/Rect;->right:I

    add-int/2addr v2, v3

    invoke-direct {p0, p2, v1, v2}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->updateSpecWithExtra(III)I

    move-result p2

    .line 1031
    iget v1, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->topMargin:I

    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mTmpRect:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->top:I

    add-int/2addr v1, v2

    iget v2, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->bottomMargin:I

    iget-object v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mTmpRect:Landroid/graphics/Rect;

    iget v3, v3, Landroid/graphics/Rect;->bottom:I

    add-int/2addr v2, v3

    invoke-direct {p0, p3, v1, v2}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->updateSpecWithExtra(III)I

    move-result p3

    .line 1033
    invoke-virtual {p1, p2, p3}, Landroid/view/View;->measure(II)V

    .line 1034
    return-void
.end method

.method private measureChildWithDecorationsAndMargin(Landroid/view/View;Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;)V
    .registers 6
    .param p1, "child"    # Landroid/view/View;
    .param p2, "lp"    # Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;

    .line 998
    iget-boolean v0, p2, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->mFullSpan:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_25

    .line 999
    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mOrientation:I

    if-ne v0, v1, :cond_17

    .line 1000
    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mFullSizeSpec:I

    iget v1, p2, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->height:I

    iget v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mHeightSpec:I

    invoke-direct {p0, v1, v2}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getSpecForDimension(II)I

    move-result v1

    invoke-direct {p0, p1, v0, v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->measureChildWithDecorationsAndMargin(Landroid/view/View;II)V

    goto :goto_44

    .line 1003
    :cond_17
    iget v0, p2, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->width:I

    iget v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mWidthSpec:I

    invoke-direct {p0, v0, v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getSpecForDimension(II)I

    move-result v0

    iget v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mFullSizeSpec:I

    invoke-direct {p0, p1, v0, v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->measureChildWithDecorationsAndMargin(Landroid/view/View;II)V

    goto :goto_44

    .line 1007
    :cond_25
    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mOrientation:I

    if-ne v0, v1, :cond_37

    .line 1008
    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mWidthSpec:I

    iget v1, p2, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->height:I

    iget v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mHeightSpec:I

    invoke-direct {p0, v1, v2}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getSpecForDimension(II)I

    move-result v1

    invoke-direct {p0, p1, v0, v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->measureChildWithDecorationsAndMargin(Landroid/view/View;II)V

    goto :goto_44

    .line 1011
    :cond_37
    iget v0, p2, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->width:I

    iget v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mWidthSpec:I

    invoke-direct {p0, v0, v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getSpecForDimension(II)I

    move-result v0

    iget v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mHeightSpec:I

    invoke-direct {p0, p1, v0, v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->measureChildWithDecorationsAndMargin(Landroid/view/View;II)V

    .line 1015
    :goto_44
    return-void
.end method

.method private preferLastSpan(I)Z
    .registers 6
    .param p1, "layoutDir"    # I

    .line 1777
    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mOrientation:I

    const/4 v1, -0x1

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-nez v0, :cond_13

    .line 1778
    if-ne p1, v1, :cond_b

    move v0, v3

    goto :goto_c

    :cond_b
    move v0, v2

    :goto_c
    iget-boolean v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mShouldReverseLayout:Z

    if-eq v0, v1, :cond_12

    move v2, v3

    nop

    :cond_12
    return v2

    .line 1780
    :cond_13
    if-ne p1, v1, :cond_17

    move v0, v3

    goto :goto_18

    :cond_17
    move v0, v2

    :goto_18
    iget-boolean v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mShouldReverseLayout:Z

    if-ne v0, v1, :cond_1e

    move v0, v3

    goto :goto_1f

    :cond_1e
    move v0, v2

    :goto_1f
    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->isLayoutRTL()Z

    move-result v1

    if-ne v0, v1, :cond_27

    move v2, v3

    nop

    :cond_27
    return v2
.end method

.method private prependViewToAllSpans(Landroid/view/View;)V
    .registers 4
    .param p1, "view"    # Landroid/view/View;

    .line 1610
    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    add-int/lit8 v0, v0, -0x1

    .local v0, "i":I
    :goto_4
    if-ltz v0, :cond_10

    .line 1611
    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    aget-object v1, v1, v0

    invoke-virtual {v1, p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->prependToSpan(Landroid/view/View;)V

    .line 1610
    add-int/lit8 v0, v0, -0x1

    goto :goto_4

    .line 1613
    .end local v0    # "i":I
    :cond_10
    return-void
.end method

.method private recycle(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/LayoutState;)V
    .registers 6
    .param p1, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;
    .param p2, "layoutState"    # Landroid/support/v7/widget/LayoutState;

    .line 1566
    iget v0, p2, Landroid/support/v7/widget/LayoutState;->mAvailable:I

    const/4 v1, -0x1

    if-nez v0, :cond_15

    .line 1568
    iget v0, p2, Landroid/support/v7/widget/LayoutState;->mLayoutDirection:I

    if-ne v0, v1, :cond_f

    .line 1569
    iget v0, p2, Landroid/support/v7/widget/LayoutState;->mEndLine:I

    invoke-direct {p0, p1, v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->recycleFromEnd(Landroid/support/v7/widget/RecyclerView$Recycler;I)V

    goto :goto_4e

    .line 1571
    :cond_f
    iget v0, p2, Landroid/support/v7/widget/LayoutState;->mStartLine:I

    invoke-direct {p0, p1, v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->recycleFromStart(Landroid/support/v7/widget/RecyclerView$Recycler;I)V

    goto :goto_4e

    .line 1576
    :cond_15
    iget v0, p2, Landroid/support/v7/widget/LayoutState;->mLayoutDirection:I

    if-ne v0, v1, :cond_34

    .line 1578
    iget v0, p2, Landroid/support/v7/widget/LayoutState;->mStartLine:I

    iget v1, p2, Landroid/support/v7/widget/LayoutState;->mStartLine:I

    invoke-direct {p0, v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getMaxStart(I)I

    move-result v1

    sub-int/2addr v0, v1

    .line 1580
    .local v0, "scrolled":I
    if-gez v0, :cond_27

    .line 1581
    iget v1, p2, Landroid/support/v7/widget/LayoutState;->mEndLine:I

    .local v1, "line":I
    goto :goto_30

    .line 1583
    .end local v1    # "line":I
    :cond_27
    iget v1, p2, Landroid/support/v7/widget/LayoutState;->mEndLine:I

    iget v2, p2, Landroid/support/v7/widget/LayoutState;->mAvailable:I

    invoke-static {v0, v2}, Ljava/lang/Math;->min(II)I

    move-result v2

    sub-int/2addr v1, v2

    .line 1585
    .restart local v1    # "line":I
    :goto_30
    invoke-direct {p0, p1, v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->recycleFromEnd(Landroid/support/v7/widget/RecyclerView$Recycler;I)V

    .line 1586
    .end local v0    # "scrolled":I
    .end local v1    # "line":I
    goto :goto_4e

    .line 1588
    :cond_34
    iget v0, p2, Landroid/support/v7/widget/LayoutState;->mEndLine:I

    invoke-direct {p0, v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getMinEnd(I)I

    move-result v0

    iget v1, p2, Landroid/support/v7/widget/LayoutState;->mEndLine:I

    sub-int/2addr v0, v1

    .line 1590
    .restart local v0    # "scrolled":I
    if-gez v0, :cond_42

    .line 1591
    iget v1, p2, Landroid/support/v7/widget/LayoutState;->mStartLine:I

    .restart local v1    # "line":I
    goto :goto_4b

    .line 1593
    .end local v1    # "line":I
    :cond_42
    iget v1, p2, Landroid/support/v7/widget/LayoutState;->mStartLine:I

    iget v2, p2, Landroid/support/v7/widget/LayoutState;->mAvailable:I

    invoke-static {v0, v2}, Ljava/lang/Math;->min(II)I

    move-result v2

    add-int/2addr v1, v2

    .line 1595
    .restart local v1    # "line":I
    :goto_4b
    invoke-direct {p0, p1, v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->recycleFromStart(Landroid/support/v7/widget/RecyclerView$Recycler;I)V

    .line 1599
    .end local v0    # "scrolled":I
    .end local v1    # "line":I
    :goto_4e
    return-void
.end method

.method private recycleFromEnd(Landroid/support/v7/widget/RecyclerView$Recycler;I)V
    .registers 11
    .param p1, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;
    .param p2, "line"    # I

    .line 1744
    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getChildCount()I

    move-result v0

    .line 1746
    .local v0, "childCount":I
    add-int/lit8 v1, v0, -0x1

    .local v1, "i":I
    :goto_6
    if-ltz v1, :cond_60

    .line 1747
    invoke-virtual {p0, v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 1748
    .local v2, "child":Landroid/view/View;
    iget-object v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v3, v2}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedStart(Landroid/view/View;)I

    move-result v3

    if-lt v3, p2, :cond_5f

    .line 1749
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;

    .line 1751
    .local v3, "lp":Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;
    iget-boolean v4, v3, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->mFullSpan:Z

    const/4 v5, 0x1

    if-eqz v4, :cond_46

    .line 1752
    const/4 v4, 0x0

    move v6, v4

    .local v6, "j":I
    :goto_21
    iget v7, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    if-ge v6, v7, :cond_37

    .line 1753
    iget-object v7, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    aget-object v7, v7, v6

    # getter for: Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mViews:Ljava/util/ArrayList;
    invoke-static {v7}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->access$300(Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;)Ljava/util/ArrayList;

    move-result-object v7

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v7

    if-ne v7, v5, :cond_34

    .line 1754
    return-void

    .line 1752
    :cond_34
    add-int/lit8 v6, v6, 0x1

    goto :goto_21

    .line 1757
    .end local v6    # "j":I
    :cond_37
    nop

    .local v4, "j":I
    :goto_38
    iget v5, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    if-ge v4, v5, :cond_58

    .line 1758
    iget-object v5, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    aget-object v5, v5, v4

    invoke-virtual {v5}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->popEnd()V

    .line 1757
    add-int/lit8 v4, v4, 0x1

    goto :goto_38

    .line 1761
    .end local v4    # "j":I
    :cond_46
    iget-object v4, v3, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->mSpan:Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    # getter for: Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mViews:Ljava/util/ArrayList;
    invoke-static {v4}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->access$300(Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;)Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ne v4, v5, :cond_53

    .line 1762
    return-void

    .line 1764
    :cond_53
    iget-object v4, v3, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->mSpan:Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    invoke-virtual {v4}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->popEnd()V

    .line 1766
    :cond_58
    invoke-virtual {p0, v2, p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->removeAndRecycleView(Landroid/view/View;Landroid/support/v7/widget/RecyclerView$Recycler;)V

    .line 1767
    .end local v3    # "lp":Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;
    nop

    .line 1746
    .end local v2    # "child":Landroid/view/View;
    add-int/lit8 v1, v1, -0x1

    goto :goto_6

    .line 1768
    .restart local v2    # "child":Landroid/view/View;
    :cond_5f
    return-void

    .line 1771
    .end local v2    # "child":Landroid/view/View;
    :cond_60
    return-void
.end method

.method private recycleFromStart(Landroid/support/v7/widget/RecyclerView$Recycler;I)V
    .registers 9
    .param p1, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;
    .param p2, "line"    # I

    .line 1716
    :goto_0
    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getChildCount()I

    move-result v0

    if-lez v0, :cond_5c

    .line 1717
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 1718
    .local v1, "child":Landroid/view/View;
    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v2, v1}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedEnd(Landroid/view/View;)I

    move-result v2

    if-gt v2, p2, :cond_5b

    .line 1719
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;

    .line 1721
    .local v2, "lp":Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;
    iget-boolean v3, v2, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->mFullSpan:Z

    const/4 v4, 0x1

    if-eqz v3, :cond_44

    .line 1722
    move v3, v0

    .local v3, "j":I
    :goto_1f
    iget v5, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    if-ge v3, v5, :cond_35

    .line 1723
    iget-object v5, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    aget-object v5, v5, v3

    # getter for: Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mViews:Ljava/util/ArrayList;
    invoke-static {v5}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->access$300(Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;)Ljava/util/ArrayList;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-ne v5, v4, :cond_32

    .line 1724
    return-void

    .line 1722
    :cond_32
    add-int/lit8 v3, v3, 0x1

    goto :goto_1f

    .line 1727
    .end local v3    # "j":I
    :cond_35
    nop

    .local v0, "j":I
    :goto_36
    iget v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    if-ge v0, v3, :cond_56

    .line 1728
    iget-object v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    aget-object v3, v3, v0

    invoke-virtual {v3}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->popStart()V

    .line 1727
    add-int/lit8 v0, v0, 0x1

    goto :goto_36

    .line 1731
    .end local v0    # "j":I
    :cond_44
    iget-object v0, v2, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->mSpan:Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    # getter for: Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mViews:Ljava/util/ArrayList;
    invoke-static {v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->access$300(Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ne v0, v4, :cond_51

    .line 1732
    return-void

    .line 1734
    :cond_51
    iget-object v0, v2, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->mSpan:Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    invoke-virtual {v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->popStart()V

    .line 1736
    :cond_56
    invoke-virtual {p0, v1, p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->removeAndRecycleView(Landroid/view/View;Landroid/support/v7/widget/RecyclerView$Recycler;)V

    .line 1737
    .end local v2    # "lp":Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;
    nop

    .line 1740
    .end local v1    # "child":Landroid/view/View;
    goto :goto_0

    .line 1738
    .restart local v1    # "child":Landroid/view/View;
    :cond_5b
    return-void

    .line 1741
    .end local v1    # "child":Landroid/view/View;
    :cond_5c
    return-void
.end method

.method private resolveShouldLayoutReverse()V
    .registers 3

    .line 527
    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mOrientation:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_12

    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->isLayoutRTL()Z

    move-result v0

    if-nez v0, :cond_c

    goto :goto_12

    .line 530
    :cond_c
    iget-boolean v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mReverseLayout:Z

    xor-int/2addr v0, v1

    iput-boolean v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mShouldReverseLayout:Z

    goto :goto_16

    .line 528
    :cond_12
    :goto_12
    iget-boolean v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mReverseLayout:Z

    iput-boolean v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mShouldReverseLayout:Z

    .line 532
    :goto_16
    return-void
.end method

.method private setLayoutStateDirection(I)V
    .registers 7
    .param p1, "direction"    # I

    .line 1304
    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLayoutState:Landroid/support/v7/widget/LayoutState;

    iput p1, v0, Landroid/support/v7/widget/LayoutState;->mLayoutDirection:I

    .line 1305
    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLayoutState:Landroid/support/v7/widget/LayoutState;

    iget-boolean v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mShouldReverseLayout:Z

    const/4 v2, 0x1

    const/4 v3, -0x1

    if-ne p1, v3, :cond_e

    move v4, v2

    goto :goto_f

    :cond_e
    const/4 v4, 0x0

    :goto_f
    if-ne v1, v4, :cond_12

    goto :goto_13

    :cond_12
    move v2, v3

    :goto_13
    iput v2, v0, Landroid/support/v7/widget/LayoutState;->mItemDirection:I

    .line 1307
    return-void
.end method

.method private updateAllRemainingSpans(II)V
    .registers 5
    .param p1, "layoutDir"    # I
    .param p2, "targetLine"    # I

    .line 1628
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    iget v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    if-ge v0, v1, :cond_1e

    .line 1629
    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    aget-object v1, v1, v0

    # getter for: Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mViews:Ljava/util/ArrayList;
    invoke-static {v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->access$300(Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_14

    .line 1630
    goto :goto_1b

    .line 1632
    :cond_14
    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    aget-object v1, v1, v0

    invoke-direct {p0, v1, p1, p2}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->updateRemainingSpans(Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;II)V

    .line 1628
    :goto_1b
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 1634
    .end local v0    # "i":I
    :cond_1e
    return-void
.end method

.method private updateAnchorFromChildren(Landroid/support/v7/widget/RecyclerView$State;Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;)Z
    .registers 4
    .param p1, "state"    # Landroid/support/v7/widget/RecyclerView$State;
    .param p2, "anchorInfo"    # Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;

    .line 701
    iget-boolean v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLastLayoutFromEnd:Z

    if-eqz v0, :cond_d

    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView$State;->getItemCount()I

    move-result v0

    invoke-direct {p0, v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->findLastReferenceChildPosition(I)I

    move-result v0

    goto :goto_15

    :cond_d
    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView$State;->getItemCount()I

    move-result v0

    invoke-direct {p0, v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->findFirstReferenceChildPosition(I)I

    move-result v0

    :goto_15
    iput v0, p2, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->mPosition:I

    .line 704
    const/high16 v0, -0x80000000

    iput v0, p2, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->mOffset:I

    .line 705
    const/4 v0, 0x1

    return v0
.end method

.method private updateLayoutState(ILandroid/support/v7/widget/RecyclerView$State;)V
    .registers 8
    .param p1, "anchorPosition"    # I
    .param p2, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .line 1277
    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLayoutState:Landroid/support/v7/widget/LayoutState;

    const/4 v1, 0x0

    iput v1, v0, Landroid/support/v7/widget/LayoutState;->mAvailable:I

    .line 1278
    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLayoutState:Landroid/support/v7/widget/LayoutState;

    iput p1, v0, Landroid/support/v7/widget/LayoutState;->mCurrentPosition:I

    .line 1279
    const/4 v0, 0x0

    .line 1280
    .local v0, "startExtra":I
    const/4 v2, 0x0

    .line 1281
    .local v2, "endExtra":I
    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->isSmoothScrolling()Z

    move-result v3

    if-eqz v3, :cond_2d

    .line 1282
    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView$State;->getTargetScrollPosition()I

    move-result v3

    .line 1283
    .local v3, "targetPos":I
    const/4 v4, -0x1

    if-eq v3, v4, :cond_2d

    .line 1284
    iget-boolean v4, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mShouldReverseLayout:Z

    if-ge v3, p1, :cond_1e

    const/4 v1, 0x1

    nop

    :cond_1e
    if-ne v4, v1, :cond_27

    .line 1285
    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v1}, Landroid/support/v7/widget/OrientationHelper;->getTotalSpace()I

    move-result v2

    goto :goto_2d

    .line 1287
    :cond_27
    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v1}, Landroid/support/v7/widget/OrientationHelper;->getTotalSpace()I

    move-result v0

    .line 1293
    .end local v3    # "targetPos":I
    :cond_2d
    :goto_2d
    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getClipToPadding()Z

    move-result v1

    .line 1294
    .local v1, "clipToPadding":Z
    if-eqz v1, :cond_4a

    .line 1295
    iget-object v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLayoutState:Landroid/support/v7/widget/LayoutState;

    iget-object v4, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v4}, Landroid/support/v7/widget/OrientationHelper;->getStartAfterPadding()I

    move-result v4

    sub-int/2addr v4, v0

    iput v4, v3, Landroid/support/v7/widget/LayoutState;->mStartLine:I

    .line 1296
    iget-object v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLayoutState:Landroid/support/v7/widget/LayoutState;

    iget-object v4, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v4}, Landroid/support/v7/widget/OrientationHelper;->getEndAfterPadding()I

    move-result v4

    add-int/2addr v4, v2

    iput v4, v3, Landroid/support/v7/widget/LayoutState;->mEndLine:I

    goto :goto_5a

    .line 1298
    :cond_4a
    iget-object v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLayoutState:Landroid/support/v7/widget/LayoutState;

    iget-object v4, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v4}, Landroid/support/v7/widget/OrientationHelper;->getEnd()I

    move-result v4

    add-int/2addr v4, v2

    iput v4, v3, Landroid/support/v7/widget/LayoutState;->mEndLine:I

    .line 1299
    iget-object v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLayoutState:Landroid/support/v7/widget/LayoutState;

    neg-int v4, v0

    iput v4, v3, Landroid/support/v7/widget/LayoutState;->mStartLine:I

    .line 1301
    :goto_5a
    return-void
.end method

.method private updateRemainingSpans(Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;II)V
    .registers 9
    .param p1, "span"    # Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;
    .param p2, "layoutDir"    # I
    .param p3, "targetLine"    # I

    .line 1637
    invoke-virtual {p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->getDeletedSize()I

    move-result v0

    .line 1638
    .local v0, "deletedSize":I
    const/4 v1, 0x0

    const/4 v2, -0x1

    if-ne p2, v2, :cond_18

    .line 1639
    invoke-virtual {p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->getStartLine()I

    move-result v2

    .line 1640
    .local v2, "line":I
    add-int v3, v2, v0

    if-gt v3, p3, :cond_17

    .line 1641
    iget-object v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mRemainingSpans:Ljava/util/BitSet;

    iget v4, p1, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mIndex:I

    invoke-virtual {v3, v4, v1}, Ljava/util/BitSet;->set(IZ)V

    .line 1643
    .end local v2    # "line":I
    :cond_17
    goto :goto_27

    .line 1644
    :cond_18
    invoke-virtual {p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->getEndLine()I

    move-result v2

    .line 1645
    .restart local v2    # "line":I
    sub-int v3, v2, v0

    if-lt v3, p3, :cond_27

    .line 1646
    iget-object v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mRemainingSpans:Ljava/util/BitSet;

    iget v4, p1, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mIndex:I

    invoke-virtual {v3, v4, v1}, Ljava/util/BitSet;->set(IZ)V

    .line 1649
    .end local v2    # "line":I
    :cond_27
    :goto_27
    return-void
.end method

.method private updateSpecWithExtra(III)I
    .registers 6
    .param p1, "spec"    # I
    .param p2, "startInset"    # I
    .param p3, "endInset"    # I

    .line 1037
    if-nez p2, :cond_5

    if-nez p3, :cond_5

    .line 1038
    return p1

    .line 1040
    :cond_5
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v0

    .line 1041
    .local v0, "mode":I
    const/high16 v1, -0x80000000

    if-eq v0, v1, :cond_13

    const/high16 v1, 0x40000000    # 2.0f

    if-ne v0, v1, :cond_12

    goto :goto_13

    .line 1045
    :cond_12
    return p1

    .line 1042
    :cond_13
    :goto_13
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v1

    sub-int/2addr v1, p2

    sub-int/2addr v1, p3

    invoke-static {v1, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v1

    return v1
.end method


# virtual methods
.method areAllEndsEqual()Z
    .registers 7

    .line 1674
    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    const/high16 v2, -0x80000000

    invoke-virtual {v0, v2}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->getEndLine(I)I

    move-result v0

    .line 1675
    .local v0, "end":I
    const/4 v3, 0x1

    move v4, v3

    .local v4, "i":I
    :goto_d
    iget v5, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    if-ge v4, v5, :cond_1f

    .line 1676
    iget-object v5, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    aget-object v5, v5, v4

    invoke-virtual {v5, v2}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->getEndLine(I)I

    move-result v5

    if-eq v5, v0, :cond_1c

    .line 1677
    return v1

    .line 1675
    :cond_1c
    add-int/lit8 v4, v4, 0x1

    goto :goto_d

    .line 1680
    .end local v4    # "i":I
    :cond_1f
    return v3
.end method

.method areAllStartsEqual()Z
    .registers 7

    .line 1684
    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    const/high16 v2, -0x80000000

    invoke-virtual {v0, v2}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->getStartLine(I)I

    move-result v0

    .line 1685
    .local v0, "start":I
    const/4 v3, 0x1

    move v4, v3

    .local v4, "i":I
    :goto_d
    iget v5, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    if-ge v4, v5, :cond_1f

    .line 1686
    iget-object v5, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    aget-object v5, v5, v4

    invoke-virtual {v5, v2}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->getStartLine(I)I

    move-result v5

    if-eq v5, v0, :cond_1c

    .line 1687
    return v1

    .line 1685
    :cond_1c
    add-int/lit8 v4, v4, 0x1

    goto :goto_d

    .line 1690
    .end local v4    # "i":I
    :cond_1f
    return v3
.end method

.method public assertNotInLayoutOrScroll(Ljava/lang/String;)V
    .registers 3
    .param p1, "message"    # Ljava/lang/String;

    .line 486
    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    if-nez v0, :cond_7

    .line 487
    invoke-super {p0, p1}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->assertNotInLayoutOrScroll(Ljava/lang/String;)V

    .line 489
    :cond_7
    return-void
.end method

.method public canScrollHorizontally()Z
    .registers 2

    .line 1834
    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mOrientation:I

    if-nez v0, :cond_6

    const/4 v0, 0x1

    goto :goto_7

    :cond_6
    const/4 v0, 0x0

    :goto_7
    return v0
.end method

.method public canScrollVertically()Z
    .registers 3

    .line 1829
    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mOrientation:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_6

    goto :goto_7

    :cond_6
    const/4 v1, 0x0

    :goto_7
    return v1
.end method

.method public checkLayoutParams(Landroid/support/v7/widget/RecyclerView$LayoutParams;)Z
    .registers 3
    .param p1, "lp"    # Landroid/support/v7/widget/RecyclerView$LayoutParams;

    .line 2010
    instance-of v0, p1, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;

    return v0
.end method

.method public computeHorizontalScrollExtent(Landroid/support/v7/widget/RecyclerView$State;)I
    .registers 3
    .param p1, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .line 957
    invoke-direct {p0, p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->computeScrollExtent(Landroid/support/v7/widget/RecyclerView$State;)I

    move-result v0

    return v0
.end method

.method public computeHorizontalScrollOffset(Landroid/support/v7/widget/RecyclerView$State;)I
    .registers 3
    .param p1, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .line 936
    invoke-direct {p0, p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->computeScrollOffset(Landroid/support/v7/widget/RecyclerView$State;)I

    move-result v0

    return v0
.end method

.method public computeHorizontalScrollRange(Landroid/support/v7/widget/RecyclerView$State;)I
    .registers 3
    .param p1, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .line 978
    invoke-direct {p0, p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->computeScrollRange(Landroid/support/v7/widget/RecyclerView$State;)I

    move-result v0

    return v0
.end method

.method public computeVerticalScrollExtent(Landroid/support/v7/widget/RecyclerView$State;)I
    .registers 3
    .param p1, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .line 973
    invoke-direct {p0, p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->computeScrollExtent(Landroid/support/v7/widget/RecyclerView$State;)I

    move-result v0

    return v0
.end method

.method public computeVerticalScrollOffset(Landroid/support/v7/widget/RecyclerView$State;)I
    .registers 3
    .param p1, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .line 952
    invoke-direct {p0, p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->computeScrollOffset(Landroid/support/v7/widget/RecyclerView$State;)I

    move-result v0

    return v0
.end method

.method public computeVerticalScrollRange(Landroid/support/v7/widget/RecyclerView$State;)I
    .registers 3
    .param p1, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .line 994
    invoke-direct {p0, p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->computeScrollRange(Landroid/support/v7/widget/RecyclerView$State;)I

    move-result v0

    return v0
.end method

.method public findFirstCompletelyVisibleItemPositions([I)[I
    .registers 5
    .param p1, "into"    # [I

    .line 858
    if-nez p1, :cond_7

    .line 859
    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    new-array p1, v0, [I

    goto :goto_c

    .line 860
    :cond_7
    array-length v0, p1

    iget v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    if-lt v0, v1, :cond_1f

    .line 864
    :goto_c
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_d
    iget v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    if-ge v0, v1, :cond_1e

    .line 865
    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    aget-object v1, v1, v0

    invoke-virtual {v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->findFirstCompletelyVisibleItemPosition()I

    move-result v1

    aput v1, p1, v0

    .line 864
    add-int/lit8 v0, v0, 0x1

    goto :goto_d

    .line 867
    .end local v0    # "i":I
    :cond_1e
    return-object p1

    .line 861
    :cond_1f
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Provided int[]\'s size must be more than or equal to span count. Expected:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", array size:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    array-length v2, p1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method findFirstVisibleItemClosestToEnd(ZZ)Landroid/view/View;
    .registers 10
    .param p1, "fullyVisible"    # Z
    .param p2, "acceptPartiallyVisible"    # Z

    .line 1221
    invoke-direct {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->ensureOrientationHelper()V

    .line 1222
    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v0}, Landroid/support/v7/widget/OrientationHelper;->getStartAfterPadding()I

    move-result v0

    .line 1223
    .local v0, "boundsStart":I
    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v1}, Landroid/support/v7/widget/OrientationHelper;->getEndAfterPadding()I

    move-result v1

    .line 1224
    .local v1, "boundsEnd":I
    const/4 v2, 0x0

    .line 1225
    .local v2, "partiallyVisible":Landroid/view/View;
    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getChildCount()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    .local v3, "i":I
    :goto_16
    if-ltz v3, :cond_3c

    .line 1226
    invoke-virtual {p0, v3}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    .line 1227
    .local v4, "child":Landroid/view/View;
    iget-object v5, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v5, v4}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedStart(Landroid/view/View;)I

    move-result v5

    .line 1228
    .local v5, "childStart":I
    iget-object v6, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v6, v4}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedEnd(Landroid/view/View;)I

    move-result v6

    .line 1229
    .local v6, "childEnd":I
    if-le v6, v0, :cond_39

    if-lt v5, v1, :cond_2d

    .line 1230
    goto :goto_39

    .line 1232
    :cond_2d
    if-le v6, v1, :cond_38

    if-nez p1, :cond_32

    goto :goto_38

    .line 1237
    :cond_32
    if-eqz p2, :cond_39

    if-nez v2, :cond_39

    .line 1238
    move-object v2, v4

    .end local v4    # "child":Landroid/view/View;
    .end local v5    # "childStart":I
    .end local v6    # "childEnd":I
    goto :goto_39

    .line 1235
    .restart local v4    # "child":Landroid/view/View;
    .restart local v5    # "childStart":I
    .restart local v6    # "childEnd":I
    :cond_38
    :goto_38
    return-object v4

    .line 1225
    .end local v4    # "child":Landroid/view/View;
    .end local v5    # "childStart":I
    .end local v6    # "childEnd":I
    :cond_39
    :goto_39
    add-int/lit8 v3, v3, -0x1

    goto :goto_16

    .line 1241
    .end local v3    # "i":I
    :cond_3c
    return-object v2
.end method

.method findFirstVisibleItemClosestToStart(ZZ)Landroid/view/View;
    .registers 11
    .param p1, "fullyVisible"    # Z
    .param p2, "acceptPartiallyVisible"    # Z

    .line 1190
    invoke-direct {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->ensureOrientationHelper()V

    .line 1191
    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v0}, Landroid/support/v7/widget/OrientationHelper;->getStartAfterPadding()I

    move-result v0

    .line 1192
    .local v0, "boundsStart":I
    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v1}, Landroid/support/v7/widget/OrientationHelper;->getEndAfterPadding()I

    move-result v1

    .line 1193
    .local v1, "boundsEnd":I
    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getChildCount()I

    move-result v2

    .line 1194
    .local v2, "limit":I
    const/4 v3, 0x0

    .line 1195
    .local v3, "partiallyVisible":Landroid/view/View;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_15
    if-ge v4, v2, :cond_3b

    .line 1196
    invoke-virtual {p0, v4}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    .line 1197
    .local v5, "child":Landroid/view/View;
    iget-object v6, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v6, v5}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedStart(Landroid/view/View;)I

    move-result v6

    .line 1198
    .local v6, "childStart":I
    iget-object v7, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v7, v5}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedEnd(Landroid/view/View;)I

    move-result v7

    .line 1199
    .local v7, "childEnd":I
    if-le v7, v0, :cond_38

    if-lt v6, v1, :cond_2c

    .line 1200
    goto :goto_38

    .line 1202
    :cond_2c
    if-ge v6, v0, :cond_37

    if-nez p1, :cond_31

    goto :goto_37

    .line 1207
    :cond_31
    if-eqz p2, :cond_38

    if-nez v3, :cond_38

    .line 1208
    move-object v3, v5

    .end local v5    # "child":Landroid/view/View;
    .end local v6    # "childStart":I
    .end local v7    # "childEnd":I
    goto :goto_38

    .line 1205
    .restart local v5    # "child":Landroid/view/View;
    .restart local v6    # "childStart":I
    .restart local v7    # "childEnd":I
    :cond_37
    :goto_37
    return-object v5

    .line 1195
    .end local v5    # "child":Landroid/view/View;
    .end local v6    # "childStart":I
    .end local v7    # "childEnd":I
    :cond_38
    :goto_38
    add-int/lit8 v4, v4, 0x1

    goto :goto_15

    .line 1211
    .end local v4    # "i":I
    :cond_3b
    return-object v3
.end method

.method findFirstVisibleItemPositionInt()I
    .registers 3

    .line 1160
    iget-boolean v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mShouldReverseLayout:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_a

    invoke-virtual {p0, v1, v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->findFirstVisibleItemClosestToEnd(ZZ)Landroid/view/View;

    move-result-object v0

    goto :goto_e

    :cond_a
    invoke-virtual {p0, v1, v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->findFirstVisibleItemClosestToStart(ZZ)Landroid/view/View;

    move-result-object v0

    .line 1162
    .local v0, "first":Landroid/view/View;
    :goto_e
    if-nez v0, :cond_12

    const/4 v1, -0x1

    goto :goto_16

    :cond_12
    invoke-virtual {p0, v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getPosition(Landroid/view/View;)I

    move-result v1

    :goto_16
    return v1
.end method

.method public findFirstVisibleItemPositions([I)[I
    .registers 5
    .param p1, "into"    # [I

    .line 826
    if-nez p1, :cond_7

    .line 827
    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    new-array p1, v0, [I

    goto :goto_c

    .line 828
    :cond_7
    array-length v0, p1

    iget v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    if-lt v0, v1, :cond_1f

    .line 832
    :goto_c
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_d
    iget v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    if-ge v0, v1, :cond_1e

    .line 833
    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    aget-object v1, v1, v0

    invoke-virtual {v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->findFirstVisibleItemPosition()I

    move-result v1

    aput v1, p1, v0

    .line 832
    add-int/lit8 v0, v0, 0x1

    goto :goto_d

    .line 835
    .end local v0    # "i":I
    :cond_1e
    return-object p1

    .line 829
    :cond_1f
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Provided int[]\'s size must be more than or equal to span count. Expected:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", array size:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    array-length v2, p1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public findLastCompletelyVisibleItemPositions([I)[I
    .registers 5
    .param p1, "into"    # [I

    .line 922
    if-nez p1, :cond_7

    .line 923
    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    new-array p1, v0, [I

    goto :goto_c

    .line 924
    :cond_7
    array-length v0, p1

    iget v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    if-lt v0, v1, :cond_1f

    .line 928
    :goto_c
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_d
    iget v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    if-ge v0, v1, :cond_1e

    .line 929
    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    aget-object v1, v1, v0

    invoke-virtual {v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->findLastCompletelyVisibleItemPosition()I

    move-result v1

    aput v1, p1, v0

    .line 928
    add-int/lit8 v0, v0, 0x1

    goto :goto_d

    .line 931
    .end local v0    # "i":I
    :cond_1e
    return-object p1

    .line 925
    :cond_1f
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Provided int[]\'s size must be more than or equal to span count. Expected:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", array size:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    array-length v2, p1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public findLastVisibleItemPositions([I)[I
    .registers 5
    .param p1, "into"    # [I

    .line 890
    if-nez p1, :cond_7

    .line 891
    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    new-array p1, v0, [I

    goto :goto_c

    .line 892
    :cond_7
    array-length v0, p1

    iget v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    if-lt v0, v1, :cond_1f

    .line 896
    :goto_c
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_d
    iget v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    if-ge v0, v1, :cond_1e

    .line 897
    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    aget-object v1, v1, v0

    invoke-virtual {v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->findLastVisibleItemPosition()I

    move-result v1

    aput v1, p1, v0

    .line 896
    add-int/lit8 v0, v0, 0x1

    goto :goto_d

    .line 899
    .end local v0    # "i":I
    :cond_1e
    return-object p1

    .line 893
    :cond_1f
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Provided int[]\'s size must be more than or equal to span count. Expected:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", array size:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    array-length v2, p1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public generateDefaultLayoutParams()Landroid/support/v7/widget/RecyclerView$LayoutParams;
    .registers 3

    .line 1990
    new-instance v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;

    const/4 v1, -0x2

    invoke-direct {v0, v1, v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;-><init>(II)V

    return-object v0
.end method

.method public generateLayoutParams(Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/support/v7/widget/RecyclerView$LayoutParams;
    .registers 4
    .param p1, "c"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .line 1996
    new-instance v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;

    invoke-direct {v0, p1, p2}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-object v0
.end method

.method public generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/support/v7/widget/RecyclerView$LayoutParams;
    .registers 4
    .param p1, "lp"    # Landroid/view/ViewGroup$LayoutParams;

    .line 2001
    instance-of v0, p1, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v0, :cond_d

    .line 2002
    new-instance v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;

    move-object v1, p1

    check-cast v1, Landroid/view/ViewGroup$MarginLayoutParams;

    invoke-direct {v0, v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;-><init>(Landroid/view/ViewGroup$MarginLayoutParams;)V

    return-object v0

    .line 2004
    :cond_d
    new-instance v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;

    invoke-direct {v0, p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    return-object v0
.end method

.method public getColumnCountForAccessibility(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;)I
    .registers 5
    .param p1, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;
    .param p2, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .line 1177
    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mOrientation:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_8

    .line 1178
    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    return v0

    .line 1180
    :cond_8
    invoke-super {p0, p1, p2}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->getColumnCountForAccessibility(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;)I

    move-result v0

    return v0
.end method

.method public getGapStrategy()I
    .registers 2

    .line 458
    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mGapStrategy:I

    return v0
.end method

.method public getOrientation()I
    .registers 2

    .line 2014
    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mOrientation:I

    return v0
.end method

.method public getReverseLayout()Z
    .registers 2

    .line 547
    iget-boolean v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mReverseLayout:Z

    return v0
.end method

.method public getRowCountForAccessibility(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;)I
    .registers 4
    .param p1, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;
    .param p2, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .line 1168
    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mOrientation:I

    if-nez v0, :cond_7

    .line 1169
    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    return v0

    .line 1171
    :cond_7
    invoke-super {p0, p1, p2}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->getRowCountForAccessibility(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;)I

    move-result v0

    return v0
.end method

.method public getSpanCount()I
    .registers 2

    .line 497
    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    return v0
.end method

.method hasGapsToFix()Landroid/view/View;
    .registers 18

    .line 300
    move-object/from16 v0, p0

    const/4 v1, 0x0

    .line 301
    .local v1, "startChildIndex":I
    invoke-virtual/range {p0 .. p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getChildCount()I

    move-result v2

    const/4 v3, 0x1

    sub-int/2addr v2, v3

    .line 302
    .local v2, "endChildIndex":I
    new-instance v4, Ljava/util/BitSet;

    iget v5, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    invoke-direct {v4, v5}, Ljava/util/BitSet;-><init>(I)V

    .line 303
    .local v4, "mSpansToCheck":Ljava/util/BitSet;
    iget v5, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    const/4 v6, 0x0

    invoke-virtual {v4, v6, v5, v3}, Ljava/util/BitSet;->set(IIZ)V

    .line 306
    iget v5, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mOrientation:I

    const/4 v7, -0x1

    if-ne v5, v3, :cond_23

    invoke-virtual/range {p0 .. p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->isLayoutRTL()Z

    move-result v5

    if-eqz v5, :cond_23

    move v5, v3

    goto :goto_24

    :cond_23
    move v5, v7

    .line 308
    .local v5, "preferredSpanDir":I
    :goto_24
    iget-boolean v8, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mShouldReverseLayout:Z

    if-eqz v8, :cond_2c

    .line 309
    move v8, v2

    .line 310
    .local v8, "firstChildIndex":I
    add-int/lit8 v9, v1, -0x1

    .local v9, "childLimit":I
    goto :goto_2f

    .line 312
    .end local v8    # "firstChildIndex":I
    .end local v9    # "childLimit":I
    :cond_2c
    move v8, v1

    .line 313
    .restart local v8    # "firstChildIndex":I
    add-int/lit8 v9, v2, 0x1

    .line 315
    .restart local v9    # "childLimit":I
    :goto_2f
    if-ge v8, v9, :cond_33

    move v7, v3

    nop

    .line 316
    .local v7, "nextChildDiff":I
    :cond_33
    move v10, v8

    .local v10, "i":I
    :goto_34
    if-eq v10, v9, :cond_b7

    .line 317
    invoke-virtual {v0, v10}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v11

    .line 318
    .local v11, "child":Landroid/view/View;
    invoke-virtual {v11}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v12

    check-cast v12, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;

    .line 319
    .local v12, "lp":Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;
    iget-object v13, v12, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->mSpan:Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    iget v13, v13, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mIndex:I

    invoke-virtual {v4, v13}, Ljava/util/BitSet;->get(I)Z

    move-result v13

    if-eqz v13, :cond_5a

    .line 320
    iget-object v13, v12, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->mSpan:Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    invoke-direct {v0, v13}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->checkSpanForGap(Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;)Z

    move-result v13

    if-eqz v13, :cond_53

    .line 321
    return-object v11

    .line 323
    :cond_53
    iget-object v13, v12, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->mSpan:Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    iget v13, v13, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mIndex:I

    invoke-virtual {v4, v13}, Ljava/util/BitSet;->clear(I)V

    .line 325
    :cond_5a
    iget-boolean v13, v12, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->mFullSpan:Z

    if-eqz v13, :cond_5f

    .line 326
    goto :goto_b2

    .line 329
    :cond_5f
    add-int v13, v10, v7

    if-eq v13, v9, :cond_b2

    .line 330
    add-int v13, v10, v7

    invoke-virtual {v0, v13}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v13

    .line 331
    .local v13, "nextChild":Landroid/view/View;
    const/4 v14, 0x0

    .line 332
    .local v14, "compareSpans":Z
    iget-boolean v15, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mShouldReverseLayout:Z

    if-eqz v15, :cond_82

    .line 334
    iget-object v15, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v15, v11}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedEnd(Landroid/view/View;)I

    move-result v15

    .line 335
    .local v15, "myEnd":I
    iget-object v3, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v3, v13}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedEnd(Landroid/view/View;)I

    move-result v3

    .line 336
    .local v3, "nextEnd":I
    if-ge v15, v3, :cond_7d

    .line 337
    return-object v11

    .line 338
    :cond_7d
    if-ne v15, v3, :cond_81

    .line 339
    const/4 v3, 0x1

    .line 341
    .end local v14    # "compareSpans":Z
    .end local v15    # "myEnd":I
    .local v3, "compareSpans":Z
    move v14, v3

    .end local v3    # "compareSpans":Z
    .restart local v14    # "compareSpans":Z
    :cond_81
    goto :goto_94

    .line 342
    :cond_82
    iget-object v3, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v3, v11}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedStart(Landroid/view/View;)I

    move-result v3

    .line 343
    .local v3, "myStart":I
    iget-object v15, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v15, v13}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedStart(Landroid/view/View;)I

    move-result v15

    .line 344
    .local v15, "nextStart":I
    if-le v3, v15, :cond_91

    .line 345
    return-object v11

    .line 346
    :cond_91
    if-ne v3, v15, :cond_94

    .line 347
    const/4 v14, 0x1

    .line 350
    .end local v3    # "myStart":I
    .end local v15    # "nextStart":I
    :cond_94
    :goto_94
    if-eqz v14, :cond_b2

    .line 352
    invoke-virtual {v13}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;

    .line 353
    .local v3, "nextLp":Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;
    iget-object v15, v12, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->mSpan:Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    iget v15, v15, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mIndex:I

    iget-object v6, v3, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->mSpan:Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    iget v6, v6, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mIndex:I

    sub-int/2addr v15, v6

    if-gez v15, :cond_a9

    const/4 v6, 0x1

    goto :goto_aa

    :cond_a9
    const/4 v6, 0x0

    :goto_aa
    if-gez v5, :cond_ae

    const/4 v15, 0x1

    goto :goto_af

    :cond_ae
    const/4 v15, 0x0

    :goto_af
    if-eq v6, v15, :cond_b2

    .line 354
    return-object v11

    .line 316
    .end local v3    # "nextLp":Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;
    .end local v11    # "child":Landroid/view/View;
    .end local v12    # "lp":Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;
    .end local v13    # "nextChild":Landroid/view/View;
    .end local v14    # "compareSpans":Z
    :cond_b2
    :goto_b2
    add-int/2addr v10, v7

    const/4 v3, 0x1

    const/4 v6, 0x0

    goto/16 :goto_34

    .line 360
    .end local v10    # "i":I
    :cond_b7
    const/4 v3, 0x0

    return-object v3
.end method

.method public invalidateSpanAssignments()V
    .registers 2

    .line 507
    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLazySpanLookup:Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;

    invoke-virtual {v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;->clear()V

    .line 508
    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->requestLayout()V

    .line 509
    return-void
.end method

.method isLayoutRTL()Z
    .registers 3

    .line 535
    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getLayoutDirection()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_8

    goto :goto_9

    :cond_8
    const/4 v1, 0x0

    :goto_9
    return v1
.end method

.method public offsetChildrenHorizontal(I)V
    .registers 4
    .param p1, "dx"    # I

    .line 1311
    invoke-super {p0, p1}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->offsetChildrenHorizontal(I)V

    .line 1312
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_4
    iget v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    if-ge v0, v1, :cond_12

    .line 1313
    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    aget-object v1, v1, v0

    invoke-virtual {v1, p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->onOffset(I)V

    .line 1312
    add-int/lit8 v0, v0, 0x1

    goto :goto_4

    .line 1315
    .end local v0    # "i":I
    :cond_12
    return-void
.end method

.method public offsetChildrenVertical(I)V
    .registers 4
    .param p1, "dy"    # I

    .line 1319
    invoke-super {p0, p1}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->offsetChildrenVertical(I)V

    .line 1320
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_4
    iget v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    if-ge v0, v1, :cond_12

    .line 1321
    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    aget-object v1, v1, v0

    invoke-virtual {v1, p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->onOffset(I)V

    .line 1320
    add-int/lit8 v0, v0, 0x1

    goto :goto_4

    .line 1323
    .end local v0    # "i":I
    :cond_12
    return-void
.end method

.method public onDetachedFromWindow(Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$Recycler;)V
    .registers 5
    .param p1, "view"    # Landroid/support/v7/widget/RecyclerView;
    .param p2, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;

    .line 288
    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mCheckForGapsRunnable:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 289
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_6
    iget v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    if-ge v0, v1, :cond_14

    .line 290
    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    aget-object v1, v1, v0

    invoke-virtual {v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->clear()V

    .line 289
    add-int/lit8 v0, v0, 0x1

    goto :goto_6

    .line 292
    .end local v0    # "i":I
    :cond_14
    return-void
.end method

.method public onInitializeAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V
    .registers 7
    .param p1, "event"    # Landroid/view/accessibility/AccessibilityEvent;

    .line 1133
    invoke-super {p0, p1}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->onInitializeAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V

    .line 1134
    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getChildCount()I

    move-result v0

    if-lez v0, :cond_35

    .line 1135
    invoke-static {p1}, Landroid/support/v4/view/accessibility/AccessibilityEventCompat;->asRecord(Landroid/view/accessibility/AccessibilityEvent;)Landroid/support/v4/view/accessibility/AccessibilityRecordCompat;

    move-result-object v0

    .line 1137
    .local v0, "record":Landroid/support/v4/view/accessibility/AccessibilityRecordCompat;
    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-virtual {p0, v2, v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->findFirstVisibleItemClosestToStart(ZZ)Landroid/view/View;

    move-result-object v3

    .line 1138
    .local v3, "start":Landroid/view/View;
    invoke-virtual {p0, v2, v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->findFirstVisibleItemClosestToEnd(ZZ)Landroid/view/View;

    move-result-object v1

    .line 1139
    .local v1, "end":Landroid/view/View;
    if-eqz v3, :cond_34

    if-nez v1, :cond_1c

    goto :goto_34

    .line 1142
    :cond_1c
    invoke-virtual {p0, v3}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getPosition(Landroid/view/View;)I

    move-result v2

    .line 1143
    .local v2, "startPos":I
    invoke-virtual {p0, v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getPosition(Landroid/view/View;)I

    move-result v4

    .line 1144
    .local v4, "endPos":I
    if-ge v2, v4, :cond_2d

    .line 1145
    invoke-virtual {v0, v2}, Landroid/support/v4/view/accessibility/AccessibilityRecordCompat;->setFromIndex(I)V

    .line 1146
    invoke-virtual {v0, v4}, Landroid/support/v4/view/accessibility/AccessibilityRecordCompat;->setToIndex(I)V

    goto :goto_35

    .line 1148
    :cond_2d
    invoke-virtual {v0, v4}, Landroid/support/v4/view/accessibility/AccessibilityRecordCompat;->setFromIndex(I)V

    .line 1149
    invoke-virtual {v0, v2}, Landroid/support/v4/view/accessibility/AccessibilityRecordCompat;->setToIndex(I)V

    .end local v0    # "record":Landroid/support/v4/view/accessibility/AccessibilityRecordCompat;
    .end local v1    # "end":Landroid/view/View;
    .end local v2    # "startPos":I
    .end local v3    # "start":Landroid/view/View;
    .end local v4    # "endPos":I
    goto :goto_35

    .line 1140
    .restart local v0    # "record":Landroid/support/v4/view/accessibility/AccessibilityRecordCompat;
    .restart local v1    # "end":Landroid/view/View;
    .restart local v3    # "start":Landroid/view/View;
    :cond_34
    :goto_34
    return-void

    .line 1152
    .end local v0    # "record":Landroid/support/v4/view/accessibility/AccessibilityRecordCompat;
    .end local v1    # "end":Landroid/view/View;
    .end local v3    # "start":Landroid/view/View;
    :cond_35
    :goto_35
    return-void
.end method

.method public onInitializeAccessibilityNodeInfoForItem(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;Landroid/view/View;Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;)V
    .registers 15
    .param p1, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;
    .param p2, "state"    # Landroid/support/v7/widget/RecyclerView$State;
    .param p3, "host"    # Landroid/view/View;
    .param p4, "info"    # Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;

    .line 1112
    invoke-virtual {p3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    .line 1113
    .local v0, "lp":Landroid/view/ViewGroup$LayoutParams;
    instance-of v1, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;

    if-nez v1, :cond_c

    .line 1114
    invoke-super {p0, p3, p4}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->onInitializeAccessibilityNodeInfoForItem(Landroid/view/View;Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;)V

    .line 1115
    return-void

    .line 1117
    :cond_c
    move-object v1, v0

    check-cast v1, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;

    .line 1118
    .local v1, "sglp":Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;
    iget v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mOrientation:I

    const/4 v3, 0x1

    if-nez v2, :cond_2e

    .line 1119
    invoke-virtual {v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->getSpanIndex()I

    move-result v4

    iget-boolean v2, v1, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->mFullSpan:Z

    if-eqz v2, :cond_20

    iget v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    :goto_1e
    move v5, v3

    goto :goto_21

    :cond_20
    goto :goto_1e

    :goto_21
    const/4 v6, -0x1

    const/4 v7, -0x1

    iget-boolean v8, v1, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->mFullSpan:Z

    const/4 v9, 0x0

    invoke-static/range {v4 .. v9}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$CollectionItemInfoCompat;->obtain(IIIIZZ)Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$CollectionItemInfoCompat;

    move-result-object v2

    invoke-virtual {p4, v2}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->setCollectionItemInfo(Ljava/lang/Object;)V

    goto :goto_48

    .line 1124
    :cond_2e
    const/4 v2, -0x1

    const/4 v4, -0x1

    invoke-virtual {v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->getSpanIndex()I

    move-result v5

    iget-boolean v6, v1, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->mFullSpan:Z

    if-eqz v6, :cond_3c

    iget v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    :goto_3a
    move v6, v3

    goto :goto_3d

    :cond_3c
    goto :goto_3a

    :goto_3d
    iget-boolean v7, v1, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->mFullSpan:Z

    const/4 v8, 0x0

    move v3, v2

    invoke-static/range {v3 .. v8}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$CollectionItemInfoCompat;->obtain(IIIIZZ)Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$CollectionItemInfoCompat;

    move-result-object v2

    invoke-virtual {p4, v2}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->setCollectionItemInfo(Ljava/lang/Object;)V

    .line 1129
    :goto_48
    return-void
.end method

.method public onItemsAdded(Landroid/support/v7/widget/RecyclerView;II)V
    .registers 5
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;
    .param p2, "positionStart"    # I
    .param p3, "itemCount"    # I

    .line 1332
    const/4 v0, 0x0

    invoke-direct {p0, p2, p3, v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->handleUpdate(III)V

    .line 1333
    return-void
.end method

.method public onItemsChanged(Landroid/support/v7/widget/RecyclerView;)V
    .registers 3
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;

    .line 1337
    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLazySpanLookup:Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;

    invoke-virtual {v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;->clear()V

    .line 1338
    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->requestLayout()V

    .line 1339
    return-void
.end method

.method public onItemsMoved(Landroid/support/v7/widget/RecyclerView;III)V
    .registers 6
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;
    .param p2, "from"    # I
    .param p3, "to"    # I
    .param p4, "itemCount"    # I

    .line 1343
    const/4 v0, 0x3

    invoke-direct {p0, p2, p3, v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->handleUpdate(III)V

    .line 1344
    return-void
.end method

.method public onItemsRemoved(Landroid/support/v7/widget/RecyclerView;II)V
    .registers 5
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;
    .param p2, "positionStart"    # I
    .param p3, "itemCount"    # I

    .line 1327
    const/4 v0, 0x1

    invoke-direct {p0, p2, p3, v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->handleUpdate(III)V

    .line 1328
    return-void
.end method

.method public onItemsUpdated(Landroid/support/v7/widget/RecyclerView;IILjava/lang/Object;)V
    .registers 6
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;
    .param p2, "positionStart"    # I
    .param p3, "itemCount"    # I
    .param p4, "payload"    # Ljava/lang/Object;

    .line 1349
    const/4 v0, 0x2

    invoke-direct {p0, p2, p3, v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->handleUpdate(III)V

    .line 1350
    return-void
.end method

.method public onLayoutChildren(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;)V
    .registers 12
    .param p1, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;
    .param p2, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .line 551
    invoke-direct {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->ensureOrientationHelper()V

    .line 552
    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mAnchorInfo:Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;

    .line 553
    .local v0, "anchorInfo":Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;
    invoke-virtual {v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->reset()V

    .line 555
    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    const/4 v2, -0x1

    if-nez v1, :cond_11

    iget v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingScrollPosition:I

    if-eq v1, v2, :cond_1b

    .line 556
    :cond_11
    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView$State;->getItemCount()I

    move-result v1

    if-nez v1, :cond_1b

    .line 557
    invoke-virtual {p0, p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->removeAndRecycleAllViews(Landroid/support/v7/widget/RecyclerView$Recycler;)V

    .line 558
    return-void

    .line 562
    :cond_1b
    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    if-eqz v1, :cond_23

    .line 563
    invoke-direct {p0, v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->applyPendingSavedState(Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;)V

    goto :goto_2a

    .line 565
    :cond_23
    invoke-direct {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->resolveShouldLayoutReverse()V

    .line 566
    iget-boolean v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mShouldReverseLayout:Z

    iput-boolean v1, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->mLayoutFromEnd:Z

    .line 569
    :goto_2a
    invoke-virtual {p0, p2, v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->updateAnchorInfoForLayout(Landroid/support/v7/widget/RecyclerView$State;Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;)V

    .line 571
    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    const/4 v3, 0x1

    if-nez v1, :cond_47

    .line 572
    iget-boolean v1, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->mLayoutFromEnd:Z

    iget-boolean v4, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLastLayoutFromEnd:Z

    if-ne v1, v4, :cond_40

    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->isLayoutRTL()Z

    move-result v1

    iget-boolean v4, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLastLayoutRTL:Z

    if-eq v1, v4, :cond_47

    .line 574
    :cond_40
    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLazySpanLookup:Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;

    invoke-virtual {v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;->clear()V

    .line 575
    iput-boolean v3, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->mInvalidateOffsets:Z

    .line 579
    :cond_47
    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getChildCount()I

    move-result v1

    const/high16 v4, -0x80000000

    const/4 v5, 0x0

    if-lez v1, :cond_8d

    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    if-eqz v1, :cond_5a

    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    iget v1, v1, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->mSpanOffsetsSize:I

    if-ge v1, v3, :cond_8d

    .line 581
    :cond_5a
    iget-boolean v1, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->mInvalidateOffsets:Z

    if-eqz v1, :cond_7a

    .line 582
    move v1, v5

    .local v1, "i":I
    :goto_5f
    iget v6, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    if-ge v1, v6, :cond_8d

    .line 584
    iget-object v6, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    aget-object v6, v6, v1

    invoke-virtual {v6}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->clear()V

    .line 585
    iget v6, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->mOffset:I

    if-eq v6, v4, :cond_77

    .line 586
    iget-object v6, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    aget-object v6, v6, v1

    iget v7, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->mOffset:I

    invoke-virtual {v6, v7}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->setLine(I)V

    .line 582
    :cond_77
    add-int/lit8 v1, v1, 0x1

    goto :goto_5f

    .line 590
    .end local v1    # "i":I
    :cond_7a
    move v1, v5

    .restart local v1    # "i":I
    :goto_7b
    iget v6, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    if-ge v1, v6, :cond_8d

    .line 591
    iget-object v6, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    aget-object v6, v6, v1

    iget-boolean v7, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mShouldReverseLayout:Z

    iget v8, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->mOffset:I

    invoke-virtual {v6, v7, v8}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->cacheReferenceLineAndClear(ZI)V

    .line 590
    add-int/lit8 v1, v1, 0x1

    goto :goto_7b

    .line 595
    .end local v1    # "i":I
    :cond_8d
    invoke-virtual {p0, p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->detachAndScrapAttachedViews(Landroid/support/v7/widget/RecyclerView$Recycler;)V

    .line 596
    iput-boolean v5, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLaidOutInvalidFullSpan:Z

    .line 597
    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->updateMeasureSpecs()V

    .line 598
    iget v1, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->mPosition:I

    invoke-direct {p0, v1, p2}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->updateLayoutState(ILandroid/support/v7/widget/RecyclerView$State;)V

    .line 599
    iget-boolean v1, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->mLayoutFromEnd:Z

    if-eqz v1, :cond_ba

    .line 601
    invoke-direct {p0, v2}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->setLayoutStateDirection(I)V

    .line 602
    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLayoutState:Landroid/support/v7/widget/LayoutState;

    invoke-direct {p0, p1, v1, p2}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->fill(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/LayoutState;Landroid/support/v7/widget/RecyclerView$State;)I

    .line 604
    invoke-direct {p0, v3}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->setLayoutStateDirection(I)V

    .line 605
    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLayoutState:Landroid/support/v7/widget/LayoutState;

    iget v6, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->mPosition:I

    iget-object v7, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLayoutState:Landroid/support/v7/widget/LayoutState;

    iget v7, v7, Landroid/support/v7/widget/LayoutState;->mItemDirection:I

    add-int/2addr v6, v7

    iput v6, v1, Landroid/support/v7/widget/LayoutState;->mCurrentPosition:I

    .line 606
    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLayoutState:Landroid/support/v7/widget/LayoutState;

    invoke-direct {p0, p1, v1, p2}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->fill(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/LayoutState;Landroid/support/v7/widget/RecyclerView$State;)I

    goto :goto_d5

    .line 609
    :cond_ba
    invoke-direct {p0, v3}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->setLayoutStateDirection(I)V

    .line 610
    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLayoutState:Landroid/support/v7/widget/LayoutState;

    invoke-direct {p0, p1, v1, p2}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->fill(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/LayoutState;Landroid/support/v7/widget/RecyclerView$State;)I

    .line 612
    invoke-direct {p0, v2}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->setLayoutStateDirection(I)V

    .line 613
    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLayoutState:Landroid/support/v7/widget/LayoutState;

    iget v6, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->mPosition:I

    iget-object v7, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLayoutState:Landroid/support/v7/widget/LayoutState;

    iget v7, v7, Landroid/support/v7/widget/LayoutState;->mItemDirection:I

    add-int/2addr v6, v7

    iput v6, v1, Landroid/support/v7/widget/LayoutState;->mCurrentPosition:I

    .line 614
    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLayoutState:Landroid/support/v7/widget/LayoutState;

    invoke-direct {p0, p1, v1, p2}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->fill(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/LayoutState;Landroid/support/v7/widget/RecyclerView$State;)I

    .line 617
    :goto_d5
    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getChildCount()I

    move-result v1

    if-lez v1, :cond_ec

    .line 618
    iget-boolean v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mShouldReverseLayout:Z

    if-eqz v1, :cond_e6

    .line 619
    invoke-direct {p0, p1, p2, v3}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->fixEndGap(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;Z)V

    .line 620
    invoke-direct {p0, p1, p2, v5}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->fixStartGap(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;Z)V

    goto :goto_ec

    .line 622
    :cond_e6
    invoke-direct {p0, p1, p2, v3}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->fixStartGap(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;Z)V

    .line 623
    invoke-direct {p0, p1, p2, v5}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->fixEndGap(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;Z)V

    .line 627
    :cond_ec
    :goto_ec
    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView$State;->isPreLayout()Z

    move-result v1

    if-nez v1, :cond_119

    .line 628
    iget v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mGapStrategy:I

    if-eqz v1, :cond_107

    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getChildCount()I

    move-result v1

    if-lez v1, :cond_107

    iget-boolean v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLaidOutInvalidFullSpan:Z

    if-nez v1, :cond_106

    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->hasGapsToFix()Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_107

    :cond_106
    goto :goto_108

    :cond_107
    move v3, v5

    :goto_108
    move v1, v3

    .line 631
    .local v1, "needToCheckForGaps":Z
    if-eqz v1, :cond_115

    .line 632
    iget-object v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mCheckForGapsRunnable:Ljava/lang/Runnable;

    invoke-virtual {p0, v3}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 633
    iget-object v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mCheckForGapsRunnable:Ljava/lang/Runnable;

    invoke-virtual {p0, v3}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->postOnAnimation(Ljava/lang/Runnable;)V

    .line 635
    :cond_115
    iput v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingScrollPosition:I

    .line 636
    iput v4, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingScrollPositionOffset:I

    .line 638
    .end local v1    # "needToCheckForGaps":Z
    :cond_119
    iget-boolean v1, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->mLayoutFromEnd:Z

    iput-boolean v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLastLayoutFromEnd:Z

    .line 639
    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->isLayoutRTL()Z

    move-result v1

    iput-boolean v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLastLayoutRTL:Z

    .line 640
    const/4 v1, 0x0

    iput-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    .line 641
    return-void
.end method

.method public onRestoreInstanceState(Landroid/os/Parcelable;)V
    .registers 3
    .param p1, "state"    # Landroid/os/Parcelable;

    .line 1050
    instance-of v0, p1, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    if-eqz v0, :cond_c

    .line 1051
    move-object v0, p1

    check-cast v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    iput-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    .line 1052
    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->requestLayout()V

    .line 1056
    :cond_c
    return-void
.end method

.method public onSaveInstanceState()Landroid/os/Parcelable;
    .registers 5

    .line 1060
    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    if-eqz v0, :cond_c

    .line 1061
    new-instance v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    invoke-direct {v0, v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;-><init>(Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;)V

    return-object v0

    .line 1063
    :cond_c
    new-instance v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    invoke-direct {v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;-><init>()V

    .line 1064
    .local v0, "state":Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;
    iget-boolean v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mReverseLayout:Z

    iput-boolean v1, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->mReverseLayout:Z

    .line 1065
    iget-boolean v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLastLayoutFromEnd:Z

    iput-boolean v1, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->mAnchorLayoutFromEnd:Z

    .line 1066
    iget-boolean v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLastLayoutRTL:Z

    iput-boolean v1, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->mLastLayoutRTL:Z

    .line 1068
    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLazySpanLookup:Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;

    const/4 v2, 0x0

    if-eqz v1, :cond_3a

    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLazySpanLookup:Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;

    iget-object v1, v1, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;->mData:[I

    if-eqz v1, :cond_3a

    .line 1069
    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLazySpanLookup:Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;

    iget-object v1, v1, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;->mData:[I

    iput-object v1, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->mSpanLookup:[I

    .line 1070
    iget-object v1, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->mSpanLookup:[I

    array-length v1, v1

    iput v1, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->mSpanLookupSize:I

    .line 1071
    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLazySpanLookup:Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;

    iget-object v1, v1, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;->mFullSpanItems:Ljava/util/List;

    iput-object v1, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->mFullSpanItems:Ljava/util/List;

    goto :goto_3c

    .line 1073
    :cond_3a
    iput v2, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->mSpanLookupSize:I

    .line 1076
    :goto_3c
    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getChildCount()I

    move-result v1

    if-lez v1, :cond_9a

    .line 1077
    invoke-direct {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->ensureOrientationHelper()V

    .line 1078
    iget-boolean v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLastLayoutFromEnd:Z

    if-eqz v1, :cond_4e

    invoke-direct {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getLastChildPosition()I

    move-result v1

    goto :goto_52

    :cond_4e
    invoke-direct {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getFirstChildPosition()I

    move-result v1

    :goto_52
    iput v1, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->mAnchorPosition:I

    .line 1080
    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->findFirstVisibleItemPositionInt()I

    move-result v1

    iput v1, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->mVisibleAnchorPosition:I

    .line 1081
    iget v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    iput v1, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->mSpanOffsetsSize:I

    .line 1082
    iget v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    new-array v1, v1, [I

    iput-object v1, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->mSpanOffsets:[I

    .line 1083
    nop

    .local v2, "i":I
    :goto_65
    move v1, v2

    .end local v2    # "i":I
    .local v1, "i":I
    iget v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    if-ge v1, v2, :cond_a1

    .line 1085
    iget-boolean v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLastLayoutFromEnd:Z

    const/high16 v3, -0x80000000

    if-eqz v2, :cond_82

    .line 1086
    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    aget-object v2, v2, v1

    invoke-virtual {v2, v3}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->getEndLine(I)I

    move-result v2

    .line 1087
    .local v2, "line":I
    if-eq v2, v3, :cond_93

    .line 1088
    iget-object v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v3}, Landroid/support/v7/widget/OrientationHelper;->getEndAfterPadding()I

    move-result v3

    sub-int/2addr v2, v3

    goto :goto_93

    .line 1091
    .end local v2    # "line":I
    :cond_82
    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    aget-object v2, v2, v1

    invoke-virtual {v2, v3}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->getStartLine(I)I

    move-result v2

    .line 1092
    .restart local v2    # "line":I
    if-eq v2, v3, :cond_93

    .line 1093
    iget-object v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v3}, Landroid/support/v7/widget/OrientationHelper;->getStartAfterPadding()I

    move-result v3

    sub-int/2addr v2, v3

    .line 1096
    :cond_93
    :goto_93
    iget-object v3, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->mSpanOffsets:[I

    aput v2, v3, v1

    .line 1083
    .end local v2    # "line":I
    add-int/lit8 v2, v1, 0x1

    .end local v1    # "i":I
    .local v2, "i":I
    goto :goto_65

    .line 1099
    .end local v2    # "i":I
    :cond_9a
    const/4 v1, -0x1

    iput v1, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->mAnchorPosition:I

    .line 1100
    iput v1, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->mVisibleAnchorPosition:I

    .line 1101
    iput v2, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->mSpanOffsetsSize:I

    .line 1106
    :cond_a1
    return-object v0
.end method

.method public onScrollStateChanged(I)V
    .registers 2
    .param p1, "state"    # I

    .line 281
    if-nez p1, :cond_5

    .line 282
    invoke-direct {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->checkForGaps()Z

    .line 284
    :cond_5
    return-void
.end method

.method scrollBy(ILandroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;)I
    .registers 11
    .param p1, "dt"    # I
    .param p2, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;
    .param p3, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .line 1911
    invoke-direct {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->ensureOrientationHelper()V

    .line 1914
    if-lez p1, :cond_b

    .line 1915
    const/4 v0, 0x1

    .line 1916
    .local v0, "layoutDir":I
    invoke-direct {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getLastChildPosition()I

    move-result v1

    .local v1, "referenceChildPosition":I
    goto :goto_10

    .line 1918
    .end local v0    # "layoutDir":I
    .end local v1    # "referenceChildPosition":I
    :cond_b
    const/4 v0, -0x1

    .line 1919
    .restart local v0    # "layoutDir":I
    invoke-direct {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getFirstChildPosition()I

    move-result v1

    .line 1921
    .restart local v1    # "referenceChildPosition":I
    :goto_10
    invoke-direct {p0, v1, p3}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->updateLayoutState(ILandroid/support/v7/widget/RecyclerView$State;)V

    .line 1922
    invoke-direct {p0, v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->setLayoutStateDirection(I)V

    .line 1923
    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLayoutState:Landroid/support/v7/widget/LayoutState;

    iget-object v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLayoutState:Landroid/support/v7/widget/LayoutState;

    iget v3, v3, Landroid/support/v7/widget/LayoutState;->mItemDirection:I

    add-int/2addr v3, v1

    iput v3, v2, Landroid/support/v7/widget/LayoutState;->mCurrentPosition:I

    .line 1924
    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    move-result v2

    .line 1925
    .local v2, "absDt":I
    iget-object v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLayoutState:Landroid/support/v7/widget/LayoutState;

    iput v2, v3, Landroid/support/v7/widget/LayoutState;->mAvailable:I

    .line 1926
    iget-object v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLayoutState:Landroid/support/v7/widget/LayoutState;

    invoke-direct {p0, p2, v3, p3}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->fill(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/LayoutState;Landroid/support/v7/widget/RecyclerView$State;)I

    move-result v3

    .line 1928
    .local v3, "consumed":I
    if-ge v2, v3, :cond_31

    .line 1929
    move v4, p1

    .local v4, "totalScroll":I
    :goto_30
    goto :goto_36

    .line 1930
    .end local v4    # "totalScroll":I
    :cond_31
    if-gez p1, :cond_35

    .line 1931
    neg-int v4, v3

    goto :goto_30

    .line 1933
    :cond_35
    move v4, v3

    .line 1939
    .restart local v4    # "totalScroll":I
    :goto_36
    iget-object v5, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    neg-int v6, v4

    invoke-virtual {v5, v6}, Landroid/support/v7/widget/OrientationHelper;->offsetChildren(I)V

    .line 1941
    iget-boolean v5, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mShouldReverseLayout:Z

    iput-boolean v5, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLastLayoutFromEnd:Z

    .line 1942
    return v4
.end method

.method public scrollHorizontallyBy(ILandroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;)I
    .registers 5
    .param p1, "dx"    # I
    .param p2, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;
    .param p3, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .line 1840
    invoke-virtual {p0, p1, p2, p3}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->scrollBy(ILandroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;)I

    move-result v0

    return v0
.end method

.method public scrollToPosition(I)V
    .registers 3
    .param p1, "position"    # I

    .line 1880
    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    if-eqz v0, :cond_f

    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    iget v0, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->mAnchorPosition:I

    if-eq v0, p1, :cond_f

    .line 1881
    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    invoke-virtual {v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->invalidateAnchorPositionInfo()V

    .line 1883
    :cond_f
    iput p1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingScrollPosition:I

    .line 1884
    const/high16 v0, -0x80000000

    iput v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingScrollPositionOffset:I

    .line 1885
    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->requestLayout()V

    .line 1886
    return-void
.end method

.method public scrollToPositionWithOffset(II)V
    .registers 4
    .param p1, "position"    # I
    .param p2, "offset"    # I

    .line 1902
    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    if-eqz v0, :cond_9

    .line 1903
    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    invoke-virtual {v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->invalidateAnchorPositionInfo()V

    .line 1905
    :cond_9
    iput p1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingScrollPosition:I

    .line 1906
    iput p2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingScrollPositionOffset:I

    .line 1907
    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->requestLayout()V

    .line 1908
    return-void
.end method

.method public scrollVerticallyBy(ILandroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;)I
    .registers 5
    .param p1, "dy"    # I
    .param p2, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;
    .param p3, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .line 1846
    invoke-virtual {p0, p1, p2, p3}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->scrollBy(ILandroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;)I

    move-result v0

    return v0
.end method

.method public setGapStrategy(I)V
    .registers 4
    .param p1, "gapStrategy"    # I

    .line 471
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->assertNotInLayoutOrScroll(Ljava/lang/String;)V

    .line 472
    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mGapStrategy:I

    if-ne p1, v0, :cond_9

    .line 473
    return-void

    .line 475
    :cond_9
    if-eqz p1, :cond_17

    const/4 v0, 0x2

    if-ne p1, v0, :cond_f

    goto :goto_17

    .line 477
    :cond_f
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "invalid gap strategy. Must be GAP_HANDLING_NONE or GAP_HANDLING_MOVE_ITEMS_BETWEEN_SPANS"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 480
    :cond_17
    :goto_17
    iput p1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mGapStrategy:I

    .line 481
    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->requestLayout()V

    .line 482
    return-void
.end method

.method public setOrientation(I)V
    .registers 4
    .param p1, "orientation"    # I

    .line 404
    if-eqz p1, :cond_e

    const/4 v0, 0x1

    if-ne p1, v0, :cond_6

    goto :goto_e

    .line 405
    :cond_6
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "invalid orientation."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 407
    :cond_e
    :goto_e
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->assertNotInLayoutOrScroll(Ljava/lang/String;)V

    .line 408
    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mOrientation:I

    if-ne p1, v0, :cond_17

    .line 409
    return-void

    .line 411
    :cond_17
    iput p1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mOrientation:I

    .line 412
    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    if-eqz v0, :cond_29

    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSecondaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    if-eqz v0, :cond_29

    .line 414
    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    .line 415
    .local v0, "tmp":Landroid/support/v7/widget/OrientationHelper;
    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSecondaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    iput-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    .line 416
    iput-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSecondaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    .line 418
    .end local v0    # "tmp":Landroid/support/v7/widget/OrientationHelper;
    :cond_29
    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->requestLayout()V

    .line 419
    return-void
.end method

.method public setReverseLayout(Z)V
    .registers 3
    .param p1, "reverseLayout"    # Z

    .line 435
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->assertNotInLayoutOrScroll(Ljava/lang/String;)V

    .line 436
    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    if-eqz v0, :cond_12

    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    iget-boolean v0, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->mReverseLayout:Z

    if-eq v0, p1, :cond_12

    .line 437
    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    iput-boolean p1, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->mReverseLayout:Z

    .line 439
    :cond_12
    iput-boolean p1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mReverseLayout:Z

    .line 440
    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->requestLayout()V

    .line 441
    return-void
.end method

.method public setSpanCount(I)V
    .registers 6
    .param p1, "spanCount"    # I

    .line 384
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->assertNotInLayoutOrScroll(Ljava/lang/String;)V

    .line 385
    iget v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    if-eq p1, v1, :cond_30

    .line 386
    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->invalidateSpanAssignments()V

    .line 387
    iput p1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    .line 388
    new-instance v1, Ljava/util/BitSet;

    iget v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    invoke-direct {v1, v2}, Ljava/util/BitSet;-><init>(I)V

    iput-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mRemainingSpans:Ljava/util/BitSet;

    .line 389
    iget v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    new-array v1, v1, [Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    iput-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    .line 390
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1d
    iget v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    if-ge v1, v2, :cond_2d

    .line 391
    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    new-instance v3, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    invoke-direct {v3, p0, v1, v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;-><init>(Landroid/support/v7/widget/StaggeredGridLayoutManager;ILandroid/support/v7/widget/StaggeredGridLayoutManager$1;)V

    aput-object v3, v2, v1

    .line 390
    add-int/lit8 v1, v1, 0x1

    goto :goto_1d

    .line 393
    .end local v1    # "i":I
    :cond_2d
    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->requestLayout()V

    .line 395
    :cond_30
    return-void
.end method

.method public smoothScrollToPosition(Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$State;I)V
    .registers 6
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;
    .param p2, "state"    # Landroid/support/v7/widget/RecyclerView$State;
    .param p3, "position"    # I

    .line 1860
    new-instance v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$2;

    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$2;-><init>(Landroid/support/v7/widget/StaggeredGridLayoutManager;Landroid/content/Context;)V

    .line 1874
    .local v0, "scroller":Landroid/support/v7/widget/LinearSmoothScroller;
    invoke-virtual {v0, p3}, Landroid/support/v7/widget/LinearSmoothScroller;->setTargetPosition(I)V

    .line 1875
    invoke-virtual {p0, v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->startSmoothScroll(Landroid/support/v7/widget/RecyclerView$SmoothScroller;)V

    .line 1876
    return-void
.end method

.method public supportsPredictiveItemAnimations()Z
    .registers 2

    .line 803
    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    if-nez v0, :cond_6

    const/4 v0, 0x1

    goto :goto_7

    :cond_6
    const/4 v0, 0x0

    :goto_7
    return v0
.end method

.method updateAnchorFromPendingData(Landroid/support/v7/widget/RecyclerView$State;Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;)Z
    .registers 10
    .param p1, "state"    # Landroid/support/v7/widget/RecyclerView$State;
    .param p2, "anchorInfo"    # Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;

    .line 710
    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView$State;->isPreLayout()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_ef

    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingScrollPosition:I

    const/4 v2, -0x1

    if-ne v0, v2, :cond_e

    goto/16 :goto_ef

    .line 714
    :cond_e
    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingScrollPosition:I

    const/high16 v3, -0x80000000

    if-ltz v0, :cond_ea

    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingScrollPosition:I

    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView$State;->getItemCount()I

    move-result v4

    if-lt v0, v4, :cond_1e

    goto/16 :goto_ea

    .line 720
    :cond_1e
    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    const/4 v4, 0x1

    if-eqz v0, :cond_38

    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    iget v0, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->mAnchorPosition:I

    if-eq v0, v2, :cond_38

    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    iget v0, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->mSpanOffsetsSize:I

    if-ge v0, v4, :cond_30

    goto :goto_38

    .line 782
    :cond_30
    iput v3, p2, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->mOffset:I

    .line 783
    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingScrollPosition:I

    iput v0, p2, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->mPosition:I

    goto/16 :goto_e9

    .line 723
    :cond_38
    :goto_38
    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingScrollPosition:I

    invoke-virtual {p0, v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->findViewByPosition(I)Landroid/view/View;

    move-result-object v0

    .line 724
    .local v0, "child":Landroid/view/View;
    if-eqz v0, :cond_c9

    .line 727
    iget-boolean v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mShouldReverseLayout:Z

    if-eqz v1, :cond_49

    invoke-direct {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getLastChildPosition()I

    move-result v1

    goto :goto_4d

    :cond_49
    invoke-direct {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getFirstChildPosition()I

    move-result v1

    :goto_4d
    iput v1, p2, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->mPosition:I

    .line 730
    iget v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingScrollPositionOffset:I

    if-eq v1, v3, :cond_7f

    .line 731
    iget-boolean v1, p2, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->mLayoutFromEnd:Z

    if-eqz v1, :cond_6b

    .line 732
    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v1}, Landroid/support/v7/widget/OrientationHelper;->getEndAfterPadding()I

    move-result v1

    iget v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingScrollPositionOffset:I

    sub-int/2addr v1, v2

    .line 734
    .local v1, "target":I
    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v2, v0}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedEnd(Landroid/view/View;)I

    move-result v2

    sub-int v2, v1, v2

    iput v2, p2, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->mOffset:I

    .line 735
    .end local v1    # "target":I
    goto :goto_7e

    .line 736
    :cond_6b
    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v1}, Landroid/support/v7/widget/OrientationHelper;->getStartAfterPadding()I

    move-result v1

    iget v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingScrollPositionOffset:I

    add-int/2addr v1, v2

    .line 738
    .restart local v1    # "target":I
    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v2, v0}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedStart(Landroid/view/View;)I

    move-result v2

    sub-int v2, v1, v2

    iput v2, p2, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->mOffset:I

    .line 740
    .end local v1    # "target":I
    :goto_7e
    return v4

    .line 744
    :cond_7f
    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v1, v0}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedMeasurement(Landroid/view/View;)I

    move-result v1

    .line 745
    .local v1, "childSize":I
    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v2}, Landroid/support/v7/widget/OrientationHelper;->getTotalSpace()I

    move-result v2

    if-le v1, v2, :cond_a1

    .line 747
    iget-boolean v2, p2, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->mLayoutFromEnd:Z

    if-eqz v2, :cond_98

    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v2}, Landroid/support/v7/widget/OrientationHelper;->getEndAfterPadding()I

    move-result v2

    goto :goto_9e

    :cond_98
    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v2}, Landroid/support/v7/widget/OrientationHelper;->getStartAfterPadding()I

    move-result v2

    :goto_9e
    iput v2, p2, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->mOffset:I

    .line 750
    return v4

    .line 753
    :cond_a1
    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v2, v0}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedStart(Landroid/view/View;)I

    move-result v2

    iget-object v5, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v5}, Landroid/support/v7/widget/OrientationHelper;->getStartAfterPadding()I

    move-result v5

    sub-int/2addr v2, v5

    .line 755
    .local v2, "startGap":I
    if-gez v2, :cond_b4

    .line 756
    neg-int v3, v2

    iput v3, p2, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->mOffset:I

    .line 757
    return v4

    .line 759
    :cond_b4
    iget-object v5, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v5}, Landroid/support/v7/widget/OrientationHelper;->getEndAfterPadding()I

    move-result v5

    iget-object v6, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v6, v0}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedEnd(Landroid/view/View;)I

    move-result v6

    sub-int/2addr v5, v6

    .line 761
    .local v5, "endGap":I
    if-gez v5, :cond_c6

    .line 762
    iput v5, p2, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->mOffset:I

    .line 763
    return v4

    .line 766
    :cond_c6
    iput v3, p2, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->mOffset:I

    .line 767
    .end local v1    # "childSize":I
    .end local v2    # "startGap":I
    .end local v5    # "endGap":I
    goto :goto_e8

    .line 770
    :cond_c9
    iget v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingScrollPosition:I

    iput v2, p2, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->mPosition:I

    .line 771
    iget v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingScrollPositionOffset:I

    if-ne v2, v3, :cond_e1

    .line 772
    iget v2, p2, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->mPosition:I

    invoke-direct {p0, v2}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->calculateScrollDirectionForPosition(I)I

    move-result v2

    .line 774
    .local v2, "position":I
    if-ne v2, v4, :cond_db

    move v1, v4

    nop

    :cond_db
    iput-boolean v1, p2, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->mLayoutFromEnd:Z

    .line 775
    invoke-virtual {p2}, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->assignCoordinateFromPadding()V

    .line 776
    .end local v2    # "position":I
    goto :goto_e6

    .line 777
    :cond_e1
    iget v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingScrollPositionOffset:I

    invoke-virtual {p2, v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->assignCoordinateFromPadding(I)V

    .line 779
    :goto_e6
    iput-boolean v4, p2, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->mInvalidateOffsets:Z

    .line 781
    .end local v0    # "child":Landroid/view/View;
    :goto_e8
    nop

    .line 785
    :goto_e9
    return v4

    .line 715
    :cond_ea
    :goto_ea
    iput v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingScrollPosition:I

    .line 716
    iput v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingScrollPositionOffset:I

    .line 717
    return v1

    .line 711
    :cond_ef
    :goto_ef
    return v1
.end method

.method updateAnchorInfoForLayout(Landroid/support/v7/widget/RecyclerView$State;Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;)V
    .registers 4
    .param p1, "state"    # Landroid/support/v7/widget/RecyclerView$State;
    .param p2, "anchorInfo"    # Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;

    .line 683
    invoke-virtual {p0, p1, p2}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->updateAnchorFromPendingData(Landroid/support/v7/widget/RecyclerView$State;Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 684
    return-void

    .line 686
    :cond_7
    invoke-direct {p0, p1, p2}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->updateAnchorFromChildren(Landroid/support/v7/widget/RecyclerView$State;Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;)Z

    move-result v0

    if-eqz v0, :cond_e

    .line 687
    return-void

    .line 692
    :cond_e
    invoke-virtual {p2}, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->assignCoordinateFromPadding()V

    .line 693
    const/4 v0, 0x0

    iput v0, p2, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->mPosition:I

    .line 694
    return-void
.end method

.method updateMeasureSpecs()V
    .registers 5

    .line 789
    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSecondaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v0}, Landroid/support/v7/widget/OrientationHelper;->getTotalSpace()I

    move-result v0

    iget v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    div-int/2addr v0, v1

    iput v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSizePerSpan:I

    .line 790
    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSecondaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v0}, Landroid/support/v7/widget/OrientationHelper;->getTotalSpace()I

    move-result v0

    const/high16 v1, 0x40000000    # 2.0f

    invoke-static {v0, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v0

    iput v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mFullSizeSpec:I

    .line 792
    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mOrientation:I

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-ne v0, v3, :cond_2e

    .line 793
    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSizePerSpan:I

    invoke-static {v0, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v0

    iput v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mWidthSpec:I

    .line 794
    invoke-static {v2, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v0

    iput v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mHeightSpec:I

    goto :goto_3c

    .line 796
    :cond_2e
    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSizePerSpan:I

    invoke-static {v0, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v0

    iput v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mHeightSpec:I

    .line 797
    invoke-static {v2, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v0

    iput v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mWidthSpec:I

    .line 799
    :goto_3c
    return-void
.end method
