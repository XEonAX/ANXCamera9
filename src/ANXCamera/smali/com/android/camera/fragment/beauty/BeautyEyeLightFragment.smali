.class public Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;
.super Lcom/android/camera/fragment/beauty/BaseBeautyFragment;
.source "BeautyEyeLightFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# static fields
.field private static final DEFAULT_TYPE:Ljava/lang/String; = "1"

.field private static EYE_LIGHT_TYPE_LIST:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$EyeLightItem;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mAdapter:Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;

.field private mBackButtonWidth:I

.field private mBackView:Landroid/view/View;

.field private mItemWidth:I

.field private mLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

.field private mRecyclerView:Landroid/support/v7/widget/RecyclerView;

.field private mSelectPosition:I

.field private mTotalWidth:I


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 46
    const/16 v0, 0x8

    new-array v0, v0, [Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$EyeLightItem;

    new-instance v1, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$EyeLightItem;

    const-string v2, "-1"

    const-string v3, "-1"

    .line 49
    invoke-static {v3}, Lcom/android/camera/constant/EyeLightConstant;->getDrawable(Ljava/lang/String;)I

    move-result v3

    const-string v4, "-1"

    invoke-static {v4}, Lcom/android/camera/constant/EyeLightConstant;->getString(Ljava/lang/String;)I

    move-result v4

    invoke-direct {v1, v2, v3, v4}, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$EyeLightItem;-><init>(Ljava/lang/String;II)V

    const/4 v2, 0x0

    aput-object v1, v0, v2

    new-instance v1, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$EyeLightItem;

    const-string v2, "1"

    const-string v3, "1"

    .line 51
    invoke-static {v3}, Lcom/android/camera/constant/EyeLightConstant;->getDrawable(Ljava/lang/String;)I

    move-result v3

    const-string v4, "1"

    invoke-static {v4}, Lcom/android/camera/constant/EyeLightConstant;->getString(Ljava/lang/String;)I

    move-result v4

    invoke-direct {v1, v2, v3, v4}, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$EyeLightItem;-><init>(Ljava/lang/String;II)V

    const/4 v2, 0x1

    aput-object v1, v0, v2

    new-instance v1, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$EyeLightItem;

    const-string v2, "4"

    const-string v3, "4"

    .line 53
    invoke-static {v3}, Lcom/android/camera/constant/EyeLightConstant;->getDrawable(Ljava/lang/String;)I

    move-result v3

    const-string v4, "4"

    invoke-static {v4}, Lcom/android/camera/constant/EyeLightConstant;->getString(Ljava/lang/String;)I

    move-result v4

    invoke-direct {v1, v2, v3, v4}, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$EyeLightItem;-><init>(Ljava/lang/String;II)V

    const/4 v2, 0x2

    aput-object v1, v0, v2

    new-instance v1, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$EyeLightItem;

    const-string v2, "0"

    const-string v3, "0"

    .line 55
    invoke-static {v3}, Lcom/android/camera/constant/EyeLightConstant;->getDrawable(Ljava/lang/String;)I

    move-result v3

    const-string v4, "0"

    invoke-static {v4}, Lcom/android/camera/constant/EyeLightConstant;->getString(Ljava/lang/String;)I

    move-result v4

    invoke-direct {v1, v2, v3, v4}, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$EyeLightItem;-><init>(Ljava/lang/String;II)V

    const/4 v2, 0x3

    aput-object v1, v0, v2

    new-instance v1, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$EyeLightItem;

    const-string v2, "5"

    const-string v3, "5"

    .line 57
    invoke-static {v3}, Lcom/android/camera/constant/EyeLightConstant;->getDrawable(Ljava/lang/String;)I

    move-result v3

    const-string v4, "5"

    invoke-static {v4}, Lcom/android/camera/constant/EyeLightConstant;->getString(Ljava/lang/String;)I

    move-result v4

    invoke-direct {v1, v2, v3, v4}, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$EyeLightItem;-><init>(Ljava/lang/String;II)V

    const/4 v2, 0x4

    aput-object v1, v0, v2

    new-instance v1, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$EyeLightItem;

    const-string v2, "6"

    const-string v3, "6"

    .line 59
    invoke-static {v3}, Lcom/android/camera/constant/EyeLightConstant;->getDrawable(Ljava/lang/String;)I

    move-result v3

    const-string v4, "6"

    invoke-static {v4}, Lcom/android/camera/constant/EyeLightConstant;->getString(Ljava/lang/String;)I

    move-result v4

    invoke-direct {v1, v2, v3, v4}, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$EyeLightItem;-><init>(Ljava/lang/String;II)V

    const/4 v2, 0x5

    aput-object v1, v0, v2

    new-instance v1, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$EyeLightItem;

    const-string v2, "3"

    const-string v3, "3"

    .line 61
    invoke-static {v3}, Lcom/android/camera/constant/EyeLightConstant;->getDrawable(Ljava/lang/String;)I

    move-result v3

    const-string v4, "3"

    invoke-static {v4}, Lcom/android/camera/constant/EyeLightConstant;->getString(Ljava/lang/String;)I

    move-result v4

    invoke-direct {v1, v2, v3, v4}, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$EyeLightItem;-><init>(Ljava/lang/String;II)V

    const/4 v2, 0x6

    aput-object v1, v0, v2

    new-instance v1, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$EyeLightItem;

    const-string v2, "2"

    const-string v3, "2"

    .line 63
    invoke-static {v3}, Lcom/android/camera/constant/EyeLightConstant;->getDrawable(Ljava/lang/String;)I

    move-result v3

    const-string v4, "2"

    invoke-static {v4}, Lcom/android/camera/constant/EyeLightConstant;->getString(Ljava/lang/String;)I

    move-result v4

    invoke-direct {v1, v2, v3, v4}, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$EyeLightItem;-><init>(Ljava/lang/String;II)V

    const/4 v2, 0x7

    aput-object v1, v0, v2

    .line 46
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->EYE_LIGHT_TYPE_LIST:Ljava/util/List;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 34
    invoke-direct {p0}, Lcom/android/camera/fragment/beauty/BaseBeautyFragment;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;I)V
    .locals 0

    .line 34
    invoke-direct {p0, p1}, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->onItemSelected(I)V

    return-void
