package com.bytedance.frameworks.core.monitor;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteStatement;
import android.text.TextUtils;
import android.util.Log;
import com.bytedance.frameworks.core.monitor.config.MonitorConfigure;
import com.bytedance.frameworks.core.monitor.model.LocalLog;
import com.bytedance.frameworks.core.monitor.model.LocalVersionInfo;
import java.io.File;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;

public class LogStoreManager {
    static final String[] LOCAL_MONITOR_COLS = new String[]{"_id", DBHelper.COL_VERSION_ID, "data"};
    static final String[] LOCAL_VERSION_COLS = new String[]{"_id", "version_code", DBHelper.COL_VERSION_NAME, DBHelper.COL_MANIFEST_VERSION_CODE, DBHelper.COL_UPDATE_VERSION_CODE};
    private static final String ORDER_BY_ID_ASC = "_id ASC ";
    static final String[] SAMPLE_LOG_COLS = new String[]{"_id", "type", DBHelper.COL_VERSION_ID, "data"};
    private static String SQL_GET_SAMPLED_COUNT = "SELECT count(*) from local_monitor_log WHERE is_sampled = 1";
    private static String SQL_GET_TOTAL_COUNT = "SELECT count(*) FROM local_monitor_log";
    private static final String TAG = "LogStoreManager";
    static final int WEED_OUT_ROWS_SINGLE_TIME = 1000;
    private static final Object mLock = new Object();
    private static HashMap<String, LogStoreManager> sLogStoreManagerMap = new HashMap();
    static long sMaxLogSaveCount = 40000;
    private String mAid;
    private SQLiteDatabase mDb;
    private volatile long totalRowCount = -1;

    public LogStoreManager(Context context, String str) {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("LogStoreManager: ");
        stringBuilder.append(str);
        stringBuilder.append(" , threadName: ");
        stringBuilder.append(Thread.currentThread().getName());
        Log.d("monitorlib", stringBuilder.toString());
        try {
            DBHelper dBHelper = new DBHelper(context, str);
            this.mAid = str;
            this.mDb = dBHelper.getWritableDatabase();
        } catch (Throwable th) {
            Log.i(TAG, "monitor DB build failed");
        }
    }

    public String getAid() {
        return this.mAid;
    }

    public int getDBSizeInMB() {
        File file = new File(this.mDb.getPath());
        if (file.exists()) {
            return (int) ((file.length() / 1024) / 1024);
        }
        return -1;
    }

