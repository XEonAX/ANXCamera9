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

    .line 49
    const/16 v0, 0x8

    new-array v0, v0, [Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$EyeLightItem;

    new-instance v1, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$EyeLightItem;

    const-string v2, "-1"

    const-string v3, "-1"

    .line 52
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

    .line 54
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

    .line 56
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

    .line 58
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

    .line 60
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

    .line 62
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

    .line 64
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

    .line 66
    invoke-static {v3}, Lcom/android/camera/constant/EyeLightConstant;->getDrawable(Ljava/lang/String;)I

    move-result v3

    const-string v4, "2"

    invoke-static {v4}, Lcom/android/camera/constant/EyeLightConstant;->getString(Ljava/lang/String;)I

    move-result v4

    invoke-direct {v1, v2, v3, v4}, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$EyeLightItem;-><init>(Ljava/lang/String;II)V

    const/4 v2, 0x7

    aput-object v1, v0, v2

    .line 49
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->EYE_LIGHT_TYPE_LIST:Ljava/util/List;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 37
    invoke-direct {p0}, Lcom/android/camera/fragment/beauty/BaseBeautyFragment;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;I)V
    .locals 0

    .line 37
    invoke-direct {p0, p1}, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->onItemSelected(I)V

    return-void
.end method

.method private eyeLightMutexGroup(Ljava/lang/String;Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;)V
    .locals 2

    .line 212
    if-nez p2, :cond_0

    .line 213
    return-void

    .line 216
    :cond_0
    const-string v0, "-1"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 217
    return-void

    .line 220
    :cond_1
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 v0, 0xac

    invoke-virtual {p1, v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    .line 221
    if-nez p1, :cond_2

    .line 222
    return-void

    .line 225
    :cond_2
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    const-string v1, "pref_camera_groupshot_mode_key"

    invoke-virtual {v0, v1}, Lcom/android/camera/data/data/runing/DataItemRunning;->isSwitchOn(Ljava/lang/String;)Z

    move-result v0

    .line 226
    if-nez v0, :cond_3

    .line 227
    return-void

    .line 230
    :cond_3
    const/16 v0, 0xeb

    invoke-interface {p2, v0}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->onConfigChanged(I)V

    .line 231
    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->refreshExtraMenu()V

    .line 232
    return-void
.end method

.method public static getEyeLightHintText(Ljava/lang/String;)I
    .locals 4

    .line 70
    const/4 v0, 0x0

    move v1, v0

    :goto_0
    sget-object v2, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->EYE_LIGHT_TYPE_LIST:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 71
    sget-object v2, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->EYE_LIGHT_TYPE_LIST:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$EyeLightItem;

    .line 72
    invoke-virtual {v2}, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$EyeLightItem;->getType()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 73
    invoke-virtual {v2}, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$EyeLightItem;->getTextResource()I

    move-result p0

    return p0

    .line 70
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 76
    :cond_1
    return v0
.end method

.method private static hasFrontFlash()Z
    .locals 1

    .line 353
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

    .line 266
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xaf

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;

    .line 267
    if-lez p1, :cond_0

    invoke-interface {v0, p1}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->containTips(I)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 268
    :cond_0
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->directlyHideTips()V

    .line 270
    :cond_1
    return-void
.end method

.method private notifyItemChanged(II)V
    .locals 2

    .line 162
    const/4 v0, -0x1

    if-le p1, v0, :cond_0

    .line 163
    iget-object v1, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mAdapter:Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;

    invoke-virtual {v1, p1}, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;->notifyItemChanged(I)V

    .line 165
    :cond_0
    if-le p2, v0, :cond_1

    .line 166
    iget-object p1, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mAdapter:Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;

    invoke-virtual {p1, p2}, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;->notifyItemChanged(I)V

    .line 168
    :cond_1
    return-void
.end method

.method private onItemSelected(I)V
    .locals 5

    .line 187
    iget v0, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mSelectPosition:I

    .line 188
    iput p1, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mSelectPosition:I

    .line 190
    sget-object v1, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->EYE_LIGHT_TYPE_LIST:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$EyeLightItem;

    .line 191
    invoke-virtual {p1}, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$EyeLightItem;->getType()Ljava/lang/String;

    move-result-object v1

    .line 192
    invoke-static {v1}, Lcom/android/camera/CameraSettings;->setEyeLight(Ljava/lang/String;)V

    .line 193
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v2

    .line 194
    const/16 v3, 0xa4

    invoke-virtual {v2, v3}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v2

    check-cast v2, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;

    .line 195
    if-eqz v2, :cond_0

    .line 196
    invoke-interface {v2, v1}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->setEyeLight(Ljava/lang/String;)V

    .line 198
    :cond_0
    const/16 v3, 0xa

    .line 199
    invoke-virtual {p1}, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$EyeLightItem;->getTextResource()I

    move-result p1

    const/4 v4, 0x4

    .line 198
    invoke-direct {p0, v3, p1, v4}, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->updateTipMessage(III)V

    .line 201
    iget p1, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mSelectPosition:I

    invoke-direct {p0, p1}, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->scrollIfNeed(I)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 202
    iget p1, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mSelectPosition:I

    invoke-direct {p0, v0, p1}, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->notifyItemChanged(II)V

    .line 204
    :cond_1
    invoke-direct {p0, v1, v2}, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->eyeLightMutexGroup(Ljava/lang/String;Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;)V

    .line 205
    return-void
.end method

.method private reSelectItem()V
    .locals 3

    .line 235
    invoke-static {}, Lcom/android/camera/CameraSettings;->getEyeLightType()Ljava/lang/String;

    move-result-object v0

    .line 236
    const-string v1, "-1"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 237
    const-string v0, "1"

    .line 239
    :cond_0
    const/4 v1, 0x0

    :goto_0
    sget-object v2, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->EYE_LIGHT_TYPE_LIST:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_2

    .line 240
    sget-object v2, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->EYE_LIGHT_TYPE_LIST:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$EyeLightItem;

    .line 241
    invoke-virtual {v2}, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$EyeLightItem;->getType()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 242
    invoke-direct {p0, v1}, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->onItemSelected(I)V

    .line 243
    goto :goto_1

    .line 239
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 246
    :cond_2
    :goto_1
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mAdapter:Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;

    iget v1, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mSelectPosition:I

    invoke-virtual {v0, v1}, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;->setSelectedPosition(I)V

    .line 247
    iget v0, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mSelectPosition:I

    invoke-direct {p0, v0}, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->setItemInCenter(I)V

    .line 248
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mAdapter:Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;

    invoke-virtual {v0}, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;->notifyDataSetChanged()V

    .line 249
    return-void
.end method

.method private scrollIfNeed(I)Z
    .locals 4

    .line 171
    nop

    .line 172
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {v0}, Landroid/support/v7/widget/LinearLayoutManager;->findFirstVisibleItemPosition()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eq p1, v0, :cond_3

    iget-object v0, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    .line 173
    invoke-virtual {v0}, Landroid/support/v7/widget/LinearLayoutManager;->findFirstCompletelyVisibleItemPosition()I

    move-result v0

    if-ne p1, v0, :cond_0

    goto :goto_1

    .line 175
    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {v0}, Landroid/support/v7/widget/LinearLayoutManager;->findLastVisibleItemPosition()I

    move-result v0

    if-eq p1, v0, :cond_2

    iget-object v0, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    .line 176
    invoke-virtual {v0}, Landroid/support/v7/widget/LinearLayoutManager;->findLastCompletelyVisibleItemPosition()I

    move-result v0

    if-ne p1, v0, :cond_1

    goto :goto_0

    .line 179
    :cond_1
    move v0, p1

    goto :goto_2

    .line 177
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

    .line 174
    :cond_3
    :goto_1
    add-int/lit8 v0, p1, -0x1

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 179
    :goto_2
    if-eq v0, p1, :cond_4

    .line 180
    iget-object p1, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {p1, v0}, Landroid/support/v7/widget/LinearLayoutManager;->scrollToPosition(I)V

    .line 181
    return v2

    .line 183
    :cond_4
    return v1
.end method

.method private setItemInCenter(I)V
    .locals 2

    .line 157
    iget v0, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mTotalWidth:I

    div-int/lit8 v0, v0, 0x2

    iget v1, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mItemWidth:I

    div-int/lit8 v1, v1, 0x2

    sub-int/2addr v0, v1

    iget v1, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mBackButtonWidth:I

    sub-int/2addr v0, v1

    .line 158
    iget-object v1, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {v1, p1, v0}, Landroid/support/v7/widget/LinearLayoutManager;->scrollToPositionWithOffset(II)V

    .line 159
    return-void
.end method

.method private updateTipMessage(III)V
    .locals 2
    .param p2    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param

    .line 260
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xaf

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;

    .line 261
    invoke-interface {v0, p1, p2, p3}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->showTips(III)V

    .line 262
    return-void
.end method


# virtual methods
.method public closeEyeLight()V
    .locals 3

    .line 339
    const-string v0, "-1"

    .line 340
    const/4 v1, 0x0

    :goto_0
    sget-object v2, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->EYE_LIGHT_TYPE_LIST:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 341
    sget-object v2, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->EYE_LIGHT_TYPE_LIST:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$EyeLightItem;

    .line 342
    invoke-virtual {v2}, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$EyeLightItem;->getType()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 343
    invoke-direct {p0, v1}, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->onItemSelected(I)V

    .line 344
    goto :goto_1

    .line 340
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 347
    :cond_1
    :goto_1
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mAdapter:Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;

    iget v1, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mSelectPosition:I

    invoke-virtual {v0, v1}, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;->setSelectedPosition(I)V

    .line 348
    iget v0, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mSelectPosition:I

    invoke-direct {p0, v0}, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->setItemInCenter(I)V

    .line 349
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mAdapter:Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;

    invoke-virtual {v0}, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;->notifyDataSetChanged()V

    .line 350
    return-void
.end method

.method public enterAnim(Landroid/view/View;Landroid/support/v4/view/ViewPropertyAnimatorListener;)V
    .locals 2

    .line 273
    const/high16 v0, 0x42c80000    # 100.0f

    invoke-virtual {p1, v0}, Landroid/view/View;->setTranslationX(F)V

    .line 274
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/View;->setAlpha(F)V

    .line 275
    invoke-static {p1}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    .line 276
    invoke-virtual {p1, v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->translationX(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    .line 277
    const/high16 v0, 0x3f800000    # 1.0f

    invoke-virtual {p1, v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    .line 278
    const-wide/16 v0, 0x118

    invoke-virtual {p1, v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    new-instance v0, Lmiui/view/animation/QuinticEaseOutInterpolator;

    invoke-direct {v0}, Lmiui/view/animation/QuinticEaseOutInterpolator;-><init>()V

    .line 279
    invoke-virtual {p1, v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    .line 280
    invoke-virtual {p1, p2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setListener(Landroid/support/v4/view/ViewPropertyAnimatorListener;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    .line 281
    const-wide/16 v0, 0x78

    invoke-virtual {p1, v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setStartDelay(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    .line 282
    invoke-virtual {p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 283
    return-void
.end method

.method public exitAnim(Landroid/view/View;Landroid/support/v4/view/ViewPropertyAnimatorListener;)V
    .locals 2

    .line 286
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/View;->setTranslationX(F)V

    .line 287
    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {p1, v1}, Landroid/view/View;->setAlpha(F)V

    .line 288
    invoke-static {p1}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    .line 289
    const/high16 v1, 0x42c80000    # 100.0f

    invoke-virtual {p1, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->translationX(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    .line 290
    invoke-virtual {p1, v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    .line 291
    const-wide/16 v0, 0x78

    invoke-virtual {p1, v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    .line 292
    const-wide/16 v0, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setStartDelay(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    new-instance v0, Lmiui/view/animation/QuinticEaseInInterpolator;

    invoke-direct {v0}, Lmiui/view/animation/QuinticEaseInInterpolator;-><init>()V

    .line 293
    invoke-virtual {p1, v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    .line 294
    invoke-virtual {p1, p2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setListener(Landroid/support/v4/view/ViewPropertyAnimatorListener;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    .line 295
    invoke-virtual {p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 296
    return-void
.end method

.method protected getAnimateView()Landroid/view/View;
    .locals 1

    .line 253
    const/4 v0, 0x0

    return-object v0
.end method

.method public final getFragmentTag()Ljava/lang/String;
    .locals 1

    .line 299
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected initView(Landroid/view/View;)V
    .locals 3

    .line 89
    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0a00e3

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mItemWidth:I

    .line 90
    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    iput v0, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mTotalWidth:I

    .line 91
    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0a00e5

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mBackButtonWidth:I

    .line 93
    const v0, 0x7f0d0053

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mBackView:Landroid/view/View;

    .line 94
    const v0, 0x7f0d0054

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/support/v7/widget/RecyclerView;

    iput-object p1, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    .line 95
    new-instance p1, Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p1, v0}, Landroid/support/v7/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    .line 96
    iget-object p1, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/support/v7/widget/LinearLayoutManager;->setOrientation(I)V

    .line 97
    new-instance p1, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;

    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    sget-object v2, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->EYE_LIGHT_TYPE_LIST:Ljava/util/List;

    invoke-direct {p1, v1, v2, v0}, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;-><init>(Landroid/content/Context;Ljava/util/List;I)V

    iput-object p1, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mAdapter:Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;

    .line 99
    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->getUserVisibleHint()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 100
    invoke-direct {p0}, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->reSelectItem()V

    .line 103
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lcom/android/camera/Util;->isLayoutRTL(Landroid/content/Context;)Z

    move-result p1

    .line 104
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    iget-object v1, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    .line 105
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    iget-object v1, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mAdapter:Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 106
    new-instance v0, Lcom/android/camera/fragment/DefaultItemAnimator;

    invoke-direct {v0}, Lcom/android/camera/fragment/DefaultItemAnimator;-><init>()V

    .line 107
    const-wide/16 v1, 0x96

    invoke-virtual {v0, v1, v2}, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->setChangeDuration(J)V

    .line 108
    invoke-virtual {v0, v1, v2}, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->setMoveDuration(J)V

    .line 109
    invoke-virtual {v0, v1, v2}, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->setAddDuration(J)V

    .line 110
    iget-object v1, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v1, v0}, Landroid/support/v7/widget/RecyclerView;->setItemAnimator(Landroid/support/v7/widget/RecyclerView$ItemAnimator;)V

    .line 111
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    new-instance v1, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment$1;

    invoke-direct {v1, p0, p1}, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment$1;-><init>(Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;Z)V

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->addItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    .line 133
    iget-object p1, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mAdapter:Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;

    new-instance v0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment$2;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment$2;-><init>(Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;)V

    invoke-virtual {p1, v0}, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 139
    iget-object p1, p0, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->mBackView:Landroid/view/View;

    invoke-virtual {p1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 140
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 144
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    .line 145
    const/16 v1, 0xa1

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$CameraAction;

    .line 146
    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->isDoingAction()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 147
    return-void

    .line 150
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p1

    const v0, 0x7f0d0053

    if-ne p1, v0, :cond_1

    .line 151
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 v0, 0xc2

    invoke-virtual {p1, v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$MiBeautyProtocol;

    .line 152
    const/4 v0, 0x3

    invoke-interface {p1, v0}, Lcom/android/camera/protocol/ModeProtocol$MiBeautyProtocol;->switchBeautyType(I)V

    .line 154
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

    .line 83
    const p3, 0x7f040018

    const/4 v0, 0x0

    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    .line 84
    invoke-virtual {p0, p1}, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->initView(Landroid/view/View;)V

    .line 85
    return-object p1
.end method

.method public userInvisibleHit()V
    .locals 3

    .line 322
    invoke-static {}, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->hasFrontFlash()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 323
    const v0, 0x7f0901c1

    invoke-direct {p0, v0}, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->hideTipMessage(I)V

    .line 325
    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa0

    .line 326
    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;

    .line 327
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    const/16 v2, 0xc2

    .line 328
    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v1

    check-cast v1, Lcom/android/camera/protocol/ModeProtocol$MiBeautyProtocol;

    .line 329
    if-eqz v0, :cond_3

    if-nez v1, :cond_1

    goto :goto_0

    .line 333
    :cond_1
    invoke-interface {v1}, Lcom/android/camera/protocol/ModeProtocol$MiBeautyProtocol;->getBeautyType()I

    move-result v1

    const/4 v2, 0x1

    if-eq v1, v2, :cond_2

    const v1, 0x7f0d00ff

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;->getActiveFragment(I)I

    move-result v1

    const/16 v2, 0xfc

    if-eq v1, v2, :cond_2

    .line 334
    const/4 v1, 0x3

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;->delegateEvent(I)V

    .line 336
    :cond_2
    return-void

    .line 330
    :cond_3
    :goto_0
    return-void
.end method

.method public userVisibleHint()V
    .locals 3

    .line 304
    invoke-direct {p0}, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->reSelectItem()V

    .line 305
    invoke-static {}, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->hasFrontFlash()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 306
    const/16 v0, 0xa

    const v1, 0x7f0901c1

    const/4 v2, 0x2

    invoke-direct {p0, v0, v1, v2}, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->updateTipMessage(III)V

    .line 310
    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa0

    .line 311
    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;

    .line 312
    if-nez v0, :cond_1

    .line 313
    return-void

    .line 316
    :cond_1
    const v1, 0x7f0d00ff

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;->getActiveFragment(I)I

    move-result v1

    const/16 v2, 0xfc

    if-ne v1, v2, :cond_2

    .line 317
    const/4 v1, 0x3

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;->delegateEvent(I)V

    .line 319
    :cond_2
    return-void
.end method
