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

    .line 47
    const/16 v0, 0x8

    new-array v0, v0, [Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$EyeLightItem;

    new-instance v1, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$EyeLightItem;

    const-string v2, "-1"

    const-string v3, "-1"

    .line 50
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

    .line 52
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

    .line 54
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

    .line 56
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

    .line 58
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

    .line 60
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

    .line 62
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

    .line 64
    invoke-static {v3}, Lcom/android/camera/constant/EyeLightConstant;->getDrawable(Ljava/lang/String;)I

    move-result v3

    const-string v4, "2"

    invoke-static {v4}, Lcom/android/camera/constant/EyeLightConstant;->getString(Ljava/lang/String;)I

    move-result v4

    invoke-direct {v1, v2, v3, v4}, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$EyeLightItem;-><init>(Ljava/lang/String;II)V

    const/4 v2, 0x7

    aput-object v1, v0, v2

    .line 47
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->EYE_LIGHT_TYPE_LIST:Ljava/util/List;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 35
    invoke-direct {p0}, Lcom/android/camera/fragment/beauty/BaseBeautyFragment;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;I)V
    .locals 0

    .line 35
    invoke-direct {p0, p1}, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->onItemSelected(I)V

    return-void
.end method

.method public static getEyeLightHintText(Ljava/lang/String;)I
    .locals 4

    .line 68
    const/4 v0, 0x0

    move v1, v0

    :goto_0
    sget-object v2, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->EYE_LIGHT_TYPE_LIST:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 69
    sget-object v2, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->EYE_LIGHT_TYPE_LIST:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$EyeLightItem;

    .line 70
    invoke-virtual {v2}, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$EyeLightItem;->getType()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 71
    invoke-virtual {v2}, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$EyeLightItem;->getTextResource()I

    move-result p0

    return p0

    .line 68
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 74
    :cond_1
    return v0
.end method

.method private static hasFrontFlash()Z
    .locals 1

    .line 309
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentFlash()Lcom/android/camera/data/data/config/ComponentConfigFlash;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->isHardwareSupported()Z

    move-result v0

    return v0
.end method

.method private hideTipMessage(I)V
    .locals 2
    .param p1    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param

    .line 236
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xaf

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;

    .line 237
    if-lez p1, :cond_0

    invoke-interface {v0, p1}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->containTips(I)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 238
    :cond_0
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->directlyHideTips()V

    .line 240
    :cond_1
    return-void
.end method

.method private notifyItemChanged(II)V
    .locals 2

    .line 160
    const/4 v0, -0x1

    if-le p1, v0, :cond_0

    .line 161
    iget-object v1, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mAdapter:Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;

    invoke-virtual {v1, p1}, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;->notifyItemChanged(I)V

    .line 163
    :cond_0
    if-le p2, v0, :cond_1

    .line 164
    iget-object p1, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mAdapter:Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;

    invoke-virtual {p1, p2}, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;->notifyItemChanged(I)V

    .line 166
    :cond_1
    return-void
.end method

.method private onItemSelected(I)V
    .locals 4

    .line 185
    iget v0, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mSelectPosition:I

    .line 186
    iput p1, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mSelectPosition:I

    .line 188
    sget-object v1, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->EYE_LIGHT_TYPE_LIST:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$EyeLightItem;

    .line 189
    invoke-virtual {p1}, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$EyeLightItem;->getType()Ljava/lang/String;

    move-result-object v1

    .line 190
    invoke-static {v1}, Lcom/android/camera/CameraSettings;->setEyeLight(Ljava/lang/String;)V

    .line 191
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v2

    .line 192
    const/16 v3, 0xa4

    invoke-virtual {v2, v3}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v2

    check-cast v2, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;

    .line 193
    if-eqz v2, :cond_0

    .line 194
    invoke-interface {v2, v1}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->setEyeLight(Ljava/lang/String;)V

    .line 196
    :cond_0
    const/16 v1, 0xa

    .line 197
    invoke-virtual {p1}, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$EyeLightItem;->getTextResource()I

    move-result p1

    const/4 v2, 0x4

    .line 196
    invoke-direct {p0, v1, p1, v2}, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->updateTipMessage(III)V

    .line 199
    iget p1, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mSelectPosition:I

    invoke-direct {p0, p1}, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->scrollIfNeed(I)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 200
    iget p1, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mSelectPosition:I

    invoke-direct {p0, v0, p1}, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->notifyItemChanged(II)V

    .line 202
    :cond_1
    return-void
