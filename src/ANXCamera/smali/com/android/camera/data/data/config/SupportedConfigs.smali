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


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/camera/data/data/config/SupportedConfigs;->mSupportedConfigs:Ljava/util/List;

    .line 17
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/camera/data/data/config/SupportedConfigs;->mConfigs:Ljava/util/List;

    .line 18
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/android/camera/data/data/config/SupportedConfigs;->mConfigs:Ljava/util/List;

    .line 22
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/android/camera/data/data/config/SupportedConfigs;->mSupportedConfigs:Ljava/util/List;

    .line 23
    return-void
.end method


# virtual methods
.method public add(I)Lcom/android/camera/data/data/config/SupportedConfigs;
    .locals 1

    .line 32
    iget-object v0, p0, Lcom/android/camera/data/data/config/SupportedConfigs;->mSupportedConfigs:Ljava/util/List;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 33
    return-object p0
.end method

.method public add(Lcom/android/camera/data/data/config/TopConfigItem;)V
    .locals 2

    .line 120
    iget-object v0, p0, Lcom/android/camera/data/data/config/SupportedConfigs;->mSupportedConfigs:Ljava/util/List;

    iget v1, p1, Lcom/android/camera/data/data/config/TopConfigItem;->configItem:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 121
    iget-object v0, p0, Lcom/android/camera/data/data/config/SupportedConfigs;->mConfigs:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 122
    return-void
.end method

.method public varargs add([I)V
    .locals 4

    .line 26
    array-length v0, p1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    aget v2, p1, v1

    .line 27
    iget-object v3, p0, Lcom/android/camera/data/data/config/SupportedConfigs;->mSupportedConfigs:Ljava/util/List;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 26
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 29
    :cond_0
    return-void
.end method

.method public getConfig(I)I
    .locals 1

    .line 43
    iget-object v0, p0, Lcom/android/camera/data/data/config/SupportedConfigs;->mSupportedConfigs:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    .line 44
    return p1
.end method

.method public getConfigItem(I)Lcom/android/camera/data/data/config/TopConfigItem;
    .locals 1

    .line 130
    iget-object v0, p0, Lcom/android/camera/data/data/config/SupportedConfigs;->mConfigs:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/android/camera/data/data/config/TopConfigItem;

    return-object p1
.end method

.method public getConfigsSize()I
    .locals 2

    .line 53
    iget-object v0, p0, Lcom/android/camera/data/data/config/SupportedConfigs;->mConfigs:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 54
    const/4 v0, 0x0

    return v0

    .line 56
    :cond_0
    iget-object v0, p0, Lcom/android/camera/data/data/config/SupportedConfigs;->mConfigs:Ljava/util/List;

    iget-object v1, p0, Lcom/android/camera/data/data/config/SupportedConfigs;->mConfigs:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera/data/data/config/TopConfigItem;

    iget v0, v0, Lcom/android/camera/data/data/config/TopConfigItem;->index:I

    add-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public getLength()I
    .locals 1

    .line 37
    iget-object v0, p0, Lcom/android/camera/data/data/config/SupportedConfigs;->mSupportedConfigs:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public set(ILcom/android/camera/data/data/config/TopConfigItem;)V
    .locals 2

    .line 125
    iget-object v0, p0, Lcom/android/camera/data/data/config/SupportedConfigs;->mSupportedConfigs:Ljava/util/List;

    iget v1, p2, Lcom/android/camera/data/data/config/TopConfigItem;->configItem:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, p1, v1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 126
    iget-object v0, p0, Lcom/android/camera/data/data/config/SupportedConfigs;->mConfigs:Ljava/util/List;

    invoke-interface {v0, p1, p2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 127
    return-void
.end method
