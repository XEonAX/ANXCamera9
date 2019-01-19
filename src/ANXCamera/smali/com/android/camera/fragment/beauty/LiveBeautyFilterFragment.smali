.class public Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;
.super Landroid/support/v4/app/Fragment;
.source "LiveBeautyFilterFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$FilterStillItemHolder;,
        Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$FilterItemHolder;,
        Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$FilterItemAdapter;,
        Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$EffectItemPadding;,
        Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$LiveFilterItem;
    }
.end annotation


# static fields
.field public static final LIVE_FILTER_NONE_ID:I

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private isAnimation:Z

.field private mCubicEaseOut:Lmiui/view/animation/CubicEaseOutInterpolator;

.field private mCurrentIndex:I

.field private mFilterItemAdapter:Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$FilterItemAdapter;

.field private mFilters:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$LiveFilterItem;",
            ">;"
        }
    .end annotation
.end field

.field private mHolderWidth:I

.field private mLastIndex:I

.field private mLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

.field private mRecyclerView:Landroid/support/v7/widget/RecyclerView;

.field private mTotalWidth:I

.field private mView:Landroid/view/View;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 48
    const-class v0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 47
    invoke-direct {p0}, Landroid/support/v4/app/Fragment;-><init>()V

    .line 52
    const/4 v0, -0x1

    iput v0, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->mLastIndex:I

    .line 53
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->mCurrentIndex:I

    .line 55
    iput-boolean v0, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->isAnimation:Z

    return-void
.end method

.method static synthetic access$000(Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;)Z
    .locals 0

    .line 47
    iget-boolean p0, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->isAnimation:Z

    return p0
.end method

.method static synthetic access$002(Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;Z)Z
    .locals 0

    .line 47
    iput-boolean p1, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->isAnimation:Z

    return p1
.end method

.method static synthetic access$100(Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;)Ljava/util/List;
    .locals 0

    .line 47
    iget-object p0, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->mFilters:Ljava/util/List;

    return-object p0
.end method

.method static synthetic access$200(Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;)I
    .locals 0

    .line 47
    iget p0, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->mCurrentIndex:I

    return p0
.end method

.method static synthetic access$300(Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;)I
    .locals 0

    .line 47
    iget p0, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->mLastIndex:I

    return p0
.end method

.method static synthetic access$400(Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;)Lmiui/view/animation/CubicEaseOutInterpolator;
    .locals 0

    .line 47
    iget-object p0, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->mCubicEaseOut:Lmiui/view/animation/CubicEaseOutInterpolator;

    return-object p0
.end method

.method private findIndex(I)I
    .locals 3

    .line 117
    const/4 v0, 0x0

    move v1, v0

    :goto_0
    iget-object v2, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->mFilters:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 118
    iget-object v2, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->mFilters:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$LiveFilterItem;

    iget v2, v2, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$LiveFilterItem;->id:I

    if-ne v2, p1, :cond_0

    .line 119
    return v1

    .line 117
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 122
    :cond_1
    return v0
.end method

.method private initData()V
    .locals 2

    .line 102
    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object v0

    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/camera/effect/EffectController;->getLiveFilterList(Landroid/content/Context;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->mFilters:Ljava/util/List;

    .line 103
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/runing/DataItemRunning;->getLiveFilter()I

    move-result v0

    .line 104
    invoke-direct {p0, v0}, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->findIndex(I)I

    move-result v0

    iput v0, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->mCurrentIndex:I

    .line 105
    return-void
.end method

.method private initView()V
    .locals 4

    .line 75
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->mView:Landroid/view/View;

    const v1, 0x7f0d0055

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/RecyclerView;

    iput-object v0, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    .line 76
    new-instance v0, Lmiui/view/animation/CubicEaseOutInterpolator;

    invoke-direct {v0}, Lmiui/view/animation/CubicEaseOutInterpolator;-><init>()V

    iput-object v0, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->mCubicEaseOut:Lmiui/view/animation/CubicEaseOutInterpolator;

    .line 77
    new-instance v0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$FilterItemAdapter;

    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$FilterItemAdapter;-><init>(Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;Landroid/content/Context;)V

    iput-object v0, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->mFilterItemAdapter:Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$FilterItemAdapter;

    .line 78
    new-instance v0, Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/support/v7/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->mLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    .line 79
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->mLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/LinearLayoutManager;->setOrientation(I)V

    .line 80
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView;->getRecycledViewPool()Landroid/support/v7/widget/RecyclerView$RecycledViewPool;

    move-result-object v0

    .line 81
    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object v2

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Lcom/android/camera/effect/EffectController;->getEffectCount(I)I

    move-result v2

    .line 80
    invoke-virtual {v0, v1, v2}, Landroid/support/v7/widget/RecyclerView$RecycledViewPool;->setMaxRecycledViews(II)V

    .line 82
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    iget-object v1, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->mLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    .line 83
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    new-instance v1, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$EffectItemPadding;

    invoke-direct {v1, p0}, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$EffectItemPadding;-><init>(Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;)V

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->addItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    .line 84
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    iget-object v1, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->mFilterItemAdapter:Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$FilterItemAdapter;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 85
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    new-instance v1, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$1;

    invoke-direct {v1, p0}, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$1;-><init>(Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;)V

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->addOnScrollListener(Landroid/support/v7/widget/RecyclerView$OnScrollListener;)V

    .line 92
    new-instance v0, Lcom/android/camera/fragment/DefaultItemAnimator;

    invoke-direct {v0}, Lcom/android/camera/fragment/DefaultItemAnimator;-><init>()V

    .line 93
    const-wide/16 v1, 0x96

    invoke-virtual {v0, v1, v2}, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->setChangeDuration(J)V

    .line 94
    invoke-virtual {v0, v1, v2}, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->setMoveDuration(J)V

    .line 95
    invoke-virtual {v0, v1, v2}, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->setAddDuration(J)V

    .line 96
    iget-object v1, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v1, v0}, Landroid/support/v7/widget/RecyclerView;->setItemAnimator(Landroid/support/v7/widget/RecyclerView$ItemAnimator;)V

    .line 97
    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    iput v0, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->mTotalWidth:I

    .line 98
    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0a0025

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->mHolderWidth:I

    .line 99
    return-void
