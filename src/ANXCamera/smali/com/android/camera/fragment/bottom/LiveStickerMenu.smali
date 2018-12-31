.class public Lcom/android/camera/fragment/bottom/LiveStickerMenu;
.super Lcom/android/camera/fragment/bottom/AbBottomMenu;
.source "LiveStickerMenu.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# static fields
.field private static final LIVE_STICKER_TYPE:I


# instance fields
.field private mLiveStickerMenuTabList:Landroid/util/SparseArray;
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

    .line 21
    invoke-direct {p0, p1, p2, p3}, Lcom/android/camera/fragment/bottom/AbBottomMenu;-><init>(Landroid/content/Context;Landroid/widget/LinearLayout;Lcom/android/camera/fragment/bottom/BeautyMenuAnimator;)V

    .line 22
    return-void
.end method


# virtual methods
.method addAllView()V
    .locals 7

    .line 26
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/LiveStickerMenu;->mMenuTextViewList:Landroid/util/SparseArray;

    .line 27
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/LiveStickerMenu;->getMenuData()Landroid/util/SparseArray;

    move-result-object v0

    .line 28
    const/4 v1, 0x0

    move v2, v1

    :goto_0
    invoke-virtual {v0}, Landroid/util/SparseArray;->size()I

    move-result v3

    if-ge v2, v3, :cond_1

    .line 29
    invoke-virtual {v0, v2}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/camera/fragment/beauty/MenuItem;

    .line 30
    iget-object v4, p0, Lcom/android/camera/fragment/bottom/LiveStickerMenu;->mContext:Landroid/content/Context;

    invoke-static {v4}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v4

    .line 31
    const v5, 0x7f040002

    iget-object v6, p0, Lcom/android/camera/fragment/bottom/LiveStickerMenu;->mContainerView:Landroid/widget/LinearLayout;

    .line 32
    invoke-virtual {v4, v5, v6, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/android/camera/ui/ColorActivateTextView;

    .line 34
    const v5, -0x66000001

    invoke-virtual {v4, v5}, Lcom/android/camera/ui/ColorActivateTextView;->setNormalCor(I)V

    .line 35
    const v5, -0x4c000001

    invoke-virtual {v4, v5}, Lcom/android/camera/ui/ColorActivateTextView;->setActivateColor(I)V

    .line 36
    iget-object v5, v3, Lcom/android/camera/fragment/beauty/MenuItem;->text:Ljava/lang/String;

    invoke-virtual {v4, v5}, Lcom/android/camera/ui/ColorActivateTextView;->setText(Ljava/lang/CharSequence;)V

    .line 37
    iget v5, v3, Lcom/android/camera/fragment/beauty/MenuItem;->type:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/android/camera/ui/ColorActivateTextView;->setTag(Ljava/lang/Object;)V

    .line 38
    invoke-virtual {v4, p0}, Lcom/android/camera/ui/ColorActivateTextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 39
    iget v5, v3, Lcom/android/camera/fragment/beauty/MenuItem;->type:I

    if-nez v5, :cond_0

    .line 40
    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Lcom/android/camera/ui/ColorActivateTextView;->setActivated(Z)V

    .line 41
    iput-object v4, p0, Lcom/android/camera/fragment/bottom/LiveStickerMenu;->mCurrentBeautyTextView:Lcom/android/camera/ui/ColorActivateTextView;

    goto :goto_1

    .line 43
    :cond_0
    invoke-virtual {v4, v1}, Lcom/android/camera/ui/ColorActivateTextView;->setActivated(Z)V

    .line 45
    :goto_1
    iget-object v5, p0, Lcom/android/camera/fragment/bottom/LiveStickerMenu;->mMenuTextViewList:Landroid/util/SparseArray;

    iget v3, v3, Lcom/android/camera/fragment/beauty/MenuItem;->type:I

    invoke-virtual {v5, v3, v4}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 46
    iget-object v3, p0, Lcom/android/camera/fragment/bottom/LiveStickerMenu;->mContainerView:Landroid/widget/LinearLayout;

    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 28
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 48
    :cond_1
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

    .line 52
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/LiveStickerMenu;->mMenuTextViewList:Landroid/util/SparseArray;

    return-object v0
.end method

.method getDefaultType()I
    .locals 1

    .line 78
    const/4 v0, 0x0

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

    .line 57
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/LiveStickerMenu;->mLiveStickerMenuTabList:Landroid/util/SparseArray;

    if-eqz v0, :cond_0

    .line 58
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/LiveStickerMenu;->mLiveStickerMenuTabList:Landroid/util/SparseArray;

    return-object v0

    .line 60
    :cond_0
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/LiveStickerMenu;->mLiveStickerMenuTabList:Landroid/util/SparseArray;

    .line 61
    new-instance v0, Lcom/android/camera/fragment/beauty/MenuItem;

    invoke-direct {v0}, Lcom/android/camera/fragment/beauty/MenuItem;-><init>()V

    .line 62
    const/4 v1, 0x0

    iput v1, v0, Lcom/android/camera/fragment/beauty/MenuItem;->type:I

    .line 63
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f0b0227

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lcom/android/camera/fragment/beauty/MenuItem;->text:Ljava/lang/String;

    .line 64
    iput v1, v0, Lcom/android/camera/fragment/beauty/MenuItem;->number:I

    .line 65
    iget-object v2, p0, Lcom/android/camera/fragment/bottom/LiveStickerMenu;->mLiveStickerMenuTabList:Landroid/util/SparseArray;

    invoke-virtual {v2, v1, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 66
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/LiveStickerMenu;->mLiveStickerMenuTabList:Landroid/util/SparseArray;

    return-object v0
.end method

.method isRefreshUI()Z
    .locals 1

    .line 83
    const/4 v0, 0x1

    return v0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 88
    return-void
.end method

.method switchMenu()V
    .locals 1

    .line 71
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/LiveStickerMenu;->mContainerView:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 72
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/LiveStickerMenu;->addAllView()V

    .line 73
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/LiveStickerMenu;->getDefaultType()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/bottom/LiveStickerMenu;->selectBeautyType(I)V

    .line 74
    return-void
.end method
