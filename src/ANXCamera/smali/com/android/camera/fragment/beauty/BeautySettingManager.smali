.class public Lcom/android/camera/fragment/beauty/BeautySettingManager;
.super Ljava/lang/Object;
.source "BeautySettingManager.java"


# static fields
.field private static final TAG:Ljava/lang/String;

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
.method static constructor <clinit>()V
    .locals 1

    .line 10
    const-class v0, Lcom/android/camera/fragment/beauty/BeautySettingManager;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/fragment/beauty/BeautySettingManager;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    const/4 v0, 0x2

    iput v0, p0, Lcom/android/camera/fragment/beauty/BeautySettingManager;->mBeautyType:I

    .line 24
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/android/camera/fragment/beauty/BeautySettingManager;->mBeautySettingBusinessArray:Landroid/util/SparseArray;

    .line 25
    invoke-direct {p0}, Lcom/android/camera/fragment/beauty/BeautySettingManager;->updateBeautySettingBusiness()V

    .line 26
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

    .line 91
    sget-object v0, Lcom/android/camera/fragment/beauty/BeautySettingManager;->mBackSupportedBeautyType:Ljava/util/List;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/android/camera/fragment/beauty/BeautySettingManager;->mBackSupportedBeautyType:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 92
    sget-object v0, Lcom/android/camera/fragment/beauty/BeautySettingManager;->mBackSupportedBeautyType:Ljava/util/List;

    return-object v0

    .line 94
    :cond_0
    sget-object v0, Lcom/android/camera/fragment/beauty/BeautySettingManager;->mBackSupportedBeautyType:Ljava/util/List;

    if-nez v0, :cond_1

    .line 95
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/android/camera/fragment/beauty/BeautySettingManager;->mBackSupportedBeautyType:Ljava/util/List;

    .line 98
    :cond_1
    sget-object v0, Lcom/android/camera/fragment/beauty/BeautySettingManager;->mBackSupportedBeautyType:Ljava/util/List;

    invoke-static {}, Lcom/android/camera/fragment/beauty/BeautyBodySettingBusiness;->getSupportBeautyTypes()Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 99
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

    .line 77
    sget-object v0, Lcom/android/camera/fragment/beauty/BeautySettingManager;->mFrontSupportedBeautyType:Ljava/util/List;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/android/camera/fragment/beauty/BeautySettingManager;->mFrontSupportedBeautyType:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 78
    sget-object v0, Lcom/android/camera/fragment/beauty/BeautySettingManager;->mFrontSupportedBeautyType:Ljava/util/List;

    return-object v0

    .line 80
    :cond_0
    sget-object v0, Lcom/android/camera/fragment/beauty/BeautySettingManager;->mFrontSupportedBeautyType:Ljava/util/List;

    if-nez v0, :cond_1

    .line 81
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/android/camera/fragment/beauty/BeautySettingManager;->mFrontSupportedBeautyType:Ljava/util/List;

    .line 84
    :cond_1
    sget-object v0, Lcom/android/camera/fragment/beauty/BeautySettingManager;->mFrontSupportedBeautyType:Ljava/util/List;

    invoke-static {}, Lcom/android/camera/fragment/beauty/BeautyModeSettingBusiness;->getSupportBeautyTypes()Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 86
    sget-object v0, Lcom/android/camera/fragment/beauty/BeautySettingManager;->mFrontSupportedBeautyType:Ljava/util/List;

    invoke-static {}, Lcom/android/camera/fragment/beauty/BeautyMakeupSettingBusiness;->getSupportBeautyTypes()Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 87
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

    .line 103
    sget-object v0, Lcom/android/camera/fragment/beauty/BeautySettingManager;->mLegacySupportedBeautyType:Ljava/util/List;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/android/camera/fragment/beauty/BeautySettingManager;->mLegacySupportedBeautyType:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 104
    sget-object v0, Lcom/android/camera/fragment/beauty/BeautySettingManager;->mLegacySupportedBeautyType:Ljava/util/List;

    return-object v0

    .line 106
    :cond_0
    sget-object v0, Lcom/android/camera/fragment/beauty/BeautySettingManager;->mLegacySupportedBeautyType:Ljava/util/List;

    if-nez v0, :cond_1

    .line 107
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/android/camera/fragment/beauty/BeautySettingManager;->mLegacySupportedBeautyType:Ljava/util/List;

    .line 109
    :cond_1
    sget-object v0, Lcom/android/camera/fragment/beauty/BeautySettingManager;->mLegacySupportedBeautyType:Ljava/util/List;

    invoke-static {}, Lcom/android/camera/fragment/beauty/BeautyModeSettingBusiness;->getSupportLegacyBeautyModeTypes()Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 110
    sget-object v0, Lcom/android/camera/fragment/beauty/BeautySettingManager;->mLegacySupportedBeautyType:Ljava/util/List;

    return-object v0
.end method

