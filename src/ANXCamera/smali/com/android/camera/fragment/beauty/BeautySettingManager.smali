.class public Lcom/android/camera/fragment/beauty/BeautySettingManager;
.super Ljava/lang/Object;
.source "BeautySettingManager.java"


# static fields
.field private static mBackSupportedBeautyType:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/camera/fragment/beauty/BeautyParameters$Type;",
            ">;"
        }
    .end annotation
.end field

.field private static mFrontSupportedBeautyType:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/camera/fragment/beauty/BeautyParameters$Type;",
            ">;"
        }
    .end annotation
.end field

.field private static mLegacySupportedBeautyType:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/camera/fragment/beauty/BeautyParameters$Type;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mBeautySettingBusinessArray:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Lcom/android/camera/fragment/beauty/IBeautySettingBusiness;",
            ">;"
        }
    .end annotation
.end field

.field private mBeautyType:I

.field private mCurrentBeautySetting:Lcom/android/camera/fragment/beauty/IBeautySettingBusiness;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    const/4 v0, 0x2

    iput v0, p0, Lcom/android/camera/fragment/beauty/BeautySettingManager;->mBeautyType:I

    .line 22
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/android/camera/fragment/beauty/BeautySettingManager;->mBeautySettingBusinessArray:Landroid/util/SparseArray;

    .line 23
    invoke-direct {p0}, Lcom/android/camera/fragment/beauty/BeautySettingManager;->updateBeautySettingBusiness()V

    .line 24
    return-void
.end method

.method public static getBackSupportedBeautyTypes()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/android/camera/fragment/beauty/BeautyParameters$Type;",
            ">;"
        }
    .end annotation

    .line 79
    sget-object v0, Lcom/android/camera/fragment/beauty/BeautySettingManager;->mBackSupportedBeautyType:Ljava/util/List;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/android/camera/fragment/beauty/BeautySettingManager;->mBackSupportedBeautyType:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 80
    sget-object v0, Lcom/android/camera/fragment/beauty/BeautySettingManager;->mBackSupportedBeautyType:Ljava/util/List;

    return-object v0

    .line 82
    :cond_0
    sget-object v0, Lcom/android/camera/fragment/beauty/BeautySettingManager;->mBackSupportedBeautyType:Ljava/util/List;

    if-nez v0, :cond_1

    .line 83
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/android/camera/fragment/beauty/BeautySettingManager;->mBackSupportedBeautyType:Ljava/util/List;

    .line 86
    :cond_1
    sget-object v0, Lcom/android/camera/fragment/beauty/BeautySettingManager;->mBackSupportedBeautyType:Ljava/util/List;

    invoke-static {}, Lcom/android/camera/fragment/beauty/BeautyBodySettingBusiness;->getSupportBeautyTypes()Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 87
    sget-object v0, Lcom/android/camera/fragment/beauty/BeautySettingManager;->mBackSupportedBeautyType:Ljava/util/List;

    return-object v0
.end method

.method public static getFrontSupportedBeautyTypes()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/android/camera/fragment/beauty/BeautyParameters$Type;",
            ">;"
        }
    .end annotation

    .line 65
    sget-object v0, Lcom/android/camera/fragment/beauty/BeautySettingManager;->mFrontSupportedBeautyType:Ljava/util/List;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/android/camera/fragment/beauty/BeautySettingManager;->mFrontSupportedBeautyType:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 66
    sget-object v0, Lcom/android/camera/fragment/beauty/BeautySettingManager;->mFrontSupportedBeautyType:Ljava/util/List;

    return-object v0

    .line 68
    :cond_0
    sget-object v0, Lcom/android/camera/fragment/beauty/BeautySettingManager;->mFrontSupportedBeautyType:Ljava/util/List;

    if-nez v0, :cond_1

    .line 69
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/android/camera/fragment/beauty/BeautySettingManager;->mFrontSupportedBeautyType:Ljava/util/List;

    .line 72
    :cond_1
    sget-object v0, Lcom/android/camera/fragment/beauty/BeautySettingManager;->mFrontSupportedBeautyType:Ljava/util/List;

    invoke-static {}, Lcom/android/camera/fragment/beauty/BeautyModeSettingBusiness;->getSupportBeautyTypes()Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 74
    sget-object v0, Lcom/android/camera/fragment/beauty/BeautySettingManager;->mFrontSupportedBeautyType:Ljava/util/List;

    invoke-static {}, Lcom/android/camera/fragment/beauty/BeautyMakeupSettingBusiness;->getSupportBeautyTypes()Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 75
    sget-object v0, Lcom/android/camera/fragment/beauty/BeautySettingManager;->mFrontSupportedBeautyType:Ljava/util/List;

    return-object v0
.end method

