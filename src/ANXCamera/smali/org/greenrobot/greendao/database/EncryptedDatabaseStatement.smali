.class public Lorg/greenrobot/greendao/database/EncryptedDatabaseStatement;
.super Ljava/lang/Object;
.source "EncryptedDatabaseStatement.java"

# interfaces
.implements Lorg/greenrobot/greendao/database/DatabaseStatement;


# instance fields
.field private final delegate:Lnet/sqlcipher/database/SQLiteStatement;


# direct methods
.method public constructor <init>(Lnet/sqlcipher/database/SQLiteStatement;)V
    .locals 0

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    iput-object p1, p0, Lorg/greenrobot/greendao/database/EncryptedDatabaseStatement;->delegate:Lnet/sqlcipher/database/SQLiteStatement;

    .line 27
    return-void
.end method


# virtual methods
.method public bindBlob(I[B)V
    .locals 1

    .line 56
    iget-object v0, p0, Lorg/greenrobot/greendao/database/EncryptedDatabaseStatement;->delegate:Lnet/sqlcipher/database/SQLiteStatement;

    invoke-virtual {v0, p1, p2}, Lnet/sqlcipher/database/SQLiteStatement;->bindBlob(I[B)V

    .line 57
    return-void
.end method

.method public bindDouble(ID)V
    .locals 1

    .line 71
    iget-object v0, p0, Lorg/greenrobot/greendao/database/EncryptedDatabaseStatement;->delegate:Lnet/sqlcipher/database/SQLiteStatement;

    invoke-virtual {v0, p1, p2, p3}, Lnet/sqlcipher/database/SQLiteStatement;->bindDouble(ID)V

    .line 72
    return-void
.end method

.method public bindLong(IJ)V
    .locals 1

    .line 61
    iget-object v0, p0, Lorg/greenrobot/greendao/database/EncryptedDatabaseStatement;->delegate:Lnet/sqlcipher/database/SQLiteStatement;

    invoke-virtual {v0, p1, p2, p3}, Lnet/sqlcipher/database/SQLiteStatement;->bindLong(IJ)V

    .line 62
    return-void
.end method

.method public bindNull(I)V
    .locals 1

    .line 41
    iget-object v0, p0, Lorg/greenrobot/greendao/database/EncryptedDatabaseStatement;->delegate:Lnet/sqlcipher/database/SQLiteStatement;

    invoke-virtual {v0, p1}, Lnet/sqlcipher/database/SQLiteStatement;->bindNull(I)V

    .line 42
    return-void
.end method

.method public bindString(ILjava/lang/String;)V
    .locals 1

    .line 51
    iget-object v0, p0, Lorg/greenrobot/greendao/database/EncryptedDatabaseStatement;->delegate:Lnet/sqlcipher/database/SQLiteStatement;

    invoke-virtual {v0, p1, p2}, Lnet/sqlcipher/database/SQLiteStatement;->bindString(ILjava/lang/String;)V

    .line 52
    return-void
.end method

.method public clearBindings()V
    .locals 1

    .line 66
    iget-object v0, p0, Lorg/greenrobot/greendao/database/EncryptedDatabaseStatement;->delegate:Lnet/sqlcipher/database/SQLiteStatement;

    invoke-virtual {v0}, Lnet/sqlcipher/database/SQLiteStatement;->clearBindings()V

    .line 67
    return-void
.end method

.method public close()V
    .locals 1

    .line 76
    iget-object v0, p0, Lorg/greenrobot/greendao/database/EncryptedDatabaseStatement;->delegate:Lnet/sqlcipher/database/SQLiteStatement;

    invoke-virtual {v0}, Lnet/sqlcipher/database/SQLiteStatement;->close()V

    .line 77
    return-void
.end method

.method public execute()V
    .locals 1

    .line 31
    iget-object v0, p0, Lorg/greenrobot/greendao/database/EncryptedDatabaseStatement;->delegate:Lnet/sqlcipher/database/SQLiteStatement;

    invoke-virtual {v0}, Lnet/sqlcipher/database/SQLiteStatement;->execute()V

    .line 32
    return-void
.end method

.method public executeInsert()J
    .locals 2

    .line 46
    iget-object v0, p0, Lorg/greenrobot/greendao/database/EncryptedDatabaseStatement;->delegate:Lnet/sqlcipher/database/SQLiteStatement;

    invoke-virtual {v0}, Lnet/sqlcipher/database/SQLiteStatement;->executeInsert()J

    move-result-wide v0

    return-wide v0
.end method

.method public getRawStatement()Ljava/lang/Object;
    .locals 1

    .line 81
    iget-object v0, p0, Lorg/greenrobot/greendao/database/EncryptedDatabaseStatement;->delegate:Lnet/sqlcipher/database/SQLiteStatement;

    return-object v0
.end method

.method public simpleQueryForLong()J
    .locals 2

    .line 36
    iget-object v0, p0, Lorg/greenrobot/greendao/database/EncryptedDatabaseStatement;->delegate:Lnet/sqlcipher/database/SQLiteStatement;

    invoke-virtual {v0}, Lnet/sqlcipher/database/SQLiteStatement;->simpleQueryForLong()J

    move-result-wide v0

    return-wide v0
.end method
