.class public Lcom/android/camera/db/item/DbItemSaveTask;
.super Lcom/android/camera/db/item/DbItemBase;
.source "DbItemSaveTask.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/android/camera/db/item/DbItemBase<",
        "Lcom/android/camera/db/element/SaveTask;",
        "Ljava/lang/Long;",
        ">;"
    }
.end annotation


# static fields
.field private static final PROCESS_MAX_TIME_OUT:I = 0x2710


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 21
    invoke-direct {p0}, Lcom/android/camera/db/item/DbItemBase;-><init>()V

    return-void
.end method


# virtual methods
.method protected createItem(J)Lcom/android/camera/db/element/SaveTask;
    .locals 2

    .line 28
    iget-object v0, p0, Lcom/android/camera/db/item/DbItemSaveTask;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 29
    :try_start_0
    new-instance v1, Lcom/android/camera/db/element/SaveTask;

    invoke-direct {v1}, Lcom/android/camera/db/element/SaveTask;-><init>()V

    .line 30
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-virtual {v1, p1}, Lcom/android/camera/db/element/SaveTask;->setStartTime(Ljava/lang/Long;)V

    .line 31
    monitor-exit v0

    return-object v1

    .line 32
    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method protected bridge synthetic createItem(J)Ljava/lang/Object;
    .locals 0

    .line 21
    invoke-virtual {p0, p1, p2}, Lcom/android/camera/db/item/DbItemSaveTask;->createItem(J)Lcom/android/camera/db/element/SaveTask;

    move-result-object p1

    return-object p1
.end method

.method protected endItem(Lcom/android/camera/db/element/SaveTask;J)Lcom/android/camera/db/element/SaveTask;
    .locals 0

    .line 37
    return-object p1
.end method

.method protected bridge synthetic endItem(Ljava/lang/Object;J)Ljava/lang/Object;
    .locals 0

    .line 21
    check-cast p1, Lcom/android/camera/db/element/SaveTask;

    invoke-virtual {p0, p1, p2, p3}, Lcom/android/camera/db/item/DbItemSaveTask;->endItem(Lcom/android/camera/db/element/SaveTask;J)Lcom/android/camera/db/element/SaveTask;

    move-result-object p1

    return-object p1
.end method

.method protected getDao()Lorg/greenrobot/greendao/AbstractDao;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lorg/greenrobot/greendao/AbstractDao<",
            "Lcom/android/camera/db/element/SaveTask;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .line 47
    invoke-virtual {p0}, Lcom/android/camera/db/item/DbItemSaveTask;->getDaoSession()Lcom/android/camera/db/greendao/DaoSession;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/db/greendao/DaoSession;->getSaveTaskDao()Lcom/android/camera/db/greendao/SaveTaskDao;

    move-result-object v0

    return-object v0
.end method

