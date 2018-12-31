.class public abstract Lcom/android/camera/db/item/DbItemBase;
.super Ljava/lang/Object;
.source "DbItemBase.java"

# interfaces
.implements Lcom/android/camera/db/provider/DbProvider$providerDb;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "K:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/android/camera/db/provider/DbProvider$providerDb<",
        "TT;TK;>;"
    }
.end annotation


# instance fields
.field protected final mLock:Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/android/camera/db/item/DbItemBase;->mLock:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method protected abstract createItem(J)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)TT;"
        }
    .end annotation
.end method

.method protected abstract endItem(Ljava/lang/Object;J)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;J)TT;"
        }
    .end annotation
.end method

.method public endItemAndInsert(Ljava/lang/Object;J)J
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;J)J"
        }
    .end annotation

    .line 39
    iget-object v0, p0, Lcom/android/camera/db/item/DbItemBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 40
    :try_start_0
    invoke-virtual {p0, p1, p2, p3}, Lcom/android/camera/db/item/DbItemBase;->endItem(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/android/camera/db/item/DbItemBase;->insertOrReplace(Ljava/lang/Object;)J

    move-result-wide p1

    monitor-exit v0

    return-wide p1

    .line 41
    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public generateItem(J)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)TT;"
        }
    .end annotation

    .line 32
    iget-object v0, p0, Lcom/android/camera/db/item/DbItemBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 33
    :try_start_0
    invoke-virtual {p0, p1, p2}, Lcom/android/camera/db/item/DbItemBase;->createItem(J)Ljava/lang/Object;

    move-result-object p1

    monitor-exit v0

    return-object p1

    .line 34
    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public getAllItems()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation

    .line 60
    iget-object v0, p0, Lcom/android/camera/db/item/DbItemBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 61
    :try_start_0
    invoke-virtual {p0}, Lcom/android/camera/db/item/DbItemBase;->getDao()Lorg/greenrobot/greendao/AbstractDao;

    move-result-object v1

    invoke-virtual {v1}, Lorg/greenrobot/greendao/AbstractDao;->loadAll()Ljava/util/List;

    move-result-object v1

    monitor-exit v0

    return-object v1

    .line 62
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getCount()J
    .locals 3

    .line 25
    iget-object v0, p0, Lcom/android/camera/db/item/DbItemBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 26
    :try_start_0
    invoke-virtual {p0}, Lcom/android/camera/db/item/DbItemBase;->getDao()Lorg/greenrobot/greendao/AbstractDao;

    move-result-object v1

    invoke-virtual {v1}, Lorg/greenrobot/greendao/AbstractDao;->queryBuilder()Lorg/greenrobot/greendao/query/QueryBuilder;

    move-result-object v1

    invoke-virtual {v1}, Lorg/greenrobot/greendao/query/QueryBuilder;->buildCount()Lorg/greenrobot/greendao/query/CountQuery;

    move-result-object v1

    invoke-virtual {v1}, Lorg/greenrobot/greendao/query/CountQuery;->count()J

    move-result-wide v1

    monitor-exit v0

    return-wide v1

    .line 27
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method protected abstract getDao()Lorg/greenrobot/greendao/AbstractDao;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lorg/greenrobot/greendao/AbstractDao<",
            "TT;TK;>;"
        }
    .end annotation
.end method

.method protected final getDaoMaser()Lcom/android/camera/db/greendao/DaoMaster;
    .locals 1

    .line 119
    invoke-static {}, Lcom/android/camera/db/DbContainer;->getInstance()Lcom/android/camera/db/DbContainer;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/db/DbContainer;->getDaoMaster()Lcom/android/camera/db/greendao/DaoMaster;

    move-result-object v0

    return-object v0
.end method

.method protected final getDaoSession()Lcom/android/camera/db/greendao/DaoSession;
    .locals 1

    .line 123
    invoke-static {}, Lcom/android/camera/db/DbContainer;->getInstance()Lcom/android/camera/db/DbContainer;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/db/DbContainer;->getDaoSession()Lcom/android/camera/db/greendao/DaoSession;

    move-result-object v0

    return-object v0
.end method

