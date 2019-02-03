.class public Lcom/android/camera/fragment/FragmentLighting;
.super Lcom/android/camera/fragment/BaseFragment;
.source "FragmentLighting.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/fragment/FragmentLighting$LightingAdapter;
    }
.end annotation


# instance fields
.field private mComponentRunningLighting:Lcom/android/camera/data/data/runing/ComponentRunningLighting;

.field private mCurrentIndex:I

.field private mHolderWidth:I

.field private mLastIndex:I

.field private mLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

.field private mLightingAdapter:Lcom/android/camera/fragment/FragmentLighting$LightingAdapter;

.field private mRecyclerView:Landroid/support/v7/widget/RecyclerView;

.field private mTotalWidth:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 28
    invoke-direct {p0}, Lcom/android/camera/fragment/BaseFragment;-><init>()V

    .line 34
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera/fragment/FragmentLighting;->mLastIndex:I

    .line 35
    iput v0, p0, Lcom/android/camera/fragment/FragmentLighting;->mCurrentIndex:I

    return-void
.end method

.method private notifyItemChanged(II)V
    .locals 2

    .line 181
    const/4 v0, -0x1

    if-le p1, v0, :cond_0

    .line 182
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentLighting;->mLightingAdapter:Lcom/android/camera/fragment/FragmentLighting$LightingAdapter;

    invoke-virtual {v1, p1}, Lcom/android/camera/fragment/FragmentLighting$LightingAdapter;->notifyItemChanged(I)V

    .line 184
    :cond_0
    if-le p2, v0, :cond_1

    .line 185
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentLighting;->mLightingAdapter:Lcom/android/camera/fragment/FragmentLighting$LightingAdapter;

    invoke-virtual {p1, p2}, Lcom/android/camera/fragment/FragmentLighting$LightingAdapter;->notifyItemChanged(I)V

    .line 187
    :cond_1
    return-void
.end method

