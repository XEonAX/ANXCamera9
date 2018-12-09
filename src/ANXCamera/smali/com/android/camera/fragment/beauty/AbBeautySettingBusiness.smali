.class public abstract Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;
.super Ljava/lang/Object;
.source "AbBeautySettingBusiness.java"

# interfaces
.implements Lcom/android/camera/fragment/beauty/IBeautySettingBusiness;


# static fields
.field protected static final DEF_BEAUTY_CLOSE_VALUE:I

.field private static final TAG:Ljava/lang/String;


# instance fields
.field protected mBeautyLevel:I

.field private mBeautyValueRange:[I

.field protected mCurrentBeautyItemType:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

.field protected mCurrentBeautyParameterType:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

.field protected mExtraTable:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/android/camera/fragment/beauty/BeautyParameters$Type;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 15
    const-class v0, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    invoke-static {}, Lcom/android/camera/CameraSettings;->getBeautifyValueRange()[I

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->mBeautyValueRange:[I

    .line 25
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->mExtraTable:Ljava/util/Map;

    .line 26
    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->initBeauty()V

    .line 27
    return-void
.end method

.method private updateExtraTable()V
    .locals 7

    .line 46
    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->getTypeArray()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    .line 47
    nop

    .line 48
    invoke-static {v1}, Lcom/android/camera/fragment/beauty/BeautyParameters;->getFaceBeautyRatioKey(Lcom/android/camera/fragment/beauty/BeautyParameters$Type;)Ljava/lang/String;

    move-result-object v2

    .line 49
    const-string v3, ""

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    const/4 v4, 0x0

    if-nez v3, :cond_2

    .line 50
    invoke-static {v2, v4}, Lcom/android/camera/CameraSettings;->getFaceBeautyRatio(Ljava/lang/String;I)I

    move-result v3

    .line 51
    if-nez v3, :cond_1

    .line 52
    iget-object v3, p0, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->mBeautyValueRange:[I

    const/4 v5, 0x1

    aget v3, v3, v5

    iget-object v5, p0, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->mBeautyValueRange:[I

    aget v5, v5, v4

    sub-int/2addr v3, v5

    .line 53
    invoke-static {}, Lcom/mi/config/b;->hp()Z

    move-result v5

    if-eqz v5, :cond_0

    if-eqz v3, :cond_0

    .line 54
    invoke-static {v2}, Lcom/android/camera/CameraSettings;->getBeautifyDefaultValue(Ljava/lang/String;)I

    move-result v2

    .line 55
    const/16 v5, 0x64

    iget-object v6, p0, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->mBeautyValueRange:[I

    aget v4, v6, v4

    sub-int v4, v2, v4

    mul-int/2addr v5, v4

    div-int v4, v5, v3

    .line 56
    sget-object v3, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "updateExtraTable: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "->"

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "%"

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v3, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 57
    goto :goto_1

    .line 58
    :cond_0
    goto :goto_1

    .line 62
    :cond_1
    move v4, v3

    :cond_2
    :goto_1
    iget-object v2, p0, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->mExtraTable:Ljava/util/Map;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v2, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 63
    goto :goto_0

    .line 64
    :cond_3
    return-void
.end method

.method private updateParameters()V
    .locals 1

    .line 40
    invoke-static {}, Lcom/android/camera/CameraSettings;->getFaceBeautifyValue()Ljava/lang/String;

    move-result-object v0

    .line 41
    invoke-static {v0}, Lcom/android/camera/CameraSettings;->intelligentValueToBeautyLevel(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->mBeautyLevel:I

    .line 42
    invoke-direct {p0}, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->updateExtraTable()V

    .line 43
    return-void
.end method


# virtual methods
.method public getCurrentBeautyParameterType()Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;
    .locals 1

    .line 118
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->mCurrentBeautyParameterType:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    return-object v0
.end method

.method public getProgress()I
    .locals 2

    .line 85
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->mExtraTable:Ljava/util/Map;

    iget-object v1, p0, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->mCurrentBeautyItemType:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_0

    .line 86
    const/4 v0, 0x0

    return v0

    .line 88
    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->mExtraTable:Ljava/util/Map;

    iget-object v1, p0, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->mCurrentBeautyItemType:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method public initBeauty()V
    .locals 2

    .line 35
    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->getTypeArray()Ljava/util/List;

    move-result-object v0

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    iput-object v0, p0, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->mCurrentBeautyItemType:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    .line 36
    invoke-direct {p0}, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->updateParameters()V

    .line 37
    return-void
.end method

.method public operate(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 31
    const/4 p1, 0x0

    return-object p1
.end method

.method public resetBeauty()V
    .locals 4

    .line 93
    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->getTypeArray()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    .line 94
    invoke-static {v1}, Lcom/android/camera/fragment/beauty/BeautyParameters;->getFaceBeautyRatioKey(Lcom/android/camera/fragment/beauty/BeautyParameters$Type;)Ljava/lang/String;

    move-result-object v3

    .line 95
    invoke-static {v3, v2}, Lcom/android/camera/CameraSettings;->setFaceBeautyRatio(Ljava/lang/String;I)V

    .line 96
    iget-object v3, p0, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->mExtraTable:Ljava/util/Map;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v3, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 97
    goto :goto_0

    .line 98
    :cond_0
    invoke-virtual {p0, v2}, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->setProgress(I)V

    .line 99
    return-void
.end method

.method public setCurrentBeautyParameterType(Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;)V
    .locals 0

    .line 113
    iput-object p1, p0, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->mCurrentBeautyParameterType:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    .line 114
    return-void
.end method

.method public setProgress(I)V
    .locals 4

    .line 69
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->mExtraTable:Ljava/util/Map;

    iget-object v1, p0, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->mCurrentBeautyItemType:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_0

    .line 70
    const/4 v0, 0x0

    goto :goto_0

    .line 72
    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->mExtraTable:Ljava/util/Map;

    iget-object v1, p0, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->mCurrentBeautyItemType:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 74
    :goto_0
    iget-object v1, p0, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->mExtraTable:Ljava/util/Map;

    iget-object v2, p0, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->mCurrentBeautyItemType:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 75
    if-ne v0, p1, :cond_1

    if-nez p1, :cond_2

    .line 76
    :cond_1
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->mCurrentBeautyItemType:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    invoke-static {v0}, Lcom/android/camera/fragment/beauty/BeautyParameters;->getFaceBeautyRatioKey(Lcom/android/camera/fragment/beauty/BeautyParameters$Type;)Ljava/lang/String;

    move-result-object v0

    .line 77
    invoke-static {v0, p1}, Lcom/android/camera/CameraSettings;->setFaceBeautyRatio(Ljava/lang/String;I)V

    .line 78
    sget-object v1, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onBeautyParameterChanged: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "="

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 79
    invoke-static {}, Lcom/android/camera/fragment/beauty/BeautyHelper;->onBeautyChanged()V

    .line 81
    :cond_2
    return-void
.end method

.method public setType(Lcom/android/camera/fragment/beauty/BeautyParameters$Type;)V
    .locals 0

    .line 108
    iput-object p1, p0, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->mCurrentBeautyItemType:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    .line 109
    return-void
.end method

.method public setType(Lcom/miui/filtersdk/beauty/BeautyParameterType;)V
    .locals 0

    .line 103
    invoke-static {p1}, Lcom/android/camera/fragment/beauty/BeautyParameters;->convert(Lcom/miui/filtersdk/beauty/BeautyParameterType;)Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->mCurrentBeautyItemType:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    .line 104
    return-void
.end method
