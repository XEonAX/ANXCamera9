.class public Lcom/android/camera/fragment/live/FragmentLiveSticker;
.super Lcom/android/camera/fragment/live/FragmentLiveBase;
.source "FragmentLiveSticker.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter;
    }
.end annotation


# static fields
.field private static final FRAGMENT_INFO:I = 0xffc

.field private static final TAG:Ljava/lang/String; = "FragmentLiveSticker"

.field private static final sLocalStickerList:[Lcom/android/camera/sticker/LiveStickerInfo;

.field private static sPersistStickerList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/camera/sticker/LiveStickerInfo;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mAdapter:Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter;

.field private mDownloadHelper:Lcom/android/camera/network/resource/LiveDownloadHelper;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/camera/network/resource/LiveDownloadHelper<",
            "Lcom/android/camera/sticker/LiveStickerInfo;",
            ">;"
        }
    .end annotation
.end field

.field private mDownloadListener:Lcom/android/camera/network/resource/OnLiveDownloadListener;

.field private mItemWidth:I

.field private mLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

.field private mRootView:Landroid/view/View;

.field mSelectIndex:I

.field private mStickerList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/camera/sticker/LiveStickerInfo;",
            ">;"
        }
    .end annotation
.end field

.field private mStickerListView:Landroid/support/v7/widget/RecyclerView;

