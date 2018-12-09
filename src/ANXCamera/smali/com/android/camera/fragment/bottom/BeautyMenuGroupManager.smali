.class public Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;
.super Ljava/lang/Object;
.source "BeautyMenuGroupManager.java"


# instance fields
.field private mBeautyMenuAnimator:Lcom/android/camera/fragment/bottom/BeautyMenuAnimator;

.field private mBeautyMenuList:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Lcom/android/camera/fragment/bottom/AbBottomMenu;",
            ">;"
        }
    .end annotation
.end field

.field private mBottomMenu:Lcom/android/camera/fragment/bottom/AbBottomMenu;

.field private mContainerView:Landroid/widget/LinearLayout;

.field private mContext:Landroid/content/Context;

.field private mCurrentMenuGroupType:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/widget/LinearLayout;)V
    .locals 1

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    const/16 v0, 0xa0

    iput v0, p0, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->mCurrentMenuGroupType:I

    .line 19
    iput-object p2, p0, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->mContainerView:Landroid/widget/LinearLayout;

    .line 20
    iput-object p1, p0, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->mContext:Landroid/content/Context;

    .line 21
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->mContainerView:Landroid/widget/LinearLayout;

    invoke-static {p1}, Lcom/android/camera/fragment/bottom/BeautyMenuAnimator;->animator(Landroid/view/ViewGroup;)Lcom/android/camera/fragment/bottom/BeautyMenuAnimator;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->mBeautyMenuAnimator:Lcom/android/camera/fragment/bottom/BeautyMenuAnimator;

    .line 22
    invoke-direct {p0}, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->initView()V

    .line 23
    return-void
.end method

.method private initView()V
    .locals 1

    .line 36
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->getCurrentBeautyMenuType()I

    move-result v0

    invoke-direct {p0, v0}, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->updateCurrentMenu(I)V

    .line 37
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->mBottomMenu:Lcom/android/camera/fragment/bottom/AbBottomMenu;

    invoke-virtual {v0}, Lcom/android/camera/fragment/bottom/AbBottomMenu;->addAllView()V

    .line 38
    return-void
.end method

