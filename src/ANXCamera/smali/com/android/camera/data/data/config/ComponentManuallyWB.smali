.class public Lcom/android/camera/data/data/config/ComponentManuallyWB;
.super Lcom/android/camera/data/data/ComponentData;
.source "ComponentManuallyWB.java"


# static fields
.field public static final MANUAL_WHITEBALANCE_VALUE:Ljava/lang/String; = "pref_qc_manual_whitebalance_k_value_key"


# direct methods
.method public constructor <init>(Lcom/android/camera/data/data/config/DataItemConfig;)V
    .locals 0

    .line 28
    invoke-direct {p0, p1}, Lcom/android/camera/data/data/ComponentData;-><init>(Lcom/android/camera/data/data/DataItemBase;)V

    .line 29
    return-void
.end method

.method private initItems()Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/android/camera/data/data/ComponentDataItem;",
            ">;"
        }
    .end annotation

    .line 72
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 74
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 75
    new-instance v1, Lcom/android/camera/data/data/ComponentDataItem;

    const-string v2, "1"

    const/4 v3, -0x1

    const v4, 0x7f090066

    invoke-direct {v1, v3, v3, v4, v2}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 80
    new-instance v1, Lcom/android/camera/data/data/ComponentDataItem;

    const-string v2, "2"

    const/4 v3, -0x2

    const v4, 0x7f020014

    const v5, 0x7f02016a

    invoke-direct {v1, v4, v5, v3, v2}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 85
    new-instance v1, Lcom/android/camera/data/data/ComponentDataItem;

    const-string v2, "5"

    const v4, 0x7f020016

    const v5, 0x7f020170

    invoke-direct {v1, v4, v5, v3, v2}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 90
    new-instance v1, Lcom/android/camera/data/data/ComponentDataItem;

    const-string v2, "3"

    const v4, 0x7f020013

    const v5, 0x7f020167

    invoke-direct {v1, v4, v5, v3, v2}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 95
    new-instance v1, Lcom/android/camera/data/data/ComponentDataItem;

    const-string v2, "6"

    const v4, 0x7f020012

    const v5, 0x7f020164

    invoke-direct {v1, v4, v5, v3, v2}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 101
    invoke-static {}, Lcom/mi/config/b;->gJ()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mi/config/a;->fy()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 102
    new-instance v1, Lcom/android/camera/data/data/ComponentDataItem;

    const v2, 0x7f020015

    const v4, 0x7f02016d

    const-string v5, "manual"

    invoke-direct {v1, v2, v4, v3, v5}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 107
    :cond_0
    return-object v0
.end method


# virtual methods
.method protected checkValueValid(Ljava/lang/String;)Z
    .locals 2

    .line 48
    invoke-virtual {p0}, Lcom/android/camera/data/data/config/ComponentManuallyWB;->getItems()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/camera/data/data/ComponentDataItem;

    .line 49
    iget-object v1, v1, Lcom/android/camera/data/data/ComponentDataItem;->mValue:Ljava/lang/String;

    invoke-static {p1, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 50
    const/4 p1, 0x1

    return p1

    .line 52
    :cond_0
    goto :goto_0

    .line 54
    :cond_1
    const/4 p1, 0x0

    return p1
.end method

.method public getCustomWB()I
    .locals 3

    .line 118
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f10000a

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v0

    .line 120
    iget-object v1, p0, Lcom/android/camera/data/data/config/ComponentManuallyWB;->mParentDataItem:Lcom/android/camera/data/data/DataItemBase;

    const-string v2, "pref_qc_manual_whitebalance_k_value_key"

    invoke-virtual {v1, v2, v0}, Lcom/android/camera/data/data/DataItemBase;->getInt(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public getDefaultValue(I)Ljava/lang/String;
    .locals 0

    .line 43
    const-string p1, "1"

    return-object p1
.end method

.method public getDisplayTitleString()I
    .locals 1

    .line 33
    const v0, 0x7f090065

    return v0
.end method

.method public getItems()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/android/camera/data/data/ComponentDataItem;",
            ">;"
        }
    .end annotation

    .line 64
    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentManuallyWB;->mItems:Ljava/util/List;

    if-nez v0, :cond_0

    .line 65
    invoke-direct {p0}, Lcom/android/camera/data/data/config/ComponentManuallyWB;->initItems()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/data/data/config/ComponentManuallyWB;->mItems:Ljava/util/List;

    .line 67
    :cond_0
    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentManuallyWB;->mItems:Ljava/util/List;

    return-object v0
.end method

.method public getKey(I)Ljava/lang/String;
    .locals 0

    .line 38
    const-string p1, "pref_camera_whitebalance_key"

    return-object p1
.end method

.method protected resetComponentValue(I)V
    .locals 1

    .line 59
    invoke-virtual {p0, p1}, Lcom/android/camera/data/data/config/ComponentManuallyWB;->getDefaultValue(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/android/camera/data/data/config/ComponentManuallyWB;->setComponentValue(ILjava/lang/String;)V

    .line 60
    return-void
.end method

.method public setCustomWB(I)V
    .locals 2

    .line 111
    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentManuallyWB;->mParentDataItem:Lcom/android/camera/data/data/DataItemBase;

    invoke-virtual {v0}, Lcom/android/camera/data/data/DataItemBase;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    const-string v1, "pref_qc_manual_whitebalance_k_value_key"

    invoke-interface {v0, v1, p1}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putInt(Ljava/lang/String;I)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object p1

    invoke-interface {p1}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 112
    return-void
.end method
