package com.arcsoft.avatar.b;

import android.content.ContentProvider;
import android.content.ContentUris;
import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.net.Uri;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.text.TextUtils;
import android.util.Log;
import com.arcsoft.avatar.d.g;

/* compiled from: AvatarContentProvider */
public class a extends ContentProvider {
    private static final String a = a.class.getSimpleName();
    private a dm;

    /* compiled from: AvatarContentProvider */
    public class a extends SQLiteOpenHelper {
        public a(Context context) {
            super(context, b.dp, null, 2);
        }

        public void onCreate(SQLiteDatabase sQLiteDatabase) {
            sQLiteDatabase.execSQL(b.du);
        }

        public void onUpgrade(SQLiteDatabase sQLiteDatabase, int i, int i2) {
            sQLiteDatabase.execSQL(b.dv);
            onCreate(sQLiteDatabase);
        }
    }

    protected String a(Uri uri, String str, String str2) {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("");
        stringBuilder.append(ContentUris.parseId(uri));
        String stringBuilder2 = stringBuilder.toString();
        stringBuilder = new StringBuilder();
        stringBuilder.append(str);
        stringBuilder.append(" = ");
        stringBuilder.append(stringBuilder2);
        stringBuilder2 = stringBuilder.toString();
        StringBuilder stringBuilder3 = new StringBuilder();
        stringBuilder3.append(stringBuilder2);
        if (TextUtils.isEmpty(str2)) {
            stringBuilder2 = "";
        } else {
            StringBuilder stringBuilder4 = new StringBuilder();
            stringBuilder4.append("and ( ");
            stringBuilder4.append(str2);
            stringBuilder4.append(" )");
            stringBuilder2 = stringBuilder4.toString();
        }
        stringBuilder3.append(stringBuilder2);
        stringBuilder2 = stringBuilder3.toString();
        StringBuilder stringBuilder5 = new StringBuilder();
        stringBuilder5.append("newSelection : ");
        stringBuilder5.append(stringBuilder2);
        g.d("DELETE", stringBuilder5.toString());
        return stringBuilder2;
    }

    /* JADX WARNING: Removed duplicated region for block: B:24:0x005f  */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public int delete(@NonNull Uri uri, @Nullable String str, @Nullable String[] strArr) {
        int i;
        Throwable th;
        synchronized (this.dm) {
            SQLiteDatabase writableDatabase;
            try {
                writableDatabase = this.dm.getWritableDatabase();
                try {
                    writableDatabase.beginTransaction();
                    if (b.dx.match(uri) != 1) {
                        i = -1;
                    } else {
                        String str2 = b.TABLE_NAME;
                        StringBuilder stringBuilder = new StringBuilder();
                        stringBuilder.append("_id = ");
                        stringBuilder.append(str);
                        i = writableDatabase.delete(str2, stringBuilder.toString(), strArr);
                    }
                    writableDatabase.setTransactionSuccessful();
                    if (writableDatabase.inTransaction()) {
                        writableDatabase.endTransaction();
                    }
                } catch (Throwable th2) {
                    th = th2;
                    if (writableDatabase.inTransaction()) {
                        writableDatabase.endTransaction();
                    }
                    throw th;
                }
            } catch (Throwable th3) {
                th = th3;
                writableDatabase = null;
                if (writableDatabase.inTransaction()) {
                }
                throw th;
            }
        }
        str = a;
        StringBuilder stringBuilder2 = new StringBuilder();
        stringBuilder2.append("DELETE count = ");
        stringBuilder2.append(i);
        g.d(str, stringBuilder2.toString());
        return i;
    }

    @Nullable
    public String getType(@NonNull Uri uri) {
        return null;
    }