.method private updateCurrentMenu(I)V
    .locals 4

    .line 41
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->mBeautyMenuList:Landroid/util/SparseArray;

    if-eqz v0, :cond_0

    .line 42
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->mBeautyMenuList:Landroid/util/SparseArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera/fragment/bottom/AbBottomMenu;

    .line 43
    if-eqz v0, :cond_0

    .line 44
    iput-object v0, p0, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->mBottomMenu:Lcom/android/camera/fragment/bottom/AbBottomMenu;

    .line 45
    return-void

    .line 48
    :cond_0
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->mBeautyMenuList:Landroid/util/SparseArray;

    .line 49
    packed-switch p1, :pswitch_data_0

    .line 76
    new-instance v0, Lcom/android/camera/fragment/bottom/FrontBeautyMenu;

    iget-object v1, p0, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->mContainerView:Landroid/widget/LinearLayout;

    iget-object v3, p0, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->mBeautyMenuAnimator:Lcom/android/camera/fragment/bottom/BeautyMenuAnimator;

    invoke-direct {v0, v1, v2, v3}, Lcom/android/camera/fragment/bottom/FrontBeautyMenu;-><init>(Landroid/content/Context;Landroid/widget/LinearLayout;Lcom/android/camera/fragment/bottom/BeautyMenuAnimator;)V

    .line 77
    iput-object v0, p0, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->mBottomMenu:Lcom/android/camera/fragment/bottom/AbBottomMenu;

    .line 78
    iget-object v1, p0, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->mBeautyMenuList:Landroid/util/SparseArray;

    invoke-virtual {v1, p1, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto :goto_0

    .line 71
    :pswitch_0
    new-instance v0, Lcom/android/camera/fragment/bottom/LiveSpeedMenu;

    iget-object v1, p0, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->mContainerView:Landroid/widget/LinearLayout;

    iget-object v3, p0, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->mBeautyMenuAnimator:Lcom/android/camera/fragment/bottom/BeautyMenuAnimator;

    invoke-direct {v0, v1, v2, v3}, Lcom/android/camera/fragment/bottom/LiveSpeedMenu;-><init>(Landroid/content/Context;Landroid/widget/LinearLayout;Lcom/android/camera/fragment/bottom/BeautyMenuAnimator;)V

    .line 72
    iput-object v0, p0, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->mBottomMenu:Lcom/android/camera/fragment/bottom/AbBottomMenu;

    .line 73
    iget-object v1, p0, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->mBeautyMenuList:Landroid/util/SparseArray;

    invoke-virtual {v1, p1, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 74
    goto :goto_0

    .line 66
    :pswitch_1
    new-instance v0, Lcom/android/camera/fragment/bottom/LiveStickerMenu;

    iget-object v1, p0, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->mContainerView:Landroid/widget/LinearLayout;

    iget-object v3, p0, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->mBeautyMenuAnimator:Lcom/android/camera/fragment/bottom/BeautyMenuAnimator;

    invoke-direct {v0, v1, v2, v3}, Lcom/android/camera/fragment/bottom/LiveStickerMenu;-><init>(Landroid/content/Context;Landroid/widget/LinearLayout;Lcom/android/camera/fragment/bottom/BeautyMenuAnimator;)V

    .line 67
    iput-object v0, p0, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->mBottomMenu:Lcom/android/camera/fragment/bottom/AbBottomMenu;

    .line 68
    iget-object v1, p0, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->mBeautyMenuList:Landroid/util/SparseArray;

    invoke-virtual {v1, p1, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 69
    goto :goto_0

    .line 61
    :pswitch_2
    new-instance v0, Lcom/android/camera/fragment/bottom/LiveBeautyMenu;

    iget-object v1, p0, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->mContainerView:Landroid/widget/LinearLayout;

    iget-object v3, p0, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->mBeautyMenuAnimator:Lcom/android/camera/fragment/bottom/BeautyMenuAnimator;

    invoke-direct {v0, v1, v2, v3}, Lcom/android/camera/fragment/bottom/LiveBeautyMenu;-><init>(Landroid/content/Context;Landroid/widget/LinearLayout;Lcom/android/camera/fragment/bottom/BeautyMenuAnimator;)V

    .line 62
    iput-object v0, p0, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->mBottomMenu:Lcom/android/camera/fragment/bottom/AbBottomMenu;

    .line 63
    iget-object v1, p0, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->mBeautyMenuList:Landroid/util/SparseArray;

    invoke-virtual {v1, p1, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 64
    goto :goto_0

    .line 56
    :pswitch_3
    new-instance v0, Lcom/android/camera/fragment/bottom/BackBeautyMenu;

    iget-object v1, p0, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->mContainerView:Landroid/widget/LinearLayout;

    iget-object v3, p0, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->mBeautyMenuAnimator:Lcom/android/camera/fragment/bottom/BeautyMenuAnimator;

    invoke-direct {v0, v1, v2, v3}, Lcom/android/camera/fragment/bottom/BackBeautyMenu;-><init>(Landroid/content/Context;Landroid/widget/LinearLayout;Lcom/android/camera/fragment/bottom/BeautyMenuAnimator;)V

    .line 57
    iput-object v0, p0, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->mBottomMenu:Lcom/android/camera/fragment/bottom/AbBottomMenu;

    .line 58
    iget-object v1, p0, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->mBeautyMenuList:Landroid/util/SparseArray;

    invoke-virtual {v1, p1, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 59
    goto :goto_0

    .line 51
    :pswitch_4
    new-instance v0, Lcom/android/camera/fragment/bottom/FrontBeautyMenu;

    iget-object v1, p0, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->mContainerView:Landroid/widget/LinearLayout;

    iget-object v3, p0, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->mBeautyMenuAnimator:Lcom/android/camera/fragment/bottom/BeautyMenuAnimator;

    invoke-direct {v0, v1, v2, v3}, Lcom/android/camera/fragment/bottom/FrontBeautyMenu;-><init>(Landroid/content/Context;Landroid/widget/LinearLayout;Lcom/android/camera/fragment/bottom/BeautyMenuAnimator;)V

    .line 52
    iput-object v0, p0, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->mBottomMenu:Lcom/android/camera/fragment/bottom/AbBottomMenu;

    .line 53
    iget-object v1, p0, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->mBeautyMenuList:Landroid/util/SparseArray;

    invoke-virtual {v1, p1, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 54
    nop

    .line 81
    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0xa1
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public animateExpanding(Z)V
    .locals 0

    .line 88
    if-eqz p1, :cond_0

    .line 89
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->mBeautyMenuAnimator:Lcom/android/camera/fragment/bottom/BeautyMenuAnimator;

    invoke-virtual {p1}, Lcom/android/camera/fragment/bottom/BeautyMenuAnimator;->expandAnimate()V

    goto :goto_0

    .line 91
    :cond_0
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->mBeautyMenuAnimator:Lcom/android/camera/fragment/bottom/BeautyMenuAnimator;

    invoke-virtual {p1}, Lcom/android/camera/fragment/bottom/BeautyMenuAnimator;->shrinkAnimate()V

    .line 93
    :goto_0
    return-void
.end method

.method public getBottomMenu()Lcom/android/camera/fragment/bottom/AbBottomMenu;
    .locals 1

    .line 106
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->mBottomMenu:Lcom/android/camera/fragment/bottom/AbBottomMenu;

    return-object v0
.end method

.method public getCurrentBeautyMenuType()I
    .locals 1

    .line 32
    iget v0, p0, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->mCurrentMenuGroupType:I

    return v0
.end method

.method public getView()Landroid/view/View;
    .locals 1

    .line 102
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->mContainerView:Landroid/widget/LinearLayout;

    return-object v0
.end method

.method public setCurrentBeautyMenuType(I)V
    .locals 0

    .line 26
    iput p1, p0, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->mCurrentMenuGroupType:I

    .line 27
    invoke-direct {p0, p1}, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->updateCurrentMenu(I)V

    .line 28
    return-void
.end method

.method public setVisibility(I)V
    .locals 1

    .line 96
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->mContainerView:Landroid/widget/LinearLayout;

    if-eqz v0, :cond_0

    .line 97
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->mContainerView:Landroid/widget/LinearLayout;

    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 99
    :cond_0
    return-void
.end method

.method public switchMenu()V
    .locals 1

    .line 84
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->mBottomMenu:Lcom/android/camera/fragment/bottom/AbBottomMenu;

    invoke-virtual {v0}, Lcom/android/camera/fragment/bottom/AbBottomMenu;->switchMenu()V

    .line 85
    return-void
.end method
