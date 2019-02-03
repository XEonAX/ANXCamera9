.class final Lcom/android/camera/data/provider/DataProviderMgr$DataProviderImpl;
.super Ljava/lang/Object;
.source "DataProviderMgr.java"

# interfaces
.implements Lcom/android/camera/data/provider/DataProvider;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/data/provider/DataProviderMgr;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "DataProviderImpl"
.end annotation


# instance fields
.field private mDataCloudManager:Lcom/android/camera/data/cloud/DataCloud$CloudManager;

.field private mDataGlobal:Lcom/android/camera/data/data/global/DataItemGlobal;

.field private mDataItemConfigs:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Lcom/android/camera/data/data/config/DataItemConfig;",
            ">;"
        }
    .end annotation
.end field

.field private mDataItemFeature:Lcom/mi/config/a;

.field private mDataItemLive:Lcom/android/camera/data/data/extra/DataItemLive;

.field private mDataRunning:Lcom/android/camera/data/data/runing/DataItemRunning;

.field final synthetic this$0:Lcom/android/camera/data/provider/DataProviderMgr;


# direct methods
.method public constructor <init>(Lcom/android/camera/data/provider/DataProviderMgr;Lcom/android/camera/data/cloud/DataCloud$CloudManager;)V
    .locals 0

    .line 32
    iput-object p1, p0, Lcom/android/camera/data/provider/DataProviderMgr$DataProviderImpl;->this$0:Lcom/android/camera/data/provider/DataProviderMgr;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    iput-object p2, p0, Lcom/android/camera/data/provider/DataProviderMgr$DataProviderImpl;->mDataCloudManager:Lcom/android/camera/data/cloud/DataCloud$CloudManager;

    .line 35
    new-instance p1, Lcom/android/camera/data/data/global/DataItemGlobal;

    invoke-direct {p1}, Lcom/android/camera/data/data/global/DataItemGlobal;-><init>()V

    iput-object p1, p0, Lcom/android/camera/data/provider/DataProviderMgr$DataProviderImpl;->mDataGlobal:Lcom/android/camera/data/data/global/DataItemGlobal;

    .line 36
    iget-object p1, p0, Lcom/android/camera/data/provider/DataProviderMgr$DataProviderImpl;->mDataGlobal:Lcom/android/camera/data/data/global/DataItemGlobal;

    invoke-interface {p2}, Lcom/android/camera/data/cloud/DataCloud$CloudManager;->provideDataCloudGlobal()Lcom/android/camera/data/cloud/DataCloud$CloudItem;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/android/camera/data/data/global/DataItemGlobal;->injectCloud(Lcom/android/camera/data/cloud/DataCloud$CloudItem;)V

    .line 37
    new-instance p1, Landroid/util/SparseArray;

    const/4 p2, 0x4

    invoke-direct {p1, p2}, Landroid/util/SparseArray;-><init>(I)V

    iput-object p1, p0, Lcom/android/camera/data/provider/DataProviderMgr$DataProviderImpl;->mDataItemConfigs:Landroid/util/SparseArray;

    .line 38
    new-instance p1, Lcom/android/camera/data/data/runing/DataItemRunning;

    invoke-direct {p1}, Lcom/android/camera/data/data/runing/DataItemRunning;-><init>()V

    iput-object p1, p0, Lcom/android/camera/data/provider/DataProviderMgr$DataProviderImpl;->mDataRunning:Lcom/android/camera/data/data/runing/DataItemRunning;

    .line 39
    new-instance p1, Lcom/mi/config/a;

    invoke-direct {p1}, Lcom/mi/config/a;-><init>()V

    iput-object p1, p0, Lcom/android/camera/data/provider/DataProviderMgr$DataProviderImpl;->mDataItemFeature:Lcom/mi/config/a;

    .line 40
    return-void
.end method


# virtual methods
.method public dataConfig()Lcom/android/camera/data/data/config/DataItemConfig;
    .locals 2

    .line 61
    invoke-virtual {p0}, Lcom/android/camera/data/provider/DataProviderMgr$DataProviderImpl;->dataGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentCameraId()I

    move-result v0

    invoke-virtual {p0}, Lcom/android/camera/data/provider/DataProviderMgr$DataProviderImpl;->dataGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/data/data/global/DataItemGlobal;->getIntentType()I

    move-result v1

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/data/provider/DataProviderMgr$DataProviderImpl;->dataConfig(II)Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    return-object v0
.end method

.method public dataConfig(I)Lcom/android/camera/data/data/config/DataItemConfig;
    .locals 1

    .line 76
    invoke-virtual {p0}, Lcom/android/camera/data/provider/DataProviderMgr$DataProviderImpl;->dataGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getIntentType()I

    move-result v0

    invoke-virtual {p0, p1, v0}, Lcom/android/camera/data/provider/DataProviderMgr$DataProviderImpl;->dataConfig(II)Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object p1

    return-object p1
.end method

