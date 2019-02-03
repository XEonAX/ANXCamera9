.class public Lcom/android/camera/fragment/beauty/LiveBeautyModeFragment;
.super Lcom/android/camera/fragment/beauty/BaseBeautyMakeupFragment;
.source "LiveBeautyModeFragment.java"


# instance fields
.field private mHeaderImageView:Lcom/android/camera/ui/ColorImageView;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 29
    invoke-direct {p0}, Lcom/android/camera/fragment/beauty/BaseBeautyMakeupFragment;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/android/camera/fragment/beauty/LiveBeautyModeFragment;)Lcom/android/camera/ui/ColorImageView;
    .locals 0

    .line 29
    iget-object p0, p0, Lcom/android/camera/fragment/beauty/LiveBeautyModeFragment;->mHeaderImageView:Lcom/android/camera/ui/ColorImageView;

    return-object p0
.end method

.method private reSelectItem()V
    .locals 2

    .line 152
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/LiveBeautyModeFragment;->mItemList:Ljava/util/List;

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/android/camera/fragment/beauty/LiveBeautyModeFragment;->mSelectedParam:I

    iget-object v1, p0, Lcom/android/camera/fragment/beauty/LiveBeautyModeFragment;->mItemList:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 153
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/LiveBeautyModeFragment;->mItemList:Ljava/util/List;

    iget v1, p0, Lcom/android/camera/fragment/beauty/LiveBeautyModeFragment;->mSelectedParam:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;

    .line 154
    invoke-virtual {v0}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;->getCameraBeautyParameterType()Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    move-result-object v1

    invoke-static {v1}, Lcom/android/camera/fragment/beauty/BeautyHelper;->setCurrentBeautyParameterType(Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;)V

    .line 155
    invoke-virtual {v0}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;->getCameraBeautyParameterType()Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    move-result-object v0

    iget-object v0, v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->beautyParamType:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    invoke-static {v0}, Lcom/android/camera/fragment/beauty/BeautyHelper;->setType(Lcom/android/camera/fragment/beauty/BeautyParameters$Type;)V

    .line 157
    :cond_0
    return-void
.end method


# virtual methods
.method protected customItemWidth()I
    .locals 2

    .line 132
    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/LiveBeautyModeFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0a0136

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    return v0
.end method

.method protected getClassString()Ljava/lang/String;
    .locals 1

    .line 106
    const-class v0, Lcom/android/camera/fragment/beauty/LiveBeautyModeFragment;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getHeaderView()Landroid/view/View;
    .locals 4

    .line 90
    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/LiveBeautyModeFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const/high16 v1, 0x7f040000

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 91
    const v1, 0x7f0d0009

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/LinearLayout;

    .line 92
    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Landroid/widget/RelativeLayout$LayoutParams;

    .line 93
    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/LiveBeautyModeFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0a0137

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    iput v2, v1, Landroid/widget/RelativeLayout$LayoutParams;->width:I

    .line 94
    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 95
    const v1, 0x7f0d000a

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/android/camera/ui/ColorImageView;

    iput-object v1, p0, Lcom/android/camera/fragment/beauty/LiveBeautyModeFragment;->mHeaderImageView:Lcom/android/camera/ui/ColorImageView;

    .line 96
    iget-object v1, p0, Lcom/android/camera/fragment/beauty/LiveBeautyModeFragment;->mHeaderImageView:Lcom/android/camera/ui/ColorImageView;

    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/LiveBeautyModeFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0b0059

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/android/camera/ui/ColorImageView;->setColor(I)V

    .line 97
    iget-object v1, p0, Lcom/android/camera/fragment/beauty/LiveBeautyModeFragment;->mHeaderImageView:Lcom/android/camera/ui/ColorImageView;

    const v2, 0x7f020175

    invoke-virtual {v1, v2}, Lcom/android/camera/ui/ColorImageView;->setImageResource(I)V

    .line 98
    const v1, 0x7f0d000b

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 99
    const v2, 0x7f090213

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(I)V

    .line 100
    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/LiveBeautyModeFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0b005b

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 101
    return-object v0
.end method