.method public static getLegacySupportedBeautyTypes()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/android/camera/fragment/beauty/BeautyParameters$Type;",
            ">;"
        }
    .end annotation

    .line 91
    sget-object v0, Lcom/android/camera/fragment/beauty/BeautySettingManager;->mLegacySupportedBeautyType:Ljava/util/List;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/android/camera/fragment/beauty/BeautySettingManager;->mLegacySupportedBeautyType:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 92
    sget-object v0, Lcom/android/camera/fragment/beauty/BeautySettingManager;->mLegacySupportedBeautyType:Ljava/util/List;

    return-object v0

    .line 94
    :cond_0
    sget-object v0, Lcom/android/camera/fragment/beauty/BeautySettingManager;->mLegacySupportedBeautyType:Ljava/util/List;

    if-nez v0, :cond_1

    .line 95
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/android/camera/fragment/beauty/BeautySettingManager;->mLegacySupportedBeautyType:Ljava/util/List;

    .line 97
    :cond_1
    sget-object v0, Lcom/android/camera/fragment/beauty/BeautySettingManager;->mLegacySupportedBeautyType:Ljava/util/List;

    invoke-static {}, Lcom/android/camera/fragment/beauty/BeautyModeSettingBusiness;->getSupportLegacyBeautyModeTypes()Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 98
    sget-object v0, Lcom/android/camera/fragment/beauty/BeautySettingManager;->mLegacySupportedBeautyType:Ljava/util/List;

    return-object v0
.end method

.method private updateBeautySettingBusiness()V
    .locals 3

    .line 37
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/BeautySettingManager;->mBeautySettingBusinessArray:Landroid/util/SparseArray;

    iget v1, p0, Lcom/android/camera/fragment/beauty/BeautySettingManager;->mBeautyType:I

    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera/fragment/beauty/IBeautySettingBusiness;

    iput-object v0, p0, Lcom/android/camera/fragment/beauty/BeautySettingManager;->mCurrentBeautySetting:Lcom/android/camera/fragment/beauty/IBeautySettingBusiness;

    .line 38
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/BeautySettingManager;->mCurrentBeautySetting:Lcom/android/camera/fragment/beauty/IBeautySettingBusiness;

    if-eqz v0, :cond_0

    .line 39
    return-void

    .line 41
    :cond_0
    iget v0, p0, Lcom/android/camera/fragment/beauty/BeautySettingManager;->mBeautyType:I

    const/4 v1, 0x5

    if-eq v0, v1, :cond_1

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    .line 48
    :pswitch_0
    new-instance v0, Lcom/android/camera/fragment/beauty/BeautyMakeupSettingBusiness;

    invoke-direct {v0}, Lcom/android/camera/fragment/beauty/BeautyMakeupSettingBusiness;-><init>()V

    .line 49
    iput-object v0, p0, Lcom/android/camera/fragment/beauty/BeautySettingManager;->mCurrentBeautySetting:Lcom/android/camera/fragment/beauty/IBeautySettingBusiness;

    .line 50
    iget-object v1, p0, Lcom/android/camera/fragment/beauty/BeautySettingManager;->mBeautySettingBusinessArray:Landroid/util/SparseArray;

    iget v2, p0, Lcom/android/camera/fragment/beauty/BeautySettingManager;->mBeautyType:I

    invoke-virtual {v1, v2, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 51
    goto :goto_0

    .line 43
    :pswitch_1
    new-instance v0, Lcom/android/camera/fragment/beauty/BeautyModeSettingBusiness;

    invoke-direct {v0}, Lcom/android/camera/fragment/beauty/BeautyModeSettingBusiness;-><init>()V

    .line 44
    iput-object v0, p0, Lcom/android/camera/fragment/beauty/BeautySettingManager;->mCurrentBeautySetting:Lcom/android/camera/fragment/beauty/IBeautySettingBusiness;

    .line 45
    iget-object v1, p0, Lcom/android/camera/fragment/beauty/BeautySettingManager;->mBeautySettingBusinessArray:Landroid/util/SparseArray;

    iget v2, p0, Lcom/android/camera/fragment/beauty/BeautySettingManager;->mBeautyType:I

    invoke-virtual {v1, v2, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 46
    goto :goto_0

    .line 53
    :cond_1
    new-instance v0, Lcom/android/camera/fragment/beauty/BeautyBodySettingBusiness;

    invoke-direct {v0}, Lcom/android/camera/fragment/beauty/BeautyBodySettingBusiness;-><init>()V

    .line 54
    iput-object v0, p0, Lcom/android/camera/fragment/beauty/BeautySettingManager;->mCurrentBeautySetting:Lcom/android/camera/fragment/beauty/IBeautySettingBusiness;

    .line 55
    iget-object v1, p0, Lcom/android/camera/fragment/beauty/BeautySettingManager;->mBeautySettingBusinessArray:Landroid/util/SparseArray;

    iget v2, p0, Lcom/android/camera/fragment/beauty/BeautySettingManager;->mBeautyType:I

    invoke-virtual {v1, v2, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 58
    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public getBeautyType()I
    .locals 1

    .line 33
    iget v0, p0, Lcom/android/camera/fragment/beauty/BeautySettingManager;->mBeautyType:I

    return v0
.end method

.method public getCurrentBeautySettingBusiness()Lcom/android/camera/fragment/beauty/IBeautySettingBusiness;
    .locals 1

    .line 61
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/BeautySettingManager;->mCurrentBeautySetting:Lcom/android/camera/fragment/beauty/IBeautySettingBusiness;

    return-object v0
.end method

.method public setBeautyType(I)V
    .locals 0

    .line 27
    iput p1, p0, Lcom/android/camera/fragment/beauty/BeautySettingManager;->mBeautyType:I

    .line 28
    invoke-direct {p0}, Lcom/android/camera/fragment/beauty/BeautySettingManager;->updateBeautySettingBusiness()V

    .line 29
    return-void
.end method
