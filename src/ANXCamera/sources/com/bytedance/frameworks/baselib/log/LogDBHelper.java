package com.bytedance.frameworks.baselib.log;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.text.TextUtils;

class LogDBHelper {
    static final String COL_ID = "_id";
    static final String COL_RETRY_COUNT = "retry_count";
    static final String COL_RETRY_TIME = "retry_time";
    static final String COL_TIMESTAMP = "timestamp";
    static final String COL_TYPE = "type";
    static final String COL_VALUE = "value";
    static final String DB_NAME = "lib_log_queue.db";
    static final int DB_VERSION = 1;
    static final String[] QUEUE_COLS = new String[]{COL_ID, COL_VALUE, "type", COL_TIMESTAMP, COL_RETRY_COUNT, COL_RETRY_TIME};
    static final String TABLE_QUEUE = "queue";
    static final String createTableQueue = "CREATE TABLE queue ( _id INTEGER PRIMARY KEY AUTOINCREMENT, value BLOB, type TEXT, timestamp INTEGER, retry_count INTEGER, retry_time INTEGER )";
    private static LogDBHelper sInstance = null;
    private static final String whereId = "_id = ?";
    private SQLiteDatabase mDb;

    private static class OpenHelper extends SQLiteOpenHelper {
        public OpenHelper(Context context) {
            super(context, LogDBHelper.DB_NAME, null, 1);
        }

        public void onCreate(SQLiteDatabase sQLiteDatabase) {
            try {
                sQLiteDatabase.execSQL(LogDBHelper.createTableQueue);
            } catch (Exception e) {
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("create db exception ");
                stringBuilder.append(e);
                LogQueue.log(stringBuilder.toString());
            }
        }

        public void onUpgrade(SQLiteDatabase sQLiteDatabase, int i, int i2) {
        }
    }

    static LogDBHelper getInstance(Context context) {
        if (sInstance == null) {
            synchronized (LogDBHelper.class) {
                if (sInstance == null) {
                    sInstance = new LogDBHelper(context);
                }
            }
        }
        return sInstance;
    }

    private LogDBHelper(Context context) {
        if (context != null) {
            try {
                this.mDb = new OpenHelper(context.getApplicationContext()).getWritableDatabase();
            } catch (Throwable th) {
            }
        }
    }

    synchronized boolean isOpen() {
        if (this.mDb != null && this.mDb.isOpen()) {
            return true;
        }
        LogQueue.log("db not establish and open");
        return false;
    }

    synchronized long getEventCount(String str) {
        Throwable th;
        long j = 0;
        if (!isOpen()) {
            return 0;
        }
        Cursor cursor = null;
        try {
            String str2 = "select count(*) from queue";
            if (!TextUtils.isEmpty(str)) {
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append(str2);
                stringBuilder.append(" ");
                stringBuilder.append(str);
                str2 = stringBuilder.toString();
            }
            Cursor rawQuery = this.mDb.rawQuery(str2, null);
            try {
                if (rawQuery.moveToNext()) {
                    j = rawQuery.getLong(0);
                }
                safeCloseCursor(rawQuery);
            } catch (Throwable th2) {
                Throwable th3 = th2;
                cursor = rawQuery;
                th = th3;
                safeCloseCursor(cursor);
                throw th;
            }
        } catch (Throwable th4) {
            th = th4;
            safeCloseCursor(cursor);
            throw th;
        }
    }

    synchronized void closeDatabase() {
        try {
            if (isOpen()) {
                this.mDb.close();
                this.mDb = null;
            }
        } catch (Throwable th) {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("closeDatabase error: ");
            stringBuilder.append(th);
            LogQueue.log(stringBuilder.toString());
        }
        return;
    }

