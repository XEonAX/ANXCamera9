.class public Lcom/android/camera/fragment/beauty/MakeupBeautyFragment;
.super Lcom/android/camera/fragment/beauty/BaseBeautyMakeupFragment;
.source "MakeupBeautyFragment.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "MakeupBeautyFragment"


# instance fields
.field private mHeaderImageView:Lcom/android/camera/ui/ColorImageView;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 25
    invoke-direct {p0}, Lcom/android/camera/fragment/beauty/BaseBeautyMakeupFragment;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/android/camera/fragment/beauty/MakeupBeautyFragment;)Lcom/android/camera/ui/ColorImageView;
    .locals 0

    .line 25
    iget-object p0, p0, Lcom/android/camera/fragment/beauty/MakeupBeautyFragment;->mHeaderImageView:Lcom/android/camera/ui/ColorImageView;

    return-object p0
.end method

.method private reSelectItem()V
    .locals 2

    .line 127
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/MakeupBeautyFragment;->mItemList:Ljava/util/List;

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/android/camera/fragment/beauty/MakeupBeautyFragment;->mSelectedParam:I

    iget-object v1, p0, Lcom/android/camera/fragment/beauty/MakeupBeautyFragment;->mItemList:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 128
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/MakeupBeautyFragment;->mItemList:Ljava/util/List;

    iget v1, p0, Lcom/android/camera/fragment/beauty/MakeupBeautyFragment;->mSelectedParam:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;

    .line 129
    invoke-virtual {v0}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;->getCameraBeautyParameterType()Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    move-result-object v1

    invoke-static {v1}, Lcom/android/camera/fragment/beauty/BeautyHelper;->setCurrentBeautyParameterType(Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;)V

    .line 130
    invoke-virtual {v0}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;->getCameraBeautyParameterType()Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    move-result-object v0

    iget-object v0, v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->beautyParamType:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    invoke-static {v0}, Lcom/android/camera/fragment/beauty/BeautyHelper;->setType(Lcom/android/camera/fragment/beauty/BeautyParameters$Type;)V

    .line 132
    :cond_0
    return-void
.end method


# virtual methods
.method protected getClassString()Ljava/lang/String;
    .locals 1

    .line 136
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getHeaderView()Landroid/view/View;
    .locals 4

    .line 92
    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/MakeupBeautyFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const/high16 v1, 0x7f040000

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 93
    const v1, 0x7f0d000a

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/android/camera/ui/ColorImageView;

    iput-object v1, p0, Lcom/android/camera/fragment/beauty/MakeupBeautyFragment;->mHeaderImageView:Lcom/android/camera/ui/ColorImageView;

    .line 94
    iget-object v1, p0, Lcom/android/camera/fragment/beauty/MakeupBeautyFragment;->mHeaderImageView:Lcom/android/camera/ui/ColorImageView;

    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/MakeupBeautyFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0b0059

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/android/camera/ui/ColorImageView;->setColor(I)V

    .line 95
    iget-object v1, p0, Lcom/android/camera/fragment/beauty/MakeupBeautyFragment;->mHeaderImageView:Lcom/android/camera/ui/ColorImageView;

    const v2, 0x7f020175

    invoke-virtual {v1, v2}, Lcom/android/camera/ui/ColorImageView;->setImageResource(I)V

    .line 96
    const v1, 0x7f0d000b

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 97
    const v2, 0x7f090213

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(I)V

    .line 98
    return-object v0
.end method

