.class public Lcom/android/camera/fragment/bottom/FrontBeautyMenu;
.super Lcom/android/camera/fragment/bottom/AbBottomMenu;
.source "FrontBeautyMenu.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field private mFrontBeautyMenuTabList:Landroid/util/SparseArray;

.field private mLastCamerId:I

.field private mMenuTextViewList:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Lcom/android/camera/ui/ColorActivateTextView;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/widget/LinearLayout;Lcom/android/camera/fragment/bottom/BeautyMenuAnimator;)V
    .locals 0

    .line 29
    invoke-direct {p0, p1, p2, p3}, Lcom/android/camera/fragment/bottom/AbBottomMenu;-><init>(Landroid/content/Context;Landroid/widget/LinearLayout;Lcom/android/camera/fragment/bottom/BeautyMenuAnimator;)V

    .line 26
    const/4 p1, -0x1

    iput p1, p0, Lcom/android/camera/fragment/bottom/FrontBeautyMenu;->mLastCamerId:I

    .line 30
    return-void
.end method

.method private isCameraSwitch()Z
    .locals 2

    .line 180
    invoke-static {}, Lcom/android/camera/data/DataRepository;->provider()Lcom/android/camera/data/provider/DataProvider;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider;->dataGlobal()Lcom/android/camera/data/provider/DataProvider$ProviderEvent;

    move-result-object v0

    check-cast v0, Lcom/android/camera/data/data/global/DataItemGlobal;

    .line 181
    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentCameraId()I

    move-result v0

    .line 182
    iget v1, p0, Lcom/android/camera/fragment/bottom/FrontBeautyMenu;->mLastCamerId:I

    if-eq v1, v0, :cond_0

    .line 183
    const/4 v0, 0x1

    return v0

    .line 185
    :cond_0
    iput v0, p0, Lcom/android/camera/fragment/bottom/FrontBeautyMenu;->mLastCamerId:I

    .line 186
    const/4 v0, 0x0

    return v0
.end method

.method private isJustBeautyTab()Z
    .locals 2

    .line 169
    invoke-static {}, Lcom/android/camera/fragment/beauty/BeautyParameters;->isCurrentModeSupportVideoBeauty()Z

    move-result v0

    .line 170
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontPortrait()Z

    move-result v1

    .line 171
    if-nez v0, :cond_1

    if-eqz v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method