.end method

.method public static getEyeLightHintText(Ljava/lang/String;)I
    .locals 4

    .line 67
    const/4 v0, 0x0

    move v1, v0

    :goto_0
    sget-object v2, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->EYE_LIGHT_TYPE_LIST:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 68
    sget-object v2, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->EYE_LIGHT_TYPE_LIST:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$EyeLightItem;

    .line 69
    invoke-virtual {v2}, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$EyeLightItem;->getType()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 70
    invoke-virtual {v2}, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$EyeLightItem;->getTextResource()I

    move-result p0

    return p0

    .line 67
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 73
    :cond_1
    return v0
.end method

.method private hideTipMessage(I)V
    .locals 2
    .param p1    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param

    .line 235
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xaf

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;

    .line 236
    if-lez p1, :cond_0

    invoke-interface {v0, p1}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->containTips(I)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 237
    :cond_0
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->directlyHideTips()V

    .line 239
    :cond_1
    return-void
.end method

.method private notifyItemChanged(II)V
    .locals 2

    .line 159
    const/4 v0, -0x1

    if-le p1, v0, :cond_0

    .line 160
    iget-object v1, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mAdapter:Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;

    invoke-virtual {v1, p1}, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;->notifyItemChanged(I)V

    .line 162
    :cond_0
    if-le p2, v0, :cond_1

    .line 163
    iget-object p1, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mAdapter:Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;

    invoke-virtual {p1, p2}, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;->notifyItemChanged(I)V

    .line 165
    :cond_1
    return-void
.end method

