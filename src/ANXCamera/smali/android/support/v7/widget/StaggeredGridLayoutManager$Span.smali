.class Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;
.super Ljava/lang/Object;
.source "StaggeredGridLayoutManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v7/widget/StaggeredGridLayoutManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "Span"
.end annotation


# static fields
.field static final INVALID_LINE:I = -0x80000000


# instance fields
.field mCachedEnd:I

.field mCachedStart:I

.field mDeletedSize:I

.field final mIndex:I

.field private mViews:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Landroid/support/v7/widget/StaggeredGridLayoutManager;


# direct methods
.method private constructor <init>(Landroid/support/v7/widget/StaggeredGridLayoutManager;I)V
    .registers 3
    .param p2, "index"    # I

    .line 2103
    iput-object p1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->this$0:Landroid/support/v7/widget/StaggeredGridLayoutManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2097
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mViews:Ljava/util/ArrayList;

    .line 2098
    const/high16 p1, -0x80000000

    iput p1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mCachedStart:I

    .line 2099
    iput p1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mCachedEnd:I

    .line 2100
    const/4 p1, 0x0

    iput p1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mDeletedSize:I

    .line 2104
    iput p2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mIndex:I

    .line 2105
    return-void
.end method

.method synthetic constructor <init>(Landroid/support/v7/widget/StaggeredGridLayoutManager;ILandroid/support/v7/widget/StaggeredGridLayoutManager$1;)V
    .registers 4
    .param p1, "x0"    # Landroid/support/v7/widget/StaggeredGridLayoutManager;
    .param p2, "x1"    # I
    .param p3, "x2"    # Landroid/support/v7/widget/StaggeredGridLayoutManager$1;

    .line 2094
    invoke-direct {p0, p1, p2}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;-><init>(Landroid/support/v7/widget/StaggeredGridLayoutManager;I)V

    return-void
.end method

.method static synthetic access$300(Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;)Ljava/util/ArrayList;
    .registers 2
    .param p0, "x0"    # Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    .line 2094
    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mViews:Ljava/util/ArrayList;

    return-object v0
.end method


