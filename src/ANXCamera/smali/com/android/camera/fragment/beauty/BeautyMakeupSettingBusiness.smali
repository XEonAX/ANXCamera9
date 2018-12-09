.class public Lcom/android/camera/fragment/beauty/BeautyMakeupSettingBusiness;
.super Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;
.source "BeautyMakeupSettingBusiness.java"


# static fields
.field private static sSupprotBeautyMakeupTypes:Ljava/util/List;
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

    .line 13
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    sget-object v1, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->EYEBROW_DYE_RATIO:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 15
    sget-object v1, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->PUPIL_LINE_RATIO:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 16
    sget-object v1, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->JELLY_LIPS_RATIO:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 17
    sget-object v1, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->BLUSHER_RATIO:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 18
    invoke-static {v0}, Lcom/android/camera/fragment/beauty/BeautyParameters;->updateSupportedBeautyTypes(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lcom/android/camera/fragment/beauty/BeautyMakeupSettingBusiness;->sSupprotBeautyMakeupTypes:Ljava/util/List;

    .line 19
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 9
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

    .line 27
    sget-object v0, Lcom/android/camera/fragment/beauty/BeautyMakeupSettingBusiness;->sSupprotBeautyMakeupTypes:Ljava/util/List;

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

    .line 23
    sget-object v0, Lcom/android/camera/fragment/beauty/BeautyMakeupSettingBusiness;->sSupprotBeautyMakeupTypes:Ljava/util/List;

    return-object v0
.end method
