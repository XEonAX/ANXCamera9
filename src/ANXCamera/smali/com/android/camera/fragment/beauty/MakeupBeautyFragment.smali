.class public Lcom/android/camera/fragment/beauty/MakeupBeautyFragment;
.super Lcom/android/camera/fragment/beauty/BaseBeautyMakeupFragment;
.source "MakeupBeautyFragment.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "MakeupBeautyFragment"


# instance fields
.field private mHeaderImageView:Landroid/widget/ImageView;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 24
    invoke-direct {p0}, Lcom/android/camera/fragment/beauty/BaseBeautyMakeupFragment;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/android/camera/fragment/beauty/MakeupBeautyFragment;)Landroid/widget/ImageView;
    .locals 0

    .line 24
    iget-object p0, p0, Lcom/android/camera/fragment/beauty/MakeupBeautyFragment;->mHeaderImageView:Landroid/widget/ImageView;

    return-object p0
.end method

.method private reSelectItem()V
    .locals 2

    .line 125
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/MakeupBeautyFragment;->mItemList:Ljava/util/List;

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/android/camera/fragment/beauty/MakeupBeautyFragment;->mSelectedParam:I

    iget-object v1, p0, Lcom/android/camera/fragment/beauty/MakeupBeautyFragment;->mItemList:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 126
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/MakeupBeautyFragment;->mItemList:Ljava/util/List;

    iget v1, p0, Lcom/android/camera/fragment/beauty/MakeupBeautyFragment;->mSelectedParam:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;

    .line 127
    invoke-virtual {v0}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;->getCameraBeautyParameterType()Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    move-result-object v1

    invoke-static {v1}, Lcom/android/camera/fragment/beauty/BeautyHelper;->setCurrentBeautyParameterType(Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;)V

    .line 128
    invoke-virtual {v0}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;->getCameraBeautyParameterType()Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    move-result-object v0

    iget-object v0, v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->beautyParamType:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    invoke-static {v0}, Lcom/android/camera/fragment/beauty/BeautyHelper;->setType(Lcom/android/camera/fragment/beauty/BeautyParameters$Type;)V

    .line 130
    :cond_0
    return-void
.end method