# virtual methods
.method appendToSpan(Landroid/view/View;)V
    .registers 6
    .param p1, "view"    # Landroid/view/View;

    .line 2188
    invoke-virtual {p0, p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->getLayoutParams(Landroid/view/View;)Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;

    move-result-object v0

    .line 2189
    .local v0, "lp":Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;
    iput-object p0, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->mSpan:Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    .line 2190
    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mViews:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2191
    const/high16 v1, -0x80000000

    iput v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mCachedEnd:I

    .line 2192
    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mViews:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v3, 0x1

    if-ne v2, v3, :cond_1a

    .line 2193
    iput v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mCachedStart:I

    .line 2195
    :cond_1a
    invoke-virtual {v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->isItemRemoved()Z

    move-result v1

    if-nez v1, :cond_26

    invoke-virtual {v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->isItemChanged()Z

    move-result v1

    if-eqz v1, :cond_33

    .line 2196
    :cond_26
    iget v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mDeletedSize:I

    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->this$0:Landroid/support/v7/widget/StaggeredGridLayoutManager;

    iget-object v2, v2, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v2, p1}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedMeasurement(Landroid/view/View;)I

    move-result v2

    add-int/2addr v1, v2

    iput v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mDeletedSize:I

    .line 2198
    :cond_33
    return-void
.end method

.method cacheReferenceLineAndClear(ZI)V
    .registers 6
    .param p1, "reverseLayout"    # Z
    .param p2, "offset"    # I

    .line 2203
    const/high16 v0, -0x80000000

    if-eqz p1, :cond_9

    .line 2204
    invoke-virtual {p0, v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->getEndLine(I)I

    move-result v1

    .local v1, "reference":I
    goto :goto_d

    .line 2206
    .end local v1    # "reference":I
    :cond_9
    invoke-virtual {p0, v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->getStartLine(I)I

    move-result v1

    .line 2208
    .restart local v1    # "reference":I
    :goto_d
    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->clear()V

    .line 2209
    if-ne v1, v0, :cond_13

    .line 2210
    return-void

    .line 2212
    :cond_13
    if-eqz p1, :cond_1f

    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->this$0:Landroid/support/v7/widget/StaggeredGridLayoutManager;

    iget-object v2, v2, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v2}, Landroid/support/v7/widget/OrientationHelper;->getEndAfterPadding()I

    move-result v2

    if-lt v1, v2, :cond_2b

    :cond_1f
    if-nez p1, :cond_2c

    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->this$0:Landroid/support/v7/widget/StaggeredGridLayoutManager;

    iget-object v2, v2, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v2}, Landroid/support/v7/widget/OrientationHelper;->getStartAfterPadding()I

    move-result v2

    if-le v1, v2, :cond_2c

    .line 2214
    :cond_2b
    return-void

    .line 2216
    :cond_2c
    if-eq p2, v0, :cond_2f

    .line 2217
    add-int/2addr v1, p2

    .line 2219
    :cond_2f
    iput v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mCachedEnd:I

    iput v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mCachedStart:I

    .line 2220
    return-void
.end method

.method calculateCachedEnd()V
    .registers 6

    .line 2153
    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mViews:Ljava/util/ArrayList;

    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mViews:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x1

    sub-int/2addr v1, v2

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    .line 2154
    .local v0, "endView":Landroid/view/View;
    invoke-virtual {p0, v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->getLayoutParams(Landroid/view/View;)Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;

    move-result-object v1

    .line 2155
    .local v1, "lp":Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;
    iget-object v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->this$0:Landroid/support/v7/widget/StaggeredGridLayoutManager;

    iget-object v3, v3, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v3, v0}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedEnd(Landroid/view/View;)I

    move-result v3

    iput v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mCachedEnd:I

    .line 2156
    iget-boolean v3, v1, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->mFullSpan:Z

    if-eqz v3, :cond_3f

    .line 2157
    iget-object v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->this$0:Landroid/support/v7/widget/StaggeredGridLayoutManager;

    iget-object v3, v3, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLazySpanLookup:Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;

    invoke-virtual {v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->getViewLayoutPosition()I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;->getFullSpanItem(I)Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;

    move-result-object v3

    .line 2159
    .local v3, "fsi":Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;
    if-eqz v3, :cond_3f

    iget v4, v3, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;->mGapDir:I

    if-ne v4, v2, :cond_3f

    .line 2160
    iget v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mCachedEnd:I

    iget v4, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mIndex:I

    invoke-virtual {v3, v4}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;->getGapForSpan(I)I

    move-result v4

    add-int/2addr v2, v4

    iput v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mCachedEnd:I

    .line 2163
    .end local v3    # "fsi":Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;
    :cond_3f
    return-void
.end method

.method calculateCachedStart()V
    .registers 6

    .line 2119
    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mViews:Ljava/util/ArrayList;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    .line 2120
    .local v0, "startView":Landroid/view/View;
    invoke-virtual {p0, v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->getLayoutParams(Landroid/view/View;)Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;

    move-result-object v1

    .line 2121
    .local v1, "lp":Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;
    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->this$0:Landroid/support/v7/widget/StaggeredGridLayoutManager;

    iget-object v2, v2, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v2, v0}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedStart(Landroid/view/View;)I

    move-result v2

    iput v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mCachedStart:I

    .line 2122
    iget-boolean v2, v1, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->mFullSpan:Z

    if-eqz v2, :cond_39

    .line 2123
    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->this$0:Landroid/support/v7/widget/StaggeredGridLayoutManager;

    iget-object v2, v2, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLazySpanLookup:Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;

    invoke-virtual {v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->getViewLayoutPosition()I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;->getFullSpanItem(I)Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;

    move-result-object v2

    .line 2125
    .local v2, "fsi":Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;
    if-eqz v2, :cond_39

    iget v3, v2, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;->mGapDir:I

    const/4 v4, -0x1

    if-ne v3, v4, :cond_39

    .line 2126
    iget v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mCachedStart:I

    iget v4, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mIndex:I

    invoke-virtual {v2, v4}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;->getGapForSpan(I)I

    move-result v4

    sub-int/2addr v3, v4

    iput v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mCachedStart:I

    .line 2129
    .end local v2    # "fsi":Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;
    :cond_39
    return-void
.end method

.method clear()V
    .registers 2

    .line 2223
    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mViews:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 2224
    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->invalidateCache()V

    .line 2225
    const/4 v0, 0x0

    iput v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mDeletedSize:I

    .line 2226
    return-void
.end method

.method public findFirstCompletelyVisibleItemPosition()I
    .registers 4

    .line 2327
    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->this$0:Landroid/support/v7/widget/StaggeredGridLayoutManager;

    # getter for: Landroid/support/v7/widget/StaggeredGridLayoutManager;->mReverseLayout:Z
    invoke-static {v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->access$600(Landroid/support/v7/widget/StaggeredGridLayoutManager;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_16

    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mViews:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    sub-int/2addr v0, v1

    const/4 v2, -0x1

    :goto_11
    invoke-virtual {p0, v0, v2, v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->findOneVisibleChild(IIZ)I

    move-result v0

    goto :goto_1e

    :cond_16
    const/4 v0, 0x0

    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mViews:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    goto :goto_11

    :goto_1e
    return v0
.end method

.method public findFirstVisibleItemPosition()I
    .registers 4

    .line 2321
    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->this$0:Landroid/support/v7/widget/StaggeredGridLayoutManager;

    # getter for: Landroid/support/v7/widget/StaggeredGridLayoutManager;->mReverseLayout:Z
    invoke-static {v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->access$600(Landroid/support/v7/widget/StaggeredGridLayoutManager;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_17

    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mViews:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    const/4 v2, -0x1

    invoke-virtual {p0, v0, v2, v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->findOneVisibleChild(IIZ)I

    move-result v0

    goto :goto_21

    :cond_17
    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mViews:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    invoke-virtual {p0, v1, v0, v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->findOneVisibleChild(IIZ)I

    move-result v0

    :goto_21
    return v0
.end method

.method public findLastCompletelyVisibleItemPosition()I
    .registers 4

    .line 2339
    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->this$0:Landroid/support/v7/widget/StaggeredGridLayoutManager;

    # getter for: Landroid/support/v7/widget/StaggeredGridLayoutManager;->mReverseLayout:Z
    invoke-static {v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->access$600(Landroid/support/v7/widget/StaggeredGridLayoutManager;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_15

    const/4 v0, 0x0

    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mViews:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    :goto_10
    invoke-virtual {p0, v0, v2, v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->findOneVisibleChild(IIZ)I

    move-result v0

    goto :goto_1e

    :cond_15
    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mViews:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    sub-int/2addr v0, v1

    const/4 v2, -0x1

    goto :goto_10

    :goto_1e
    return v0
.end method

.method public findLastVisibleItemPosition()I
    .registers 4

    .line 2333
    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->this$0:Landroid/support/v7/widget/StaggeredGridLayoutManager;

    # getter for: Landroid/support/v7/widget/StaggeredGridLayoutManager;->mReverseLayout:Z
    invoke-static {v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->access$600(Landroid/support/v7/widget/StaggeredGridLayoutManager;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_14

    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mViews:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    invoke-virtual {p0, v1, v0, v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->findOneVisibleChild(IIZ)I

    move-result v0

    goto :goto_21

    :cond_14
    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mViews:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    const/4 v2, -0x1

    invoke-virtual {p0, v0, v2, v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->findOneVisibleChild(IIZ)I

    move-result v0

    :goto_21
    return v0
.end method

.method findOneVisibleChild(IIZ)I
    .registers 12
    .param p1, "fromIndex"    # I
    .param p2, "toIndex"    # I
    .param p3, "completelyVisible"    # Z

    .line 2345
    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->this$0:Landroid/support/v7/widget/StaggeredGridLayoutManager;

    iget-object v0, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v0}, Landroid/support/v7/widget/OrientationHelper;->getStartAfterPadding()I

    move-result v0

    .line 2346
    .local v0, "start":I
    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->this$0:Landroid/support/v7/widget/StaggeredGridLayoutManager;

    iget-object v1, v1, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v1}, Landroid/support/v7/widget/OrientationHelper;->getEndAfterPadding()I

    move-result v1

    .line 2347
    .local v1, "end":I
    const/4 v2, -0x1

    if-le p2, p1, :cond_15

    const/4 v3, 0x1

    goto :goto_16

    :cond_15
    move v3, v2

    .line 2348
    .local v3, "next":I
    :goto_16
    move v4, p1

    .local v4, "i":I
    :goto_17
    if-eq v4, p2, :cond_4b

    .line 2349
    iget-object v5, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mViews:Ljava/util/ArrayList;

    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/view/View;

    .line 2350
    .local v5, "child":Landroid/view/View;
    iget-object v6, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->this$0:Landroid/support/v7/widget/StaggeredGridLayoutManager;

    iget-object v6, v6, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v6, v5}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedStart(Landroid/view/View;)I

    move-result v6

    .line 2351
    .local v6, "childStart":I
    iget-object v7, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->this$0:Landroid/support/v7/widget/StaggeredGridLayoutManager;

    iget-object v7, v7, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v7, v5}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedEnd(Landroid/view/View;)I

    move-result v7

    .line 2352
    .local v7, "childEnd":I
    if-ge v6, v1, :cond_49

    if-le v7, v0, :cond_49

    .line 2353
    if-eqz p3, :cond_42

    .line 2354
    if-lt v6, v0, :cond_49

    if-gt v7, v1, :cond_49

    .line 2355
    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->this$0:Landroid/support/v7/widget/StaggeredGridLayoutManager;

    invoke-virtual {v2, v5}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getPosition(Landroid/view/View;)I

    move-result v2

    return v2

    .line 2358
    :cond_42
    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->this$0:Landroid/support/v7/widget/StaggeredGridLayoutManager;

    invoke-virtual {v2, v5}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getPosition(Landroid/view/View;)I

    move-result v2

    return v2

    .line 2348
    .end local v5    # "child":Landroid/view/View;
    .end local v6    # "childStart":I
    .end local v7    # "childEnd":I
    :cond_49
    add-int/2addr v4, v3

    goto :goto_17

    .line 2362
    .end local v4    # "i":I
    :cond_4b
    return v2
.end method

.method public getDeletedSize()I
    .registers 2

    .line 2265
    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mDeletedSize:I

    return v0
.end method

.method getEndLine()I
    .registers 3

    .line 2167
    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mCachedEnd:I

    const/high16 v1, -0x80000000

    if-eq v0, v1, :cond_9

    .line 2168
    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mCachedEnd:I

    return v0

    .line 2170
    :cond_9
    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->calculateCachedEnd()V

    .line 2171
    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mCachedEnd:I

    return v0
.end method

.method getEndLine(I)I
    .registers 4
    .param p1, "def"    # I

    .line 2141
    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mCachedEnd:I

    const/high16 v1, -0x80000000

    if-eq v0, v1, :cond_9

    .line 2142
    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mCachedEnd:I

    return v0

    .line 2144
    :cond_9
    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mViews:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 2145
    .local v0, "size":I
    if-nez v0, :cond_12

    .line 2146
    return p1

    .line 2148
    :cond_12
    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->calculateCachedEnd()V

    .line 2149
    iget v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mCachedEnd:I

    return v1
.end method

.method getLayoutParams(Landroid/view/View;)Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;
    .registers 3
    .param p1, "view"    # Landroid/view/View;

    .line 2269
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;

    return-object v0
.end method

.method getNormalizedOffset(III)I
    .registers 6
    .param p1, "dt"    # I
    .param p2, "targetStart"    # I
    .param p3, "targetEnd"    # I

    .line 2283
    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mViews:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_a

    .line 2284
    return v1

    .line 2286
    :cond_a
    if-gez p1, :cond_1b

    .line 2287
    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->getEndLine()I

    move-result v0

    sub-int/2addr v0, p3

    .line 2288
    .local v0, "endSpace":I
    if-gtz v0, :cond_14

    .line 2289
    return v1

    .line 2291
    :cond_14
    neg-int v1, p1

    if-le v1, v0, :cond_19

    neg-int v1, v0

    goto :goto_1a

    :cond_19
    move v1, p1

    :goto_1a
    return v1

    .line 2293
    .end local v0    # "endSpace":I
    :cond_1b
    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->getStartLine()I

    move-result v0

    sub-int v0, p2, v0

    .line 2294
    .local v0, "startSpace":I
    if-gtz v0, :cond_24

    .line 2295
    return v1

    .line 2297
    :cond_24
    if-ge v0, p1, :cond_28

    move v1, v0

    goto :goto_29

    :cond_28
    move v1, p1

    :goto_29
    return v1
.end method

.method getStartLine()I
    .registers 3

    .line 2133
    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mCachedStart:I

    const/high16 v1, -0x80000000

    if-eq v0, v1, :cond_9

    .line 2134
    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mCachedStart:I

    return v0

    .line 2136
    :cond_9
    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->calculateCachedStart()V

    .line 2137
    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mCachedStart:I

    return v0
.end method

.method getStartLine(I)I
    .registers 4
    .param p1, "def"    # I

    .line 2108
    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mCachedStart:I

    const/high16 v1, -0x80000000

    if-eq v0, v1, :cond_9

    .line 2109
    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mCachedStart:I

    return v0

    .line 2111
    :cond_9
    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mViews:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-nez v0, :cond_12

    .line 2112
    return p1

    .line 2114
    :cond_12
    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->calculateCachedStart()V

    .line 2115
    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mCachedStart:I

    return v0
.end method

.method invalidateCache()V
    .registers 2

    .line 2229
    const/high16 v0, -0x80000000

    iput v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mCachedStart:I

    .line 2230
    iput v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mCachedEnd:I

    .line 2231
    return-void
.end method

.method isEmpty(II)Z
    .registers 8
    .param p1, "start"    # I
    .param p2, "end"    # I

    .line 2309
    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mViews:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 2310
    .local v0, "count":I
    const/4 v1, 0x0

    move v2, v1

    .local v2, "i":I
    :goto_8
    if-ge v2, v0, :cond_2a

    .line 2311
    iget-object v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mViews:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/View;

    .line 2312
    .local v3, "view":Landroid/view/View;
    iget-object v4, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->this$0:Landroid/support/v7/widget/StaggeredGridLayoutManager;

    iget-object v4, v4, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v4, v3}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedStart(Landroid/view/View;)I

    move-result v4

    if-ge v4, p2, :cond_27

    iget-object v4, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->this$0:Landroid/support/v7/widget/StaggeredGridLayoutManager;

    iget-object v4, v4, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v4, v3}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedEnd(Landroid/view/View;)I

    move-result v4

    if-le v4, p1, :cond_27

    .line 2314
    return v1

    .line 2310
    .end local v3    # "view":Landroid/view/View;
    :cond_27
    add-int/lit8 v2, v2, 0x1

    goto :goto_8

    .line 2317
    .end local v2    # "i":I
    :cond_2a
    const/4 v1, 0x1

    return v1
.end method

.method onOffset(I)V
    .registers 4
    .param p1, "dt"    # I

    .line 2273
    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mCachedStart:I

    const/high16 v1, -0x80000000

    if-eq v0, v1, :cond_b

    .line 2274
    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mCachedStart:I

    add-int/2addr v0, p1

    iput v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mCachedStart:I

    .line 2276
    :cond_b
    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mCachedEnd:I

    if-eq v0, v1, :cond_14

    .line 2277
    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mCachedEnd:I

    add-int/2addr v0, p1

    iput v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mCachedEnd:I

    .line 2279
    :cond_14
    return-void
.end method

.method popEnd()V
    .registers 6

    .line 2238
    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mViews:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 2239
    .local v0, "size":I
    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mViews:Ljava/util/ArrayList;

    add-int/lit8 v2, v0, -0x1

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    .line 2240
    .local v1, "end":Landroid/view/View;
    invoke-virtual {p0, v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->getLayoutParams(Landroid/view/View;)Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;

    move-result-object v2

    .line 2241
    .local v2, "lp":Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;
    const/4 v3, 0x0

    iput-object v3, v2, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->mSpan:Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    .line 2242
    invoke-virtual {v2}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->isItemRemoved()Z

    move-result v3

    if-nez v3, :cond_23

    invoke-virtual {v2}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->isItemChanged()Z

    move-result v3

    if-eqz v3, :cond_30

    .line 2243
    :cond_23
    iget v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mDeletedSize:I

    iget-object v4, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->this$0:Landroid/support/v7/widget/StaggeredGridLayoutManager;

    iget-object v4, v4, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v4, v1}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedMeasurement(Landroid/view/View;)I

    move-result v4

    sub-int/2addr v3, v4

    iput v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mDeletedSize:I

    .line 2245
    :cond_30
    const/high16 v3, -0x80000000

    const/4 v4, 0x1

    if-ne v0, v4, :cond_37

    .line 2246
    iput v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mCachedStart:I

    .line 2248
    :cond_37
    iput v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mCachedEnd:I

    .line 2249
    return-void
.end method

.method popStart()V
    .registers 6

    .line 2252
    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mViews:Ljava/util/ArrayList;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    .line 2253
    .local v0, "start":Landroid/view/View;
    invoke-virtual {p0, v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->getLayoutParams(Landroid/view/View;)Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;

    move-result-object v1

    .line 2254
    .local v1, "lp":Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;
    const/4 v2, 0x0

    iput-object v2, v1, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->mSpan:Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    .line 2255
    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mViews:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/high16 v3, -0x80000000

    if-nez v2, :cond_1c

    .line 2256
    iput v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mCachedEnd:I

    .line 2258
    :cond_1c
    invoke-virtual {v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->isItemRemoved()Z

    move-result v2

    if-nez v2, :cond_28

    invoke-virtual {v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->isItemChanged()Z

    move-result v2

    if-eqz v2, :cond_35

    .line 2259
    :cond_28
    iget v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mDeletedSize:I

    iget-object v4, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->this$0:Landroid/support/v7/widget/StaggeredGridLayoutManager;

    iget-object v4, v4, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v4, v0}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedMeasurement(Landroid/view/View;)I

    move-result v4

    sub-int/2addr v2, v4

    iput v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mDeletedSize:I

    .line 2261
    :cond_35
    iput v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mCachedStart:I

    .line 2262
    return-void
.end method

.method prependToSpan(Landroid/view/View;)V
    .registers 6
    .param p1, "view"    # Landroid/view/View;

    .line 2175
    invoke-virtual {p0, p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->getLayoutParams(Landroid/view/View;)Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;

    move-result-object v0

    .line 2176
    .local v0, "lp":Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;
    iput-object p0, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->mSpan:Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    .line 2177
    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mViews:Ljava/util/ArrayList;

    const/4 v2, 0x0

    invoke-virtual {v1, v2, p1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 2178
    const/high16 v1, -0x80000000

    iput v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mCachedStart:I

    .line 2179
    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mViews:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v3, 0x1

    if-ne v2, v3, :cond_1b

    .line 2180
    iput v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mCachedEnd:I

    .line 2182
    :cond_1b
    invoke-virtual {v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->isItemRemoved()Z

    move-result v1

    if-nez v1, :cond_27

    invoke-virtual {v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->isItemChanged()Z

    move-result v1

    if-eqz v1, :cond_34

    .line 2183
    :cond_27
    iget v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mDeletedSize:I

    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->this$0:Landroid/support/v7/widget/StaggeredGridLayoutManager;

    iget-object v2, v2, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v2, p1}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedMeasurement(Landroid/view/View;)I

    move-result v2

    add-int/2addr v1, v2

    iput v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mDeletedSize:I

    .line 2185
    :cond_34
    return-void
.end method

.method setLine(I)V
    .registers 2
    .param p1, "line"    # I

    .line 2234
    iput p1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mCachedStart:I

    iput p1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mCachedEnd:I

    .line 2235
    return-void
.end method
