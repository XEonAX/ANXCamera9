.class public Lcom/android/camera/fragment/beauty/BeautyBodyFragment;
.super Lcom/android/camera/fragment/beauty/BaseBeautyMakeupFragment;
.source "BeautyBodyFragment.java"


# instance fields
.field private mHeaderImageView:Landroid/widget/ImageView;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 26
    invoke-direct {p0}, Lcom/android/camera/fragment/beauty/BaseBeautyMakeupFragment;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/android/camera/fragment/beauty/BeautyBodyFragment;)Landroid/widget/ImageView;
    .locals 0

    .line 26
    iget-object p0, p0, Lcom/android/camera/fragment/beauty/BeautyBodyFragment;->mHeaderImageView:Landroid/widget/ImageView;

    return-object p0
.end method

.method private reSelectItem()V
    .locals 2

    .line 91
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/BeautyBodyFragment;->mItemList:Ljava/util/List;

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/android/camera/fragment/beauty/BeautyBodyFragment;->mSelectedParam:I

    iget-object v1, p0, Lcom/android/camera/fragment/beauty/BeautyBodyFragment;->mItemList:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 92
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/BeautyBodyFragment;->mItemList:Ljava/util/List;

    iget v1, p0, Lcom/android/camera/fragment/beauty/BeautyBodyFragment;->mSelectedParam:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;

    .line 93
    invoke-virtual {v0}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;->getCameraBeautyParameterType()Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    move-result-object v1

    invoke-static {v1}, Lcom/android/camera/fragment/beauty/BeautyHelper;->setCurrentBeautyParameterType(Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;)V

    .line 94
    invoke-virtual {v0}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;->getCameraBeautyParameterType()Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    move-result-object v0

    iget-object v0, v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->beautyParamType:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    invoke-static {v0}, Lcom/android/camera/fragment/beauty/BeautyHelper;->setType(Lcom/android/camera/fragment/beauty/BeautyParameters$Type;)V

    .line 96
    :cond_0
    return-void
.end method


