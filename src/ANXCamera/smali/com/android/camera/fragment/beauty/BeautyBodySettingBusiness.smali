.class public Lcom/android/camera/fragment/beauty/BeautyBodySettingBusiness;
.super Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;
.source "BeautyBodySettingBusiness.java"


# static fields
.field private static sSupprotBeautyBodyTypes:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/camera/fragment/beauty/BeautyParameters$Type;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 10
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 11
    sget-object v1, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->HEAD_SLIM_RATIO:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 12
    sget-object v1, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->BODY_SLIM_RATIO:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 13
    sget-object v1, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->SHOULDER_SLIM_RATIO:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 14
    sget-object v1, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->LEG_SLIM_RATIO:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 15
    invoke-static {v0}, Lcom/android/camera/fragment/beauty/BeautyParameters;->updateSupportedBeautyTypes(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lcom/android/camera/fragment/beauty/BeautyBodySettingBusiness;->sSupprotBeautyBodyTypes:Ljava/util/List;

    .line 16
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 6
    invoke-direct {p0}, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;-><init>()V

    return-void
.end method

.method public static getSupportBeautyTypes()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/android/camera/fragment/beauty/BeautyParameters$Type;",
            ">;"
        }
    .end annotation

    .line 23
    sget-object v0, Lcom/android/camera/fragment/beauty/BeautyBodySettingBusiness;->sSupprotBeautyBodyTypes:Ljava/util/List;

    return-object v0
.end method


# virtual methods
.method public getTypeArray()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/android/camera/fragment/beauty/BeautyParameters$Type;",
            ">;"
        }
    .end annotation

    .line 20
    sget-object v0, Lcom/android/camera/fragment/beauty/BeautyBodySettingBusiness;->sSupprotBeautyBodyTypes:Ljava/util/List;

    return-object v0
.end method