.field private mTotalWidth:I


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 47
    const/4 v0, 0x3

    new-array v0, v0, [Lcom/android/camera/sticker/LiveStickerInfo;

    new-instance v1, Lcom/android/camera/sticker/LiveStickerInfo;

    const-string v2, ""

    const v3, 0x7f020036

    invoke-direct {v1, v2, v3}, Lcom/android/camera/sticker/LiveStickerInfo;-><init>(Ljava/lang/String;I)V

    const/4 v2, 0x0

    aput-object v1, v0, v2

    new-instance v1, Lcom/android/camera/sticker/LiveStickerInfo;

    const-string v2, "2D_angel"

    const v3, 0x7f020020

    invoke-direct {v1, v2, v3}, Lcom/android/camera/sticker/LiveStickerInfo;-><init>(Ljava/lang/String;I)V

    const/4 v2, 0x1

    aput-object v1, v0, v2

    new-instance v1, Lcom/android/camera/sticker/LiveStickerInfo;

    const-string v2, "2D_bubble"

    const v3, 0x7f02002d

    invoke-direct {v1, v2, v3}, Lcom/android/camera/sticker/LiveStickerInfo;-><init>(Ljava/lang/String;I)V

    const/4 v2, 0x2

    aput-object v1, v0, v2

    sput-object v0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->sLocalStickerList:[Lcom/android/camera/sticker/LiveStickerInfo;

    .line 53
    new-instance v0, Ljava/util/ArrayList;

    sget-object v1, Lcom/android/camera/fragment/live/FragmentLiveSticker;->sLocalStickerList:[Lcom/android/camera/sticker/LiveStickerInfo;

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    sput-object v0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->sPersistStickerList:Ljava/util/List;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 43
    invoke-direct {p0}, Lcom/android/camera/fragment/live/FragmentLiveBase;-><init>()V

    .line 62
    sget-object v0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->sPersistStickerList:Ljava/util/List;

    iput-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mStickerList:Ljava/util/List;

    .line 227
    new-instance v0, Lcom/android/camera/fragment/live/FragmentLiveSticker$4;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/live/FragmentLiveSticker$4;-><init>(Lcom/android/camera/fragment/live/FragmentLiveSticker;)V

    iput-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mDownloadListener:Lcom/android/camera/network/resource/OnLiveDownloadListener;

    .line 267
    new-instance v0, Lcom/android/camera/fragment/live/FragmentLiveSticker$5;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/live/FragmentLiveSticker$5;-><init>(Lcom/android/camera/fragment/live/FragmentLiveSticker;)V

    iput-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mDownloadHelper:Lcom/android/camera/network/resource/LiveDownloadHelper;

    return-void
.end method

.method static synthetic access$000(Lcom/android/camera/fragment/live/FragmentLiveSticker;Ljava/util/List;)V
    .locals 0

    .line 43
    invoke-direct {p0, p1}, Lcom/android/camera/fragment/live/FragmentLiveSticker;->updateStickerList(Ljava/util/List;)V

    return-void
.end method

.method static synthetic access$100(Lcom/android/camera/fragment/live/FragmentLiveSticker;)Ljava/util/List;
    .locals 0

    .line 43
    iget-object p0, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mStickerList:Ljava/util/List;

    return-object p0
.end method

.method static synthetic access$200(Lcom/android/camera/fragment/live/FragmentLiveSticker;)Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter;
    .locals 0

    .line 43
    iget-object p0, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mAdapter:Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter;

    return-object p0
.end method

.method private scrollIfNeed(I)Z
    .locals 4

    .line 152
    nop

    .line 153
    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {v0}, Landroid/support/v7/widget/LinearLayoutManager;->findFirstVisibleItemPosition()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eq p1, v0, :cond_3

    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    .line 154
    invoke-virtual {v0}, Landroid/support/v7/widget/LinearLayoutManager;->findFirstCompletelyVisibleItemPosition()I

    move-result v0

    if-ne p1, v0, :cond_0

    goto :goto_1

    .line 156
    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {v0}, Landroid/support/v7/widget/LinearLayoutManager;->findLastVisibleItemPosition()I

    move-result v0

    if-eq p1, v0, :cond_2

    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    .line 157
    invoke-virtual {v0}, Landroid/support/v7/widget/LinearLayoutManager;->findLastCompletelyVisibleItemPosition()I

    move-result v0

    if-ne p1, v0, :cond_1

    goto :goto_0

    .line 160
    :cond_1
    move v0, p1

    goto :goto_2

    .line 158
    :cond_2
    :goto_0
    add-int/lit8 v0, p1, 0x1

    iget-object v3, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {v3}, Landroid/support/v7/widget/LinearLayoutManager;->getItemCount()I

    move-result v3

    sub-int/2addr v3, v2

    invoke-static {v0, v3}, Ljava/lang/Math;->min(II)I

    move-result v0

    goto :goto_2

    .line 155
    :cond_3
    :goto_1
    add-int/lit8 v0, p1, -0x1

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 160
    :goto_2
    if-eq v0, p1, :cond_4

    .line 161
    iget-object p1, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {p1, v0}, Landroid/support/v7/widget/LinearLayoutManager;->scrollToPosition(I)V

    .line 162
    return v2

    .line 164
    :cond_4
    return v1
.end method

.method private setItemInCenter(I)V
    .locals 2

    .line 147
    iget v0, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mTotalWidth:I

    div-int/lit8 v0, v0, 0x2

    iget v1, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mItemWidth:I

    div-int/lit8 v1, v1, 0x2

    sub-int/2addr v0, v1

    .line 148
    iget-object v1, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {v1, p1, v0}, Landroid/support/v7/widget/LinearLayoutManager;->scrollToPositionWithOffset(II)V

    .line 149
    return-void
.end method

.method private updateData()V
    .locals 3

    .line 197
    new-instance v0, Lcom/android/camera/network/live/TTLiveStickerResourceRequest;

    const-string v1, "test"

    const-string v2, "default"

    invoke-direct {v0, v1, v2}, Lcom/android/camera/network/live/TTLiveStickerResourceRequest;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 198
    new-instance v1, Lcom/android/camera/fragment/live/FragmentLiveSticker$3;

    invoke-direct {v1, p0}, Lcom/android/camera/fragment/live/FragmentLiveSticker$3;-><init>(Lcom/android/camera/fragment/live/FragmentLiveSticker;)V

    invoke-virtual {v0, v1}, Lcom/android/camera/network/live/TTLiveStickerResourceRequest;->execute(Lcom/android/camera/network/net/base/ResponseListener;)V

    .line 225
    return-void
.end method

.method private updateStickerList(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/camera/sticker/LiveStickerInfo;",
            ">;)V"
        }
    .end annotation

    .line 187
    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mStickerList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 188
    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mStickerList:Ljava/util/List;

    sget-object v1, Lcom/android/camera/fragment/live/FragmentLiveSticker;->sLocalStickerList:[Lcom/android/camera/sticker/LiveStickerInfo;

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 189
    if-eqz p1, :cond_0

    .line 190
    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mStickerList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 191
    iget-object p1, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mStickerList:Ljava/util/List;

    sput-object p1, Lcom/android/camera/fragment/live/FragmentLiveSticker;->sPersistStickerList:Ljava/util/List;

    .line 193
    :cond_0
    iget-object p1, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mAdapter:Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter;

    invoke-virtual {p1}, Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter;->notifyDataSetChanged()V

    .line 194
    return-void
.end method


# virtual methods
.method public getFragmentInto()I
    .locals 1

    .line 138
    const/16 v0, 0xffc

    return v0
.end method

.method protected getLayoutResourceId()I
    .locals 1

    .line 143
    const v0, 0x7f04001f

    return v0
.end method

.method protected initView(Landroid/view/View;)V
    .locals 6

    .line 66
    iput-object p1, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mRootView:Landroid/view/View;

    .line 68
    invoke-virtual {p0}, Lcom/android/camera/fragment/live/FragmentLiveSticker;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f09010f

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mItemWidth:I

    .line 69
    invoke-virtual {p0}, Lcom/android/camera/fragment/live/FragmentLiveSticker;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p1

    iget p1, p1, Landroid/util/DisplayMetrics;->widthPixels:I

    iput p1, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mTotalWidth:I

    .line 71
    invoke-virtual {p0}, Lcom/android/camera/fragment/live/FragmentLiveSticker;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lcom/android/camera/Util;->isLayoutRTL(Landroid/content/Context;)Z

    move-result p1

    .line 72
    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mRootView:Landroid/view/View;

    const v1, 0x7f0d0061

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/RecyclerView;

    iput-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mStickerListView:Landroid/support/v7/widget/RecyclerView;

    .line 75
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mSelectIndex:I

    .line 76
    invoke-static {}, Lcom/android/camera/CameraSettings;->getCurrentLiveSticker()Ljava/lang/String;

    move-result-object v1

    .line 77
    if-eqz v1, :cond_1

    .line 78
    move v2, v0

    :goto_0
    iget-object v3, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mStickerList:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-ge v2, v3, :cond_1

    .line 79
    iget-object v3, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mStickerList:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/camera/sticker/LiveStickerInfo;

    iget-object v3, v3, Lcom/android/camera/sticker/LiveStickerInfo;->name:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 80
    iput v2, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mSelectIndex:I

    .line 81
    goto :goto_1

    .line 78
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 86
    :cond_1
    :goto_1
    new-instance v1, Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter;

    invoke-virtual {p0}, Lcom/android/camera/fragment/live/FragmentLiveSticker;->getContext()Landroid/content/Context;

    move-result-object v2

    iget-object v3, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mStickerList:Ljava/util/List;

    iget v4, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mSelectIndex:I

    new-instance v5, Lcom/android/camera/fragment/live/FragmentLiveSticker$1;

    invoke-direct {v5, p0}, Lcom/android/camera/fragment/live/FragmentLiveSticker$1;-><init>(Lcom/android/camera/fragment/live/FragmentLiveSticker;)V

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter;-><init>(Landroid/content/Context;Ljava/util/List;ILandroid/widget/AdapterView$OnItemClickListener;)V

    iput-object v1, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mAdapter:Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter;

    .line 93
    new-instance v1, Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {p0}, Lcom/android/camera/fragment/live/FragmentLiveSticker;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/support/v7/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    .line 94
    iget-object v1, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {v1, v0}, Landroid/support/v7/widget/LinearLayoutManager;->setOrientation(I)V

    .line 95
    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mStickerListView:Landroid/support/v7/widget/RecyclerView;

    iget-object v1, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    .line 96
    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mStickerListView:Landroid/support/v7/widget/RecyclerView;

    new-instance v1, Lcom/android/camera/fragment/live/FragmentLiveSticker$2;

    invoke-direct {v1, p0, p1}, Lcom/android/camera/fragment/live/FragmentLiveSticker$2;-><init>(Lcom/android/camera/fragment/live/FragmentLiveSticker;Z)V

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->addItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    .line 119
    new-instance p1, Lcom/android/camera/fragment/DefaultItemAnimator;

    invoke-direct {p1}, Lcom/android/camera/fragment/DefaultItemAnimator;-><init>()V

    .line 120
    const-wide/16 v0, 0x96

    invoke-virtual {p1, v0, v1}, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->setChangeDuration(J)V

    .line 121
    invoke-virtual {p1, v0, v1}, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->setMoveDuration(J)V

    .line 122
    invoke-virtual {p1, v0, v1}, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->setAddDuration(J)V

    .line 123
    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mStickerListView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/RecyclerView;->setItemAnimator(Landroid/support/v7/widget/RecyclerView$ItemAnimator;)V

    .line 124
    iget-object p1, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mStickerListView:Landroid/support/v7/widget/RecyclerView;

    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mAdapter:Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter;

    invoke-virtual {p1, v0}, Landroid/support/v7/widget/RecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 125
    iget p1, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mSelectIndex:I

    invoke-direct {p0, p1}, Lcom/android/camera/fragment/live/FragmentLiveSticker;->setItemInCenter(I)V

    .line 126
    invoke-static {}, Lcom/android/camera/network/resource/LiveResourceDownloadManager;->getInstance()Lcom/android/camera/network/resource/LiveResourceDownloadManager;

    move-result-object p1

    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mDownloadListener:Lcom/android/camera/network/resource/OnLiveDownloadListener;

    invoke-virtual {p1, v0}, Lcom/android/camera/network/resource/LiveResourceDownloadManager;->addDownloadListener(Lcom/android/camera/network/resource/OnLiveDownloadListener;)V

    .line 127
    invoke-direct {p0}, Lcom/android/camera/fragment/live/FragmentLiveSticker;->updateData()V

    .line 128
    return-void
.end method

.method public onDestroy()V
    .locals 2

    .line 132
    invoke-super {p0}, Lcom/android/camera/fragment/live/FragmentLiveBase;->onDestroy()V

    .line 133
    invoke-static {}, Lcom/android/camera/network/resource/LiveResourceDownloadManager;->getInstance()Lcom/android/camera/network/resource/LiveResourceDownloadManager;

    move-result-object v0

    iget-object v1, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mDownloadListener:Lcom/android/camera/network/resource/OnLiveDownloadListener;

    invoke-virtual {v0, v1}, Lcom/android/camera/network/resource/LiveResourceDownloadManager;->removeDownloadListener(Lcom/android/camera/network/resource/OnLiveDownloadListener;)V

    .line 134
    return-void
.end method

.method protected onItemSelected(ILandroid/view/View;)V
    .locals 2

    .line 168
    iput p1, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mSelectIndex:I

    .line 169
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    .line 170
    const/16 p2, 0xb2

    invoke-virtual {p1, p2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$StickerProtocol;

    .line 171
    if-nez p1, :cond_0

    .line 172
    return-void

    .line 174
    :cond_0
    iget-object p2, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mStickerList:Ljava/util/List;

    iget v0, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mSelectIndex:I

    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/android/camera/sticker/LiveStickerInfo;

    .line 175
    iget-object v0, p2, Lcom/android/camera/sticker/LiveStickerInfo;->name:Ljava/lang/String;

    invoke-static {v0}, Lcom/android/camera/CameraSettings;->setCurrentLiveSticker(Ljava/lang/String;)V

    .line 176
    invoke-virtual {p2}, Lcom/android/camera/sticker/LiveStickerInfo;->getDownloadState()I

    move-result v0

    .line 177
    const/4 v1, 0x1

    if-eq v0, v1, :cond_2

    const/4 v1, 0x3

    if-ne v0, v1, :cond_1

    goto :goto_0

    .line 180
    :cond_1
    const/4 p1, 0x2

    iput p1, p2, Lcom/android/camera/sticker/LiveStickerInfo;->downloadState:I

    .line 181
    invoke-static {}, Lcom/android/camera/network/resource/LiveResourceDownloadManager;->getInstance()Lcom/android/camera/network/resource/LiveResourceDownloadManager;

    move-result-object p1

    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mDownloadHelper:Lcom/android/camera/network/resource/LiveDownloadHelper;

    invoke-virtual {p1, p2, v0}, Lcom/android/camera/network/resource/LiveResourceDownloadManager;->download(Lcom/android/camera/network/resource/LiveResource;Lcom/android/camera/network/resource/LiveDownloadHelper;)V

    goto :goto_1

    .line 178
    :cond_2
    :goto_0
    iget-object p2, p2, Lcom/android/camera/sticker/LiveStickerInfo;->name:Ljava/lang/String;

    invoke-interface {p1, p2}, Lcom/android/camera/protocol/ModeProtocol$StickerProtocol;->onStickerChanged(Ljava/lang/String;)V

    .line 183
    :goto_1
    iget p1, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mSelectIndex:I

    invoke-direct {p0, p1}, Lcom/android/camera/fragment/live/FragmentLiveSticker;->scrollIfNeed(I)Z

    .line 184
    return-void
.end method
