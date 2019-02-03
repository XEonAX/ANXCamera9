.class public Lcom/android/camera/data/data/config/ComponentManuallyFocus;
.super Lcom/android/camera/data/data/ComponentData;
.source "ComponentManuallyFocus.java"


# direct methods
.method public constructor <init>(Lcom/android/camera/data/data/config/DataItemConfig;)V
    .locals 0

    .line 22
    invoke-direct {p0, p1}, Lcom/android/camera/data/data/ComponentData;-><init>(Lcom/android/camera/data/data/DataItemBase;)V

    .line 23
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

    .line 49
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 51
    new-instance v1, Lcom/android/camera/data/data/ComponentDataItem;

    const-string v2, "1000"

    const v3, 0x7f090054

    const/4 v4, -0x1

    invoke-direct {v1, v4, v4, v3, v2}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 54
    new-instance v1, Lcom/android/camera/data/data/ComponentDataItem;

    const-string v2, "manual"

    invoke-direct {v1, v4, v4, v3, v2}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 57
    return-object v0
.end method


# virtual methods
.method public getDefaultValue(I)Ljava/lang/String;
    .locals 0

    .line 37
    const-string p1, "1000"

    return-object p1
.end method

.method public getDisplayTitleString()I
    .locals 1

    .line 27
    const v0, 0x7f090165

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

    .line 42
    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentManuallyFocus;->mItems:Ljava/util/List;

    if-nez v0, :cond_0

    .line 43
    invoke-direct {p0}, Lcom/android/camera/data/data/config/ComponentManuallyFocus;->initItems()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/data/data/config/ComponentManuallyFocus;->mItems:Ljava/util/List;

    .line 45
    :cond_0
    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentManuallyFocus;->mItems:Ljava/util/List;

    return-object v0
.end method

.method public getKey(I)Ljava/lang/String;
    .locals 0

    .line 32
    const-string p1, "pref_focus_position_key"

    return-object p1
.end method

.method public getValueDisplayString(I)I
    .locals 1
    .annotation build Landroid/support/annotation/StringRes;
    .end annotation

    .line 63
    invoke-virtual {p0, p1}, Lcom/android/camera/data/data/config/ComponentManuallyFocus;->getComponentValue(I)Ljava/lang/String;

    move-result-object p1

    .line 64
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    .line 66
    const/16 v0, 0x3e8

    if-ne p1, v0, :cond_0

    .line 67
    const p1, 0x7f090054

    return p1

    .line 69
    :cond_0
    const/4 p1, -0x2

    return p1
.end method

.method public getValueSelectedDrawable(I)I
    .locals 4
    .annotation build Landroid/support/annotation/DrawableRes;
    .end annotation

    .line 75
    invoke-virtual {p0, p1}, Lcom/android/camera/data/data/config/ComponentManuallyFocus;->getComponentValue(I)Ljava/lang/String;

    move-result-object p1

    .line 76
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    .line 78
    const/16 v0, 0x3e8

    if-ne p1, v0, :cond_0

    .line 79
    const/4 p1, -0x1

    return p1

    .line 80
    :cond_0
    int-to-double v0, p1

    const-wide v2, 0x4082c00000000000L    # 600.0

    cmpl-double p1, v0, v2

    if-ltz p1, :cond_1

    .line 81
    const p1, 0x7f0200f4

    return p1

    .line 82
    :cond_1
    const-wide/high16 v2, 0x4069000000000000L    # 200.0

    cmpl-double p1, v0, v2

    if-ltz p1, :cond_2

    .line 83
    const p1, 0x7f0200f5

    return p1

    .line 85
    :cond_2
    const p1, 0x7f0200f3

    return p1
.end method
