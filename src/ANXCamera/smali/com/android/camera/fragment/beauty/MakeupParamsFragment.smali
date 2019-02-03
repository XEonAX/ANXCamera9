.class public Lcom/android/camera/fragment/beauty/MakeupParamsFragment;
.super Lcom/android/camera/fragment/beauty/BaseBeautyMakeupFragment;
.source "MakeupParamsFragment.java"


# instance fields
.field private mHeaderImageView:Lcom/android/camera/ui/ColorImageView;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 25
    invoke-direct {p0}, Lcom/android/camera/fragment/beauty/BaseBeautyMakeupFragment;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/android/camera/fragment/beauty/MakeupParamsFragment;)Lcom/android/camera/ui/ColorImageView;
    .locals 0

    .line 25
    iget-object p0, p0, Lcom/android/camera/fragment/beauty/MakeupParamsFragment;->mHeaderImageView:Lcom/android/camera/ui/ColorImageView;

    return-object p0
.end method


# virtual methods
.method protected customItemWidth()I
    .locals 2

    .line 133
    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/MakeupParamsFragment;->isNeedScroll()Z

    move-result v0

    if-nez v0, :cond_0

    .line 134
    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/MakeupParamsFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0a00e8

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    return v0

    .line 136
    :cond_0
    invoke-super {p0}, Lcom/android/camera/fragment/beauty/BaseBeautyMakeupFragment;->customItemWidth()I

    move-result v0

    return v0
.end method