.method private updateBeautySettingBusiness()V
    .locals 3

    .line 39
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/BeautySettingManager;->mBeautySettingBusinessArray:Landroid/util/SparseArray;

    iget v1, p0, Lcom/android/camera/fragment/beauty/BeautySettingManager;->mBeautyType:I

    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera/fragment/beauty/IBeautySettingBusiness;

    iput-object v0, p0, Lcom/android/camera/fragment/beauty/BeautySettingManager;->mCurrentBeautySetting:Lcom/android/camera/fragment/beauty/IBeautySettingBusiness;

    .line 40
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/BeautySettingManager;->mCurrentBeautySetting:Lcom/android/camera/fragment/beauty/IBeautySettingBusiness;

    if-eqz v0, :cond_0

    .line 41
    return-void

    .line 43
    :cond_0
    iget v0, p0, Lcom/android/camera/fragment/beauty/BeautySettingManager;->mBeautyType:I

    const/4 v1, 0x5

    if-eq v0, v1, :cond_2

    const/4 v1, 0x7

    if-eq v0, v1, :cond_1

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    .line 50
    :pswitch_0
    new-instance v0, Lcom/android/camera/fragment/beauty/BeautyMakeupSettingBusiness;

    invoke-direct {v0}, Lcom/android/camera/fragment/beauty/BeautyMakeupSettingBusiness;-><init>()V

    .line 51
    iput-object v0, p0, Lcom/android/camera/fragment/beauty/BeautySettingManager;->mCurrentBeautySetting:Lcom/android/camera/fragment/beauty/IBeautySettingBusiness;

    .line 52
    iget-object v1, p0, Lcom/android/camera/fragment/beauty/BeautySettingManager;->mBeautySettingBusinessArray:Landroid/util/SparseArray;

    iget v2, p0, Lcom/android/camera/fragment/beauty/BeautySettingManager;->mBeautyType:I

    invoke-virtual {v1, v2, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 53
    goto :goto_0

    .line 45
    :pswitch_1
    new-instance v0, Lcom/android/camera/fragment/beauty/BeautyModeSettingBusiness;

    invoke-direct {v0}, Lcom/android/camera/fragment/beauty/BeautyModeSettingBusiness;-><init>()V

    .line 46
    iput-object v0, p0, Lcom/android/camera/fragment/beauty/BeautySettingManager;->mCurrentBeautySetting:Lcom/android/camera/fragment/beauty/IBeautySettingBusiness;

    .line 47
    iget-object v1, p0, Lcom/android/camera/fragment/beauty/BeautySettingManager;->mBeautySettingBusinessArray:Landroid/util/SparseArray;

    iget v2, p0, Lcom/android/camera/fragment/beauty/BeautySettingManager;->mBeautyType:I

    invoke-virtual {v1, v2, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 48
    goto :goto_0

    .line 60
    :cond_1
    new-instance v0, Lcom/android/camera/fragment/beauty/LiveBeautyModeSetting;

    invoke-direct {v0}, Lcom/android/camera/fragment/beauty/LiveBeautyModeSetting;-><init>()V

    .line 61
    iput-object v0, p0, Lcom/android/camera/fragment/beauty/BeautySettingManager;->mCurrentBeautySetting:Lcom/android/camera/fragment/beauty/IBeautySettingBusiness;

    .line 62
    iget-object v1, p0, Lcom/android/camera/fragment/beauty/BeautySettingManager;->mBeautySettingBusinessArray:Landroid/util/SparseArray;

    iget v2, p0, Lcom/android/camera/fragment/beauty/BeautySettingManager;->mBeautyType:I

    invoke-virtual {v1, v2, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto :goto_0

    .line 55
    :cond_2
    new-instance v0, Lcom/android/camera/fragment/beauty/BeautyBodySettingBusiness;

    invoke-direct {v0}, Lcom/android/camera/fragment/beauty/BeautyBodySettingBusiness;-><init>()V

    .line 56
    iput-object v0, p0, Lcom/android/camera/fragment/beauty/BeautySettingManager;->mCurrentBeautySetting:Lcom/android/camera/fragment/beauty/IBeautySettingBusiness;

    .line 57
    iget-object v1, p0, Lcom/android/camera/fragment/beauty/BeautySettingManager;->mBeautySettingBusinessArray:Landroid/util/SparseArray;

    iget v2, p0, Lcom/android/camera/fragment/beauty/BeautySettingManager;->mBeautyType:I

    invoke-virtual {v1, v2, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 58
    nop

    .line 65
    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public getBeautyType()I
    .locals 1

    .line 35
    iget v0, p0, Lcom/android/camera/fragment/beauty/BeautySettingManager;->mBeautyType:I

    return v0
.end method

.method public getCurrentBeautySettingBusiness()Lcom/android/camera/fragment/beauty/IBeautySettingBusiness;
    .locals 2

    .line 69
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/BeautySettingManager;->mCurrentBeautySetting:Lcom/android/camera/fragment/beauty/IBeautySettingBusiness;

    if-nez v0, :cond_0

    .line 70
    sget-object v0, Lcom/android/camera/fragment/beauty/BeautySettingManager;->TAG:Ljava/lang/String;

    const-string v1, "The current BeautySetting is empty!!!!!!!!"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 71
    invoke-direct {p0}, Lcom/android/camera/fragment/beauty/BeautySettingManager;->updateBeautySettingBusiness()V

    .line 73
    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/BeautySettingManager;->mCurrentBeautySetting:Lcom/android/camera/fragment/beauty/IBeautySettingBusiness;

    return-object v0
.end method

.method public setBeautyType(I)V
    .locals 0

    .line 29
    iput p1, p0, Lcom/android/camera/fragment/beauty/BeautySettingManager;->mBeautyType:I

    .line 30
    invoke-direct {p0}, Lcom/android/camera/fragment/beauty/BeautySettingManager;->updateBeautySettingBusiness()V

    .line 31
    return-void
.end method
