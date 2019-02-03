package com.bytedance.frameworks.core.monitor;

import android.content.Context;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.util.Log;

class DBHelper extends SQLiteOpenHelper {
    public static final String COL_CREATE_TIME = "create_time";
    public static final String COL_DATA = "data";
    public static final String COL_DATA2 = "data2";
    public static final String COL_DATA3 = "data3";
    static final String COL_ID = "_id";
    public static final String COL_MANIFEST_VERSION_CODE = "manifest_version_code";
    public static final String COL_SAMPLED = "is_sampled";
    public static final String COL_TYPE = "type";
    public static final String COL_TYPE2 = "type2";
    public static final String COL_UPDATE_VERSION_CODE = "update_version_code";
    public static final String COL_VERSION_CODE = "version_code";
    public static final String COL_VERSION_ID = "version_id";
    public static final String COL_VERSION_NAME = "version_name";
    static final String DB_NAME = "ss_local_monitor.db";
    static final int DB_VERSION = 1;
    private static final String SQL_CREATE_LOCAL_MONITOR_TABLE = "CREATE TABLE local_monitor_log ( _id Integer PRIMARY KEY AUTOINCREMENT, type VARCHAR, type2 VARCHAR, create_time Integer, version_id Integer, is_sampled Integer DEFAULT 0, data TEXT, data2 TEXT, data3 TEXT  )";
    private static final String SQL_CREATE_LOCAL_VERSION_TABLE = "CREATE TABLE local_monitor_version ( _id INTEGER PRIMARY KEY AUTOINCREMENT, version_code TEXT, version_name TEXT, manifest_version_code TEXT, update_version_code TEXT  )";
    private static final String TAG = "DBHelper";
    static final String T_LOCAL_LOG = "local_monitor_log";
    static final String T_LOCAL_VERSION = "local_monitor_version";
    static final String T_LOCAL_VIP_LOG = "local_monitor_vip_log";

    public DBHelper(Context context) {
        super(context, DB_NAME, null, 1);
    }

    public DBHelper(Context context, String str) {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(str);
        stringBuilder.append("_");
        stringBuilder.append(DB_NAME);
        super(context, stringBuilder.toString(), null, 1);
    }

    public void onCreate(SQLiteDatabase sQLiteDatabase) {
        try {
            sQLiteDatabase.execSQL(SQL_CREATE_LOCAL_MONITOR_TABLE);
            sQLiteDatabase.execSQL(SQL_CREATE_LOCAL_VERSION_TABLE);
        } catch (Exception e) {
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("monitorDB create failed:");
            stringBuilder.append(e);
            Log.e(str, stringBuilder.toString());
        }
    }

    public void onUpgrade(SQLiteDatabase sQLiteDatabase, int i, int i2) {
    }
}