    synchronized long insertLog(String str, byte[] bArr) {
        if (!isOpen() || bArr == null || bArr.length <= 0) {
            return -1;
        }
        ContentValues contentValues = new ContentValues();
        contentValues.put(COL_VALUE, bArr);
        contentValues.put("type", str);
        contentValues.put(COL_TIMESTAMP, Long.valueOf(System.currentTimeMillis()));
        contentValues.put(COL_RETRY_COUNT, Integer.valueOf(0));
        contentValues.put(COL_RETRY_TIME, Long.valueOf(0));
        return this.mDb.insert(TABLE_QUEUE, null, contentValues);
    }

    synchronized void recreateTableQueue() {
        if (isOpen()) {
            try {
                this.mDb.execSQL("DROP TABLE IF EXISTS queue");
                this.mDb.execSQL(createTableQueue);
            } catch (Exception e) {
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("recreateTableQueue db exception ");
                stringBuilder.append(e);
                LogQueue.log(stringBuilder.toString());
            }
        } else {
            return;
        }
        return;
    }

    synchronized void cleanExpireLog(String str, int i, long j) {
        if (isOpen()) {
            String[] strArr;
            long currentTimeMillis = System.currentTimeMillis() - j;
            if (TextUtils.isEmpty(str)) {
                str = "timestamp <= ? ";
                strArr = new String[]{String.valueOf(currentTimeMillis)};
            } else {
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("(timestamp <= ? OR retry_count > ");
                stringBuilder.append(i);
                stringBuilder.append(") and ");
                stringBuilder.append("type");
                stringBuilder.append(" = ?");
                String stringBuilder2 = stringBuilder.toString();
                String[] strArr2 = new String[]{String.valueOf(currentTimeMillis), str};
                str = stringBuilder2;
                strArr = strArr2;
            }
            try {
                this.mDb.delete(TABLE_QUEUE, str, strArr);
            } catch (Exception e) {
                StringBuilder stringBuilder3 = new StringBuilder();
                stringBuilder3.append("delete expire log error:");
                stringBuilder3.append(e);
                LogQueue.log(stringBuilder3.toString());
            }
        } else {
            return;
        }
        return;
    }