.method private onItemSelected(IZ)V
    .locals 4

    .line 156
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p2

    .line 157
    const/16 v0, 0xa4

    invoke-virtual {p2, v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p2

    check-cast p2, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;

    .line 159
    if-nez p2, :cond_0

    .line 160
    return-void

    .line 162
    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentLighting;->mComponentRunningLighting:Lcom/android/camera/data/data/runing/ComponentRunningLighting;

    iget v1, p0, Lcom/android/camera/fragment/FragmentLighting;->mCurrentMode:I

    invoke-virtual {v0, v1}, Lcom/android/camera/data/data/runing/ComponentRunningLighting;->getComponentValue(I)Ljava/lang/String;

    move-result-object v0

    .line 163
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentLighting;->mComponentRunningLighting:Lcom/android/camera/data/data/runing/ComponentRunningLighting;

    invoke-virtual {v1}, Lcom/android/camera/data/data/runing/ComponentRunningLighting;->getItems()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/camera/data/data/ComponentDataItem;

    iget-object v1, v1, Lcom/android/camera/data/data/ComponentDataItem;->mValue:Ljava/lang/String;

    .line 165
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 166
    return-void

    .line 169
    :cond_1
    iget-object v2, p0, Lcom/android/camera/fragment/FragmentLighting;->mComponentRunningLighting:Lcom/android/camera/data/data/runing/ComponentRunningLighting;

    iget v3, p0, Lcom/android/camera/fragment/FragmentLighting;->mCurrentMode:I

    invoke-virtual {v2, v3, v1}, Lcom/android/camera/data/data/runing/ComponentRunningLighting;->setComponentValue(ILjava/lang/String;)V

    .line 170
    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-interface {p2, v2, v0, v1, v3}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->setLighting(ZLjava/lang/String;Ljava/lang/String;Z)V

    .line 172
    iget p2, p0, Lcom/android/camera/fragment/FragmentLighting;->mCurrentIndex:I

    iput p2, p0, Lcom/android/camera/fragment/FragmentLighting;->mLastIndex:I

    .line 173
    iput p1, p0, Lcom/android/camera/fragment/FragmentLighting;->mCurrentIndex:I

    .line 175
    invoke-direct {p0, p1}, Lcom/android/camera/fragment/FragmentLighting;->scrollIfNeed(I)V

    .line 176
    iget p1, p0, Lcom/android/camera/fragment/FragmentLighting;->mLastIndex:I

    iget p2, p0, Lcom/android/camera/fragment/FragmentLighting;->mCurrentIndex:I

    invoke-direct {p0, p1, p2}, Lcom/android/camera/fragment/FragmentLighting;->notifyItemChanged(II)V

    .line 177
    return-void
.end method

.method private scrollIfNeed(I)V
    .locals 2

    .line 191
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentLighting;->mLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {v0}, Landroid/support/v7/widget/LinearLayoutManager;->findFirstVisibleItemPosition()I

    move-result v0

    if-eq p1, v0, :cond_2

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentLighting;->mLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    .line 192
    invoke-virtual {v0}, Landroid/support/v7/widget/LinearLayoutManager;->findFirstCompletelyVisibleItemPosition()I

    move-result v0

    if-ne p1, v0, :cond_0

    goto :goto_0

    .line 194
    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentLighting;->mLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {v0}, Landroid/support/v7/widget/LinearLayoutManager;->findLastVisibleItemPosition()I

    move-result v0

    if-eq p1, v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentLighting;->mLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    .line 195
    invoke-virtual {v0}, Landroid/support/v7/widget/LinearLayoutManager;->findLastCompletelyVisibleItemPosition()I

    move-result v0

    if-ne p1, v0, :cond_3

    .line 196
    :cond_1
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentLighting;->mLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    add-int/lit8 p1, p1, 0x1

    iget-object v1, p0, Lcom/android/camera/fragment/FragmentLighting;->mLightingAdapter:Lcom/android/camera/fragment/FragmentLighting$LightingAdapter;

    .line 197
    invoke-virtual {v1}, Lcom/android/camera/fragment/FragmentLighting$LightingAdapter;->getItemCount()I

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
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentLighting;->mLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

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

.method private setItemInCenter(I)V
    .locals 2

    .line 123
    iput p1, p0, Lcom/android/camera/fragment/FragmentLighting;->mCurrentIndex:I

    iput p1, p0, Lcom/android/camera/fragment/FragmentLighting;->mLastIndex:I

    .line 124
    iget v0, p0, Lcom/android/camera/fragment/FragmentLighting;->mTotalWidth:I

    div-int/lit8 v0, v0, 0x2

    iget v1, p0, Lcom/android/camera/fragment/FragmentLighting;->mHolderWidth:I

    div-int/lit8 v1, v1, 0x2

    sub-int/2addr v0, v1

    .line 125
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentLighting;->mLightingAdapter:Lcom/android/camera/fragment/FragmentLighting$LightingAdapter;

    invoke-virtual {v1}, Lcom/android/camera/fragment/FragmentLighting$LightingAdapter;->notifyDataSetChanged()V

    .line 126
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentLighting;->mLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {v1, p1, v0}, Landroid/support/v7/widget/LinearLayoutManager;->scrollToPositionWithOffset(II)V

    .line 127
    return-void
.end method


# virtual methods
.method public getFragmentInto()I
    .locals 1

    .line 75
    const/16 v0, 0xff7

    return v0
.end method

.method protected getLayoutResourceId()I
    .locals 1

    .line 70
    const v0, 0x7f04001b

    return v0
.end method

.method protected initView(Landroid/view/View;)V
    .locals 3

    .line 42
    const v0, 0x7f0d0058

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/support/v7/widget/RecyclerView;

    iput-object p1, p0, Lcom/android/camera/fragment/FragmentLighting;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    .line 43
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/data/data/runing/DataItemRunning;->getComponentRunningLighting()Lcom/android/camera/data/data/runing/ComponentRunningLighting;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/fragment/FragmentLighting;->mComponentRunningLighting:Lcom/android/camera/data/data/runing/ComponentRunningLighting;

    .line 44
    new-instance p1, Lcom/android/camera/fragment/FragmentLighting$LightingAdapter;

    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentLighting;->getContext()Landroid/content/Context;

    move-result-object v0

    iget v1, p0, Lcom/android/camera/fragment/FragmentLighting;->mCurrentMode:I

    iget-object v2, p0, Lcom/android/camera/fragment/FragmentLighting;->mComponentRunningLighting:Lcom/android/camera/data/data/runing/ComponentRunningLighting;

    invoke-direct {p1, v0, v1, p0, v2}, Lcom/android/camera/fragment/FragmentLighting$LightingAdapter;-><init>(Landroid/content/Context;ILandroid/view/View$OnClickListener;Lcom/android/camera/data/data/runing/ComponentRunningLighting;)V

    iput-object p1, p0, Lcom/android/camera/fragment/FragmentLighting;->mLightingAdapter:Lcom/android/camera/fragment/FragmentLighting$LightingAdapter;

    .line 45
    new-instance p1, Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentLighting;->getContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x0

    invoke-direct {p1, v0, v1, v1}, Landroid/support/v7/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    iput-object p1, p0, Lcom/android/camera/fragment/FragmentLighting;->mLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    .line 47
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentLighting;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentLighting;->mLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {p1, v0}, Landroid/support/v7/widget/RecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    .line 48
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentLighting;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentLighting;->mLightingAdapter:Lcom/android/camera/fragment/FragmentLighting$LightingAdapter;

    invoke-virtual {p1, v0}, Landroid/support/v7/widget/RecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 50
    new-instance p1, Lcom/android/camera/fragment/DefaultItemAnimator;

    invoke-direct {p1}, Lcom/android/camera/fragment/DefaultItemAnimator;-><init>()V

    .line 51
    const-wide/16 v0, 0x96

    invoke-virtual {p1, v0, v1}, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->setChangeDuration(J)V

    .line 52
    invoke-virtual {p1, v0, v1}, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->setMoveDuration(J)V

    .line 53
    invoke-virtual {p1, v0, v1}, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->setAddDuration(J)V

    .line 54
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentLighting;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/RecyclerView;->setItemAnimator(Landroid/support/v7/widget/RecyclerView$ItemAnimator;)V

    .line 57
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentLighting;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p1

    iget p1, p1, Landroid/util/DisplayMetrics;->widthPixels:I

    iput p1, p0, Lcom/android/camera/fragment/FragmentLighting;->mTotalWidth:I

    .line 58
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentLighting;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f0a00c4

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Lcom/android/camera/fragment/FragmentLighting;->mHolderWidth:I

    .line 59
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentLighting;->mComponentRunningLighting:Lcom/android/camera/data/data/runing/ComponentRunningLighting;

    iget v0, p0, Lcom/android/camera/fragment/FragmentLighting;->mCurrentMode:I

    invoke-virtual {p1, v0}, Lcom/android/camera/data/data/runing/ComponentRunningLighting;->getComponentValue(I)Ljava/lang/String;

    move-result-object p1

    .line 61
    :try_start_0
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    iput p1, p0, Lcom/android/camera/fragment/FragmentLighting;->mCurrentIndex:I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 64
    goto :goto_0

    .line 62
    :catch_0
    move-exception p1

    .line 63
    invoke-virtual {p1}, Ljava/lang/NumberFormatException;->printStackTrace()V

    .line 66
    :goto_0
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 81
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentLighting;->isEnableClick()Z

    move-result v0

    if-nez v0, :cond_0

    .line 82
    return-void

    .line 85
    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa1

    .line 86
    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$CameraAction;

    .line 87
    if-eqz v0, :cond_1

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->isDoingAction()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 88
    return-void

    .line 92
    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    .line 93
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lcom/android/camera/fragment/FragmentLighting;->onItemSelected(IZ)V

    .line 94
    return-void
.end method

.method public reInit()V
    .locals 2

    .line 98
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/FragmentLighting;->reInitAdapterBgMode(Z)V

    .line 99
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentLighting;->mComponentRunningLighting:Lcom/android/camera/data/data/runing/ComponentRunningLighting;

    iget v1, p0, Lcom/android/camera/fragment/FragmentLighting;->mCurrentMode:I

    invoke-virtual {v0, v1}, Lcom/android/camera/data/data/runing/ComponentRunningLighting;->getComponentValue(I)Ljava/lang/String;

    move-result-object v0

    .line 100
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentLighting;->mComponentRunningLighting:Lcom/android/camera/data/data/runing/ComponentRunningLighting;

    invoke-virtual {v1, v0}, Lcom/android/camera/data/data/runing/ComponentRunningLighting;->findIndexOfValue(Ljava/lang/String;)I

    move-result v0

    .line 101
    invoke-direct {p0, v0}, Lcom/android/camera/fragment/FragmentLighting;->setItemInCenter(I)V

    .line 102
    return-void
.end method

.method public reInitAdapterBgMode(Z)V
    .locals 2

    .line 105
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/runing/DataItemRunning;->getUiStyle()I

    move-result v0

    .line 106
    if-eqz v0, :cond_0

    .line 111
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentLighting;->mLightingAdapter:Lcom/android/camera/fragment/FragmentLighting$LightingAdapter;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/android/camera/fragment/FragmentLighting$LightingAdapter;->setBgMode(Z)V

    goto :goto_0

    .line 108
    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentLighting;->mLightingAdapter:Lcom/android/camera/fragment/FragmentLighting$LightingAdapter;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/camera/fragment/FragmentLighting$LightingAdapter;->setBgMode(Z)V

    .line 109
    nop

    .line 114
    :goto_0
    if-eqz p1, :cond_1

    .line 116
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/data/data/runing/DataItemRunning;->getComponentRunningLighting()Lcom/android/camera/data/data/runing/ComponentRunningLighting;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/fragment/FragmentLighting;->mComponentRunningLighting:Lcom/android/camera/data/data/runing/ComponentRunningLighting;

    .line 117
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentLighting;->mComponentRunningLighting:Lcom/android/camera/data/data/runing/ComponentRunningLighting;

    invoke-virtual {p1}, Lcom/android/camera/data/data/runing/ComponentRunningLighting;->initItems()V

    .line 118
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentLighting;->mLightingAdapter:Lcom/android/camera/fragment/FragmentLighting$LightingAdapter;

    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentLighting;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/android/camera/fragment/FragmentLighting;->mComponentRunningLighting:Lcom/android/camera/data/data/runing/ComponentRunningLighting;

    invoke-virtual {p1, v0, v1}, Lcom/android/camera/fragment/FragmentLighting$LightingAdapter;->updateLightingData(Landroid/content/Context;Lcom/android/camera/data/data/runing/ComponentRunningLighting;)V

    .line 120
    :cond_1
    return-void
.end method

.method public switchLighting(I)V
    .locals 2

    .line 131
    nop

    .line 132
    const/4 v0, 0x3

    const/4 v1, -0x1

    if-eq p1, v0, :cond_1

    const/4 v0, 0x5

    if-eq p1, v0, :cond_0

    goto :goto_0

    .line 140
    :cond_0
    iget p1, p0, Lcom/android/camera/fragment/FragmentLighting;->mCurrentIndex:I

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentLighting;->mComponentRunningLighting:Lcom/android/camera/data/data/runing/ComponentRunningLighting;

    invoke-virtual {v0}, Lcom/android/camera/data/data/runing/ComponentRunningLighting;->getItems()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    if-ge p1, v0, :cond_2

    .line 141
    iget p1, p0, Lcom/android/camera/fragment/FragmentLighting;->mCurrentIndex:I

    add-int/lit8 p1, p1, 0x1

    goto :goto_1

    .line 134
    :cond_1
    iget p1, p0, Lcom/android/camera/fragment/FragmentLighting;->mCurrentIndex:I

    if-lez p1, :cond_2

    .line 135
    iget p1, p0, Lcom/android/camera/fragment/FragmentLighting;->mCurrentIndex:I

    add-int/lit8 p1, p1, -0x1

    goto :goto_1

    .line 149
    :cond_2
    :goto_0
    move p1, v1

    :goto_1
    if-le p1, v1, :cond_3

    .line 150
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/android/camera/fragment/FragmentLighting;->onItemSelected(IZ)V

    .line 152
    :cond_3
    return-void
.end method
