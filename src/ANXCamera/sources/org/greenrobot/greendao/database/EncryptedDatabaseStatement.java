package org.greenrobot.greendao.database;

import net.sqlcipher.database.SQLiteStatement;

public class EncryptedDatabaseStatement implements DatabaseStatement {
    private final SQLiteStatement delegate;

    public EncryptedDatabaseStatement(SQLiteStatement sQLiteStatement) {
        this.delegate = sQLiteStatement;
    }

    public void execute() {
        this.delegate.execute();
    }

    public long simpleQueryForLong() {
        return this.delegate.simpleQueryForLong();
    }

    public void bindNull(int i) {
        this.delegate.bindNull(i);
    }

    public long executeInsert() {
        return this.delegate.executeInsert();
    }

    public void bindString(int i, String str) {
        this.delegate.bindString(i, str);
    }

    public void bindBlob(int i, byte[] bArr) {
        this.delegate.bindBlob(i, bArr);
    }

    public void bindLong(int i, long j) {
        this.delegate.bindLong(i, j);
    }

    public void clearBindings() {
        this.delegate.clearBindings();
    }

    public void bindDouble(int i, double d) {
        this.delegate.bindDouble(i, d);
    }

    public void close() {
        this.delegate.close();
    }

    public Object getRawStatement() {
        return this.delegate;
    }
}