.method private onItemSelected(I)V
    .locals 4

    .line 184
    iget v0, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mSelectPosition:I

    .line 185
    iput p1, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mSelectPosition:I

    .line 187
    sget-object v1, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->EYE_LIGHT_TYPE_LIST:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$EyeLightItem;

    .line 188
    invoke-virtual {p1}, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$EyeLightItem;->getType()Ljava/lang/String;

    move-result-object v1

    .line 189
    invoke-static {v1}, Lcom/android/camera/CameraSettings;->setEyeLight(Ljava/lang/String;)V

    .line 190
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v2

    .line 191
    const/16 v3, 0xa4

    invoke-virtual {v2, v3}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v2

    check-cast v2, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;

    .line 192
    if-eqz v2, :cond_0

    .line 193
    invoke-interface {v2, v1}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->setEyeLight(Ljava/lang/String;)V

    .line 195
    :cond_0
    const/16 v1, 0xa

    .line 196
    invoke-virtual {p1}, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$EyeLightItem;->getTextResource()I

    move-result p1

    const/4 v2, 0x4

    .line 195
    invoke-direct {p0, v1, p1, v2}, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->updateTipMessage(III)V

    .line 198
    iget p1, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mSelectPosition:I

    invoke-direct {p0, p1}, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->scrollIfNeed(I)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 199
    iget p1, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mSelectPosition:I

    invoke-direct {p0, v0, p1}, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->notifyItemChanged(II)V

    .line 201
    :cond_1
    return-void
.end method

.method private reSelectItem()V
    .locals 3

    .line 204
    invoke-static {}, Lcom/android/camera/CameraSettings;->getEyeLightType()Ljava/lang/String;

    move-result-object v0

    .line 205
    const-string v1, "-1"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 206
    const-string v0, "1"

    .line 208
    :cond_0
    const/4 v1, 0x0

    :goto_0
    sget-object v2, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->EYE_LIGHT_TYPE_LIST:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_2

    .line 209
    sget-object v2, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->EYE_LIGHT_TYPE_LIST:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$EyeLightItem;

    .line 210
    invoke-virtual {v2}, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$EyeLightItem;->getType()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 211
    invoke-direct {p0, v1}, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->onItemSelected(I)V

    .line 212
    goto :goto_1

    .line 208
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 215
    :cond_2
    :goto_1
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mAdapter:Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;

    iget v1, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mSelectPosition:I

    invoke-virtual {v0, v1}, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;->setSelectedPosition(I)V

    .line 216
    iget v0, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mSelectPosition:I

    invoke-direct {p0, v0}, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->setItemInCenter(I)V

    .line 217
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mAdapter:Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;

    invoke-virtual {v0}, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;->notifyDataSetChanged()V

    .line 218
    return-void
.end method

.method private scrollIfNeed(I)Z
    .locals 4

    .line 168
    nop

    .line 169
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {v0}, Landroid/support/v7/widget/LinearLayoutManager;->findFirstVisibleItemPosition()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eq p1, v0, :cond_3

    iget-object v0, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    .line 170
    invoke-virtual {v0}, Landroid/support/v7/widget/LinearLayoutManager;->findFirstCompletelyVisibleItemPosition()I

    move-result v0

    if-ne p1, v0, :cond_0

    goto :goto_1

    .line 172
    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {v0}, Landroid/support/v7/widget/LinearLayoutManager;->findLastVisibleItemPosition()I

    move-result v0

    if-eq p1, v0, :cond_2

    iget-object v0, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    .line 173
    invoke-virtual {v0}, Landroid/support/v7/widget/LinearLayoutManager;->findLastCompletelyVisibleItemPosition()I

    move-result v0

    if-ne p1, v0, :cond_1

    goto :goto_0

    .line 176
    :cond_1
    move v0, p1

    goto :goto_2

    .line 174
    :cond_2
    :goto_0
    add-int/lit8 v0, p1, 0x1

    iget-object v3, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {v3}, Landroid/support/v7/widget/LinearLayoutManager;->getItemCount()I

    move-result v3

    sub-int/2addr v3, v2

    invoke-static {v0, v3}, Ljava/lang/Math;->min(II)I

    move-result v0

    goto :goto_2

    .line 171
    :cond_3
    :goto_1
    add-int/lit8 v0, p1, -0x1

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 176
    :goto_2
    if-eq v0, p1, :cond_4

    .line 177
    iget-object p1, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {p1, v0}, Landroid/support/v7/widget/LinearLayoutManager;->scrollToPosition(I)V

    .line 178
    return v2

    .line 180
    :cond_4
    return v1
.end method