.method protected initItems()Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;",
            ">;"
        }
    .end annotation

    .line 31
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentCameraId()I

    move-result v0

    .line 32
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 33
    new-instance v2, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;

    sget-object v3, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->EYEBROW_DYE_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    const v4, 0x7f02017d

    const v5, 0x7f090232

    invoke-direct {v2, v4, v5, v3}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;-><init>(IILcom/android/camera/fragment/beauty/CameraBeautyParameterType;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 34
    new-instance v2, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;

    sget-object v3, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->PUPIL_LINE_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    const v4, 0x7f020188

    const v5, 0x7f090233

    invoke-direct {v2, v4, v5, v3}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;-><init>(IILcom/android/camera/fragment/beauty/CameraBeautyParameterType;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 35
    new-instance v2, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;

    sget-object v3, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->JELLY_LIPS_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    const v4, 0x7f020180

    const v5, 0x7f090234

    invoke-direct {v2, v4, v5, v3}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;-><init>(IILcom/android/camera/fragment/beauty/CameraBeautyParameterType;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 36
    const/4 v2, 0x1

    if-ne v2, v0, :cond_0

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->ft()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 37
    new-instance v0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;

    const v2, 0x7f02017c

    const v3, 0x7f090214

    sget-object v4, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->EYE_LIGHT:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    invoke-direct {v0, v2, v3, v4}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;-><init>(IILcom/android/camera/fragment/beauty/CameraBeautyParameterType;)V

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 39
    :cond_0
    new-instance v0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;

    const v2, 0x7f020176

    const v3, 0x7f090235

    sget-object v4, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->BLUSHER_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    invoke-direct {v0, v2, v3, v4}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;-><init>(IILcom/android/camera/fragment/beauty/CameraBeautyParameterType;)V

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 40
    return-object v1
.end method

.method protected initView(Landroid/view/View;)V
    .locals 0

    .line 103
    invoke-super {p0, p1}, Lcom/android/camera/fragment/beauty/BaseBeautyMakeupFragment;->initView(Landroid/view/View;)V

    .line 104
    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/MakeupBeautyFragment;->getUserVisibleHint()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 105
    invoke-direct {p0}, Lcom/android/camera/fragment/beauty/MakeupBeautyFragment;->reSelectItem()V

    .line 107
    :cond_0
    return-void
.end method

.method protected onAdapterItemClick(Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;)V
    .locals 2

    .line 45
    invoke-virtual {p1}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;->getCameraBeautyParameterType()Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    move-result-object v0

    iget v0, v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->beautyType:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_1

    .line 46
    invoke-virtual {p1}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;->getCameraBeautyParameterType()Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    move-result-object p1

    iget-object p1, p1, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->beautyParamType:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    invoke-static {p1}, Lcom/android/camera/fragment/beauty/BeautyHelper;->setType(Lcom/android/camera/fragment/beauty/BeautyParameters$Type;)V

    .line 47
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 v0, 0xb4

    .line 48
    invoke-virtual {p1, v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$MakeupProtocol;

    .line 49
    if-eqz p1, :cond_0

    .line 50
    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$MakeupProtocol;->onMakeupItemSelected()V

    .line 52
    :cond_0
    goto :goto_0

    :cond_1
    invoke-virtual {p1}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;->getCameraBeautyParameterType()Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    move-result-object v0

    iget v0, v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->beautyType:I

    const/4 v1, 0x4

    if-ne v0, v1, :cond_2

    .line 53
    invoke-virtual {p1}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;->getCameraBeautyParameterType()Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    move-result-object p1

    iget p1, p1, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->customParameterType:I

    sget-object v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->EYE_LIGHT:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    iget v0, v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->customParameterType:I

    if-ne p1, v0, :cond_2

    .line 55
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 v0, 0xc2

    invoke-virtual {p1, v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$MiBeautyProtocol;

    .line 56
    invoke-interface {p1, v1}, Lcom/android/camera/protocol/ModeProtocol$MiBeautyProtocol;->switchBeautyType(I)V

    .line 59
    :cond_2
    :goto_0
    return-void
.end method

.method protected onHeaderClick()V
    .locals 3

    .line 63
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/MakeupBeautyFragment;->mHeaderImageView:Lcom/android/camera/ui/ColorImageView;

    if-eqz v0, :cond_0

    .line 64
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/MakeupBeautyFragment;->mHeaderImageView:Lcom/android/camera/ui/ColorImageView;

    invoke-virtual {v0}, Lcom/android/camera/ui/ColorImageView;->clearAnimation()V

    .line 65
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/MakeupBeautyFragment;->mHeaderImageView:Lcom/android/camera/ui/ColorImageView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/ColorImageView;->setRotation(F)V

    .line 66
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/MakeupBeautyFragment;->mHeaderImageView:Lcom/android/camera/ui/ColorImageView;

    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    const/high16 v1, 0x43b40000    # 360.0f

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->rotation(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    const-wide/16 v1, 0x1f4

    invoke-virtual {v0, v1, v2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    new-instance v1, Lcom/android/camera/fragment/beauty/MakeupBeautyFragment$1;

    invoke-direct {v1, p0}, Lcom/android/camera/fragment/beauty/MakeupBeautyFragment$1;-><init>(Lcom/android/camera/fragment/beauty/MakeupBeautyFragment;)V

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setListener(Landroid/support/v4/view/ViewPropertyAnimatorListener;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    .line 72
    invoke-virtual {v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 74
    :cond_0
    invoke-static {}, Lcom/android/camera/CameraSettings;->resetEyeLight()V

    .line 75
    sget-object v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->EYEBROW_DYE_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    iget-object v0, v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->beautyParamType:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    invoke-static {v0}, Lcom/android/camera/fragment/beauty/BeautyHelper;->setType(Lcom/android/camera/fragment/beauty/BeautyParameters$Type;)V

    .line 76
    invoke-static {}, Lcom/android/camera/fragment/beauty/BeautyHelper;->resetBeauty()V

    .line 77
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera/fragment/beauty/MakeupBeautyFragment;->mSelectedParam:I

    .line 78
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/MakeupBeautyFragment;->mMakeupAdapter:Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;

    iget v1, p0, Lcom/android/camera/fragment/beauty/MakeupBeautyFragment;->mSelectedParam:I

    invoke-virtual {v0, v1}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;->setSelectedPosition(I)V

    .line 79
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/MakeupBeautyFragment;->mLayoutManager:Lcom/android/camera/fragment/beauty/BaseBeautyMakeupFragment$MyLayoutManager;

    iget v1, p0, Lcom/android/camera/fragment/beauty/MakeupBeautyFragment;->mSelectedParam:I

    invoke-virtual {v0, v1}, Lcom/android/camera/fragment/beauty/BaseBeautyMakeupFragment$MyLayoutManager;->scrollToPosition(I)V

    .line 80
    invoke-direct {p0}, Lcom/android/camera/fragment/beauty/MakeupBeautyFragment;->reSelectItem()V

    .line 81
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xb4

    .line 82
    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$MakeupProtocol;

    .line 83
    if-eqz v0, :cond_1

    .line 84
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$MakeupProtocol;->onMakeupItemSelected()V

    .line 86
    :cond_1
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/MakeupBeautyFragment;->mMakeupAdapter:Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;

    invoke-virtual {v0}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;->notifyDataSetChanged()V

    .line 87
    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/MakeupBeautyFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f090223

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/beauty/MakeupBeautyFragment;->toast(Ljava/lang/String;)V

    .line 88
    return-void
.end method

.method public setUserVisibleHint(Z)V
    .locals 5

    .line 111
    invoke-super {p0, p1}, Lcom/android/camera/fragment/beauty/BaseBeautyMakeupFragment;->setUserVisibleHint(Z)V

    .line 112
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    .line 113
    const/16 v1, 0xa0

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;

    .line 114
    if-nez v0, :cond_0

    .line 115
    return-void

    .line 117
    :cond_0
    const/4 v1, 0x3

    const/16 v2, 0xfc

    const v3, 0x7f0d00fe

    if-nez p1, :cond_1

    invoke-interface {v0, v3}, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;->getActiveFragment(I)I

    move-result v4

    if-ne v4, v2, :cond_1

    .line 118
    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;->delegateEvent(I)V

    goto :goto_0

    .line 119
    :cond_1
    if-eqz p1, :cond_2

    invoke-interface {v0, v3}, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;->getActiveFragment(I)I

    move-result p1

    if-eq p1, v2, :cond_2

    .line 120
    invoke-direct {p0}, Lcom/android/camera/fragment/beauty/MakeupBeautyFragment;->reSelectItem()V

    .line 121
    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;->delegateEvent(I)V

    .line 124
    :cond_2
    :goto_0
    return-void
.end method