.end method

.method private reSelectItem()V
    .locals 3

    .line 205
    invoke-static {}, Lcom/android/camera/CameraSettings;->getEyeLightType()Ljava/lang/String;

    move-result-object v0

    .line 206
    const-string v1, "-1"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 207
    const-string v0, "1"

    .line 209
    :cond_0
    const/4 v1, 0x0

    :goto_0
    sget-object v2, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->EYE_LIGHT_TYPE_LIST:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_2

    .line 210
    sget-object v2, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->EYE_LIGHT_TYPE_LIST:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$EyeLightItem;

    .line 211
    invoke-virtual {v2}, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$EyeLightItem;->getType()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 212
    invoke-direct {p0, v1}, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->onItemSelected(I)V

    .line 213
    goto :goto_1

    .line 209
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 216
    :cond_2
    :goto_1
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mAdapter:Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;

    iget v1, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mSelectPosition:I

    invoke-virtual {v0, v1}, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;->setSelectedPosition(I)V

    .line 217
    iget v0, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mSelectPosition:I

    invoke-direct {p0, v0}, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->setItemInCenter(I)V

    .line 218
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mAdapter:Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;

    invoke-virtual {v0}, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;->notifyDataSetChanged()V

    .line 219
    return-void
.end method

.method private scrollIfNeed(I)Z
    .locals 4

    .line 169
    nop

    .line 170
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {v0}, Landroid/support/v7/widget/LinearLayoutManager;->findFirstVisibleItemPosition()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eq p1, v0, :cond_3

    iget-object v0, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    .line 171
    invoke-virtual {v0}, Landroid/support/v7/widget/LinearLayoutManager;->findFirstCompletelyVisibleItemPosition()I

    move-result v0

    if-ne p1, v0, :cond_0

    goto :goto_1

    .line 173
    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {v0}, Landroid/support/v7/widget/LinearLayoutManager;->findLastVisibleItemPosition()I

    move-result v0

    if-eq p1, v0, :cond_2

    iget-object v0, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    .line 174
    invoke-virtual {v0}, Landroid/support/v7/widget/LinearLayoutManager;->findLastCompletelyVisibleItemPosition()I

    move-result v0

    if-ne p1, v0, :cond_1

    goto :goto_0

    .line 177
    :cond_1
    move v0, p1

    goto :goto_2

    .line 175
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

    .line 172
    :cond_3
    :goto_1
    add-int/lit8 v0, p1, -0x1

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 177
    :goto_2
    if-eq v0, p1, :cond_4

    .line 178
    iget-object p1, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {p1, v0}, Landroid/support/v7/widget/LinearLayoutManager;->scrollToPosition(I)V

    .line 179
    return v2

    .line 181
    :cond_4
    return v1
.end method

.method private setItemInCenter(I)V
    .locals 2

    .line 155
    iget v0, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mTotalWidth:I

    div-int/lit8 v0, v0, 0x2

    iget v1, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mItemWidth:I

    div-int/lit8 v1, v1, 0x2

    sub-int/2addr v0, v1

    iget v1, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mBackButtonWidth:I

    sub-int/2addr v0, v1

    .line 156
    iget-object v1, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {v1, p1, v0}, Landroid/support/v7/widget/LinearLayoutManager;->scrollToPositionWithOffset(II)V

    .line 157
    return-void
.end method

.method private updateTipMessage(III)V
    .locals 2
    .param p2    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param

    .line 230
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xaf

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;

    .line 231
    invoke-interface {v0, p1, p2, p3}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->showTips(III)V

    .line 232
    return-void
.end method