.method private setItemInCenter(I)V
    .locals 2

    .line 154
    iget v0, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mTotalWidth:I

    div-int/lit8 v0, v0, 0x2

    iget v1, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mItemWidth:I

    div-int/lit8 v1, v1, 0x2

    sub-int/2addr v0, v1

    iget v1, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mBackButtonWidth:I

    sub-int/2addr v0, v1

    .line 155
    iget-object v1, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {v1, p1, v0}, Landroid/support/v7/widget/LinearLayoutManager;->scrollToPositionWithOffset(II)V

    .line 156
    return-void
.end method

.method private updateTipMessage(III)V
    .locals 2
    .param p2    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param

    .line 229
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xaf

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;

    .line 230
    invoke-interface {v0, p1, p2, p3}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->showTips(III)V

    .line 231
    return-void
.end method


# virtual methods
.method public enterAnim(Landroid/view/View;Landroid/support/v4/view/ViewPropertyAnimatorListener;)V
    .locals 2

    .line 242
    const/high16 v0, 0x42c80000    # 100.0f

    invoke-virtual {p1, v0}, Landroid/view/View;->setTranslationX(F)V

    .line 243
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/View;->setAlpha(F)V

    .line 244
    invoke-static {p1}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    .line 245
    invoke-virtual {p1, v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->translationX(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    .line 246
    const/high16 v0, 0x3f800000    # 1.0f

    invoke-virtual {p1, v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    .line 247
    const-wide/16 v0, 0x118

    invoke-virtual {p1, v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    new-instance v0, Lmiui/view/animation/QuinticEaseOutInterpolator;

    invoke-direct {v0}, Lmiui/view/animation/QuinticEaseOutInterpolator;-><init>()V

    .line 248
    invoke-virtual {p1, v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    .line 249
    invoke-virtual {p1, p2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setListener(Landroid/support/v4/view/ViewPropertyAnimatorListener;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    .line 250
    const-wide/16 v0, 0x78

    invoke-virtual {p1, v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setStartDelay(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    .line 251
    invoke-virtual {p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 252
    return-void
.end method

.method public exitAnim(Landroid/view/View;Landroid/support/v4/view/ViewPropertyAnimatorListener;)V
    .locals 2

    .line 255
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/View;->setTranslationX(F)V

    .line 256
    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {p1, v1}, Landroid/view/View;->setAlpha(F)V

    .line 257
    invoke-static {p1}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    .line 258
    const/high16 v1, 0x42c80000    # 100.0f

    invoke-virtual {p1, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->translationX(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    .line 259
    invoke-virtual {p1, v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    .line 260
    const-wide/16 v0, 0x78

    invoke-virtual {p1, v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    .line 261
    const-wide/16 v0, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setStartDelay(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    new-instance v0, Lmiui/view/animation/QuinticEaseInInterpolator;

    invoke-direct {v0}, Lmiui/view/animation/QuinticEaseInInterpolator;-><init>()V

    .line 262
    invoke-virtual {p1, v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    .line 263
    invoke-virtual {p1, p2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setListener(Landroid/support/v4/view/ViewPropertyAnimatorListener;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    .line 264
    invoke-virtual {p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 265
    return-void
.end method

.method protected getAnimateView()Landroid/view/View;
    .locals 1

    .line 222
    const/4 v0, 0x0

    return-object v0
.end method

.method public final getFragmentTag()Ljava/lang/String;
    .locals 1

    .line 268
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected initView(Landroid/view/View;)V
    .locals 3

    .line 86
    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0900dc

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mItemWidth:I

    .line 87
    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    iput v0, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mTotalWidth:I

    .line 88
    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0900de

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mBackButtonWidth:I

    .line 90
    const v0, 0x7f0d004d

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mBackView:Landroid/view/View;

    .line 91
    const v0, 0x7f0d004e

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/support/v7/widget/RecyclerView;

    iput-object p1, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    .line 92
    new-instance p1, Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p1, v0}, Landroid/support/v7/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    .line 93
    iget-object p1, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/support/v7/widget/LinearLayoutManager;->setOrientation(I)V

    .line 94
    new-instance p1, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;

    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    sget-object v2, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->EYE_LIGHT_TYPE_LIST:Ljava/util/List;

    invoke-direct {p1, v1, v2, v0}, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;-><init>(Landroid/content/Context;Ljava/util/List;I)V

    iput-object p1, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mAdapter:Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;

    .line 96
    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->getUserVisibleHint()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 97
    invoke-direct {p0}, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->reSelectItem()V

    .line 100
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lcom/android/camera/Util;->isLayoutRTL(Landroid/content/Context;)Z

    move-result p1

    .line 101
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    iget-object v1, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    .line 102
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    iget-object v1, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mAdapter:Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 103
    new-instance v0, Lcom/android/camera/fragment/DefaultItemAnimator;

    invoke-direct {v0}, Lcom/android/camera/fragment/DefaultItemAnimator;-><init>()V

    .line 104
    const-wide/16 v1, 0x96

    invoke-virtual {v0, v1, v2}, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->setChangeDuration(J)V

    .line 105
    invoke-virtual {v0, v1, v2}, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->setMoveDuration(J)V

    .line 106
    invoke-virtual {v0, v1, v2}, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->setAddDuration(J)V

    .line 107
    iget-object v1, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v1, v0}, Landroid/support/v7/widget/RecyclerView;->setItemAnimator(Landroid/support/v7/widget/RecyclerView$ItemAnimator;)V

    .line 108
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    new-instance v1, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment$1;

    invoke-direct {v1, p0, p1}, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment$1;-><init>(Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;Z)V

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->addItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    .line 130
    iget-object p1, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mAdapter:Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;

    new-instance v0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment$2;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment$2;-><init>(Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;)V

    invoke-virtual {p1, v0}, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 136
    iget-object p1, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mBackView:Landroid/view/View;

    invoke-virtual {p1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 137
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 141
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    .line 142
    const/16 v1, 0xa1

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$CameraAction;

    .line 143
    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->isDoingAction()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 144
    return-void

    .line 147
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p1

    const v0, 0x7f0d004d

    if-ne p1, v0, :cond_1

    .line 148
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 v0, 0xc2

    invoke-virtual {p1, v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$MiBeautyProtocol;

    .line 149
    const/4 v0, 0x3

    invoke-interface {p1, v0}, Lcom/android/camera/protocol/ModeProtocol$MiBeautyProtocol;->switchBeautyType(I)V

    .line 151
    :cond_1
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1
    .param p2    # Landroid/view/ViewGroup;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .line 80
    const p3, 0x7f040017

    const/4 v0, 0x0

    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    .line 81
    invoke-virtual {p0, p1}, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->initView(Landroid/view/View;)V

    .line 82
    return-object p1
.end method

.method public userInvisibleHit()V
    .locals 3

    .line 289
    const v0, 0x7f0b01b8

    invoke-direct {p0, v0}, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->hideTipMessage(I)V

    .line 290
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    .line 291
    const/16 v1, 0xa0

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;

    .line 292
    if-nez v0, :cond_0

    .line 293
    return-void

    .line 296
    :cond_0
    const v1, 0x7f0d00e1

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;->getActiveFragment(I)I

    move-result v1

    const/16 v2, 0xfc

    if-eq v1, v2, :cond_1

    .line 297
    const/4 v1, 0x3

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;->delegateEvent(I)V

    .line 299
    :cond_1
    return-void
.end method

.method public userVisibleHint()V
    .locals 3

    .line 273
    invoke-direct {p0}, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->reSelectItem()V

    .line 274
    const/16 v0, 0xa

    const v1, 0x7f0b01b8

    const/4 v2, 0x2

    invoke-direct {p0, v0, v1, v2}, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->updateTipMessage(III)V

    .line 277
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    .line 278
    const/16 v1, 0xa0

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;

    .line 279
    if-nez v0, :cond_0

    .line 280
    return-void

    .line 283
    :cond_0
    const v1, 0x7f0d00e1

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;->getActiveFragment(I)I

    move-result v1

    const/16 v2, 0xfc

    if-ne v1, v2, :cond_1

    .line 284
    const/4 v1, 0x3

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;->delegateEvent(I)V

    .line 286
    :cond_1
    return-void
.end method
