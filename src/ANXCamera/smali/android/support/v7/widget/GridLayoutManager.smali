.class public Landroid/support/v7/widget/GridLayoutManager;
.super Landroid/support/v7/widget/LinearLayoutManager;
.source "GridLayoutManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v7/widget/GridLayoutManager$LayoutParams;,
        Landroid/support/v7/widget/GridLayoutManager$DefaultSpanSizeLookup;,
        Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;
    }
.end annotation


# static fields
.field private static final DEBUG:Z = false

.field public static final DEFAULT_SPAN_COUNT:I = -0x1

.field static final MAIN_DIR_SPEC:I

.field private static final TAG:Ljava/lang/String; = "GridLayoutManager"


# instance fields
.field mCachedBorders:[I

.field final mDecorInsets:Landroid/graphics/Rect;

.field mPendingSpanCountChange:Z

.field final mPreLayoutSpanIndexCache:Landroid/util/SparseIntArray;

.field final mPreLayoutSpanSizeCache:Landroid/util/SparseIntArray;

.field mSet:[Landroid/view/View;

.field mSpanCount:I

.field mSpanSizeLookup:Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 43
    const/4 v0, 0x0

    invoke-static {v0, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v0

    sput v0, Landroid/support/v7/widget/GridLayoutManager;->MAIN_DIR_SPEC:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;I)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "spanCount"    # I

    .line 88
    invoke-direct {p0, p1}, Landroid/support/v7/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 48
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/v7/widget/GridLayoutManager;->mPendingSpanCountChange:Z

    .line 49
    const/4 v0, -0x1

    iput v0, p0, Landroid/support/v7/widget/GridLayoutManager;->mSpanCount:I

    .line 60
    new-instance v0, Landroid/util/SparseIntArray;

    invoke-direct {v0}, Landroid/util/SparseIntArray;-><init>()V

    iput-object v0, p0, Landroid/support/v7/widget/GridLayoutManager;->mPreLayoutSpanSizeCache:Landroid/util/SparseIntArray;

    .line 61
    new-instance v0, Landroid/util/SparseIntArray;

    invoke-direct {v0}, Landroid/util/SparseIntArray;-><init>()V

    iput-object v0, p0, Landroid/support/v7/widget/GridLayoutManager;->mPreLayoutSpanIndexCache:Landroid/util/SparseIntArray;

    .line 62
    new-instance v0, Landroid/support/v7/widget/GridLayoutManager$DefaultSpanSizeLookup;

    invoke-direct {v0}, Landroid/support/v7/widget/GridLayoutManager$DefaultSpanSizeLookup;-><init>()V

    iput-object v0, p0, Landroid/support/v7/widget/GridLayoutManager;->mSpanSizeLookup:Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;

    .line 64
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Landroid/support/v7/widget/GridLayoutManager;->mDecorInsets:Landroid/graphics/Rect;

    .line 89
    invoke-virtual {p0, p2}, Landroid/support/v7/widget/GridLayoutManager;->setSpanCount(I)V

    .line 90
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;IIZ)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "spanCount"    # I
    .param p3, "orientation"    # I
    .param p4, "reverseLayout"    # Z

    .line 101
    invoke-direct {p0, p1, p3, p4}, Landroid/support/v7/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    .line 48
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/v7/widget/GridLayoutManager;->mPendingSpanCountChange:Z

    .line 49
    const/4 v0, -0x1

    iput v0, p0, Landroid/support/v7/widget/GridLayoutManager;->mSpanCount:I

    .line 60
    new-instance v0, Landroid/util/SparseIntArray;

    invoke-direct {v0}, Landroid/util/SparseIntArray;-><init>()V

    iput-object v0, p0, Landroid/support/v7/widget/GridLayoutManager;->mPreLayoutSpanSizeCache:Landroid/util/SparseIntArray;

    .line 61
    new-instance v0, Landroid/util/SparseIntArray;

    invoke-direct {v0}, Landroid/util/SparseIntArray;-><init>()V

    iput-object v0, p0, Landroid/support/v7/widget/GridLayoutManager;->mPreLayoutSpanIndexCache:Landroid/util/SparseIntArray;

    .line 62
    new-instance v0, Landroid/support/v7/widget/GridLayoutManager$DefaultSpanSizeLookup;

    invoke-direct {v0}, Landroid/support/v7/widget/GridLayoutManager$DefaultSpanSizeLookup;-><init>()V

    iput-object v0, p0, Landroid/support/v7/widget/GridLayoutManager;->mSpanSizeLookup:Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;

    .line 64
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Landroid/support/v7/widget/GridLayoutManager;->mDecorInsets:Landroid/graphics/Rect;

    .line 102
    invoke-virtual {p0, p2}, Landroid/support/v7/widget/GridLayoutManager;->setSpanCount(I)V

    .line 103
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I

    .line 76
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/support/v7/widget/LinearLayoutManager;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 48
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/v7/widget/GridLayoutManager;->mPendingSpanCountChange:Z

    .line 49
    const/4 v0, -0x1

    iput v0, p0, Landroid/support/v7/widget/GridLayoutManager;->mSpanCount:I

    .line 60
    new-instance v0, Landroid/util/SparseIntArray;

    invoke-direct {v0}, Landroid/util/SparseIntArray;-><init>()V

    iput-object v0, p0, Landroid/support/v7/widget/GridLayoutManager;->mPreLayoutSpanSizeCache:Landroid/util/SparseIntArray;

    .line 61
    new-instance v0, Landroid/util/SparseIntArray;

    invoke-direct {v0}, Landroid/util/SparseIntArray;-><init>()V

    iput-object v0, p0, Landroid/support/v7/widget/GridLayoutManager;->mPreLayoutSpanIndexCache:Landroid/util/SparseIntArray;

    .line 62
    new-instance v0, Landroid/support/v7/widget/GridLayoutManager$DefaultSpanSizeLookup;

    invoke-direct {v0}, Landroid/support/v7/widget/GridLayoutManager$DefaultSpanSizeLookup;-><init>()V

    iput-object v0, p0, Landroid/support/v7/widget/GridLayoutManager;->mSpanSizeLookup:Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;

    .line 64
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Landroid/support/v7/widget/GridLayoutManager;->mDecorInsets:Landroid/graphics/Rect;

    .line 77
    invoke-static {p1, p2, p3, p4}, Landroid/support/v7/widget/GridLayoutManager;->getProperties(Landroid/content/Context;Landroid/util/AttributeSet;II)Landroid/support/v7/widget/RecyclerView$LayoutManager$Properties;

    move-result-object v0

    .line 78
    .local v0, "properties":Landroid/support/v7/widget/RecyclerView$LayoutManager$Properties;
    iget v1, v0, Landroid/support/v7/widget/RecyclerView$LayoutManager$Properties;->spanCount:I

    invoke-virtual {p0, v1}, Landroid/support/v7/widget/GridLayoutManager;->setSpanCount(I)V

    .line 79
    return-void
.end method

.method private assignSpans(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;IIZ)V
    .registers 21
    .param p1, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;
    .param p2, "state"    # Landroid/support/v7/widget/RecyclerView$State;
    .param p3, "count"    # I
    .param p4, "consumedSpanCount"    # I
    .param p5, "layingOutInPrimaryDirection"    # Z

    move-object v0, p0

    .line 594
    const/4 v1, -0x1

    if-eqz p5, :cond_b

    .line 595
    const/4 v2, 0x0

    .line 596
    .local v2, "start":I
    move/from16 v3, p3

    .line 597
    .local v3, "end":I
    const/4 v4, 0x1

    .line 601
    .local v4, "diff":I
    move v5, v3

    move v3, v2

    goto :goto_10

    .line 599
    .end local v2    # "start":I
    .end local v3    # "end":I
    .end local v4    # "diff":I
    :cond_b
    add-int/lit8 v3, p3, -0x1

    .line 600
    .local v3, "start":I
    const/4 v4, -0x1

    .line 601
    .local v4, "end":I
    move v5, v4

    move v4, v1

    .line 603
    .local v4, "diff":I
    .local v5, "end":I
    :goto_10
    iget v6, v0, Landroid/support/v7/widget/GridLayoutManager;->mOrientation:I

    const/4 v7, 0x1

    if-ne v6, v7, :cond_20

    invoke-virtual {v0}, Landroid/support/v7/widget/GridLayoutManager;->isLayoutRTL()Z

    move-result v6

    if-eqz v6, :cond_20

    .line 604
    iget v6, v0, Landroid/support/v7/widget/GridLayoutManager;->mSpanCount:I

    sub-int/2addr v6, v7

    .line 605
    .local v6, "span":I
    const/4 v8, -0x1

    .local v8, "spanDiff":I
    goto :goto_22

    .line 607
    .end local v6    # "span":I
    .end local v8    # "spanDiff":I
    :cond_20
    const/4 v6, 0x0

    .line 608
    .restart local v6    # "span":I
    move v8, v7

    .line 610
    .restart local v8    # "spanDiff":I
    :goto_22
    move v9, v6

    move v6, v3

    .local v6, "i":I
    .local v9, "span":I
    :goto_24
    if-eq v6, v5, :cond_5d

    .line 611
    iget-object v10, v0, Landroid/support/v7/widget/GridLayoutManager;->mSet:[Landroid/view/View;

    aget-object v10, v10, v6

    .line 612
    .local v10, "view":Landroid/view/View;
    invoke-virtual {v10}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v11

    check-cast v11, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;

    .line 613
    .local v11, "params":Landroid/support/v7/widget/GridLayoutManager$LayoutParams;
    invoke-virtual {v0, v10}, Landroid/support/v7/widget/GridLayoutManager;->getPosition(Landroid/view/View;)I

    move-result v12

    move-object/from16 v13, p1

    move-object/from16 v14, p2

    invoke-direct {v0, v13, v14, v12}, Landroid/support/v7/widget/GridLayoutManager;->getSpanSize(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;I)I

    move-result v12

    # setter for: Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->mSpanSize:I
    invoke-static {v11, v12}, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->access$102(Landroid/support/v7/widget/GridLayoutManager$LayoutParams;I)I

    .line 614
    if-ne v8, v1, :cond_52

    # getter for: Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->mSpanSize:I
    invoke-static {v11}, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->access$100(Landroid/support/v7/widget/GridLayoutManager$LayoutParams;)I

    move-result v12

    if-le v12, v7, :cond_52

    .line 615
    # getter for: Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->mSpanSize:I
    invoke-static {v11}, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->access$100(Landroid/support/v7/widget/GridLayoutManager$LayoutParams;)I

    move-result v12

    sub-int/2addr v12, v7

    sub-int v12, v9, v12

    # setter for: Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->mSpanIndex:I
    invoke-static {v11, v12}, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->access$002(Landroid/support/v7/widget/GridLayoutManager$LayoutParams;I)I

    goto :goto_55

    .line 617
    :cond_52
    # setter for: Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->mSpanIndex:I
    invoke-static {v11, v9}, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->access$002(Landroid/support/v7/widget/GridLayoutManager$LayoutParams;I)I

    .line 619
    :goto_55
    # getter for: Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->mSpanSize:I
    invoke-static {v11}, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->access$100(Landroid/support/v7/widget/GridLayoutManager$LayoutParams;)I

    move-result v12

    mul-int/2addr v12, v8

    add-int/2addr v9, v12

    .line 610
    .end local v10    # "view":Landroid/view/View;
    .end local v11    # "params":Landroid/support/v7/widget/GridLayoutManager$LayoutParams;
    add-int/2addr v6, v4

    goto :goto_24

    .line 621
    .end local v6    # "i":I
    :cond_5d
    move-object/from16 v13, p1

    move-object/from16 v14, p2

    return-void
.end method

.method private cachePreLayoutSpanMapping()V
    .registers 7

    .line 187
    invoke-virtual {p0}, Landroid/support/v7/widget/GridLayoutManager;->getChildCount()I

    move-result v0

    .line 188
    .local v0, "childCount":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_5
    if-ge v1, v0, :cond_2a

    .line 189
    invoke-virtual {p0, v1}, Landroid/support/v7/widget/GridLayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;

    .line 190
    .local v2, "lp":Landroid/support/v7/widget/GridLayoutManager$LayoutParams;
    invoke-virtual {v2}, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->getViewLayoutPosition()I

    move-result v3

    .line 191
    .local v3, "viewPosition":I
    iget-object v4, p0, Landroid/support/v7/widget/GridLayoutManager;->mPreLayoutSpanSizeCache:Landroid/util/SparseIntArray;

    invoke-virtual {v2}, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->getSpanSize()I

    move-result v5

    invoke-virtual {v4, v3, v5}, Landroid/util/SparseIntArray;->put(II)V

    .line 192
    iget-object v4, p0, Landroid/support/v7/widget/GridLayoutManager;->mPreLayoutSpanIndexCache:Landroid/util/SparseIntArray;

    invoke-virtual {v2}, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->getSpanIndex()I

    move-result v5

    invoke-virtual {v4, v3, v5}, Landroid/util/SparseIntArray;->put(II)V

    .line 188
    .end local v2    # "lp":Landroid/support/v7/widget/GridLayoutManager$LayoutParams;
    .end local v3    # "viewPosition":I
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    .line 194
    .end local v1    # "i":I
    :cond_2a
    return-void
.end method

.method private calculateItemBorders(I)V
    .registers 9
    .param p1, "totalSpace"    # I

    .line 277
    iget-object v0, p0, Landroid/support/v7/widget/GridLayoutManager;->mCachedBorders:[I

    const/4 v1, 0x1

    if-eqz v0, :cond_17

    iget-object v0, p0, Landroid/support/v7/widget/GridLayoutManager;->mCachedBorders:[I

    array-length v0, v0

    iget v2, p0, Landroid/support/v7/widget/GridLayoutManager;->mSpanCount:I

    add-int/2addr v2, v1

    if-ne v0, v2, :cond_17

    iget-object v0, p0, Landroid/support/v7/widget/GridLayoutManager;->mCachedBorders:[I

    iget-object v2, p0, Landroid/support/v7/widget/GridLayoutManager;->mCachedBorders:[I

    array-length v2, v2

    sub-int/2addr v2, v1

    aget v0, v0, v2

    if-eq v0, p1, :cond_1e

    .line 279
    :cond_17
    iget v0, p0, Landroid/support/v7/widget/GridLayoutManager;->mSpanCount:I

    add-int/2addr v0, v1

    new-array v0, v0, [I

    iput-object v0, p0, Landroid/support/v7/widget/GridLayoutManager;->mCachedBorders:[I

    .line 281
    :cond_1e
    iget-object v0, p0, Landroid/support/v7/widget/GridLayoutManager;->mCachedBorders:[I

    const/4 v2, 0x0

    aput v2, v0, v2

    .line 282
    iget v0, p0, Landroid/support/v7/widget/GridLayoutManager;->mSpanCount:I

    div-int v0, p1, v0

    .line 283
    .local v0, "sizePerSpan":I
    iget v2, p0, Landroid/support/v7/widget/GridLayoutManager;->mSpanCount:I

    rem-int v2, p1, v2

    .line 284
    .local v2, "sizePerSpanRemainder":I
    const/4 v3, 0x0

    .line 285
    .local v3, "consumedPixels":I
    const/4 v4, 0x0

    .line 286
    .local v4, "additionalSize":I
    nop

    .local v1, "i":I
    :goto_2e
    iget v5, p0, Landroid/support/v7/widget/GridLayoutManager;->mSpanCount:I

    if-gt v1, v5, :cond_48

    .line 287
    move v5, v0

    .line 288
    .local v5, "itemSize":I
    add-int/2addr v4, v2

    .line 289
    if-lez v4, :cond_40

    iget v6, p0, Landroid/support/v7/widget/GridLayoutManager;->mSpanCount:I

    sub-int/2addr v6, v4

    if-ge v6, v2, :cond_40

    .line 290
    add-int/lit8 v5, v5, 0x1

    .line 291
    iget v6, p0, Landroid/support/v7/widget/GridLayoutManager;->mSpanCount:I

    sub-int/2addr v4, v6

    .line 293
    :cond_40
    add-int/2addr v3, v5

    .line 294
    iget-object v6, p0, Landroid/support/v7/widget/GridLayoutManager;->mCachedBorders:[I

    aput v3, v6, v1

    .line 286
    .end local v5    # "itemSize":I
    add-int/lit8 v1, v1, 0x1

    goto :goto_2e

    .line 296
    .end local v1    # "i":I
    :cond_48
    return-void
.end method

.method private clearPreLayoutSpanMappingCache()V
    .registers 2

    .line 182
    iget-object v0, p0, Landroid/support/v7/widget/GridLayoutManager;->mPreLayoutSpanSizeCache:Landroid/util/SparseIntArray;

    invoke-virtual {v0}, Landroid/util/SparseIntArray;->clear()V

    .line 183
    iget-object v0, p0, Landroid/support/v7/widget/GridLayoutManager;->mPreLayoutSpanIndexCache:Landroid/util/SparseIntArray;

    invoke-virtual {v0}, Landroid/util/SparseIntArray;->clear()V

    .line 184
    return-void
.end method

.method private ensureAnchorIsInFirstSpan(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;)V
    .registers 6
    .param p1, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;
    .param p2, "state"    # Landroid/support/v7/widget/RecyclerView$State;
    .param p3, "anchorInfo"    # Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;

    .line 313
    iget v0, p3, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->mPosition:I

    invoke-direct {p0, p1, p2, v0}, Landroid/support/v7/widget/GridLayoutManager;->getSpanIndex(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;I)I

    move-result v0

    .line 314
    .local v0, "span":I
    :goto_6
    if-lez v0, :cond_19

    iget v1, p3, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->mPosition:I

    if-lez v1, :cond_19

    .line 315
    iget v1, p3, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->mPosition:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p3, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->mPosition:I

    .line 316
    iget v1, p3, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->mPosition:I

    invoke-direct {p0, p1, p2, v1}, Landroid/support/v7/widget/GridLayoutManager;->getSpanIndex(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;I)I

    move-result v0

    goto :goto_6

    .line 318
    :cond_19
    return-void
.end method

.method private getMainDirSpec(I)I
    .registers 3
    .param p1, "dim"    # I

    .line 556
    if-gez p1, :cond_5

    .line 557
    sget v0, Landroid/support/v7/widget/GridLayoutManager;->MAIN_DIR_SPEC:I

    return v0

    .line 559
    :cond_5
    const/high16 v0, 0x40000000    # 2.0f

    invoke-static {p1, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v0

    return v0
.end method

.method private getSpanGroupIndex(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;I)I
    .registers 8
    .param p1, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;
    .param p2, "state"    # Landroid/support/v7/widget/RecyclerView$State;
    .param p3, "viewPosition"    # I

    .line 356
    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView$State;->isPreLayout()Z

    move-result v0

    if-nez v0, :cond_f

    .line 357
    iget-object v0, p0, Landroid/support/v7/widget/GridLayoutManager;->mSpanSizeLookup:Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;

    iget v1, p0, Landroid/support/v7/widget/GridLayoutManager;->mSpanCount:I

    invoke-virtual {v0, p3, v1}, Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;->getSpanGroupIndex(II)I

    move-result v0

    return v0

    .line 359
    :cond_f
    invoke-virtual {p1, p3}, Landroid/support/v7/widget/RecyclerView$Recycler;->convertPreLayoutPositionToPostLayout(I)I

    move-result v0

    .line 360
    .local v0, "adapterPosition":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_2e

    .line 365
    const-string v1, "GridLayoutManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Cannot find span size for pre layout position. "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 366
    const/4 v1, 0x0

    return v1

    .line 368
    :cond_2e
    iget-object v1, p0, Landroid/support/v7/widget/GridLayoutManager;->mSpanSizeLookup:Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;

    iget v2, p0, Landroid/support/v7/widget/GridLayoutManager;->mSpanCount:I

    invoke-virtual {v1, v0, v2}, Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;->getSpanGroupIndex(II)I

    move-result v1

    return v1
.end method

.method private getSpanIndex(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;I)I
    .registers 9
    .param p1, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;
    .param p2, "state"    # Landroid/support/v7/widget/RecyclerView$State;
    .param p3, "pos"    # I

    .line 372
    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView$State;->isPreLayout()Z

    move-result v0

    if-nez v0, :cond_f

    .line 373
    iget-object v0, p0, Landroid/support/v7/widget/GridLayoutManager;->mSpanSizeLookup:Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;

    iget v1, p0, Landroid/support/v7/widget/GridLayoutManager;->mSpanCount:I

    invoke-virtual {v0, p3, v1}, Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;->getCachedSpanIndex(II)I

    move-result v0

    return v0

    .line 375
    :cond_f
    iget-object v0, p0, Landroid/support/v7/widget/GridLayoutManager;->mPreLayoutSpanIndexCache:Landroid/util/SparseIntArray;

    const/4 v1, -0x1

    invoke-virtual {v0, p3, v1}, Landroid/util/SparseIntArray;->get(II)I

    move-result v0

    .line 376
    .local v0, "cached":I
    if-eq v0, v1, :cond_19

    .line 377
    return v0

    .line 379
    :cond_19
    invoke-virtual {p1, p3}, Landroid/support/v7/widget/RecyclerView$Recycler;->convertPreLayoutPositionToPostLayout(I)I

    move-result v2

    .line 380
    .local v2, "adapterPosition":I
    if-ne v2, v1, :cond_37

    .line 385
    const-string v1, "GridLayoutManager"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Cannot find span size for pre layout position. It is not cached, not in the adapter. Pos:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 387
    const/4 v1, 0x0

    return v1

    .line 389
    :cond_37
    iget-object v1, p0, Landroid/support/v7/widget/GridLayoutManager;->mSpanSizeLookup:Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;

    iget v3, p0, Landroid/support/v7/widget/GridLayoutManager;->mSpanCount:I

    invoke-virtual {v1, v2, v3}, Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;->getCachedSpanIndex(II)I

    move-result v1

    return v1
.end method

.method private getSpanSize(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;I)I
    .registers 9
    .param p1, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;
    .param p2, "state"    # Landroid/support/v7/widget/RecyclerView$State;
    .param p3, "pos"    # I

    .line 393
    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView$State;->isPreLayout()Z

    move-result v0

    if-nez v0, :cond_d

    .line 394
    iget-object v0, p0, Landroid/support/v7/widget/GridLayoutManager;->mSpanSizeLookup:Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;

    invoke-virtual {v0, p3}, Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;->getSpanSize(I)I

    move-result v0

    return v0

    .line 396
    :cond_d
    iget-object v0, p0, Landroid/support/v7/widget/GridLayoutManager;->mPreLayoutSpanSizeCache:Landroid/util/SparseIntArray;

    const/4 v1, -0x1

    invoke-virtual {v0, p3, v1}, Landroid/util/SparseIntArray;->get(II)I

    move-result v0

    .line 397
    .local v0, "cached":I
    if-eq v0, v1, :cond_17

    .line 398
    return v0

    .line 400
    :cond_17
    invoke-virtual {p1, p3}, Landroid/support/v7/widget/RecyclerView$Recycler;->convertPreLayoutPositionToPostLayout(I)I

    move-result v2

    .line 401
    .local v2, "adapterPosition":I
    if-ne v2, v1, :cond_35

    .line 406
    const-string v1, "GridLayoutManager"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Cannot find span size for pre layout position. It is not cached, not in the adapter. Pos:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 408
    const/4 v1, 0x1

    return v1

    .line 410
    :cond_35
    iget-object v1, p0, Landroid/support/v7/widget/GridLayoutManager;->mSpanSizeLookup:Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;

    invoke-virtual {v1, v2}, Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;->getSpanSize(I)I

    move-result v1

    return v1
.end method

.method private measureChildWithDecorationsAndMargin(Landroid/view/View;IIZ)V
    .registers 9
    .param p1, "child"    # Landroid/view/View;
    .param p2, "widthSpec"    # I
    .param p3, "heightSpec"    # I
    .param p4, "capBothSpecs"    # Z

    .line 565
    iget-object v0, p0, Landroid/support/v7/widget/GridLayoutManager;->mDecorInsets:Landroid/graphics/Rect;

    invoke-virtual {p0, p1, v0}, Landroid/support/v7/widget/GridLayoutManager;->calculateItemDecorationsForChild(Landroid/view/View;Landroid/graphics/Rect;)V

    .line 566
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/RecyclerView$LayoutParams;

    .line 567
    .local v0, "lp":Landroid/support/v7/widget/RecyclerView$LayoutParams;
    if-nez p4, :cond_12

    iget v1, p0, Landroid/support/v7/widget/GridLayoutManager;->mOrientation:I

    const/4 v2, 0x1

    if-ne v1, v2, :cond_24

    .line 568
    :cond_12
    iget v1, v0, Landroid/support/v7/widget/RecyclerView$LayoutParams;->leftMargin:I

    iget-object v2, p0, Landroid/support/v7/widget/GridLayoutManager;->mDecorInsets:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->left:I

    add-int/2addr v1, v2

    iget v2, v0, Landroid/support/v7/widget/RecyclerView$LayoutParams;->rightMargin:I

    iget-object v3, p0, Landroid/support/v7/widget/GridLayoutManager;->mDecorInsets:Landroid/graphics/Rect;

    iget v3, v3, Landroid/graphics/Rect;->right:I

    add-int/2addr v2, v3

    invoke-direct {p0, p2, v1, v2}, Landroid/support/v7/widget/GridLayoutManager;->updateSpecWithExtra(III)I

    move-result p2

    .line 571
    :cond_24
    if-nez p4, :cond_2a

    iget v1, p0, Landroid/support/v7/widget/GridLayoutManager;->mOrientation:I

    if-nez v1, :cond_3c

    .line 572
    :cond_2a
    iget v1, v0, Landroid/support/v7/widget/RecyclerView$LayoutParams;->topMargin:I

    iget-object v2, p0, Landroid/support/v7/widget/GridLayoutManager;->mDecorInsets:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->top:I

    add-int/2addr v1, v2

    iget v2, v0, Landroid/support/v7/widget/RecyclerView$LayoutParams;->bottomMargin:I

    iget-object v3, p0, Landroid/support/v7/widget/GridLayoutManager;->mDecorInsets:Landroid/graphics/Rect;

    iget v3, v3, Landroid/graphics/Rect;->bottom:I

    add-int/2addr v2, v3

    invoke-direct {p0, p3, v1, v2}, Landroid/support/v7/widget/GridLayoutManager;->updateSpecWithExtra(III)I

    move-result p3

    .line 575
    :cond_3c
    invoke-virtual {p1, p2, p3}, Landroid/view/View;->measure(II)V

    .line 576
    return-void
.end method

.method private updateMeasurements()V
    .registers 3

    .line 268
    invoke-virtual {p0}, Landroid/support/v7/widget/GridLayoutManager;->getOrientation()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_16

    .line 269
    invoke-virtual {p0}, Landroid/support/v7/widget/GridLayoutManager;->getWidth()I

    move-result v0

    invoke-virtual {p0}, Landroid/support/v7/widget/GridLayoutManager;->getPaddingRight()I

    move-result v1

    sub-int/2addr v0, v1

    invoke-virtual {p0}, Landroid/support/v7/widget/GridLayoutManager;->getPaddingLeft()I

    move-result v1

    sub-int/2addr v0, v1

    .local v0, "totalSpace":I
    goto :goto_24

    .line 271
    .end local v0    # "totalSpace":I
    :cond_16
    invoke-virtual {p0}, Landroid/support/v7/widget/GridLayoutManager;->getHeight()I

    move-result v0

    invoke-virtual {p0}, Landroid/support/v7/widget/GridLayoutManager;->getPaddingBottom()I

    move-result v1

    sub-int/2addr v0, v1

    invoke-virtual {p0}, Landroid/support/v7/widget/GridLayoutManager;->getPaddingTop()I

    move-result v1

    sub-int/2addr v0, v1

    .line 273
    .restart local v0    # "totalSpace":I
    :goto_24
    invoke-direct {p0, v0}, Landroid/support/v7/widget/GridLayoutManager;->calculateItemBorders(I)V

    .line 274
    return-void
.end method

.method private updateSpecWithExtra(III)I
    .registers 6
    .param p1, "spec"    # I
    .param p2, "startInset"    # I
    .param p3, "endInset"    # I

    .line 579
    if-nez p2, :cond_5

    if-nez p3, :cond_5

    .line 580
    return p1

    .line 582
    :cond_5
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v0

    .line 583
    .local v0, "mode":I
    const/high16 v1, -0x80000000

    if-eq v0, v1, :cond_13

    const/high16 v1, 0x40000000    # 2.0f

    if-ne v0, v1, :cond_12

    goto :goto_13

    .line 587
    :cond_12
    return p1

    .line 584
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
.method public checkLayoutParams(Landroid/support/v7/widget/RecyclerView$LayoutParams;)Z
    .registers 3
    .param p1, "lp"    # Landroid/support/v7/widget/RecyclerView$LayoutParams;

    .line 244
    instance-of v0, p1, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;

    return v0
.end method

.method findReferenceChild(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;III)Landroid/view/View;
    .registers 16
    .param p1, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;
    .param p2, "state"    # Landroid/support/v7/widget/RecyclerView$State;
    .param p3, "start"    # I
    .param p4, "end"    # I
    .param p5, "itemCount"    # I

    .line 323
    invoke-virtual {p0}, Landroid/support/v7/widget/GridLayoutManager;->ensureLayoutState()V

    .line 324
    const/4 v0, 0x0

    .line 325
    .local v0, "invalidMatch":Landroid/view/View;
    const/4 v1, 0x0

    .line 326
    .local v1, "outOfBoundsMatch":Landroid/view/View;
    iget-object v2, p0, Landroid/support/v7/widget/GridLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v2}, Landroid/support/v7/widget/OrientationHelper;->getStartAfterPadding()I

    move-result v2

    .line 327
    .local v2, "boundsStart":I
    iget-object v3, p0, Landroid/support/v7/widget/GridLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v3}, Landroid/support/v7/widget/OrientationHelper;->getEndAfterPadding()I

    move-result v3

    .line 328
    .local v3, "boundsEnd":I
    if-le p4, p3, :cond_15

    const/4 v4, 0x1

    goto :goto_16

    :cond_15
    const/4 v4, -0x1

    .line 329
    .local v4, "diff":I
    :goto_16
    move-object v5, v0

    move v0, p3

    .local v0, "i":I
    .local v5, "invalidMatch":Landroid/view/View;
    :goto_18
    if-eq v0, p4, :cond_54

    .line 330
    invoke-virtual {p0, v0}, Landroid/support/v7/widget/GridLayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    .line 331
    .local v6, "view":Landroid/view/View;
    invoke-virtual {p0, v6}, Landroid/support/v7/widget/GridLayoutManager;->getPosition(Landroid/view/View;)I

    move-result v7

    .line 332
    .local v7, "position":I
    if-ltz v7, :cond_52

    if-ge v7, p5, :cond_52

    .line 333
    invoke-direct {p0, p1, p2, v7}, Landroid/support/v7/widget/GridLayoutManager;->getSpanIndex(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;I)I

    move-result v8

    .line 334
    .local v8, "span":I
    if-eqz v8, :cond_2d

    .line 335
    goto :goto_52

    .line 337
    :cond_2d
    invoke-virtual {v6}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v9

    check-cast v9, Landroid/support/v7/widget/RecyclerView$LayoutParams;

    invoke-virtual {v9}, Landroid/support/v7/widget/RecyclerView$LayoutParams;->isItemRemoved()Z

    move-result v9

    if-eqz v9, :cond_3d

    .line 338
    if-nez v5, :cond_52

    .line 339
    move-object v5, v6

    goto :goto_52

    .line 341
    :cond_3d
    iget-object v9, p0, Landroid/support/v7/widget/GridLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v9, v6}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedStart(Landroid/view/View;)I

    move-result v9

    if-ge v9, v3, :cond_4f

    iget-object v9, p0, Landroid/support/v7/widget/GridLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v9, v6}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedEnd(Landroid/view/View;)I

    move-result v9

    if-ge v9, v2, :cond_4e

    goto :goto_4f

    .line 347
    :cond_4e
    return-object v6

    .line 343
    :cond_4f
    :goto_4f
    if-nez v1, :cond_52

    .line 344
    move-object v1, v6

    .line 329
    .end local v6    # "view":Landroid/view/View;
    .end local v7    # "position":I
    .end local v8    # "span":I
    :cond_52
    :goto_52
    add-int/2addr v0, v4

    goto :goto_18

    .line 351
    .end local v0    # "i":I
    :cond_54
    if-eqz v1, :cond_58

    move-object v0, v1

    goto :goto_59

    :cond_58
    move-object v0, v5

    :goto_59
    return-object v0
.end method

.method public generateDefaultLayoutParams()Landroid/support/v7/widget/RecyclerView$LayoutParams;
    .registers 3

    .line 224
    new-instance v0, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;

    const/4 v1, -0x2

    invoke-direct {v0, v1, v1}, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;-><init>(II)V

    return-object v0
.end method

.method public generateLayoutParams(Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/support/v7/widget/RecyclerView$LayoutParams;
    .registers 4
    .param p1, "c"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .line 230
    new-instance v0, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;

    invoke-direct {v0, p1, p2}, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-object v0
.end method

.method public generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/support/v7/widget/RecyclerView$LayoutParams;
    .registers 4
    .param p1, "lp"    # Landroid/view/ViewGroup$LayoutParams;

    .line 235
    instance-of v0, p1, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v0, :cond_d

    .line 236
    new-instance v0, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;

    move-object v1, p1

    check-cast v1, Landroid/view/ViewGroup$MarginLayoutParams;

    invoke-direct {v0, v1}, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;-><init>(Landroid/view/ViewGroup$MarginLayoutParams;)V

    return-object v0

    .line 238
    :cond_d
    new-instance v0, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;

    invoke-direct {v0, p1}, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    return-object v0
.end method

.method public getColumnCountForAccessibility(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;)I
    .registers 5
    .param p1, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;
    .param p2, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .line 134
    iget v0, p0, Landroid/support/v7/widget/GridLayoutManager;->mOrientation:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_8

    .line 135
    iget v0, p0, Landroid/support/v7/widget/GridLayoutManager;->mSpanCount:I

    return v0

    .line 137
    :cond_8
    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView$State;->getItemCount()I

    move-result v0

    if-ge v0, v1, :cond_10

    .line 138
    const/4 v0, 0x0

    return v0

    .line 140
    :cond_10
    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView$State;->getItemCount()I

    move-result v0

    sub-int/2addr v0, v1

    invoke-direct {p0, p1, p2, v0}, Landroid/support/v7/widget/GridLayoutManager;->getSpanGroupIndex(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;I)I

    move-result v0

    return v0
.end method

.method public getRowCountForAccessibility(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;)I
    .registers 5
    .param p1, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;
    .param p2, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .line 122
    iget v0, p0, Landroid/support/v7/widget/GridLayoutManager;->mOrientation:I

    if-nez v0, :cond_7

    .line 123
    iget v0, p0, Landroid/support/v7/widget/GridLayoutManager;->mSpanCount:I

    return v0

    .line 125
    :cond_7
    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView$State;->getItemCount()I

    move-result v0

    const/4 v1, 0x1

    if-ge v0, v1, :cond_10

    .line 126
    const/4 v0, 0x0

    return v0

    .line 128
    :cond_10
    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView$State;->getItemCount()I

    move-result v0

    sub-int/2addr v0, v1

    invoke-direct {p0, p1, p2, v0}, Landroid/support/v7/widget/GridLayoutManager;->getSpanGroupIndex(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;I)I

    move-result v0

    return v0
.end method

.method public getSpanCount()I
    .registers 2

    .line 630
    iget v0, p0, Landroid/support/v7/widget/GridLayoutManager;->mSpanCount:I

    return v0
.end method

.method public getSpanSizeLookup()Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;
    .registers 2

    .line 263
    iget-object v0, p0, Landroid/support/v7/widget/GridLayoutManager;->mSpanSizeLookup:Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;

    return-object v0
.end method

.method layoutChunk(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;Landroid/support/v7/widget/LinearLayoutManager$LayoutState;Landroid/support/v7/widget/LinearLayoutManager$LayoutChunkResult;)V
    .registers 29
    .param p1, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;
    .param p2, "state"    # Landroid/support/v7/widget/RecyclerView$State;
    .param p3, "layoutState"    # Landroid/support/v7/widget/LinearLayoutManager$LayoutState;
    .param p4, "result"    # Landroid/support/v7/widget/LinearLayoutManager$LayoutChunkResult;

    move-object/from16 v6, p0

    move-object/from16 v7, p1

    move-object/from16 v8, p2

    move-object/from16 v9, p3

    .line 416
    move-object/from16 v10, p4

    iget v0, v9, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mItemDirection:I

    const/4 v11, 0x0

    const/4 v12, 0x1

    if-ne v0, v12, :cond_12

    move v0, v12

    goto :goto_13

    :cond_12
    move v0, v11

    :goto_13
    move v13, v0

    .line 418
    .local v13, "layingOutInPrimaryDirection":Z
    const/4 v0, 0x0

    .line 419
    .local v0, "count":I
    const/4 v1, 0x0

    .line 420
    .local v1, "consumedSpanCount":I
    iget v2, v6, Landroid/support/v7/widget/GridLayoutManager;->mSpanCount:I

    .line 421
    .local v2, "remainingSpan":I
    if-nez v13, :cond_28

    .line 422
    iget v3, v9, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mCurrentPosition:I

    invoke-direct {v6, v7, v8, v3}, Landroid/support/v7/widget/GridLayoutManager;->getSpanIndex(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;I)I

    move-result v3

    .line 423
    .local v3, "itemSpanIndex":I
    iget v4, v9, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mCurrentPosition:I

    invoke-direct {v6, v7, v8, v4}, Landroid/support/v7/widget/GridLayoutManager;->getSpanSize(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;I)I

    move-result v4

    .line 424
    .local v4, "itemSpanSize":I
    add-int v2, v3, v4

    .line 426
    .end local v0    # "count":I
    .end local v1    # "consumedSpanCount":I
    .end local v3    # "itemSpanIndex":I
    .end local v4    # "itemSpanSize":I
    .local v14, "count":I
    .local v15, "consumedSpanCount":I
    :cond_28
    move v14, v0

    move v15, v1

    :goto_2a
    iget v0, v6, Landroid/support/v7/widget/GridLayoutManager;->mSpanCount:I

    if-ge v14, v0, :cond_81

    invoke-virtual {v9, v8}, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->hasMore(Landroid/support/v7/widget/RecyclerView$State;)Z

    move-result v0

    if-eqz v0, :cond_81

    if-lez v2, :cond_81

    .line 427
    iget v0, v9, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mCurrentPosition:I

    .line 428
    .local v0, "pos":I
    invoke-direct {v6, v7, v8, v0}, Landroid/support/v7/widget/GridLayoutManager;->getSpanSize(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;I)I

    move-result v1

    .line 429
    .local v1, "spanSize":I
    iget v3, v6, Landroid/support/v7/widget/GridLayoutManager;->mSpanCount:I

    if-gt v1, v3, :cond_53

    .line 434
    sub-int/2addr v2, v1

    .line 435
    if-gez v2, :cond_44

    .line 436
    goto :goto_81

    .line 438
    :cond_44
    invoke-virtual {v9, v7}, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->next(Landroid/support/v7/widget/RecyclerView$Recycler;)Landroid/view/View;

    move-result-object v3

    .line 439
    .local v3, "view":Landroid/view/View;
    if-nez v3, :cond_4b

    .line 440
    goto :goto_81

    .line 442
    :cond_4b
    add-int/2addr v15, v1

    .line 443
    iget-object v4, v6, Landroid/support/v7/widget/GridLayoutManager;->mSet:[Landroid/view/View;

    aput-object v3, v4, v14

    .line 444
    add-int/lit8 v14, v14, 0x1

    .line 445
    .end local v0    # "pos":I
    .end local v1    # "spanSize":I
    .end local v3    # "view":Landroid/view/View;
    goto :goto_2a

    .line 430
    .restart local v0    # "pos":I
    .restart local v1    # "spanSize":I
    :cond_53
    new-instance v3, Ljava/lang/IllegalArgumentException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Item at position "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, " requires "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, " spans but GridLayoutManager has only "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v5, v6, Landroid/support/v7/widget/GridLayoutManager;->mSpanCount:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, " spans."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 447
    .end local v0    # "pos":I
    .end local v1    # "spanSize":I
    :cond_81
    :goto_81
    move/from16 v16, v2

    .end local v2    # "remainingSpan":I
    .local v16, "remainingSpan":I
    if-nez v14, :cond_88

    .line 448
    iput-boolean v12, v10, Landroid/support/v7/widget/LinearLayoutManager$LayoutChunkResult;->mFinished:Z

    .line 449
    return-void

    .line 452
    :cond_88
    const/16 v17, 0x0

    .line 455
    .local v17, "maxSize":I
    move-object v0, v6

    move-object v1, v7

    move-object v2, v8

    move v3, v14

    move v4, v15

    move v5, v13

    invoke-direct/range {v0 .. v5}, Landroid/support/v7/widget/GridLayoutManager;->assignSpans(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;IIZ)V

    .line 456
    move v0, v11

    move/from16 v5, v17

    .end local v17    # "maxSize":I
    .local v0, "i":I
    .local v5, "maxSize":I
    :goto_96
    const/high16 v1, 0x40000000    # 2.0f

    if-ge v0, v14, :cond_fc

    .line 457
    iget-object v2, v6, Landroid/support/v7/widget/GridLayoutManager;->mSet:[Landroid/view/View;

    aget-object v2, v2, v0

    .line 458
    .local v2, "view":Landroid/view/View;
    iget-object v3, v9, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mScrapList:Ljava/util/List;

    if-nez v3, :cond_ac

    .line 459
    if-eqz v13, :cond_a8

    .line 460
    invoke-virtual {v6, v2}, Landroid/support/v7/widget/GridLayoutManager;->addView(Landroid/view/View;)V

    goto :goto_b5

    .line 462
    :cond_a8
    invoke-virtual {v6, v2, v11}, Landroid/support/v7/widget/GridLayoutManager;->addView(Landroid/view/View;I)V

    goto :goto_b5

    .line 465
    :cond_ac
    if-eqz v13, :cond_b2

    .line 466
    invoke-virtual {v6, v2}, Landroid/support/v7/widget/GridLayoutManager;->addDisappearingView(Landroid/view/View;)V

    goto :goto_b5

    .line 468
    :cond_b2
    invoke-virtual {v6, v2, v11}, Landroid/support/v7/widget/GridLayoutManager;->addDisappearingView(Landroid/view/View;I)V

    .line 472
    :goto_b5
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;

    .line 473
    .local v3, "lp":Landroid/support/v7/widget/GridLayoutManager$LayoutParams;
    iget-object v4, v6, Landroid/support/v7/widget/GridLayoutManager;->mCachedBorders:[I

    # getter for: Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->mSpanIndex:I
    invoke-static {v3}, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->access$000(Landroid/support/v7/widget/GridLayoutManager$LayoutParams;)I

    move-result v17

    # getter for: Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->mSpanSize:I
    invoke-static {v3}, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->access$100(Landroid/support/v7/widget/GridLayoutManager$LayoutParams;)I

    move-result v18

    add-int v17, v17, v18

    aget v4, v4, v17

    iget-object v11, v6, Landroid/support/v7/widget/GridLayoutManager;->mCachedBorders:[I

    # getter for: Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->mSpanIndex:I
    invoke-static {v3}, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->access$000(Landroid/support/v7/widget/GridLayoutManager$LayoutParams;)I

    move-result v17

    aget v11, v11, v17

    sub-int/2addr v4, v11

    invoke-static {v4, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v1

    .line 477
    .local v1, "spec":I
    iget v4, v6, Landroid/support/v7/widget/GridLayoutManager;->mOrientation:I

    if-ne v4, v12, :cond_e5

    .line 478
    iget v4, v3, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->height:I

    invoke-direct {v6, v4}, Landroid/support/v7/widget/GridLayoutManager;->getMainDirSpec(I)I

    move-result v4

    const/4 v11, 0x0

    invoke-direct {v6, v2, v1, v4, v11}, Landroid/support/v7/widget/GridLayoutManager;->measureChildWithDecorationsAndMargin(Landroid/view/View;IIZ)V

    goto :goto_ef

    .line 480
    :cond_e5
    const/4 v11, 0x0

    iget v4, v3, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->width:I

    invoke-direct {v6, v4}, Landroid/support/v7/widget/GridLayoutManager;->getMainDirSpec(I)I

    move-result v4

    invoke-direct {v6, v2, v4, v1, v11}, Landroid/support/v7/widget/GridLayoutManager;->measureChildWithDecorationsAndMargin(Landroid/view/View;IIZ)V

    .line 482
    :goto_ef
    iget-object v4, v6, Landroid/support/v7/widget/GridLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v4, v2}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedMeasurement(Landroid/view/View;)I

    move-result v4

    .line 483
    .local v4, "size":I
    if-le v4, v5, :cond_f9

    .line 484
    move v1, v4

    .line 456
    .end local v2    # "view":Landroid/view/View;
    .end local v3    # "lp":Landroid/support/v7/widget/GridLayoutManager$LayoutParams;
    .end local v4    # "size":I
    .end local v5    # "maxSize":I
    .local v1, "maxSize":I
    move v5, v1

    .end local v1    # "maxSize":I
    .restart local v5    # "maxSize":I
    :cond_f9
    add-int/lit8 v0, v0, 0x1

    goto :goto_96

    .line 489
    .end local v0    # "i":I
    :cond_fc
    invoke-direct {v6, v5}, Landroid/support/v7/widget/GridLayoutManager;->getMainDirSpec(I)I

    move-result v4

    .line 490
    .local v4, "maxMeasureSpec":I
    move v0, v11

    .restart local v0    # "i":I
    :goto_101
    if-ge v0, v14, :cond_143

    .line 491
    iget-object v2, v6, Landroid/support/v7/widget/GridLayoutManager;->mSet:[Landroid/view/View;

    aget-object v2, v2, v0

    .line 492
    .restart local v2    # "view":Landroid/view/View;
    iget-object v3, v6, Landroid/support/v7/widget/GridLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v3, v2}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedMeasurement(Landroid/view/View;)I

    move-result v3

    if-eq v3, v5, :cond_13c

    .line 493
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;

    .line 494
    .restart local v3    # "lp":Landroid/support/v7/widget/GridLayoutManager$LayoutParams;
    iget-object v11, v6, Landroid/support/v7/widget/GridLayoutManager;->mCachedBorders:[I

    # getter for: Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->mSpanIndex:I
    invoke-static {v3}, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->access$000(Landroid/support/v7/widget/GridLayoutManager$LayoutParams;)I

    move-result v17

    # getter for: Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->mSpanSize:I
    invoke-static {v3}, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->access$100(Landroid/support/v7/widget/GridLayoutManager$LayoutParams;)I

    move-result v18

    add-int v17, v17, v18

    aget v11, v11, v17

    iget-object v12, v6, Landroid/support/v7/widget/GridLayoutManager;->mCachedBorders:[I

    # getter for: Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->mSpanIndex:I
    invoke-static {v3}, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->access$000(Landroid/support/v7/widget/GridLayoutManager$LayoutParams;)I

    move-result v17

    aget v12, v12, v17

    sub-int/2addr v11, v12

    invoke-static {v11, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v11

    .line 498
    .local v11, "spec":I
    iget v12, v6, Landroid/support/v7/widget/GridLayoutManager;->mOrientation:I

    const/4 v1, 0x1

    if-ne v12, v1, :cond_139

    .line 499
    invoke-direct {v6, v2, v11, v4, v1}, Landroid/support/v7/widget/GridLayoutManager;->measureChildWithDecorationsAndMargin(Landroid/view/View;IIZ)V

    goto :goto_13c

    .line 501
    :cond_139
    invoke-direct {v6, v2, v4, v11, v1}, Landroid/support/v7/widget/GridLayoutManager;->measureChildWithDecorationsAndMargin(Landroid/view/View;IIZ)V

    .line 490
    .end local v2    # "view":Landroid/view/View;
    .end local v3    # "lp":Landroid/support/v7/widget/GridLayoutManager$LayoutParams;
    .end local v11    # "spec":I
    :cond_13c
    :goto_13c
    add-int/lit8 v0, v0, 0x1

    const/high16 v1, 0x40000000    # 2.0f

    const/4 v11, 0x0

    const/4 v12, 0x1

    goto :goto_101

    .line 506
    .end local v0    # "i":I
    :cond_143
    iput v5, v10, Landroid/support/v7/widget/LinearLayoutManager$LayoutChunkResult;->mConsumed:I

    .line 508
    const/4 v0, 0x0

    .local v0, "left":I
    const/4 v1, 0x0

    .local v1, "right":I
    const/4 v2, 0x0

    .local v2, "top":I
    const/4 v3, 0x0

    .line 509
    .local v3, "bottom":I
    iget v11, v6, Landroid/support/v7/widget/GridLayoutManager;->mOrientation:I

    const/4 v12, 0x1

    if-ne v11, v12, :cond_15d

    .line 510
    iget v11, v9, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mLayoutDirection:I

    const/4 v12, -0x1

    if-ne v11, v12, :cond_158

    .line 511
    iget v3, v9, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mOffset:I

    .line 512
    sub-int v2, v3, v5

    goto :goto_16b

    .line 514
    :cond_158
    iget v2, v9, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mOffset:I

    .line 515
    add-int v3, v2, v5

    goto :goto_16b

    .line 518
    :cond_15d
    iget v11, v9, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mLayoutDirection:I

    const/4 v12, -0x1

    if-ne v11, v12, :cond_167

    .line 519
    iget v1, v9, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mOffset:I

    .line 520
    sub-int v0, v1, v5

    goto :goto_16b

    .line 522
    :cond_167
    iget v0, v9, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mOffset:I

    .line 523
    add-int v1, v0, v5

    .line 526
    :goto_16b
    const/16 v20, 0x0

    .local v20, "i":I
    :goto_16d
    move/from16 v11, v20

    .end local v20    # "i":I
    .local v11, "i":I
    if-ge v11, v14, :cond_205

    .line 527
    iget-object v12, v6, Landroid/support/v7/widget/GridLayoutManager;->mSet:[Landroid/view/View;

    aget-object v12, v12, v11

    .line 528
    .local v12, "view":Landroid/view/View;
    invoke-virtual {v12}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v17

    move-object/from16 v7, v17

    check-cast v7, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;

    .line 529
    .local v7, "params":Landroid/support/v7/widget/GridLayoutManager$LayoutParams;
    move/from16 v22, v0

    iget v0, v6, Landroid/support/v7/widget/GridLayoutManager;->mOrientation:I

    .end local v0    # "left":I
    .local v22, "left":I
    move/from16 v23, v1

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1a3

    .line 530
    .end local v1    # "right":I
    .local v23, "right":I
    invoke-virtual/range {p0 .. p0}, Landroid/support/v7/widget/GridLayoutManager;->getPaddingLeft()I

    move-result v0

    iget-object v1, v6, Landroid/support/v7/widget/GridLayoutManager;->mCachedBorders:[I

    # getter for: Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->mSpanIndex:I
    invoke-static {v7}, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->access$000(Landroid/support/v7/widget/GridLayoutManager$LayoutParams;)I

    move-result v17

    aget v1, v1, v17

    add-int/2addr v0, v1

    .line 531
    .end local v22    # "left":I
    .restart local v0    # "left":I
    iget-object v1, v6, Landroid/support/v7/widget/GridLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v1, v12}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedMeasurementInOther(Landroid/view/View;)I

    move-result v1

    add-int/2addr v1, v0

    .line 538
    .end local v23    # "right":I
    .restart local v1    # "right":I
    move/from16 v22, v0

    move/from16 v23, v1

    move/from16 v17, v2

    move/from16 v18, v3

    goto :goto_1bb

    .line 533
    .end local v0    # "left":I
    .end local v1    # "right":I
    .restart local v22    # "left":I
    .restart local v23    # "right":I
    :cond_1a3
    invoke-virtual/range {p0 .. p0}, Landroid/support/v7/widget/GridLayoutManager;->getPaddingTop()I

    move-result v0

    iget-object v1, v6, Landroid/support/v7/widget/GridLayoutManager;->mCachedBorders:[I

    # getter for: Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->mSpanIndex:I
    invoke-static {v7}, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->access$000(Landroid/support/v7/widget/GridLayoutManager$LayoutParams;)I

    move-result v17

    aget v1, v1, v17

    add-int/2addr v0, v1

    .line 534
    .end local v2    # "top":I
    .local v0, "top":I
    iget-object v1, v6, Landroid/support/v7/widget/GridLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v1, v12}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedMeasurementInOther(Landroid/view/View;)I

    move-result v1

    add-int/2addr v1, v0

    .line 538
    .end local v3    # "bottom":I
    .local v1, "bottom":I
    move/from16 v17, v0

    move/from16 v18, v1

    .end local v0    # "top":I
    .end local v1    # "bottom":I
    .local v17, "top":I
    .local v18, "bottom":I
    :goto_1bb
    iget v0, v7, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->leftMargin:I

    add-int v2, v22, v0

    iget v0, v7, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->topMargin:I

    add-int v3, v17, v0

    iget v0, v7, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->rightMargin:I

    sub-int v19, v23, v0

    iget v0, v7, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->bottomMargin:I

    sub-int v20, v18, v0

    move-object v0, v6

    move-object v1, v12

    move/from16 v21, v4

    move/from16 v4, v19

    .end local v4    # "maxMeasureSpec":I
    .local v21, "maxMeasureSpec":I
    move/from16 v19, v5

    move/from16 v5, v20

    .end local v5    # "maxSize":I
    .local v19, "maxSize":I
    invoke-virtual/range {v0 .. v5}, Landroid/support/v7/widget/GridLayoutManager;->layoutDecorated(Landroid/view/View;IIII)V

    .line 547
    invoke-virtual {v7}, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->isItemRemoved()Z

    move-result v0

    if-nez v0, :cond_1e7

    invoke-virtual {v7}, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->isItemChanged()Z

    move-result v0

    if-eqz v0, :cond_1e5

    goto :goto_1e7

    .line 550
    :cond_1e5
    const/4 v0, 0x1

    goto :goto_1ea

    .line 548
    :cond_1e7
    :goto_1e7
    const/4 v0, 0x1

    iput-boolean v0, v10, Landroid/support/v7/widget/LinearLayoutManager$LayoutChunkResult;->mIgnoreConsumed:Z

    .line 550
    :goto_1ea
    iget-boolean v1, v10, Landroid/support/v7/widget/LinearLayoutManager$LayoutChunkResult;->mFocusable:Z

    invoke-virtual {v12}, Landroid/view/View;->isFocusable()Z

    move-result v2

    or-int/2addr v1, v2

    iput-boolean v1, v10, Landroid/support/v7/widget/LinearLayoutManager$LayoutChunkResult;->mFocusable:Z

    .line 526
    .end local v7    # "params":Landroid/support/v7/widget/GridLayoutManager$LayoutParams;
    .end local v12    # "view":Landroid/view/View;
    add-int/lit8 v20, v11, 0x1

    .end local v11    # "i":I
    .restart local v20    # "i":I
    move/from16 v2, v17

    move/from16 v3, v18

    move/from16 v5, v19

    move/from16 v4, v21

    move/from16 v0, v22

    move/from16 v1, v23

    move-object/from16 v7, p1

    goto/16 :goto_16d

    .line 552
    .end local v17    # "top":I
    .end local v18    # "bottom":I
    .end local v19    # "maxSize":I
    .end local v20    # "i":I
    .end local v21    # "maxMeasureSpec":I
    .end local v22    # "left":I
    .end local v23    # "right":I
    .local v0, "left":I
    .local v1, "right":I
    .restart local v2    # "top":I
    .restart local v3    # "bottom":I
    .restart local v4    # "maxMeasureSpec":I
    .restart local v5    # "maxSize":I
    :cond_205
    move/from16 v22, v0

    move/from16 v23, v1

    move/from16 v21, v4

    move/from16 v19, v5

    .end local v0    # "left":I
    .end local v1    # "right":I
    .end local v4    # "maxMeasureSpec":I
    .end local v5    # "maxSize":I
    .restart local v19    # "maxSize":I
    .restart local v21    # "maxMeasureSpec":I
    .restart local v22    # "left":I
    .restart local v23    # "right":I
    iget-object v0, v6, Landroid/support/v7/widget/GridLayoutManager;->mSet:[Landroid/view/View;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Ljava/util/Arrays;->fill([Ljava/lang/Object;Ljava/lang/Object;)V

    .line 553
    return-void
.end method

.method onAnchorReady(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;)V
    .registers 6
    .param p1, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;
    .param p2, "state"    # Landroid/support/v7/widget/RecyclerView$State;
    .param p3, "anchorInfo"    # Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;

    .line 301
    invoke-super {p0, p1, p2, p3}, Landroid/support/v7/widget/LinearLayoutManager;->onAnchorReady(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;)V

    .line 302
    invoke-direct {p0}, Landroid/support/v7/widget/GridLayoutManager;->updateMeasurements()V

    .line 303
    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView$State;->getItemCount()I

    move-result v0

    if-lez v0, :cond_15

    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView$State;->isPreLayout()Z

    move-result v0

    if-nez v0, :cond_15

    .line 304
    invoke-direct {p0, p1, p2, p3}, Landroid/support/v7/widget/GridLayoutManager;->ensureAnchorIsInFirstSpan(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;)V

    .line 306
    :cond_15
    iget-object v0, p0, Landroid/support/v7/widget/GridLayoutManager;->mSet:[Landroid/view/View;

    if-eqz v0, :cond_20

    iget-object v0, p0, Landroid/support/v7/widget/GridLayoutManager;->mSet:[Landroid/view/View;

    array-length v0, v0

    iget v1, p0, Landroid/support/v7/widget/GridLayoutManager;->mSpanCount:I

    if-eq v0, v1, :cond_26

    .line 307
    :cond_20
    iget v0, p0, Landroid/support/v7/widget/GridLayoutManager;->mSpanCount:I

    new-array v0, v0, [Landroid/view/View;

    iput-object v0, p0, Landroid/support/v7/widget/GridLayoutManager;->mSet:[Landroid/view/View;

    .line 309
    :cond_26
    return-void
.end method

.method public onInitializeAccessibilityNodeInfoForItem(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;Landroid/view/View;Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;)V
    .registers 16
    .param p1, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;
    .param p2, "state"    # Landroid/support/v7/widget/RecyclerView$State;
    .param p3, "host"    # Landroid/view/View;
    .param p4, "info"    # Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;

    .line 146
    invoke-virtual {p3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    .line 147
    .local v0, "lp":Landroid/view/ViewGroup$LayoutParams;
    instance-of v1, v0, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;

    if-nez v1, :cond_c

    .line 148
    invoke-super {p0, p3, p4}, Landroid/support/v7/widget/LinearLayoutManager;->onInitializeAccessibilityNodeInfoForItem(Landroid/view/View;Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;)V

    .line 149
    return-void

    .line 151
    :cond_c
    move-object v1, v0

    check-cast v1, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;

    .line 152
    .local v1, "glp":Landroid/support/v7/widget/GridLayoutManager$LayoutParams;
    invoke-virtual {v1}, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->getViewLayoutPosition()I

    move-result v2

    invoke-direct {p0, p1, p2, v2}, Landroid/support/v7/widget/GridLayoutManager;->getSpanGroupIndex(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;I)I

    move-result v2

    .line 153
    .local v2, "spanGroupIndex":I
    iget v3, p0, Landroid/support/v7/widget/GridLayoutManager;->mOrientation:I

    const/4 v4, 0x0

    const/4 v5, 0x1

    if-nez v3, :cond_43

    .line 154
    invoke-virtual {v1}, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->getSpanIndex()I

    move-result v3

    invoke-virtual {v1}, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->getSpanSize()I

    move-result v6

    const/4 v7, 0x1

    iget v8, p0, Landroid/support/v7/widget/GridLayoutManager;->mSpanCount:I

    if-le v8, v5, :cond_34

    invoke-virtual {v1}, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->getSpanSize()I

    move-result v8

    iget v9, p0, Landroid/support/v7/widget/GridLayoutManager;->mSpanCount:I

    if-ne v8, v9, :cond_34

    move v8, v5

    goto :goto_35

    :cond_34
    move v8, v4

    :goto_35
    const/4 v9, 0x0

    move v4, v6

    move v5, v2

    move v6, v7

    move v7, v8

    move v8, v9

    invoke-static/range {v3 .. v8}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$CollectionItemInfoCompat;->obtain(IIIIZZ)Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$CollectionItemInfoCompat;

    move-result-object v3

    invoke-virtual {p4, v3}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->setCollectionItemInfo(Ljava/lang/Object;)V

    goto :goto_69

    .line 159
    :cond_43
    const/4 v6, 0x1

    invoke-virtual {v1}, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->getSpanIndex()I

    move-result v7

    invoke-virtual {v1}, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->getSpanSize()I

    move-result v8

    iget v3, p0, Landroid/support/v7/widget/GridLayoutManager;->mSpanCount:I

    if-le v3, v5, :cond_5a

    invoke-virtual {v1}, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->getSpanSize()I

    move-result v3

    iget v9, p0, Landroid/support/v7/widget/GridLayoutManager;->mSpanCount:I

    if-ne v3, v9, :cond_5a

    move v9, v5

    goto :goto_5b

    :cond_5a
    move v9, v4

    :goto_5b
    const/4 v10, 0x0

    move v3, v2

    move v4, v6

    move v5, v7

    move v6, v8

    move v7, v9

    move v8, v10

    invoke-static/range {v3 .. v8}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$CollectionItemInfoCompat;->obtain(IIIIZZ)Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$CollectionItemInfoCompat;

    move-result-object v3

    invoke-virtual {p4, v3}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->setCollectionItemInfo(Ljava/lang/Object;)V

    .line 164
    :goto_69
    return-void
.end method

.method public onItemsAdded(Landroid/support/v7/widget/RecyclerView;II)V
    .registers 5
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;
    .param p2, "positionStart"    # I
    .param p3, "itemCount"    # I

    .line 198
    iget-object v0, p0, Landroid/support/v7/widget/GridLayoutManager;->mSpanSizeLookup:Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;

    invoke-virtual {v0}, Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;->invalidateSpanIndexCache()V

    .line 199
    return-void
.end method

.method public onItemsChanged(Landroid/support/v7/widget/RecyclerView;)V
    .registers 3
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;

    .line 203
    iget-object v0, p0, Landroid/support/v7/widget/GridLayoutManager;->mSpanSizeLookup:Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;

    invoke-virtual {v0}, Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;->invalidateSpanIndexCache()V

    .line 204
    return-void
.end method

.method public onItemsMoved(Landroid/support/v7/widget/RecyclerView;III)V
    .registers 6
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;
    .param p2, "from"    # I
    .param p3, "to"    # I
    .param p4, "itemCount"    # I

    .line 219
    iget-object v0, p0, Landroid/support/v7/widget/GridLayoutManager;->mSpanSizeLookup:Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;

    invoke-virtual {v0}, Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;->invalidateSpanIndexCache()V

    .line 220
    return-void
.end method

.method public onItemsRemoved(Landroid/support/v7/widget/RecyclerView;II)V
    .registers 5
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;
    .param p2, "positionStart"    # I
    .param p3, "itemCount"    # I

    .line 208
    iget-object v0, p0, Landroid/support/v7/widget/GridLayoutManager;->mSpanSizeLookup:Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;

    invoke-virtual {v0}, Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;->invalidateSpanIndexCache()V

    .line 209
    return-void
.end method

.method public onItemsUpdated(Landroid/support/v7/widget/RecyclerView;IILjava/lang/Object;)V
    .registers 6
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;
    .param p2, "positionStart"    # I
    .param p3, "itemCount"    # I
    .param p4, "payload"    # Ljava/lang/Object;

    .line 214
    iget-object v0, p0, Landroid/support/v7/widget/GridLayoutManager;->mSpanSizeLookup:Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;

    invoke-virtual {v0}, Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;->invalidateSpanIndexCache()V

    .line 215
    return-void
.end method

.method public onLayoutChildren(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;)V
    .registers 4
    .param p1, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;
    .param p2, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .line 168
    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView$State;->isPreLayout()Z

    move-result v0

    if-eqz v0, :cond_9

    .line 169
    invoke-direct {p0}, Landroid/support/v7/widget/GridLayoutManager;->cachePreLayoutSpanMapping()V

    .line 171
    :cond_9
    invoke-super {p0, p1, p2}, Landroid/support/v7/widget/LinearLayoutManager;->onLayoutChildren(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;)V

    .line 175
    invoke-direct {p0}, Landroid/support/v7/widget/GridLayoutManager;->clearPreLayoutSpanMappingCache()V

    .line 176
    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView$State;->isPreLayout()Z

    move-result v0

    if-nez v0, :cond_18

    .line 177
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/v7/widget/GridLayoutManager;->mPendingSpanCountChange:Z

    .line 179
    :cond_18
    return-void
.end method

.method public setSpanCount(I)V
    .registers 5
    .param p1, "spanCount"    # I

    .line 643
    iget v0, p0, Landroid/support/v7/widget/GridLayoutManager;->mSpanCount:I

    if-ne p1, v0, :cond_5

    .line 644
    return-void

    .line 646
    :cond_5
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v7/widget/GridLayoutManager;->mPendingSpanCountChange:Z

    .line 647
    if-lt p1, v0, :cond_12

    .line 651
    iput p1, p0, Landroid/support/v7/widget/GridLayoutManager;->mSpanCount:I

    .line 652
    iget-object v0, p0, Landroid/support/v7/widget/GridLayoutManager;->mSpanSizeLookup:Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;

    invoke-virtual {v0}, Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;->invalidateSpanIndexCache()V

    .line 653
    return-void

    .line 648
    :cond_12
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Span count should be at least 1. Provided "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setSpanSizeLookup(Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;)V
    .registers 2
    .param p1, "spanSizeLookup"    # Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;

    .line 254
    iput-object p1, p0, Landroid/support/v7/widget/GridLayoutManager;->mSpanSizeLookup:Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;

    .line 255
    return-void
.end method

.method public setStackFromEnd(Z)V
    .registers 4
    .param p1, "stackFromEnd"    # Z

    .line 111
    if-nez p1, :cond_7

    .line 116
    const/4 v0, 0x0

    invoke-super {p0, v0}, Landroid/support/v7/widget/LinearLayoutManager;->setStackFromEnd(Z)V

    .line 117
    return-void

    .line 112
    :cond_7
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "GridLayoutManager does not support stack from end. Consider using reverse layout"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public supportsPredictiveItemAnimations()Z
    .registers 2

    .line 826
    iget-object v0, p0, Landroid/support/v7/widget/GridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/LinearLayoutManager$SavedState;

    if-nez v0, :cond_a

    iget-boolean v0, p0, Landroid/support/v7/widget/GridLayoutManager;->mPendingSpanCountChange:Z

    if-nez v0, :cond_a

    const/4 v0, 0x1

    goto :goto_b

    :cond_a
    const/4 v0, 0x0

    :goto_b
    return v0
.end method