# virtual methods
.method public addAllView()V
    .locals 9

    .line 34
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/FrontBeautyMenu;->mMenuTextViewList:Landroid/util/SparseArray;

    .line 35
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FrontBeautyMenu;->getMenuData()Landroid/util/SparseArray;

    move-result-object v0

    .line 36
    const/4 v1, 0x0

    move v2, v1

    :goto_0
    invoke-virtual {v0}, Landroid/util/SparseArray;->size()I

    move-result v3

    const/4 v4, 0x1

    if-ge v2, v3, :cond_4

    .line 37
    invoke-virtual {v0, v2}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/camera/fragment/beauty/MenuItem;

    .line 44
    invoke-direct {p0}, Lcom/android/camera/fragment/bottom/FrontBeautyMenu;->isJustBeautyTab()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 45
    iget v5, v3, Lcom/android/camera/fragment/beauty/MenuItem;->type:I

    if-eq v5, v4, :cond_0

    .line 46
    goto/16 :goto_3

    .line 51
    :cond_0
    iget-object v5, p0, Lcom/android/camera/fragment/bottom/FrontBeautyMenu;->mContext:Landroid/content/Context;

    invoke-static {v5}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v5

    .line 52
    const v6, 0x7f040002

    iget-object v7, p0, Lcom/android/camera/fragment/bottom/FrontBeautyMenu;->mContainerView:Landroid/widget/LinearLayout;

    .line 53
    invoke-virtual {v5, v6, v7, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v5

    check-cast v5, Lcom/android/camera/ui/ColorActivateTextView;

    .line 55
    const v6, -0x66000001

    invoke-virtual {v5, v6}, Lcom/android/camera/ui/ColorActivateTextView;->setNormalCor(I)V

    .line 57
    invoke-direct {p0}, Lcom/android/camera/fragment/bottom/FrontBeautyMenu;->isJustBeautyTab()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 58
    const v6, -0x4c000001

    invoke-virtual {v5, v6}, Lcom/android/camera/ui/ColorActivateTextView;->setActivateColor(I)V

    goto :goto_1

    .line 60
    :cond_1
    const v6, -0xff5701

    invoke-virtual {v5, v6}, Lcom/android/camera/ui/ColorActivateTextView;->setActivateColor(I)V

    .line 62
    :goto_1
    iget-object v6, v3, Lcom/android/camera/fragment/beauty/MenuItem;->text:Ljava/lang/String;

    invoke-virtual {v5, v6}, Lcom/android/camera/ui/ColorActivateTextView;->setText(Ljava/lang/CharSequence;)V

    .line 63
    iget v6, v3, Lcom/android/camera/fragment/beauty/MenuItem;->type:I

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/android/camera/ui/ColorActivateTextView;->setTag(Ljava/lang/Object;)V

    .line 64
    invoke-virtual {v5, p0}, Lcom/android/camera/ui/ColorActivateTextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 65
    iget-boolean v6, v3, Lcom/android/camera/fragment/beauty/MenuItem;->redDot:Z

    if-eqz v6, :cond_2

    .line 66
    iget-object v6, p0, Lcom/android/camera/fragment/bottom/FrontBeautyMenu;->mContext:Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const v7, 0x7f0200e5

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v6

    .line 67
    iget-object v7, p0, Lcom/android/camera/fragment/bottom/FrontBeautyMenu;->mContext:Landroid/content/Context;

    invoke-virtual {v7}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    const v8, 0x7f0a006a

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v7

    .line 68
    invoke-virtual {v5, v7}, Lcom/android/camera/ui/ColorActivateTextView;->setCompoundDrawablePadding(I)V

    .line 69
    const/4 v7, 0x0

    invoke-virtual {v5, v7, v7, v6, v7}, Lcom/android/camera/ui/ColorActivateTextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 72
    :cond_2
    iget v6, v3, Lcom/android/camera/fragment/beauty/MenuItem;->type:I

    if-ne v4, v6, :cond_3

    .line 73
    invoke-virtual {v5, v4}, Lcom/android/camera/ui/ColorActivateTextView;->setActivated(Z)V

    .line 74
    iput-object v5, p0, Lcom/android/camera/fragment/bottom/FrontBeautyMenu;->mCurrentBeautyTextView:Lcom/android/camera/ui/ColorActivateTextView;

    goto :goto_2

    .line 76
    :cond_3
    invoke-virtual {v5, v1}, Lcom/android/camera/ui/ColorActivateTextView;->setActivated(Z)V

    .line 78
    :goto_2
    iget-object v4, p0, Lcom/android/camera/fragment/bottom/FrontBeautyMenu;->mMenuTextViewList:Landroid/util/SparseArray;

    iget v3, v3, Lcom/android/camera/fragment/beauty/MenuItem;->type:I

    invoke-virtual {v4, v3, v5}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 79
    iget-object v3, p0, Lcom/android/camera/fragment/bottom/FrontBeautyMenu;->mContainerView:Landroid/widget/LinearLayout;

    invoke-virtual {v3, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 36
    :goto_3
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_0

    .line 81
    :cond_4
    const-string v0, "pref_camera_face_beauty_key"

    invoke-static {}, Lcom/android/camera/CameraSettings;->getFaceBeautySwitch()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 82
    invoke-virtual {p0, v4}, Lcom/android/camera/fragment/bottom/FrontBeautyMenu;->selectBeautyType(I)V

    goto :goto_4

    .line 84
    :cond_5
    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/bottom/FrontBeautyMenu;->selectBeautyType(I)V

    .line 86
    :goto_4
    return-void
.end method

.method getChildMenuViewList()Landroid/util/SparseArray;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/util/SparseArray<",
            "Lcom/android/camera/ui/ColorActivateTextView;",
            ">;"
        }
    .end annotation

    .line 91
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FrontBeautyMenu;->mMenuTextViewList:Landroid/util/SparseArray;

    return-object v0
.end method

.method getDefaultType()I
    .locals 1

    .line 134
    const/4 v0, 0x1

    return v0
.end method

.method getMenuData()Landroid/util/SparseArray;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/util/SparseArray<",
            "Lcom/android/camera/fragment/beauty/MenuItem;",
            ">;"
        }
    .end annotation

    .line 96
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FrontBeautyMenu;->mFrontBeautyMenuTabList:Landroid/util/SparseArray;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FrontBeautyMenu;->mFrontBeautyMenuTabList:Landroid/util/SparseArray;

    invoke-virtual {v0}, Landroid/util/SparseArray;->size()I

    move-result v0

    if-lez v0, :cond_0

    .line 97
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FrontBeautyMenu;->mFrontBeautyMenuTabList:Landroid/util/SparseArray;

    return-object v0

    .line 99
    :cond_0
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/FrontBeautyMenu;->mFrontBeautyMenuTabList:Landroid/util/SparseArray;

    .line 101
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f0901d3

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 102
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f0901d4

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 103
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f090234

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 104
    invoke-static {}, Lcom/mi/config/b;->ia()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 105
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f0901d5

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 106
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v1

    const v3, 0x7f0901d6

    invoke-virtual {v1, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 109
    :cond_1
    new-instance v3, Lcom/android/camera/fragment/beauty/MenuItem;

    invoke-direct {v3}, Lcom/android/camera/fragment/beauty/MenuItem;-><init>()V

    .line 110
    const/4 v4, 0x1

    iput v4, v3, Lcom/android/camera/fragment/beauty/MenuItem;->type:I

    .line 111
    iput-object v0, v3, Lcom/android/camera/fragment/beauty/MenuItem;->text:Ljava/lang/String;

    .line 112
    const/4 v0, 0x0

    iput v0, v3, Lcom/android/camera/fragment/beauty/MenuItem;->number:I

    .line 114
    new-instance v0, Lcom/android/camera/fragment/beauty/MenuItem;

    invoke-direct {v0}, Lcom/android/camera/fragment/beauty/MenuItem;-><init>()V

    .line 115
    const/4 v5, 0x2

    iput v5, v0, Lcom/android/camera/fragment/beauty/MenuItem;->type:I

    .line 116
    iput-object v1, v0, Lcom/android/camera/fragment/beauty/MenuItem;->text:Ljava/lang/String;

    .line 117
    iput v4, v0, Lcom/android/camera/fragment/beauty/MenuItem;->number:I

    .line 118
    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FrontBeautyMenu;->mFrontBeautyMenuTabList:Landroid/util/SparseArray;

    invoke-virtual {v1, v4, v3}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 119
    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FrontBeautyMenu;->mFrontBeautyMenuTabList:Landroid/util/SparseArray;

    invoke-virtual {v1, v5, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 121
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->fp()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 122
    invoke-static {}, Lcom/android/camera/CameraSettings;->isSupportBeautyMakeup()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 123
    new-instance v0, Lcom/android/camera/fragment/beauty/MenuItem;

    invoke-direct {v0}, Lcom/android/camera/fragment/beauty/MenuItem;-><init>()V

    .line 124
    const/4 v1, 0x3

    iput v1, v0, Lcom/android/camera/fragment/beauty/MenuItem;->type:I

    .line 125
    iput-object v2, v0, Lcom/android/camera/fragment/beauty/MenuItem;->text:Ljava/lang/String;

    .line 126
    iput v5, v0, Lcom/android/camera/fragment/beauty/MenuItem;->number:I

    .line 127
    iget-object v2, p0, Lcom/android/camera/fragment/bottom/FrontBeautyMenu;->mFrontBeautyMenuTabList:Landroid/util/SparseArray;

    invoke-virtual {v2, v1, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 129
    :cond_2
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FrontBeautyMenu;->mFrontBeautyMenuTabList:Landroid/util/SparseArray;

    return-object v0
.end method

.method public isRefreshUI()Z
    .locals 1

    .line 191
    invoke-direct {p0}, Lcom/android/camera/fragment/bottom/FrontBeautyMenu;->isCameraSwitch()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-direct {p0}, Lcom/android/camera/fragment/bottom/FrontBeautyMenu;->isJustBeautyTab()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 153
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    .line 154
    invoke-virtual {p0, p1}, Lcom/android/camera/fragment/bottom/FrontBeautyMenu;->selectBeautyType(I)V

    .line 155
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xc2

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$MiBeautyProtocol;

    .line 156
    invoke-interface {v0, p1}, Lcom/android/camera/protocol/ModeProtocol$MiBeautyProtocol;->switchBeautyType(I)V

    .line 157
    const/4 v0, 0x3

    if-ne p1, v0, :cond_0

    invoke-static {}, Lcom/android/camera/CameraSettings;->isBeautyMakeupClicked()Z

    move-result p1

    if-nez p1, :cond_0

    .line 158
    invoke-static {}, Lcom/android/camera/CameraSettings;->setBeautyMakeupClicked()V

    .line 159
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FrontBeautyMenu;->mCurrentBeautyTextView:Lcom/android/camera/ui/ColorActivateTextView;

    const/4 v0, 0x0

    invoke-virtual {p1, v0, v0, v0, v0}, Lcom/android/camera/ui/ColorActivateTextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 161
    :cond_0
    return-void
.end method

.method switchMenu()V
    .locals 1

    .line 139
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FrontBeautyMenu;->mBeautyMenuAnimator:Lcom/android/camera/fragment/bottom/BeautyMenuAnimator;

    if-eqz v0, :cond_0

    .line 140
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FrontBeautyMenu;->mBeautyMenuAnimator:Lcom/android/camera/fragment/bottom/BeautyMenuAnimator;

    invoke-virtual {v0}, Lcom/android/camera/fragment/bottom/BeautyMenuAnimator;->resetAll()V

    .line 142
    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FrontBeautyMenu;->mContainerView:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 143
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FrontBeautyMenu;->addAllView()V

    .line 144
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FrontBeautyMenu;->getDefaultType()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/bottom/FrontBeautyMenu;->selectBeautyType(I)V

    .line 145
    invoke-static {}, Lcom/android/camera/CameraSettings;->getFaceBeautifyValue()Ljava/lang/String;

    move-result-object v0

    .line 146
    invoke-static {v0}, Lcom/android/camera/CameraSettings;->isFaceBeautyOn(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 147
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FrontBeautyMenu;->hideAdvance()V

    .line 149
    :cond_1
    return-void
.end method