    public int getDBJournalSizeInKB() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(this.mDb.getPath());
        stringBuilder.append("-journal");
        File file = new File(stringBuilder.toString());
        if (file.exists()) {
            return ((int) file.length()) / 1024;
        }
        return -1;
    }

    /* JADX WARNING: Missing block: B:12:0x005d, code:
            return r5;
     */
    /* JADX WARNING: Missing block: B:17:0x0062, code:
            return -1;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    protected synchronized long insertLocalLog(LocalLog localLog) {
        if (this.mDb != null && localLog != null) {
            try {
                weedOutLogIfNeed(1);
                ContentValues contentValues = new ContentValues();
                contentValues.put("type", localLog.type);
                contentValues.put(DBHelper.COL_TYPE2, localLog.type2);
                contentValues.put(DBHelper.COL_CREATE_TIME, Long.valueOf(localLog.createTime));
                contentValues.put(DBHelper.COL_VERSION_ID, Long.valueOf(localLog.versionId));
                contentValues.put("data", localLog.data);
                contentValues.put(DBHelper.COL_SAMPLED, Integer.valueOf(localLog.isSampled));
                long insert = this.mDb.insert("local_monitor_log", null, contentValues);
                if (insert != -1) {
                    this.totalRowCount++;
                }
            } catch (Exception e) {
                return -1;
            }
        }
    }

    /* JADX WARNING: Missing block: B:46:0x00a7, code:
            return;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    protected synchronized void insertLocalLogBatch(List<LocalLog> list) {
        if (this.mDb != null && list != null && list.size() != 0) {
            weedOutLogIfNeed((long) list.size());
            this.mDb.beginTransaction();
            try {
                SQLiteStatement compileStatement = this.mDb.compileStatement("INSERT INTO local_monitor_log(type, type2, create_time, version_id, data, is_sampled) VALUES ( ?, ?, ?, ?, ?, ?)");
                for (LocalLog localLog : list) {
                    compileStatement.bindString(1, localLog.type == null ? "" : localLog.type);
                    compileStatement.bindString(2, localLog.type2 == null ? "" : localLog.type2);
                    compileStatement.bindLong(3, localLog.createTime);
                    compileStatement.bindLong(4, localLog.versionId);
                    compileStatement.bindString(5, localLog.data == null ? "" : localLog.data);
                    compileStatement.bindLong(6, localLog.isSampled ? 1 : 0);
                    compileStatement.executeInsert();
                }
                this.mDb.setTransactionSuccessful();
                this.totalRowCount += (long) list.size();
                try {
                    this.mDb.endTransaction();
                } catch (Exception e) {
                }
            } catch (Exception e2) {
                try {
                    e2.printStackTrace();
                } finally {
                    try {
                        this.mDb.endTransaction();
                    } catch (Exception e3) {
                    }
                }
            }
        }
    }

    public synchronized List<LocalLog> getLocalLog(long j, long j2, List<String> list, String str) {
        Throwable th;
        StringBuilder stringBuilder;
        List<String> list2 = list;
        synchronized (this) {
            List<LocalLog> emptyList;
            if (this.mDb == null) {
                emptyList = Collections.emptyList();
                return emptyList;
            }
            Cursor cursor = null;
            String str2;
            try {
                String[] strArr;
                str2 = "create_time >=? AND create_time <=? ";
                if (list2 == null || list.size() <= 0) {
                    strArr = new String[]{String.valueOf(j), String.valueOf(j2)};
                } else {
                    StringBuilder stringBuilder2 = new StringBuilder();
                    stringBuilder2.append(str2);
                    stringBuilder2.append(" AND type2 IN ( ");
                    stringBuilder2.append(TextUtils.join(",", Collections.nCopies(list.size(), "?")));
                    stringBuilder2.append(" )");
                    str2 = stringBuilder2.toString();
                    strArr = new String[(list.size() + 2)];
                    strArr[0] = String.valueOf(j);
                    strArr[1] = String.valueOf(j2);
                    for (int i = 0; i < list.size(); i++) {
                        strArr[i + 2] = (String) list2.get(i);
                    }
                }
                Cursor query = this.mDb.query("local_monitor_log", LOCAL_MONITOR_COLS, str2, strArr, null, null, ORDER_BY_ID_ASC, str);
                try {
                    if (query.getCount() == 0) {
                        emptyList = Collections.emptyList();
                        safeCloseCursor(query);
                        return emptyList;
                    }
                    List linkedList = new LinkedList();
                    while (query.moveToNext()) {
                        long j3 = query.getLong(0);
                        long j4 = query.getLong(1);
                        linkedList.add(new LocalLog().setVersionId(j4).setData(query.getString(2)).setId(j3));
                    }
                    safeCloseCursor(query);
                    return linkedList;
                } catch (Throwable th2) {
                    th = th2;
                    cursor = query;
                    safeCloseCursor(cursor);
                    throw th;
                }
            } catch (Throwable th3) {
                th = th3;
                str2 = TAG;
                stringBuilder = new StringBuilder();
                stringBuilder.append("obtain monitor logs failed:");
                stringBuilder.append(th.toString());
                Log.e(str2, stringBuilder.toString());
                safeCloseCursor(cursor);
                emptyList = Collections.emptyList();
                return emptyList;
            }
        }
    }

    public synchronized List<LocalLog> getLogSampled(List<String> list, int i) {
        Throwable th;
        StringBuilder stringBuilder;
        List<String> list2 = list;
        synchronized (this) {
            List<LocalLog> emptyList;
            if (this.mDb == null) {
                emptyList = Collections.emptyList();
                return emptyList;
            }
            Cursor cursor = null;
            String str;
            try {
                String[] strArr;
                str = "is_sampled = ? ";
                if (list2 == null || list.size() <= 0) {
                    strArr = new String[]{String.valueOf(1)};
                } else {
                    StringBuilder stringBuilder2 = new StringBuilder();
                    stringBuilder2.append(str);
                    stringBuilder2.append(" AND type IN ( ");
                    stringBuilder2.append(TextUtils.join(",", Collections.nCopies(list.size(), "?")));
                    stringBuilder2.append(" ) ");
                    str = stringBuilder2.toString();
                    strArr = new String[(list.size() + 1)];
                    strArr[0] = String.valueOf(1);
                    int i2 = 0;
                    while (i2 < list.size()) {
                        int i3 = i2 + 1;
                        strArr[i3] = (String) list2.get(i2);
                        i2 = i3;
                    }
                }
                String str2 = str;
                String[] strArr2 = strArr;
                String[] strArr3 = SAMPLE_LOG_COLS;
                String str3 = ORDER_BY_ID_ASC;
                StringBuilder stringBuilder3 = new StringBuilder();
                stringBuilder3.append(i);
                stringBuilder3.append("");
                Cursor query = this.mDb.query("local_monitor_log", strArr3, str2, strArr2, null, null, str3, stringBuilder3.toString());
                try {
                    if (query.getCount() == 0) {
                        emptyList = Collections.emptyList();
                        safeCloseCursor(query);
                        return emptyList;
                    }
                    List linkedList = new LinkedList();
                    while (query.moveToNext()) {
                        linkedList.add(new LocalLog(query.getLong(0), query.getString(1), query.getLong(2), query.getString(3)));
                    }
                    safeCloseCursor(query);
                    return linkedList;
                } catch (Throwable th2) {
                    th = th2;
                    cursor = query;
                    safeCloseCursor(cursor);
                    throw th;
                }
            } catch (Throwable th3) {
                th = th3;
                th.printStackTrace();
                str = TAG;
                stringBuilder = new StringBuilder();
                stringBuilder.append("obtain monitor logs failed:");
                stringBuilder.append(th.toString());
                Log.e(str, stringBuilder.toString());
                safeCloseCursor(cursor);
                emptyList = Collections.emptyList();
                return emptyList;
            }
        }
    }

    /* JADX WARNING: Missing block: B:28:0x003f, code:
            return -1;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    synchronized long getLogSampledCount() {
        Throwable th;
        long j = -1;
        if (this.mDb != null && this.mDb.isOpen()) {
            Cursor cursor = null;
            try {
                Cursor rawQuery = this.mDb.rawQuery(SQL_GET_SAMPLED_COUNT, null);
                try {
                    if (rawQuery.moveToNext()) {
                        j = rawQuery.getLong(0);
                    }
                    safeCloseCursor(rawQuery);
                } catch (Exception e) {
                    cursor = rawQuery;
                    safeCloseCursor(cursor);
                    return j;
                } catch (Throwable th2) {
                    th = th2;
                    cursor = rawQuery;
                    safeCloseCursor(cursor);
                    throw th;
                }
            } catch (Exception e2) {
                safeCloseCursor(cursor);
                return j;
            } catch (Throwable th3) {
                th = th3;
                safeCloseCursor(cursor);
                throw th;
            }
        }
    }

    /* JADX WARNING: Missing block: B:31:0x004f, code:
            return -1;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public synchronized long getLogCountInTime(long j, long j2) {
        Throwable th;
        if (this.mDb != null && this.mDb.isOpen()) {
            Cursor cursor = null;
            try {
                String[] strArr = new String[]{String.valueOf(j), String.valueOf(j2)};
                Cursor rawQuery = this.mDb.rawQuery("SELECT count(*) FROM local_monitor_log WHERE create_time >= ? AND create_time <= ?", strArr);
                try {
                    long j3;
                    if (rawQuery.moveToNext()) {
                        j3 = rawQuery.getLong(0);
                    } else {
                        j3 = -1;
                    }
                    safeCloseCursor(rawQuery);
                    return j3;
                } catch (Exception e) {
                    cursor = rawQuery;
                    safeCloseCursor(cursor);
                    return -1;
                } catch (Throwable th2) {
                    th = th2;
                    cursor = rawQuery;
                    safeCloseCursor(cursor);
                    throw th;
                }
            } catch (Exception e2) {
                safeCloseCursor(cursor);
                return -1;
            } catch (Throwable th3) {
                th = th3;
                safeCloseCursor(cursor);
                throw th;
            }
        }
    }

    /* JADX WARNING: Missing block: B:31:0x0040, code:
            return -1;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public synchronized long getLogTotalCount() {
        Throwable th;
        long j = -1;
        if (this.mDb != null && this.mDb.isOpen()) {
            Cursor cursor = null;
            try {
                Cursor rawQuery = this.mDb.rawQuery(SQL_GET_TOTAL_COUNT, null);
                try {
                    if (rawQuery.moveToNext()) {
                        j = rawQuery.getLong(0);
                    }
                    safeCloseCursor(rawQuery);
                    return j;
                } catch (Exception e) {
                    cursor = rawQuery;
                    safeCloseCursor(cursor);
                    return -1;
                } catch (Throwable th2) {
                    th = th2;
                    cursor = rawQuery;
                    safeCloseCursor(cursor);
                    throw th;
                }
            } catch (Exception e2) {
                safeCloseCursor(cursor);
                return -1;
            } catch (Throwable th3) {
                th = th3;
                safeCloseCursor(cursor);
                throw th;
            }
        }
    }

    private synchronized void weedOutLogIfNeed(long j) {
        if (this.totalRowCount <= 0) {
            this.totalRowCount = getLogTotalCount();
        }
        if (this.totalRowCount + j >= sMaxLogSaveCount) {
            weedOutOldLogs(1000);
        }
    }

    /* JADX WARNING: Missing block: B:14:0x0037, code:
            return;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public synchronized void weedOutOldLogs(long j) {
        if (this.mDb != null && j > 0) {
            try {
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append(" DELETE FROM local_monitor_log WHERE _id IN (SELECT _id FROM local_monitor_log ORDER BY _id ASC LIMIT ");
                stringBuilder.append(j);
                stringBuilder.append(")");
                this.mDb.execSQL(stringBuilder.toString());
                this.totalRowCount -= j;
                weedOutVersionTableIfNeed();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return;
    }

    /* JADX WARNING: Missing block: B:14:0x0027, code:
            return;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public synchronized void cleanExpiredLog(long j) {
        if (this.mDb != null && j >= 0) {
            try {
                String[] strArr = new String[]{String.valueOf(j)};
                this.mDb.delete("local_monitor_log", "create_time< ? ", strArr);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return;
    }

    /* JADX WARNING: Missing block: B:13:0x002e, code:
            return;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private synchronized void weedOutVersionTableIfNeed() {
        if (this.mDb != null) {
            Cursor query = this.mDb.query("local_monitor_log", new String[]{DBHelper.COL_VERSION_ID}, null, null, null, null, ORDER_BY_ID_ASC, "1");
            if (query != null && query.moveToNext()) {
                weedOutVersionTable(query.getLong(0));
            }
        }
    }

    /* JADX WARNING: Missing block: B:12:0x0024, code:
            return;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public synchronized void weedOutVersionTable(long j) {
        if (this.mDb != null && j >= 0) {
            try {
                String[] strArr = new String[]{String.valueOf(j)};
                this.mDb.delete("local_monitor_version", "_id< ? ", strArr);
            } catch (Exception e) {
            }
        }
    }

    private synchronized void closeDatabase() {
        try {
            if (this.mDb != null && this.mDb.isOpen()) {
                this.mDb.close();
                this.mDb = null;
            }
        } catch (Throwable th) {
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("mDb close error:");
            stringBuilder.append(th);
            Log.e(str, stringBuilder.toString());
        }
        return;
    }

    public void closeDB() {
        synchronized (mLock) {
            closeDatabase();
        }
    }

    protected static void safeCloseCursor(Cursor cursor) {
        if (cursor != null) {
            try {
                if (!cursor.isClosed()) {
                    cursor.close();
                }
            } catch (Exception e) {
                String str = TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("cursor close error:");
                stringBuilder.append(e);
                Log.e(str, stringBuilder.toString());
            }
        }
    }

    public synchronized long saveLocalVersion(String str, String str2, String str3, String str4) {
        if (this.mDb == null) {
            return -1;
        }
        try {
            ContentValues contentValues = new ContentValues();
            contentValues.put("version_code", str);
            contentValues.put(DBHelper.COL_VERSION_NAME, str2);
            contentValues.put(DBHelper.COL_MANIFEST_VERSION_CODE, str3);
            contentValues.put(DBHelper.COL_UPDATE_VERSION_CODE, str4);
            return this.mDb.insert("local_monitor_version", null, contentValues);
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
    }

    public synchronized long saveLocalVersion(LocalVersionInfo localVersionInfo) {
        if (this.mDb == null || localVersionInfo == null) {
            return -1;
        }
        return saveLocalVersion(localVersionInfo.versionCode, localVersionInfo.versionName, localVersionInfo.manifestVersionCode, localVersionInfo.updateVersionCode);
    }

    /* JADX WARNING: Missing block: B:15:0x0032, code:
            return -1;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public synchronized int deleteLocalLogByIds(String str) {
        int i;
        i = -1;
        if (this.mDb != null && !TextUtils.isEmpty(str)) {
            try {
                SQLiteDatabase sQLiteDatabase = this.mDb;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("delete from local_monitor_log where _id in ( ");
                stringBuilder.append(str);
                stringBuilder.append(" )");
                sQLiteDatabase.execSQL(stringBuilder.toString());
                i = 1;
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return i;
    }

    public synchronized LocalVersionInfo getLatestLocalVersion() {
        Throwable th;
        Cursor query;
        try {
            query = this.mDb.query("local_monitor_version", LOCAL_VERSION_COLS, null, null, null, null, "_id DESC", String.valueOf(1));
            try {
                if (query.getCount() == 0) {
                    safeCloseCursor(query);
                    return null;
                } else if (query.moveToNext()) {
                    LocalVersionInfo localVersionInfo = new LocalVersionInfo(query.getLong(0), query.getString(1), query.getString(2), query.getString(3), query.getString(4));
                    safeCloseCursor(query);
                    return localVersionInfo;
                } else {
                    safeCloseCursor(query);
                }
            } catch (Throwable th2) {
                th = th2;
                safeCloseCursor(query);
                throw th;
            }
        } catch (Throwable th3) {
            Throwable th4 = th3;
            query = null;
            th = th4;
            safeCloseCursor(query);
            throw th;
        }
    }

    public synchronized LocalVersionInfo getLocalVersionById(long j) {
        Throwable th;
        Cursor cursor = null;
        Cursor query;
        try {
            query = this.mDb.query("local_monitor_version", LOCAL_VERSION_COLS, " _id = ?", new String[]{String.valueOf(j)}, null, null, "_id DESC", String.valueOf(1));
            try {
                if (query.getCount() == 0) {
                    safeCloseCursor(query);
                    return null;
                } else if (query.moveToNext()) {
                    LocalVersionInfo localVersionInfo = new LocalVersionInfo(query.getLong(0), query.getString(1), query.getString(2), query.getString(3), query.getString(4));
                    safeCloseCursor(query);
                    return localVersionInfo;
                } else {
                    safeCloseCursor(query);
                }
            } catch (Throwable th2) {
                th = th2;
                cursor = query;
                safeCloseCursor(cursor);
                throw th;
            }
        } catch (Throwable th3) {
            th = th3;
            safeCloseCursor(cursor);
            throw th;
        }
    }

    public void updateConfig() {
        setMaxLogSaveCount(MonitorConfigure.getMaxMonitorLogSaveCount(this.mAid));
    }

    private void setMaxLogSaveCount(long j) {
        if (j <= 0) {
            sMaxLogSaveCount = 40000;
        } else {
            sMaxLogSaveCount = j;
        }
    }
}
