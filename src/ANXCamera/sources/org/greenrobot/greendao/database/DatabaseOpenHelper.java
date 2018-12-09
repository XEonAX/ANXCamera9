package org.greenrobot.greendao.database;

import android.content.Context;
import android.database.sqlite.SQLiteDatabase.CursorFactory;
import android.database.sqlite.SQLiteOpenHelper;
import net.sqlcipher.database.SQLiteDatabase;

public abstract class DatabaseOpenHelper extends SQLiteOpenHelper {
    private final Context context;
    private EncryptedHelper encryptedHelper;
    private boolean loadSQLCipherNativeLibs;
    private final String name;
    private final int version;

    private class EncryptedHelper extends net.sqlcipher.database.SQLiteOpenHelper {
        public EncryptedHelper(Context context, String str, int i, boolean z) {
            super(context, str, null, i);
            if (z) {
                SQLiteDatabase.loadLibs(context);
            }
        }

        public void onCreate(SQLiteDatabase sQLiteDatabase) {
            DatabaseOpenHelper.this.onCreate(wrap(sQLiteDatabase));
        }

        public void onUpgrade(SQLiteDatabase sQLiteDatabase, int i, int i2) {
            DatabaseOpenHelper.this.onUpgrade(wrap(sQLiteDatabase), i, i2);
        }

        public void onOpen(SQLiteDatabase sQLiteDatabase) {
            DatabaseOpenHelper.this.onOpen(wrap(sQLiteDatabase));
        }

        protected Database wrap(SQLiteDatabase sQLiteDatabase) {
            return new EncryptedDatabase(sQLiteDatabase);
        }
    }

    public DatabaseOpenHelper(Context context, String str, int i) {
        this(context, str, null, i);
    }

    public DatabaseOpenHelper(Context context, String str, CursorFactory cursorFactory, int i) {
        super(context, str, cursorFactory, i);
        this.loadSQLCipherNativeLibs = true;
        this.context = context;
        this.name = str;
        this.version = i;
    }

    public void setLoadSQLCipherNativeLibs(boolean z) {
        this.loadSQLCipherNativeLibs = z;
    }

    public Database getWritableDb() {
        return wrap(getWritableDatabase());
    }

    public Database getReadableDb() {
        return wrap(getReadableDatabase());
    }

    protected Database wrap(android.database.sqlite.SQLiteDatabase sQLiteDatabase) {
        return new StandardDatabase(sQLiteDatabase);
    }

    public void onCreate(android.database.sqlite.SQLiteDatabase sQLiteDatabase) {
        onCreate(wrap(sQLiteDatabase));
    }

    public void onCreate(Database database) {
    }

    public void onUpgrade(android.database.sqlite.SQLiteDatabase sQLiteDatabase, int i, int i2) {
        onUpgrade(wrap(sQLiteDatabase), i, i2);
    }

    public void onUpgrade(Database database, int i, int i2) {
    }

    public void onOpen(android.database.sqlite.SQLiteDatabase sQLiteDatabase) {
        onOpen(wrap(sQLiteDatabase));
    }

    public void onOpen(Database database) {
    }

    private EncryptedHelper checkEncryptedHelper() {
        if (this.encryptedHelper == null) {
            this.encryptedHelper = new EncryptedHelper(this.context, this.name, this.version, this.loadSQLCipherNativeLibs);
        }
        return this.encryptedHelper;
    }

    public Database getEncryptedWritableDb(String str) {
        EncryptedHelper checkEncryptedHelper = checkEncryptedHelper();
        return checkEncryptedHelper.wrap(checkEncryptedHelper.getWritableDatabase(str));
    }

    public Database getEncryptedWritableDb(char[] cArr) {
        EncryptedHelper checkEncryptedHelper = checkEncryptedHelper();
        return checkEncryptedHelper.wrap(checkEncryptedHelper.getWritableDatabase(cArr));
    }

    public Database getEncryptedReadableDb(String str) {
        EncryptedHelper checkEncryptedHelper = checkEncryptedHelper();
        return checkEncryptedHelper.wrap(checkEncryptedHelper.getReadableDatabase(str));
    }

    public Database getEncryptedReadableDb(char[] cArr) {
        EncryptedHelper checkEncryptedHelper = checkEncryptedHelper();
        return checkEncryptedHelper.wrap(checkEncryptedHelper.getReadableDatabase(cArr));
    }
}
