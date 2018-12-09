.class public abstract Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;
.super Lorg/greenrobot/greendao/test/AbstractDaoTest;
.source "AbstractDaoTestSinglePk.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<D:",
        "Lorg/greenrobot/greendao/AbstractDao<",
        "TT;TK;>;T:",
        "Ljava/lang/Object;",
        "K:",
        "Ljava/lang/Object;",
        ">",
        "Lorg/greenrobot/greendao/test/AbstractDaoTest<",
        "TD;TT;TK;>;"
    }
.end annotation


# instance fields
.field private pkColumn:Lorg/greenrobot/greendao/Property;

.field protected usedPks:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "TK;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/Class;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "TD;>;)V"
        }
    .end annotation

    .line 46
    invoke-direct {p0, p1}, Lorg/greenrobot/greendao/test/AbstractDaoTest;-><init>(Ljava/lang/Class;)V

    .line 47
    new-instance p1, Ljava/util/HashSet;

    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    iput-object p1, p0, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->usedPks:Ljava/util/Set;

    .line 48
    return-void
.end method


# virtual methods
.method protected checkKeyIsNullable()Z
    .locals 1

    .line 341
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->createEntity(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_0

    .line 342
    const-string v0, "Test is not available for entities with non-null keys"

    invoke-static {v0}, Lorg/greenrobot/greendao/DaoLog;->d(Ljava/lang/String;)I

    .line 343
    const/4 v0, 0x0

    return v0

    .line 345
    :cond_0
    const/4 v0, 0x1

    return v0
.end method

.method protected abstract createEntity(Ljava/lang/Object;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)TT;"
        }
    .end annotation
.end method

.method protected createEntityWithRandomPk()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 360
    invoke-virtual {p0}, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->nextPk()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->createEntity(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method protected abstract createRandomPk()Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TK;"
        }
    .end annotation
.end method