.end method

.method private notifyItemChanged(II)V
    .locals 2

    .line 182
    const/4 v0, -0x1

    if-le p1, v0, :cond_0

    .line 183
    iget-object v1, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->mFilterItemAdapter:Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$FilterItemAdapter;

    invoke-virtual {v1, p1}, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$FilterItemAdapter;->notifyItemChanged(I)V

    .line 185
    :cond_0
    if-le p2, v0, :cond_1

    .line 186
    iget-object p1, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->mFilterItemAdapter:Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$FilterItemAdapter;

    invoke-virtual {p1, p2}, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$FilterItemAdapter;->notifyItemChanged(I)V

    .line 188
    :cond_1
    return-void
.end method

.method private onItemSelected(IZ)V
    .locals 3

    .line 157
    sget-object v0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onItemSelected: index = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", fromClick = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {v0, p2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 158
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p2

    .line 159
    const/16 v0, 0xa4

    invoke-virtual {p2, v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p2

    check-cast p2, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;

    .line 160
    if-nez p2, :cond_0

    .line 161
    sget-object p1, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->TAG:Ljava/lang/String;

    const-string p2, "onItemSelected: configChanges = null"

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 162
    return-void

    .line 165
    :cond_0
    :try_start_0
    invoke-direct {p0, p1}, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->selectItem(I)V
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 168
    goto :goto_0

    .line 166
    :catch_0
    move-exception p1

    .line 167
    sget-object p2, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "invalid filter id: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/NumberFormatException;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p2, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 169
    :goto_0
    return-void
.end method

.method private scrollIfNeed(I)V
    .locals 2

    .line 191
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->mLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {v0}, Landroid/support/v7/widget/LinearLayoutManager;->findFirstVisibleItemPosition()I

    move-result v0

    if-eq p1, v0, :cond_2

    iget-object v0, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->mLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    .line 192
    invoke-virtual {v0}, Landroid/support/v7/widget/LinearLayoutManager;->findFirstCompletelyVisibleItemPosition()I

    move-result v0

    if-ne p1, v0, :cond_0

    goto :goto_0

    .line 194
    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->mLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {v0}, Landroid/support/v7/widget/LinearLayoutManager;->findLastVisibleItemPosition()I

    move-result v0

    if-eq p1, v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->mLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    .line 195
    invoke-virtual {v0}, Landroid/support/v7/widget/LinearLayoutManager;->findLastCompletelyVisibleItemPosition()I

    move-result v0

    if-ne p1, v0, :cond_3

    .line 196
    :cond_1
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->mLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    add-int/lit8 p1, p1, 0x1

    iget-object v1, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->mFilterItemAdapter:Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$FilterItemAdapter;

    .line 197
    invoke-virtual {v1}, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$FilterItemAdapter;->getItemCount()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-static {p1, v1}, Ljava/lang/Math;->min(II)I

    move-result p1

    .line 196
    invoke-virtual {v0, p1}, Landroid/support/v7/widget/LinearLayoutManager;->scrollToPosition(I)V

    goto :goto_1

    .line 193
    :cond_2
    :goto_0
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->mLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    const/4 v1, 0x0

    add-int/lit8 p1, p1, -0x1

    invoke-static {v1, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/LinearLayoutManager;->scrollToPosition(I)V

    .line 199
    :cond_3
    :goto_1
    return-void
.end method

.method private selectItem(I)V
    .locals 1

    .line 172
    const/4 v0, -0x1

    if-eq p1, v0, :cond_0

    .line 173
    iget v0, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->mCurrentIndex:I

    iput v0, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->mLastIndex:I

    .line 174
    iput p1, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->mCurrentIndex:I

    .line 176
    invoke-direct {p0, p1}, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->scrollIfNeed(I)V

    .line 177
    iget p1, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->mLastIndex:I

    iget v0, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->mCurrentIndex:I

    invoke-direct {p0, p1, v0}, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->notifyItemChanged(II)V

    .line 179
    :cond_0
    return-void
.end method

.method private showSelected(Landroid/widget/ImageView;I)V
    .locals 7

    .line 376
    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0a0132

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v0

    .line 377
    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0a0133

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v1

    .line 380
    float-to-int v2, v0

    sget-object v3, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v2, v2, v3}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v2

    .line 381
    new-instance v3, Landroid/graphics/Canvas;

    invoke-direct {v3, v2}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 382
    new-instance v4, Landroid/graphics/Paint;

    invoke-direct {v4}, Landroid/graphics/Paint;-><init>()V

    .line 383
    const/high16 v5, -0x1000000

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setColor(I)V

    .line 384
    new-instance v5, Landroid/graphics/RectF;

    const/high16 v6, 0x40800000    # 4.0f

    invoke-direct {v5, v6, v6, v0, v0}, Landroid/graphics/RectF;-><init>(FFFF)V

    invoke-virtual {v3, v5, v1, v1, v4}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 386
    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-static {v0, p2}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object p2

    .line 387
    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    sget-object v3, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v0, v1, v3}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 388
    new-instance v1, Landroid/graphics/Canvas;

    invoke-direct {v1, v0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 389
    new-instance v3, Landroid/graphics/Paint;

    invoke-direct {v3}, Landroid/graphics/Paint;-><init>()V

    .line 391
    const/4 v4, 0x0

    invoke-virtual {v1, v2, v4, v4, v3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 392
    new-instance v2, Landroid/graphics/PorterDuffXfermode;

    sget-object v5, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {v2, v5}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    invoke-virtual {v3, v2}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 393
    invoke-virtual {v1, p2, v4, v4, v3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 394
    const/4 p2, 0x0

    invoke-virtual {v3, p2}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 396
    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 397
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 6

    .line 127
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView;->isEnabled()Z

    move-result v0

    if-nez v0, :cond_0

    .line 128
    return-void

    .line 131
    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa1

    .line 132
    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$CameraAction;

    .line 133
    if-eqz v0, :cond_1

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->isDoingAction()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 134
    return-void

    .line 137
    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    .line 138
    iget v0, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->mCurrentIndex:I

    if-ne v0, p1, :cond_2

    .line 139
    return-void

    .line 142
    :cond_2
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->isAnimation:Z

    .line 143
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    const/16 v2, 0xc9

    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v1

    check-cast v1, Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;

    .line 144
    const/4 v2, 0x1

    if-eqz v1, :cond_4

    .line 145
    sget-object v3, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "filter_path:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v5, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->mFilters:Ljava/util/List;

    invoke-interface {v5, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$LiveFilterItem;

    iget-object v5, v5, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$LiveFilterItem;->directoryName:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 146
    if-eqz p1, :cond_3

    .line 147
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->mFilters:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$LiveFilterItem;

    iget-object v0, v0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$LiveFilterItem;->directoryName:Ljava/lang/String;

    invoke-interface {v1, v2, v0}, Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;->setFilter(ZLjava/lang/String;)V

    goto :goto_0

    .line 149
    :cond_3
    const/4 v3, 0x0

    invoke-interface {v1, v0, v3}, Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;->setFilter(ZLjava/lang/String;)V

    .line 151
    :goto_0
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    iget-object v1, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->mFilters:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$LiveFilterItem;

    iget v1, v1, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$LiveFilterItem;->id:I

    invoke-virtual {v0, v1}, Lcom/android/camera/data/data/runing/DataItemRunning;->setLiveFilter(I)V

    .line 153
    :cond_4
    invoke-direct {p0, p1, v2}, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->onItemSelected(IZ)V

    .line 154
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 0
    .param p2    # Landroid/view/ViewGroup;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .line 66
    iget-object p1, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->mView:Landroid/view/View;

    if-nez p1, :cond_0

    .line 67
    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    const p2, 0x7f04003b

    const/4 p3, 0x0

    invoke-virtual {p1, p2, p3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->mView:Landroid/view/View;

    .line 68
    invoke-direct {p0}, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->initView()V

    .line 69
    invoke-direct {p0}, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->initData()V

    .line 71
    :cond_0
    iget-object p1, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->mView:Landroid/view/View;

    return-object p1
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 1
    .param p1    # Landroid/view/View;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .line 109
    invoke-super {p0, p1, p2}, Landroid/support/v4/app/Fragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 110
    iget p1, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->mTotalWidth:I

    div-int/lit8 p1, p1, 0x2

    iget p2, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->mHolderWidth:I

    div-int/lit8 p2, p2, 0x2

    sub-int/2addr p1, p2

    .line 111
    iget-object p2, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->mFilterItemAdapter:Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$FilterItemAdapter;

    invoke-virtual {p2}, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$FilterItemAdapter;->notifyDataSetChanged()V

    .line 112
    iget-object p2, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->mLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    iget v0, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->mCurrentIndex:I

    invoke-virtual {p2, v0, p1}, Landroid/support/v7/widget/LinearLayoutManager;->scrollToPositionWithOffset(II)V

    .line 113
    return-void
.end method
