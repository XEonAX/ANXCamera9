.class public Lcom/android/camera/fragment/bottom/BackBeautyMenu;
.super Lcom/android/camera/fragment/bottom/AbBottomMenu;
.source "BackBeautyMenu.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field private mBackBeautyMenuTabList:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Lcom/android/camera/fragment/beauty/MenuItem;",
            ">;"
        }
    .end annotation
.end field

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

    .line 25
    invoke-direct {p0, p1, p2, p3}, Lcom/android/camera/fragment/bottom/AbBottomMenu;-><init>(Landroid/content/Context;Landroid/widget/LinearLayout;Lcom/android/camera/fragment/bottom/BeautyMenuAnimator;)V

    .line 26
    return-void
.end method

.method private isJustBeautyTab()Z
    .locals 1

    .line 128
    invoke-static {}, Lcom/android/camera/CameraSettings;->isBackPortrait()Z

    move-result v0

    .line 129
    return v0
.end method


# virtual methods
.method addAllView()V
    .locals 8

    .line 30
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/BackBeautyMenu;->mMenuTextViewList:Landroid/util/SparseArray;

    .line 31
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/BackBeautyMenu;->getMenuData()Landroid/util/SparseArray;

    move-result-object v0

    .line 32
    const/4 v1, 0x0

    move v2, v1

    :goto_0
    invoke-virtual {v0}, Landroid/util/SparseArray;->size()I

    move-result v3

    const/4 v4, 0x1

    if-ge v2, v3, :cond_3

    .line 33
    invoke-virtual {v0, v2}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/camera/fragment/beauty/MenuItem;

    .line 35
    invoke-direct {p0}, Lcom/android/camera/fragment/bottom/BackBeautyMenu;->isJustBeautyTab()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 36
    iget v5, v3, Lcom/android/camera/fragment/beauty/MenuItem;->type:I

    if-eq v5, v4, :cond_0

    .line 37
    goto :goto_3

    .line 41
    :cond_0
    iget-object v5, p0, Lcom/android/camera/fragment/bottom/BackBeautyMenu;->mContext:Landroid/content/Context;

    invoke-static {v5}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v5

    .line 42
    const v6, 0x7f040002

    iget-object v7, p0, Lcom/android/camera/fragment/bottom/BackBeautyMenu;->mContainerView:Landroid/widget/LinearLayout;

    .line 43
    invoke-virtual {v5, v6, v7, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v5

    check-cast v5, Lcom/android/camera/ui/ColorActivateTextView;

    .line 45
    const v6, -0x66000001

    invoke-virtual {v5, v6}, Lcom/android/camera/ui/ColorActivateTextView;->setNormalCor(I)V

    .line 46
    invoke-direct {p0}, Lcom/android/camera/fragment/bottom/BackBeautyMenu;->isJustBeautyTab()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 47
    const v6, -0x4c000001

    invoke-virtual {v5, v6}, Lcom/android/camera/ui/ColorActivateTextView;->setActivateColor(I)V

    goto :goto_1

    .line 49
    :cond_1
    const v6, -0xff5701

    invoke-virtual {v5, v6}, Lcom/android/camera/ui/ColorActivateTextView;->setActivateColor(I)V

    .line 51
    :goto_1
    iget-object v6, v3, Lcom/android/camera/fragment/beauty/MenuItem;->text:Ljava/lang/String;

    invoke-virtual {v5, v6}, Lcom/android/camera/ui/ColorActivateTextView;->setText(Ljava/lang/CharSequence;)V

    .line 52
    iget v6, v3, Lcom/android/camera/fragment/beauty/MenuItem;->type:I

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/android/camera/ui/ColorActivateTextView;->setTag(Ljava/lang/Object;)V

    .line 53
    invoke-virtual {v5, p0}, Lcom/android/camera/ui/ColorActivateTextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 54
    iget v6, v3, Lcom/android/camera/fragment/beauty/MenuItem;->type:I

    if-ne v4, v6, :cond_2

    .line 55
    invoke-virtual {v5, v4}, Lcom/android/camera/ui/ColorActivateTextView;->setActivated(Z)V

    .line 56
    iput-object v5, p0, Lcom/android/camera/fragment/bottom/BackBeautyMenu;->mCurrentBeautyTextView:Lcom/android/camera/ui/ColorActivateTextView;

    goto :goto_2

    .line 58
    :cond_2
    invoke-virtual {v5, v1}, Lcom/android/camera/ui/ColorActivateTextView;->setActivated(Z)V

    .line 60
    :goto_2
    iget-object v4, p0, Lcom/android/camera/fragment/bottom/BackBeautyMenu;->mMenuTextViewList:Landroid/util/SparseArray;

    iget v3, v3, Lcom/android/camera/fragment/beauty/MenuItem;->type:I

    invoke-virtual {v4, v3, v5}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 61
    iget-object v3, p0, Lcom/android/camera/fragment/bottom/BackBeautyMenu;->mContainerView:Landroid/widget/LinearLayout;

    invoke-virtual {v3, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 32
    :goto_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 63
    :cond_3
    const-string v0, "pref_camera_face_beauty_key"

    invoke-static {}, Lcom/android/camera/CameraSettings;->getFaceBeautySwitch()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 64
    invoke-virtual {p0, v4}, Lcom/android/camera/fragment/bottom/BackBeautyMenu;->selectBeautyType(I)V

    goto :goto_4

    .line 66
    :cond_4
    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/bottom/BackBeautyMenu;->selectBeautyType(I)V

    .line 68
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

    .line 72
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/BackBeautyMenu;->mMenuTextViewList:Landroid/util/SparseArray;

    return-object v0
.end method

.method getDefaultType()I
    .locals 1

    .line 102
    const/4 v0, 0x1

    return v0
.end method

.method getMenuData()Landroid/util/SparseArray;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/util/SparseArray<",
            "Lcom/android/camera/fragment/beauty/MenuItem;",
            ">;"
        }
    .end annotation

    .line 77
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/BackBeautyMenu;->mBackBeautyMenuTabList:Landroid/util/SparseArray;

    if-eqz v0, :cond_0

    .line 78
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/BackBeautyMenu;->mBackBeautyMenuTabList:Landroid/util/SparseArray;

    return-object v0

    .line 80
    :cond_0
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/BackBeautyMenu;->mBackBeautyMenuTabList:Landroid/util/SparseArray;

    .line 82
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f0b01cc

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 83
    new-instance v1, Lcom/android/camera/fragment/beauty/MenuItem;

    invoke-direct {v1}, Lcom/android/camera/fragment/beauty/MenuItem;-><init>()V

    .line 84
    const/4 v2, 0x1

    iput v2, v1, Lcom/android/camera/fragment/beauty/MenuItem;->type:I

    .line 85
    iput-object v0, v1, Lcom/android/camera/fragment/beauty/MenuItem;->text:Ljava/lang/String;

    .line 86
    const/4 v0, 0x0

    iput v0, v1, Lcom/android/camera/fragment/beauty/MenuItem;->number:I

    .line 87
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/BackBeautyMenu;->mBackBeautyMenuTabList:Landroid/util/SparseArray;

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 89
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->fw()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 90
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f0b022c

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 91
    new-instance v1, Lcom/android/camera/fragment/beauty/MenuItem;

    invoke-direct {v1}, Lcom/android/camera/fragment/beauty/MenuItem;-><init>()V

    .line 92
    const/4 v3, 0x5

    iput v3, v1, Lcom/android/camera/fragment/beauty/MenuItem;->type:I

    .line 93
    iput-object v0, v1, Lcom/android/camera/fragment/beauty/MenuItem;->text:Ljava/lang/String;

    .line 94
    iput v2, v1, Lcom/android/camera/fragment/beauty/MenuItem;->number:I

    .line 95
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/BackBeautyMenu;->mBackBeautyMenuTabList:Landroid/util/SparseArray;

    invoke-virtual {v0, v3, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 97
    :cond_1
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/BackBeautyMenu;->mBackBeautyMenuTabList:Landroid/util/SparseArray;

    return-object v0
.end method

.method isRefreshUI()Z
    .locals 1

    .line 114
    const/4 v0, 0x1

    return v0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 119
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    .line 120
    invoke-virtual {p0, p1}, Lcom/android/camera/fragment/bottom/BackBeautyMenu;->selectBeautyType(I)V

    .line 121
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xc2

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$MiBeautyProtocol;

    .line 122
    if-eqz v0, :cond_0

    .line 123
    invoke-interface {v0, p1}, Lcom/android/camera/protocol/ModeProtocol$MiBeautyProtocol;->switchBeautyType(I)V

    .line 125
    :cond_0
    return-void
.end method

.method switchMenu()V
    .locals 1

    .line 107
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/BackBeautyMenu;->mContainerView:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 108
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/BackBeautyMenu;->addAllView()V

    .line 109
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/BackBeautyMenu;->getDefaultType()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/bottom/BackBeautyMenu;->selectBeautyType(I)V

    .line 110
    return-void
.end method