# virtual methods
.method protected getClassString()Ljava/lang/String;
    .locals 1

    .line 87
    const-class v0, Lcom/android/camera/fragment/beauty/BeautyBodyFragment;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getHeaderView()Landroid/view/View;
    .locals 3

    .line 77
    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/BeautyBodyFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const/high16 v1, 0x7f040000

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 78
    const v1, 0x7f0d0009

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    iput-object v1, p0, Lcom/android/camera/fragment/beauty/BeautyBodyFragment;->mHeaderImageView:Landroid/widget/ImageView;

    .line 79
    iget-object v1, p0, Lcom/android/camera/fragment/beauty/BeautyBodyFragment;->mHeaderImageView:Landroid/widget/ImageView;

    const v2, 0x7f020151

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 80
    const v1, 0x7f0d000a

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 81
    const v2, 0x7f0b020a

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(I)V

    .line 82
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

    sget-object v2, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->HEAD_SLIM_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    const v3, 0x7f02015c

    const v4, 0x7f0b022d

    invoke-direct {v1, v3, v4, v2}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;-><init>(IILcom/android/camera/fragment/beauty/CameraBeautyParameterType;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 33
    new-instance v1, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;

    sget-object v2, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->BODY_SLIM_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    const v3, 0x7f020153

    const v4, 0x7f0b022e

    invoke-direct {v1, v3, v4, v2}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;-><init>(IILcom/android/camera/fragment/beauty/CameraBeautyParameterType;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 34
    new-instance v1, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;

    sget-object v2, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->SHOULDER_SLIM_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    const v3, 0x7f020167

    const v4, 0x7f0b022f

    invoke-direct {v1, v3, v4, v2}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;-><init>(IILcom/android/camera/fragment/beauty/CameraBeautyParameterType;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 35
    new-instance v1, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;

    sget-object v2, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->LEG_SLIM_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    const v3, 0x7f02015e

    const v4, 0x7f0b0230

    invoke-direct {v1, v3, v4, v2}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;-><init>(IILcom/android/camera/fragment/beauty/CameraBeautyParameterType;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 36
    return-object v0
.end method

.method protected onAdapterItemClick(Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;)V
    .locals 1

    .line 41
    invoke-virtual {p1}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;->getCameraBeautyParameterType()Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    move-result-object p1

    iget-object p1, p1, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->beautyParamType:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    invoke-static {p1}, Lcom/android/camera/fragment/beauty/BeautyHelper;->setType(Lcom/android/camera/fragment/beauty/BeautyParameters$Type;)V

    .line 42
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 v0, 0xb4

    invoke-virtual {p1, v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$MakeupProtocol;

    .line 43
    if-eqz p1, :cond_0

    .line 44
    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$MakeupProtocol;->onMakeupItemSelected()V

    .line 46
    :cond_0
    return-void
.end method

.method protected onHeaderClick()V
    .locals 3

    .line 50
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/BeautyBodyFragment;->mHeaderImageView:Landroid/widget/ImageView;

    if-eqz v0, :cond_0

    .line 51
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/BeautyBodyFragment;->mHeaderImageView:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->clearAnimation()V

    .line 52
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/BeautyBodyFragment;->mHeaderImageView:Landroid/widget/ImageView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setRotation(F)V

    .line 53
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/BeautyBodyFragment;->mHeaderImageView:Landroid/widget/ImageView;

    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    const/high16 v1, 0x43b40000    # 360.0f

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->rotation(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    const-wide/16 v1, 0x1f4

    invoke-virtual {v0, v1, v2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    new-instance v1, Lcom/android/camera/fragment/beauty/BeautyBodyFragment$1;

    invoke-direct {v1, p0}, Lcom/android/camera/fragment/beauty/BeautyBodyFragment$1;-><init>(Lcom/android/camera/fragment/beauty/BeautyBodyFragment;)V

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setListener(Landroid/support/v4/view/ViewPropertyAnimatorListener;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    .line 59
    invoke-virtual {v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 61
    :cond_0
    invoke-static {}, Lcom/android/camera/fragment/beauty/BeautyHelper;->resetBeauty()V

    .line 62
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera/fragment/beauty/BeautyBodyFragment;->mSelectedParam:I

    .line 63
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/BeautyBodyFragment;->mMakeupAdapter:Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;

    iget v1, p0, Lcom/android/camera/fragment/beauty/BeautyBodyFragment;->mSelectedParam:I

    invoke-virtual {v0, v1}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;->setSelectedPosition(I)V

    .line 64
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/BeautyBodyFragment;->mLayoutManager:Lcom/android/camera/fragment/beauty/BaseBeautyMakeupFragment$MyLayoutManager;

    iget v1, p0, Lcom/android/camera/fragment/beauty/BeautyBodyFragment;->mSelectedParam:I

    invoke-virtual {v0, v1}, Lcom/android/camera/fragment/beauty/BaseBeautyMakeupFragment$MyLayoutManager;->scrollToPosition(I)V

    .line 65
    invoke-direct {p0}, Lcom/android/camera/fragment/beauty/BeautyBodyFragment;->reSelectItem()V

    .line 66
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xb4

    .line 67
    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$MakeupProtocol;

    .line 68
    if-eqz v0, :cond_1

    .line 69
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$MakeupProtocol;->onMakeupItemSelected()V

    .line 71
    :cond_1
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/BeautyBodyFragment;->mMakeupAdapter:Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;

    invoke-virtual {v0}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;->notifyDataSetChanged()V

    .line 72
    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/BeautyBodyFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0b0231

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/beauty/BeautyBodyFragment;->toast(Ljava/lang/String;)V

    .line 73
    return-void
.end method

.method public setUserVisibleHint(Z)V
    .locals 5

    .line 99
    invoke-super {p0, p1}, Lcom/android/camera/fragment/beauty/BaseBeautyMakeupFragment;->setUserVisibleHint(Z)V

    .line 100
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    .line 101
    const/16 v1, 0xa0

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;

    .line 102
    if-nez v0, :cond_0

    .line 103
    return-void

    .line 105
    :cond_0
    const/4 v1, 0x3

    const/16 v2, 0xfc

    const v3, 0x7f0d00e1

    if-nez p1, :cond_1

    invoke-interface {v0, v3}, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;->getActiveFragment(I)I

    move-result v4

    if-ne v4, v2, :cond_1

    .line 106
    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;->delegateEvent(I)V

    goto :goto_0

    .line 107
    :cond_1
    if-eqz p1, :cond_2

    invoke-interface {v0, v3}, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;->getActiveFragment(I)I

    move-result p1

    if-eq p1, v2, :cond_2

    .line 108
    invoke-direct {p0}, Lcom/android/camera/fragment/beauty/BeautyBodyFragment;->reSelectItem()V

    .line 109
    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;->delegateEvent(I)V

    .line 111
    :cond_2
    :goto_0
    return-void
.end method