.method protected getClassString()Ljava/lang/String;
    .locals 1

    .line 141
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getHeaderView()Landroid/view/View;
    .locals 4

    .line 86
    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/MakeupParamsFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const/high16 v1, 0x7f040000

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 87
    const v1, 0x7f0d000a

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/android/camera/ui/ColorImageView;

    iput-object v1, p0, Lcom/android/camera/fragment/beauty/MakeupParamsFragment;->mHeaderImageView:Lcom/android/camera/ui/ColorImageView;

    .line 88
    iget-object v1, p0, Lcom/android/camera/fragment/beauty/MakeupParamsFragment;->mHeaderImageView:Lcom/android/camera/ui/ColorImageView;

    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/MakeupParamsFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0b0059

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/android/camera/ui/ColorImageView;->setColor(I)V

    .line 89
    iget-object v1, p0, Lcom/android/camera/fragment/beauty/MakeupParamsFragment;->mHeaderImageView:Lcom/android/camera/ui/ColorImageView;

    const v2, 0x7f020175

    invoke-virtual {v1, v2}, Lcom/android/camera/ui/ColorImageView;->setImageResource(I)V

    .line 90
    const v1, 0x7f0d000b

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 91
    const v2, 0x7f090213

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(I)V

    .line 92
    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/MakeupParamsFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0b005b

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 93
    return-object v0
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

    .line 31
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 32
    new-instance v1, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;

    sget-object v2, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->SHRINK_FACE_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    const v3, 0x7f02017e

    const v4, 0x7f0901d8

    invoke-direct {v1, v3, v4, v2}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;-><init>(IILcom/android/camera/fragment/beauty/CameraBeautyParameterType;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 33
    new-instance v1, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;

    sget-object v2, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->ENLARGE_EYE_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    const v3, 0x7f02017b

    const v4, 0x7f0901d7

    invoke-direct {v1, v3, v4, v2}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;-><init>(IILcom/android/camera/fragment/beauty/CameraBeautyParameterType;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 34
    new-instance v1, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;

    sget-object v2, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->WHITEN_STRENGTH:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    const v3, 0x7f02018b

    const v4, 0x7f0901d5

    invoke-direct {v1, v3, v4, v2}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;-><init>(IILcom/android/camera/fragment/beauty/CameraBeautyParameterType;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 35
    new-instance v1, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;

    sget-object v2, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->SMOOTH_STRENGTH:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    const v3, 0x7f02018d

    const v4, 0x7f0901d6

    invoke-direct {v1, v3, v4, v2}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;-><init>(IILcom/android/camera/fragment/beauty/CameraBeautyParameterType;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 36
    return-object v0
.end method

.method protected initView(Landroid/view/View;)V
    .locals 0

    .line 98
    invoke-super {p0, p1}, Lcom/android/camera/fragment/beauty/BaseBeautyMakeupFragment;->initView(Landroid/view/View;)V

    .line 99
    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/MakeupParamsFragment;->getUserVisibleHint()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 100
    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/MakeupParamsFragment;->reSelectItem()V

    .line 102
    :cond_0
    return-void
.end method

.method protected isCustomWidth()Z
    .locals 1

    .line 128
    const/4 v0, 0x1

    return v0
.end method

.method protected onAdapterItemClick(Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;)V
    .locals 2

    .line 41
    invoke-virtual {p1}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;->getCameraBeautyParameterType()Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    move-result-object v0

    iget v0, v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->beautyType:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    .line 42
    invoke-virtual {p1}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;->getCameraBeautyParameterType()Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    move-result-object p1

    iget-object p1, p1, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->beautyModelParameterType:Lcom/miui/filtersdk/beauty/BeautyParameterType;

    invoke-static {p1}, Lcom/android/camera/fragment/beauty/BeautyHelper;->setType(Lcom/miui/filtersdk/beauty/BeautyParameterType;)V

    .line 44
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 v0, 0xb4

    .line 45
    invoke-virtual {p1, v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$MakeupProtocol;

    .line 46
    if-eqz p1, :cond_0

    .line 47
    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$MakeupProtocol;->onMakeupItemSelected()V

    .line 50
    :cond_0
    return-void
.end method

.method protected onHeaderClick()V
    .locals 3

    .line 54
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/MakeupParamsFragment;->mHeaderImageView:Lcom/android/camera/ui/ColorImageView;

    if-eqz v0, :cond_0

    .line 55
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/MakeupParamsFragment;->mHeaderImageView:Lcom/android/camera/ui/ColorImageView;

    invoke-virtual {v0}, Lcom/android/camera/ui/ColorImageView;->clearAnimation()V

    .line 56
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/MakeupParamsFragment;->mHeaderImageView:Lcom/android/camera/ui/ColorImageView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/ColorImageView;->setRotation(F)V

    .line 57
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/MakeupParamsFragment;->mHeaderImageView:Lcom/android/camera/ui/ColorImageView;

    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    const/high16 v1, 0x43b40000    # 360.0f

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->rotation(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    const-wide/16 v1, 0x1f4

    invoke-virtual {v0, v1, v2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    new-instance v1, Lcom/android/camera/fragment/beauty/MakeupParamsFragment$1;

    invoke-direct {v1, p0}, Lcom/android/camera/fragment/beauty/MakeupParamsFragment$1;-><init>(Lcom/android/camera/fragment/beauty/MakeupParamsFragment;)V

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setListener(Landroid/support/v4/view/ViewPropertyAnimatorListener;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    .line 63
    invoke-virtual {v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 65
    :cond_0
    invoke-static {}, Lcom/android/camera/fragment/beauty/BeautyHelper;->resetBeauty()V

    .line 66
    sget-object v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->SHRINK_FACE_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    iget-object v0, v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->beautyModelParameterType:Lcom/miui/filtersdk/beauty/BeautyParameterType;

    invoke-static {v0}, Lcom/android/camera/fragment/beauty/BeautyHelper;->setType(Lcom/miui/filtersdk/beauty/BeautyParameterType;)V

    .line 67
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera/fragment/beauty/MakeupParamsFragment;->mSelectedParam:I

    .line 68
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/MakeupParamsFragment;->mMakeupAdapter:Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;

    iget v1, p0, Lcom/android/camera/fragment/beauty/MakeupParamsFragment;->mSelectedParam:I

    invoke-virtual {v0, v1}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;->setSelectedPosition(I)V

    .line 69
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/MakeupParamsFragment;->mLayoutManager:Lcom/android/camera/fragment/beauty/BaseBeautyMakeupFragment$MyLayoutManager;

    iget v1, p0, Lcom/android/camera/fragment/beauty/MakeupParamsFragment;->mSelectedParam:I

    invoke-virtual {v0, v1}, Lcom/android/camera/fragment/beauty/BaseBeautyMakeupFragment$MyLayoutManager;->scrollToPosition(I)V

    .line 71
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    .line 72
    const/16 v1, 0xb4

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$MakeupProtocol;

    .line 73
    if-eqz v0, :cond_1

    .line 74
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$MakeupProtocol;->onMakeupItemSelected()V

    .line 76
    :cond_1
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/MakeupParamsFragment;->mMakeupAdapter:Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;

    invoke-virtual {v0}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;->notifyDataSetChanged()V

    .line 77
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$MakeupProtocol;

    .line 78
    if-eqz v0, :cond_2

    .line 79
    const/4 v1, 0x1

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$MakeupProtocol;->setSeekBarMode(I)V

    .line 81
    :cond_2
    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/MakeupParamsFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f090222

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/beauty/MakeupParamsFragment;->toast(Ljava/lang/String;)V

    .line 82
    return-void
.end method

.method protected reSelectItem()V
    .locals 2

    .line 120
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/MakeupParamsFragment;->mItemList:Ljava/util/List;

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/android/camera/fragment/beauty/MakeupParamsFragment;->mSelectedParam:I

    iget-object v1, p0, Lcom/android/camera/fragment/beauty/MakeupParamsFragment;->mItemList:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 121
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/MakeupParamsFragment;->mItemList:Ljava/util/List;

    iget v1, p0, Lcom/android/camera/fragment/beauty/MakeupParamsFragment;->mSelectedParam:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;

    .line 122
    invoke-virtual {v0}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;->getCameraBeautyParameterType()Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    move-result-object v0

    iget-object v0, v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->beautyModelParameterType:Lcom/miui/filtersdk/beauty/BeautyParameterType;

    invoke-static {v0}, Lcom/android/camera/fragment/beauty/BeautyHelper;->setType(Lcom/miui/filtersdk/beauty/BeautyParameterType;)V

    .line 124
    :cond_0
    return-void
.end method

.method public setUserVisibleHint(Z)V
    .locals 5

    .line 106
    invoke-super {p0, p1}, Lcom/android/camera/fragment/beauty/BaseBeautyMakeupFragment;->setUserVisibleHint(Z)V

    .line 107
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    .line 108
    const/16 v1, 0xa0

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;

    .line 109
    if-nez v0, :cond_0

    .line 110
    return-void

    .line 112
    :cond_0
    const/4 v1, 0x3

    const/16 v2, 0xfc

    const v3, 0x7f0d00fe

    if-nez p1, :cond_1

    invoke-interface {v0, v3}, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;->getActiveFragment(I)I

    move-result v4

    if-ne v4, v2, :cond_1

    .line 113
    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;->delegateEvent(I)V

    goto :goto_0

    .line 114
    :cond_1
    if-eqz p1, :cond_2

    invoke-interface {v0, v3}, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;->getActiveFragment(I)I

    move-result p1

    if-eq p1, v2, :cond_2

    .line 115
    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;->delegateEvent(I)V

    .line 117
    :cond_2
    :goto_0
    return-void
.end method
