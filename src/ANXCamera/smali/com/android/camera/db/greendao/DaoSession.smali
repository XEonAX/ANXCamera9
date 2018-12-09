.class public Lcom/android/camera/db/greendao/DaoSession;
.super Lorg/greenrobot/greendao/AbstractDaoSession;
.source "DaoSession.java"


# instance fields
.field private final saveTaskDao:Lcom/android/camera/db/greendao/SaveTaskDao;

.field private final saveTaskDaoConfig:Lorg/greenrobot/greendao/internal/DaoConfig;


# direct methods
.method public constructor <init>(Lorg/greenrobot/greendao/database/Database;Lorg/greenrobot/greendao/identityscope/IdentityScopeType;Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/greenrobot/greendao/database/Database;",
            "Lorg/greenrobot/greendao/identityscope/IdentityScopeType;",
            "Ljava/util/Map<",
            "Ljava/lang/Class<",
            "+",
            "Lorg/greenrobot/greendao/AbstractDao<",
            "**>;>;",
            "Lorg/greenrobot/greendao/internal/DaoConfig;",
            ">;)V"
        }
    .end annotation

    .line 28
    invoke-direct {p0, p1}, Lorg/greenrobot/greendao/AbstractDaoSession;-><init>(Lorg/greenrobot/greendao/database/Database;)V

    .line 30
    const-class p1, Lcom/android/camera/db/greendao/SaveTaskDao;

    invoke-interface {p3, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorg/greenrobot/greendao/internal/DaoConfig;

    invoke-virtual {p1}, Lorg/greenrobot/greendao/internal/DaoConfig;->clone()Lorg/greenrobot/greendao/internal/DaoConfig;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/db/greendao/DaoSession;->saveTaskDaoConfig:Lorg/greenrobot/greendao/internal/DaoConfig;

    .line 31
    iget-object p1, p0, Lcom/android/camera/db/greendao/DaoSession;->saveTaskDaoConfig:Lorg/greenrobot/greendao/internal/DaoConfig;

    invoke-virtual {p1, p2}, Lorg/greenrobot/greendao/internal/DaoConfig;->initIdentityScope(Lorg/greenrobot/greendao/identityscope/IdentityScopeType;)V

    .line 33
    new-instance p1, Lcom/android/camera/db/greendao/SaveTaskDao;

    iget-object p2, p0, Lcom/android/camera/db/greendao/DaoSession;->saveTaskDaoConfig:Lorg/greenrobot/greendao/internal/DaoConfig;

    invoke-direct {p1, p2, p0}, Lcom/android/camera/db/greendao/SaveTaskDao;-><init>(Lorg/greenrobot/greendao/internal/DaoConfig;Lcom/android/camera/db/greendao/DaoSession;)V

    iput-object p1, p0, Lcom/android/camera/db/greendao/DaoSession;->saveTaskDao:Lcom/android/camera/db/greendao/SaveTaskDao;

    .line 35
    const-class p1, Lcom/android/camera/db/element/SaveTask;

    iget-object p2, p0, Lcom/android/camera/db/greendao/DaoSession;->saveTaskDao:Lcom/android/camera/db/greendao/SaveTaskDao;

    invoke-virtual {p0, p1, p2}, Lcom/android/camera/db/greendao/DaoSession;->registerDao(Ljava/lang/Class;Lorg/greenrobot/greendao/AbstractDao;)V

    .line 36
    return-void
.end method


# virtual methods
.method public clear()V
    .locals 1

    .line 39
    iget-object v0, p0, Lcom/android/camera/db/greendao/DaoSession;->saveTaskDaoConfig:Lorg/greenrobot/greendao/internal/DaoConfig;

    invoke-virtual {v0}, Lorg/greenrobot/greendao/internal/DaoConfig;->clearIdentityScope()V

    .line 40
    return-void
.end method

.method public getSaveTaskDao()Lcom/android/camera/db/greendao/SaveTaskDao;
    .locals 1

    .line 43
    iget-object v0, p0, Lcom/android/camera/db/greendao/DaoSession;->saveTaskDao:Lcom/android/camera/db/greendao/SaveTaskDao;

    return-object v0
.end method