.method public getItemByMediaId(Ljava/lang/Long;)Lcom/android/camera/db/element/SaveTask;
    .locals 4

    .line 81
    iget-object v0, p0, Lcom/android/camera/db/item/DbItemSaveTask;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 82
    :try_start_0
    invoke-virtual {p0}, Lcom/android/camera/db/item/DbItemSaveTask;->getDao()Lorg/greenrobot/greendao/AbstractDao;

    move-result-object v1

    invoke-virtual {v1}, Lorg/greenrobot/greendao/AbstractDao;->queryBuilder()Lorg/greenrobot/greendao/query/QueryBuilder;

    move-result-object v1

    sget-object v2, Lcom/android/camera/db/greendao/SaveTaskDao$Properties;->MediaStoreId:Lorg/greenrobot/greendao/Property;

    invoke-virtual {v2, p1}, Lorg/greenrobot/greendao/Property;->eq(Ljava/lang/Object;)Lorg/greenrobot/greendao/query/WhereCondition;

    move-result-object p1

    const/4 v2, 0x0

    new-array v3, v2, [Lorg/greenrobot/greendao/query/WhereCondition;

    invoke-virtual {v1, p1, v3}, Lorg/greenrobot/greendao/query/QueryBuilder;->where(Lorg/greenrobot/greendao/query/WhereCondition;[Lorg/greenrobot/greendao/query/WhereCondition;)Lorg/greenrobot/greendao/query/QueryBuilder;

    move-result-object p1

    const/4 v1, 0x1

    invoke-virtual {p1, v1}, Lorg/greenrobot/greendao/query/QueryBuilder;->limit(I)Lorg/greenrobot/greendao/query/QueryBuilder;

    move-result-object p1

    invoke-virtual {p1}, Lorg/greenrobot/greendao/query/QueryBuilder;->build()Lorg/greenrobot/greendao/query/Query;

    move-result-object p1

    invoke-virtual {p1}, Lorg/greenrobot/greendao/query/Query;->list()Ljava/util/List;

    move-result-object p1

    .line 83
    if-eqz p1, :cond_1

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    .line 87
    :cond_0
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/android/camera/db/element/SaveTask;

    monitor-exit v0

    return-object p1

    .line 84
    :cond_1
    :goto_0
    const/4 p1, 0x0

    monitor-exit v0

    return-object p1

    .line 88
    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public bridge synthetic getItemByMediaId(Ljava/lang/Long;)Ljava/lang/Object;
    .locals 0

    .line 21
    invoke-virtual {p0, p1}, Lcom/android/camera/db/item/DbItemSaveTask;->getItemByMediaId(Ljava/lang/Long;)Lcom/android/camera/db/element/SaveTask;

    move-result-object p1

    return-object p1
.end method

.method public getItemByPath(Ljava/lang/String;)Lcom/android/camera/db/element/SaveTask;
    .locals 4

    .line 69
    iget-object v0, p0, Lcom/android/camera/db/item/DbItemSaveTask;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 70
    :try_start_0
    invoke-virtual {p0}, Lcom/android/camera/db/item/DbItemSaveTask;->getDao()Lorg/greenrobot/greendao/AbstractDao;

    move-result-object v1

    invoke-virtual {v1}, Lorg/greenrobot/greendao/AbstractDao;->queryBuilder()Lorg/greenrobot/greendao/query/QueryBuilder;

    move-result-object v1

    sget-object v2, Lcom/android/camera/db/greendao/SaveTaskDao$Properties;->Path:Lorg/greenrobot/greendao/Property;

    invoke-virtual {v2, p1}, Lorg/greenrobot/greendao/Property;->eq(Ljava/lang/Object;)Lorg/greenrobot/greendao/query/WhereCondition;

    move-result-object p1

    const/4 v2, 0x0

    new-array v3, v2, [Lorg/greenrobot/greendao/query/WhereCondition;

    invoke-virtual {v1, p1, v3}, Lorg/greenrobot/greendao/query/QueryBuilder;->where(Lorg/greenrobot/greendao/query/WhereCondition;[Lorg/greenrobot/greendao/query/WhereCondition;)Lorg/greenrobot/greendao/query/QueryBuilder;

    move-result-object p1

    const/4 v1, 0x1

    invoke-virtual {p1, v1}, Lorg/greenrobot/greendao/query/QueryBuilder;->limit(I)Lorg/greenrobot/greendao/query/QueryBuilder;

    move-result-object p1

    invoke-virtual {p1}, Lorg/greenrobot/greendao/query/QueryBuilder;->build()Lorg/greenrobot/greendao/query/Query;

    move-result-object p1

    invoke-virtual {p1}, Lorg/greenrobot/greendao/query/Query;->list()Ljava/util/List;

    move-result-object p1

    .line 71
    if-eqz p1, :cond_1

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    .line 75
    :cond_0
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/android/camera/db/element/SaveTask;

    monitor-exit v0

    return-object p1

    .line 72
    :cond_1
    :goto_0
    const/4 p1, 0x0

    monitor-exit v0

    return-object p1

    .line 76
    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public bridge synthetic getItemByPath(Ljava/lang/String;)Ljava/lang/Object;
    .locals 0

    .line 21
    invoke-virtual {p0, p1}, Lcom/android/camera/db/item/DbItemSaveTask;->getItemByPath(Ljava/lang/String;)Lcom/android/camera/db/element/SaveTask;

    move-result-object p1

    return-object p1
.end method

.method public getItemWithExistedQuery(Lorg/greenrobot/greendao/query/Query;Ljava/lang/String;)Lcom/android/camera/db/element/SaveTask;
    .locals 3

    .line 93
    iget-object v0, p0, Lcom/android/camera/db/item/DbItemSaveTask;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 94
    const/4 v1, 0x0

    :try_start_0
    invoke-virtual {p1, v1, p2}, Lorg/greenrobot/greendao/query/Query;->setParameter(ILjava/lang/Object;)Lorg/greenrobot/greendao/query/Query;

    .line 95
    invoke-virtual {p0}, Lcom/android/camera/db/item/DbItemSaveTask;->getDao()Lorg/greenrobot/greendao/AbstractDao;

    move-result-object p1

    invoke-virtual {p1}, Lorg/greenrobot/greendao/AbstractDao;->queryBuilder()Lorg/greenrobot/greendao/query/QueryBuilder;

    move-result-object p1

    sget-object v2, Lcom/android/camera/db/greendao/SaveTaskDao$Properties;->Path:Lorg/greenrobot/greendao/Property;

    invoke-virtual {v2, p2}, Lorg/greenrobot/greendao/Property;->eq(Ljava/lang/Object;)Lorg/greenrobot/greendao/query/WhereCondition;

    move-result-object p2

    new-array v2, v1, [Lorg/greenrobot/greendao/query/WhereCondition;

    invoke-virtual {p1, p2, v2}, Lorg/greenrobot/greendao/query/QueryBuilder;->where(Lorg/greenrobot/greendao/query/WhereCondition;[Lorg/greenrobot/greendao/query/WhereCondition;)Lorg/greenrobot/greendao/query/QueryBuilder;

    move-result-object p1

    const/4 p2, 0x1

    invoke-virtual {p1, p2}, Lorg/greenrobot/greendao/query/QueryBuilder;->limit(I)Lorg/greenrobot/greendao/query/QueryBuilder;

    move-result-object p1

    invoke-virtual {p1}, Lorg/greenrobot/greendao/query/QueryBuilder;->build()Lorg/greenrobot/greendao/query/Query;

    move-result-object p1

    invoke-virtual {p1}, Lorg/greenrobot/greendao/query/Query;->list()Ljava/util/List;

    move-result-object p1

    .line 96
    if-eqz p1, :cond_1

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result p2

    if-eqz p2, :cond_0

    goto :goto_0

    .line 99
    :cond_0
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/android/camera/db/element/SaveTask;

    monitor-exit v0

    return-object p1

    .line 97
    :cond_1
    :goto_0
    const/4 p1, 0x0

    monitor-exit v0

    return-object p1

    .line 100
    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public bridge synthetic getItemWithExistedQuery(Lorg/greenrobot/greendao/query/Query;Ljava/lang/String;)Ljava/lang/Object;
    .locals 0

    .line 21
    invoke-virtual {p0, p1, p2}, Lcom/android/camera/db/item/DbItemSaveTask;->getItemWithExistedQuery(Lorg/greenrobot/greendao/query/Query;Ljava/lang/String;)Lcom/android/camera/db/element/SaveTask;

    move-result-object p1

    return-object p1
.end method

.method protected getOrderProperty()Lorg/greenrobot/greendao/Property;
    .locals 1

    .line 52
    sget-object v0, Lcom/android/camera/db/greendao/SaveTaskDao$Properties;->Id:Lorg/greenrobot/greendao/Property;

    return-object v0
.end method

.method public markAllDepartedTask()V
    .locals 9

    .line 107
    iget-object v0, p0, Lcom/android/camera/db/item/DbItemSaveTask;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 108
    :try_start_0
    invoke-virtual {p0}, Lcom/android/camera/db/item/DbItemSaveTask;->getAllItems()Ljava/util/List;

    move-result-object v1

    .line 109
    if-eqz v1, :cond_4

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    if-nez v2, :cond_0

    goto :goto_2

    .line 112
    :cond_0
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v2

    .line 113
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    .line 114
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/android/camera/db/element/SaveTask;

    .line 115
    invoke-virtual {v5, v3, v4}, Lcom/android/camera/db/element/SaveTask;->isDeparted(J)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 116
    invoke-virtual {v5}, Lcom/android/camera/db/element/SaveTask;->isValid()Z

    move-result v6

    if-nez v6, :cond_1

    .line 117
    const-string v6, "algo "

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "not valid, remove:"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Lcom/android/camera/db/element/SaveTask;->getPath()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 118
    invoke-virtual {p0, v5}, Lcom/android/camera/db/item/DbItemSaveTask;->removeItem(Ljava/lang/Object;)V

    goto :goto_1

    .line 120
    :cond_1
    const-string v6, "algo "

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "mark departed:"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Lcom/android/camera/db/element/SaveTask;->getPath()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 121
    const/4 v6, 0x0

    invoke-static {v2, v5, v6}, Lcom/xiaomi/camera/parallelservice/util/ParallelUtil;->markTaskFinish(Landroid/content/Context;Lcom/android/camera/db/element/SaveTask;Z)V

    .line 124
    :cond_2
    :goto_1
    goto :goto_0

    .line 125
    :cond_3
    monitor-exit v0

    .line 127
    return-void

    .line 110
    :cond_4
    :goto_2
    monitor-exit v0

    return-void

    .line 125
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method protected provideTableName()Ljava/lang/String;
    .locals 1

    .line 42
    const-string v0, "tasks"

    return-object v0
.end method