    /* JADX WARNING: Removed duplicated region for block: B:19:0x0063 A:{Splitter: B:9:0x0028, ExcHandler: all (th java.lang.Throwable)} */
    /* JADX WARNING: Failed to process nested try/catch */
    /* JADX WARNING: Missing block: B:16:0x005d, code:
            r13 = e;
     */
    /* JADX WARNING: Missing block: B:19:0x0063, code:
            r13 = th;
     */
    /* JADX WARNING: Missing block: B:20:0x0064, code:
            r1 = r12;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    synchronized LogItem getLog(long j) {
        LogItem logItem;
        Object e;
        StringBuilder stringBuilder;
        Cursor cursor = null;
        if (!isOpen()) {
            return null;
        }
        LogItem logItem2;
        try {
            String[] strArr = new String[]{String.valueOf(j)};
            SQLiteDatabase sQLiteDatabase = this.mDb;
            String str = TABLE_QUEUE;
            String[] strArr2 = QUEUE_COLS;
            Cursor query = sQLiteDatabase.query(str, strArr2, "_id > ?", strArr, null, null, "_id ASC", "1");
            try {
                if (query.moveToNext()) {
                    logItem2 = new LogItem();
                    logItem2.id = query.getLong(0);
                    logItem2.value = query.getBlob(1);
                    logItem2.type = query.getString(2);
                    logItem2.timestamp = query.getLong(3);
                    logItem2.retry_count = query.getInt(4);
                    logItem2.retry_time = query.getLong(5);
                    logItem = logItem2;
                }
                safeCloseCursor(query);
            } catch (Exception e2) {
                e = e2;
                logItem2 = null;
                cursor = query;
                try {
                    stringBuilder = new StringBuilder();
                    stringBuilder.append("getLog exception ");
                    stringBuilder.append(e);
                    LogQueue.log(stringBuilder.toString());
                    safeCloseCursor(cursor);
                    logItem = logItem2;
                    return logItem;
                } catch (Throwable th) {
                    Throwable th2 = th;
                    safeCloseCursor(cursor);
                    throw th2;
                }
            } catch (Throwable th3) {
            }
        } catch (Exception e3) {
            e = e3;
            logItem2 = null;
            stringBuilder = new StringBuilder();
            stringBuilder.append("getLog exception ");
            stringBuilder.append(e);
            LogQueue.log(stringBuilder.toString());
            safeCloseCursor(cursor);
            logItem = logItem2;
            return logItem;
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:51:0x00cf A:{SKIP} */
    /* JADX WARNING: Removed duplicated region for block: B:44:0x00ae A:{SYNTHETIC, Splitter: B:44:0x00ae} */
    /* JADX WARNING: Removed duplicated region for block: B:44:0x00ae A:{SYNTHETIC, Splitter: B:44:0x00ae} */
    /* JADX WARNING: Removed duplicated region for block: B:51:0x00cf A:{SKIP} */
    /* JADX WARNING: Missing block: B:54:0x00d2, code:
            return false;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    synchronized boolean onLogSent(long j, boolean z, long j2, int i) {
        Object e;
        StringBuilder stringBuilder;
        Throwable th;
        long j3 = j;
        synchronized (this) {
            if (!isOpen() || j3 <= 0) {
            } else {
                boolean z2 = true;
                String[] strArr = new String[]{String.valueOf(j)};
                if (!z) {
                    Cursor cursor = null;
                    try {
                        Cursor query = this.mDb.query(TABLE_QUEUE, new String[]{COL_TIMESTAMP, COL_RETRY_COUNT}, whereId, strArr, null, null, null);
                        try {
                            if (query.moveToNext()) {
                                long j4 = query.getLong(0);
                                int i2 = query.getInt(1);
                                long currentTimeMillis = System.currentTimeMillis();
                                if (currentTimeMillis - j4 >= j2 || i2 >= i) {
                                    safeCloseCursor(query);
                                } else {
                                    ContentValues contentValues = new ContentValues();
                                    contentValues.put(COL_RETRY_COUNT, Integer.valueOf(i2 + 1));
                                    contentValues.put(COL_RETRY_TIME, Long.valueOf(currentTimeMillis));
                                    this.mDb.update(TABLE_QUEUE, contentValues, whereId, strArr);
                                    safeCloseCursor(query);
                                    return true;
                                }
                            }
                            safeCloseCursor(query);
                            return false;
                        } catch (Exception e2) {
                            e = e2;
                            cursor = query;
                            try {
                                stringBuilder = new StringBuilder();
                                stringBuilder.append("onLogSent exception: ");
                                stringBuilder.append(e);
                                LogQueue.log(stringBuilder.toString());
                                safeCloseCursor(cursor);
                                z2 = false;
                                if (z2) {
                                }
                            } catch (Throwable th2) {
                                th = th2;
                                query = cursor;
                                safeCloseCursor(query);
                                throw th;
                            }
                        } catch (Throwable th3) {
                            th = th3;
                            safeCloseCursor(query);
                            throw th;
                        }
                    } catch (Exception e3) {
                        e = e3;
                        stringBuilder = new StringBuilder();
                        stringBuilder.append("onLogSent exception: ");
                        stringBuilder.append(e);
                        LogQueue.log(stringBuilder.toString());
                        safeCloseCursor(cursor);
                        z2 = false;
                        if (z2) {
                        }
                    }
                }
                if (z2) {
                    try {
                        this.mDb.delete(TABLE_QUEUE, whereId, strArr);
                    } catch (Throwable th4) {
                    }
                    StringBuilder stringBuilder2 = new StringBuilder();
                    stringBuilder2.append("delete app_log: ");
                    stringBuilder2.append(j3);
                    LogQueue.log(stringBuilder2.toString());
                    return false;
                }
                return false;
            }
        }
    }

    static void safeCloseCursor(Cursor cursor) {
        if (cursor != null) {
            try {
                if (!cursor.isClosed()) {
                    cursor.close();
                }
            } catch (Exception e) {
            }
        }
    }
}