# virtual methods
.method protected getClassString()Ljava/lang/String;
    .locals 1

    .line 134
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getHeaderView()Landroid/view/View;
    .locals 3

    .line 91
    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/MakeupBeautyFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const/high16 v1, 0x7f040000

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 92
    const v1, 0x7f0d0009

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    iput-object v1, p0, Lcom/android/camera/fragment/beauty/MakeupBeautyFragment;->mHeaderImageView:Landroid/widget/ImageView;

    .line 93
    iget-object v1, p0, Lcom/android/camera/fragment/beauty/MakeupBeautyFragment;->mHeaderImageView:Landroid/widget/ImageView;

    const v2, 0x7f020151

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 94
    const v1, 0x7f0d000a

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 95
    const v2, 0x7f0b020a

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(I)V

    .line 96
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

    .line 30
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentCameraId()I

    move-result v0

    .line 31
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 32
    new-instance v2, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;

    sget-object v3, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->EYEBROW_DYE_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    const v4, 0x7f02015a

    const v5, 0x7f0b0227

    invoke-direct {v2, v4, v5, v3}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;-><init>(IILcom/android/camera/fragment/beauty/CameraBeautyParameterType;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 33
    new-instance v2, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;

    sget-object v3, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->PUPIL_LINE_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    const v4, 0x7f020165

    const v5, 0x7f0b0228

    invoke-direct {v2, v4, v5, v3}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;-><init>(IILcom/android/camera/fragment/beauty/CameraBeautyParameterType;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 34
    new-instance v2, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;

    sget-object v3, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->JELLY_LIPS_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    const v4, 0x7f02015d

    const v5, 0x7f0b0229

    invoke-direct {v2, v4, v5, v3}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;-><init>(IILcom/android/camera/fragment/beauty/CameraBeautyParameterType;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 35
    const/4 v2, 0x1

    if-ne v2, v0, :cond_0

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->fq()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 36
    new-instance v0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;

    const v2, 0x7f020159

    const v3, 0x7f0b020b

    sget-object v4, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->EYE_LIGHT:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    invoke-direct {v0, v2, v3, v4}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;-><init>(IILcom/android/camera/fragment/beauty/CameraBeautyParameterType;)V

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 38
    :cond_0
    new-instance v0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;

    const v2, 0x7f020152

    const v3, 0x7f0b022a

    sget-object v4, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->BLUSHER_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    invoke-direct {v0, v2, v3, v4}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;-><init>(IILcom/android/camera/fragment/beauty/CameraBeautyParameterType;)V

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 39
    return-object v1
.end method

.method protected initView(Landroid/view/View;)V
    .locals 0

    .line 101
    invoke-super {p0, p1}, Lcom/android/camera/fragment/beauty/BaseBeautyMakeupFragment;->initView(Landroid/view/View;)V

    .line 102
    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/MakeupBeautyFragment;->getUserVisibleHint()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 103
    invoke-direct {p0}, Lcom/android/camera/fragment/beauty/MakeupBeautyFragment;->reSelectItem()V

    .line 105
    :cond_0
    return-void
.end method

.method protected onAdapterItemClick(Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;)V
    .locals 2

    .line 44
    invoke-virtual {p1}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;->getCameraBeautyParameterType()Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    move-result-object v0

    iget v0, v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->beautyType:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_1

    .line 45
    invoke-virtual {p1}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;->getCameraBeautyParameterType()Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    move-result-object p1

    iget-object p1, p1, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->beautyParamType:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    invoke-static {p1}, Lcom/android/camera/fragment/beauty/BeautyHelper;->setType(Lcom/android/camera/fragment/beauty/BeautyParameters$Type;)V

    .line 46
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 v0, 0xb4

    .line 47
    invoke-virtual {p1, v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$MakeupProtocol;

    .line 48
    if-eqz p1, :cond_0

    .line 49
    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$MakeupProtocol;->onMakeupItemSelected()V

    .line 51
    :cond_0
    goto :goto_0

    :cond_1
    invoke-virtual {p1}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;->getCameraBeautyParameterType()Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    move-result-object v0

    iget v0, v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->beautyType:I

    const/4 v1, 0x4

    if-ne v0, v1, :cond_2

    .line 52
    invoke-virtual {p1}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;->getCameraBeautyParameterType()Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    move-result-object p1

    iget p1, p1, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->customParameterType:I

    sget-object v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->EYE_LIGHT:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    iget v0, v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->customParameterType:I

    if-ne p1, v0, :cond_2

    .line 54
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 v0, 0xc2

    invoke-virtual {p1, v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$MiBeautyProtocol;

    .line 55
    invoke-interface {p1, v1}, Lcom/android/camera/protocol/ModeProtocol$MiBeautyProtocol;->switchBeautyType(I)V

    .line 58
    :cond_2
    :goto_0
    return-void
.end method

.method protected onHeaderClick()V
    .locals 3

    .line 62
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/MakeupBeautyFragment;->mHeaderImageView:Landroid/widget/ImageView;

    if-eqz v0, :cond_0

    .line 63
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/MakeupBeautyFragment;->mHeaderImageView:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->clearAnimation()V

    .line 64
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/MakeupBeautyFragment;->mHeaderImageView:Landroid/widget/ImageView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setRotation(F)V

    .line 65
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/MakeupBeautyFragment;->mHeaderImageView:Landroid/widget/ImageView;

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

    .line 71
    invoke-virtual {v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 73
    :cond_0
    invoke-static {}, Lcom/android/camera/CameraSettings;->resetEyeLight()V

    .line 74
    sget-object v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->EYEBROW_DYE_RATIO:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    iget-object v0, v0, Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;->beautyParamType:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    invoke-static {v0}, Lcom/android/camera/fragment/beauty/BeautyHelper;->setType(Lcom/android/camera/fragment/beauty/BeautyParameters$Type;)V

    .line 75
    invoke-static {}, Lcom/android/camera/fragment/beauty/BeautyHelper;->resetBeauty()V

    .line 76
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera/fragment/beauty/MakeupBeautyFragment;->mSelectedParam:I

    .line 77
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/MakeupBeautyFragment;->mMakeupAdapter:Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;

    iget v1, p0, Lcom/android/camera/fragment/beauty/MakeupBeautyFragment;->mSelectedParam:I

    invoke-virtual {v0, v1}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;->setSelectedPosition(I)V

    .line 78
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/MakeupBeautyFragment;->mLayoutManager:Lcom/android/camera/fragment/beauty/BaseBeautyMakeupFragment$MyLayoutManager;

    iget v1, p0, Lcom/android/camera/fragment/beauty/MakeupBeautyFragment;->mSelectedParam:I

    invoke-virtual {v0, v1}, Lcom/android/camera/fragment/beauty/BaseBeautyMakeupFragment$MyLayoutManager;->scrollToPosition(I)V

    .line 79
    invoke-direct {p0}, Lcom/android/camera/fragment/beauty/MakeupBeautyFragment;->reSelectItem()V

    .line 80
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xb4

    .line 81
    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$MakeupProtocol;

    .line 82
    if-eqz v0, :cond_1

    .line 83
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$MakeupProtocol;->onMakeupItemSelected()V

    .line 85
    :cond_1
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/MakeupBeautyFragment;->mMakeupAdapter:Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;

    invoke-virtual {v0}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;->notifyDataSetChanged()V

    .line 86
    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/MakeupBeautyFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0b021a

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/beauty/MakeupBeautyFragment;->toast(Ljava/lang/String;)V

    .line 87
    return-void
.end method

.method public setUserVisibleHint(Z)V
    .locals 5

    .line 109
    invoke-super {p0, p1}, Lcom/android/camera/fragment/beauty/BaseBeautyMakeupFragment;->setUserVisibleHint(Z)V

    .line 110
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    .line 111
    const/16 v1, 0xa0

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;

    .line 112
    if-nez v0, :cond_0

    .line 113
    return-void

    .line 115
    :cond_0
    const/4 v1, 0x3

    const/16 v2, 0xfc

    const v3, 0x7f0d00e1

    if-nez p1, :cond_1

    invoke-interface {v0, v3}, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;->getActiveFragment(I)I

    move-result v4

    if-ne v4, v2, :cond_1

    .line 116
    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;->delegateEvent(I)V

    goto :goto_0

    .line 117
    :cond_1
    if-eqz p1, :cond_2

    invoke-interface {v0, v3}, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;->getActiveFragment(I)I

    move-result p1

    if-eq p1, v2, :cond_2

    .line 118
    invoke-direct {p0}, Lcom/android/camera/fragment/beauty/MakeupBeautyFragment;->reSelectItem()V

    .line 119
    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;->delegateEvent(I)V

    .line 122
    :cond_2
    :goto_0
    return-void
.end method
