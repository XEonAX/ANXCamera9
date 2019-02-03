.class public Lcom/android/camera/data/data/config/SupportedConfigs;
.super Ljava/lang/Object;
.source "SupportedConfigs.java"


# instance fields
.field private mConfigs:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/camera/data/data/config/TopConfigItem;",
            ">;"
        }
    .end annotation
.end field

.field private mSupportedConfigs:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private mSupportedConfigsFilterInvalid:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/camera/data/data/config/SupportedConfigs;->mSupportedConfigs:Ljava/util/List;

    .line 18
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/camera/data/data/config/SupportedConfigs;->mConfigs:Ljava/util/List;

    .line 19
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/camera/data/data/config/SupportedConfigs;->mSupportedConfigsFilterInvalid:Ljava/util/List;

    .line 20
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/android/camera/data/data/config/SupportedConfigs;->mConfigs:Ljava/util/List;

    .line 24
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/android/camera/data/data/config/SupportedConfigs;->mSupportedConfigs:Ljava/util/List;

    .line 25
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/android/camera/data/data/config/SupportedConfigs;->mSupportedConfigsFilterInvalid:Ljava/util/List;

    .line 26
    return-void
.end method


# virtual methods
.method public add(I)Lcom/android/camera/data/data/config/SupportedConfigs;
    .locals 1

    .line 38
    iget-object v0, p0, Lcom/android/camera/data/data/config/SupportedConfigs;->mSupportedConfigs:Ljava/util/List;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 39
    return-object p0
.end method

.method public add(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/camera/data/data/config/TopConfigItem;",
            ">;)V"
        }
    .end annotation

    .line 114
    iget-object v0, p0, Lcom/android/camera/data/data/config/SupportedConfigs;->mConfigs:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 115
    iget-object v0, p0, Lcom/android/camera/data/data/config/SupportedConfigs;->mConfigs:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 116
    return-void
.end method

.method public varargs add([I)V
    .locals 5

    .line 29
    array-length v0, p1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    aget v2, p1, v1

    .line 30
    iget-object v3, p0, Lcom/android/camera/data/data/config/SupportedConfigs;->mSupportedConfigs:Ljava/util/List;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 31
    const/16 v3, 0xc6

    if-eq v2, v3, :cond_0

    .line 32
    iget-object v3, p0, Lcom/android/camera/data/data/config/SupportedConfigs;->mSupportedConfigsFilterInvalid:Ljava/util/List;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 29
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 35
    :cond_1
    return-void
.end method

.method public findConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;
    .locals 3

    .line 95
    iget-object v0, p0, Lcom/android/camera/data/data/config/SupportedConfigs;->mConfigs:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/camera/data/data/config/TopConfigItem;

    .line 96
    iget v2, v1, Lcom/android/camera/data/data/config/TopConfigItem;->configItem:I

    if-ne p1, v2, :cond_0

    .line 97
    return-object v1

    .line 99
    :cond_0
    goto :goto_0

    .line 100
    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method

.method public findConfigPosition(I)I
    .locals 2

    .line 69
    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Lcom/android/camera/data/data/config/SupportedConfigs;->mSupportedConfigs:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 70
    iget-object v1, p0, Lcom/android/camera/data/data/config/SupportedConfigs;->mSupportedConfigs:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 71
    if-ne p1, v1, :cond_0

    .line 72
    return v0

    .line 69
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 76
    :cond_1
    const/4 p1, -0x1

    return p1
.end method

.method public findConfigPositionFromType(I)I
    .locals 2

    .line 84
    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Lcom/android/camera/data/data/config/SupportedConfigs;->mConfigs:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 85
    iget-object v1, p0, Lcom/android/camera/data/data/config/SupportedConfigs;->mConfigs:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/camera/data/data/config/TopConfigItem;

    iget v1, v1, Lcom/android/camera/data/data/config/TopConfigItem;->configItem:I

    .line 86
    if-ne p1, v1, :cond_0

    .line 87
    return v0

    .line 84
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 91
    :cond_1
    const/4 p1, -0x1

    return p1
.end method

.method public getConfig(I)I
    .locals 1

    .line 55
    iget-object v0, p0, Lcom/android/camera/data/data/config/SupportedConfigs;->mSupportedConfigs:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    .line 56
    return p1
.end method

.method public getConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;
    .locals 1

    .line 119
    iget-object v0, p0, Lcom/android/camera/data/data/config/SupportedConfigs;->mConfigs:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/android/camera/data/data/config/TopConfigItem;

    return-object p1
.end method

.method public getConfigTypeForViewPosition(I)I
    .locals 3

    .line 60
    iget-object v0, p0, Lcom/android/camera/data/data/config/SupportedConfigs;->mConfigs:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/camera/data/data/config/TopConfigItem;

    .line 61
    iget v2, v1, Lcom/android/camera/data/data/config/TopConfigItem;->bindViewPosition:I

    if-ne v2, p1, :cond_0

    .line 62
    iget p1, v1, Lcom/android/camera/data/data/config/TopConfigItem;->configItem:I

    return p1

    .line 64
    :cond_0
    goto :goto_0

    .line 65
    :cond_1
    const/16 p1, 0xc6

    return p1
.end method

.method public getConfigsSize()I
    .locals 1

    .line 80
    iget-object v0, p0, Lcom/android/camera/data/data/config/SupportedConfigs;->mConfigs:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public getItemsArray()[Ljava/lang/Integer;
    .locals 2

    .line 48
    invoke-virtual {p0}, Lcom/android/camera/data/data/config/SupportedConfigs;->getLength()I

    move-result v0

    new-array v0, v0, [Ljava/lang/Integer;

    .line 49
    iget-object v1, p0, Lcom/android/camera/data/data/config/SupportedConfigs;->mSupportedConfigs:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 50
    return-object v0
.end method

.method public getLength()I
    .locals 1

    .line 43
    iget-object v0, p0, Lcom/android/camera/data/data/config/SupportedConfigs;->mSupportedConfigs:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public hasConfig(I)Z
    .locals 2

    .line 104
    iget-object v0, p0, Lcom/android/camera/data/data/config/SupportedConfigs;->mSupportedConfigs:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 105
    if-ne v1, p1, :cond_0

    .line 106
    const/4 p1, 0x1

    return p1

    .line 108
    :cond_0
    goto :goto_0

    .line 110
    :cond_1
    const/4 p1, 0x0

    return p1
.end method

.method public isHasConfigItem(I)Z
    .locals 2

    .line 123
    iget-object v0, p0, Lcom/android/camera/data/data/config/SupportedConfigs;->mConfigs:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/camera/data/data/config/TopConfigItem;

    .line 124
    iget v1, v1, Lcom/android/camera/data/data/config/TopConfigItem;->configItem:I

    if-ne v1, p1, :cond_0

    .line 125
    const/4 p1, 0x1

    return p1

    .line 127
    :cond_0
    goto :goto_0

    .line 128
    :cond_1
    const/4 p1, 0x0

    return p1
.end method
