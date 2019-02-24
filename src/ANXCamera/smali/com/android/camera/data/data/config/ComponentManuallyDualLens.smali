.class public Lcom/android/camera/data/data/config/ComponentManuallyDualLens;
.super Lcom/android/camera/data/data/ComponentData;
.source "ComponentManuallyDualLens.java"


# static fields
.field public static final LENS_TELE:Ljava/lang/String; = "tele"

.field public static final LENS_ULTRA:Ljava/lang/String; = "ultra"

.field public static final LENS_WIDE:Ljava/lang/String; = "wide"


# direct methods
.method public constructor <init>(Lcom/android/camera/data/data/config/DataItemConfig;)V
    .locals 0

    .line 25
    invoke-direct {p0, p1}, Lcom/android/camera/data/data/ComponentData;-><init>(Lcom/android/camera/data/data/DataItemBase;)V

    .line 26
    return-void
.end method

.method private initItems()Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/android/camera/data/data/ComponentDataItem;",
            ">;"
        }
    .end annotation

    .line 63
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 64
    new-instance v1, Lcom/android/camera/data/data/ComponentDataItem;

    const-string v2, "wide"

    const/4 v3, -0x1

    const v4, 0x7f090198

    invoke-direct {v1, v3, v3, v4, v2}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 69
    new-instance v1, Lcom/android/camera/data/data/ComponentDataItem;

    const-string v2, "tele"

    const v4, 0x7f090199

    invoke-direct {v1, v3, v3, v4, v2}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 74
    invoke-static {}, Lcom/mi/config/b;->isSupportUltraWide()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 75
    new-instance v1, Lcom/android/camera/data/data/ComponentDataItem;

    const v2, 0x7f090242

    const-string v4, "ultra"

    invoke-direct {v1, v3, v3, v2, v4}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 81
    :cond_0
    return-object v0
.end method

.method public static next(Ljava/lang/String;I)Ljava/lang/String;
    .locals 1

    .line 86
    const-string v0, "wide"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 87
    const-string p0, "tele"

    return-object p0

    .line 90
    :cond_0
    invoke-static {}, Lcom/mi/config/b;->isSupportUltraWide()Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "tele"

    .line 91
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_1

    const/16 p0, 0xa7

    if-ne p1, p0, :cond_1

    .line 93
    const-string p0, "ultra"

    return-object p0

    .line 96
    :cond_1
    const-string p0, "wide"

    return-object p0
.end method


# virtual methods
.method public getDefaultValue(I)Ljava/lang/String;
    .locals 0

    .line 49
    const-string p1, "wide"

    return-object p1
.end method

.method public getDisplayTitleString()I
    .locals 1

    .line 30
    const v0, 0x7f090197

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

    .line 55
    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentManuallyDualLens;->mItems:Ljava/util/List;

    if-nez v0, :cond_0

    .line 56
    invoke-direct {p0}, Lcom/android/camera/data/data/config/ComponentManuallyDualLens;->initItems()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/data/data/config/ComponentManuallyDualLens;->mItems:Ljava/util/List;

    .line 59
    :cond_0
    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentManuallyDualLens;->mItems:Ljava/util/List;

    return-object v0
.end method

.method public getKey(I)Ljava/lang/String;
    .locals 1

    .line 35
    const/16 v0, 0xa7

    if-eq p1, v0, :cond_0

    .line 38
    const-string p1, "pref_camera_zoom_mode_key"

    return-object p1

    .line 42
    :cond_0
    const-string p1, "pref_camera_manually_lens"

    return-object p1
.end method

.method public resetLensType(Lcom/android/camera/data/data/config/ComponentConfigUltraWide;Lcom/android/camera/data/provider/DataProvider$ProviderEditor;)V
    .locals 4

    .line 105
    const/16 v0, 0xa7

    invoke-virtual {p0, v0}, Lcom/android/camera/data/data/config/ComponentManuallyDualLens;->getComponentValue(I)Ljava/lang/String;

    move-result-object v1

    .line 106
    const-string v2, "wide"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 107
    invoke-virtual {p0, v0}, Lcom/android/camera/data/data/config/ComponentManuallyDualLens;->getKey(I)Ljava/lang/String;

    move-result-object v2

    const-string v3, "wide"

    invoke-interface {p2, v2, v3}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putString(Ljava/lang/String;Ljava/lang/String;)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    .line 108
    const-string v2, "ultra"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 109
    invoke-virtual {p1, v0}, Lcom/android/camera/data/data/config/ComponentConfigUltraWide;->getKey(I)Ljava/lang/String;

    move-result-object p1

    const-string v0, "OFF"

    invoke-interface {p2, p1, v0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putString(Ljava/lang/String;Ljava/lang/String;)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    .line 113
    :cond_0
    return-void
.end method