.method protected getListItemMargin()I
    .locals 1

    .line 111
    invoke-super {p0}, Lcom/android/camera/fragment/beauty/BaseBeautyMakeupFragment;->getListItemMargin()I

    move-result v0

    return v0
.end method

.method protected initItems()Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;",
            ">;"
        }
    .end annotation

    .line 34
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 35
    new-instance v1, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;

    sget-object v2, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->LIVE_SHRINK_FACE_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    const v3, 0x7f02017e

    const v4, 0x7f0901d8

    invoke-direct {v1, v3, v4, v2}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;-><init>(IILcom/android/camera/fragment/beauty/CameraBeautyParameterType;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 36
    new-instance v1, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;

    sget-object v2, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->LIVE_ENLARGE_EYE_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    const v3, 0x7f02017b

    const v4, 0x7f0901d7

    invoke-direct {v1, v3, v4, v2}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;-><init>(IILcom/android/camera/fragment/beauty/CameraBeautyParameterType;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 37
    new-instance v1, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;

    sget-object v2, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->LIVE_SMOOTH_STRENGTH:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    const v3, 0x7f02018d

    const v4, 0x7f0901d6

    invoke-direct {v1, v3, v4, v2}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;-><init>(IILcom/android/camera/fragment/beauty/CameraBeautyParameterType;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 38
    return-object v0
.end method

.method protected isCustomWidth()Z
    .locals 1

    .line 127
    const/4 v0, 0x1

    return v0
.end method

.method protected onAdapterItemClick(Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;)V
    .locals 2

    .line 43
    invoke-virtual {p1}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;->getCameraBeautyParameterType()Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    move-result-object v0

    iget v0, v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->beautyType:I

    const/4 v1, 0x7

    if-ne v0, v1, :cond_1

    .line 44
    invoke-virtual {p1}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;->getCameraBeautyParameterType()Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    move-result-object v0

    iget-object v0, v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->beautyParamType:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    invoke-static {v0}, Lcom/android/camera/fragment/beauty/BeautyHelper;->setType(Lcom/android/camera/fragment/beauty/BeautyParameters$Type;)V

    .line 46
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xb4

    .line 47
    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$MakeupProtocol;

    .line 48
    if-eqz v0, :cond_0

    .line 49
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$MakeupProtocol;->onMakeupItemSelected()V

    .line 51
    :cond_0
    invoke-virtual {p1}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;->getCameraBeautyParameterType()Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    move-result-object p1

    iget-object p1, p1, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->beautyParamType:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    invoke-static {p1}, Lcom/android/camera/statistic/CameraStatUtil;->trackLiveBeautyCounter(Lcom/android/camera/fragment/beauty/BeautyParameters$Type;)V

    .line 53
    :cond_1
    return-void
.end method

.method protected onHeaderClick()V
    .locals 3

    .line 57
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/LiveBeautyModeFragment;->mHeaderImageView:Lcom/android/camera/ui/ColorImageView;

    if-eqz v0, :cond_0

    .line 58
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/LiveBeautyModeFragment;->mHeaderImageView:Lcom/android/camera/ui/ColorImageView;

    invoke-virtual {v0}, Lcom/android/camera/ui/ColorImageView;->clearAnimation()V

    .line 59
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/LiveBeautyModeFragment;->mHeaderImageView:Lcom/android/camera/ui/ColorImageView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/ColorImageView;->setRotation(F)V

    .line 60
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/LiveBeautyModeFragment;->mHeaderImageView:Lcom/android/camera/ui/ColorImageView;

    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    const/high16 v1, 0x43b40000    # 360.0f

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->rotation(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    const-wide/16 v1, 0x1f4

    invoke-virtual {v0, v1, v2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    new-instance v1, Lcom/android/camera/fragment/beauty/LiveBeautyModeFragment$1;

    invoke-direct {v1, p0}, Lcom/android/camera/fragment/beauty/LiveBeautyModeFragment$1;-><init>(Lcom/android/camera/fragment/beauty/LiveBeautyModeFragment;)V

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setListener(Landroid/support/v4/view/ViewPropertyAnimatorListener;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    .line 66
    invoke-virtual {v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 68
    :cond_0
    invoke-static {}, Lcom/android/camera/fragment/beauty/BeautyHelper;->resetBeauty()V

    .line 69
    sget-object v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->LIVE_SHRINK_FACE_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    iget-object v0, v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->beautyParamType:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    invoke-static {v0}, Lcom/android/camera/fragment/beauty/BeautyHelper;->setType(Lcom/android/camera/fragment/beauty/BeautyParameters$Type;)V

    .line 70
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera/fragment/beauty/LiveBeautyModeFragment;->mSelectedParam:I

    .line 71
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/LiveBeautyModeFragment;->mMakeupAdapter:Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;

    iget v1, p0, Lcom/android/camera/fragment/beauty/LiveBeautyModeFragment;->mSelectedParam:I

    invoke-virtual {v0, v1}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;->setSelectedPosition(I)V

    .line 72
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/LiveBeautyModeFragment;->mLayoutManager:Lcom/android/camera/fragment/beauty/BaseBeautyMakeupFragment$MyLayoutManager;

    iget v1, p0, Lcom/android/camera/fragment/beauty/LiveBeautyModeFragment;->mSelectedParam:I

    invoke-virtual {v0, v1}, Lcom/android/camera/fragment/beauty/BaseBeautyMakeupFragment$MyLayoutManager;->scrollToPosition(I)V

    .line 74
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    .line 75
    const/16 v1, 0xb4

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$MakeupProtocol;

    .line 76
    if-eqz v0, :cond_1

    .line 77
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$MakeupProtocol;->onMakeupItemSelected()V

    .line 79
    :cond_1
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/LiveBeautyModeFragment;->mMakeupAdapter:Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;

    invoke-virtual {v0}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;->notifyDataSetChanged()V

    .line 80
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$MakeupProtocol;

    .line 81
    if-eqz v0, :cond_2

    .line 82
    const/4 v1, 0x1

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$MakeupProtocol;->setSeekBarMode(I)V

    .line 84
    :cond_2
    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/LiveBeautyModeFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f090258

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/beauty/LiveBeautyModeFragment;->toast(Ljava/lang/String;)V

    .line 85
    sget-object v0, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->BEAUTY_RESET:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    invoke-static {v0}, Lcom/android/camera/statistic/CameraStatUtil;->trackLiveBeautyCounter(Lcom/android/camera/fragment/beauty/BeautyParameters$Type;)V

    .line 86
    return-void
.end method

.method protected setListPadding(Landroid/support/v7/widget/RecyclerView;)V
    .locals 1

    .line 116
    invoke-super {p0, p1}, Lcom/android/camera/fragment/beauty/BaseBeautyMakeupFragment;->setListPadding(Landroid/support/v7/widget/RecyclerView;)V

    .line 117
    if-nez p1, :cond_0

    .line 118
    return-void

    .line 120
    :cond_0
    nop

    .line 121
    nop

    .line 122
    const/4 v0, 0x0

    invoke-virtual {p1, v0, v0, v0, v0}, Landroid/support/v7/widget/RecyclerView;->setPadding(IIII)V

    .line 123
    return-void
.end method

.method public setUserVisibleHint(Z)V
    .locals 5

    .line 137
    invoke-super {p0, p1}, Lcom/android/camera/fragment/beauty/BaseBeautyMakeupFragment;->setUserVisibleHint(Z)V

    .line 138
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    .line 139
    const/16 v1, 0xa0

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;

    .line 140
    if-nez v0, :cond_0

    .line 141
    return-void

    .line 143
    :cond_0
    const/4 v1, 0x3

    const/16 v2, 0xfc

    const v3, 0x7f0d00fe

    if-nez p1, :cond_1

    invoke-interface {v0, v3}, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;->getActiveFragment(I)I

    move-result v4

    if-ne v4, v2, :cond_1

    .line 144
    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;->delegateEvent(I)V

    goto :goto_0

    .line 145
    :cond_1
    if-eqz p1, :cond_2

    invoke-interface {v0, v3}, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;->getActiveFragment(I)I

    move-result p1

    if-eq p1, v2, :cond_2

    .line 146
    invoke-direct {p0}, Lcom/android/camera/fragment/beauty/LiveBeautyModeFragment;->reSelectItem()V

    .line 147
    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;->delegateEvent(I)V

    .line 149
    :cond_2
    :goto_0
    return-void
.end method