.method public dataConfig(II)Lcom/android/camera/data/data/config/DataItemConfig;
    .locals 2

    .line 44
    invoke-static {p1, p2}, Lcom/android/camera/data/data/config/DataItemConfig;->provideLocalId(II)I

    move-result v0

    .line 45
    iget-object v1, p0, Lcom/android/camera/data/provider/DataProviderMgr$DataProviderImpl;->mDataItemConfigs:Landroid/util/SparseArray;

    invoke-virtual {v1, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/camera/data/data/config/DataItemConfig;

    .line 46
    if-nez v1, :cond_0

    .line 47
    new-instance v1, Lcom/android/camera/data/data/config/DataItemConfig;

    invoke-direct {v1, p1, p2}, Lcom/android/camera/data/data/config/DataItemConfig;-><init>(II)V

    .line 48
    iget-object p2, p0, Lcom/android/camera/data/provider/DataProviderMgr$DataProviderImpl;->mDataCloudManager:Lcom/android/camera/data/cloud/DataCloud$CloudManager;

    invoke-interface {p2, p1}, Lcom/android/camera/data/cloud/DataCloud$CloudManager;->provideDataCloudConfig(I)Lcom/android/camera/data/cloud/DataCloud$CloudItem;

    move-result-object p1

    invoke-virtual {v1, p1}, Lcom/android/camera/data/data/config/DataItemConfig;->injectCloud(Lcom/android/camera/data/cloud/DataCloud$CloudItem;)V

    .line 49
    iget-object p1, p0, Lcom/android/camera/data/provider/DataProviderMgr$DataProviderImpl;->mDataItemConfigs:Landroid/util/SparseArray;

    invoke-virtual {p1, v0, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 51
    :cond_0
    return-object v1
.end method

.method public bridge synthetic dataConfig()Lcom/android/camera/data/provider/DataProvider$ProviderEvent;
    .locals 1

    .line 23
    invoke-virtual {p0}, Lcom/android/camera/data/provider/DataProviderMgr$DataProviderImpl;->dataConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic dataConfig(I)Lcom/android/camera/data/provider/DataProvider$ProviderEvent;
    .locals 0

    .line 23
    invoke-virtual {p0, p1}, Lcom/android/camera/data/provider/DataProviderMgr$DataProviderImpl;->dataConfig(I)Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic dataConfig(II)Lcom/android/camera/data/provider/DataProvider$ProviderEvent;
    .locals 0

    .line 23
    invoke-virtual {p0, p1, p2}, Lcom/android/camera/data/provider/DataProviderMgr$DataProviderImpl;->dataConfig(II)Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic dataFeature()Lcom/android/camera/data/provider/DataProvider$ProviderEvent;
    .locals 1

    .line 23
    invoke-virtual {p0}, Lcom/android/camera/data/provider/DataProviderMgr$DataProviderImpl;->dataFeature()Lcom/mi/config/a;

    move-result-object v0

    return-object v0
.end method

.method public dataFeature()Lcom/mi/config/a;
    .locals 1

    .line 80
    iget-object v0, p0, Lcom/android/camera/data/provider/DataProviderMgr$DataProviderImpl;->mDataItemFeature:Lcom/mi/config/a;

    return-object v0
.end method

.method public dataGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;
    .locals 1

    .line 56
    iget-object v0, p0, Lcom/android/camera/data/provider/DataProviderMgr$DataProviderImpl;->mDataGlobal:Lcom/android/camera/data/data/global/DataItemGlobal;

    return-object v0
.end method

.method public bridge synthetic dataGlobal()Lcom/android/camera/data/provider/DataProvider$ProviderEvent;
    .locals 1

    .line 23
    invoke-virtual {p0}, Lcom/android/camera/data/provider/DataProviderMgr$DataProviderImpl;->dataGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    return-object v0
.end method

.method public dataLive()Lcom/android/camera/data/data/extra/DataItemLive;
    .locals 1

    .line 86
    iget-object v0, p0, Lcom/android/camera/data/provider/DataProviderMgr$DataProviderImpl;->mDataItemLive:Lcom/android/camera/data/data/extra/DataItemLive;

    if-nez v0, :cond_0

    .line 87
    new-instance v0, Lcom/android/camera/data/data/extra/DataItemLive;

    invoke-direct {v0}, Lcom/android/camera/data/data/extra/DataItemLive;-><init>()V

    iput-object v0, p0, Lcom/android/camera/data/provider/DataProviderMgr$DataProviderImpl;->mDataItemLive:Lcom/android/camera/data/data/extra/DataItemLive;

    .line 89
    :cond_0
    iget-object v0, p0, Lcom/android/camera/data/provider/DataProviderMgr$DataProviderImpl;->mDataItemLive:Lcom/android/camera/data/data/extra/DataItemLive;

    return-object v0
.end method

.method public bridge synthetic dataLive()Lcom/android/camera/data/provider/DataProvider$ProviderEvent;
    .locals 1

    .line 23
    invoke-virtual {p0}, Lcom/android/camera/data/provider/DataProviderMgr$DataProviderImpl;->dataLive()Lcom/android/camera/data/data/extra/DataItemLive;

    move-result-object v0

    return-object v0
.end method

.method public dataNormalConfig()Lcom/android/camera/data/data/config/DataItemConfig;
    .locals 2

    .line 66
    invoke-virtual {p0}, Lcom/android/camera/data/provider/DataProviderMgr$DataProviderImpl;->dataGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentCameraId()I

    move-result v0

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/data/provider/DataProviderMgr$DataProviderImpl;->dataConfig(II)Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic dataNormalConfig()Lcom/android/camera/data/provider/DataProvider$ProviderEvent;
    .locals 1

    .line 23
    invoke-virtual {p0}, Lcom/android/camera/data/provider/DataProviderMgr$DataProviderImpl;->dataNormalConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    return-object v0
.end method

.method public dataRunning()Lcom/android/camera/data/data/runing/DataItemRunning;
    .locals 1

    .line 71
    iget-object v0, p0, Lcom/android/camera/data/provider/DataProviderMgr$DataProviderImpl;->mDataRunning:Lcom/android/camera/data/data/runing/DataItemRunning;

    return-object v0
.end method

.method public bridge synthetic dataRunning()Lcom/android/camera/data/provider/DataProvider$ProviderEvent;
    .locals 1

    .line 23
    invoke-virtual {p0}, Lcom/android/camera/data/provider/DataProviderMgr$DataProviderImpl;->dataRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    return-object v0
.end method
