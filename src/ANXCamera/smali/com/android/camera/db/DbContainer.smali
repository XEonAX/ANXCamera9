.class public Lcom/android/camera/db/DbContainer;
.super Ljava/lang/Object;
.source "DbContainer.java"


# static fields
.field private static dbContainer:Lcom/android/camera/db/DbContainer;


# instance fields
.field private context:Landroid/content/Context;

.field private daoMaster:Lcom/android/camera/db/greendao/DaoMaster;

.field private daoSession:Lcom/android/camera/db/greendao/DaoSession;


# direct methods
.method private constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    iput-object p1, p0, Lcom/android/camera/db/DbContainer;->context:Landroid/content/Context;

    .line 24
    return-void
.end method

.method private clear()V
    .locals 2

    .line 44
    iget-object v0, p0, Lcom/android/camera/db/DbContainer;->daoSession:Lcom/android/camera/db/greendao/DaoSession;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 45
    iget-object v0, p0, Lcom/android/camera/db/DbContainer;->daoSession:Lcom/android/camera/db/greendao/DaoSession;

    invoke-virtual {v0}, Lcom/android/camera/db/greendao/DaoSession;->clear()V

    .line 46
    iput-object v1, p0, Lcom/android/camera/db/DbContainer;->daoSession:Lcom/android/camera/db/greendao/DaoSession;

    .line 49
    :cond_0
    iget-object v0, p0, Lcom/android/camera/db/DbContainer;->daoMaster:Lcom/android/camera/db/greendao/DaoMaster;

    if-eqz v0, :cond_1

    .line 50
    iput-object v1, p0, Lcom/android/camera/db/DbContainer;->daoMaster:Lcom/android/camera/db/greendao/DaoMaster;

    .line 52
    :cond_1
    return-void
.end method

.method public static getInstance()Lcom/android/camera/db/DbContainer;
    .locals 1

    .line 33
    sget-object v0, Lcom/android/camera/db/DbContainer;->dbContainer:Lcom/android/camera/db/DbContainer;

    return-object v0
.end method

.method public static final init(Landroid/content/Context;)V
    .locals 1

    .line 27
    sget-object v0, Lcom/android/camera/db/DbContainer;->dbContainer:Lcom/android/camera/db/DbContainer;

    if-nez v0, :cond_0

    .line 28
    new-instance v0, Lcom/android/camera/db/DbContainer;

    invoke-direct {v0, p0}, Lcom/android/camera/db/DbContainer;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/android/camera/db/DbContainer;->dbContainer:Lcom/android/camera/db/DbContainer;

    .line 30
    :cond_0
    return-void
.end method

.method public static release()V
    .locals 1

    .line 37
    sget-object v0, Lcom/android/camera/db/DbContainer;->dbContainer:Lcom/android/camera/db/DbContainer;

    if-eqz v0, :cond_0

    .line 38
    sget-object v0, Lcom/android/camera/db/DbContainer;->dbContainer:Lcom/android/camera/db/DbContainer;

    invoke-direct {v0}, Lcom/android/camera/db/DbContainer;->clear()V

    .line 39
    const/4 v0, 0x0

    sput-object v0, Lcom/android/camera/db/DbContainer;->dbContainer:Lcom/android/camera/db/DbContainer;

    .line 41
    :cond_0
    return-void
.end method


# virtual methods
.method public getDaoMaster()Lcom/android/camera/db/greendao/DaoMaster;
    .locals 4

    .line 55
    iget-object v0, p0, Lcom/android/camera/db/DbContainer;->daoMaster:Lcom/android/camera/db/greendao/DaoMaster;

    if-nez v0, :cond_1

    .line 56
    iget-object v0, p0, Lcom/android/camera/db/DbContainer;->context:Landroid/content/Context;

    if-nez v0, :cond_0

    .line 57
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/db/DbContainer;->context:Landroid/content/Context;

    .line 59
    :cond_0
    new-instance v0, Lcom/android/camera/db/greendao/DaoMaster$DevOpenHelper;

    iget-object v1, p0, Lcom/android/camera/db/DbContainer;->context:Landroid/content/Context;

    const-string v2, "camera.db"

    const/4 v3, 0x0

    invoke-direct {v0, v1, v2, v3}, Lcom/android/camera/db/greendao/DaoMaster$DevOpenHelper;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;)V

    .line 60
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/camera/db/greendao/DaoMaster$OpenHelper;->setLoadSQLCipherNativeLibs(Z)V

    .line 62
    new-instance v1, Lcom/android/camera/db/greendao/DaoMaster;

    invoke-virtual {v0}, Lcom/android/camera/db/greendao/DaoMaster$OpenHelper;->getWritableDb()Lorg/greenrobot/greendao/database/Database;

    move-result-object v0

    invoke-direct {v1, v0}, Lcom/android/camera/db/greendao/DaoMaster;-><init>(Lorg/greenrobot/greendao/database/Database;)V

    iput-object v1, p0, Lcom/android/camera/db/DbContainer;->daoMaster:Lcom/android/camera/db/greendao/DaoMaster;

    .line 64
    :cond_1
    iget-object v0, p0, Lcom/android/camera/db/DbContainer;->daoMaster:Lcom/android/camera/db/greendao/DaoMaster;

    return-object v0
.end method

.method public getDaoSession()Lcom/android/camera/db/greendao/DaoSession;
    .locals 1

    .line 68
    iget-object v0, p0, Lcom/android/camera/db/DbContainer;->daoSession:Lcom/android/camera/db/greendao/DaoSession;

    if-nez v0, :cond_0

    .line 69
    invoke-virtual {p0}, Lcom/android/camera/db/DbContainer;->getDaoMaster()Lcom/android/camera/db/greendao/DaoMaster;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/db/DbContainer;->daoMaster:Lcom/android/camera/db/greendao/DaoMaster;

    .line 70
    iget-object v0, p0, Lcom/android/camera/db/DbContainer;->daoMaster:Lcom/android/camera/db/greendao/DaoMaster;

    invoke-virtual {v0}, Lcom/android/camera/db/greendao/DaoMaster;->newSession()Lcom/android/camera/db/greendao/DaoSession;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/db/DbContainer;->daoSession:Lcom/android/camera/db/greendao/DaoSession;

    .line 72
    :cond_0
    iget-object v0, p0, Lcom/android/camera/db/DbContainer;->daoSession:Lcom/android/camera/db/greendao/DaoSession;

    return-object v0
.end method
