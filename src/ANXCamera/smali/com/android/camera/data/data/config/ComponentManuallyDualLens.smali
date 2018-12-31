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

    .line 24
    invoke-direct {p0, p1}, Lcom/android/camera/data/data/ComponentData;-><init>(Lcom/android/camera/data/data/DataItemBase;)V

    .line 25
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

    .line 62
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 63
    new-instance v1, Lcom/android/camera/data/data/ComponentDataItem;

    const-string v2, "wide"

    const/4 v3, -0x1

    const v4, 0x7f0b0198

    invoke-direct {v1, v3, v3, v4, v2}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 68
    new-instance v1, Lcom/android/camera/data/data/ComponentDataItem;

    const-string v2, "tele"

    const v4, 0x7f0b0199

    invoke-direct {v1, v3, v3, v4, v2}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 73
    invoke-static {}, Lcom/mi/config/b;->fw()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 74
    new-instance v1, Lcom/android/camera/data/data/ComponentDataItem;

    const v2, 0x7f0b023e

    const-string v4, "ultra"

    invoke-direct {v1, v3, v3, v2, v4}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 80
    :cond_0
    return-object v0
.end method

.method public static next(Ljava/lang/String;I)Ljava/lang/String;
    .locals 1

    .line 85
    const-string v0, "wide"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 86
    const-string p0, "tele"

    return-object p0

    .line 89
    :cond_0
    invoke-static {}, Lcom/mi/config/b;->fw()Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "tele"

    .line 90
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_1

    const/16 p0, 0xa7

    if-ne p1, p0, :cond_1

    .line 92
    const-string p0, "ultra"

    return-object p0

    .line 95
    :cond_1
    const-string p0, "wide"

    return-object p0
.end method


# virtual methods
.method public getDefaultValue(I)Ljava/lang/String;
    .locals 0

    .line 48
    const-string p1, "wide"

    return-object p1
.end method

.method public getDisplayTitleString()I
    .locals 1

    .line 29
    const v0, 0x7f0b0197

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

    .line 54
    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentManuallyDualLens;->mItems:Ljava/util/List;

    if-nez v0, :cond_0

    .line 55
    invoke-direct {p0}, Lcom/android/camera/data/data/config/ComponentManuallyDualLens;->initItems()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/data/data/config/ComponentManuallyDualLens;->mItems:Ljava/util/List;

    .line 58
    :cond_0
    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentManuallyDualLens;->mItems:Ljava/util/List;

    return-object v0
.end method

.method public getKey(I)Ljava/lang/String;
    .locals 1

    .line 34
    const/16 v0, 0xa7

    if-eq p1, v0, :cond_0

    .line 37
    const-string p1, "pref_camera_zoom_mode_key"

    return-object p1

    .line 41
    :cond_0
    const-string p1, "pref_camera_manually_lens"

    return-object p1
.end method
