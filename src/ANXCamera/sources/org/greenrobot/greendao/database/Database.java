package org.greenrobot.greendao.database;

import android.database.Cursor;
import android.database.SQLException;

public interface Database {
    void beginTransaction();

    void close();

    DatabaseStatement compileStatement(String str);

    void endTransaction();

    void execSQL(String str) throws SQLException;

    void execSQL(String str, Object[] objArr) throws SQLException;

    Object getRawDatabase();

    boolean inTransaction();

    boolean isDbLockedByCurrentThread();

    Cursor rawQuery(String str, String[] strArr);

    void setTransactionSuccessful();
}
