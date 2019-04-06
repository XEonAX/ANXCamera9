.class public Lcom/android/camera/fragment/mimoji/AvatarEngineManager;
.super Ljava/lang/Object;
.source "AvatarEngineManager.java"


# static fields
.field private static mInstance:Lcom/android/camera/fragment/mimoji/AvatarEngineManager;


# instance fields
.field private mASAvatarConfigValue:Lcom/arcsoft/avatar/AvatarConfig$e;

.field private mASAvatarConfigValueTemp:Lcom/arcsoft/avatar/AvatarConfig$e;

.field private mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

.field private mAvatarRef:I

.field private mConfigMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/util/ArrayList<",
            "Lcom/arcsoft/avatar/AvatarConfig$c;",
            ">;>;"
        }
    .end annotation
.end field

.field private mSelectTabIndex:I

.field private mSelectType:I

.field private mTypeList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/arcsoft/avatar/AvatarConfig$d;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mSelectType:I

    iput v0, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mSelectTabIndex:I

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mTypeList:Ljava/util/ArrayList;

    new-instance v1, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v1}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v1, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mConfigMap:Ljava/util/Map;

    iput v0, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mAvatarRef:I

    return-void
.end method

.method public static getInstance()Lcom/android/camera/fragment/mimoji/AvatarEngineManager;
    .locals 1

    sget-object v0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mInstance:Lcom/android/camera/fragment/mimoji/AvatarEngineManager;

    if-nez v0, :cond_0

    new-instance v0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;

    invoke-direct {v0}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;-><init>()V

    sput-object v0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mInstance:Lcom/android/camera/fragment/mimoji/AvatarEngineManager;

    :cond_0
    sget-object v0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mInstance:Lcom/android/camera/fragment/mimoji/AvatarEngineManager;

    return-object v0
.end method


# virtual methods
.method public getASAvatarConfigValue()Lcom/arcsoft/avatar/AvatarConfig$e;
    .locals 1

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mASAvatarConfigValue:Lcom/arcsoft/avatar/AvatarConfig$e;

    return-object v0
.end method

.method public getASAvatarConfigValueTemp()Lcom/arcsoft/avatar/AvatarConfig$e;
    .locals 1

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mASAvatarConfigValueTemp:Lcom/arcsoft/avatar/AvatarConfig$e;

    return-object v0
.end method

.method public getConfigList(I)Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/ArrayList<",
            "Lcom/arcsoft/avatar/AvatarConfig$c;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mConfigMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    if-gtz v0, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mConfigMap:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/ArrayList;

    :goto_0
    return-object p1
.end method

.method public getConfigTypeForIndex(I)Lcom/arcsoft/avatar/AvatarConfig$d;
    .locals 1

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mTypeList:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mTypeList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mTypeList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/arcsoft/avatar/AvatarConfig$d;

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public getConfigTypeList()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/arcsoft/avatar/AvatarConfig$d;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mTypeList:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getSelectConfigList()Ljava/util/ArrayList;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/arcsoft/avatar/AvatarConfig$c;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mConfigMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    if-gtz v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mConfigMap:Ljava/util/Map;

    iget v1, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mSelectType:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    :goto_0
    return-object v0
.end method

.method public getSelectType()I
    .locals 1

    iget v0, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mSelectType:I

    return v0
.end method

.method public getSelectTypeIndex()I
    .locals 1

    iget v0, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mSelectTabIndex:I

    return v0
.end method

.method public putConfigList(ILjava/util/ArrayList;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/ArrayList<",
            "Lcom/arcsoft/avatar/AvatarConfig$c;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mConfigMap:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mConfigMap:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public declared-synchronized queryAvatar()Lcom/arcsoft/avatar/AvatarEngine;
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

    if-nez v0, :cond_0

    new-instance v0, Lcom/arcsoft/avatar/AvatarEngine;

    invoke-direct {v0}, Lcom/arcsoft/avatar/AvatarEngine;-><init>()V

    iput-object v0, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

    :cond_0
    iget v0, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mAvatarRef:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mAvatarRef:I

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mAvatar:Lcom/arcsoft/avatar/AvatarEngine;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized releaseAvatar()V
    .locals 1

    monitor-enter p0

    :try_start_0
    iget v0, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mAvatarRef:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-gtz v0, :cond_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    iget v0, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mAvatarRef:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mAvatarRef:I

    iget v0, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mAvatarRef:I

    if-gtz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

    invoke-virtual {v0}, Lcom/arcsoft/avatar/AvatarEngine;->destroy()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mAvatar:Lcom/arcsoft/avatar/AvatarEngine;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_1
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public setASAvatarConfigValue(Lcom/arcsoft/avatar/AvatarConfig$e;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mASAvatarConfigValue:Lcom/arcsoft/avatar/AvatarConfig$e;

    return-void
.end method

.method public setASAvatarConfigValueTemp(Lcom/arcsoft/avatar/AvatarConfig$e;)V
    .locals 0

    invoke-virtual {p1}, Lcom/arcsoft/avatar/AvatarConfig$e;->clone()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/arcsoft/avatar/AvatarConfig$e;

    iput-object p1, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mASAvatarConfigValueTemp:Lcom/arcsoft/avatar/AvatarConfig$e;

    return-void
.end method

.method public setConfigTypeList(Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/arcsoft/avatar/AvatarConfig$d;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mTypeList:Ljava/util/ArrayList;

    return-void
.end method

.method public setSelectType(I)V
    .locals 0

    iput p1, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mSelectType:I

    return-void
.end method

.method public setSelectTypeIndex(I)V
    .locals 0

    iput p1, p0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->mSelectTabIndex:I

    return-void
.end method