# virtual methods
.method public enterAnim(Landroid/view/View;Landroid/support/v4/view/ViewPropertyAnimatorListener;)V
    .locals 2

    .line 243
    const/high16 v0, 0x42c80000    # 100.0f

    invoke-virtual {p1, v0}, Landroid/view/View;->setTranslationX(F)V

    .line 244
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/View;->setAlpha(F)V

    .line 245
    invoke-static {p1}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    .line 246
    invoke-virtual {p1, v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->translationX(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    .line 247
    const/high16 v0, 0x3f800000    # 1.0f

    invoke-virtual {p1, v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    .line 248
    const-wide/16 v0, 0x118

    invoke-virtual {p1, v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    new-instance v0, Lmiui/view/animation/QuinticEaseOutInterpolator;

    invoke-direct {v0}, Lmiui/view/animation/QuinticEaseOutInterpolator;-><init>()V

    .line 249
    invoke-virtual {p1, v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    .line 250
    invoke-virtual {p1, p2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setListener(Landroid/support/v4/view/ViewPropertyAnimatorListener;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    .line 251
    const-wide/16 v0, 0x78

    invoke-virtual {p1, v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setStartDelay(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    .line 252
    invoke-virtual {p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 253
    return-void
.end method

.method public exitAnim(Landroid/view/View;Landroid/support/v4/view/ViewPropertyAnimatorListener;)V
    .locals 2

    .line 256
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/View;->setTranslationX(F)V

    .line 257
    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {p1, v1}, Landroid/view/View;->setAlpha(F)V

    .line 258
    invoke-static {p1}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    .line 259
    const/high16 v1, 0x42c80000    # 100.0f

    invoke-virtual {p1, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->translationX(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    .line 260
    invoke-virtual {p1, v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    .line 261
    const-wide/16 v0, 0x78

    invoke-virtual {p1, v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    .line 262
    const-wide/16 v0, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setStartDelay(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    new-instance v0, Lmiui/view/animation/QuinticEaseInInterpolator;

    invoke-direct {v0}, Lmiui/view/animation/QuinticEaseInInterpolator;-><init>()V

    .line 263
    invoke-virtual {p1, v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    .line 264
    invoke-virtual {p1, p2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setListener(Landroid/support/v4/view/ViewPropertyAnimatorListener;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    .line 265
    invoke-virtual {p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 266
    return-void
.end method

.method protected getAnimateView()Landroid/view/View;
    .locals 1

    .line 223
    const/4 v0, 0x0

    return-object v0
.end method

.method public final getFragmentTag()Ljava/lang/String;
    .locals 1

    .line 269
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected initView(Landroid/view/View;)V
    .locals 3

    .line 87
    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0a00e0

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mItemWidth:I

    .line 88
    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    iput v0, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mTotalWidth:I

    .line 89
    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0a00e2

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mBackButtonWidth:I

    .line 91
    const v0, 0x7f0d0053

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mBackView:Landroid/view/View;

    .line 92
    const v0, 0x7f0d0054

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/support/v7/widget/RecyclerView;

    iput-object p1, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    .line 93
    new-instance p1, Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p1, v0}, Landroid/support/v7/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    .line 94
    iget-object p1, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/support/v7/widget/LinearLayoutManager;->setOrientation(I)V

    .line 95
    new-instance p1, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;

    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    sget-object v2, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->EYE_LIGHT_TYPE_LIST:Ljava/util/List;

    invoke-direct {p1, v1, v2, v0}, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;-><init>(Landroid/content/Context;Ljava/util/List;I)V

    iput-object p1, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mAdapter:Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;

    .line 97
    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->getUserVisibleHint()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 98
    invoke-direct {p0}, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->reSelectItem()V

    .line 101
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lcom/android/camera/Util;->isLayoutRTL(Landroid/content/Context;)Z

    move-result p1

    .line 102
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    iget-object v1, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    .line 103
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    iget-object v1, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mAdapter:Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 104
    new-instance v0, Lcom/android/camera/fragment/DefaultItemAnimator;

    invoke-direct {v0}, Lcom/android/camera/fragment/DefaultItemAnimator;-><init>()V

    .line 105
    const-wide/16 v1, 0x96

    invoke-virtual {v0, v1, v2}, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->setChangeDuration(J)V

    .line 106
    invoke-virtual {v0, v1, v2}, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->setMoveDuration(J)V

    .line 107
    invoke-virtual {v0, v1, v2}, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->setAddDuration(J)V

    .line 108
    iget-object v1, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v1, v0}, Landroid/support/v7/widget/RecyclerView;->setItemAnimator(Landroid/support/v7/widget/RecyclerView$ItemAnimator;)V

    .line 109
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    new-instance v1, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment$1;

    invoke-direct {v1, p0, p1}, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment$1;-><init>(Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;Z)V

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->addItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    .line 131
    iget-object p1, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mAdapter:Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;

    new-instance v0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment$2;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment$2;-><init>(Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;)V

    invoke-virtual {p1, v0}, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 137
    iget-object p1, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mBackView:Landroid/view/View;

    invoke-virtual {p1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 138
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 142
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    .line 143
    const/16 v1, 0xa1

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$CameraAction;

    .line 144
    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->isDoingAction()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 145
    return-void

    .line 148
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p1

    const v0, 0x7f0d0053

    if-ne p1, v0, :cond_1

    .line 149
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 v0, 0xc2

    invoke-virtual {p1, v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$MiBeautyProtocol;

    .line 150
    const/4 v0, 0x3

    invoke-interface {p1, v0}, Lcom/android/camera/protocol/ModeProtocol$MiBeautyProtocol;->switchBeautyType(I)V

    .line 152
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

    .line 81
    const p3, 0x7f040018

    const/4 v0, 0x0

    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    .line 82
    invoke-virtual {p0, p1}, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->initView(Landroid/view/View;)V

    .line 83
    return-object p1
.end method

.method public userInvisibleHit()V
    .locals 3

    .line 292
    invoke-static {}, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->hasFrontFlash()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 293
    const v0, 0x7f0901bf

    invoke-direct {p0, v0}, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->hideTipMessage(I)V

    .line 295
    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa0

    .line 296
    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;

    .line 297
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    const/16 v2, 0xc2

    .line 298
    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v1

    check-cast v1, Lcom/android/camera/protocol/ModeProtocol$MiBeautyProtocol;

    .line 299
    if-eqz v0, :cond_3

    if-nez v1, :cond_1

    goto :goto_0

    .line 303
    :cond_1
    invoke-interface {v1}, Lcom/android/camera/protocol/ModeProtocol$MiBeautyProtocol;->getBeautyType()I

    move-result v1

    const/4 v2, 0x1

    if-eq v1, v2, :cond_2

    const v1, 0x7f0d00fe

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;->getActiveFragment(I)I

    move-result v1

    const/16 v2, 0xfc

    if-eq v1, v2, :cond_2

    .line 304
    const/4 v1, 0x3

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;->delegateEvent(I)V

    .line 306
    :cond_2
    return-void

    .line 300
    :cond_3
    :goto_0
    return-void
.end method

.method public userVisibleHint()V
    .locals 3

    .line 274
    invoke-direct {p0}, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->reSelectItem()V

    .line 275
    invoke-static {}, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->hasFrontFlash()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 276
    const/16 v0, 0xa

    const v1, 0x7f0901bf

    const/4 v2, 0x2

    invoke-direct {p0, v0, v1, v2}, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->updateTipMessage(III)V

    .line 280
    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa0

    .line 281
    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;

    .line 282
    if-nez v0, :cond_1

    .line 283
    return-void

    .line 286
    :cond_1
    const v1, 0x7f0d00fe

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;->getActiveFragment(I)I

    move-result v1

    const/16 v2, 0xfc

    if-ne v1, v2, :cond_2

    .line 287
    const/4 v1, 0x3

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;->delegateEvent(I)V

    .line 289
    :cond_2
    return-void
.end method
