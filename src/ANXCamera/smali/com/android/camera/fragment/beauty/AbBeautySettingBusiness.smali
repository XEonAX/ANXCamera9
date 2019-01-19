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

    .line 12
    const-class v0, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    invoke-static {}, Lcom/android/camera/CameraSettings;->getBeautifyValueRange()[I

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->mBeautyValueRange:[I

    .line 22
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->mExtraTable:Ljava/util/Map;

    .line 23
    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->initBeauty()V

    .line 24
    return-void
.end method

.method private updateExtraTable()V
    .locals 7

    .line 43
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

    .line 44
    nop

    .line 45
    invoke-static {v1}, Lcom/android/camera/fragment/beauty/BeautyParameters;->getBeautyRatioSettingKey(Lcom/android/camera/fragment/beauty/BeautyParameters$Type;)Ljava/lang/String;

    move-result-object v2

    .line 46
    const-string v3, ""

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    const/4 v4, 0x0

    if-nez v3, :cond_2

    .line 47
    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->getProgressDefValue()I

    move-result v3

    invoke-static {v2, v3}, Lcom/android/camera/CameraSettings;->getFaceBeautyRatio(Ljava/lang/String;I)I

    move-result v3

    .line 48
    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->getProgressDefValue()I

    move-result v5

    if-ne v3, v5, :cond_1

    .line 49
    iget-object v3, p0, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->mBeautyValueRange:[I

    const/4 v5, 0x1

    aget v3, v3, v5

    iget-object v5, p0, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->mBeautyValueRange:[I

    aget v5, v5, v4

    sub-int/2addr v3, v5

    .line 50
    invoke-static {}, Lcom/mi/config/b;->hA()Z

    move-result v5

    if-eqz v5, :cond_0

    if-eqz v3, :cond_0

    .line 51
    invoke-static {v2}, Lcom/android/camera/CameraSettings;->getBeautifyDefaultValue(Ljava/lang/String;)I

    move-result v2

    .line 52
    const/16 v5, 0x64

    iget-object v6, p0, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->mBeautyValueRange:[I

    aget v4, v6, v4

    sub-int v4, v2, v4

    mul-int/2addr v5, v4

    div-int v4, v5, v3

    .line 53
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

    .line 54
    goto :goto_1

    .line 55
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->getProgressDefValue()I

    move-result v4

    goto :goto_1

    .line 59
    :cond_1
    move v4, v3

    :cond_2
    :goto_1
    iget-object v2, p0, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->mExtraTable:Ljava/util/Map;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v2, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 60
    goto :goto_0

    .line 61
    :cond_3
    return-void
.end method

.method private updateParameters()V
    .locals 1

    .line 37
    invoke-static {}, Lcom/android/camera/CameraSettings;->getFaceBeautifyValue()Ljava/lang/String;

    move-result-object v0

    .line 38
    invoke-static {v0}, Lcom/android/camera/CameraSettings;->intelligentValueToBeautyLevel(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->mBeautyLevel:I

    .line 39
    invoke-direct {p0}, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->updateExtraTable()V

    .line 40
    return-void
.end method


# virtual methods
.method public getCurrentBeautyParameterType()Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;
    .locals 1

    .line 115
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->mCurrentBeautyParameterType:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    return-object v0
.end method

.method public getProgress()I
    .locals 2

    .line 82
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->mExtraTable:Ljava/util/Map;

    iget-object v1, p0, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->mCurrentBeautyItemType:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_0

    .line 83
    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->getProgressDefValue()I

    move-result v0

    return v0

    .line 85
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

.method protected getProgressDefValue()I
    .locals 1

    .line 119
    const/4 v0, 0x0

    return v0
.end method

.method public initBeauty()V
    .locals 2

    .line 32
    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->getTypeArray()Ljava/util/List;

    move-result-object v0

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    iput-object v0, p0, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->mCurrentBeautyItemType:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    .line 33
    invoke-direct {p0}, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->updateParameters()V

    .line 34
    return-void
.end method

.method public operate(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 28
    const/4 p1, 0x0

    return-object p1
.end method

.method public resetBeauty()V
    .locals 4

    .line 90
    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->getTypeArray()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    .line 91
    invoke-static {v1}, Lcom/android/camera/fragment/beauty/BeautyParameters;->getBeautyRatioSettingKey(Lcom/android/camera/fragment/beauty/BeautyParameters$Type;)Ljava/lang/String;

    move-result-object v2

    .line 92
    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->getProgressDefValue()I

    move-result v3

    invoke-static {v2, v3}, Lcom/android/camera/CameraSettings;->setFaceBeautyRatio(Ljava/lang/String;I)V

    .line 93
    iget-object v2, p0, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->mExtraTable:Ljava/util/Map;

    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->getProgressDefValue()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v2, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 94
    goto :goto_0

    .line 95
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->getProgressDefValue()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->setProgress(I)V

    .line 96
    return-void
.end method

.method public setCurrentBeautyParameterType(Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;)V
    .locals 0

    .line 110
    iput-object p1, p0, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->mCurrentBeautyParameterType:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    .line 111
    return-void
.end method

.method public setProgress(I)V
    .locals 4

    .line 66
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->mExtraTable:Ljava/util/Map;

    iget-object v1, p0, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->mCurrentBeautyItemType:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_0

    .line 67
    const/4 v0, 0x0

    goto :goto_0

    .line 69
    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->mExtraTable:Ljava/util/Map;

    iget-object v1, p0, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->mCurrentBeautyItemType:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 71
    :goto_0
    iget-object v1, p0, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->mExtraTable:Ljava/util/Map;

    iget-object v2, p0, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->mCurrentBeautyItemType:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 72
    if-ne v0, p1, :cond_1

    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->getProgressDefValue()I

    move-result v0

    if-ne p1, v0, :cond_2

    .line 73
    :cond_1
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->mCurrentBeautyItemType:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    invoke-static {v0}, Lcom/android/camera/fragment/beauty/BeautyParameters;->getBeautyRatioSettingKey(Lcom/android/camera/fragment/beauty/BeautyParameters$Type;)Ljava/lang/String;

    move-result-object v0

    .line 74
    invoke-static {v0, p1}, Lcom/android/camera/CameraSettings;->setFaceBeautyRatio(Ljava/lang/String;I)V

    .line 75
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

    .line 76
    invoke-static {}, Lcom/android/camera/fragment/beauty/BeautyHelper;->onBeautyChanged()V

    .line 78
    :cond_2
    return-void
.end method

.method public setType(Lcom/android/camera/fragment/beauty/BeautyParameters$Type;)V
    .locals 0

    .line 105
    iput-object p1, p0, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->mCurrentBeautyItemType:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    .line 106
    return-void
.end method

.method public setType(Lcom/miui/filtersdk/beauty/BeautyParameterType;)V
    .locals 0

    .line 100
    invoke-static {p1}, Lcom/android/camera/fragment/beauty/BeautyParameters;->convert(Lcom/miui/filtersdk/beauty/BeautyParameterType;)Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->mCurrentBeautyItemType:Lcom/android/camera/fragment/beauty/BeautyParameters$Type;

    .line 101
    return-void
.end method