    /* JADX WARNING: Removed duplicated region for block: B:24:0x0073 A:{Catch:{ all -> 0x0069 }} */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    @Nullable
    public Uri insert(@NonNull Uri uri, @Nullable ContentValues contentValues) {
        Uri uri2;
        Throwable th;
        synchronized (this.dm) {
            uri2 = null;
            SQLiteDatabase writableDatabase;
            try {
                writableDatabase = this.dm.getWritableDatabase();
                try {
                    writableDatabase.beginTransaction();
                    long j = -1;
                    if (b.dx.match(uri) == 1) {
                        j = writableDatabase.insert(b.TABLE_NAME, null, contentValues);
                    }
                    writableDatabase.setTransactionSuccessful();
                    StringBuilder stringBuilder;
                    if (j < 0) {
                        String str = a;
                        stringBuilder = new StringBuilder();
                        stringBuilder.append("insert err:rowId=");
                        stringBuilder.append(j);
                        Log.e(str, stringBuilder.toString());
                    } else {
                        stringBuilder = new StringBuilder();
                        stringBuilder.append(uri);
                        stringBuilder.append("/");
                        stringBuilder.append(String.valueOf(j));
                        uri2 = Uri.parse(stringBuilder.toString());
                    }
                    if (writableDatabase.inTransaction()) {
                        writableDatabase.endTransaction();
                    }
                } catch (Throwable th2) {
                    th = th2;
                    if (writableDatabase.inTransaction()) {
                        writableDatabase.endTransaction();
                    }
                    throw th;
                }
            } catch (Throwable th3) {
                th = th3;
                writableDatabase = null;
                if (writableDatabase.inTransaction()) {
                }
                throw th;
            }
        }
        return uri2;
    }

    public boolean onCreate() {
        this.dm = new a(getContext());
        return true;
    }

    @Nullable
    public Cursor query(@NonNull Uri uri, @Nullable String[] strArr, @Nullable String str, @Nullable String[] strArr2, @Nullable String str2) {
        Cursor cursor;
        Throwable th;
        Uri uri2 = uri;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("URI = ");
        stringBuilder.append(uri2);
        g.d("DELETE", stringBuilder.toString());
        synchronized (this.dm) {
            cursor = null;
            SQLiteDatabase readableDatabase;
            try {
                readableDatabase = this.dm.getReadableDatabase();
                try {
                    readableDatabase.beginTransaction();
                    StringBuilder stringBuilder2 = new StringBuilder();
                    stringBuilder2.append("URI = ");
                    stringBuilder2.append(uri2);
                    g.d("DELETE", stringBuilder2.toString());
                    if (b.dx.match(uri2) == 1) {
                        cursor = readableDatabase.query(b.TABLE_NAME, strArr, str, strArr2, null, null, str2);
                    }
                    readableDatabase.setTransactionSuccessful();
                    if (cursor == null) {
                        Log.e(a, "query err:retCursor==null");
                    } else {
                        cursor.setNotificationUri(getContext().getContentResolver(), uri2);
                    }
                    if (readableDatabase != null) {
                        if (readableDatabase.inTransaction()) {
                            readableDatabase.endTransaction();
                        }
                    }
                } catch (Throwable th2) {
                    th = th2;
                    if (readableDatabase != null && readableDatabase.inTransaction()) {
                        readableDatabase.endTransaction();
                    }
                    throw th;
                }
            } catch (Throwable th3) {
                th = th3;
                readableDatabase = null;
                readableDatabase.endTransaction();
                throw th;
            }
        }
        return cursor;
    }

    /* JADX WARNING: Removed duplicated region for block: B:22:0x0049 A:{Catch:{ all -> 0x003f }} */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public int update(@NonNull Uri uri, @Nullable ContentValues contentValues, @Nullable String str, @Nullable String[] strArr) {
        int i;
        Throwable th;
        synchronized (this.dm) {
            SQLiteDatabase writableDatabase;
            try {
                writableDatabase = this.dm.getWritableDatabase();
                try {
                    writableDatabase.beginTransaction();
                    if (b.dx.match(uri) != 1) {
                        i = -1;
                    } else {
                        String str2 = b.TABLE_NAME;
                        StringBuilder stringBuilder = new StringBuilder();
                        stringBuilder.append("_id = ");
                        stringBuilder.append(str);
                        i = writableDatabase.update(str2, contentValues, stringBuilder.toString(), strArr);
                    }
                    writableDatabase.setTransactionSuccessful();
                    if (writableDatabase.inTransaction()) {
                        writableDatabase.endTransaction();
                    }
                } catch (Throwable th2) {
                    th = th2;
                    if (writableDatabase.inTransaction()) {
                    }
                    throw th;
                }
            } catch (Throwable th3) {
                th = th3;
                writableDatabase = null;
                if (writableDatabase.inTransaction()) {
                    writableDatabase.endTransaction();
                }
                throw th;
            }
        }
        return i;
    }
}