.method protected nextPk()Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TK;"
        }
    .end annotation

    .line 350
    const/4 v0, 0x0

    :goto_0
    const v1, 0x186a0

    if-ge v0, v1, :cond_1

    .line 351
    invoke-virtual {p0}, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->createRandomPk()Ljava/lang/Object;

    move-result-object v1

    .line 352
    iget-object v2, p0, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->usedPks:Ljava/util/Set;

    invoke-interface {v2, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 353
    return-object v1

    .line 350
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 356
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Could not find a new PK"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected queryWithDummyColumnsInFront(ILjava/lang/String;Ljava/lang/Object;)Landroid/database/Cursor;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/lang/String;",
            "TK;)",
            "Landroid/database/Cursor;"
        }
    .end annotation

    .line 309
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "SELECT "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 310
    const/4 v1, 0x0

    move v2, v1

    :goto_0
    if-ge v2, p1, :cond_0

    .line 311
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ","

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 310
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 313
    :cond_0
    const-string v2, "T"

    iget-object v3, p0, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->dao:Lorg/greenrobot/greendao/AbstractDao;

    invoke-virtual {v3}, Lorg/greenrobot/greendao/AbstractDao;->getAllColumns()[Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v2, v3}, Lorg/greenrobot/greendao/internal/SqlUtils;->appendColumns(Ljava/lang/StringBuilder;Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " FROM "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 314
    const/16 v2, 0x22

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->dao:Lorg/greenrobot/greendao/AbstractDao;

    invoke-virtual {v3}, Lorg/greenrobot/greendao/AbstractDao;->getTablename()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string v2, " T"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 315
    const/4 v2, 0x1

    if-eqz p3, :cond_1

    .line 316
    const-string v3, " WHERE "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 318
    iget-object v3, p0, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->dao:Lorg/greenrobot/greendao/AbstractDao;

    invoke-virtual {v3}, Lorg/greenrobot/greendao/AbstractDao;->getPkColumns()[Ljava/lang/String;

    move-result-object v3

    array-length v3, v3

    invoke-static {v2, v3}, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->assertEquals(II)V

    .line 319
    iget-object v3, p0, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->dao:Lorg/greenrobot/greendao/AbstractDao;

    invoke-virtual {v3}, Lorg/greenrobot/greendao/AbstractDao;->getPkColumns()[Ljava/lang/String;

    move-result-object v3

    aget-object v3, v3, v1

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "="

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 320
    invoke-static {v0, p3}, Landroid/database/DatabaseUtils;->appendValueToSql(Ljava/lang/StringBuilder;Ljava/lang/Object;)V

    .line 323
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 324
    iget-object v3, p0, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->db:Lorg/greenrobot/greendao/database/Database;

    const/4 v4, 0x0

    invoke-interface {v3, v0, v4}, Lorg/greenrobot/greendao/database/Database;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 325
    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v3

    invoke-static {v3}, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->assertTrue(Z)V

    .line 327
    :goto_1
    if-ge v1, p1, :cond_2

    .line 328
    :try_start_0
    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {p2, v3}, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->assertEquals(Ljava/lang/String;Ljava/lang/String;)V

    .line 327
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 333
    :catch_0
    move-exception p1

    goto :goto_2

    .line 330
    :cond_2
    if-eqz p3, :cond_3

    .line 331
    invoke-interface {v0}, Landroid/database/Cursor;->getCount()I

    move-result p1

    invoke-static {v2, p1}, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->assertEquals(II)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_3

    .line 333
    :goto_2
    nop

    .line 334
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 335
    throw p1

    .line 336
    :cond_3
    :goto_3
    nop

    .line 337
    return-object v0
.end method

.method protected runLoadPkTest(I)V
    .locals 3

    .line 295
    invoke-virtual {p0}, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->nextPk()Ljava/lang/Object;

    move-result-object v0

    .line 296
    invoke-virtual {p0, v0}, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->createEntity(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 297
    iget-object v2, p0, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->dao:Lorg/greenrobot/greendao/AbstractDao;

    invoke-virtual {v2, v1}, Lorg/greenrobot/greendao/AbstractDao;->insert(Ljava/lang/Object;)J

    .line 299
    const-string v1, "42"

    invoke-virtual {p0, p1, v1, v0}, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->queryWithDummyColumnsInFront(ILjava/lang/String;Ljava/lang/Object;)Landroid/database/Cursor;

    move-result-object v1

    .line 301
    :try_start_0
    iget-object v2, p0, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->daoAccess:Lorg/greenrobot/greendao/InternalUnitTestDaoAccess;

    invoke-virtual {v2, v1, p1}, Lorg/greenrobot/greendao/InternalUnitTestDaoAccess;->readKey(Landroid/database/Cursor;I)Ljava/lang/Object;

    move-result-object p1

    .line 302
    invoke-static {v0, p1}, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->assertEquals(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 304
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 305
    nop

    .line 306
    return-void

    .line 304
    :catchall_0
    move-exception p1

    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    throw p1
.end method

.method protected setUp()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 52
    invoke-super {p0}, Lorg/greenrobot/greendao/test/AbstractDaoTest;->setUp()V

    .line 53
    iget-object v0, p0, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->daoAccess:Lorg/greenrobot/greendao/InternalUnitTestDaoAccess;

    invoke-virtual {v0}, Lorg/greenrobot/greendao/InternalUnitTestDaoAccess;->getProperties()[Lorg/greenrobot/greendao/Property;

    move-result-object v0

    .line 54
    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_2

    aget-object v3, v0, v2

    .line 55
    iget-boolean v4, v3, Lorg/greenrobot/greendao/Property;->primaryKey:Z

    if-eqz v4, :cond_1

    .line 56
    iget-object v4, p0, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->pkColumn:Lorg/greenrobot/greendao/Property;

    if-nez v4, :cond_0

    .line 59
    iput-object v3, p0, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->pkColumn:Lorg/greenrobot/greendao/Property;

    goto :goto_1

    .line 57
    :cond_0
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Test does not work with multiple PK columns"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 54
    :cond_1
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 62
    :cond_2
    iget-object v0, p0, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->pkColumn:Lorg/greenrobot/greendao/Property;

    if-eqz v0, :cond_3

    .line 65
    return-void

    .line 63
    :cond_3
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Test does not work without a PK column"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public testCount()V
    .locals 4

    .line 88
    iget-object v0, p0, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->dao:Lorg/greenrobot/greendao/AbstractDao;

    invoke-virtual {v0}, Lorg/greenrobot/greendao/AbstractDao;->deleteAll()V

    .line 89
    iget-object v0, p0, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->dao:Lorg/greenrobot/greendao/AbstractDao;

    invoke-virtual {v0}, Lorg/greenrobot/greendao/AbstractDao;->count()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    invoke-static {v2, v3, v0, v1}, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->assertEquals(JJ)V

    .line 90
    iget-object v0, p0, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->dao:Lorg/greenrobot/greendao/AbstractDao;

    invoke-virtual {p0}, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->createEntityWithRandomPk()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/greenrobot/greendao/AbstractDao;->insert(Ljava/lang/Object;)J

    .line 91
    iget-object v0, p0, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->dao:Lorg/greenrobot/greendao/AbstractDao;

    invoke-virtual {v0}, Lorg/greenrobot/greendao/AbstractDao;->count()J

    move-result-wide v0

    const-wide/16 v2, 0x1

    invoke-static {v2, v3, v0, v1}, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->assertEquals(JJ)V

    .line 92
    iget-object v0, p0, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->dao:Lorg/greenrobot/greendao/AbstractDao;

    invoke-virtual {p0}, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->createEntityWithRandomPk()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/greenrobot/greendao/AbstractDao;->insert(Ljava/lang/Object;)J

    .line 93
    iget-object v0, p0, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->dao:Lorg/greenrobot/greendao/AbstractDao;

    invoke-virtual {v0}, Lorg/greenrobot/greendao/AbstractDao;->count()J

    move-result-wide v0

    const-wide/16 v2, 0x2

    invoke-static {v2, v3, v0, v1}, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->assertEquals(JJ)V

    .line 94
    return-void
.end method

.method public testDelete()V
    .locals 3

    .line 134
    invoke-virtual {p0}, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->nextPk()Ljava/lang/Object;

    move-result-object v0

    .line 135
    iget-object v1, p0, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->dao:Lorg/greenrobot/greendao/AbstractDao;

    invoke-virtual {v1, v0}, Lorg/greenrobot/greendao/AbstractDao;->deleteByKey(Ljava/lang/Object;)V

    .line 136
    invoke-virtual {p0, v0}, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->createEntity(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 137
    iget-object v2, p0, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->dao:Lorg/greenrobot/greendao/AbstractDao;

    invoke-virtual {v2, v1}, Lorg/greenrobot/greendao/AbstractDao;->insert(Ljava/lang/Object;)J

    .line 138
    iget-object v1, p0, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->dao:Lorg/greenrobot/greendao/AbstractDao;

    invoke-virtual {v1, v0}, Lorg/greenrobot/greendao/AbstractDao;->load(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1}, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->assertNotNull(Ljava/lang/Object;)V

    .line 139
    iget-object v1, p0, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->dao:Lorg/greenrobot/greendao/AbstractDao;

    invoke-virtual {v1, v0}, Lorg/greenrobot/greendao/AbstractDao;->deleteByKey(Ljava/lang/Object;)V

    .line 140
    iget-object v1, p0, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->dao:Lorg/greenrobot/greendao/AbstractDao;

    invoke-virtual {v1, v0}, Lorg/greenrobot/greendao/AbstractDao;->load(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->assertNull(Ljava/lang/Object;)V

    .line 141
    return-void
.end method

.method public testDeleteAll()V
    .locals 5

    .line 144
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 145
    const/4 v1, 0x0

    :goto_0
    const/16 v2, 0xa

    if-ge v1, v2, :cond_0

    .line 146
    invoke-virtual {p0}, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->createEntityWithRandomPk()Ljava/lang/Object;

    move-result-object v2

    .line 147
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 145
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 149
    :cond_0
    iget-object v1, p0, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->dao:Lorg/greenrobot/greendao/AbstractDao;

    invoke-virtual {v1, v0}, Lorg/greenrobot/greendao/AbstractDao;->insertInTx(Ljava/lang/Iterable;)V

    .line 150
    iget-object v1, p0, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->dao:Lorg/greenrobot/greendao/AbstractDao;

    invoke-virtual {v1}, Lorg/greenrobot/greendao/AbstractDao;->deleteAll()V

    .line 151
    const-wide/16 v1, 0x0

    iget-object v3, p0, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->dao:Lorg/greenrobot/greendao/AbstractDao;

    invoke-virtual {v3}, Lorg/greenrobot/greendao/AbstractDao;->count()J

    move-result-wide v3

    invoke-static {v1, v2, v3, v4}, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->assertEquals(JJ)V

    .line 152
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 153
    iget-object v2, p0, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->daoAccess:Lorg/greenrobot/greendao/InternalUnitTestDaoAccess;

    invoke-virtual {v2, v1}, Lorg/greenrobot/greendao/InternalUnitTestDaoAccess;->getKey(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 154
    invoke-static {v1}, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->assertNotNull(Ljava/lang/Object;)V

    .line 155
    iget-object v2, p0, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->dao:Lorg/greenrobot/greendao/AbstractDao;

    invoke-virtual {v2, v1}, Lorg/greenrobot/greendao/AbstractDao;->load(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1}, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->assertNull(Ljava/lang/Object;)V

    .line 156
    goto :goto_1

    .line 157
    :cond_1
    return-void
.end method

.method public testDeleteByKeyInTx()V
    .locals 5

    .line 181
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 182
    const/4 v1, 0x0

    move v2, v1

    :goto_0
    const/16 v3, 0xa

    if-ge v2, v3, :cond_0

    .line 183
    invoke-virtual {p0}, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->createEntityWithRandomPk()Ljava/lang/Object;

    move-result-object v3

    .line 184
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 182
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 186
    :cond_0
    iget-object v2, p0, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->dao:Lorg/greenrobot/greendao/AbstractDao;

    invoke-virtual {v2, v0}, Lorg/greenrobot/greendao/AbstractDao;->insertInTx(Ljava/lang/Iterable;)V

    .line 187
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 188
    iget-object v3, p0, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->daoAccess:Lorg/greenrobot/greendao/InternalUnitTestDaoAccess;

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v3, v1}, Lorg/greenrobot/greendao/InternalUnitTestDaoAccess;->getKey(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 189
    iget-object v1, p0, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->daoAccess:Lorg/greenrobot/greendao/InternalUnitTestDaoAccess;

    const/4 v3, 0x3

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v1, v3}, Lorg/greenrobot/greendao/InternalUnitTestDaoAccess;->getKey(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 190
    iget-object v1, p0, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->daoAccess:Lorg/greenrobot/greendao/InternalUnitTestDaoAccess;

    const/4 v3, 0x4

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v1, v3}, Lorg/greenrobot/greendao/InternalUnitTestDaoAccess;->getKey(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 191
    iget-object v1, p0, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->daoAccess:Lorg/greenrobot/greendao/InternalUnitTestDaoAccess;

    const/16 v3, 0x8

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v1, v3}, Lorg/greenrobot/greendao/InternalUnitTestDaoAccess;->getKey(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 192
    iget-object v1, p0, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->dao:Lorg/greenrobot/greendao/AbstractDao;

    invoke-virtual {v1, v2}, Lorg/greenrobot/greendao/AbstractDao;->deleteByKeyInTx(Ljava/lang/Iterable;)V

    .line 193
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v1

    sub-int/2addr v0, v1

    int-to-long v0, v0

    iget-object v3, p0, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->dao:Lorg/greenrobot/greendao/AbstractDao;

    invoke-virtual {v3}, Lorg/greenrobot/greendao/AbstractDao;->count()J

    move-result-wide v3

    invoke-static {v0, v1, v3, v4}, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->assertEquals(JJ)V

    .line 194
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 195
    invoke-static {v1}, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->assertNotNull(Ljava/lang/Object;)V

    .line 196
    iget-object v2, p0, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->dao:Lorg/greenrobot/greendao/AbstractDao;

    invoke-virtual {v2, v1}, Lorg/greenrobot/greendao/AbstractDao;->load(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1}, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->assertNull(Ljava/lang/Object;)V

    .line 197
    goto :goto_1

    .line 198
    :cond_1
    return-void
.end method

.method public testDeleteInTx()V
    .locals 5

    .line 160
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 161
    const/4 v1, 0x0

    move v2, v1

    :goto_0
    const/16 v3, 0xa

    if-ge v2, v3, :cond_0

    .line 162
    invoke-virtual {p0}, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->createEntityWithRandomPk()Ljava/lang/Object;

    move-result-object v3

    .line 163
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 161
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 165
    :cond_0
    iget-object v2, p0, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->dao:Lorg/greenrobot/greendao/AbstractDao;

    invoke-virtual {v2, v0}, Lorg/greenrobot/greendao/AbstractDao;->insertInTx(Ljava/lang/Iterable;)V

    .line 166
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 167
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 168
    const/4 v1, 0x3

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 169
    const/4 v1, 0x4

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 170
    const/16 v1, 0x8

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 171
    iget-object v1, p0, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->dao:Lorg/greenrobot/greendao/AbstractDao;

    invoke-virtual {v1, v2}, Lorg/greenrobot/greendao/AbstractDao;->deleteInTx(Ljava/lang/Iterable;)V

    .line 172
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v1

    sub-int/2addr v0, v1

    int-to-long v0, v0

    iget-object v3, p0, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->dao:Lorg/greenrobot/greendao/AbstractDao;

    invoke-virtual {v3}, Lorg/greenrobot/greendao/AbstractDao;->count()J

    move-result-wide v3

    invoke-static {v0, v1, v3, v4}, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->assertEquals(JJ)V

    .line 173
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 174
    iget-object v2, p0, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->daoAccess:Lorg/greenrobot/greendao/InternalUnitTestDaoAccess;

    invoke-virtual {v2, v1}, Lorg/greenrobot/greendao/InternalUnitTestDaoAccess;->getKey(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 175
    invoke-static {v1}, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->assertNotNull(Ljava/lang/Object;)V

    .line 176
    iget-object v2, p0, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->dao:Lorg/greenrobot/greendao/AbstractDao;

    invoke-virtual {v2, v1}, Lorg/greenrobot/greendao/AbstractDao;->load(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1}, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->assertNull(Ljava/lang/Object;)V

    .line 177
    goto :goto_1

    .line 178
    :cond_1
    return-void
.end method

.method public testInsertAndLoad()V
    .locals 3

    .line 68
    invoke-virtual {p0}, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->nextPk()Ljava/lang/Object;

    move-result-object v0

    .line 69
    invoke-virtual {p0, v0}, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->createEntity(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 70
    iget-object v2, p0, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->dao:Lorg/greenrobot/greendao/AbstractDao;

    invoke-virtual {v2, v1}, Lorg/greenrobot/greendao/AbstractDao;->insert(Ljava/lang/Object;)J

    .line 71
    iget-object v2, p0, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->daoAccess:Lorg/greenrobot/greendao/InternalUnitTestDaoAccess;

    invoke-virtual {v2, v1}, Lorg/greenrobot/greendao/InternalUnitTestDaoAccess;->getKey(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-static {v0, v2}, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->assertEquals(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 72
    iget-object v2, p0, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->dao:Lorg/greenrobot/greendao/AbstractDao;

    invoke-virtual {v2, v0}, Lorg/greenrobot/greendao/AbstractDao;->load(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 73
    invoke-static {v0}, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->assertNotNull(Ljava/lang/Object;)V

    .line 74
    iget-object v2, p0, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->daoAccess:Lorg/greenrobot/greendao/InternalUnitTestDaoAccess;

    invoke-virtual {v2, v1}, Lorg/greenrobot/greendao/InternalUnitTestDaoAccess;->getKey(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    iget-object v2, p0, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->daoAccess:Lorg/greenrobot/greendao/InternalUnitTestDaoAccess;

    invoke-virtual {v2, v0}, Lorg/greenrobot/greendao/InternalUnitTestDaoAccess;->getKey(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v1, v0}, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->assertEquals(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 75
    return-void
.end method

.method public testInsertInTx()V
    .locals 4

    .line 78
    iget-object v0, p0, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->dao:Lorg/greenrobot/greendao/AbstractDao;

    invoke-virtual {v0}, Lorg/greenrobot/greendao/AbstractDao;->deleteAll()V

    .line 79
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 80
    const/4 v1, 0x0

    :goto_0
    const/16 v2, 0x14

    if-ge v1, v2, :cond_0

    .line 81
    invoke-virtual {p0}, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->createEntityWithRandomPk()Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 80
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 83
    :cond_0
    iget-object v1, p0, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->dao:Lorg/greenrobot/greendao/AbstractDao;

    invoke-virtual {v1, v0}, Lorg/greenrobot/greendao/AbstractDao;->insertInTx(Ljava/lang/Iterable;)V

    .line 84
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    int-to-long v0, v0

    iget-object v2, p0, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->dao:Lorg/greenrobot/greendao/AbstractDao;

    invoke-virtual {v2}, Lorg/greenrobot/greendao/AbstractDao;->count()J

    move-result-wide v2

    invoke-static {v0, v1, v2, v3}, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->assertEquals(JJ)V

    .line 85
    return-void
.end method

.method public testInsertOrReplaceInTx()V
    .locals 5

    .line 118
    iget-object v0, p0, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->dao:Lorg/greenrobot/greendao/AbstractDao;

    invoke-virtual {v0}, Lorg/greenrobot/greendao/AbstractDao;->deleteAll()V

    .line 119
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 120
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 121
    const/4 v2, 0x0

    :goto_0
    const/16 v3, 0x14

    if-ge v2, v3, :cond_1

    .line 122
    invoke-virtual {p0}, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->createEntityWithRandomPk()Ljava/lang/Object;

    move-result-object v3

    .line 123
    rem-int/lit8 v4, v2, 0x2

    if-nez v4, :cond_0

    .line 124
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 126
    :cond_0
    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 121
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 128
    :cond_1
    iget-object v2, p0, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->dao:Lorg/greenrobot/greendao/AbstractDao;

    invoke-virtual {v2, v0}, Lorg/greenrobot/greendao/AbstractDao;->insertOrReplaceInTx(Ljava/lang/Iterable;)V

    .line 129
    iget-object v0, p0, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->dao:Lorg/greenrobot/greendao/AbstractDao;

    invoke-virtual {v0, v1}, Lorg/greenrobot/greendao/AbstractDao;->insertOrReplaceInTx(Ljava/lang/Iterable;)V

    .line 130
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v0

    int-to-long v0, v0

    iget-object v2, p0, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->dao:Lorg/greenrobot/greendao/AbstractDao;

    invoke-virtual {v2}, Lorg/greenrobot/greendao/AbstractDao;->count()J

    move-result-wide v2

    invoke-static {v0, v1, v2, v3}, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->assertEquals(JJ)V

    .line 131
    return-void
.end method

.method public testInsertOrReplaceTwice()V
    .locals 6

    .line 109
    invoke-virtual {p0}, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->createEntityWithRandomPk()Ljava/lang/Object;

    move-result-object v0

    .line 110
    iget-object v1, p0, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->dao:Lorg/greenrobot/greendao/AbstractDao;

    invoke-virtual {v1, v0}, Lorg/greenrobot/greendao/AbstractDao;->insert(Ljava/lang/Object;)J

    move-result-wide v1

    .line 111
    iget-object v3, p0, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->dao:Lorg/greenrobot/greendao/AbstractDao;

    invoke-virtual {v3, v0}, Lorg/greenrobot/greendao/AbstractDao;->insertOrReplace(Ljava/lang/Object;)J

    move-result-wide v3

    .line 112
    iget-object v0, p0, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->dao:Lorg/greenrobot/greendao/AbstractDao;

    invoke-virtual {v0}, Lorg/greenrobot/greendao/AbstractDao;->getPkProperty()Lorg/greenrobot/greendao/Property;

    move-result-object v0

    iget-object v0, v0, Lorg/greenrobot/greendao/Property;->type:Ljava/lang/Class;

    const-class v5, Ljava/lang/Long;

    if-ne v0, v5, :cond_0

    .line 113
    invoke-static {v1, v2, v3, v4}, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->assertEquals(JJ)V

    .line 115
    :cond_0
    return-void
.end method

.method public testInsertTwice()V
    .locals 2

    .line 97
    invoke-virtual {p0}, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->nextPk()Ljava/lang/Object;

    move-result-object v0

    .line 98
    invoke-virtual {p0, v0}, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->createEntity(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 99
    iget-object v1, p0, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->dao:Lorg/greenrobot/greendao/AbstractDao;

    invoke-virtual {v1, v0}, Lorg/greenrobot/greendao/AbstractDao;->insert(Ljava/lang/Object;)J

    .line 101
    :try_start_0
    iget-object v1, p0, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->dao:Lorg/greenrobot/greendao/AbstractDao;

    invoke-virtual {v1, v0}, Lorg/greenrobot/greendao/AbstractDao;->insert(Ljava/lang/Object;)J

    .line 102
    const-string v0, "Inserting twice should not work"

    invoke-static {v0}, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->fail(Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/database/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    .line 105
    goto :goto_0

    .line 103
    :catch_0
    move-exception v0

    .line 106
    :goto_0
    return-void
.end method

.method public testLoadAll()V
    .locals 3

    .line 209
    iget-object v0, p0, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->dao:Lorg/greenrobot/greendao/AbstractDao;

    invoke-virtual {v0}, Lorg/greenrobot/greendao/AbstractDao;->deleteAll()V

    .line 210
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 211
    const/4 v1, 0x0

    :goto_0
    const/16 v2, 0xf

    if-ge v1, v2, :cond_0

    .line 212
    invoke-virtual {p0}, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->nextPk()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p0, v2}, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->createEntity(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 213
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 211
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 215
    :cond_0
    iget-object v1, p0, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->dao:Lorg/greenrobot/greendao/AbstractDao;

    invoke-virtual {v1, v0}, Lorg/greenrobot/greendao/AbstractDao;->insertInTx(Ljava/lang/Iterable;)V

    .line 216
    iget-object v1, p0, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->dao:Lorg/greenrobot/greendao/AbstractDao;

    invoke-virtual {v1}, Lorg/greenrobot/greendao/AbstractDao;->loadAll()Ljava/util/List;

    move-result-object v1

    .line 217
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    invoke-static {v0, v1}, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->assertEquals(II)V

    .line 218
    return-void
.end method

.method public testLoadPk()V
    .locals 1

    .line 259
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->runLoadPkTest(I)V

    .line 260
    return-void
.end method

.method public testLoadPkWithOffset()V
    .locals 1

    .line 255
    const/16 v0, 0xa

    invoke-virtual {p0, v0}, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->runLoadPkTest(I)V

    .line 256
    return-void
.end method

.method public testQuery()V
    .locals 7

    .line 221
    iget-object v0, p0, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->dao:Lorg/greenrobot/greendao/AbstractDao;

    invoke-virtual {p0}, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->createEntityWithRandomPk()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/greenrobot/greendao/AbstractDao;->insert(Ljava/lang/Object;)J

    .line 222
    invoke-virtual {p0}, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->nextPk()Ljava/lang/Object;

    move-result-object v0

    .line 223
    iget-object v1, p0, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->dao:Lorg/greenrobot/greendao/AbstractDao;

    invoke-virtual {p0, v0}, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->createEntity(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/greenrobot/greendao/AbstractDao;->insert(Ljava/lang/Object;)J

    .line 224
    iget-object v1, p0, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->dao:Lorg/greenrobot/greendao/AbstractDao;

    invoke-virtual {p0}, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->createEntityWithRandomPk()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/greenrobot/greendao/AbstractDao;->insert(Ljava/lang/Object;)J

    .line 226
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "WHERE "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->dao:Lorg/greenrobot/greendao/AbstractDao;

    invoke-virtual {v2}, Lorg/greenrobot/greendao/AbstractDao;->getPkColumns()[Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    aget-object v2, v2, v3

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "=?"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 227
    iget-object v2, p0, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->dao:Lorg/greenrobot/greendao/AbstractDao;

    const/4 v4, 0x1

    new-array v5, v4, [Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v3

    invoke-virtual {v2, v1, v5}, Lorg/greenrobot/greendao/AbstractDao;->queryRaw(Ljava/lang/String;[Ljava/lang/String;)Ljava/util/List;

    move-result-object v1

    .line 228
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    invoke-static {v4, v2}, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->assertEquals(II)V

    .line 229
    iget-object v2, p0, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->daoAccess:Lorg/greenrobot/greendao/InternalUnitTestDaoAccess;

    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v2, v1}, Lorg/greenrobot/greendao/InternalUnitTestDaoAccess;->getKey(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-static {v0, v1}, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->assertEquals(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 230
    return-void
.end method

.method public testReadWithOffset()V
    .locals 4

    .line 241
    invoke-virtual {p0}, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->nextPk()Ljava/lang/Object;

    move-result-object v0

    .line 242
    invoke-virtual {p0, v0}, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->createEntity(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 243
    iget-object v2, p0, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->dao:Lorg/greenrobot/greendao/AbstractDao;

    invoke-virtual {v2, v1}, Lorg/greenrobot/greendao/AbstractDao;->insert(Ljava/lang/Object;)J

    .line 245
    const-string v1, "42"

    const/4 v2, 0x5

    invoke-virtual {p0, v2, v1, v0}, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->queryWithDummyColumnsInFront(ILjava/lang/String;Ljava/lang/Object;)Landroid/database/Cursor;

    move-result-object v1

    .line 247
    :try_start_0
    iget-object v3, p0, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->daoAccess:Lorg/greenrobot/greendao/InternalUnitTestDaoAccess;

    invoke-virtual {v3, v1, v2}, Lorg/greenrobot/greendao/InternalUnitTestDaoAccess;->readEntity(Landroid/database/Cursor;I)Ljava/lang/Object;

    move-result-object v2

    .line 248
    iget-object v3, p0, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->daoAccess:Lorg/greenrobot/greendao/InternalUnitTestDaoAccess;

    invoke-virtual {v3, v2}, Lorg/greenrobot/greendao/InternalUnitTestDaoAccess;->getKey(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-static {v0, v2}, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->assertEquals(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 250
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 251
    nop

    .line 252
    return-void

    .line 250
    :catchall_0
    move-exception v0

    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    throw v0
.end method

.method public testRowId()V
    .locals 4

    .line 201
    invoke-virtual {p0}, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->createEntityWithRandomPk()Ljava/lang/Object;

    move-result-object v0

    .line 202
    invoke-virtual {p0}, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->createEntityWithRandomPk()Ljava/lang/Object;

    move-result-object v1

    .line 203
    iget-object v2, p0, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->dao:Lorg/greenrobot/greendao/AbstractDao;

    invoke-virtual {v2, v0}, Lorg/greenrobot/greendao/AbstractDao;->insert(Ljava/lang/Object;)J

    move-result-wide v2

    .line 204
    iget-object v0, p0, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->dao:Lorg/greenrobot/greendao/AbstractDao;

    invoke-virtual {v0, v1}, Lorg/greenrobot/greendao/AbstractDao;->insert(Ljava/lang/Object;)J

    move-result-wide v0

    .line 205
    cmp-long v0, v2, v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    invoke-static {v0}, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->assertTrue(Z)V

    .line 206
    return-void
.end method

.method public testSave()V
    .locals 4

    .line 263
    invoke-virtual {p0}, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->checkKeyIsNullable()Z

    move-result v0

    if-nez v0, :cond_0

    .line 264
    return-void

    .line 266
    :cond_0
    iget-object v0, p0, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->dao:Lorg/greenrobot/greendao/AbstractDao;

    invoke-virtual {v0}, Lorg/greenrobot/greendao/AbstractDao;->deleteAll()V

    .line 267
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->createEntity(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 268
    if-eqz v0, :cond_1

    .line 269
    iget-object v1, p0, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->dao:Lorg/greenrobot/greendao/AbstractDao;

    invoke-virtual {v1, v0}, Lorg/greenrobot/greendao/AbstractDao;->save(Ljava/lang/Object;)V

    .line 270
    iget-object v1, p0, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->dao:Lorg/greenrobot/greendao/AbstractDao;

    invoke-virtual {v1, v0}, Lorg/greenrobot/greendao/AbstractDao;->save(Ljava/lang/Object;)V

    .line 271
    const-wide/16 v0, 0x1

    iget-object v2, p0, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->dao:Lorg/greenrobot/greendao/AbstractDao;

    invoke-virtual {v2}, Lorg/greenrobot/greendao/AbstractDao;->count()J

    move-result-wide v2

    invoke-static {v0, v1, v2, v3}, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->assertEquals(JJ)V

    .line 273
    :cond_1
    return-void
.end method

.method public testSaveInTx()V
    .locals 5

    .line 276
    invoke-virtual {p0}, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->checkKeyIsNullable()Z

    move-result v0

    if-nez v0, :cond_0

    .line 277
    return-void

    .line 279
    :cond_0
    iget-object v0, p0, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->dao:Lorg/greenrobot/greendao/AbstractDao;

    invoke-virtual {v0}, Lorg/greenrobot/greendao/AbstractDao;->deleteAll()V

    .line 280
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 281
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 282
    const/4 v2, 0x0

    :goto_0
    const/16 v3, 0x14

    if-ge v2, v3, :cond_2

    .line 283
    const/4 v3, 0x0

    invoke-virtual {p0, v3}, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->createEntity(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .line 284
    rem-int/lit8 v4, v2, 0x2

    if-nez v4, :cond_1

    .line 285
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 287
    :cond_1
    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 282
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 289
    :cond_2
    iget-object v2, p0, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->dao:Lorg/greenrobot/greendao/AbstractDao;

    invoke-virtual {v2, v0}, Lorg/greenrobot/greendao/AbstractDao;->saveInTx(Ljava/lang/Iterable;)V

    .line 290
    iget-object v0, p0, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->dao:Lorg/greenrobot/greendao/AbstractDao;

    invoke-virtual {v0, v1}, Lorg/greenrobot/greendao/AbstractDao;->saveInTx(Ljava/lang/Iterable;)V

    .line 291
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v0

    int-to-long v0, v0

    iget-object v2, p0, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->dao:Lorg/greenrobot/greendao/AbstractDao;

    invoke-virtual {v2}, Lorg/greenrobot/greendao/AbstractDao;->count()J

    move-result-wide v2

    invoke-static {v0, v1, v2, v3}, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->assertEquals(JJ)V

    .line 292
    return-void
.end method

.method public testUpdate()V
    .locals 4

    .line 233
    iget-object v0, p0, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->dao:Lorg/greenrobot/greendao/AbstractDao;

    invoke-virtual {v0}, Lorg/greenrobot/greendao/AbstractDao;->deleteAll()V

    .line 234
    invoke-virtual {p0}, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->createEntityWithRandomPk()Ljava/lang/Object;

    move-result-object v0

    .line 235
    iget-object v1, p0, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->dao:Lorg/greenrobot/greendao/AbstractDao;

    invoke-virtual {v1, v0}, Lorg/greenrobot/greendao/AbstractDao;->insert(Ljava/lang/Object;)J

    .line 236
    iget-object v1, p0, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->dao:Lorg/greenrobot/greendao/AbstractDao;

    invoke-virtual {v1, v0}, Lorg/greenrobot/greendao/AbstractDao;->update(Ljava/lang/Object;)V

    .line 237
    iget-object v0, p0, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->dao:Lorg/greenrobot/greendao/AbstractDao;

    invoke-virtual {v0}, Lorg/greenrobot/greendao/AbstractDao;->count()J

    move-result-wide v0

    const-wide/16 v2, 0x1

    invoke-static {v2, v3, v0, v1}, Lorg/greenrobot/greendao/test/AbstractDaoTestSinglePk;->assertEquals(JJ)V

    .line 238
    return-void
.end method
