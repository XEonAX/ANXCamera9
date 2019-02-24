.class public Lcom/android/camera/fragment/beauty/LiveBeautyModeSetting;
.super Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;
.source "LiveBeautyModeSetting.java"


# static fields
.field public static final LIVE_BEAUTY_MODE_DEF_VALUE:I = 0x28

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

    .line 11
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/android/camera/fragment/beauty/LiveBeautyModeSetting;->sLiveBeautyModeTypes:Ljava/util/List;

    .line 12
    sget-object v0, Lcom/android/camera/fragment/beauty/LiveBeautyModeSetting;->sLiveBeautyModeTypes:Ljava/util/List;

    sget-object v1, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->LIVE_SHRINK_FACE_RATIO:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 13
    sget-object v0, Lcom/android/camera/fragment/beauty/LiveBeautyModeSetting;->sLiveBeautyModeTypes:Ljava/util/List;

    sget-object v1, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->LIVE_ENLARGE_EYE_RATIO:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 14
    sget-object v0, Lcom/android/camera/fragment/beauty/LiveBeautyModeSetting;->sLiveBeautyModeTypes:Ljava/util/List;

    sget-object v1, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;->LIVE_SMOOTH_STRENGTH:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 15
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 6
    invoke-direct {p0}, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;-><init>()V

    return-void
.end method


# virtual methods
.method protected getProgressDefValue()I
    .locals 1

    .line 24
    const/16 v0, 0x28

    return v0
.end method

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

    .line 19
    sget-object v0, Lcom/android/camera/fragment/beauty/LiveBeautyModeSetting;->sLiveBeautyModeTypes:Ljava/util/List;

    return-object v0
.end method