.method public getItemByMediaId(Ljava/lang/Long;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Long;",
            ")TT;"
        }
    .end annotation

    .line 77
    new-instance p1, Ljava/lang/RuntimeException;

    const-string v0, "todo"

    invoke-direct {p1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public getItemByPath(Ljava/lang/String;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation

    .line 72
    new-instance p1, Ljava/lang/RuntimeException;

    const-string v0, "todo"

    invoke-direct {p1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public getItemWithExistedQuery(Lorg/greenrobot/greendao/query/Query;Ljava/lang/String;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/greenrobot/greendao/query/Query;",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation

    .line 82
    new-instance p1, Ljava/lang/RuntimeException;

    const-string p2, "todo"

    invoke-direct {p1, p2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public getLastItem()Ljava/lang/Object;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 87
    iget-object v0, p0, Lcom/android/camera/db/item/DbItemBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 88
    :try_start_0
    invoke-virtual {p0}, Lcom/android/camera/db/item/DbItemBase;->getDao()Lorg/greenrobot/greendao/AbstractDao;

    move-result-object v1

    invoke-virtual {v1}, Lorg/greenrobot/greendao/AbstractDao;->queryBuilder()Lorg/greenrobot/greendao/query/QueryBuilder;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lorg/greenrobot/greendao/query/QueryBuilder;->limit(I)Lorg/greenrobot/greendao/query/QueryBuilder;

    move-result-object v1

    new-array v2, v2, [Lorg/greenrobot/greendao/Property;

    invoke-virtual {p0}, Lcom/android/camera/db/item/DbItemBase;->getOrderProperty()Lorg/greenrobot/greendao/Property;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    invoke-virtual {v1, v2}, Lorg/greenrobot/greendao/query/QueryBuilder;->orderDesc([Lorg/greenrobot/greendao/Property;)Lorg/greenrobot/greendao/query/QueryBuilder;

    move-result-object v1

    invoke-virtual {v1}, Lorg/greenrobot/greendao/query/QueryBuilder;->list()Ljava/util/List;

    move-result-object v1

    .line 89
    if-eqz v1, :cond_0

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_0

    .line 90
    invoke-interface {v1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    monitor-exit v0

    return-object v1

    .line 92
    :cond_0
    const/4 v1, 0x0

    monitor-exit v0

    return-object v1

    .line 93
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method protected abstract getOrderProperty()Lorg/greenrobot/greendao/Property;
.end method

.method protected final insertOrReplace(Ljava/lang/Object;)J
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)J"
        }
    .end annotation

    .line 111
    invoke-virtual {p0}, Lcom/android/camera/db/item/DbItemBase;->getDaoSession()Lcom/android/camera/db/greendao/DaoSession;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/android/camera/db/greendao/DaoSession;->insertOrReplace(Ljava/lang/Object;)J

    move-result-wide v0

    return-wide v0
.end method

.method protected abstract provideTableName()Ljava/lang/String;
.end method

.method public removeItem(Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 53
    iget-object v0, p0, Lcom/android/camera/db/item/DbItemBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 54
    :try_start_0
    invoke-virtual {p0}, Lcom/android/camera/db/item/DbItemBase;->getDaoSession()Lcom/android/camera/db/greendao/DaoSession;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/android/camera/db/greendao/DaoSession;->delete(Ljava/lang/Object;)V

    .line 55
    monitor-exit v0

    .line 56
    return-void

    .line 55
    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public updateItem(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 46
    iget-object v0, p0, Lcom/android/camera/db/item/DbItemBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 47
    :try_start_0
    invoke-virtual {p0, p1}, Lcom/android/camera/db/item/DbItemBase;->updateItemThroughDb(Ljava/lang/Object;)V

    .line 48
    monitor-exit v0

    .line 49
    return-void

    .line 48
    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method protected final updateItemThroughDb(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 115
    invoke-virtual {p0}, Lcom/android/camera/db/item/DbItemBase;->getDaoSession()Lcom/android/camera/db/greendao/DaoSession;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/android/camera/db/greendao/DaoSession;->update(Ljava/lang/Object;)V

    .line 116
    return-void
.end method
