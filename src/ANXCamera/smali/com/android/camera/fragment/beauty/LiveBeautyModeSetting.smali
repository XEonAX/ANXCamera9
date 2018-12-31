.class public Lcom/android/camera/fragment/beauty/LiveBeautyModeSetting;
.super Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;
.source "LiveBeautyModeSetting.java"


# static fields
.field private static sLiveBeautyModeTypes:Ljava/util/List;
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

    sput-object v0, Lcom/android/camera/fragment/beauty/LiveBeautyModeSetting;->sLiveBeautyModeTypes:Ljava/util/List;

    .line 11
    sget-object v0, Lcom/android/camera/fragment/beauty/LiveBeautyModeSetting;->sLiveBeautyModeTypes:Ljava/util/List;

    sget-object v1, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->LIVE_SHRINK_FACE_RATIO:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 12
    sget-object v0, Lcom/android/camera/fragment/beauty/LiveBeautyModeSetting;->sLiveBeautyModeTypes:Ljava/util/List;

    sget-object v1, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->LIVE_ENLARGE_EYE_RATIO:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 13
    sget-object v0, Lcom/android/camera/fragment/beauty/LiveBeautyModeSetting;->sLiveBeautyModeTypes:Ljava/util/List;

    sget-object v1, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->LIVE_WHITEN_STRENGTH:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 14
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 6
    invoke-direct {p0}, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;-><init>()V

    return-void
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

    .line 18
    sget-object v0, Lcom/android/camera/fragment/beauty/LiveBeautyModeSetting;->sLiveBeautyModeTypes:Ljava/util/List;

    return-object v0
.end method
